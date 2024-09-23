@implementation _SUUIModalSheetNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SUUIModalSheetNavigationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("dismissViewControllerAnimated: completion:"), "v", "B", "@?", 0);
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

@end
