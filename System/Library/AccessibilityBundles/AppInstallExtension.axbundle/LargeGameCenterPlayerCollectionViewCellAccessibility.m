@implementation LargeGameCenterPlayerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.LargeGameCenterPlayerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.LargeGameCenterPlayerCollectionViewCell"), CFSTR("alias"), "DynamicTypeLabel");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[LargeGameCenterPlayerCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("alias"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeGameCenterPlayerCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[LargeGameCenterPlayerCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
