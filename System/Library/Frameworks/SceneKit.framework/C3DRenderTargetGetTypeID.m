@implementation C3DRenderTargetGetTypeID

uint64_t __C3DRenderTargetGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DRenderTargetGetTypeID_typeID = result;
  return result;
}

@end
