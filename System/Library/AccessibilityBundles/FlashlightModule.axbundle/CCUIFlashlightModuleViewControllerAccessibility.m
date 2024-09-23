@implementation CCUIFlashlightModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIFlashlightModuleViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIFlashlightModuleViewController"), CFSTR("_sliderView"), "CCUIBaseSliderView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIFlashlightModuleViewController"), CFSTR("viewDidLoad"), "v", 0);

}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(CFSTR("flashlight.button.label"));
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return CFSTR("flashlight");
}

- (BOOL)_accessibilityControlCenterButtonIsToggle
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIFlashlightModuleViewControllerAccessibility;
  -[CCUIFlashlightModuleViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[CCUIFlashlightModuleViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_sliderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);
  accessibilityLocalizedString(CFSTR("flashlight.slider.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __93__CCUIFlashlightModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_25020E7D8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

id __93__CCUIFlashlightModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  id v4;
  uint64_t v5;
  __CFString *v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "safeUnsignedIntegerForKey:", CFSTR("step"));

  v4 = objc_loadWeakRetained(v1);
  v5 = objc_msgSend(v4, "safeUnsignedIntegerForKey:", CFSTR("numberOfSteps"));

  if (v5 != 5)
    _AXAssert();
  if ((unint64_t)(v3 - 1) > 3)
    v6 = CFSTR("flashlight.level.very.bright");
  else
    v6 = *(&off_25020E7F8 + v3 - 1);
  accessibilityLocalizedString(v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIFlashlightModuleViewControllerAccessibility;
  -[CCUIFlashlightModuleViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CCUIFlashlightModuleViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
