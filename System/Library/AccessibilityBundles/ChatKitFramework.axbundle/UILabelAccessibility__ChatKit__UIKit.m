@implementation UILabelAccessibility__ChatKit__UIKit

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

  -[UILabelAccessibility__ChatKit__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CharacterCount"));

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("character.count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UILabelAccessibility__ChatKit__UIKit;
    -[UILabelAccessibility__ChatKit__UIKit accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  char **v5;
  UILabelAccessibility__ChatKit__UIKit **v6;
  UILabelAccessibility__ChatKit__UIKit *v8;
  UILabelAccessibility__ChatKit__UIKit *v9;

  -[UILabelAccessibility__ChatKit__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CharacterCount"));

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
  v6[1] = (UILabelAccessibility__ChatKit__UIKit *)UILabelAccessibility__ChatKit__UIKit;
  objc_msgSendSuper2((objc_super *)v6, *v5, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_accessibilityIsNotFirstElement
{
  char v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UILabelAccessibility__ChatKit__UIKit;
  if (-[UILabelAccessibility__ChatKit__UIKit _accessibilityIsNotFirstElement](&v6, sel__accessibilityIsNotFirstElement))
    return 1;
  -[UILabelAccessibility__ChatKit__UIKit _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_9, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "_accessibilityIsNotFirstElement");

  return v3;
}

@end
