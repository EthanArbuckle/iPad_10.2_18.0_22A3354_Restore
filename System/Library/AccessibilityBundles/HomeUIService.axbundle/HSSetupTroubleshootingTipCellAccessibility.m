@implementation HSSetupTroubleshootingTipCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HSSetupTroubleshootingTipCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HSSetupTroubleshootingTipCell"), CFSTR("bodyTextView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HSSetupTroubleshootingTipCell"), CFSTR("initWithStyle:reuseIdentifier:"), "@", "q", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSSetupTroubleshootingTipCellAccessibility;
  -[HSSetupTroubleshootingTipCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[HSSetupTroubleshootingTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bodyTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 1);

}

- (HSSetupTroubleshootingTipCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HSSetupTroubleshootingTipCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HSSetupTroubleshootingTipCellAccessibility;
  v4 = -[HSSetupTroubleshootingTipCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[HSSetupTroubleshootingTipCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

@end
