@implementation C3DBezierCurveGetTypeID

uint64_t __C3DBezierCurveGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DBezierCurveGetTypeID_typeID = result;
  return result;
}

@end
