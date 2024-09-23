@implementation TPSimpleNumberPadAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPSimpleNumberPad");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSimpleNumberPad"), CFSTR("_updateDeleteButton"), "v", 0);
}

- (void)_updateDeleteButton
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TPSimpleNumberPadAccessibility;
  -[TPSimpleNumberPadAccessibility _updateDeleteButton](&v2, sel__updateDeleteButton);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
