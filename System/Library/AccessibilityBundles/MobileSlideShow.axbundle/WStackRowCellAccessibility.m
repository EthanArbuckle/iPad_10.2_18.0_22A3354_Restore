@implementation WStackRowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WStackRowCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAlwaysReturnsChild
{
  return 0;
}

- (void)_addLabel:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WStackRowCellAccessibility;
  v3 = a3;
  -[WStackRowCellAccessibility _addLabel:](&v4, sel__addLabel_, v3);
  objc_msgSend(v3, "setIsAccessibilityElement:", 0, v4.receiver, v4.super_class);

}

@end
