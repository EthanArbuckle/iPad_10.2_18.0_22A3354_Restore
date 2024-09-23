@implementation _UIFloatingTabBarCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFloatingTabBarCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  _UIFloatingTabBarCollectionViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingTabBarCollectionViewAccessibility;
  return -[_UIFloatingTabBarCollectionViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF7420];
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end
