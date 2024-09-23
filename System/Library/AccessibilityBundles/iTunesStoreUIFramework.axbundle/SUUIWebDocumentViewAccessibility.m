@implementation SUUIWebDocumentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebDocumentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityScrollRightPage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  -[SUUIWebDocumentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scroller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityContentSize");
  v5 = v4;
  objc_msgSend(v3, "visibleBounds");
  if (v3 && v5 != v6)
    goto LABEL_9;
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SUClientController")), "safeValueForKey:", CFSTR("sharedController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("rootViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUTabBarController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:

LABEL_9:
    v23.receiver = self;
    v23.super_class = (Class)SUUIWebDocumentViewAccessibility;
    v12 = -[SUUIWebDocumentViewAccessibility accessibilityScrollRightPage](&v23, sel_accessibilityScrollRightPage);
    goto LABEL_10;
  }
  objc_msgSend(v8, "safeValueForKey:", CFSTR("overlayBackgroundViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUOverlayBackgroundViewController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v9, "safeValueForKey:", CFSTR("_viewControllers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11 < 2)
  {

    goto LABEL_7;
  }
  v14 = v11;
  objc_msgSend(v9, "safeValueForKey:", CFSTR("_selectedViewControllerIndex"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend(v10, "objectAtIndex:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismissOverlay:animated:", v17, 1);

  if (v14 == 2)
  {
    v18 = &stru_2503F39E0;
  }
  else
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("scroll.popup.summary"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v20, v21, v22);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], v18);

  v12 = 1;
LABEL_10:

  return v12;
}

@end
