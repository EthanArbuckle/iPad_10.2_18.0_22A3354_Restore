@implementation MPVolumeSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPVolumeSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MPVolumeSlider"), CFSTR("_volumeController"), "MPVolumeController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPVolumeController"), CFSTR("volumeWarningEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPVolumeController"), CFSTR("EUVolumeLimit"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPVolumeController"), CFSTR("volumeWarningState"), "q", 0);

}

- (id)accessibilityLabel
{
  void *v3;

  -[MPVolumeSliderAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[MPVolumeSliderAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  else
    accessibilityLocalizedString(CFSTR("volumeslider"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)accessibilityIncrement
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  float v7;
  float v8;
  id v9;
  objc_super v10;

  -[MPVolumeSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  v10.receiver = self;
  v10.super_class = (Class)MPVolumeSliderAccessibility;
  -[MPVolumeSliderAccessibility accessibilityIncrement](&v10, sel_accessibilityIncrement);
  -[MPVolumeSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  if (v5 != v8)
    v9 = (id)-[MPVolumeSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_commitVolumeChange"));
}

- (void)accessibilityDecrement
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  float v7;
  float v8;
  id v9;
  objc_super v10;

  -[MPVolumeSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  v10.receiver = self;
  v10.super_class = (Class)MPVolumeSliderAccessibility;
  -[MPVolumeSliderAccessibility accessibilityDecrement](&v10, sel_accessibilityDecrement);
  -[MPVolumeSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  if (v5 != v8)
    v9 = (id)-[MPVolumeSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_commitVolumeChange"));
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[MPVolumeSliderAccessibility bounds](self, "bounds");
  v11.x = x;
  v11.y = y;
  if (CGRectContainsPoint(v12, v11))
  {
    v10.receiver = self;
    v10.super_class = (Class)MPVolumeSliderAccessibility;
    -[MPVolumeSliderAccessibility _accessibilityHitTest:withEvent:](&v10, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_layoutVolumeWarningView
{
  void *v3;
  void *v4;
  uint64_t v5;
  float v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  UIAccessibilityNotifications v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIAccessibilityNotifications v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MPVolumeSliderAccessibility;
  -[MPVolumeSliderAccessibility _layoutVolumeWarningView](&v22, sel__layoutVolumeWarningView);
  -[MPVolumeSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_volumeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("volumeWarningState"));
  objc_msgSend(v4, "safeFloatForKey:", CFSTR("EUVolumeLimit"));
  v7 = v6;
  -[MPVolumeSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("value"));
  v9 = v8;
  v10 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringFromNumber:numberStyle:", v11, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("volumeWarningEnabled")))
  {
    if (v5 == 2)
    {
      if (v9 < v7)
        goto LABEL_5;
LABEL_10:
      v17 = *MEMORY[0x24BDF71E8];
      accessibilityLocalizedString(CFSTR("volume.eulimit.approach"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v17, v18);

      accessibilityLocalizedString(CFSTR("volume.eulimit.approach"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(", %@"), v19);
      v20 = objc_claimAutoreleasedReturnValue();

      -[MPVolumeSliderAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("axDidAddEUWarning"));
      if (UIAccessibilityIsVoiceOverRunning())
      {
        objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "allowUserToExceedEUVolumeLimit");

      }
      v12 = (void *)v20;
      goto LABEL_13;
    }
    if (v5 == 4)
    {
      if (v9 != v7)
      {
LABEL_5:
        -[MPVolumeSliderAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("axDidAddEUWarning"));
        goto LABEL_13;
      }
      goto LABEL_10;
    }
  }
  if (-[MPVolumeSliderAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("axDidAddEUWarning"))&& v5 == 3)
  {
    v13 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("volume.eulimit.warning"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v13, v14);

    accessibilityLocalizedString(CFSTR("volume.eulimit.warning"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(", %@"), v15);
    v16 = objc_claimAutoreleasedReturnValue();

    -[MPVolumeSliderAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("axDidAddEUWarning"));
    v12 = (void *)v16;
  }
LABEL_13:
  -[MPVolumeSliderAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", v12);

}

@end
