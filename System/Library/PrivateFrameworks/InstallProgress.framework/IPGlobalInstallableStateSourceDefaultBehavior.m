@implementation IPGlobalInstallableStateSourceDefaultBehavior

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  return (id)sharedInstance_shared;
}

void __63__IPGlobalInstallableStateSourceDefaultBehavior_sharedInstance__block_invoke()
{
  IPXPCEventStateUpdateStream *v0;
  void *v1;
  void *v2;
  IPGlobalInstallableStateSourceDefaultBehavior *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  IPXPCEventStateUpdateStream *v8;

  v0 = [IPXPCEventStateUpdateStream alloc];
  defaultBehaviorQueue();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IPXPCEventStateUpdateStream initWithStreamName:queue:](v0, "initWithStreamName:queue:", CFSTR("com.apple.InstallProgress.events"), v1);

  -[IPXPCEventStateUpdateStream source](v8, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [IPGlobalInstallableStateSourceDefaultBehavior alloc];
  if (defaultConnectionProvider_onceToken != -1)
    dispatch_once(&defaultConnectionProvider_onceToken, &__block_literal_global_135);
  v4 = (void *)MEMORY[0x242665E14](defaultConnectionProvider_provider);
  defaultBehaviorQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IPGlobalInstallableStateSourceXPCBehavior initWithXPCConnectionProvider:stateStreamSource:queue:](v3, "initWithXPCConnectionProvider:stateStreamSource:queue:", v4, v2, v5);
  v7 = (void *)sharedInstance_shared;
  sharedInstance_shared = v6;

}

@end
