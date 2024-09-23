@implementation IOAccelCommandQueueGetTypeID

uint64_t __IOAccelCommandQueueGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kIOAccelCommandQueueID = result;
  return result;
}

@end
