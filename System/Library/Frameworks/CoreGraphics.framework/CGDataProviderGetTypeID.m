@implementation CGDataProviderGetTypeID

uint64_t __CGDataProviderGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGDataProviderGetTypeID_runtime_class);
  CGDataProviderGetTypeID_id = result;
  return result;
}

@end
