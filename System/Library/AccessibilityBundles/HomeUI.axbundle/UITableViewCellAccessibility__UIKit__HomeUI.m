@implementation UITableViewCellAccessibility__UIKit__HomeUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("hu_configureCheckmarkForImageView:checked:"), "v", "@", "B", 0);
}

- (void)hu_configureCheckmarkForImageView:(id)a3 checked:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCellAccessibility__UIKit__HomeUI;
  v5 = a3;
  -[UITableViewCellAccessibility__UIKit__HomeUI hu_configureCheckmarkForImageView:checked:](&v6, sel_hu_configureCheckmarkForImageView_checked_, v5, v4);
  objc_msgSend(v5, "setAccessibilityElementsHidden:", v4 ^ 1, v6.receiver, v6.super_class);

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITableViewCellAccessibility__UIKit__HomeUI;
  v3 = -[UITableViewCellAccessibility__UIKit__HomeUI accessibilityTraits](&v7, sel_accessibilityTraits);
  if ((*MEMORY[0x24BDF7400] & ~v3) == 0
    && -[UITableViewCellAccessibility__UIKit__HomeUI accessoryType](self, "accessoryType") == 3)
  {
    -[UITableViewCellAccessibility__UIKit__HomeUI accessoryView](self, "accessoryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "accessibilityElementsHidden");

    if (v5)
      return _AXTraitsRemoveTrait();
  }
  return v3;
}

@end
