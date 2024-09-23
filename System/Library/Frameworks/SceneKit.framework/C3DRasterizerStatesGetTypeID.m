@implementation C3DRasterizerStatesGetTypeID

uint64_t __C3DRasterizerStatesGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DRasterizerStatesGetTypeID_typeID = result;
  return result;
}

@end
