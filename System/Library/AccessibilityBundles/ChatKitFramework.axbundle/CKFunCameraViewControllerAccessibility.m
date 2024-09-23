@implementation CKFunCameraViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKFunCameraViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKFunCameraViewController"), CFSTR("dismiss"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKFunCameraViewController"), CFSTR("funCameraAppViewController"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKFunCameraViewControllerAccessibility;
  -[CKFunCameraViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CKFunCameraViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("funCameraAppViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXFunCamBrowserDrawer"));

}

- (BOOL)accessibilityPerformEscape
{
  objc_super v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKFunCameraViewControllerAccessibility dismiss](self, "dismiss");
    return 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CKFunCameraViewControllerAccessibility;
    return -[CKFunCameraViewControllerAccessibility accessibilityPerformEscape](&v4, sel_accessibilityPerformEscape);
  }
}

@end
