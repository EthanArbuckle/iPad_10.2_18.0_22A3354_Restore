@implementation QLListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLListViewController"), CFSTR("_dismiss"), "v", 0);
}

- (BOOL)accessibilityPerformEscape
{
  id v2;

  v2 = (id)-[QLListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismiss"));
  return 1;
}

@end
