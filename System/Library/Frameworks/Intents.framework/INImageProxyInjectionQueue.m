@implementation INImageProxyInjectionQueue

void __INImageProxyInjectionQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.intents.INImageProxyInjectionUtilities.injection-queue", v2);
  v1 = (void *)INImageProxyInjectionQueue_injectionQueue;
  INImageProxyInjectionQueue_injectionQueue = (uint64_t)v0;

}

@end
