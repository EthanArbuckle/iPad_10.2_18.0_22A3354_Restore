@implementation ARLinkedOnOrAfterCrystal

uint64_t __ARLinkedOnOrAfterCrystal_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  ARLinkedOnOrAfterCrystal_cachedReturn = result;
  return result;
}

@end
