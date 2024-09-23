@implementation SRCompactTextRequestViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SRCompactTextRequestViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SRCompactTextRequestViewControllerAccessibility;
  -[SRCompactTextRequestViewControllerAccessibility viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  v4 = *MEMORY[0x24BDF7328];
  -[SRCompactTextRequestViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textRequestView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_textField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v6);

}

@end
