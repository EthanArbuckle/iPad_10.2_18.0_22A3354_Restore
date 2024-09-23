@implementation C3DModelTargetGetTypeID

uint64_t __C3DModelTargetGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DModelTargetGetTypeID_typeID = result;
  return result;
}

@end
