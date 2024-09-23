@implementation FMQueue

+ (id)priorityQueueWithComparator:(id)a3
{
  id v4;
  _FMPriorityQueueingStrategy *v5;
  void *v6;

  v4 = a3;
  v5 = -[_FMPriorityQueueingStrategy initWithComparator:]([_FMPriorityQueueingStrategy alloc], "initWithComparator:", v4);

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStrategy:", v5);
  return v6;
}

+ (id)boundedQueueWithCapacity:(unint64_t)a3
{
  _FMBoundedQueueingStrategy *v4;
  void *v5;

  v4 = -[_FMBoundedQueueingStrategy initWithCapacity:]([_FMBoundedQueueingStrategy alloc], "initWithCapacity:", a3);
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStrategy:", v4);

  return v5;
}

+ (id)boundedQueueWithCapacity:(unint64_t)a3 overflowHandler:(id)a4
{
  id v6;
  _FMBoundedQueueingStrategy *v7;
  void *v8;

  v6 = a4;
  v7 = -[_FMBoundedQueueingStrategy initWithCapacity:overflowHandler:]([_FMBoundedQueueingStrategy alloc], "initWithCapacity:overflowHandler:", a3, v6);

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStrategy:", v7);
  return v8;
}

- (FMQueue)init
{
  _FMDefaultQueueingStrategy *v3;
  FMQueue *v4;

  v3 = objc_alloc_init(_FMDefaultQueueingStrategy);
  v4 = -[FMQueue initWithStrategy:](self, "initWithStrategy:", v3);

  return v4;
}

- (FMQueue)initWithStrategy:(id)a3
{
  id v5;
  FMQueue *v6;
  NSMutableArray *v7;
  NSMutableArray *buffer;
  FMQueue *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMQueue;
  v6 = -[FMQueue init](&v11, sel_init);
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

- (unint64_t)count
{
  return -[NSMutableArray count](self->_buffer, "count");
}

- (NSArray)allObjects
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_buffer, "copy");
}

- (void)enqueue:(id)a3
{
  -[FMQueueingStrategy enqueueObject:buffer:](self->_strategy, "enqueueObject:buffer:", a3, self->_buffer);
}

- (id)peek
{
  return (id)-[NSMutableArray firstObject](self->_buffer, "firstObject");
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

- (void)dequeueObject:(id)a3
{
  -[NSMutableArray removeObject:](self->_buffer, "removeObject:", a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
