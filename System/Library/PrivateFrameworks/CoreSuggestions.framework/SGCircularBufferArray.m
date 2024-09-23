@implementation SGCircularBufferArray

- (SGCircularBufferArray)initWithCapacity:(unint64_t)a3
{
  SGCircularBufferArray *v4;
  SGCircularBufferArray *v5;
  uint64_t v6;
  NSMutableArray *backingStore;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SGCircularBufferArray;
  v4 = -[SGCircularBufferArray init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    backingStore = v5->_backingStore;
    v5->_backingStore = (NSMutableArray *)v6;

    v5->_currentIndex = 0;
  }
  return v5;
}

- (void)addObject:(id)a3
{
  NSMutableArray *backingStore;
  id v5;
  unint64_t v6;
  NSMutableArray *v7;

  backingStore = self->_backingStore;
  v5 = a3;
  v6 = -[NSMutableArray count](backingStore, "count");
  v7 = self->_backingStore;
  if (v6 >= self->_capacity)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](v7, "setObject:atIndexedSubscript:", v5, self->_currentIndex);

    self->_currentIndex = (self->_currentIndex + 1) % self->_capacity;
  }
  else
  {
    -[NSMutableArray addObject:](v7, "addObject:", v5);

  }
  ++self->_mutationDetector;
}

- (id)allObjects
{
  NSMutableArray *backingStore;
  NSMutableArray *v4;
  NSMutableArray **p_backingStore;
  void *v6;
  void *v7;
  NSMutableArray *v8;

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
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = backingStore;
  }
  return v8;
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

- (unint64_t)count
{
  return -[NSMutableArray count](self->_backingStore, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
}

@end
