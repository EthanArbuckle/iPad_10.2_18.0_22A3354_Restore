@implementation LoadFindMyDevice

void __LoadFindMyDevice_block_invoke()
{
  LoadFindMyDevice_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FindMyDevice.framework/FindMyDevice", 2);
  if (!LoadFindMyDevice_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/FindMyDevice.framework/FindMyDevice"));
}

@end
