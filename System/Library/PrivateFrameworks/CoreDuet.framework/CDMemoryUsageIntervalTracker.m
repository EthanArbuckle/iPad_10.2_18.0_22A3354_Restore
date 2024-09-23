@implementation CDMemoryUsageIntervalTracker

void __47___CDMemoryUsageIntervalTracker_sharedInstance__block_invoke()
{
  void *v0;
  _CDMemoryUsageIntervalTracker *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqual:", CFSTR("coreduetd")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("knowledge-agent")) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", CFSTR("contextstored")) & 1) != 0
    || objc_msgSend(v3, "isEqual:", CFSTR("ContextStoreAgent")))
  {
    v1 = objc_alloc_init(_CDMemoryUsageIntervalTracker);
    v2 = (void *)sharedInstance_instance;
    sharedInstance_instance = (uint64_t)v1;

  }
}

@end
