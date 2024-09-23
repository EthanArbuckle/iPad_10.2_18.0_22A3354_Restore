@implementation CGLayerGetTypeID

uint64_t __CGLayerGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGLayerGetTypeID_class);
  CGLayerGetTypeID_layer_type_id = result;
  return result;
}

@end
