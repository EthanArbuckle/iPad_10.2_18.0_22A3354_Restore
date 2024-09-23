@implementation TVRUIRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVRUIRemoteViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIRemoteViewController"), CFSTR("devicePickerViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIRemoteViewController"), CFSTR("touchpadViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIRemoteViewController"), CFSTR("activeDevice"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIRemoteViewController"), CFSTR("messageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRMessageView"), CFSTR("currentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIRemoteViewController"), CFSTR("showLoadingSpinner"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIRemoteViewController"), CFSTR("showSearchingSpinner"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIRemoteViewController"), CFSTR("clearMessageContent"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIRemoteViewController"), CFSTR("tapToRadarButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIRemoteViewController"), CFSTR("messageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUITouchpadViewController"), CFSTR("touchpadView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIDevicePickerViewController"), CFSTR("titleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIDevicePickerViewController"), CFSTR("titleButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIDevicePickerViewController"), CFSTR("isDevicePickerShowing"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TVRUITouchpadViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIHintsViewController"), CFSTR("allowSiriHint"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIHintsViewController"), CFSTR("allowVolumeHint"), "B", 0);
  if (NSClassFromString(CFSTR("TVRemoteViewController")))
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRemoteViewController"), CFSTR("hintsViewController"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id from;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)TVRUIRemoteViewControllerAccessibility;
  -[TVRUIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v24, sel__accessibilityLoadAccessibilityInformation);
  -[TVRUIRemoteViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("devicePickerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("titleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRUIRemoteViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("touchpadViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeUIViewForKey:", CFSTR("touchpadView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v18[3] = &unk_2503ADD00;
  objc_copyWeak(&v20, &from);
  v8 = v4;
  v19 = v8;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v6, "_setAccessibilityFrameBlock:", v18);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v16[3] = &unk_2503ADCD8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v6, "_setIsAccessibilityElementBlock:", v16);
  -[TVRUIRemoteViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tapToRadarButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", CFSTR("Tap to Radar"));

  -[TVRUIRemoteViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("devicePickerViewController.titleButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewControllerAccessibility _axButtonHintText](self, "_axButtonHintText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityHint:", v11);

  -[TVRUIRemoteViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_messageView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeUIViewForKey:", CFSTR("currentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v14[3] = &unk_2503ADCB0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v13, "_setAccessibilityLabelBlock:", v14);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

double __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  id WeakRetained;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  id v11;
  void *v12;
  UIView *v13;
  double v14;
  CGRect v16;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "frame");
  objc_msgSend(a1[4], "frame");
  AX_CGRectBySubtractingRect();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v11, "safeValueForKey:", CFSTR("touchpadViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeUIViewForKey:", CFSTR("view"));
  v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  *(_QWORD *)&v14 = (unint64_t)UIAccessibilityConvertFrameToScreenCoordinates(v16, v13);

  return v14;
}

uint64_t __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("devicePickerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isDevicePickerShowing")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "safeValueForKey:", CFSTR("activeDevice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_loadWeakRetained(v1);
      objc_msgSend(v7, "safeValueForKey:", CFSTR("_messageView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeValueForKey:", CFSTR("currentView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v9, "_accessibilityViewIsVisible") ^ 1;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

id __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_messageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("currentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349220C4]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __84__TVRUIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  NSClassFromString(CFSTR("UILabel"));
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "isAccessibilityElement"))
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

- (id)_axHintsViewController
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("hintsViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_axSiriHintEnabled
{
  void *v2;
  char v3;

  -[TVRUIRemoteViewControllerAccessibility _axHintsViewController](self, "_axHintsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("allowSiriHint"));

  return v3;
}

- (BOOL)_axVolumeHintEnabled
{
  void *v2;
  char v3;

  -[TVRUIRemoteViewControllerAccessibility _axHintsViewController](self, "_axHintsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("allowVolumeHint"));

  return v3;
}

- (id)_axButtonHintText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TVRUIRemoteViewControllerAccessibility _axSiriHintEnabled](self, "_axSiriHintEnabled"))
  {
    accessibilityLocalizedString(CFSTR("tv.remote.hint.siri.text"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (-[TVRUIRemoteViewControllerAccessibility _axVolumeHintEnabled](self, "_axVolumeHintEnabled"))
  {
    accessibilityLocalizedString(CFSTR("tv.remote.hint.volume.text"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  MEMORY[0x2349220C4](v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIRemoteViewControllerAccessibility;
  -[TVRUIRemoteViewControllerAccessibility viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[TVRUIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)showLoadingSpinner
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRUIRemoteViewControllerAccessibility;
  -[TVRUIRemoteViewControllerAccessibility showLoadingSpinner](&v5, sel_showLoadingSpinner);
  -[TVRUIRemoteViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_messageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("currentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v4);

}

- (void)showSearchingSpinner
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRUIRemoteViewControllerAccessibility;
  -[TVRUIRemoteViewControllerAccessibility showSearchingSpinner](&v5, sel_showSearchingSpinner);
  -[TVRUIRemoteViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_messageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("currentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v4);

}

- (void)clearMessageContent
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRUIRemoteViewControllerAccessibility;
  -[TVRUIRemoteViewControllerAccessibility clearMessageContent](&v5, sel_clearMessageContent);
  -[TVRUIRemoteViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_messageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("currentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
