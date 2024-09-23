@implementation IOHIDEventQueueGetTypeID

uint64_t __IOHIDEventQueueGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIOHIDEventQueueTypeID = result;
  return result;
}

@end
