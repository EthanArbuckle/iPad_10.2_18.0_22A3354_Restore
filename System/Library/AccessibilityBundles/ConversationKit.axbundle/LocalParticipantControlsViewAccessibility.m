@implementation LocalParticipantControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.LocalParticipantControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.LocalParticipantControlsView"), CFSTR("effectsButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.LocalParticipantControlsView"), CFSTR("cameraBlurButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.LocalParticipantControlsView"), CFSTR("cinematicFramingButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.LocalParticipantControlsView"), CFSTR("cameraFlipButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.LocalParticipantControlsView"), CFSTR("collapseButton"), "@", 0);

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
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)LocalParticipantControlsViewAccessibility;
  -[LocalParticipantControlsViewAccessibility _accessibilityLoadAccessibilityInformation](&v20, sel__accessibilityLoadAccessibilityInformation);
  -[LocalParticipantControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("effectsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("camera.effects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[LocalParticipantControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cameraBlurButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("camera.blur.background"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[LocalParticipantControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cinematicFramingButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("camera.center.stage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  objc_initWeak(&location, self);
  -[LocalParticipantControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collapseButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("minimize.video"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v17[3] = &unk_2501E5B80;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v9, "_setAccessibilityActivateBlock:", v17);
  -[LocalParticipantControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cameraFlipButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v15[3] = &unk_2501E5BD0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v12, "_setAccessibilityLabelBlock:", v15);
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v13[3] = &unk_2501E5B80;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v12, "_setAccessibilityActivateBlock:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

uint64_t __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("collapseButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendActionsForControlEvents:", 64);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return 1;
}

id __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_axDevicePosition") == 2)
    v2 = CFSTR("camera.show.back");
  else
    v2 = CFSTR("camera.show.front");
  accessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("cameraFlipButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendActionsForControlEvents:", 64);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return 1;
}

- (int64_t)_axDevicePosition
{
  int64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __62__LocalParticipantControlsViewAccessibility__axDevicePosition__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoDeviceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "position");

}

@end
