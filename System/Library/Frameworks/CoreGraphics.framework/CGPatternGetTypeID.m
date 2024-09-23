@implementation CGPatternGetTypeID

uint64_t __CGPatternGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGPatternGetTypeID_class);
  CGPatternGetTypeID_pattern_type_id = result;
  return result;
}

@end
