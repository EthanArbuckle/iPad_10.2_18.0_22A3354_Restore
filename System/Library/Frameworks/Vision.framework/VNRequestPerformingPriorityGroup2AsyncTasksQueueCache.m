@implementation VNRequestPerformingPriorityGroup2AsyncTasksQueueCache

+ (id)sharedCache
{
  if (+[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache]::onceToken != -1)
    dispatch_once(&+[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache]::onceToken, &__block_literal_global_84);
  return (id)+[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache]::cache;
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.VN.VNRequestPerformingPriorityGroup2AsyncTasksQueue.%@"), v3);

  return v4;
}

+ (int64_t)maximumAllowedTasksInTheQueue
{
  return 8;
}

void __68__VNRequestPerformingPriorityGroup2AsyncTasksQueueCache_sharedCache__block_invoke()
{
  VNRequestPerformingPriorityGroup2AsyncTasksQueueCache *v0;
  void *v1;

  v0 = objc_alloc_init(VNRequestPerformingPriorityGroup2AsyncTasksQueueCache);
  v1 = (void *)+[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache]::cache;
  +[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache]::cache = (uint64_t)v0;

}

@end
