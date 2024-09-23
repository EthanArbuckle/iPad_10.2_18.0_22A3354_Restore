@implementation CGPathGetTypeID

uint64_t __CGPathGetTypeID_block_invoke_3()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGPathGetTypeID::path_class);
  CGPathGetTypeID::path_type_id = result;
  return result;
}

uint64_t __CGPathGetTypeID_block_invoke()
{
  uint64_t result;

  if ((dyld_program_sdk_at_least() & 1) != 0
    || (dyld_program_sdk_at_least() & 1) != 0
    || (dyld_program_sdk_at_least() & 1) != 0
    || (dyld_program_sdk_at_least() & 1) != 0)
  {
    result = 1;
  }
  else
  {
    result = dyld_program_sdk_at_least();
  }
  CGPathDisableTypeValidation = result;
  return result;
}

@end
