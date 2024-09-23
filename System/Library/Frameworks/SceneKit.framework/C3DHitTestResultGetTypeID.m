@implementation C3DHitTestResultGetTypeID

uint64_t __C3DHitTestResultGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DHitTestResultGetTypeID_typeID = result;
  return result;
}

@end
