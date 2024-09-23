@implementation UIButtonBarButtonAccessibility__Podcasts__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIButtonBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[UIButtonBarButtonAccessibility__Podcasts__UIKit accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIButtonBarButtonAccessibility__Podcasts__UIKit;
    v4 = -[UIButtonBarButtonAccessibility__Podcasts__UIKit isAccessibilityElement](&v6, sel_isAccessibilityElement);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
