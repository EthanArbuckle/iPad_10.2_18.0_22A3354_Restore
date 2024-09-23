@implementation CalDefaultMigrationAnalyticsSender

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

void __52__CalDefaultMigrationAnalyticsSender_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (void)sendEvent:(id)a3 withPayload:(id)a4
{
  CalAnalyticsSendEvent();
}

@end
