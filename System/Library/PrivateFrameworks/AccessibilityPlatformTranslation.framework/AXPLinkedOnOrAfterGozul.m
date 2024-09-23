@implementation AXPLinkedOnOrAfterGozul

uint64_t __AXPLinkedOnOrAfterGozul_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  AXPLinkedOnOrAfterGozul_isLinkedOnOrAfterGozul = result;
  return result;
}

@end
