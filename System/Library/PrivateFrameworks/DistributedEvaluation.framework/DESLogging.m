@implementation DESLogging

+ (id)coreChannel
{
  if (DESLoggingGetCoreChannel_onceToken != -1)
    dispatch_once(&DESLoggingGetCoreChannel_onceToken, &__block_literal_global_6);
  return (id)DESLoggingGetCoreChannel_coreChannel;
}

@end
