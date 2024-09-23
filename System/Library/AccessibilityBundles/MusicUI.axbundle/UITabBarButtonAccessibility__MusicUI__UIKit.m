@implementation UITabBarButtonAccessibility__MusicUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITabBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITabBarButtonAccessibility__MusicUI__UIKit;
  v3 = -[UITabBarButtonAccessibility__MusicUI__UIKit accessibilityTraits](&v6, sel_accessibilityTraits);
  -[UITabBarButtonAccessibility__MusicUI__UIKit _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UITabBarCustomizeView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (-[UITabBarButtonAccessibility__MusicUI__UIKit safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isSelected")) & 1) == 0)
  {
    return (*MEMORY[0x24BDF73E8] | v3) & ~*MEMORY[0x24BEBB110];
  }
  return v3;
}

@end
