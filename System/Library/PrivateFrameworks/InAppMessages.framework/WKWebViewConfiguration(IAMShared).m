@implementation WKWebViewConfiguration(IAMShared)

+ (id)sharedMessagesConfiguration
{
  if (sharedMessagesConfiguration_onceToken != -1)
    dispatch_once(&sharedMessagesConfiguration_onceToken, &__block_literal_global);
  return (id)sharedMessagesConfiguration_sharedConfiguration;
}

@end
