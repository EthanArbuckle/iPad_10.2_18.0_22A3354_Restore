@implementation IOAccelSharedGetTypeID

uint64_t __IOAccelSharedGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kIOAccelSharedID = result;
  return result;
}

@end
