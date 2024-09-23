@implementation PUCropToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUCropToolController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("rotateButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("autoButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("flipButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("_rotateButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("_flipButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("_aspectButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("aspectButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("geometry"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLImageGeometry"), CFSTR("userOrientation"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("cropAspectFlipperView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("cropAspectFlipperView:cropOrientationSelected:"), "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("autoButtonMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("cropAspect"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspect"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspect"), CFSTR("width"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspect"), CFSTR("height"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("cropAspectViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("_userChangedAspectRatioLocked:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("cropAspect"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspect"), CFSTR("isFreeformCrop"), "B", 0);

}

- (id)_axRotationLabel:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  switch(a3)
  {
    case 1:
      v3 = CFSTR("crop.rotate.normal");
      goto LABEL_10;
    case 2:
      v3 = CFSTR("crop.flip.horizontal");
      goto LABEL_10;
    case 3:
      v5 = (void *)MEMORY[0x24BDD17C8];
      accessibilityPULocalizedString(CFSTR("crop.rotate.degrees"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 180;
      goto LABEL_12;
    case 4:
      v3 = CFSTR("crop.flip.vertical");
      goto LABEL_10;
    case 5:
      v3 = CFSTR("crop.rotate.transpose");
      goto LABEL_10;
    case 6:
      v5 = (void *)MEMORY[0x24BDD17C8];
      accessibilityPULocalizedString(CFSTR("crop.rotate.degrees"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 90;
      goto LABEL_12;
    case 7:
      v3 = CFSTR("crop.rotate.transverse");
LABEL_10:
      accessibilityPULocalizedString(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      v5 = (void *)MEMORY[0x24BDD17C8];
      accessibilityPULocalizedString(CFSTR("crop.rotate.degrees"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 270;
LABEL_12:
      objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  _QWORD v35[4];
  id v36;
  char v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[4];
  id v48;
  id location;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)PUCropToolControllerAccessibility;
  -[PUCropToolControllerAccessibility _accessibilityLoadAccessibilityInformation](&v50, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  LOBYTE(v41) = 0;
  objc_opt_class();
  -[PUCropToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("autoButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v47[3] = &unk_24FF15050;
  v34 = &v48;
  objc_copyWeak(&v48, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v47);
  objc_opt_class();
  -[PUCropToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rotateButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_setAccessibilityLabelBlock:", &__block_literal_global_15);
  objc_opt_class();
  -[PUCropToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("aspectButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_setAccessibilityLabelBlock:", &__block_literal_global_269);
  -[PUCropToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cropAspect"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__9;
  v45 = __Block_byref_object_dispose__9;
  v46 = 0;
  if (v10)
  {
    objc_msgSend(v10, "safeStringForKey:", CFSTR("localizedName"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v42[5];
    v42[5] = v12;

    v14 = (void *)v42[5];
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "rangeOfCharacterFromSet:", v15);

    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
    objc_msgSend(v11, "safeCGFloatForKey:", CFSTR("width"));
    v18 = v17;
    objc_msgSend(v11, "safeCGFloatForKey:", CFSTR("height"));
    v20 = v19;
    v21 = (void *)MEMORY[0x24BDD17C8];
    accessibilityPULocalizedString(CFSTR("aspect.ratio.value"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v22, v18, v20, &v48);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v42[5];
    v42[5] = v23;

  }
  else
  {
    accessibilityPULocalizedString(CFSTR("aspect.ratio.freeform"));
    v25 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v42[5];
    v42[5] = v25;
  }

LABEL_6:
  v40[0] = v5;
  v40[1] = 3221225472;
  v40[2] = __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_277;
  v40[3] = &unk_24FF15798;
  v40[4] = &v41;
  objc_msgSend(v9, "_setAccessibilityValueBlock:", v40);
  -[PUCropToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cropAspectViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    v27 = CFSTR("crop.aspectratio.hint.dismiss");
  else
    v27 = CFSTR("crop.aspectratio.hint");
  accessibilityPULocalizedString(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = v5;
  v38[1] = 3221225472;
  v38[2] = __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2_282;
  v38[3] = &unk_24FF15280;
  v29 = v28;
  v39 = v29;
  objc_msgSend(v9, "_setAccessibilityHintBlock:", v38);
  objc_opt_class();
  -[PUCropToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("flipButton"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "_setAccessibilityLabelBlock:", &__block_literal_global_284);
  v37 = 0;
  objc_opt_class();
  -[PUCropToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("aspectRatioLockButton"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "_setAccessibilityLabelBlock:", &__block_literal_global_289);
  v35[0] = v5;
  v35[1] = 3221225472;
  v35[2] = __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v35[3] = &unk_24FF15800;
  objc_copyWeak(&v36, &location);
  objc_msgSend(v33, "_setIsAccessibilityElementBlock:", v35);
  objc_msgSend(v33, "_setAccessibilityTraitsBlock:", &__block_literal_global_294);
  objc_destroyWeak(&v36);

  _Block_object_dispose(&v41, 8);
  objc_destroyWeak(v34);

  objc_destroyWeak(&location);
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  __CFString *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeIntegerForKey:", CFSTR("autoButtonMode"));

  if (v2 == 1)
  {
    v3 = CFSTR("crop.auto");
  }
  else
  {
    if (v2 != 3)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("crop.reset");
  }
  accessibilityPULocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return accessibilityPULocalizedString(CFSTR("crop.rotate"));
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return accessibilityPULocalizedString(CFSTR("crop.aspectratio"));
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_277(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2_282(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3_283()
{
  return accessibilityPULocalizedString(CFSTR("crop.flip"));
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4()
{
  return accessibilityPULocalizedString(CFSTR("photoedit.crop.aspect.ratio.locked"));
}

uint64_t __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("cropAspect"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isFreeformCrop")) ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6()
{
  return *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0];
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUCropToolControllerAccessibility;
  -[PUCropToolControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PUCropToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_rotateButtonTapped:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUCropToolControllerAccessibility;
  -[PUCropToolControllerAccessibility _rotateButtonTapped:](&v6, sel__rotateButtonTapped_, a3);
  v4 = *MEMORY[0x24BDF7328];
  -[PUCropToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rotateButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __57__PUCropToolControllerAccessibility__rotateButtonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axAnnounceFlipOrRotateOrientation");
}

- (void)_flipButtonTapped:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUCropToolControllerAccessibility;
  -[PUCropToolControllerAccessibility _flipButtonTapped:](&v6, sel__flipButtonTapped_, a3);
  v4 = *MEMORY[0x24BDF7328];
  -[PUCropToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_flipButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __55__PUCropToolControllerAccessibility__flipButtonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axAnnounceFlipOrRotateOrientation");
}

- (void)_aspectButtonTapped:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCropToolControllerAccessibility;
  -[PUCropToolControllerAccessibility _aspectButtonTapped:](&v4, sel__aspectButtonTapped_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
  -[PUCropToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

void __57__PUCropToolControllerAccessibility__aspectButtonTapped___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF7328];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("cropAspectFlipperView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (void)_axAnnounceFlipOrRotateOrientation
{
  void *v3;
  void *v4;
  void *v5;

  -[PUCropToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("geometry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCropToolControllerAccessibility _axRotationLabel:](self, "_axRotationLabel:", objc_msgSend(v4, "safeIntegerForKey:", CFSTR("userOrientation")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

- (void)cropAspectFlipperView:(id)a3 cropOrientationSelected:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUCropToolControllerAccessibility;
  -[PUCropToolControllerAccessibility cropAspectFlipperView:cropOrientationSelected:](&v5, sel_cropAspectFlipperView_cropOrientationSelected_, a3, a4);
  -[PUCropToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_userChangedAspectRatioLocked:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUCropToolControllerAccessibility;
  -[PUCropToolControllerAccessibility _userChangedAspectRatioLocked:](&v6, sel__userChangedAspectRatioLocked_);
  if (v3)
    v4 = CFSTR("photoedit.crop.aspect.ratio.locked");
  else
    v4 = CFSTR("photoedit.crop.aspect.ratio.unlocked");
  accessibilityPULocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

@end
