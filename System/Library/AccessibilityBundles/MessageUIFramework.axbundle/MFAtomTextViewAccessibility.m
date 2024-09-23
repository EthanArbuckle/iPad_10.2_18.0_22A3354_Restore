@implementation MFAtomTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFAtomTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFAtomTextView"), CFSTR("clearButton"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFAtomTextView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFAtomTextView"), CFSTR("placeholder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFAtomTextView"), CFSTR("placeholderLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFAtomTextViewAccessibility;
  -[MFAtomTextViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[MFAtomTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("clearButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[MFAtomTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("placeholderLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

}

- (id)accessibilityPlaceholderValue
{
  return (id)-[MFAtomTextViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("placeholder"));
}

- (MFAtomTextViewAccessibility)initWithFrame:(CGRect)a3
{
  MFAtomTextViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFAtomTextViewAccessibility;
  v3 = -[MFAtomTextViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MFAtomTextViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

void __50___MFAtomTextViewAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "accessibilityLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_enqueueObject:", v3);

}

@end
