@implementation _UIQueuingScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIQueuingScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v10 = (id)-[_UIQueuingScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("visibleView"));
  objc_msgSend(v10, "accessibilityFrame");
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;

  v6 = v11;
  v7 = v12;
  v8 = v13;
  v9 = v14;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)canBecomeFocused
{
  objc_super v3;
  char v4;
  SEL v5;
  _UIQueuingScrollViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIQueuingScrollViewAccessibility;
  v4 = -[_UIQueuingScrollViewAccessibility canBecomeFocused](&v3, sel_canBecomeFocused);
  if ((-[_UIQueuingScrollViewAccessibility _accessibilityIsFKARunningForFocusItem](v6, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 0;
  else
    return v4 & 1;
}

@end
