@implementation MPAVRoutingSheetAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPAVRoutingSheet");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MPAVRoutingSheet"), CFSTR("_dismissBackgroundButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MPAVRoutingSheet"), CFSTR("_dismissControlsViewButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAVRoutingSheet"), CFSTR("initWithAVItemType:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAVRoutingSheet"), CFSTR("dismiss"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPAVRoutingSheetAccessibility;
  -[MPAVRoutingSheetAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[MPAVRoutingSheetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissBackgroundButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[MPAVRoutingSheetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissControlsViewButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

id __59__MPAVRoutingSheetAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("dismiss"));
}

- (MPAVRoutingSheetAccessibility)initWithAVItemType:(int64_t)a3
{
  MPAVRoutingSheetAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPAVRoutingSheetAccessibility;
  v3 = -[MPAVRoutingSheetAccessibility initWithAVItemType:](&v5, sel_initWithAVItemType_, a3);
  -[MPAVRoutingSheetAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
