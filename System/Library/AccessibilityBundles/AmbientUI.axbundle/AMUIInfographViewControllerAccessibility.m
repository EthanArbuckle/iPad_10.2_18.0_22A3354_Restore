@implementation AMUIInfographViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AMUIInfographViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AMUIInfographViewController"), CFSTR("launchConfirmationView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AMUIInfographViewController"), CFSTR("_showLaunchConfirmationForApplicationWithBundleIdentifier:withActions:iconView:"), "v", "@", "@", "@", 0);

}

- (void)_showLaunchConfirmationForApplicationWithBundleIdentifier:(id)a3 withActions:(id)a4 iconView:(id)a5
{
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)AMUIInfographViewControllerAccessibility;
  -[AMUIInfographViewControllerAccessibility _showLaunchConfirmationForApplicationWithBundleIdentifier:withActions:iconView:](&v12, sel__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView_, a3, a4, v8);
  if (v8)
  {
    -[AMUIInfographViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("launchConfirmationView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsAccessibilityElementBlock:", &__block_literal_global_0);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __123__AMUIInfographViewControllerAccessibility__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_2;
    v10[3] = &unk_25014BF78;
    v11 = v8;
    objc_msgSend(v9, "setAccessibilityLabelBlock:", v10);

  }
}

uint64_t __123__AMUIInfographViewControllerAccessibility__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke()
{
  return 1;
}

id __123__AMUIInfographViewControllerAccessibility__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("widget.launched"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessibilityLabel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_25014C0D8;
  if (v4)
    v6 = (const __CFString *)v4;
  objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
