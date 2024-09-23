@implementation UITextEffectsWindowAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextEffectsWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowVisible
{
  objc_super v4;

  if ((_AXCKIsActionWindowShowing() & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)UITextEffectsWindowAccessibility__ChatKit__UIKit;
  return -[UITextEffectsWindowAccessibility__ChatKit__UIKit _accessibilityWindowVisible](&v4, sel__accessibilityWindowVisible);
}

@end
