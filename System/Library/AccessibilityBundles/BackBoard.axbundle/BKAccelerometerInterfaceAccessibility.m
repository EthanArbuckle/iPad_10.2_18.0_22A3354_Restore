@implementation BKAccelerometerInterfaceAccessibility

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  +[AXBAccessibilityManager sharedManager](AXBAccessibilityManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "accelerometerDisabled");

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKAccelerometerInterfaceAccessibility;
    v12 = -[BKAccelerometerInterfaceAccessibility processEvent:sender:dispatcher:](&v14, sel_processEvent_sender_dispatcher_, a3, v8, v9);
  }

  return (int64_t)v12;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKAccelerometerInterface");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v3, "stringWithUTF8String:", "^^{__IOHIDEvent}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("N%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v4, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKAccelerometerInterface"), CFSTR("processEvent:sender:dispatcher:"), "q", objc_msgSend(v7, "UTF8String"), "@", "@", 0);
  objc_msgSend(v4, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKAccelerometerInterface"), CFSTR("orientationManager: deviceOrientationMayHaveChanged: changeSource: isDeviceOrientationLocked:"), "v", "@", "q", "q", "B", 0);

}

- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  char v12;
  objc_super v13;

  v6 = a6;
  v10 = a3;
  +[AXBAccessibilityManager sharedManager](AXBAccessibilityManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "accelerometerDisabled");

  if (a5 == 2 || (v12 & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)BKAccelerometerInterfaceAccessibility;
    -[BKAccelerometerInterfaceAccessibility orientationManager:deviceOrientationMayHaveChanged:changeSource:isDeviceOrientationLocked:](&v13, sel_orientationManager_deviceOrientationMayHaveChanged_changeSource_isDeviceOrientationLocked_, v10, a4, a5, v6);
  }

}

@end
