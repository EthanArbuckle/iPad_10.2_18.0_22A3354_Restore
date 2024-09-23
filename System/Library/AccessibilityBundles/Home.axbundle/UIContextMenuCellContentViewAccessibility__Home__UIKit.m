@implementation UIContextMenuCellContentViewAccessibility__Home__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIContextMenuCellContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIContextMenuCellContentView"), CFSTR("iconImageView"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIContextMenuCellContentViewAccessibility__Home__UIKit;
  -[UIContextMenuCellContentViewAccessibility__Home__UIKit accessibilityLabel](&v11, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[UIContextMenuCellContentViewAccessibility__Home__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("iconImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("gear.badge")))
  {
    accessibilityLocalizedString(CFSTR("open.home.invitations"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }

  return v3;
}

@end
