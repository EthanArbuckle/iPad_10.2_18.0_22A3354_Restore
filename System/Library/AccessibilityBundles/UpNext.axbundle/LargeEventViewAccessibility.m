@implementation LargeEventViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UpNext.LargeEventView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UpNext.LargeEventView"), CFSTR("layoutSubviews"), "v", 0);
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)LargeEventViewAccessibility;
  -[LargeEventViewAccessibility layoutSubviews](&v2, sel_layoutSubviews);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
