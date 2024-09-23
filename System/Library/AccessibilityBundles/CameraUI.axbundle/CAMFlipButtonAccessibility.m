@implementation CAMFlipButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMFlipButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_currentDevicePosition"), "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CAMViewfinderView"));

}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("camera.chooser.button.text"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v10;

  -[CAMFlipButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2348BFB60](CFSTR("CAMViewfinderView"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[CAMFlipButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2348BFB60](CFSTR("CAMFullscreenViewfinder"))), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CAMFlipButtonAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_11, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeValueForKey:", CFSTR("_effectsController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("_currentDevicePosition"));
  if (v6)
  {
    if (v6 != 1)
    {
      v8 = 0;
      goto LABEL_10;
    }
    v7 = CFSTR("camera.chooser.front.text");
  }
  else
  {
    v7 = CFSTR("camera.chooser.back.text");
  }
  accessibilityCameraKitLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v8;
}

uint64_t __48__CAMFlipButtonAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BFB60](CFSTR("PBController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityHint
{
  return accessibilityCameraUILocalizedString(CFSTR("bravo.camera.chooser.hint.text"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("FrontBackFacingCameraChooser");
}

@end
