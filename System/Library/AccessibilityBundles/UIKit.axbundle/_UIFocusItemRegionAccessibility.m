@implementation _UIFocusItemRegionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFocusItemRegion");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusItemRegion"), CFSTR("_canBeOccludedByRegionsAbove"), "B", 0);
  objc_storeStrong(v4, obj);
}

@end
