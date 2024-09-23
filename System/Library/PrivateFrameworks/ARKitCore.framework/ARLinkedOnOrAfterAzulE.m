@implementation ARLinkedOnOrAfterAzulE

uint64_t __ARLinkedOnOrAfterAzulE_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  ARLinkedOnOrAfterAzulE_cachedReturn = result;
  return result;
}

@end
