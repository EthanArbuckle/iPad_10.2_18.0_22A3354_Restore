@implementation SFIsInternalInstall

uint64_t __SFIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  SFIsInternalInstall_isInternal = result;
  return result;
}

@end
