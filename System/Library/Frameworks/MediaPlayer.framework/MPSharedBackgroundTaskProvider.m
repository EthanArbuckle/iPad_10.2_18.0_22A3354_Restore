@implementation MPSharedBackgroundTaskProvider

void __MPSharedBackgroundTaskProvider_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0E0]), "initWithInvalidationDuration:", 30.0);
  v1 = (void *)MPSharedBackgroundTaskProvider_sharedProvider;
  MPSharedBackgroundTaskProvider_sharedProvider = v0;

  if (!MPSharedBackgroundTaskProvider_sharedProvider)
  {
    MPUIApplication();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)MPSharedBackgroundTaskProvider_sharedProvider;
    MPSharedBackgroundTaskProvider_sharedProvider = v2;

    if (!MPSharedBackgroundTaskProvider_sharedProvider)
    {
      objc_msgSend(MEMORY[0x1E0D4D038], "sharedProvider");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)MPSharedBackgroundTaskProvider_sharedProvider;
      MPSharedBackgroundTaskProvider_sharedProvider = v4;

    }
  }
}

@end
