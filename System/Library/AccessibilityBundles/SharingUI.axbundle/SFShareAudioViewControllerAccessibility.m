@implementation SFShareAudioViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFShareAudioViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SFShareAudioViewController"), CFSTR("UIViewController"));
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFShareAudioViewControllerAccessibility;
  -[SFShareAudioViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
