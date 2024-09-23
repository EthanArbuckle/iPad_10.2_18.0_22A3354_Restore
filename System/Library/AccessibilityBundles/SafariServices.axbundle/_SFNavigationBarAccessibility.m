@implementation _SFNavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFNavigationBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_SFDimmingButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_SFNavigationBar"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_reloadButton"), "_SFDimmingButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_stopButton"), "_SFDimmingButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_formatToggleButton"), "SFNavigationBarToggleButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_URLOutline"), "_SFNavigationBarURLButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_compressedBarButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_cancelButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_item"), "SFNavigationBarItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_securityAnnotationLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_lockView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("_SFNavigationBarDelegate"), CFSTR("navigationBarReaderButtonWasTapped:"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("_updateText"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("_updateShowsLockIcon"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFNavigationBarItem"), CFSTR("showsLockIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("_updateAvailabilityButtonVisibilityForType:animated: showAvailabilityText:adjustURLLabels:"), "v", "q", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_item"), "SFNavigationBarItem");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFNavigationBarItem"), CFSTR("showsReaderButton"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFNavigationBarItem"), CFSTR("showsSecurityAnnotation"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("_formatToggleButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("_compressedBarTapped"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("setExpanded:textFieldSelectionRange:"), "v", "B", "{_NSRange=QQ}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("fluidProgressViewDidShowProgress:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_inputMode"), "Q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFNavigationBar"), CFSTR("_updateSecurityWarningsVisibility"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFBrowserContentViewController"), CFSTR("_showingReader"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFBrowserContentViewController"), CFSTR("webViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFReaderEnabledWebViewController"), CFSTR("readerController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFReaderController"), CFSTR("isReaderAvailable"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SFNavigationBarItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFNavigationBarItem"), CFSTR("showsSecurityAnnotation"), "B", 0);
  if (AXProcessIsSafari())
  {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("isShowingReader"), "B", 0);
    objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserController"), CFSTR("_tabController"), "TabController");
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabController"), CFSTR("activeTabDocument"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("readerContext"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("prepareToUseReader"), "v", 0);
  }

}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)_accessibilitySortPriority
{
  objc_super v4;

  if (AXDeviceIsPhoneIdiom())
    return 1000;
  v4.receiver = self;
  v4.super_class = (Class)_SFNavigationBarAccessibility;
  return -[_SFNavigationBarAccessibility _accessibilitySortPriority](&v4, sel__accessibilitySortPriority);
}

- (void)_formatToggleButtonTapped:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFNavigationBarAccessibility;
  -[_SFNavigationBarAccessibility _formatToggleButtonTapped:](&v3, sel__formatToggleButtonTapped_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_updateSecurityWarningsVisibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFNavigationBarAccessibility;
  -[_SFNavigationBarAccessibility _updateSecurityWarningsVisibility](&v7, sel__updateSecurityWarningsVisibility);
  -[_SFNavigationBarAccessibility _axUpdateURLValue](self, "_axUpdateURLValue");
  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("showsSecurityAnnotation")))
  {
    v4 = (void *)MEMORY[0x24BDFEA60];
    accessibilitySafariServicesLocalizedString(CFSTR("website.not.secure"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axAttributedStringWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v6);

  }
}

- (void)fluidProgressViewDidShowProgress:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_SFNavigationBarAccessibility;
  -[_SFNavigationBarAccessibility fluidProgressViewDidShowProgress:](&v5, sel_fluidProgressViewDidShowProgress_, v4);
  if (objc_msgSend(v4, "_accessibilityBoolValueForKey:", CFSTR("StartedFluidProgress")))
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB1F8], &unk_250331A80);
    objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("StartedFluidProgress"));
  }

}

- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFNavigationBarAccessibility;
  -[_SFNavigationBarAccessibility setExpanded:textFieldSelectionRange:](&v5, sel_setExpanded_textFieldSelectionRange_, a3, a4.location, a4.length);
  -[_SFNavigationBarAccessibility _axUpdateCancelButton](self, "_axUpdateCancelButton");
  -[_SFNavigationBarAccessibility _axUpdateTextFields](self, "_axUpdateTextFields");
}

- (BOOL)_accessibilityAutoReaderAction:(id)a3
{
  AXPerformSafeBlock();
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_SFNavigationBarAccessibility;
  -[_SFNavigationBarAccessibility _accessibilityLoadAccessibilityInformation](&v24, sel__accessibilityLoadAccessibilityInformation);
  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_reloadButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("button.reload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_reloadButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("ReloadButton"));

  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_stopButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("button.stop"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_stopButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("StopButton"));

  LOBYTE(location) = 0;
  objc_opt_class();
  -[_SFNavigationBarAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_formatToggleButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilitySafariServicesLocalizedString(CFSTR("format.options.button"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v11);

  objc_msgSend(v10, "_setAccessibilityIsNotFirstElement:", 1);
  accessibilitySafariServicesLocalizedString(CFSTR("format.options.button.hint"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityHint:", v12);

  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __75___SFNavigationBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v21[3] = &unk_25032D638;
  objc_copyWeak(&v22, &location);
  v21[4] = self;
  objc_msgSend(v10, "_setAccessibilityCustomActionsBlock:", v21);
  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_URLLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIsAccessibilityElement:", 0);

  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_URLOutline"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIsAccessibilityElement:", 1);

  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_URLOutline"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("address.text"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityLabel:", v16);

  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_URLOutline"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("URL"));

  -[_SFNavigationBarAccessibility _axUpdateURLValue](self, "_axUpdateURLValue");
  -[_SFNavigationBarAccessibility _axUpdateCancelButton](self, "_axUpdateCancelButton");
  -[_SFNavigationBarAccessibility _axUpdateTextFields](self, "_axUpdateTextFields");
  if (-[_SFNavigationBarAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_inputMode")) != 1)
  {
    if (AXDeviceIsPhoneIdiom())
    {
      -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_compressedBarButton"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_URLOutline"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        accessibilitySafariServicesLocalizedString(CFSTR("addressbar.minimized.hint"));
      else
        accessibilitySafariServicesLocalizedString(CFSTR("addressbar.hint"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAccessibilityHint:", v20);
    }
    else
    {
      -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_URLOutline"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilitySafariServicesLocalizedString(CFSTR("addressbar.hint"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAccessibilityHint:", v20);
    }

  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)_axUpdateCancelButton
{
  int v3;
  id v4;

  v3 = -[_SFNavigationBarAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"));
  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cancelButton"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityElementsHidden:", v3 ^ 1u);

}

- (void)_axUpdateTextFields
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = -[_SFNavigationBarAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"));
  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_URLOutline"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", v3 ^ 1);

  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textField"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", v3);

}

- (void)_axUpdateURLValue
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[_SFNavigationBarAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_URLOutline"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50___SFNavigationBarAccessibility__axUpdateURLValue__block_invoke;
  v4[3] = &unk_25032D660;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v4);
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  objc_super v40;
  char v41;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_opt_class();
  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_reloadButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:toView:", v9, x, y);
  v12 = v11;
  v14 = v13;

  if (!objc_msgSend(v9, "pointInside:withEvent:", v7, v12, v14)
    || !objc_msgSend(v9, "_accessibilityViewIsVisible"))
  {
    objc_opt_class();
    -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_stopButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertPoint:toView:", v17, x, y);
    v20 = v19;
    v22 = v21;

    if (objc_msgSend(v17, "pointInside:withEvent:", v7, v20, v22)
      && objc_msgSend(v17, "_accessibilityViewIsVisible"))
    {
      v15 = v17;
LABEL_21:

      goto LABEL_22;
    }
    -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textField"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "convertPoint:toView:", v23, x, y);
    v26 = v25;
    v28 = v27;

    if (objc_msgSend(v23, "pointInside:withEvent:", v7, v26, v28))
    {
      objc_msgSend(v23, "_accessibilityHitTest:withEvent:", v7, v26, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29 && objc_msgSend(v29, "isAccessibilityElement"))
      {
        v30 = v30;
        v15 = v30;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v30 = 0;
    }
    -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_URLOutline"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "convertPoint:toView:", v31, x, y);
    v34 = v33;
    v36 = v35;

    if (objc_msgSend(v31, "pointInside:withEvent:", v7, v34, v36))
    {
      objc_msgSend(v31, "_accessibilityHitTest:withEvent:", v7, v34, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        if (objc_msgSend(v37, "isAccessibilityElement"))
        {
          v38 = v37;
          v30 = v38;
LABEL_19:
          v15 = v38;

          goto LABEL_20;
        }
        v30 = v37;
      }
      else
      {
        v30 = 0;
      }
    }
    v40.receiver = self;
    v40.super_class = (Class)_SFNavigationBarAccessibility;
    -[_SFNavigationBarAccessibility _accessibilityHitTest:withEvent:](&v40, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v15 = v9;
LABEL_22:

  return v15;
}

- (void)_updateText
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFNavigationBarAccessibility;
  -[_SFNavigationBarAccessibility _updateText](&v3, sel__updateText);
  -[_SFNavigationBarAccessibility _axUpdateURLValue](self, "_axUpdateURLValue");
}

- (void)_updateShowsLockIcon
{
  void *v3;
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFNavigationBarAccessibility;
  -[_SFNavigationBarAccessibility _updateShowsLockIcon](&v8, sel__updateShowsLockIcon);
  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lockView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("lockView"));
  -[_SFNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_item"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("showsLockIcon"));

  if (v5)
    v6 = CFSTR("secure.validated.icon");
  else
    v6 = CFSTR("secure.icon");
  accessibilitySafariServicesLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v7);

  -[_SFNavigationBarAccessibility _axUpdateURLValue](self, "_axUpdateURLValue");
}

- (void)_compressedBarTapped
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_SFNavigationBarAccessibility;
  -[_SFNavigationBarAccessibility _compressedBarTapped](&v2, sel__compressedBarTapped);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFNavigationBarAccessibility;
  -[_SFNavigationBarAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[_SFNavigationBarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (_SFNavigationBarAccessibility)initWithFrame:(CGRect)a3
{
  _SFNavigationBarAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFNavigationBarAccessibility;
  v3 = -[_SFNavigationBarAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_SFNavigationBarAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
