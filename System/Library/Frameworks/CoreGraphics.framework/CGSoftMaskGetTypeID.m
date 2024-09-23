@implementation CGSoftMaskGetTypeID

uint64_t __CGSoftMaskGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGSoftMaskGetTypeID_runtime_class);
  CGSoftMaskGetTypeID_soft_mask_type_id = result;
  return result;
}

@end
