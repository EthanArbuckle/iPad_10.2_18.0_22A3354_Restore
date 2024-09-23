@implementation VNRequestPerformingPriorityGroup1AsyncTasksQueueCache

+ (id)sharedCache
{
  if (+[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache]::onceToken != -1)
    dispatch_once(&+[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache]::onceToken, &__block_literal_global_5585);
  return (id)+[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache]::cache;
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.VN.VNRequestPerformingPriorityGroup1AsyncTasksQueue.%@"), v3);

  return v4;
}

+ (int64_t)maximumAllowedTasksInTheQueue
{
  return 12;
}

void __68__VNRequestPerformingPriorityGroup1AsyncTasksQueueCache_sharedCache__block_invoke()
{
  VNRequestPerformingPriorityGroup1AsyncTasksQueueCache *v0;
  void *v1;

  v0 = objc_alloc_init(VNRequestPerformingPriorityGroup1AsyncTasksQueueCache);
  v1 = (void *)+[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache]::cache;
  +[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache]::cache = (uint64_t)v0;

}

@end
