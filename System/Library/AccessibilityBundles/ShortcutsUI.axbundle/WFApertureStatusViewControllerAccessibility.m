@implementation WFApertureStatusViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFApertureStatusViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFApertureStatusViewController"), CFSTR("leadingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFApertureStatusViewController"), CFSTR("minimalView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFApertureStatusViewController"), CFSTR("attribution"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFApertureStatusViewController"), CFSTR("progressView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFProgressAccessoryView"), CFSTR("cancelButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFDialogAttribution"), CFSTR("title"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WFApertureStatusViewControllerAccessibility;
  -[WFApertureStatusViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  -[WFApertureStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attribution"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFApertureStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leadingView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("running.shortcut"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v7, v4, CFSTR("__AXStringForVariablesSentinel"));

  -[WFApertureStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minimalView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("running.shortcut"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v10, v4, CFSTR("__AXStringForVariablesSentinel"));

  -[WFApertureStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("progressView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("cancelButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("cancel.shortcut"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v13);

}

@end
