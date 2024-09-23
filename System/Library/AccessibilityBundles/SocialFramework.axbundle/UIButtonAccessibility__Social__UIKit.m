@implementation UIButtonAccessibility__Social__UIKit

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
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[UIButtonAccessibility__Social__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AccountSelector"));

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("account.selector.label"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIButtonAccessibility__Social__UIKit;
    -[UIButtonAccessibility__Social__UIKit accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)accessibilityHint
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[UIButtonAccessibility__Social__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AccountSelector"));

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("account.selector.hint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIButtonAccessibility__Social__UIKit;
    -[UIButtonAccessibility__Social__UIKit accessibilityHint](&v7, sel_accessibilityHint);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  char **v5;
  UIButtonAccessibility__Social__UIKit **v6;
  UIButtonAccessibility__Social__UIKit *v8;
  UIButtonAccessibility__Social__UIKit *v9;

  -[UIButtonAccessibility__Social__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AccountSelector"));

  if (v4)
  {
    v9 = self;
    v5 = &selRef_accessibilityLabel;
    v6 = &v9;
  }
  else
  {
    v8 = self;
    v5 = &selRef_accessibilityValue;
    v6 = &v8;
  }
  v6[1] = (UIButtonAccessibility__Social__UIKit *)UIButtonAccessibility__Social__UIKit;
  objc_msgSendSuper2((objc_super *)v6, *v5, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
