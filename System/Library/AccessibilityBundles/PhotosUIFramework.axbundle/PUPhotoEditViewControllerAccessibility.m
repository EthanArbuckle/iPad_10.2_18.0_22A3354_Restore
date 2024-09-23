@implementation PUPhotoEditViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotoEditViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoEditViewController"), CFSTR("_moreButton"), "PUPhotoEditToolbarButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoEditViewController"), CFSTR("_redEyeButton"), "PUPhotoEditToolbarButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoEditViewController"), CFSTR("_ttrButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditViewController"), CFSTR("_updateToolbarsAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditViewController"), CFSTR("_updateMainActionButtonAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditViewController"), CFSTR("_reloadToolbarButtonsIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoEditViewController"), CFSTR("_mediaView"), "NUMediaView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NUMediaView"), CFSTR("_renderView"), "NURenderView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NUMediaView"), CFSTR("_renderer"), "NUMediaViewRenderer");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NUMediaViewRenderer"), CFSTR("computedDisplayType"), "Q", 0);

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
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[5];
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PUPhotoEditViewControllerAccessibility;
  -[PUPhotoEditViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v22, sel__accessibilityLoadAccessibilityInformation);
  -[PUPhotoEditViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_moreButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("plugin.tool"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[PUPhotoEditViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_redEyeButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("redeye.tool"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[PUPhotoEditViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ttrButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("ttr.tool"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  -[PUPhotoEditViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mediaView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("_renderView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("_renderer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "safeIntegerForKey:", CFSTR("computedDisplayType"));
  v13 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v21[3] = &__block_descriptor_40_e5_B8__0l;
  v21[4] = v12;
  objc_msgSend(v10, "_setIsAccessibilityElementBlock:", v21);
  objc_initWeak(&location, self);
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v18[3] = &unk_24FF15550;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v10, "_setAccessibilityTraitsBlock:", v18);
  if ((unint64_t)(v12 - 1) >= 3)
  {
    v14 = 0;
  }
  else
  {
    accessibilityPULocalizedString(off_24FF15570[v12 - 1]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v16[3] = &unk_24FF15280;
  v15 = v14;
  v17 = v15;
  objc_msgSend(v10, "_setAccessibilityLabelBlock:", v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

BOOL __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return (*(_QWORD *)(a1 + 32) & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

uint64_t __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  int v4;

  v1 = *MEMORY[0x24BDF73C8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_redEyeButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isSelected"));

  if (v4)
    return *MEMORY[0x24BDF73A8] | v1;
  else
    return v1 & ~*MEMORY[0x24BDF73A8];
}

id __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_reloadToolbarButtonsIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewControllerAccessibility;
  -[PUPhotoEditViewControllerAccessibility _reloadToolbarButtonsIfNeeded](&v3, sel__reloadToolbarButtonsIfNeeded);
  -[PUPhotoEditViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewControllerAccessibility;
  -[PUPhotoEditViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PUPhotoEditViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_updateToolbarsAnimated:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewControllerAccessibility;
  -[PUPhotoEditViewControllerAccessibility _updateToolbarsAnimated:](&v3, sel__updateToolbarsAnimated_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_updateMainActionButtonAnimated:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewControllerAccessibility;
  -[PUPhotoEditViewControllerAccessibility _updateMainActionButtonAnimated:](&v3, sel__updateMainActionButtonAnimated_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
