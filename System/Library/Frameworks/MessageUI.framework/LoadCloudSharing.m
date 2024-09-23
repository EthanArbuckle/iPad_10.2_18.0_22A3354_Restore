@implementation LoadCloudSharing

void __LoadCloudSharing_block_invoke()
{
  LoadCloudSharing_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CloudSharing.framework/CloudSharing", 2);
  if (!LoadCloudSharing_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/CloudSharing.framework/CloudSharing"));
}

@end
