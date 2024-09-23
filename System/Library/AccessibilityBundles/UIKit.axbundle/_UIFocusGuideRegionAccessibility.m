@implementation _UIFocusGuideRegionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFocusGuideRegion");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const char *v5;
  id obj;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("_UIFocusGuideRegion");
  v3 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_canBeOccludedByRegionsAbove"), v3, 0);
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("delegate"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UILayoutGuide"), CFSTR("owningView"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIWindowScene"), CFSTR("_keyWindow"), "UIWindow");
  objc_storeStrong(v7, obj);
}

- (BOOL)_shouldUseNextFocusedItemForLinearSorting
{
  objc_super v3;
  SEL v4;
  _UIFocusGuideRegionAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusGuideRegionAccessibility;
  return -[_UIFocusGuideRegionAccessibility _shouldUseNextFocusedItemForLinearSorting](&v3, sel__shouldUseNextFocusedItemForLinearSorting);
}

@end
