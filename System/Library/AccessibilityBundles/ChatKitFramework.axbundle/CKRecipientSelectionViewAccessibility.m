@implementation CKRecipientSelectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKRecipientSelectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CKRecipientSelectionView"), CFSTR("UIView"));
}

- (void)setFrame:(CGRect)a3
{
  double y;
  objc_super v5;

  y = a3.origin.y;
  v5.receiver = self;
  v5.super_class = (Class)CKRecipientSelectionViewAccessibility;
  -[CKRecipientSelectionViewAccessibility setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CKRecipientSelectionViewAccessibility setAccessibilityElementsHidden:](self, "setAccessibilityElementsHidden:", y < 0.0);
}

@end
