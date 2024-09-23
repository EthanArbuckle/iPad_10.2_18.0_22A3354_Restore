@implementation UINavigationButtonAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UINavigationButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[UINavigationButtonAccessibility__ChatKit__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("composeButton")))
  {
    accessibilityLocalizedString(CFSTR("compose.button.text"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationButtonAccessibility__ChatKit__UIKit;
    -[UINavigationButtonAccessibility__ChatKit__UIKit accessibilityLabel](&v7, sel_accessibilityLabel);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

@end
