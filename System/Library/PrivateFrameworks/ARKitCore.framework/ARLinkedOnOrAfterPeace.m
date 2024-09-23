@implementation ARLinkedOnOrAfterPeace

uint64_t __ARLinkedOnOrAfterPeace_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  ARLinkedOnOrAfterPeace_cachedReturn = result;
  return result;
}

@end
