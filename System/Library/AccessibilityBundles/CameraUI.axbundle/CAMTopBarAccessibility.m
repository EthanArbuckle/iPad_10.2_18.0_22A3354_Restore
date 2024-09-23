@implementation CAMTopBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMTopBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (void)expandMenuButton:(id)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMTopBarAccessibility;
  -[CAMTopBarAccessibility expandMenuButton:animated:](&v4, sel_expandMenuButton_animated_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)collapseMenuButton:(id)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMTopBarAccessibility;
  -[CAMTopBarAccessibility collapseMenuButton:animated:](&v4, sel_collapseMenuButton_animated_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
