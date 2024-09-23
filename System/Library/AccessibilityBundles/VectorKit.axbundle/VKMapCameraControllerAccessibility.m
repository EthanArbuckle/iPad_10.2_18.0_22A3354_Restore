@implementation VKMapCameraControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKMapCameraController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapCameraController"), CFSTR("zoomToLevel: withPoint:"), "v", "d", "{Matrix<double, 3, 1>=[3d]}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapCameraController"), CFSTR("tapZoom: levels: completionHandler:"), "v", "{CGPoint=dd}", "d", "@?", 0);

}

- (void)zoomToLevel:(double)a3 withPoint:()Matrix<double
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKMapCameraControllerAccessibility;
  -[VKMapCameraControllerAccessibility zoomToLevel:withPoint:](&v4, sel_zoomToLevel_withPoint_, a3, a4.var0[0], a4.var0[1], a4.var0[2]);
  if (AXRequiresMapAccessibility())
    AXPerformBlockOnMainThreadAfterDelay();
}

void __60__VKMapCameraControllerAccessibility_zoomToLevel_withPoint___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
