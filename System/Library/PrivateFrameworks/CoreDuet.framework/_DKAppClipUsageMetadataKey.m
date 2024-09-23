@implementation _DKAppClipUsageMetadataKey

+ (id)appBundleID
{
  return CFSTR("_DKAppClipUsageMetadataKey-appBundleID");
}

+ (id)timeSinceDownload
{
  return CFSTR("_DKAppClipUsageMetadataKey-timeSinceDownload");
}

+ (id)URLHash
{
  return CFSTR("_DKAppClipUsageMetadataKey-URLHash");
}

+ (id)clipBundleID
{
  return CFSTR("_DKAppClipUsageMetadataKey-clipBundleID");
}

+ (id)webAppBundleID
{
  return CFSTR("_DKAppClipUsageMetadataKey-webAppBundleID");
}

+ (id)launchReason
{
  return CFSTR("_DKAppClipUsageMetadataKey-launchReason");
}

+ (id)fullURL
{
  return CFSTR("_DKAppClipUsageMetadataKey-fullURL");
}

+ (id)referrerURL
{
  return CFSTR("_DKAppClipUsageMetadataKey-referrerURL");
}

+ (id)referrerBundleID
{
  return CFSTR("_DKAppClipUsageMetadataKey-referrerBundleID");
}

@end
