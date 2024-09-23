@implementation UIButtonAccessibility__PosterKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIButtonAccessibility__PosterKit__UIKit;
  -[UIButtonAccessibility__PosterKit__UIKit accessibilityLabel](&v5, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("square.2.stack.3d")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("square.2.layers.3d")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("square.2.layers.3d.fill")))
  {
    accessibilityLocalizedString(CFSTR("primary.action.button.depth.effect.label"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

@end
