@implementation PKCellAccessoryMultiSelectIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKCellAccessoryMultiSelectIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKCellAccessoryMultiSelectIndicator"), CFSTR("_imageView"), "UIImageView");
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  unint64_t v9;

  objc_opt_class();
  -[PKCellAccessoryMultiSelectIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("checkmark.circle.fill"));
  v8 = *MEMORY[0x24BDF7400];
  if (!v7)
    v8 = 0;
  v9 = *MEMORY[0x24BDF73B0] | v8;

  return v9;
}

@end
