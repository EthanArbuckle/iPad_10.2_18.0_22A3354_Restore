@implementation AXLogInitialize

void ___AXLogInitialize_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  AXDispatchTimer *v6;
  uint64_t v7;
  void *v8;

  v0 = dispatch_queue_create("_AXLogThresholdQueue", 0);
  v1 = (void *)_AXLogThresholdQueue;
  _AXLogThresholdQueue = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)_AXLogThresholdMap;
  _AXLogThresholdMap = (uint64_t)v2;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)_OSLogCache;
  _OSLogCache = (uint64_t)v4;

  v6 = [AXDispatchTimer alloc];
  v7 = -[AXDispatchTimer initWithTargetSerialQueue:](v6, "initWithTargetSerialQueue:", _AXLogThresholdQueue);
  v8 = (void *)_AXLogThresholdCleanupTimer;
  _AXLogThresholdCleanupTimer = v7;

}

@end
