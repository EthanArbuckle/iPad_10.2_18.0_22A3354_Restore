@implementation AVGlobalOperationQueue

+ (id)defaultQueue
{
  if (defaultQueue_sSharedManagerOnce != -1)
    dispatch_once(&defaultQueue_sSharedManagerOnce, &__block_literal_global_29);
  return (id)defaultQueue_sDefaultQueue;
}

AVGlobalOperationQueue *__38__AVGlobalOperationQueue_defaultQueue__block_invoke()
{
  AVGlobalOperationQueue *result;

  result = objc_alloc_init(AVGlobalOperationQueue);
  defaultQueue_sDefaultQueue = (uint64_t)result;
  return result;
}

- (AVGlobalOperationQueue)init
{
  AVGlobalOperationQueue *v2;
  NSOperationQueue *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVGlobalOperationQueue;
  v2 = -[AVGlobalOperationQueue init](&v5, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v2->_operationQueue = v3;
    -[NSOperationQueue setName:](v3, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.avfoundation.globaloperationqueue.%p"), v2));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVGlobalOperationQueue;
  -[AVGlobalOperationQueue dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, unfinishedOperations=%@>"), NSStringFromClass(v4), self, -[AVGlobalOperationQueue unfinishedOperations](self, "unfinishedOperations"));
}

- (void)enqueueOperation:(id)a3
{
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", a3);
}

- (NSArray)unfinishedOperations
{
  return -[NSOperationQueue operations](self->_operationQueue, "operations");
}

@end
