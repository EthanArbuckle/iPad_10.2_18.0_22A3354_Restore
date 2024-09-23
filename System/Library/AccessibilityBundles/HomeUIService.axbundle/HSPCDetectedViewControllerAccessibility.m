@implementation HSPCDetectedViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HSPCDetectedViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HSPCCameraScanViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HSPCDetectedViewControllerAccessibility;
  -[HSPCDetectedViewControllerAccessibility viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  v3 = (void *)MEMORY[0x24BDFEA60];
  accessibilityLocalizedString(CFSTR("camera.scan.discovered.accessory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAttribute:forKey:", &unk_250243B40, *MEMORY[0x24BDFEAD8]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);

}

@end
