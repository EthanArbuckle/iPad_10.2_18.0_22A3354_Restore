@implementation MXGetNotificationSenderQueue

dispatch_queue_t __MXGetNotificationSenderQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.mediaexperience.NotificationSenderQueue", v0);
  MXGetNotificationSenderQueue_notificationSenderQueue = (uint64_t)result;
  return result;
}

@end
