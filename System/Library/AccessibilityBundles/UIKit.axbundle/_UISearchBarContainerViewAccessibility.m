@implementation _UISearchBarContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISearchBarContainerView");
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

- (int64_t)accessibilityContainerType
{
  id location[3];
  int64_t v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[_UISearchBarContainerViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_57);
  if ((objc_msgSend(location[0], "_accessibilityViewIsVisible") & 1) != 0)
    v4 = 4;
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

- (int64_t)_accessibilitySortPriority
{
  return 1000;
}

@end
