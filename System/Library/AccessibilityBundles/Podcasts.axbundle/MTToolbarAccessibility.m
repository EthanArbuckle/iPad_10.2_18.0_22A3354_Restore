@implementation MTToolbarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTToolbar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  objc_super v4;

  if ((-[MTToolbarAccessibility _accessibilityHasDescendantOfType:](self, "_accessibilityHasDescendantOfType:", objc_opt_class()) & 1) != 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)MTToolbarAccessibility;
  return -[MTToolbarAccessibility shouldGroupAccessibilityChildren](&v4, sel_shouldGroupAccessibilityChildren);
}

@end
