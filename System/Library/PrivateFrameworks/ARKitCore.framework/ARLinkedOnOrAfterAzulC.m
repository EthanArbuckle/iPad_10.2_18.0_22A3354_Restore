@implementation ARLinkedOnOrAfterAzulC

uint64_t __ARLinkedOnOrAfterAzulC_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  ARLinkedOnOrAfterAzulC_cachedReturn = result;
  return result;
}

@end
