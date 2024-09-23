@implementation MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeRecipientView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFComposeRecipientView"), CFSTR("_labelView"), "MFHeaderLabelView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeHeaderView"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFComposeRecipientView"), CFSTR("_textField"), "_MFMailRecipientTextField");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipientView"), CFSTR("setLabel:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI;
  -[MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI safeValueForKey:](self, "safeValueForKey:", CFSTR("_textField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI safeValueForKey:](self, "safeValueForKey:", CFSTR("_labelView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

}

- (MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI)initWithFrame:(CGRect)a3
{
  MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI;
  v3 = -[MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)setLabel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI;
  -[MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI setLabel:](&v4, sel_setLabel_, a3);
  -[MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
