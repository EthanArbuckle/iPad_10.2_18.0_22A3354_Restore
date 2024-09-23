@implementation FODMGTimeInMilliseconds

uint64_t __FODMGTimeInMilliseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&FODMGTimeInMilliseconds_info);
}

@end
