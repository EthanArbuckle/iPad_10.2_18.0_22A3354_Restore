@implementation C3DEngineContextGetTypeID

uint64_t __C3DEngineContextGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DEngineContextGetTypeID_typeID = result;
  return result;
}

@end
