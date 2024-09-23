@implementation C3DRendererDelegateGetTypeID

uint64_t __C3DRendererDelegateGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DRendererDelegateGetTypeID_typeID = result;
  return result;
}

@end
