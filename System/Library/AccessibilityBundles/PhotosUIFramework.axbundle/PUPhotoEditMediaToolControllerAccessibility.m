@implementation PUPhotoEditMediaToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotoEditMediaToolController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoEditMediaToolController"), CFSTR("_muteButton"), "PUPhotoEditToolbarButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoEditMediaToolController"), CFSTR("_livePhotoButton"), "PUPhotoEditToolActivationButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoEditMediaToolController"), CFSTR("_portraitVideoButton"), "PUPhotoEditToolActivationButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoEditMediaToolController"), CFSTR("_autoFocusButton"), "PUPhotoEditToolbarButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditMediaToolController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditMediaToolController"), CFSTR("_updateTrimControlAndToolbarButtons"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditMediaToolController"), CFSTR("reloadToolbarButtons:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditMediaToolController"), CFSTR("_updateLivePhotoButtonAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditMediaToolController"), CFSTR("_updateMuteButtonAnimated:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20[2];
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25[2];
  _QWORD v26[4];
  id v27;
  id from;
  _QWORD v29[4];
  id v30[2];
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  -[PUPhotoEditMediaToolControllerAccessibility _accessibilityLoadAccessibilityInformation](&v34, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[PUPhotoEditMediaToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_muteButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", &__block_literal_global_10);
  objc_initWeak(&location, v4);
  v6 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v31[3] = &unk_24FF15050;
  objc_copyWeak(&v32, &location);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", v31);
  v7 = (void *)objc_msgSend(v4, "accessibilityTraits");
  v29[0] = v6;
  v29[1] = 3221225472;
  v29[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v29[3] = &unk_24FF15488;
  objc_copyWeak(v30, &location);
  v30[1] = v7;
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v29);
  LOBYTE(from) = 0;
  objc_opt_class();
  -[PUPhotoEditMediaToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_portraitVideoButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessibilityTraits:", v5);
  objc_msgSend(v9, "_setAccessibilityLabelBlock:", &__block_literal_global_230);
  objc_initWeak(&from, v9);
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v26[3] = &unk_24FF15050;
  objc_copyWeak(&v27, &from);
  objc_msgSend(v9, "_setAccessibilityValueBlock:", v26);
  v10 = (void *)objc_msgSend(v9, "accessibilityTraits");
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v24[3] = &unk_24FF15488;
  objc_copyWeak(v25, &from);
  v25[1] = v10;
  objc_msgSend(v9, "_setAccessibilityTraitsBlock:", v24);
  LOBYTE(v23) = 0;
  objc_opt_class();
  -[PUPhotoEditMediaToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_autoFocusButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setAccessibilityTraits:", v5);
  objc_msgSend(v12, "_setAccessibilityLabelBlock:", &__block_literal_global_237);
  objc_initWeak(&v23, v12);
  v21[0] = v6;
  v21[1] = 3221225472;
  v21[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
  v21[3] = &unk_24FF15050;
  objc_copyWeak(&v22, &v23);
  objc_msgSend(v12, "_setAccessibilityValueBlock:", v21);
  v13 = (void *)objc_msgSend(v12, "accessibilityTraits");
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9;
  v19[3] = &unk_24FF15488;
  objc_copyWeak(v20, &v23);
  v20[1] = v13;
  objc_msgSend(v12, "_setAccessibilityTraitsBlock:", v19);
  LOBYTE(v18) = 0;
  objc_opt_class();
  -[PUPhotoEditMediaToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_livePhotoButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAccessibilityTraits:", v5);
  objc_msgSend(v15, "_setAccessibilityLabelBlock:", &__block_literal_global_244);
  objc_initWeak(&v18, v15);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_11;
  v16[3] = &unk_24FF15050;
  objc_copyWeak(&v17, &v18);
  objc_msgSend(v15, "_setAccessibilityValueBlock:", v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v18);

  objc_destroyWeak(v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v23);

  objc_destroyWeak(v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&from);

  objc_destroyWeak(v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPULocalizedString(CFSTR("volume.label"));
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isSelected"))
    v2 = CFSTR("volume.label.off");
  else
    v2 = CFSTR("volume.label.on");
  accessibilityPULocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  int v3;
  uint64_t v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isEnabled");
  v4 = *MEMORY[0x24BDF73E8];
  if (v3)
    v4 = 0;
  v5 = *(_QWORD *)(a1 + 40) | v4;

  return v5;
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4()
{
  return accessibilityPULocalizedString(CFSTR("cinematic.label"));
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isSelected"))
    v2 = CFSTR("cinematic.on");
  else
    v2 = CFSTR("cinematic.off");
  accessibilityPULocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  int v3;
  uint64_t v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isEnabled");
  v4 = *MEMORY[0x24BDF73E8];
  if (v3)
    v4 = 0;
  v5 = *(_QWORD *)(a1 + 40) | v4;

  return v5;
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7()
{
  return accessibilityPULocalizedString(CFSTR("cinematic.focus"));
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isSelected"))
    v2 = CFSTR("cinematic.auto");
  else
    v2 = CFSTR("cinematic.manual");
  accessibilityPULocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  int v3;
  uint64_t v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isEnabled");
  v4 = *MEMORY[0x24BDF73E8];
  if (v3)
    v4 = 0;
  v5 = *(_QWORD *)(a1 + 40) | v4;

  return v5;
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_10()
{
  return accessibilityPULocalizedString(CFSTR("iris.tool.label"));
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isSelected"))
    v2 = CFSTR("iris.tool.on");
  else
    v2 = CFSTR("iris.tool.off");
  accessibilityPULocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  -[PUPhotoEditMediaToolControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUPhotoEditMediaToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_updateTrimControlAndToolbarButtons
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  -[PUPhotoEditMediaToolControllerAccessibility _updateTrimControlAndToolbarButtons](&v3, sel__updateTrimControlAndToolbarButtons);
  -[PUPhotoEditMediaToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)reloadToolbarButtons:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  -[PUPhotoEditMediaToolControllerAccessibility reloadToolbarButtons:](&v4, sel_reloadToolbarButtons_, a3);
  -[PUPhotoEditMediaToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_updateLivePhotoButtonAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  -[PUPhotoEditMediaToolControllerAccessibility _updateLivePhotoButtonAnimated:](&v4, sel__updateLivePhotoButtonAnimated_, a3);
  -[PUPhotoEditMediaToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_updateMuteButtonAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  -[PUPhotoEditMediaToolControllerAccessibility _updateMuteButtonAnimated:](&v4, sel__updateMuteButtonAnimated_, a3);
  -[PUPhotoEditMediaToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
