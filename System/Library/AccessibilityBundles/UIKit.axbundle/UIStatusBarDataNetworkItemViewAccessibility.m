@implementation UIStatusBarDataNetworkItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarDataNetworkItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  id v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithString:", CFSTR("SSID"));
  objc_msgSend(v4[0], "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC38]);
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (id)accessibilityLabel
{
  __CFString *v2;
  id v3;
  id v4;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15[2];
  UIStatusBarDataNetworkItemViewAccessibility *v16;

  v16 = self;
  v15[1] = (id)a2;
  v15[0] = 0;
  v13 = (id)-[UIStatusBarDataNetworkItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_showRSSI"));
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v14 & 1) != 0)
  {
    v9 = (id)-[UIStatusBarDataNetworkItemViewAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("_wifiStrengthRaw"));
    objc_msgSend(v9, "intValue");

    v10 = (void *)MEMORY[0x24BDD17C8];
    if (-[UIStatusBarDataNetworkItemViewAccessibility isWLAN](v16, "isWLAN"))
      v2 = CFSTR("status.network.wlan.rssi.strength");
    else
      v2 = CFSTR("status.network.wifi.rssi.strength");
    v12 = accessibilityLocalizedString(v2);
    v11 = (id)AXFormatInteger();
    v3 = (id)objc_msgSend(v10, "stringWithFormat:", v12, v11);
    v4 = v15[0];
    v15[0] = v3;

  }
  else
  {
    v7 = (id)-[UIStatusBarDataNetworkItemViewAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("_dataNetworkType"));
    v8 = objc_msgSend(v7, "intValue");

    if (v8 <= 8uLL)
      __asm { BR              X8 }
    _AXAssert();
  }
  v6 = v15[0];
  objc_storeStrong(v15, 0);
  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarDataNetworkItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarDataNetworkItemViewAccessibility;
  return -[UIStatusBarDataNetworkItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  char v6;
  int v7;
  id v8;
  BOOL v9;
  objc_super v10;
  char v11;
  id v12;
  id location[2];
  UIStatusBarDataNetworkItemViewAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v5 = (id)-[UIStatusBarDataNetworkItemViewAccessibility safeValueForKey:](v14, "safeValueForKey:");
  v6 = objc_msgSend(v5, "BOOLValue");

  v11 = v6 & 1;
  v10.receiver = v14;
  v10.super_class = (Class)UIStatusBarDataNetworkItemViewAccessibility;
  -[UIStatusBarDataNetworkItemViewAccessibility touchesEnded:withEvent:](&v10, sel_touchesEnded_withEvent_, location[0], v12);
  v7 = v11 & 1;
  v8 = (id)-[UIStatusBarDataNetworkItemViewAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_showRSSI"));
  v9 = v7 == (objc_msgSend(v8, "BOOLValue") & 1);

  if (!v9)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isWLAN
{
  id v2;
  void *v3;
  id *location;
  char v6;
  void *v7;
  _BYTE v8[9];
  SEL v9;
  UIStatusBarDataNetworkItemViewAccessibility *v10;

  v10 = self;
  v9 = a2;
  *(_QWORD *)&v8[1] = (id)-[UIStatusBarDataNetworkItemViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("axIsWLAN"));
  if (!*(_QWORD *)&v8[1])
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    *(_QWORD *)v8 = MGGetBoolAnswer() & 1;
    v2 = (id)objc_msgSend(v7, "numberWithBool:", *(_QWORD *)v8);
    v3 = *(void **)&v8[1];
    *(_QWORD *)&v8[1] = v2;

    -[UIStatusBarDataNetworkItemViewAccessibility _accessibilitySetRetainedValue:forKey:](v10, "_accessibilitySetRetainedValue:forKey:", *(_QWORD *)&v8[1], CFSTR("axIsWLAN"));
  }
  v6 = objc_msgSend(*(id *)&v8[1], "BOOLValue", &v8[1]);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

@end
