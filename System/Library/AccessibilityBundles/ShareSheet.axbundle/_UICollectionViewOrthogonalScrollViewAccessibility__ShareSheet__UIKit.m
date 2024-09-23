@implementation _UICollectionViewOrthogonalScrollViewAccessibility__ShareSheet__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UICollectionViewOrthogonalScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollViewAccessibility"), CFSTR("accessibilityApplyScrollContent:sendScrollStatus:animated:"), "v", "{CGPoint=dd}", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollViewAccessibility"), CFSTR("accessibilityApplyScrollContentOverride:sendScrollStatus:animateWithDuration:animationCurve:"), "v", "{CGPoint=dd}", "B", "d", "i", 0);

}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;

  v5 = a5;
  if ((accessibilityIsPagesApp() & 1) == 0)
    AXPerformSafeBlock();
  if (v5)
    UIAccessibilityIsSwitchControlRunning();
  AXPerformSafeBlock();
}

@end
