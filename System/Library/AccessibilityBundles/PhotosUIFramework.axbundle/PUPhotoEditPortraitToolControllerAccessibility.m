@implementation PUPhotoEditPortraitToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotoEditPortraitToolController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXUIButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoEditPortraitToolController"), CFSTR("_portraitToolbarButton"), "PUPhotoEditToolActivationButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditPortraitToolController"), CFSTR("_setupDepthControlsIfNeeded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditPortraitToolController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoEditPortraitToolController"), CFSTR("_lightingIntensityButton"), "PUPhotoEditToolbarButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditPortraitToolController"), CFSTR("_setupLightingControlsIfNeeded"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id from;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PUPhotoEditPortraitToolControllerAccessibility;
  -[PUPhotoEditPortraitToolControllerAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[PUPhotoEditPortraitToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_portraitToolbarButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", &__block_literal_global_11);
  objc_initWeak(&location, v4);
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v12[3] = &unk_24FF15050;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", v12);
  LOBYTE(from) = 0;
  objc_opt_class();
  -[PUPhotoEditPortraitToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lightingIntensityButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessibilityTraits:", v5);
  objc_msgSend(v8, "_setAccessibilityLabelBlock:", &__block_literal_global_225_0);
  objc_initWeak(&from, v8);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v9[3] = &unk_24FF15050;
  objc_copyWeak(&v10, &from);
  objc_msgSend(v8, "_setAccessibilityValueBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

id __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPULocalizedString(CFSTR("depth.effect"));
}

id __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
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

id __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return accessibilityPULocalizedString(CFSTR("light.intensity"));
}

id __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isSelected"))
    v2 = CFSTR("light.intensity.on");
  else
    v2 = CFSTR("light.intensity.off");
  accessibilityPULocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_setupDepthControlsIfNeeded
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditPortraitToolControllerAccessibility;
  v3 = -[PUPhotoEditPortraitToolControllerAccessibility _setupDepthControlsIfNeeded](&v5, sel__setupDepthControlsIfNeeded);
  -[PUPhotoEditPortraitToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

- (BOOL)_setupLightingControlsIfNeeded
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditPortraitToolControllerAccessibility;
  v3 = -[PUPhotoEditPortraitToolControllerAccessibility _setupLightingControlsIfNeeded](&v5, sel__setupLightingControlsIfNeeded);
  -[PUPhotoEditPortraitToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditPortraitToolControllerAccessibility;
  -[PUPhotoEditPortraitToolControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PUPhotoEditPortraitToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
