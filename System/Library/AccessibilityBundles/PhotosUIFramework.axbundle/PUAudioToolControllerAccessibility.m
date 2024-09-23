@implementation PUAudioToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PhotosUIPrivate.PUAudioToolController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PhotosUIPrivate.PUAudioToolController"), CFSTR("muteButton"), "PUPhotoEditToolbarButton");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUAudioToolControllerAccessibility;
  -[PUAudioToolControllerAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[PUAudioToolControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("muteButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", &__block_literal_global_1);
  objc_initWeak(&location, v4);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __80__PUAudioToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v8 = &unk_24FF15050;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", &v5);
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", &__block_literal_global_211, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

id __80__PUAudioToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPULocalizedString(CFSTR("volume.label"));
}

id __80__PUAudioToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
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

uint64_t __80__PUAudioToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return *MEMORY[0x24BDF73B0];
}

@end
