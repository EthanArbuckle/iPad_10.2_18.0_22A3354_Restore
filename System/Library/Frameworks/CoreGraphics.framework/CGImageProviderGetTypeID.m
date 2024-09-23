@implementation CGImageProviderGetTypeID

uint64_t __CGImageProviderGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGImageProviderGetTypeID_class);
  CGImageProviderGetTypeID_image_provider_type_id = result;
  return result;
}

@end
