@implementation CAMVideoConfigurationStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMVideoConfigurationStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axResolutionTapped
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetResolutionTapped:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_axFramerateTapped
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetFramerateTapped:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMVideoConfigurationStatusIndicator"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMVideoConfigurationStatusIndicator"), CFSTR("_togglesResolutionForTouchAtLocation:"), "B", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMVideoConfigurationStatusIndicator"), CFSTR("_togglesFramerateForTouchAtLocation:"), "B", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMVideoConfigurationStatusIndicator"), CFSTR("_handleTouchAtLocation:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMVideoConfigurationStatusIndicator"), CFSTR("_resolutionString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMVideoConfigurationStatusIndicator"), CFSTR("_framerateString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMVideoConfigurationStatusIndicator"), CFSTR("_resolutionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMVideoConfigurationStatusIndicator"), CFSTR("_framerateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMVideoConfigurationStatusIndicator"), CFSTR("_separatorLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CAMViewfinderViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_currentMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_currentDevicePosition"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_isSpatialVideoInVideoModeActiveForMode:devicePosition:"), "B", "q", "q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("video.configuration.status.button"));
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  objc_super v13;
  id location;

  objc_initWeak(&location, self);
  v13.receiver = self;
  v13.super_class = (Class)CAMVideoConfigurationStatusIndicatorAccessibility;
  -[CAMVideoConfigurationStatusIndicatorAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  -[CAMVideoConfigurationStatusIndicatorAccessibility _axSeparatorLabel](self, "_axSeparatorLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setIsAccessibilityElementBlock:", &__block_literal_global_17);
  -[CAMVideoConfigurationStatusIndicatorAccessibility _axResolutionLabel](self, "_axResolutionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", &__block_literal_global_234);
  -[CAMVideoConfigurationStatusIndicatorAccessibility _axFramerateLabel](self, "_axFramerateLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAccessibilityLabelBlock:", &__block_literal_global_237_0);
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v11[3] = &unk_24FEE0C18;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v9[3] = &unk_24FEE0C18;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "_setAccessibilityValueBlock:", v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v8[3] = &unk_24FEE0C40;
  v8[4] = self;
  objc_msgSend(v4, "_setAccessibilityAdditionalTraitsBlock:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v7[3] = &unk_24FEE0C40;
  v7[4] = self;
  objc_msgSend(v5, "_setAccessibilityAdditionalTraitsBlock:", v7);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

uint64_t __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 0;
}

id __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return accessibilityCameraUILocalizedString(CFSTR("resolution.label"));
}

id __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return accessibilityCameraUILocalizedString(CFSTR("framerate.label"));
}

id __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_resolutionString"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityCameraUILocalizedString(CFSTR("framerate.value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_framerateString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_axSpatialVideoActive");
  v2 = *MEMORY[0x24BDF73B0];
  if (v1)
    v2 = 0;
  return v2 | *MEMORY[0x24BDF7408];
}

uint64_t __95__CAMVideoConfigurationStatusIndicatorAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_axSpatialVideoActive");
  v2 = *MEMORY[0x24BDF73B0];
  if (v1)
    v2 = 0;
  return v2 | *MEMORY[0x24BDF7408];
}

- (id)_axVC
{
  void *v2;
  void *v3;

  -[CAMVideoConfigurationStatusIndicatorAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_245, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __58__CAMVideoConfigurationStatusIndicatorAccessibility__axVC__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BFB60](CFSTR("CAMViewfinderViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axSpatialVideoActive
{
  CAMVideoConfigurationStatusIndicatorAccessibility *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  -[CAMVideoConfigurationStatusIndicatorAccessibility _axVC](self, "_axVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_currentMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "integerValue");

  -[CAMVideoConfigurationStatusIndicatorAccessibility _axVC](v2, "_axVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeIntegerForKey:", CFSTR("_currentDevicePosition"));

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  AXPerformSafeBlock();
  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __74__CAMVideoConfigurationStatusIndicatorAccessibility__axSpatialVideoActive__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_axVC");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_isSpatialVideoInVideoModeActiveForMode:devicePosition:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMVideoConfigurationStatusIndicatorAccessibility;
  -[CAMVideoConfigurationStatusIndicatorAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[CAMVideoConfigurationStatusIndicatorAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (BOOL)_togglesResolutionForTouchAtLocation:(CGPoint)a3
{
  _BOOL8 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoConfigurationStatusIndicatorAccessibility;
  v4 = -[CAMVideoConfigurationStatusIndicatorAccessibility _togglesResolutionForTouchAtLocation:](&v6, sel__togglesResolutionForTouchAtLocation_, a3.x, a3.y);
  -[CAMVideoConfigurationStatusIndicatorAccessibility _axSetResolutionTapped:](self, "_axSetResolutionTapped:", v4);
  return v4;
}

- (BOOL)_togglesFramerateForTouchAtLocation:(CGPoint)a3
{
  _BOOL8 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoConfigurationStatusIndicatorAccessibility;
  v4 = -[CAMVideoConfigurationStatusIndicatorAccessibility _togglesFramerateForTouchAtLocation:](&v6, sel__togglesFramerateForTouchAtLocation_, a3.x, a3.y);
  -[CAMVideoConfigurationStatusIndicatorAccessibility _axSetFramerateTapped:](self, "_axSetFramerateTapped:", v4);
  return v4;
}

- (void)_handleTouchAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  -[CAMVideoConfigurationStatusIndicatorAccessibility _axSetResolutionTapped:](self, "_axSetResolutionTapped:", 0);
  -[CAMVideoConfigurationStatusIndicatorAccessibility _axSetFramerateTapped:](self, "_axSetFramerateTapped:", 0);
  v15.receiver = self;
  v15.super_class = (Class)CAMVideoConfigurationStatusIndicatorAccessibility;
  -[CAMVideoConfigurationStatusIndicatorAccessibility _handleTouchAtLocation:](&v15, sel__handleTouchAtLocation_, x, y);
  if (-[CAMVideoConfigurationStatusIndicatorAccessibility _axResolutionTapped](self, "_axResolutionTapped"))
  {
    v6 = (void *)MEMORY[0x24BDFEA60];
    -[CAMVideoConfigurationStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_resolutionString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axAttributedStringWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[CAMVideoConfigurationStatusIndicatorAccessibility _axFramerateTapped](self, "_axFramerateTapped"))
      return;
    v9 = (void *)MEMORY[0x24BDFEA60];
    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityCameraUILocalizedString(CFSTR("framerate.value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMVideoConfigurationStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_framerateString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "axAttributedStringWithString:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
  {
    objc_msgSend(v8, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
    v14 = v8;
    v13 = v8;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

void __76__CAMVideoConfigurationStatusIndicatorAccessibility__handleTouchAtLocation___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

- (id)_axResolutionLabel
{
  return (id)-[CAMVideoConfigurationStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_resolutionLabel"));
}

- (id)_axFramerateLabel
{
  return (id)-[CAMVideoConfigurationStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_framerateLabel"));
}

- (id)_axSeparatorLabel
{
  return (id)-[CAMVideoConfigurationStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_separatorLabel"));
}

@end
