@implementation VUILibraryMenuItemViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUILibraryMenuItemViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VUILibraryMenuItemViewCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUILibraryMenuItemViewCell"), CFSTR("titleLabel"), "@");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[VUILibraryMenuItemViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILibraryMenuItemViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[VUILibraryMenuItemViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
