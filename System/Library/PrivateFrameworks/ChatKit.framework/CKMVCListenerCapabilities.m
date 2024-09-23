@implementation CKMVCListenerCapabilities

uint64_t __CKMVCListenerCapabilities_block_invoke()
{
  uint64_t result;

  result = CKListenerCapabilities();
  CKMVCListenerCapabilities_sCaps = *MEMORY[0x1E0D36D30] | result;
  return result;
}

@end
