@implementation C3DResourceManagerGetTypeID

uint64_t __C3DResourceManagerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DResourceManagerGetTypeID_typeID = result;
  return result;
}

@end
