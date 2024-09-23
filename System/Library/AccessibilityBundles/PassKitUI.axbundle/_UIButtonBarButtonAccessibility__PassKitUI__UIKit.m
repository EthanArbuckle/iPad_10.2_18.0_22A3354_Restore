@implementation _UIButtonBarButtonAccessibility__PassKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIButtonBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  objc_super v6;

  -[_UIButtonBarButtonAccessibility__PassKitUI__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", kAXCustomButtonIdentifier);

  if (v4)
    return *MEMORY[0x24BDF73C0];
  v6.receiver = self;
  v6.super_class = (Class)_UIButtonBarButtonAccessibility__PassKitUI__UIKit;
  return -[_UIButtonBarButtonAccessibility__PassKitUI__UIKit accessibilityTraits](&v6, sel_accessibilityTraits);
}

@end
