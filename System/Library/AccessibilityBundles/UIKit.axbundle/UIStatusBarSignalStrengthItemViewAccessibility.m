@implementation UIStatusBarSignalStrengthItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarSignalStrengthItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  void *v10;
  id v11;
  id v12;
  unsigned int v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20[2];
  UIStatusBarSignalStrengthItemViewAccessibility *v21;

  v21 = self;
  v20[1] = (id)a2;
  v20[0] = 0;
  v18 = (id)-[UIStatusBarSignalStrengthItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_showRSSI"));
  v19 = objc_msgSend(v18, "BOOLValue");

  if ((v19 & 1) != 0)
  {
    v14 = (id)-[UIStatusBarSignalStrengthItemViewAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("_signalStrengthRaw"));
    objc_msgSend(v14, "intValue");

    v15 = (void *)MEMORY[0x24BDD17C8];
    v17 = accessibilityLocalizedString(CFSTR("status.signal.rssi"));
    v16 = (id)AXFormatInteger();
    v2 = (id)objc_msgSend(v15, "stringWithFormat:", v17, v16);
    v3 = v20[0];
    v20[0] = v2;

  }
  else
  {
    v12 = (id)-[UIStatusBarSignalStrengthItemViewAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("_signalStrengthBars"));
    v13 = objc_msgSend(v12, "intValue");

    if (v13)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      v11 = accessibilityLocalizedString(CFSTR("status.signal.bars"));
      v6 = (id)objc_msgSend(v10, "localizedStringWithFormat:", v13, 4);
      v7 = v20[0];
      v20[0] = v6;

    }
    else
    {
      v4 = accessibilityLocalizedString(CFSTR("status.signal.no.signal"));
      v5 = v20[0];
      v20[0] = v4;

    }
  }
  v9 = v20[0];
  objc_storeStrong(v20, 0);
  return v9;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarSignalStrengthItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarSignalStrengthItemViewAccessibility;
  return -[UIStatusBarSignalStrengthItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
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
  UIStatusBarSignalStrengthItemViewAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v5 = (id)-[UIStatusBarSignalStrengthItemViewAccessibility safeValueForKey:](v14, "safeValueForKey:");
  v6 = objc_msgSend(v5, "BOOLValue");

  v11 = v6 & 1;
  v10.receiver = v14;
  v10.super_class = (Class)UIStatusBarSignalStrengthItemViewAccessibility;
  -[UIStatusBarSignalStrengthItemViewAccessibility touchesEnded:withEvent:](&v10, sel_touchesEnded_withEvent_, location[0], v12);
  v7 = v11 & 1;
  v8 = (id)-[UIStatusBarSignalStrengthItemViewAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_showRSSI"));
  v9 = v7 == (objc_msgSend(v8, "BOOLValue") & 1);

  if (!v9)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

@end
