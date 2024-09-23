@implementation LoadPowerLog

void __LoadPowerLog_block_invoke()
{
  LoadPowerLog_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog", 2);
  if (!LoadPowerLog_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/PowerLog.framework/PowerLog"));
}

@end
