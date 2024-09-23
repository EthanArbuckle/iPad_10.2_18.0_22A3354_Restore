@implementation CGShadingGetTypeID

uint64_t __CGShadingGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGShadingGetTypeID_class);
  CGShadingGetTypeID_shading_type_id = result;
  return result;
}

@end
