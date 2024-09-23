@implementation MULRUCache

- (MULRUCache)initWithMaxSize:(unint64_t)a3
{
  MULRUCache *v4;
  MULRUCache *v5;
  uint64_t v6;
  NSMutableArray *keys;
  uint64_t v8;
  NSMutableArray *values;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MULRUCache;
  v4 = -[MULRUCache init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maxSize = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    keys = v5->_keys;
    v5->_keys = (NSMutableArray *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    values = v5->_values;
    v5->_values = (NSMutableArray *)v8;

  }
  return v5;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_values, "count");
}

- (id)objectForKey:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_keys, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || (v7 = v5, v5 >= -[NSMutableArray count](self->_values, "count")))
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_values, "removeObjectAtIndex:", v7);
    -[NSMutableArray removeObjectAtIndex:](self->_keys, "removeObjectAtIndex:", v7);
    -[NSMutableArray insertObject:atIndex:](self->_values, "insertObject:atIndex:", v6, 0);
    -[NSMutableArray insertObject:atIndex:](self->_keys, "insertObject:atIndex:", v4, 0);
  }

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    -[MULRUCache objectForKey:](self, "objectForKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      -[NSMutableArray removeObjectAtIndex:](self->_keys, "removeObjectAtIndex:", 0);
      -[NSMutableArray removeObjectAtIndex:](self->_values, "removeObjectAtIndex:", 0);
      v4 = v5;
    }

  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray *values;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v12 && v6)
  {
    -[MULRUCache objectForKey:](self, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    values = self->_values;
    if (v7)
    {
      -[NSMutableArray removeObjectAtIndex:](values, "removeObjectAtIndex:", 0);
    }
    else
    {
      while (-[NSMutableArray count](values, "count") >= self->_maxSize)
      {
        -[MULRUCache delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray lastObject](self->_values, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray lastObject](self->_keys, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lruCache:willEvictObject:forKey:", self, v10, v11);

        -[NSMutableArray removeLastObject](self->_keys, "removeLastObject");
        -[NSMutableArray removeLastObject](self->_values, "removeLastObject");
        values = self->_values;
      }
      -[NSMutableArray insertObject:atIndex:](self->_keys, "insertObject:atIndex:", v6, 0);
    }
    -[NSMutableArray insertObject:atIndex:](self->_values, "insertObject:atIndex:", v12, 0);

  }
}

- (NSArray)orderedKeys
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_keys, "copy");
}

- (NSArray)orderedValues
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_values, "copy");
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (MULRUCacheDelegate)delegate
{
  return (MULRUCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
