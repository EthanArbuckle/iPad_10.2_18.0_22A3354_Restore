@implementation CGContainerGetTypeID

uint64_t __CGContainerGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGContainerGetTypeID_class);
  CGContainerGetTypeID_container_type_id = result;
  return result;
}

@end
