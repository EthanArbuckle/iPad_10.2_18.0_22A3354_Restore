@implementation SummaryContentSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SummaryContentSummaryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.SummaryContentSummaryView"), CFSTR("bookmarkButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SummaryContentSummaryView"), CFSTR("bookmarkButtonTapped"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SummaryContentSummaryViewAccessibility;
  -[SummaryContentSummaryViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[SummaryContentSummaryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("bookmarkButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73E8] & ~v4) != 0)
    v5 = CFSTR("add.button");
  else
    v5 = CFSTR("added.button");
  accessibilityLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v6);

}

- (void)bookmarkButtonTapped
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SummaryContentSummaryViewAccessibility;
  -[SummaryContentSummaryViewAccessibility bookmarkButtonTapped](&v2, sel_bookmarkButtonTapped);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __62__SummaryContentSummaryViewAccessibility_bookmarkButtonTapped__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityLoadAccessibilityInformation");
  objc_msgSend(*(id *)(a1 + 32), "safeSwiftValueForKey:", CFSTR("bookmarkButton"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v2);

}

@end
