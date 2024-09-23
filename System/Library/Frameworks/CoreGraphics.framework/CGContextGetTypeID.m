@implementation CGContextGetTypeID

uint64_t __CGContextGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGContextGetTypeID_class);
  CGContextGetTypeID_type_id = result;
  return result;
}

@end
