@implementation CRIsInternalInstall

uint64_t __CRIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CRIsInternalInstall_isInternal = result;
  return result;
}

@end
