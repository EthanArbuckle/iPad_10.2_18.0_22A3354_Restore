@implementation PreviousDraftPickerControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PreviousDraftPickerController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PreviousDraftPickerControllerAccessibility;
  -[PreviousDraftPickerControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
