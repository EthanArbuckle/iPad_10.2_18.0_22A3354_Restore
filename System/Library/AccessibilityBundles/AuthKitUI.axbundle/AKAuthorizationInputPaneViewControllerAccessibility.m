@implementation AKAuthorizationInputPaneViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKAuthorizationInputPaneViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAuthorizationInputPaneViewController"), CFSTR("_clearButton"), "@", 0);
}

- (id)_clearButton
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationInputPaneViewControllerAccessibility;
  -[AKAuthorizationInputPaneViewControllerAccessibility _clearButton](&v4, sel__clearButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setAccessibilityLabelBlock:", &__block_literal_global);
  return v2;
}

id __67__AKAuthorizationInputPaneViewControllerAccessibility__clearButton__block_invoke()
{
  return accessibilityLocalizedString(CFSTR("clear.button"));
}

@end
