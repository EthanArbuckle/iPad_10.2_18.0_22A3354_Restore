@implementation SearchActionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.SearchActionCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppStore.SearchActionCollectionViewCell"), CFSTR("actionContentView"), "SearchActionContentView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppStore.SearchActionContentView"), CFSTR("linkLabel"), "DynamicLabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchActionCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SearchActionCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF7410];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SearchActionCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("actionContentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("linkLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
