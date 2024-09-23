@implementation UITransitionViewAccessibility__SpringBoard__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITransitionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  void *v3;
  char isKindOfClass;
  objc_super v6;

  if (accessibilityViewIsModal_onceToken != -1)
    dispatch_once(&accessibilityViewIsModal_onceToken, &__block_literal_global_0);
  -[UITransitionViewAccessibility__SpringBoard__UIKit _accessibilityWindow](self, "_accessibilityWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UITransitionViewAccessibility__SpringBoard__UIKit;
  return -[UITransitionViewAccessibility__SpringBoard__UIKit accessibilityViewIsModal](&v6, sel_accessibilityViewIsModal);
}

@end
