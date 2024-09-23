@implementation EFGetElapsedTimeSinceAbsoluteTime

uint64_t __EFGetElapsedTimeSinceAbsoluteTime_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo);
}

uint64_t __EFGetElapsedTimeSinceAbsoluteTime_block_invoke_0()
{
  return mach_timebase_info((mach_timebase_info_t)&EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo_0);
}

@end
