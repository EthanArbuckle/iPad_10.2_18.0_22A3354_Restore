@implementation C3DEngineNotificationQueueGetTypeID

uint64_t __C3DEngineNotificationQueueGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DEngineNotificationQueueGetTypeID_typeID = result;
  return result;
}

@end
