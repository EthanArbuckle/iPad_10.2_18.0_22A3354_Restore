@implementation ProximityStatusViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ProximityStatusViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axLeftDevice
{
  JUMPOUT(0x23491DB3CLL);
}

- (void)_axSetLeftDevice:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axRightDevice
{
  JUMPOUT(0x23491DB3CLL);
}

- (void)_axSetRightDevice:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axCaseDevice
{
  JUMPOUT(0x23491DB3CLL);
}

- (void)_axSetCaseDevice:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axCombinedDevice
{
  JUMPOUT(0x23491DB3CLL);
}

- (void)_axSetCombinedDevice:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (double)_axLeftBatteryLevel
{
  double result;

  __UIAccessibilityGetAssociatedCGFloat();
  return result;
}

- (void)_axSetLeftBatteryLevel:(double)a3
{
  __UIAccessibilitySetAssociatedCGFloat();
}

- (double)_axRightBatteryLevel
{
  double result;

  __UIAccessibilityGetAssociatedCGFloat();
  return result;
}

- (void)_axSetRightBatteryLevel:(double)a3
{
  __UIAccessibilitySetAssociatedCGFloat();
}

- (double)_axCaseBatteryLevel
{
  double result;

  __UIAccessibilityGetAssociatedCGFloat();
  return result;
}

- (void)_axSetCaseBatteryLevel:(double)a3
{
  __UIAccessibilitySetAssociatedCGFloat();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ProximityStatusViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ProximityStatusViewController"), CFSTR("handleTapOutsideView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ProximityStatusViewController"), CFSTR("_updateBatteryLevelLeft: levelRight: levelCase:"), "v", "d", "d", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("dismissButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("leftImageView"), "_TtC18SharingViewService20SVSAdjustedImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("leftIndicatorImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("leftExclamationPointImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("leftBatteryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("leftBatteryLevelImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("leftBatteryShellImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("leftBatteryChargeImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("rightImageView"), "_TtC18SharingViewService20SVSAdjustedImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("rightIndicatorImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("rightExclamationPointImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("rightBatteryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("rightBatteryLevelImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("rightBatteryShellImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("rightBatteryChargeImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("bothBatteryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("bothBatteryLevelImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("bothBatteryShellImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("bothBatteryChargeImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("caseImageView"), "_TtC18SharingViewService20SVSAdjustedImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("caseBatteryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("caseBatteryLevelImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("caseBatteryShellImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityStatusViewController"), CFSTR("caseBatteryChargeImageView"), "UIImageView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ProximityStatusViewControllerAccessibility;
  -[ProximityStatusViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[ProximityStatusViewControllerAccessibility _accessibilityUpdateAccessibilityElements](self, "_accessibilityUpdateAccessibilityElements");
}

- (BOOL)accessibilityPerformEscape
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformSafeBlock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __72__ProximityStatusViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "handleTapOutsideView:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ProximityStatusViewControllerAccessibility;
  -[ProximityStatusViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[ProximityStatusViewControllerAccessibility _accessibilityUpdateAccessibilityElements](self, "_accessibilityUpdateAccessibilityElements");
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAEA0], 0);
}

- (void)_updateBatteryLevelLeft:(double)a3 levelRight:(double)a4 levelCase:(double)a5
{
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ProximityStatusViewControllerAccessibility;
  -[ProximityStatusViewControllerAccessibility _updateBatteryLevelLeft:levelRight:levelCase:](&v12, sel__updateBatteryLevelLeft_levelRight_levelCase_);
  -[ProximityStatusViewControllerAccessibility _axLeftBatteryLevel](self, "_axLeftBatteryLevel");
  if (v9 != a3
    || (-[ProximityStatusViewControllerAccessibility _axRightBatteryLevel](self, "_axRightBatteryLevel"), v10 != a4)
    || (-[ProximityStatusViewControllerAccessibility _axCaseBatteryLevel](self, "_axCaseBatteryLevel"), v11 != a5))
  {
    -[ProximityStatusViewControllerAccessibility _axSetLeftBatteryLevel:](self, "_axSetLeftBatteryLevel:", a3);
    -[ProximityStatusViewControllerAccessibility _axSetRightBatteryLevel:](self, "_axSetRightBatteryLevel:", a4);
    -[ProximityStatusViewControllerAccessibility _axSetCaseBatteryLevel:](self, "_axSetCaseBatteryLevel:", a5);
    -[ProximityStatusViewControllerAccessibility _accessibilityUpdateAccessibilityElements](self, "_accessibilityUpdateAccessibilityElements");
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

- (void)_accessibilityUpdateAccessibilityElements
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;

  -[ProximityStatusViewControllerAccessibility _axSetLeftDevice:](self, "_axSetLeftDevice:", 0);
  -[ProximityStatusViewControllerAccessibility _axSetRightDevice:](self, "_axSetRightDevice:", 0);
  -[ProximityStatusViewControllerAccessibility _axSetCombinedDevice:](self, "_axSetCombinedDevice:", 0);
  -[ProximityStatusViewControllerAccessibility _axSetCaseDevice:](self, "_axSetCaseDevice:", 0);
  -[ProximityStatusViewControllerAccessibility _axLeftDevice](self, "_axLeftDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftBatteryLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_5;
    v5 = (void *)MEMORY[0x24BDBCE30];
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftImageView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftIndicatorImageView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftExclamationPointImageView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftBatteryLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftBatteryLevelImageView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftBatteryShellImageView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftBatteryChargeImageView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 7, v6, v7, v8, v9, v10, v11, v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityB188LocalizedString(CFSTR("left.earbud"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftBatteryLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftBatteryChargeImageView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftExclamationPointImageView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility _axCreateAggregateStatusView:primaryTitle:batteryLevelLabel:chargingImage:warningImage:](self, "_axCreateAggregateStatusView:primaryTitle:batteryLevelLabel:chargingImage:warningImage:", v3, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[ProximityStatusViewControllerAccessibility _axSetLeftDevice:](self, "_axSetLeftDevice:", v17);
  }

LABEL_5:
  -[ProximityStatusViewControllerAccessibility _axRightDevice](self, "_axRightDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightBatteryLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_9;
    v20 = (void *)MEMORY[0x24BDBCE30];
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightImageView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightIndicatorImageView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightExclamationPointImageView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightBatteryLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightBatteryLevelImageView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightBatteryShellImageView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightBatteryChargeImageView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "axArrayByIgnoringNilElementsWithCount:", 7, v21, v22, v23, v24, v25, v26, v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityB188LocalizedString(CFSTR("right.earbud"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightBatteryLabel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightBatteryChargeImageView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightExclamationPointImageView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProximityStatusViewControllerAccessibility _axCreateAggregateStatusView:primaryTitle:batteryLevelLabel:chargingImage:warningImage:](self, "_axCreateAggregateStatusView:primaryTitle:batteryLevelLabel:chargingImage:warningImage:", v18, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[ProximityStatusViewControllerAccessibility _axSetRightDevice:](self, "_axSetRightDevice:", v32);
  }

LABEL_9:
  -[ProximityStatusViewControllerAccessibility _axCombinedDevice](self, "_axCombinedDevice");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {

  }
  else
  {
    -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bothBatteryLabel"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = (void *)MEMORY[0x24BDBCEB8];
      -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bothBatteryLabel"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bothBatteryLevelImageView"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bothBatteryShellImageView"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bothBatteryChargeImageView"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "axArrayByIgnoringNilElementsWithCount:", 4, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftImageView"));
      v41 = objc_claimAutoreleasedReturnValue();
      -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightImageView"));
      v42 = objc_claimAutoreleasedReturnValue();
      if (v41 | v42)
      {
        objc_msgSend(v40, "axSafelyAddObject:", v41);
        objc_msgSend(v40, "axSafelyAddObject:", v42);
      }
      else
      {
        objc_opt_class();
        -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bothBatteryLabel"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "superview");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "axSafelyAddObject:", v45);

      }
      -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "accessibilityLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bothBatteryLabel"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bothBatteryChargeImageView"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[ProximityStatusViewControllerAccessibility _axCreateAggregateStatusView:primaryTitle:batteryLevelLabel:chargingImage:warningImage:](self, "_axCreateAggregateStatusView:primaryTitle:batteryLevelLabel:chargingImage:warningImage:", v40, v47, v48, v49, 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      -[ProximityStatusViewControllerAccessibility _axSetCombinedDevice:](self, "_axSetCombinedDevice:", v50);
    }
  }
  -[ProximityStatusViewControllerAccessibility _axCaseDevice](self, "_axCaseDevice");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
    goto LABEL_23;
  -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("caseBatteryLabel"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52)
    goto LABEL_24;
  v53 = (void *)MEMORY[0x24BDBCE30];
  -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("caseImageView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("caseBatteryLabel"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("caseBatteryLevelImageView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("caseBatteryShellImageView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("caseBatteryChargeImageView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "axArrayByIgnoringNilElementsWithCount:", 5, v54, v55, v56, v57, v58);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "accessibilityLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  -[ProximityStatusViewControllerAccessibility _axLeftDevice](self, "_axLeftDevice");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61
    || (-[ProximityStatusViewControllerAccessibility _axRightDevice](self, "_axRightDevice"),
        (v61 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[ProximityStatusViewControllerAccessibility _axCombinedDevice](self, "_axCombinedDevice");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v75)
      goto LABEL_22;
  }
  accessibilityB188LocalizedString(CFSTR("battery.case"));
  v62 = objc_claimAutoreleasedReturnValue();

  v60 = (void *)v62;
LABEL_22:
  -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("caseBatteryLabel"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("caseBatteryChargeImageView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProximityStatusViewControllerAccessibility _axCreateAggregateStatusView:primaryTitle:batteryLevelLabel:chargingImage:warningImage:](self, "_axCreateAggregateStatusView:primaryTitle:batteryLevelLabel:chargingImage:warningImage:", v51, v60, v63, v64, 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  -[ProximityStatusViewControllerAccessibility _axSetCaseDevice:](self, "_axSetCaseDevice:", v65);
LABEL_23:

LABEL_24:
  -[ProximityStatusViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "axSafelyAddObject:", v66);
  -[ProximityStatusViewControllerAccessibility _axCombinedDevice](self, "_axCombinedDevice");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    -[ProximityStatusViewControllerAccessibility _axCombinedDevice](self, "_axCombinedDevice");
  }
  else
  {
    -[ProximityStatusViewControllerAccessibility _axLeftDevice](self, "_axLeftDevice");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "axSafelyAddObject:", v69);

    -[ProximityStatusViewControllerAccessibility _axRightDevice](self, "_axRightDevice");
  }
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "axSafelyAddObject:", v70);

  -[ProximityStatusViewControllerAccessibility _axCaseDevice](self, "_axCaseDevice");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "axSafelyAddObject:", v71);

  -[ProximityStatusViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("dismissButton"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "_accessibilitySetUserTestingIsCancelButton:", 1);
  objc_msgSend(v67, "axSafelyAddObject:", v72);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "view");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setAccessibilityElements:", v67);

}

- (id)_axCreateAggregateStatusView:(id)a3 primaryTitle:(id)a4 batteryLevelLabel:(id)a5 chargingImage:(id)a6 warningImage:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AXAggregatedDeviceBatteryStatusView *v17;
  void *v18;
  void *v19;
  void *v20;
  AXAggregatedDeviceBatteryStatusView *v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v12, "count"))
  {
    v17 = [AXAggregatedDeviceBatteryStatusView alloc];
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[AXAggregatedDeviceBatteryStatusView initWithAccessibilityContainer:representedElements:primaryTitle:batteryLevelLabel:chargingImage:warningImage:](v17, "initWithAccessibilityContainer:representedElements:primaryTitle:batteryLevelLabel:chargingImage:warningImage:", self, v12, v13, v18, v19, v20);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
