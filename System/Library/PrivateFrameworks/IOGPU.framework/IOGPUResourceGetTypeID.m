@implementation IOGPUResourceGetTypeID

uint64_t __IOGPUResourceGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kIOGPUResourceID = result;
  return result;
}

@end
