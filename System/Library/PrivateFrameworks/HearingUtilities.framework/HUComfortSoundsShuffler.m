@implementation HUComfortSoundsShuffler

+ (HUComfortSoundsShuffler)shufflerWithArray:(id)a3
{
  id v3;
  HUComfortSoundsShuffler *v4;

  v3 = a3;
  v4 = -[HUComfortSoundsShuffler initWithArray:]([HUComfortSoundsShuffler alloc], "initWithArray:", v3);

  return v4;
}

- (HUComfortSoundsShuffler)initWithArray:(id)a3
{
  id v4;
  HUComfortSoundsShuffler *v5;
  uint64_t v6;
  NSMutableArray *array;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUComfortSoundsShuffler;
  v5 = -[HUComfortSoundsShuffler init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    array = v5->_array;
    v5->_array = (NSMutableArray *)v6;

    -[HUComfortSoundsShuffler shuffle](v5, "shuffle");
    v5->_index = 0;
  }

  return v5;
}

- (id)nextObject
{
  HUComfortSoundsShuffler *v2;
  NSMutableArray *array;
  unint64_t v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  array = v2->_array;
  v4 = v2->_index + 1;
  v2->_index = v4;
  if (v4 >= -[NSMutableArray count](array, "count"))
  {
    -[HUComfortSoundsShuffler shuffle](v2, "shuffle");
    v2->_index = 0;
  }
  if (-[NSMutableArray count](v2->_array, "count") <= v2->_index)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](v2->_array, "objectAtIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)shuffle
{
  int v3;
  unint64_t v4;
  id v5;
  void *v6;
  id v7;

  if ((unint64_t)-[NSMutableArray count](self->_array, "count") >= 2)
  {
    -[NSMutableArray lastObject](self->_array, "lastObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableArray count](self->_array, "count") != 1)
    {
      v3 = 0;
      v4 = 0;
      do
      {
        -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->_array, "exchangeObjectAtIndex:withObjectAtIndex:", v4, v4 + arc4random_uniform(v3 + -[NSMutableArray count](self->_array, "count")));
        ++v4;
        --v3;
      }
      while (v4 < -[NSMutableArray count](self->_array, "count") - 1);
    }
    -[NSMutableArray firstObject](self->_array, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v7;
    if (v5 == v7)
    {
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->_array, "exchangeObjectAtIndex:withObjectAtIndex:", 0, -[NSMutableArray count](self->_array, "count") - 1);
      v6 = v7;
    }

  }
}

- (id)description
{
  return (id)-[NSMutableArray description](self->_array, "description");
}

- (id)debugDescription
{
  return (id)-[NSMutableArray debugDescription](self->_array, "debugDescription");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
