@implementation SearchHintCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.SearchHintCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.SearchHintCollectionViewCell"), CFSTR("accessibilityHintView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("AppStoreKit.DynamicTypeLabel"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[SearchHintCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityHintView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityDescendantOfType:", MEMORY[0x234905FEC](CFSTR("AppStoreKit.DynamicTypeLabel")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchHintCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SearchHintCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
