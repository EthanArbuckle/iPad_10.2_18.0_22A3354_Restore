@implementation UIInputSwitcherSegmentedTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIInputSwitcherSegmentedTableCell");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputSwitcherSegmentedTableCell"), CFSTR("segmentControl"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v3;
  id v4;

  v3 = (id)-[UIInputSwitcherSegmentedTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("segmentControl"));
  v4 = (id)objc_msgSend(v3, "_accessibilitySortedElementsWithin");

  return v4;
}

@end
