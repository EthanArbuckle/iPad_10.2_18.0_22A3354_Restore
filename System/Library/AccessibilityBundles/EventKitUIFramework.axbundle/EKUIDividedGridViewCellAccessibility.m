@implementation EKUIDividedGridViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKUIDividedGridViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKUIDividedGridViewCell"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("canBecomeFocused"), "B", 0);

}

- (BOOL)canBecomeFocused
{
  objc_super v4;

  if ((-[EKUIDividedGridViewCellAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 1;
  v4.receiver = self;
  v4.super_class = (Class)EKUIDividedGridViewCellAccessibility;
  return -[EKUIDividedGridViewCellAccessibility canBecomeFocused](&v4, sel_canBecomeFocused);
}

@end
