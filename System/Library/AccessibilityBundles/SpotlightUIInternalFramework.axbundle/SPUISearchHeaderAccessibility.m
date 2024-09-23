@implementation SPUISearchHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SPUISearchHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUISearchHeader"), CFSTR("init"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUISearchHeader"), CFSTR("searchField"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SPUITextField"), CFSTR("UITextField"));
  if (AXProcessIsSpringBoard())
  {
    objc_msgSend(v3, "validateClass:", CFSTR("SBIconController"));
    objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("sharedInstance"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("iconManager"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("_isShowingSearchableTodayView"), "B", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("dismissSpotlightOrTodayViewAnimated:"), "B", "B", 0);
  }

}

- (void)_axAnnotateDictationButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  accessibilityLocalizedString(CFSTR("dictate.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[SPUISearchHeaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("searchField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rightView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v3);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPUISearchHeaderAccessibility;
  -[SPUISearchHeaderAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SPUISearchHeaderAccessibility _axAnnotateDictationButton](self, "_axAnnotateDictationButton");
}

- (SPUISearchHeaderAccessibility)init
{
  SPUISearchHeaderAccessibility *v2;
  SPUISearchHeaderAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPUISearchHeaderAccessibility;
  v2 = -[SPUISearchHeaderAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SPUISearchHeaderAccessibility _axAnnotateDictationButton](v2, "_axAnnotateDictationButton");
  return v3;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  id v9;

  objc_msgSend((id)MEMORY[0x23491EFE8](CFSTR("SBIconController"), a2), "safeValueForKey:", CFSTR("sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("iconManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("_isShowingSearchableTodayView"));
  if (a3 == 2)
    v7 = v6;
  else
    v7 = 0;
  if (v7)
  {
    v9 = v5;
    AXPerformSafeBlock();

  }
  return v7;
}

uint64_t __53__SPUISearchHeaderAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissSpotlightOrTodayViewAnimated:", 1);
}

@end
