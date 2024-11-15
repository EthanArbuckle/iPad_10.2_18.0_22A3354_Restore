@implementation CFXNotificationCenterDarwinQueue

dispatch_queue_t ____CFXNotificationCenterDarwinQueue_block_invoke()
{
  NSObject *v0;
  qos_class_t v1;
  NSObject *v2;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = qos_class_main();
  dispatch_queue_attr_make_with_qos_class(v0, v1, 0);
  v2 = dispatch_queue_attr_make_with_overcommit();
  result = dispatch_queue_create_with_target_V2("com.apple.CFNotificationCenter", v2, 0);
  __CFXNotificationCenterDarwinQueue_queue = (uint64_t)result;
  return result;
}

@end
