@implementation CPSIsInternalInstall

uint64_t __CPSIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CPSIsInternalInstall_isInternal = result & 1;
  return result;
}

@end
