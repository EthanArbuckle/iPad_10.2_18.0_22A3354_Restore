@implementation _DKApplicationMetadataKey

+ (id)shortVersionString
{
  return CFSTR("_DKApplicationMetadataKey-shortVersionString");
}

+ (id)launchReason
{
  return CFSTR("_DKApplicationMetadataKey-launchReason");
}

+ (id)exactBundleVersion
{
  return CFSTR("_DKApplicationMetadataKey-exactBundleVersion");
}

+ (id)processIdentifier
{
  return CFSTR("_DKApplicationMetadataKey-processIdentifier");
}

+ (id)backboardState
{
  return CFSTR("_DKApplicationMetadataKey-backboardState");
}

+ (id)extensionHostIdentifier
{
  return CFSTR("_DKApplicationMetadataKey-extensionHostIdentifier");
}

+ (id)extensionContainingBundleIdentifier
{
  return CFSTR("_DKApplicationMetadataKey-extensionContainingBundleIdentifier");
}

+ (id)isNativeArchitecture
{
  return CFSTR("_DKApplicationMetadataKey-isNativeArchitecture");
}

+ (id)dyldPlatform
{
  return CFSTR("_DKApplicationMetadataKey-dyldPlatform");
}

@end
