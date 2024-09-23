@implementation C3DSceneSourceGetTypeID

uint64_t __C3DSceneSourceGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DSceneSourceGetTypeID_typeID = result;
  return result;
}

@end
