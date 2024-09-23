@implementation AVPlaybackControlsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVPlaybackControlsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsController"), CFSTR("_prefersVolumeSliderExpandedAutomatically"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsController"), CFSTR("_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsController"), CFSTR("_autoHideControlsAfterDelay:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsController"), CFSTR("showPlaybackControls:immediately:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsController"), CFSTR("beginUserInteraction"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsController"), CFSTR("endUserInteraction"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsController"), CFSTR("prefersMuted"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsController"), CFSTR("volumeControlsCanShowSlider"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsController"), CFSTR("playbackControlsViewDidLoad:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsController"), CFSTR("playbackControlsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsView"), CFSTR("volumeButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVPlaybackControlsControllerAccessibility;
  -[AVPlaybackControlsControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[AVPlaybackControlsControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("playbackControlsView.volumeButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsControllerAccessibility _axLoadVolumeButtonAccessibilityInformation:](self, "_axLoadVolumeButtonAccessibilityInformation:", v3);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDF76D8];
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF76D8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__axAnnounceAudioControlStateDidChange, v5, 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF76D8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, AXVisibilityItemHiddenChangedNotification, 0);

  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackControlsControllerAccessibility;
  -[AVPlaybackControlsControllerAccessibility dealloc](&v5, sel_dealloc);
}

- (void)playbackControlsViewDidLoad:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackControlsControllerAccessibility;
  -[AVPlaybackControlsControllerAccessibility playbackControlsViewDidLoad:](&v4, sel_playbackControlsViewDidLoad_, a3);
  -[AVPlaybackControlsControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_axLoadVolumeButtonAccessibilityInformation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __89__AVPlaybackControlsControllerAccessibility__axLoadVolumeButtonAccessibilityInformation___block_invoke;
  v12 = &unk_250141278;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", &v9);
  if (-[AVPlaybackControlsControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("volumeControlsCanShowSlider"), v9, v10, v11, v12))
  {
    v5 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("toggle.audio.controls"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:target:selector:", v6, self, sel__axToggleAudioControls_);

    v15[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityCustomActions:", v8);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

id __89__AVPlaybackControlsControllerAccessibility__axLoadVolumeButtonAccessibilityInformation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_axIsMuted"))
  {
    accessibilityLocalizedString(CFSTR("volume.button.muted"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)_axIsMuted
{
  return -[AVPlaybackControlsControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("prefersMuted"));
}

- (BOOL)_axToggleAudioControls:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;

  AXPerformSafeBlock();
  v4 = *MEMORY[0x24BDF72C8];
  -[AVPlaybackControlsControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("playbackControlsView.volumeButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

  return 1;
}

uint64_t __68__AVPlaybackControlsControllerAccessibility__axToggleAudioControls___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("_prefersVolumeSliderExpandedAutomatically")) ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", v2);
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetBoolValue:forKey:", v2, CFSTR("AXAudioControlIsExpanded"));
}

- (void)_axAnnounceAudioControlStateDidChange
{
  void *v3;
  void *v4;
  void *v5;

  if (-[AVPlaybackControlsControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("volumeControlsCanShowSlider"))&& -[AVPlaybackControlsControllerAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AXAudioControlIsExpanded")))
  {
    v3 = (void *)MEMORY[0x24BDFEA60];
    accessibilityLocalizedString(CFSTR("audio.controls.updated"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setAttribute:forKey:", &unk_250147C30, *MEMORY[0x24BDFEAD8]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);

  }
  -[AVPlaybackControlsControllerAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXAudioControlIsExpanded"));
}

- (void)_accessibilityPlayerLayerViewAccessibilityFocusedChanged:(id)a3
{
  void *v4;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
  {
    -[AVPlaybackControlsControllerAccessibility performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__accessibilityHandlePlayerLayerViewFocused_, v4, 0.0);
    AXPerformSafeBlock();
  }
  else
  {
    -[AVPlaybackControlsControllerAccessibility performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__accessibilityHandlePlayerLayerViewFocused_, v4, 5.0);
  }

}

void __102__AVPlaybackControlsControllerAccessibility__accessibilityPlayerLayerViewAccessibilityFocusedChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("playbackControlsVisibilityTimer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "showPlaybackControls:immediately:", 1, 1);

}

- (BOOL)_axShouldShowRegularControlsBecauseOfAccessibility
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetShouldShowRegularControlsBecauseOfAccessibility:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_accessibilityHandlePlayerLayerViewFocused:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x24BEDCDF0];
  v5 = a3;
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__accessibilityHandlePlayerLayerViewFocused_, MEMORY[0x24BDBD1C8]);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__accessibilityHandlePlayerLayerViewFocused_, MEMORY[0x24BDBD1C0]);
  -[AVPlaybackControlsControllerAccessibility _axSetShouldShowRegularControlsBecauseOfAccessibility:](self, "_axSetShouldShowRegularControlsBecauseOfAccessibility:", objc_msgSend(v5, "BOOLValue"));
  LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");

  if ((v4 & 1) == 0)
    AXPerformSafeBlock();
}

uint64_t __88__AVPlaybackControlsControllerAccessibility__accessibilityHandlePlayerLayerViewFocused___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "beginUserInteraction");
  return objc_msgSend(*(id *)(a1 + 32), "endUserInteraction");
}

- (void)_autoHideControlsAfterDelay:(double)a3
{
  objc_super v5;

  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)AVPlaybackControlsControllerAccessibility;
    -[AVPlaybackControlsControllerAccessibility _autoHideControlsAfterDelay:](&v5, sel__autoHideControlsAfterDelay_, a3);
  }
}

@end
