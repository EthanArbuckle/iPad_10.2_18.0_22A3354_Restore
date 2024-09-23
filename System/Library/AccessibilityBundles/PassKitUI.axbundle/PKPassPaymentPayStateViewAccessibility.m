@implementation PKPassPaymentPayStateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassPaymentPayStateView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassPaymentPayStateView"), CFSTR("emphasizeStateIfPossible:withOverrideText:"), "v", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassPaymentPayStateView"), CFSTR("_label"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassPaymentPayStateView"), CFSTR("_applyStatePreservingGlyphState: overridingText: animated: completionHandler:"), "v", "B", "@", "B", "@?", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassPaymentPayStateViewAccessibility;
  -[PKPassPaymentPayStateViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PKPassPaymentPayStateViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityServesAsFirstElement:", 1);

}

- (PKPassPaymentPayStateViewAccessibility)initWithFrame:(CGRect)a3
{
  PKPassPaymentPayStateViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassPaymentPayStateViewAccessibility;
  v3 = -[PKPassPaymentPayStateViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PKPassPaymentPayStateViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

- (void)emphasizeStateIfPossible:(int64_t)a3 withOverrideText:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  -[PKPassPaymentPayStateViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)PKPassPaymentPayStateViewAccessibility;
  -[PKPassPaymentPayStateViewAccessibility emphasizeStateIfPossible:withOverrideText:](&v11, sel_emphasizeStateIfPossible_withOverrideText_, a3, v6);

  -[PKPassPaymentPayStateViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_label"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqual:", v8) & 1) == 0 && objc_msgSend(v8, "length") && objc_msgSend(v10, "length"))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v10);

}

- (void)_applyStatePreservingGlyphState:(BOOL)a3 overridingText:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a5;
  v8 = a3;
  v10 = a6;
  v11 = a4;
  -[PKPassPaymentPayStateViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_label"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)PKPassPaymentPayStateViewAccessibility;
  -[PKPassPaymentPayStateViewAccessibility _applyStatePreservingGlyphState:overridingText:animated:completionHandler:](&v16, sel__applyStatePreservingGlyphState_overridingText_animated_completionHandler_, v8, v11, v6, v10);

  -[PKPassPaymentPayStateViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  -[PKPassPaymentPayStateViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_label"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v15, "isEqual:", v13) & 1) == 0 && objc_msgSend(v15, "length"))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v15);

}

@end
