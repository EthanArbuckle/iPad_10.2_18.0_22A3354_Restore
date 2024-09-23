@implementation UITableViewWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewWrapperView");
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

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v3 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v2 = *MEMORY[0x24BDF7718];
  v5 = *(double *)(MEMORY[0x24BDF7718] + 24);
  v4 = *(double *)(MEMORY[0x24BDF7718] + 16);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)_accessibilityContentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  id location[2];
  UITableViewWrapperViewAccessibility *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v12 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITableViewWrapperViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  if (location[0])
  {
    objc_msgSend(location[0], "_accessibilityContentFrame");
  }
  else
  {
    v10.receiver = v12;
    v10.super_class = (Class)UITableViewWrapperViewAccessibility;
    -[UITableViewWrapperViewAccessibility _accessibilityContentFrame](&v10, sel__accessibilityContentFrame);
  }
  v13 = v2;
  v14 = v3;
  v15 = v4;
  v16 = v5;
  objc_storeStrong(location, 0);
  v6 = v13;
  v7 = v14;
  v8 = v15;
  v9 = v16;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)_accessibilityScrollingEnabled
{
  id location[3];
  char v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITableViewWrapperViewAccessibility _accessibilityUserDefinedScrollingEnabled](self, "_accessibilityUserDefinedScrollingEnabled");
  if (location[0])
    v4 = objc_msgSend(location[0], "BOOLValue") & 1;
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end
