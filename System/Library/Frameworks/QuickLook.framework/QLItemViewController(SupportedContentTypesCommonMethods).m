@implementation QLItemViewController(SupportedContentTypesCommonMethods)

+ (id)supportedAudiovisualContentTypes
{
  if (supportedAudiovisualContentTypes_onceToken != -1)
    dispatch_once(&supportedAudiovisualContentTypes_onceToken, &__block_literal_global_13);
  return (id)supportedAudiovisualContentTypes_supportedContentTypes;
}

@end
