@implementation InAppPurchaseLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.InAppPurchaseLockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.InAppPurchaseLockupCollectionViewCell"), CFSTR("accessibilityLockupView"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axLockupView
{
  return (id)-[InAppPurchaseLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLockupView"));
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[InAppPurchaseLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[InAppPurchaseLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;

  -[InAppPurchaseLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySupplementaryFooterViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
