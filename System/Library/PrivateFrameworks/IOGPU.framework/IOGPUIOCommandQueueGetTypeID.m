@implementation IOGPUIOCommandQueueGetTypeID

uint64_t __IOGPUIOCommandQueueGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kIOGPUIOCommandQueueID = result;
  return result;
}

@end
