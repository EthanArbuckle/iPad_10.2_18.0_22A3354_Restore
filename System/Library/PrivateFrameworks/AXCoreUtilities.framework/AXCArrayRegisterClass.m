@implementation AXCArrayRegisterClass

uint64_t ___AXCArrayRegisterClass_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  _AXCArrayTypeID = result;
  return result;
}

@end
