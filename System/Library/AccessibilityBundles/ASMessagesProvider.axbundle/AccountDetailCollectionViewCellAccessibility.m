@implementation AccountDetailCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.AccountDetailCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AppStoreKit.DynamicTypeLabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AccountDetailCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AccountDetailCollectionViewCell"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ASMessagesProvider.AccountDetailCollectionViewCell"), CFSTR("detailLabel"), "DynamicTypeLabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[AccountDetailCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAccessoryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccountDetailCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("detailLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccountDetailCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilitySubtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349043FC](CFSTR("AppStore.CountBadgeView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityCountLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MEMORY[0x2349043FC](CFSTR("AppStoreKit.DynamicTypeLabel"));
    objc_opt_isKindOfClass();
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AccountDetailCollectionViewCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[AccountDetailCollectionViewCellAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if (-[AccountDetailCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityDisabled")))return *MEMORY[0x24BDF73E8] | v3;
  else
    return v3 & ~*MEMORY[0x24BDF73E8];
}

@end
