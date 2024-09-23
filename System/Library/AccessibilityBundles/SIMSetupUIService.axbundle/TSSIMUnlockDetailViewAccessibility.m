@implementation TSSIMUnlockDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TSSIMUnlockDetailView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TSSIMUnlockDetailView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TSSIMUnlockDetailView"), CFSTR("initWithActionType:actionSubtype:"), "@", "q", "q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSSIMUnlockDetailViewAccessibility;
  -[TSSIMUnlockDetailViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[TSSIMUnlockDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityAddTrait:", *MEMORY[0x24BDF73C0]);

}

- (TSSIMUnlockDetailViewAccessibility)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4
{
  TSSIMUnlockDetailViewAccessibility *v4;
  TSSIMUnlockDetailViewAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSSIMUnlockDetailViewAccessibility;
  v4 = -[TSSIMUnlockDetailViewAccessibility initWithActionType:actionSubtype:](&v7, sel_initWithActionType_actionSubtype_, a3, a4);
  v5 = v4;
  if (v4)
    -[TSSIMUnlockDetailViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v5;
}

@end
