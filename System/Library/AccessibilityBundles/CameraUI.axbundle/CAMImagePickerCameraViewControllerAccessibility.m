@implementation CAMImagePickerCameraViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMImagePickerCameraViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMImagePickerCameraViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMImagePickerCameraViewController"), CFSTR("cropOverlayWasCancelled:"), "v", "@", 0);

}

- (void)cropOverlayWasCancelled:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMImagePickerCameraViewControllerAccessibility;
  -[CAMImagePickerCameraViewControllerAccessibility cropOverlayWasCancelled:](&v5, sel_cropOverlayWasCancelled_, a3);
  -[CAMImagePickerCameraViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
