@implementation VNDetectorAsyncTasksQueueCache

+ (id)sharedCache
{
  if (+[VNDetectorAsyncTasksQueueCache sharedCache]::onceToken != -1)
    dispatch_once(&+[VNDetectorAsyncTasksQueueCache sharedCache]::onceToken, &__block_literal_global_94);
  return (id)+[VNDetectorAsyncTasksQueueCache sharedCache]::cache;
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.VN.detectorAsyncTasksQueue.%@"), v3);

  return v4;
}

+ (int64_t)maximumAllowedTasksInTheQueue
{
  return 12;
}

void __45__VNDetectorAsyncTasksQueueCache_sharedCache__block_invoke()
{
  VNDetectorAsyncTasksQueueCache *v0;
  void *v1;

  v0 = objc_alloc_init(VNDetectorAsyncTasksQueueCache);
  v1 = (void *)+[VNDetectorAsyncTasksQueueCache sharedCache]::cache;
  +[VNDetectorAsyncTasksQueueCache sharedCache]::cache = (uint64_t)v0;

}

@end
