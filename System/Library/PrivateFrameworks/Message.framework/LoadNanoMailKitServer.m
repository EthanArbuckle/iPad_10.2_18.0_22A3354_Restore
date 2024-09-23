@implementation LoadNanoMailKitServer

void __LoadNanoMailKitServer_block_invoke()
{
  LoadNanoMailKitServer_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer", 2);
  if (!LoadNanoMailKitServer_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer"));
}

@end
