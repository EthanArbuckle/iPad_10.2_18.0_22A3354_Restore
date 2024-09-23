@implementation UIStatusBarPersonNameItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarPersonNameItemView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIStatusBarPersonNameItemView"), CFSTR("_personNameString"), "NSString");
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  return (id)-[UIStatusBarPersonNameItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_personNameString"), a2, self);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
