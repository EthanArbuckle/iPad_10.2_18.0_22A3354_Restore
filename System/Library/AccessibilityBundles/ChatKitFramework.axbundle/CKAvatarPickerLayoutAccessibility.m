@implementation CKAvatarPickerLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAvatarPickerLayout");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarPickerLayout"), CFSTR("prepareLayout"), "v", 0);
}

- (void)prepareLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKAvatarPickerLayoutAccessibility;
  -[CKAvatarPickerLayoutAccessibility prepareLayout](&v2, sel_prepareLayout);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
