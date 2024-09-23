@implementation APSGetCPULoadAverage

uint64_t __APSGetCPULoadAverage_block_invoke()
{
  uint64_t result;

  result = sysconf(58);
  APSGetCPULoadAverage_sProcessorCount = result;
  return result;
}

@end
