@implementation MainViewControllerContainerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MainViewControllerContainer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MainViewControllerContainer"), CFSTR("currentChildViewController"), "@", 0);
}

- (id)_accessibilitySpeakThisViewController
{
  return (id)-[MainViewControllerContainerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentChildViewController"));
}

@end
