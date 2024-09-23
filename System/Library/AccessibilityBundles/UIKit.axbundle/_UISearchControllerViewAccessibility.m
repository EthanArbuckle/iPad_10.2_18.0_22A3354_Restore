@implementation _UISearchControllerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISearchControllerView");
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UISearchControllerView"), CFSTR("UIView"));
  objc_storeStrong(location, 0);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v4;
  BOOL v6;
  objc_super v7;
  int v8;
  id location[2];
  _UISearchControllerViewAccessibility *v10;
  CGPoint v11;
  id v12;

  v11 = a3;
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v4 = (id)-[_UISearchControllerViewAccessibility hitTest:withEvent:](v10, "hitTest:withEvent:", location[0], v11.x, v11.y);
  v6 = v4 != 0;

  if (v6)
  {
    v7.receiver = v10;
    v7.super_class = (Class)_UISearchControllerViewAccessibility;
    v12 = -[_UISearchControllerViewAccessibility _accessibilityHitTest:withEvent:](&v7, sel__accessibilityHitTest_withEvent_, location[0], v11.x, v11.y);
  }
  else
  {
    v12 = 0;
  }
  v8 = 1;
  objc_storeStrong(location, 0);
  return v12;
}

@end
