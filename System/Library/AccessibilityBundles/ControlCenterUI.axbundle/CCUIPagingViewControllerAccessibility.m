@implementation CCUIPagingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIPagingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIPagingViewController"), CFSTR("controlsGalleryViewControllerWillPresent:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIPagingViewController"), CFSTR("controlsGalleryViewControllerWillDismiss:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIPagingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("CCUISControlsGalleryViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  char isKindOfClass;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIPagingViewControllerAccessibility;
  -[CCUIPagingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CCUIPagingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("presentedViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490BCB8](CFSTR("CCUISControlsGalleryViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CCUIPagingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityElementsHidden:", 1);

  }
}

- (void)controlsGalleryViewControllerWillPresent:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIPagingViewControllerAccessibility;
  -[CCUIPagingViewControllerAccessibility controlsGalleryViewControllerWillPresent:](&v5, sel_controlsGalleryViewControllerWillPresent_, a3);
  -[CCUIPagingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityElementsHidden:", 1);

}

- (void)controlsGalleryViewControllerWillDismiss:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIPagingViewControllerAccessibility;
  -[CCUIPagingViewControllerAccessibility controlsGalleryViewControllerWillDismiss:](&v5, sel_controlsGalleryViewControllerWillDismiss_, a3);
  -[CCUIPagingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityElementsHidden:", 0);

}

@end
