@implementation CGNotificationCenterGetTypeID

uint64_t __CGNotificationCenterGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGNotificationCenterGetTypeID_runtime_class);
  CGNotificationCenterGetTypeID_notification_center_type_id = result;
  return result;
}

@end
