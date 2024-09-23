@implementation _UIPopoverViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIPopoverView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIPopoverView"), CFSTR("_contentView"), "UIView");
  objc_storeStrong(location, 0);
}

- (unint64_t)_accessibilityAutomationType
{
  return 18;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end
