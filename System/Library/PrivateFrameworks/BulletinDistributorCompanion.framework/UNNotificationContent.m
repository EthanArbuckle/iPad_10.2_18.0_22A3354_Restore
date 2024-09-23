@implementation UNNotificationContent

void __74__UNNotificationContent_BLTBackwardCompatible__blt_swizzleEncodeWithCoder__block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  objc_method *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_encodeWithCoder_);
  v2 = class_getInstanceMethod(v0, sel_blt_encodeWithCoder_);
  method_exchangeImplementations(InstanceMethod, v2);
}

@end
