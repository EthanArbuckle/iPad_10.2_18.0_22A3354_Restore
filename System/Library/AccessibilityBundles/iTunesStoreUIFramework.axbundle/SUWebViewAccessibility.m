@implementation SUWebViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUWebView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySUWebViewIsScrollAncestor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  objc_super v10;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SUClientController")), "safeValueForKey:", CFSTR("sharedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUTabBarController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("overlayBackgroundViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SUOverlayBackgroundViewController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "safeValueForKey:", CFSTR("_viewControllers"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 > 1)
      {

        v8 = 1;
        goto LABEL_6;
      }
    }

  }
  v10.receiver = self;
  v10.super_class = (Class)SUWebViewAccessibility;
  v8 = -[SUWebViewAccessibility _accessibilityIsScrollAncestor](&v10, sel__accessibilityIsScrollAncestor);
LABEL_6:

  return v8;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("key");
  v8[1] = CFSTR("direction");
  v9[0] = CFSTR("scroll");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("AXActionForWebNotification"), 0, v6);

  return 0;
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("AXActionForWebNotification"), 0, &unk_2503F6DF0);

  return 0;
}

- (BOOL)accessibilityScrollRightPage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SUClientController")), "safeValueForKey:", CFSTR("sharedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUTabBarController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v4, "safeValueForKey:", CFSTR("overlayBackgroundViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUOverlayBackgroundViewController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:

LABEL_6:
    v19.receiver = self;
    v19.super_class = (Class)SUWebViewAccessibility;
    v8 = -[SUWebViewAccessibility accessibilityScrollRightPage](&v19, sel_accessibilityScrollRightPage);
    goto LABEL_7;
  }
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_viewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 < 2)
  {

    goto LABEL_5;
  }
  v10 = v7;
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_selectedViewControllerIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v6, "objectAtIndex:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissOverlay:animated:", v13, 1);

  if (v10 == 2)
  {
    v14 = &stru_2503F39E0;
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("scroll.popup.summary"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v17, v18);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], v14);

  v8 = 1;
LABEL_7:

  return v8;
}

@end
