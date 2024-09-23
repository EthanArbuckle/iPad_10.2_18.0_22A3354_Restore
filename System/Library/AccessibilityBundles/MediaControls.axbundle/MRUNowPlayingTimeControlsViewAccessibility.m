@implementation MRUNowPlayingTimeControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUNowPlayingTimeControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTimeControlsView"), CFSTR("slider"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MRUSlider"), CFSTR("UISlider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTimeControlsView"), CFSTR("liveLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTimeControlsView"), CFSTR("accessibilityTotalDuration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTimeControlsView"), CFSTR("accessibilityElapsedDuration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTimeControlsView"), CFSTR("timeControls"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUTimeControls"), CFSTR("isEnabled"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return !-[MRUNowPlayingTimeControlsViewAccessibility _accessibilityIsTrackInfoEmpty](self, "_accessibilityIsTrackInfoEmpty");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("track.position.label"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MRUNowPlayingTimeControlsViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("liveLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    -[MRUNowPlayingTimeControlsViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityTotalDuration"));
    AXDurationStringForDuration();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUNowPlayingTimeControlsViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityElapsedDuration"));
    AXDurationStringForDuration();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("track.position.value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v5, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)accessibilityIncrement
{
  -[MRUNowPlayingTimeControlsViewAccessibility _accessibilityAdjustElapsedTime:](self, "_accessibilityAdjustElapsedTime:", 1);
}

- (void)accessibilityDecrement
{
  -[MRUNowPlayingTimeControlsViewAccessibility _accessibilityAdjustElapsedTime:](self, "_accessibilityAdjustElapsedTime:", 0);
}

- (void)_accessibilityAdjustElapsedTime:(BOOL)a3
{
  void *v4;
  id v5;

  -[MRUNowPlayingTimeControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeControls"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingTimeControlsViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityElapsedDuration"));
  -[MRUNowPlayingTimeControlsViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityTotalDuration"));
  v5 = v4;
  AXPerformSafeBlock();

}

uint64_t __78__MRUNowPlayingTimeControlsViewAccessibility__accessibilityAdjustElapsedTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setElapsedTime:", *(double *)(a1 + 40));
}

- (id)accessibilityIdentifier
{
  return CFSTR("TrackPosition");
}

- (BOOL)_accessibilityIsTrackInfoEmpty
{
  void *v2;
  char v3;

  -[MRUNowPlayingTimeControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeControls"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isEnabled")) ^ 1;

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[MRUNowPlayingTimeControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __88__MRUNowPlayingTimeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_250272758;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "setAccessibilityAttributedValueBlock:", v5);
  v4.receiver = self;
  v4.super_class = (Class)MRUNowPlayingTimeControlsViewAccessibility;
  -[MRUNowPlayingTimeControlsViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

id __88__MRUNowPlayingTimeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "valueForKey:", CFSTR("slider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGFloatForKey:", CFSTR("value"));

  v3 = objc_alloc(MEMORY[0x24BDD1458]);
  AXDurationStringForDuration();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_250273068;
  v7 = (void *)objc_msgSend(v3, "initWithString:", v6);

  return v7;
}

@end
