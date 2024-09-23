@implementation VNDetectorSyncTasksQueueCache

+ (int64_t)maximumAllowedTasksInTheQueue
{
  return 12;
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.VN.detectorSyncTasksQueue.%@"), v3);

  return v4;
}

+ (id)sharedCache
{
  if (+[VNDetectorSyncTasksQueueCache sharedCache]::onceToken != -1)
    dispatch_once(&+[VNDetectorSyncTasksQueueCache sharedCache]::onceToken, &__block_literal_global_99);
  return (id)+[VNDetectorSyncTasksQueueCache sharedCache]::cache;
}

void __44__VNDetectorSyncTasksQueueCache_sharedCache__block_invoke()
{
  VNDetectorSyncTasksQueueCache *v0;
  void *v1;

  v0 = objc_alloc_init(VNDetectorSyncTasksQueueCache);
  v1 = (void *)+[VNDetectorSyncTasksQueueCache sharedCache]::cache;
  +[VNDetectorSyncTasksQueueCache sharedCache]::cache = (uint64_t)v0;

}

@end
