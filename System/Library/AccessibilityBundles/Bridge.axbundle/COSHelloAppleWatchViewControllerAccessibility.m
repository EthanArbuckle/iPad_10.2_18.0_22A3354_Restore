@implementation COSHelloAppleWatchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSHelloAppleWatchViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("COSHelloAppleWatchViewController"), CFSTR("BPSWelcomeOptinViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BPSWelcomeOptinViewController"), CFSTR("okayButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)COSHelloAppleWatchViewControllerAccessibility;
  -[COSHelloAppleWatchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[COSHelloAppleWatchViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("okayButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("GoToBridgeButton"));
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    accessibilityLocalizedString(CFSTR("go.to.bridge"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v6);

  }
}

@end
