@implementation UITableViewCellAccessibility__Preferences__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCell");
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
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[UITableViewCellAccessibility__Preferences__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("LanguageCell"));

  if (v4)
  {
    -[UITableViewCellAccessibility__Preferences__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCellAccessibility__Preferences__UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("axLanguage"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAttribute:forKey:", v8, *MEMORY[0x24BDFEBE0]);

      return v7;
    }

  }
  v10.receiver = self;
  v10.super_class = (Class)UITableViewCellAccessibility__Preferences__UIKit;
  -[UITableViewCellAccessibility__Preferences__UIKit accessibilityLabel](&v10, sel_accessibilityLabel);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
