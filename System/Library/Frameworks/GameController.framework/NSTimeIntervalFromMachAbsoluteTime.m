@implementation NSTimeIntervalFromMachAbsoluteTime

uint64_t __NSTimeIntervalFromMachAbsoluteTime_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&NSTimeIntervalFromMachAbsoluteTime_sTimebaseInfo);
}

@end
