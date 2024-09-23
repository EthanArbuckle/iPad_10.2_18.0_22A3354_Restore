@implementation AMSLogConfig(AppStoreKitInternal)

+ (id)ask_generalLogConfig
{
  if (ask_generalLogConfig_onceToken != -1)
    dispatch_once(&ask_generalLogConfig_onceToken, &__block_literal_global_2);
  return (id)ask_generalLogConfig_logConfig;
}

@end
