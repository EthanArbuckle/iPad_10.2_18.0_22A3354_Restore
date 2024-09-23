@implementation CompassPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CompassPageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompassPageViewController"), CFSTR("setCrosshairLevelForData:"), "v", "{?=ddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CompassPageViewController"), CFSTR("_updateDegreesLabel:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassController"), CFSTR("_compassPageController"), "CompassPageViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassPageViewController"), CFSTR("_coordinatesLabel"), "CompassCopyableLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassPageViewController"), CFSTR("_directionLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassPageViewController"), CFSTR("_degreesLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassPageViewController"), CFSTR("_degreesSymbolLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassPageViewController"), CFSTR("_compassView"), "CompassView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassView"), CFSTR("_compassBackground"), "CompassBackgroundView");
  objc_opt_class();
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassBackgroundView"), CFSTR("_currentOffset"), __ax_verbose_encode_with_type_encoding_group_class());
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompassPageViewController"), CFSTR("_currentCompassAngle"), "d");

}

- (void)_axAnnounceDegreesIfNeeded:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3 >= 0.0
    && (fabs(a3 + 1.0) < 2.22044605e-16
     || vabdd_f64(*(double *)&_axAnnounceDegreesIfNeeded__LastAnnouncedLocation, a3) > 10.0
     && CFAbsoluteTimeGetCurrent() - *(double *)&_axAnnounceDegreesIfNeeded__LastTimeLocationWasAnnounced > 2.0))
  {
    _axAnnounceDegreesIfNeeded__LastAnnouncedLocation = *(_QWORD *)&a3;
    _axAnnounceDegreesIfNeeded__LastTimeLocationWasAnnounced = CFAbsoluteTimeGetCurrent();
    -[CompassPageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_degreesLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[CompassPageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_degreesSymbolLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CompassPageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_directionLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "stringByAppendingString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakIfNotSpeaking();

  }
}

- (CompassPageViewControllerAccessibility)init
{
  CompassPageViewControllerAccessibility *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompassPageViewControllerAccessibility;
  v2 = -[CompassPageViewControllerAccessibility init](&v4, sel_init);
  -[CompassPageViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompassPageViewControllerAccessibility;
  -[CompassPageViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CompassPageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("compassPageView"));

}

- (void)_updateDegreesLabel:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CompassPageViewControllerAccessibility;
  -[CompassPageViewControllerAccessibility _updateDegreesLabel:](&v5, sel__updateDegreesLabel_, a3);
  -[CompassPageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentCompassAngle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[CompassPageViewControllerAccessibility _axAnnounceDegreesIfNeeded:](self, "_axAnnounceDegreesIfNeeded:");

}

- (void)setCrosshairLevelForData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  char v14;
  id *v15;
  BOOL v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CompassPageViewControllerAccessibility;
  -[CompassPageViewControllerAccessibility setCrosshairLevelForData:](&v17, sel_setCrosshairLevelForData_, a3.var0, a3.var1, a3.var2);
  -[CompassPageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_compassView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_compassBackground"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_currentOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  v8 = v7;
  v10 = v9;

  v11 = fabs(v8);
  v12 = fabs(v10);
  v13 = v11 <= 2.5 && v12 <= 2.5;
  if (!v13 && (setCrosshairLevelForData__IsWithinLevelRadius & 1) != 0)
  {
    v14 = 0;
    v15 = (id *)MEMORY[0x24BDFEDD0];
LABEL_13:
    setCrosshairLevelForData__IsWithinLevelRadius = v14;
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *v15);
    goto LABEL_14;
  }
  v16 = v11 > 2.5 || v12 > 2.5;
  if (!v16 && (setCrosshairLevelForData__IsWithinLevelRadius & 1) == 0)
  {
    v15 = (id *)MEMORY[0x24BDFEDC8];
    v14 = 1;
    goto LABEL_13;
  }
LABEL_14:

}

@end
