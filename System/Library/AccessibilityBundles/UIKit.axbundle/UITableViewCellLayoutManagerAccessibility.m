@implementation UITableViewCellLayoutManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCellLayoutManager");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCellLayoutManager"), CFSTR("_layoutFocusGuidesForCell:"), "v", "@", 0);
  objc_storeStrong(v4, obj);
}

- (void)_layoutFocusGuidesForCell:(id)a3
{
  objc_super v3;
  id location[2];
  UITableViewCellLayoutManagerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "_accessibilityIsFKARunningForFocusItem") & 1) == 0)
  {
    v3.receiver = v5;
    v3.super_class = (Class)UITableViewCellLayoutManagerAccessibility;
    -[UITableViewCellLayoutManagerAccessibility _layoutFocusGuidesForCell:](&v3, sel__layoutFocusGuidesForCell_, location[0]);
  }
  objc_storeStrong(location, 0);
}

@end
