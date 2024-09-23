@implementation VUIProductLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIProductLockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VUIProductLockupView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIProductLockupView"), CFSTR("mediaBadgeTagsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIProductLockupView"), CFSTR("badgeResources"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIProductBadgeResource"), CFSTR("name"), "@", 0);

}

- (id)_accessibilitySpeakableLabelForBadgeName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (_accessibilitySpeakableLabelForBadgeName__onceToken == -1)
  {
    if (!v3)
    {
LABEL_6:
      v7 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&_accessibilitySpeakableLabelForBadgeName__onceToken, &__block_literal_global_13);
    if (!v4)
      goto LABEL_6;
  }
  objc_msgSend((id)_accessibilitySpeakableLabelForBadgeName__knownBadgeNameToKeyMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v6 = v5;
  accessibilityLocalizedString(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

void __78__VUIProductLockupViewAccessibility__accessibilitySpeakableLabelForBadgeName___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("cc_mask");
  v2[1] = CFSTR("itunes-extras-badge");
  v3[0] = CFSTR("lockup.attribute.CC");
  v3[1] = CFSTR("lockup.attribute.iTunes.extras");
  v2[2] = CFSTR("hd_mask");
  v2[3] = CFSTR("hdr_mask");
  v3[2] = CFSTR("lockup.attribute.HD");
  v3[3] = CFSTR("lockup.attribute.HDR");
  v2[4] = CFSTR("4k_mask");
  v2[5] = CFSTR("dolbyvision_mask");
  v3[4] = CFSTR("lockup.attribute.4k");
  v3[5] = CFSTR("lockup.attribute.dolby.vision");
  v2[6] = CFSTR("dolby-atmos");
  v3[6] = CFSTR("lockup.attribute.dolby.atmos");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_accessibilitySpeakableLabelForBadgeName__knownBadgeNameToKeyMap;
  _accessibilitySpeakableLabelForBadgeName__knownBadgeNameToKeyMap = v0;

}

- (void)_accessibilityMarkupBadgeViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[VUIProductLockupViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("mediaBadgeTagsView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[VUIProductLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("badgeResources"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "axFilterObjectsUsingBlock:", &__block_literal_global_223);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7 == objc_msgSend(v3, "count") && objc_msgSend(v3, "count"))
  {
    v8 = 0;
    v9 = ~*MEMORY[0x24BDF73C8];
    do
    {
      objc_opt_class();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "safeValueForKey:", CFSTR("name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIProductLockupViewAccessibility _accessibilitySpeakableLabelForBadgeName:](self, "_accessibilitySpeakableLabelForBadgeName:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v11, "setIsAccessibilityElement:", 1);
        objc_msgSend(v11, "setAccessibilityLabel:", v14);
        objc_msgSend(v11, "setAccessibilityTraits:", objc_msgSend(v11, "accessibilityTraits") & v9);
      }

      ++v8;
    }
    while (v8 < objc_msgSend(v3, "count"));
  }

}

BOOL __67__VUIProductLockupViewAccessibility__accessibilityMarkupBadgeViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIProductLockupViewAccessibility;
  -[VUIProductLockupViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[VUIProductLockupViewAccessibility _accessibilityMarkupBadgeViews](self, "_accessibilityMarkupBadgeViews");
}

- (void)didMoveToWindow
{
  objc_super v3;

  -[VUIProductLockupViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v3.receiver = self;
  v3.super_class = (Class)VUIProductLockupViewAccessibility;
  -[VUIProductLockupViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
}

@end
