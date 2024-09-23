@implementation CGColorGetTypeID

uint64_t __CGColorGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGColorGetTypeID_class);
  CGColorGetTypeID_color_type_id = result;
  return result;
}

@end
