@implementation IAPAppStopAccessibility

void __IAPAppStopAccessibility_block_invoke()
{
  if (__eaClientListener)
  {
    xpc_release((xpc_object_t)__eaClientListener);
    __eaClientListener = 0;
  }
  if (__eaClientListenerQueue)
  {
    dispatch_release((dispatch_object_t)__eaClientListenerQueue);
    __eaClientListenerQueue = 0;
  }
}

@end
