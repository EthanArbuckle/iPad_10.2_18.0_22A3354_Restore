@implementation IOGPUNotificationQueueGetTypeID

uint64_t __IOGPUNotificationQueueGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kIOGPUNotificationQueueID = result;
  return result;
}

@end
