@implementation STUIStatusBarWifiSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarWifiSignalView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarWifiSignalViewAccessibility;
  -[STUIStatusBarWifiSignalViewAccessibility accessibilityValue](&v6, sel_accessibilityValue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithString:", CFSTR("SSID"));
  objc_msgSend(v3, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC38]);
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilitySignalStrengthText
{
  objc_super v2;

  if (a1)
  {
    v2.receiver = a1;
    v2.super_class = (Class)STUIStatusBarWifiSignalViewAccessibility;
    objc_msgSendSuper2(&v2, sel_accessibilityValue);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

@end
