@implementation SecKeyGetTypeID

uint64_t __SecKeyGetTypeID_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
