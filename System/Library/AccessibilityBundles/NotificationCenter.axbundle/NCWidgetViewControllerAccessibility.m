@implementation NCWidgetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_NCWidgetViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_NCWidgetViewController"), CFSTR("_setActiveDisplayMode: unconditionallyNotifyingContentProvidingViewController:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_NCWidgetViewController"), CFSTR("_widgetExtensionContext"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_NCWidgetExtensionContext"), CFSTR("_activeDisplayMode"), "q", 0);

}

- (void)_setActiveDisplayMode:(int64_t)a3 unconditionallyNotifyingContentProvidingViewController:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a4;
  -[NCWidgetViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_widgetExtensionContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safeIntegerForKey:", CFSTR("_activeDisplayMode"));
  v9.receiver = self;
  v9.super_class = (Class)NCWidgetViewControllerAccessibility;
  -[NCWidgetViewControllerAccessibility _setActiveDisplayMode:unconditionallyNotifyingContentProvidingViewController:](&v9, sel__setActiveDisplayMode_unconditionallyNotifyingContentProvidingViewController_, a3, v4);
  if (v4 || v8 != a3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
