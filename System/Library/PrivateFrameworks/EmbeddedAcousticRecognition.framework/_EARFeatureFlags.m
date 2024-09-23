@implementation _EARFeatureFlags

+ (BOOL)isEmojiV2Enabled
{
  return _os_feature_enabled_impl();
}

@end
