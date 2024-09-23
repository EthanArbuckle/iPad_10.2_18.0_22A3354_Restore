@implementation IOHIDPostEvent

BOOL __IOHIDPostEvent_block_invoke()
{
  return IOHIDRequestAccess(kIOHIDRequestTypePostEvent);
}

@end
