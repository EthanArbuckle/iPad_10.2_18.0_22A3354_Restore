@implementation UILabelAccessibility__PassKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILabel");
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

  -[UILabelAccessibility__PassKitUI__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXPKAmountToFillLabel"));

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("pass.amount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UILabelAccessibility__PassKitUI__UIKit;
    -[UILabelAccessibility__PassKitUI__UIKit accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  UILabelAccessibility__PassKitUI__UIKit *v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[UILabelAccessibility__PassKitUI__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXPKAmountToFillLabel"));

  if (v4
    && (-[UILabelAccessibility__PassKitUI__UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPKAmountLabelCurrencySymbol")), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = self;
    -[UILabelAccessibility__PassKitUI__UIKit text](v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UILabelAccessibility__PassKitUI__UIKit;
    -[UILabelAccessibility__PassKitUI__UIKit accessibilityValue](&v12, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
