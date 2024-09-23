@implementation _UIStatusBarCellularSignalViewAcessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarCellularSignalView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarDualCellularSignalView"));
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  int v15;
  id location[2];
  _UIStatusBarCellularSignalViewAcessibility *v17;
  id v18;

  v17 = self;
  location[1] = (id)a2;
  v13 = (id)-[_UIStatusBarCellularSignalViewAcessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIStatusBarDualCellularSignalView")));

  if (!v13
    || ((location[0] = (id)-[_UIStatusBarCellularSignalViewAcessibility _accessibilityValueForKey:](v17, "_accessibilityValueForKey:", CFSTR("AXStatusBarSignalViewServiceKey"))) == 0? (v15 = 0): (v18 = location[0], v15 = 1), objc_storeStrong(location, 0), !v15))
  {
    v11 = (void *)MEMORY[0x24BDFEA60];
    v12 = accessibilityLocalizedString(CFSTR("status.cellular.service"));
    v14 = (id)objc_msgSend(v11, "axAttributedStringWithString:");

    if ((-[_UIStatusBarCellularSignalViewAcessibility _accessibilityBoolValueForKey:](v17, "_accessibilityBoolValueForKey:", CFSTR("PrimaryCellular")) & 1) != 0)
    {
      v9 = (void *)MEMORY[0x24BDFEA60];
      v10 = accessibilityLocalizedString(CFSTR("primary.cellular"));
      v2 = (id)objc_msgSend(v9, "axAttributedStringWithString:");
      v3 = v14;
      v14 = v2;

      objc_msgSend(v14, "setAttribute:forKey:", CFSTR("Primary"), *MEMORY[0x24BDFEC30]);
    }
    else if ((-[_UIStatusBarCellularSignalViewAcessibility _accessibilityBoolValueForKey:](v17, "_accessibilityBoolValueForKey:", CFSTR("SecondaryCellular")) & 1) != 0)
    {
      v7 = (void *)MEMORY[0x24BDFEA60];
      v8 = accessibilityLocalizedString(CFSTR("secondary.cellular"));
      v4 = (id)objc_msgSend(v7, "axAttributedStringWithString:");
      v5 = v14;
      v14 = v4;

      objc_msgSend(v14, "setAttribute:forKey:", CFSTR("Secondary"), *MEMORY[0x24BDFEC30]);
    }
    v18 = v14;
    v15 = 1;
    objc_storeStrong(&v14, 0);
  }
  return v18;
}

@end
