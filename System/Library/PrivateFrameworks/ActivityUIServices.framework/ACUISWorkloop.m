@implementation ACUISWorkloop

+ (id)createWorkloopNamed:(id)a3
{
  NSObject *inactive;

  inactive = dispatch_workloop_create_inactive((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_workloop_set_qos_class_floor();
  dispatch_activate(inactive);
  return inactive;
}

@end
