@implementation ARLinkedOnOrAfterConstellation

uint64_t __ARLinkedOnOrAfterConstellation_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  ARLinkedOnOrAfterConstellation_cachedReturn = result;
  return result;
}

@end
