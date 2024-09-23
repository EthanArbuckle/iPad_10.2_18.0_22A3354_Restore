@implementation ARLinkedOnOrAfterPeaceE

uint64_t __ARLinkedOnOrAfterPeaceE_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  ARLinkedOnOrAfterPeaceE_cachedReturn = result;
  return result;
}

@end
