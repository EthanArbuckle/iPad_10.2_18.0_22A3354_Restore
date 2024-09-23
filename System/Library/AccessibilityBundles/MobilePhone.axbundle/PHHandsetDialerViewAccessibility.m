@implementation PHHandsetDialerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHHandsetDialerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHHandsetDialerView"), CFSTR("setDeleteButtonAlpha:"), "v", "d", 0);
}

- (void)setDeleteButtonAlpha:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHHandsetDialerViewAccessibility;
  -[PHHandsetDialerViewAccessibility setDeleteButtonAlpha:](&v3, sel_setDeleteButtonAlpha_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
