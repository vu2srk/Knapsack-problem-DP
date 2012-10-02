def knapsack c, items
  value_matrix = zeros(items.length+1, c)
  take_matrix = zeros(items.length+1, c)  
 
  for i in 0..items.length
    if i==0
      next
    end
    for j in 1..c
      array_j = j - 1
      if (j > items[i-1].weight)
        value_matrix[i][array_j] = [value_matrix[i-1][array_j], (items[i-1].value + value_matrix[i-1][(j - items[i-1].weight)-1])].max
        if ((items[i-1].value + value_matrix[i-1][(j - items[i-1].weight)-1]) > value_matrix[i-1][array_j])
          take_matrix[i][array_j] = 1
        end
      elsif (j == items[i-1].weight)
        value_matrix[i][array_j] = items[i-1].value
        take_matrix[i][array_j] = 1
      else
        value_matrix[i][array_j] = value_matrix[i-1][array_j]
      end
    end
  end

  w = c
  i = items.length

  while w>=0 and i<=items.length and i>0 
    if (take_matrix[i][w-1]==1)
      p "Take item " + (i).to_s + " which is a " + items[i-1].item
      w = w - items[i-1].weight
      i = i - 1
    else
      i = i - 1 
    end
  end
end

def zeros rows, cols
  Array.new(rows) do |row|
   Array.new(cols, 0)
  end
end

KnapsackItem = Struct.new(:item, :weight, :value)

#items = [KnapsackItem.new("apple", 3, 5), KnapsackItem.new("banana", 2, 3), KnapsackItem.new("orange", 1, 4)]

items = [KnapsackItem.new('map'                    , 9   , 150) , KnapsackItem.new('compass'             , 13  , 35)  , 
      KnapsackItem.new('water'                  , 153 , 200) , KnapsackItem.new('sandwich'            , 50  , 160) , 
      KnapsackItem.new('glucose'                , 15  , 60)  , KnapsackItem.new('tin'                 , 68  , 45)  , 
      KnapsackItem.new('banana'                 , 27  , 60)  , KnapsackItem.new('apple'               , 39  , 40)  , 
      KnapsackItem.new('cheese'                 , 23  , 30)  , KnapsackItem.new('beer'                , 52  , 10)  , 
      KnapsackItem.new('suntan cream'           , 11  , 70)  , KnapsackItem.new('camera'              , 32  , 30)  , 
      KnapsackItem.new('t-shirt'                , 24  , 15)  , KnapsackItem.new('trousers'            , 48  , 10)  , 
      KnapsackItem.new('umbrella'               , 73  , 40)  , KnapsackItem.new('waterproof trousers' , 42  , 70)  , 
      KnapsackItem.new('waterproof overclothes' , 43  , 75)  , KnapsackItem.new('note-case'           , 22  , 80)  , 
      KnapsackItem.new('sunglasses'             , 7   , 20)  , KnapsackItem.new('towel'               , 18  , 12)  , 
      KnapsackItem.new('socks'                  , 4   , 50)  , KnapsackItem.new('book'                , 30  , 10)]

knapsack 400, items
