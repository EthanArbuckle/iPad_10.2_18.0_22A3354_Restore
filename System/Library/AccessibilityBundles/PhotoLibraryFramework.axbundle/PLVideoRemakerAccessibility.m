@implementation PLVideoRemakerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLVideoRemaker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PLVideoRemakerAccessibility;
  -[PLVideoRemakerAccessibility cancel](&v2, sel_cancel);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_didEndRemakingWithTemporaryPath:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLVideoRemakerAccessibility;
  -[PLVideoRemakerAccessibility _didEndRemakingWithTemporaryPath:](&v3, sel__didEndRemakingWithTemporaryPath_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
