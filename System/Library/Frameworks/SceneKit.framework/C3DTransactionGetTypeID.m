@implementation C3DTransactionGetTypeID

uint64_t __C3DTransactionGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DTransactionGetTypeID_typeID = result;
  return result;
}

@end
