@implementation STSetupAssistantPosedDeviceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STSetupAssistantPosedDeviceViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("STSetupAssistantPosedDeviceViewController"), CFSTR("UIViewController"));
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSetupAssistantPosedDeviceViewControllerAccessibility;
  -[STSetupAssistantPosedDeviceViewControllerAccessibility viewDidLoad](&v6, sel_viewDidLoad);
  -[STSetupAssistantPosedDeviceViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXLocStringKeyForModel();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityRespondsToUserInteraction:", 0);
  objc_msgSend(v3, "_accessibilitySetUserDefinedMediaAnalysisOptions:", &unk_25033A928);

}

@end
