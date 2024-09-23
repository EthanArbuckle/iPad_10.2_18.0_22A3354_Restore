@implementation PREditingFontAndColorPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingFontAndColorPickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PREditingFontAndColorPickerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PREditingFontAndColorPickerViewController"), CFSTR("numberSystemBarItem"), "@");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PREditingFontAndColorPickerViewControllerAccessibility;
  -[PREditingFontAndColorPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PREditingFontAndColorPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("numberSystemBarItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("clock.globe.image.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditingFontAndColorPickerViewControllerAccessibility;
  -[PREditingFontAndColorPickerViewControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __72__PREditingFontAndColorPickerViewControllerAccessibility_viewDidAppear___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("numberSystemBarItem"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

@end
