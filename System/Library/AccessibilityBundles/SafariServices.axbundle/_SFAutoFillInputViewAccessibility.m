@implementation _SFAutoFillInputViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFAutoFillInputView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFAutoFillInputView"), CFSTR("initWithHostString:credentialSource:suggestion:customTitle:"), "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFAutoFillInputView"), CFSTR("_keyboardButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFAutoFillInputView"), CFSTR("_otherPasswordsButton"), "UIButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFAutoFillInputViewAccessibility;
  -[_SFAutoFillInputViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[_SFAutoFillInputViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_keyboardButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityUIKitLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[_SFAutoFillInputViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_otherPasswordsButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("other.passwords"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_SFAutoFillInputViewAccessibility)initWithHostString:(id)a3 credentialSource:(id)a4 suggestion:(id)a5 customTitle:(id)a6
{
  _SFAutoFillInputViewAccessibility *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFAutoFillInputViewAccessibility;
  v6 = -[_SFAutoFillInputViewAccessibility initWithHostString:credentialSource:suggestion:customTitle:](&v8, sel_initWithHostString_credentialSource_suggestion_customTitle_, a3, a4, a5, a6);
  -[_SFAutoFillInputViewAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");

  return v6;
}

@end
