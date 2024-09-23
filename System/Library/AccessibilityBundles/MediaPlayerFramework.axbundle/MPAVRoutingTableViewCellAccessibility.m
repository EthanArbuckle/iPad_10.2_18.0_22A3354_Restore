@implementation MPAVRoutingTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPAVRoutingTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityMediaRoute
{
  JUMPOUT(0x2348C0538);
}

- (void)setAccessibilityMediaRoute:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MPAVRoutingTableViewCell"), CFSTR("_subtitleTextLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAVRoutingTableViewCell"), CFSTR("_shouldShowSeparateBatteryPercentagesForBatteryLevel:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAVRoute"), CFSTR("batteryLevel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MPAVRoutingTableViewCell"), CFSTR("_routeNameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAVRoutingTableViewCell"), CFSTR("updateForEndpoint:routeItem:inferLocalizedModelName:"), "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAVRoutingTableViewCell"), CFSTR("useSmartAudioCheckmarkStyle"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MPAVRoutingTableViewCell"), CFSTR("_volumeSlider"), "MPVolumeSlider");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPAVRoutingViewItem"), CFSTR("mainRoute"), "@", 0);

}

- (BOOL)_axIsUsingSmartAudioCheckmarkStyle
{
  return -[MPAVRoutingTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("useSmartAudioCheckmarkStyle"));
}

- (BOOL)_axIsVolumeSliderVisible
{
  void *v2;
  void *v3;
  int v4;

  -[MPAVRoutingTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_volumeSlider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isHidden") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  char v14;
  CGPoint result;

  if (-[MPAVRoutingTableViewCellAccessibility _axIsUsingSmartAudioCheckmarkStyle](self, "_axIsUsingSmartAudioCheckmarkStyle")&& (v14 = 0, objc_opt_class(), __UIAccessibilityCastAsClass(), v3 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "accessoryView"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v3, v4))
  {
    objc_msgSend(v4, "accessibilityActivationPoint");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MPAVRoutingTableViewCellAccessibility;
    -[MPAVRoutingTableViewCellAccessibility accessibilityActivationPoint](&v13, sel_accessibilityActivationPoint);
    v6 = v9;
    v8 = v10;
  }
  v11 = v6;
  v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[MPAVRoutingTableViewCellAccessibility accessibilityMediaRoute](self, "accessibilityMediaRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MPAVRoutingTableViewCellAccessibility _accessibilityDescriptionForRoute:](self, "_accessibilityDescriptionForRoute:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[MPAVRoutingTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_routeNameLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityDescriptionForRoute:(id)a3
{
  return AXLabelForMediaRoute(a3);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  objc_opt_class();
  -[MPAVRoutingTableViewCellAccessibility accessibilityMediaRoute](self, "accessibilityMediaRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("batteryLevel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v4 && (objc_msgSend(v4, "isPickedOnPairedDevice") & 1) == 0)
  {
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __59__MPAVRoutingTableViewCellAccessibility_accessibilityValue__block_invoke;
    v15 = &unk_24FEF3860;
    v16 = v6;
    AXPerformSafeBlock();

  }
  if (!objc_msgSend((id)v18[5], "length", v12, v13, v14, v15))
  {
    -[MPAVRoutingTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleTextLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v18[5];
    v18[5] = v8;

  }
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __59__MPAVRoutingTableViewCellAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  objc_msgSend(*(id *)(a1 + 32), "leftPercentage");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "rightPercentage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (!objc_msgSend(*(id *)(a1 + 40), "_shouldShowSeparateBatteryPercentagesForBatteryLevel:", *(_QWORD *)(a1 + 32)))
      {
        objc_msgSend(*(id *)(a1 + 32), "leftPercentage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v17 = v16;
        objc_msgSend(*(id *)(a1 + 32), "rightPercentage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        v19 = *(void **)(a1 + 32);
        if (v17 < v20)
          objc_msgSend(v19, "leftPercentage");
        else
          objc_msgSend(v19, "rightPercentage");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatValue");

        v22 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("audio.route.single.battery.level"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        AXFormatFloatWithPercentage();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", v6, v7);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      v5 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("audio.route.left.right.battery.level"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "leftPercentage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      AXFormatFloatWithPercentage();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "rightPercentage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      AXFormatFloatWithPercentage();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v6, v8, v10);
      v31 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_15:

      goto LABEL_16;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "leftPercentage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("audio.route.single.battery.left.level"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "leftPercentage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = v13;
    objc_msgSend(v13, "floatValue");
    AXFormatFloatWithPercentage();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v6, v8);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "rightPercentage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("audio.route.single.battery.right.level"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rightPercentage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v31 = 0;
LABEL_16:
  objc_msgSend(*(id *)(a1 + 32), "casePercentage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("audio.route.case.battery.level"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "casePercentage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    AXFormatFloatWithPercentage();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", v25, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  __UIAXStringForVariables();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v30 = *(void **)(v29 + 40);
  *(_QWORD *)(v29 + 40) = v28;

}

- (void)updateForEndpoint:(id)a3 routeItem:(id)a4 inferLocalizedModelName:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  objc_super v10;

  v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)MPAVRoutingTableViewCellAccessibility;
  v8 = a4;
  -[MPAVRoutingTableViewCellAccessibility updateForEndpoint:routeItem:inferLocalizedModelName:](&v10, sel_updateForEndpoint_routeItem_inferLocalizedModelName_, a3, v8, v5);
  objc_msgSend(v8, "safeValueForKey:", CFSTR("mainRoute"), v10.receiver, v10.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPAVRoutingTableViewCellAccessibility setAccessibilityMediaRoute:](self, "setAccessibilityMediaRoute:", v9);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
