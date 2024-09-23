@implementation AVMobileTitlebarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVMobileTitlebarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVMobileTitlebarView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVMobileTitlebarView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVMobileTitlebarView"), CFSTR("_subtitleLabel"), "UILabel");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVMobileTitlebarViewAccessibility;
  -[AVMobileTitlebarViewAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[AVMobileTitlebarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__AVMobileTitlebarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_250141278;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v8);

  -[AVMobileTitlebarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __79__AVMobileTitlebarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v6[3] = &unk_250141278;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "_setAccessibilityLabelBlock:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __79__AVMobileTitlebarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __79__AVMobileTitlebarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("subtitleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (AVMobileTitlebarViewAccessibility)initWithFrame:(CGRect)a3
{
  AVMobileTitlebarViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileTitlebarViewAccessibility;
  v3 = -[AVMobileTitlebarViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AVMobileTitlebarViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMobileTitlebarViewAccessibility;
  -[AVMobileTitlebarViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[AVMobileTitlebarViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
