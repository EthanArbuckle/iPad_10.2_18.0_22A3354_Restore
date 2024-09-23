@implementation UIListContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIListContentView");
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

- (id)automationElements
{
  return (id)-[UIListContentViewAccessibility subviews](self, "subviews", a2, self);
}

@end
