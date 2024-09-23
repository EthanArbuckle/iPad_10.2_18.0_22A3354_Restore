@implementation CGDisplayListGetTypeID

uint64_t __CGDisplayListGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGDisplayListGetTypeID::dl2_class);
  CGDisplayListGetTypeID::display_list2_type_id = result;
  return result;
}

@end
