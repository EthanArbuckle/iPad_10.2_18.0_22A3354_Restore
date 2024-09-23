@implementation CSNanosecondsSinceAbsoluteTime

uint64_t __CSNanosecondsSinceAbsoluteTime_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&CSNanosecondsSinceAbsoluteTime_sTimebaseInfo);
}

@end
