@implementation CNMeCardSharingSettingsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNMeCardSharingSettingsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNMeCardSharingSettingsViewController"), CFSTR("_givenNameField"), "UITextField");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNMeCardSharingSettingsViewController"), CFSTR("_familyNameField"), "UITextField");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNMeCardSharingSettingsViewController"), CFSTR("viewDidLoad"), "v", 0);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNMeCardSharingSettingsViewControllerAccessibility;
  -[CNMeCardSharingSettingsViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CNMeCardSharingSettingsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id from;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNMeCardSharingSettingsViewControllerAccessibility;
  -[CNMeCardSharingSettingsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  -[CNMeCardSharingSettingsViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_givenNameField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);

  v4 = objc_loadWeakRetained(&location);
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __96__CNMeCardSharingSettingsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v11[3] = &unk_2501D83E0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "_setAccessibilityFrameBlock:", v11);

  -[CNMeCardSharingSettingsViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_familyNameField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v6);

  v7 = objc_loadWeakRetained(&from);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __96__CNMeCardSharingSettingsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v8[3] = &unk_2501D83E0;
  objc_copyWeak(&v9, &from);
  objc_msgSend(v7, "_setAccessibilityFrameBlock:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

double __96__CNMeCardSharingSettingsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  UIView *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double result;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (UIView *)objc_loadWeakRetained(v1);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  v18 = UIAccessibilityConvertFrameToScreenCoordinates(v17, v11);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;

  AXDeviceGetMainScreenBounds();
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  *(_QWORD *)&result = (unint64_t)CGRectIntersection(v19, v20);
  return result;
}

double __96__CNMeCardSharingSettingsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  UIView *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double result;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (UIView *)objc_loadWeakRetained(v1);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  v18 = UIAccessibilityConvertFrameToScreenCoordinates(v17, v11);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;

  AXDeviceGetMainScreenBounds();
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  *(_QWORD *)&result = (unint64_t)CGRectIntersection(v19, v20);
  return result;
}

@end
