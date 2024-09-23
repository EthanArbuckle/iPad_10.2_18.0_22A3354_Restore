@implementation C3DTriangulationInfoGetTypeID

uint64_t __C3DTriangulationInfoGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DTriangulationInfoGetTypeID_typeID = result;
  return result;
}

@end
