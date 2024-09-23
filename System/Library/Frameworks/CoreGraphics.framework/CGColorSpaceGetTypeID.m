@implementation CGColorSpaceGetTypeID

uint64_t __CGColorSpaceGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGColorSpaceGetTypeID_class);
  CGColorSpaceGetTypeID_type_id = result;
  return result;
}

@end
