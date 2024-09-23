@implementation NSSetupDispatchDataBridge

void ___NSSetupDispatchDataBridge_block_invoke()
{
  Class Class;
  objc_class *v1;
  objc_class *v2;

  Class = objc_getClass("OS_dispatch_data");
  if (Class)
  {
    v1 = Class;
    v2 = objc_getClass("_NSDispatchData");
    class_setSuperclass(v1, v2);
  }
  else
  {
    syslog(3, "Foundation could not locate dispatch_data_t's Objective-C class. Bridging will not be in effect, and attempts to use it will crash");
  }
}

@end
