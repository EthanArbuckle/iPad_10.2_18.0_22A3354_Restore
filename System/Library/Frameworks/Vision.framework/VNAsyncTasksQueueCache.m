@implementation VNAsyncTasksQueueCache

- (id)queueWithUniqueAppendix:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v5 = objc_opt_class();
  v8.receiver = self;
  v8.super_class = (Class)VNAsyncTasksQueueCache;
  -[VNTasksQueueCache _queueWithUniqueAppendix:queueClass:](&v8, sel__queueWithUniqueAppendix_queueClass_, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
