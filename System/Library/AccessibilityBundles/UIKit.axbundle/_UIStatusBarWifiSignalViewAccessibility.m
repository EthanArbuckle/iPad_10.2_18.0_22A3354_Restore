@implementation _UIStatusBarWifiSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarWifiSignalView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySignalStrengthText
{
  objc_super v2;
  void *v3;
  id v4;

  v3 = a1;
  if (a1)
  {
    v2.receiver = v3;
    v2.super_class = (Class)_UIStatusBarWifiSignalViewAccessibility;
    v4 = objc_msgSendSuper2(&v2, sel_accessibilityValue);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)accessibilityValue
{
  id v3;
  id v4;
  objc_super v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarWifiSignalViewAccessibility;
  v6[0] = -[_UIStatusBarWifiSignalViewAccessibility accessibilityValue](&v5, sel_accessibilityValue);
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithString:", CFSTR("SSID"));
  objc_msgSend(v4, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC38]);
  v3 = (id)__UIAXStringForVariables();
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v6, 0);
  return v3;
}

- (id)accessibilityIdentifier
{
  return -[_UIStatusBarWifiSignalViewAccessibility _accessibilitySignalStrengthText](self);
}

@end
