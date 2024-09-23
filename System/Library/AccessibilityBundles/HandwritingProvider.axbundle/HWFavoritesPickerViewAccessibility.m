@implementation HWFavoritesPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HWFavoritesPickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWFavoritesPickerView"), CFSTR("setEditing: animated:"), "v", "B", "B", 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HWFavoritesPickerViewAccessibility;
  -[HWFavoritesPickerViewAccessibility setEditing:animated:](&v4, sel_setEditing_animated_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
