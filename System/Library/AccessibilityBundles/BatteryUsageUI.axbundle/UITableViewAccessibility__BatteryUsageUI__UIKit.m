@implementation UITableViewAccessibility__BatteryUsageUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("BatteryUIController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableView"), CFSTR("_visibleBounds"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (CGRect)_accessibilityBoundsOfCellsToLoad
{
  CGRect v2;

  -[UITableViewAccessibility__BatteryUsageUI__UIKit bounds](self, "bounds");
  return CGRectInset(v2, v2.size.width * -2.0, v2.size.height * -2.0);
}

- (CGRect)_visibleBounds
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  int v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect result;
  CGRect v25;

  v21.receiver = self;
  v21.super_class = (Class)UITableViewAccessibility__BatteryUsageUI__UIKit;
  -[UITableViewAccessibility__BatteryUsageUI__UIKit _visibleBounds](&v21, sel__visibleBounds);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  -[UITableViewAccessibility__BatteryUsageUI__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234908B68](CFSTR("BatteryUIController"));
  if ((objc_opt_isKindOfClass() & 1) != 0 && UIAccessibilityIsVoiceOverRunning())
  {
    v12 = -[UITableViewAccessibility__BatteryUsageUI__UIKit isAccessibilityOpaqueElementProvider](self, "isAccessibilityOpaqueElementProvider");

    if (v12)
    {
      -[UITableViewAccessibility__BatteryUsageUI__UIKit _accessibilityBoundsOfCellsToLoad](self, "_accessibilityBoundsOfCellsToLoad");
      v25.origin.x = v13;
      v25.origin.y = v14;
      v25.size.width = v15;
      v25.size.height = v16;
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v23 = CGRectUnion(v22, v25);
      x = v23.origin.x;
      y = v23.origin.y;
      width = v23.size.width;
      height = v23.size.height;
    }
  }
  else
  {

  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end
