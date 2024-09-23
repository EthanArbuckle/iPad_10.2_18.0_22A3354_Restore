@implementation VNRequestAsyncTasksQueueCache

+ (id)sharedCache
{
  if (+[VNRequestAsyncTasksQueueCache sharedCache]::onceToken != -1)
    dispatch_once(&+[VNRequestAsyncTasksQueueCache sharedCache]::onceToken, &__block_literal_global_89);
  return (id)+[VNRequestAsyncTasksQueueCache sharedCache]::cache;
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  return CFSTR("com.apple.VN.requestAsyncTasksQueue");
}

+ (int64_t)maximumAllowedTasksInTheQueue
{
  return 8;
}

void __44__VNRequestAsyncTasksQueueCache_sharedCache__block_invoke()
{
  VNRequestAsyncTasksQueueCache *v0;
  void *v1;

  v0 = objc_alloc_init(VNRequestAsyncTasksQueueCache);
  v1 = (void *)+[VNRequestAsyncTasksQueueCache sharedCache]::cache;
  +[VNRequestAsyncTasksQueueCache sharedCache]::cache = (uint64_t)v0;

}

@end
