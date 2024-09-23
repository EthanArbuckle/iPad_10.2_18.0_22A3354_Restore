@implementation IPCircularBufferArray

- (IPCircularBufferArray)initWithCapacity:(unint64_t)a3
{
  IPCircularBufferArray *v4;
  IPCircularBufferArray *v5;
  uint64_t v6;
  NSMutableArray *backingStore;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IPCircularBufferArray;
  v4 = -[IPCircularBufferArray init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
    backingStore = v5->_backingStore;
    v5->_backingStore = (NSMutableArray *)v6;

    v5->_currentIndex = 0;
  }
  return v5;
}

- (void)addObject:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id lastObject;
  void (**v9)(id, void *);

  v6 = a3;
  v9 = (void (**)(id, void *))a4;
  if (-[NSMutableArray count](self->_backingStore, "count") >= self->_capacity)
  {
    if (v9)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_backingStore, "objectAtIndexedSubscript:", self->_currentIndex);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    -[NSMutableArray setObject:atIndexedSubscript:](self->_backingStore, "setObject:atIndexedSubscript:", v6, self->_currentIndex);
    self->_currentIndex = (self->_currentIndex + 1) % self->_capacity;
    if (v9)
      v9[2](v9, v7);

  }
  else
  {
    -[NSMutableArray addObject:](self->_backingStore, "addObject:", v6);
    if (v9)
      v9[2](v9, 0);
  }
  lastObject = self->_lastObject;
  ++self->_mutationDetector;
  self->_lastObject = v6;

}

- (id)lastObject
{
  return (id)objc_msgSend(self->_lastObject, "copy");
}

- (NSArray)allObjects
{
  NSMutableArray *backingStore;
  NSMutableArray *v4;
  NSMutableArray **p_backingStore;
  void *v6;
  void *v7;
  void *v8;

  p_backingStore = &self->_backingStore;
  backingStore = self->_backingStore;
  v4 = p_backingStore[1];
  if (v4)
  {
    -[NSMutableArray subarrayWithRange:](backingStore, "subarrayWithRange:", v4, self->_capacity - (_QWORD)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray subarrayWithRange:](self->_backingStore, "subarrayWithRange:", 0, self->_currentIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)-[NSMutableArray copy](backingStore, "copy");
  }
  return (NSArray *)v8;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v5;
  unint64_t var0;
  uint64_t i;

  v5 = a5;
  var0 = a3->var0;
  if (!a3->var0)
    a3->var2 = &self->_mutationDetector;
  if (var0 + a5 > -[NSMutableArray count](self->_backingStore, "count"))
    v5 = -[NSMutableArray count](self->_backingStore, "count") - a3->var0;
  a3->var1 = a4;
  if (v5)
  {
    for (i = 0; i != v5; ++i)
      a4[i] = (id)-[NSMutableArray objectAtIndexedSubscript:](self->_backingStore, "objectAtIndexedSubscript:", (i + self->_currentIndex + a3->var0) % self->_capacity);
  }
  a3->var0 += v5;
  return v5;
}

- (void)removeAllObjects
{
  -[NSMutableArray removeAllObjects](self->_backingStore, "removeAllObjects");
  self->_currentIndex = 0;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_backingStore, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastObject, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

@end
