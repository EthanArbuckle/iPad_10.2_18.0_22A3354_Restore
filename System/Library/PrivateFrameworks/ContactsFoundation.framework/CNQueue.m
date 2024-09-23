@implementation CNQueue

- (void)enqueue:(id)a3
{
  -[CNQueueingStrategy enqueueObject:buffer:](self->_strategy, "enqueueObject:buffer:", a3, self->_buffer);
}

- (id)dequeue
{
  void *v3;

  if (-[NSMutableArray count](self->_buffer, "count"))
  {
    -[NSMutableArray firstObject](self->_buffer, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_buffer, "removeObjectAtIndex:", 0);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_buffer, "count");
}

- (void)dequeueObject:(id)a3
{
  -[NSMutableArray removeObject:](self->_buffer, "removeObject:", a3);
}

- (id)peek
{
  return (id)-[NSMutableArray firstObject](self->_buffer, "firstObject");
}

- (CNQueue)init
{
  _CNDefaultQueueingStrategy *v3;
  CNQueue *v4;

  v3 = objc_alloc_init(_CNDefaultQueueingStrategy);
  v4 = -[CNQueue initWithStrategy:](self, "initWithStrategy:", v3);

  return v4;
}

- (CNQueue)initWithStrategy:(id)a3
{
  id v5;
  CNQueue *v6;
  NSMutableArray *v7;
  NSMutableArray *buffer;
  CNQueue *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNQueue;
  v6 = -[CNQueue init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    buffer = v6->_buffer;
    v6->_buffer = v7;

    objc_storeStrong((id *)&v6->_strategy, a3);
    v9 = v6;
  }

  return v6;
}

- (NSArray)allObjects
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_buffer, "copy");
}

- (id)drain
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", self->_buffer);
  -[NSMutableArray removeAllObjects](self->_buffer, "removeAllObjects");
  return v3;
}

+ (id)boundedQueueWithCapacity:(unint64_t)a3 overflowHandler:(id)a4
{
  id v6;
  _CNBoundedQueueingStrategy *v7;
  void *v8;

  v6 = a4;
  v7 = -[_CNBoundedQueueingStrategy initWithCapacity:overflowHandler:]([_CNBoundedQueueingStrategy alloc], "initWithCapacity:overflowHandler:", a3, v6);

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStrategy:", v7);
  return v8;
}

+ (id)boundedQueueWithCapacity:(unint64_t)a3
{
  _CNBoundedQueueingStrategy *v4;
  void *v5;

  v4 = -[_CNBoundedQueueingStrategy initWithCapacity:]([_CNBoundedQueueingStrategy alloc], "initWithCapacity:", a3);
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStrategy:", v4);

  return v5;
}

+ (id)priorityQueueWithComparator:(id)a3
{
  id v4;
  _CNPriorityQueueingStrategy *v5;
  void *v6;

  v4 = a3;
  v5 = -[_CNPriorityQueueingStrategy initWithComparator:]([_CNPriorityQueueingStrategy alloc], "initWithComparator:", v4);

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStrategy:", v5);
  return v6;
}

- (void)enqueueObjectsFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CNQueue enqueue:](self, "enqueue:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (CNQueueingStrategy)strategy
{
  return self->_strategy;
}

@end
