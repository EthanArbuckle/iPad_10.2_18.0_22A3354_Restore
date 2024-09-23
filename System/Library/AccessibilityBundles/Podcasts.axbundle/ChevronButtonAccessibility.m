@implementation ChevronButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.ChevronButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("ShelfKitCollectionViews.DynamicTypeLabel"));
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
  objc_super v7;

  -[ChevronButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ChevronButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ChevronButtonAccessibility;
    -[ChevronButtonAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ChevronButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ChevronButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
