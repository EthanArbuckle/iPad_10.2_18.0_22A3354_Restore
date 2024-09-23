@implementation UICoverSheetButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICoverSheetButton");
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
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UICoverSheetButton"), CFSTR("_backgroundEffectView"), "UIVisualEffectView");
  objc_storeStrong(location, 0);
}

- (id)accessibilityPath
{
  id v3;
  id v4;

  v3 = (id)-[UICoverSheetButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundEffectView"));
  v4 = (id)objc_msgSend(v3, "accessibilityPath");

  return v4;
}

@end
