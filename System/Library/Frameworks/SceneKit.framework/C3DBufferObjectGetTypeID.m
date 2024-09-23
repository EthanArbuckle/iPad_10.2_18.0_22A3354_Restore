@implementation C3DBufferObjectGetTypeID

uint64_t __C3DBufferObjectGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DBufferObjectGetTypeID_typeID = result;
  return result;
}

@end
