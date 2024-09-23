@implementation MFComposeSubjectViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeSubjectView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeSubjectView"), CFSTR("setNotifyOptionSelected:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFComposeSubjectView"), CFSTR("_notifyButton"), "MFConfirmationButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFComposeSubjectView"), CFSTR("_textView"), "UITextView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFComposeSubjectView"), CFSTR("CNComposeHeaderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeHeaderView"), CFSTR("labelView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFComposeSubjectViewAccessibility;
  -[MFComposeSubjectViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[MFComposeSubjectViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("subjectField"));

  -[MFComposeSubjectViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_notifyButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("notifyme.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  -[MFComposeSubjectViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 0);

}

- (MFComposeSubjectViewAccessibility)initWithFrame:(CGRect)a3
{
  MFComposeSubjectViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFComposeSubjectViewAccessibility;
  v3 = -[MFComposeSubjectViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MFComposeSubjectViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)setNotifyOptionSelected:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFComposeSubjectViewAccessibility;
  -[MFComposeSubjectViewAccessibility setNotifyOptionSelected:](&v8, sel_setNotifyOptionSelected_);
  v5 = *MEMORY[0x24BDF7400];
  if (!v3)
    v5 = 0;
  v6 = v5 | *MEMORY[0x24BDF73B0];
  -[MFComposeSubjectViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_notifyButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityTraits:", v6);

}

@end
