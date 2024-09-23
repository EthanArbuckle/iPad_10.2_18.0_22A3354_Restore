@implementation BaseLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.BaseLockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ASMessagesProvider.SearchAdTransparencyLabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.BaseLockupView"), CFSTR("accessibilityHeadingLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.BaseLockupView"), CFSTR("accessibilityTertiaryTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.BaseLockupView"), CFSTR("accessibilityOfferLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.BaseLockupView"), CFSTR("accessibilityOrdinalLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.BaseLockupView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.BaseLockupView"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.BaseLockupView"), CFSTR("accessibilityOfferButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityAdvertisementElement
{
  return (id)-[BaseLockupViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_1);
}

uint64_t __65__BaseLockupViewAccessibility__accessibilityAdvertisementElement__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349043FC](CFSTR("ASMessagesProvider.SearchAdTransparencyLabel"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BaseLockupViewAccessibility _accessibilityAdvertisementElement](self, "_accessibilityAdvertisementElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v5);
  -[BaseLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityHeadingLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v6);
  -[BaseLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOrdinalLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v7);
  -[BaseLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v8);
  -[BaseLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v9);
  -[BaseLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTertiaryTitleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v10);
  AXLabelForElements();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)BaseLockupViewAccessibility;
  -[BaseLockupViewAccessibility _accessibilitySupplementaryFooterViews](&v9, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[BaseLockupViewAccessibility _accessibilityAdvertisementElement](self, "_accessibilityAdvertisementElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);
  -[BaseLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOfferButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v6);
  -[BaseLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOfferLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v7);

  return v3;
}

@end
