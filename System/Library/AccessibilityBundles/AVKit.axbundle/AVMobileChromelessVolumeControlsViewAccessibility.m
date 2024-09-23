@implementation AVMobileChromelessVolumeControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVMobileChromelessVolumeControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVMobileChromelessVolumeControlsView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVMobileChromelessVolumeControlsView"), CFSTR("_volumeButton"), "AVMobileVolumeChromelessButtonControl");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVMobileChromelessVolumeControlsView"), CFSTR("_volumeSlider"), "AVMobileChromelessSlider");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessVolumeControlsView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessVolumeControlsView"), CFSTR("volume"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessControlsViewController"), CFSTR("volumeControlsView:volumeDidChangeTo:"), "v", "@", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessVolumeControlsView"), CFSTR("_setVolume:forUpdateReason:"), "v", "d", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessVolumeControlsView"), CFSTR("isMuted"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AVMobileChromelessVolumeControlsViewAccessibility;
  -[AVMobileChromelessVolumeControlsViewAccessibility _accessibilityLoadAccessibilityInformation](&v19, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[AVMobileChromelessVolumeControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("volumeButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&v17, v3);

  v4 = objc_loadWeakRetained(&v17);
  v5 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v5 | *MEMORY[0x24BDF73A0]);

  v6 = objc_loadWeakRetained(&v17);
  objc_msgSend(v6, "_setAccessibilityLabelBlock:", &__block_literal_global_2);

  v7 = objc_loadWeakRetained(&v17);
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v15[3] = &unk_2501413D8;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  objc_msgSend(v7, "_setAccessibilityValueBlock:", v15);

  v9 = objc_loadWeakRetained(&v17);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v13[3] = &unk_250141200;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "_setAccessibilityIncrementBlock:", v13);

  v10 = objc_loadWeakRetained(&v17);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v11[3] = &unk_250141200;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "_setAccessibilityDecrementBlock:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

id __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityLocalizedString(CFSTR("volume.button"));
}

id __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isMuted")) & 1) != 0)
    accessibilityLocalizedString(CFSTR("volume.button.muted"));
  else
    objc_msgSend(*(id *)(a1 + 32), "_accessibilitySliderVolume");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeCGFloatForKey:", CFSTR("volume"));
  AXPerformSafeBlock();

}

void __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setVolume:forUpdateReason:", 0, *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volumeControlsView:volumeDidChangeTo:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

void __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeCGFloatForKey:", CFSTR("volume"));
  AXPerformSafeBlock();

}

void __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setVolume:forUpdateReason:", 0, *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volumeControlsView:volumeDidChangeTo:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

- (id)_accessibilitySliderVolume
{
  void *v3;
  void *v4;
  void *v5;

  -[AVMobileChromelessVolumeControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("volumeSlider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityUserDefinedValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "accessibilityUserDefinedValue");
  }
  else
  {
    -[AVMobileChromelessVolumeControlsViewAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("volume"));
    AXFormatFloatWithPercentage();
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AVMobileChromelessVolumeControlsViewAccessibility)initWithFrame:(CGRect)a3
{
  AVMobileChromelessVolumeControlsViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessVolumeControlsViewAccessibility;
  v3 = -[AVMobileChromelessVolumeControlsViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AVMobileChromelessVolumeControlsViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
