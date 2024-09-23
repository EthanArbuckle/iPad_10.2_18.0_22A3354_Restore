@implementation PKMonthDayCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKMonthDayCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKMonthDayCollectionViewCell"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKMonthDayCollectionViewCell"), CFSTR("dayNumber"), "q", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16F0];
  objc_opt_class();
  -[PKMonthDayCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dayNumber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedStringFromNumber:numberStyle:", v5, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)accessibilityElementsHidden
{
  return -[PKMonthDayCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled")) ^ 1;
}

- (BOOL)isAccessibilityElement
{
  return -[PKMonthDayCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled"));
}

@end
