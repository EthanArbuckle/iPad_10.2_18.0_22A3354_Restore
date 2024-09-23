@implementation SGMachTimeToNanoseconds

uint64_t __SGMachTimeToNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&SGMachTimeToNanoseconds_machTimebaseInfo);
}

@end
