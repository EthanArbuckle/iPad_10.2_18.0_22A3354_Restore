@implementation C3DConvexPolyhedronGetTypeID

uint64_t __C3DConvexPolyhedronGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DConvexPolyhedronGetTypeID::typeID = result;
  return result;
}

@end
