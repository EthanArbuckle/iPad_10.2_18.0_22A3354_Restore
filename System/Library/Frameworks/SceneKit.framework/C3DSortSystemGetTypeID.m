@implementation C3DSortSystemGetTypeID

uint64_t __C3DSortSystemGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DSortSystemGetTypeID_typeID = result;
  return result;
}

@end
