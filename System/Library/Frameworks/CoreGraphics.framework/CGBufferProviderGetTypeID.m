@implementation CGBufferProviderGetTypeID

uint64_t __CGBufferProviderGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGBufferProviderGetTypeID_runtime_class);
  CGBufferProviderGetTypeID_id = result;
  return result;
}

@end
