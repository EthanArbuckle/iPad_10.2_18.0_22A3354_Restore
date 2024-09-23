@implementation EFQueue

- (void)dequeueObject:(id)a3
{
  -[EFQueueingStrategy dequeueObject:buffer:](self->_strategy, "dequeueObject:buffer:", a3, self->_buffer);
}

- (void)enqueue:(id)a3 replaceIfExists:(BOOL)a4
{
  -[EFQueueingStrategy enqueueObject:replaceIfExists:buffer:](self->_strategy, "enqueueObject:replaceIfExists:buffer:", a3, a4, self->_buffer);
}

- (void)enqueue:(id)a3
{
  -[EFQueue enqueue:replaceIfExists:](self, "enqueue:replaceIfExists:", a3, 0);
}

- (id)drain
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_buffer);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeAllObjects](self->_buffer, "removeAllObjects");
  return v3;
}

+ (id)boundedQueueWithCapacity:(unint64_t)a3
{
  _EFBoundedQueueStrategy *v3;
  EFQueue *v4;

  v3 = -[_EFBoundedQueueStrategy initWithCapacity:overflowHandler:]([_EFBoundedQueueStrategy alloc], "initWithCapacity:overflowHandler:", a3, 0);
  v4 = -[EFQueue initWithStrategy:]([EFQueue alloc], "initWithStrategy:", v3);

  return v4;
}

+ (id)boundedQueueWithCapacity:(unint64_t)a3 overflowHandler:(id)a4
{
  id v5;
  _EFBoundedQueueStrategy *v6;
  EFQueue *v7;

  v5 = a4;
  v6 = -[_EFBoundedQueueStrategy initWithCapacity:overflowHandler:]([_EFBoundedQueueStrategy alloc], "initWithCapacity:overflowHandler:", a3, v5);
  v7 = -[EFQueue initWithStrategy:]([EFQueue alloc], "initWithStrategy:", v6);

  return v7;
}

+ (id)priorityQueueWithComparator:(id)a3
{
  id v3;
  _EFPriorityQueueStrategy *v4;
  EFQueue *v5;

  v3 = a3;
  v4 = -[_EFPriorityQueueStrategy initWithComparator:]([_EFPriorityQueueStrategy alloc], "initWithComparator:", v3);
  v5 = -[EFQueue initWithStrategy:]([EFQueue alloc], "initWithStrategy:", v4);

  return v5;
}

- (EFQueue)initWithStrategy:(id)a3
{
  id v5;
  EFQueue *v6;
  NSMutableArray *v7;
  NSMutableArray *buffer;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EFQueue;
  v6 = -[EFQueue init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    buffer = v6->_buffer;
    v6->_buffer = v7;

    objc_storeStrong((id *)&v6->_strategy, a3);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

- (id)peek
{
  return (id)-[NSMutableArray firstObject](self->_buffer, "firstObject");
}

- (id)dequeue
{
  void *v3;

  -[EFQueue peek](self, "peek");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[NSMutableArray removeObjectAtIndex:](self->_buffer, "removeObjectAtIndex:", 0);
  return v3;
}

+ (id)bufferedQueueWithCapacity:(unint64_t)a3 batchHandler:(id)a4
{
  id v5;
  _EFBufferedQueueStrategy *v6;
  EFQueue *v7;

  v5 = a4;
  v6 = -[_EFBufferedQueueStrategy initWithCapacity:batchHandler:]([_EFBufferedQueueStrategy alloc], "initWithCapacity:batchHandler:", a3, v5);
  v7 = -[EFQueue initWithStrategy:]([EFQueue alloc], "initWithStrategy:", v6);

  return v7;
}

- (EFQueue)init
{
  _EFDefaultQueueingStrategy *v3;
  EFQueue *v4;

  v3 = objc_alloc_init(_EFDefaultQueueingStrategy);
  v4 = -[EFQueue initWithStrategy:](self, "initWithStrategy:", v3);

  return v4;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[EFQueue description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray componentsJoinedByString:](self->_buffer, "componentsJoinedByString:", CFSTR(",\n\t"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" {\n\t%@\n}"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EFQueueingStrategy descriptionType](self->_strategy, "descriptionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (%@) %lld items"), v4, self, v5, -[NSMutableArray count](self->_buffer, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_buffer, "count");
}

- (NSArray)allObjects
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_buffer);
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (EFQueueingStrategy)strategy
{
  return self->_strategy;
}

@end
