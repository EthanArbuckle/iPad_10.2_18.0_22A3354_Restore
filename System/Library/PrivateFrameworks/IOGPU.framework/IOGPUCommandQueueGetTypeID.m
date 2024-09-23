@implementation IOGPUCommandQueueGetTypeID

uint64_t __IOGPUCommandQueueGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kIOGPUCommandQueueID = result;
  return result;
}

@end
