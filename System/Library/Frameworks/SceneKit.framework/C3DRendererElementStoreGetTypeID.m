@implementation C3DRendererElementStoreGetTypeID

uint64_t __C3DRendererElementStoreGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DRendererElementStoreGetTypeID_typeID = result;
  return result;
}

@end
