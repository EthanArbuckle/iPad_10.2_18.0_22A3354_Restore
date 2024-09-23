@implementation AFTruncateMachTimeToTenthOfASecond

uint64_t __AFTruncateMachTimeToTenthOfASecond_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&AFTruncateMachTimeToTenthOfASecond_machTimebaseInfo);
}

@end
