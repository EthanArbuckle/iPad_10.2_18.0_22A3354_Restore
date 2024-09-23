@implementation ARLinkedOnOrAfterSydney

uint64_t __ARLinkedOnOrAfterSydney_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  ARLinkedOnOrAfterSydney_cachedReturn = result;
  return result;
}

@end
