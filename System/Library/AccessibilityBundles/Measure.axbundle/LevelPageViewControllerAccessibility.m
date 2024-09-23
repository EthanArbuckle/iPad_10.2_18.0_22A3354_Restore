@implementation LevelPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LevelPageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("LevelPageViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("viewWillDisappear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LevelPageViewController"), CFSTR("_orientation"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LevelPageViewController"), CFSTR("_degreesLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LevelPageViewController"), CFSTR("_updateOffsetLabel:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LevelPageViewController"), CFSTR("_updateForRotation: shiftAngle:"), "B", "d", "d", 0);

}

- (BOOL)_axShouldAnnounce
{
  void *v2;
  void *v3;
  char v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  return v4;
}

- (void)_axAnnounceDegreesIfNeeded:(double)a3
{
  void *v5;
  id v6;

  if (vabdd_f64(*(double *)&_axAnnounceDegreesIfNeeded__LastAnnouncedDegrees, a3) > 1.0
    && CFAbsoluteTimeGetCurrent() - *(double *)&_axAnnounceDegreesIfNeeded__LastTimeLocationWasAnnounced > 1.0)
  {
    if (-[LevelPageViewControllerAccessibility _axShouldAnnounce](self, "_axShouldAnnounce"))
    {
      _axAnnounceDegreesIfNeeded__LastAnnouncedDegrees = *(_QWORD *)&a3;
      _axAnnounceDegreesIfNeeded__LastTimeLocationWasAnnounced = CFAbsoluteTimeGetCurrent();
      -[LevelPageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_degreesLabel"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessibilityLabel");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      UIAccessibilitySpeakIfNotSpeaking();
    }
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LevelPageViewControllerAccessibility;
  -[LevelPageViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("levelPageView"));
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v4, "_appearState");

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetApplicationOrientation:", ((_DWORD)v2 - 1) < 2);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LevelPageViewControllerAccessibility;
  -[LevelPageViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[LevelPageViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LevelPageViewControllerAccessibility;
  -[LevelPageViewControllerAccessibility viewWillAppear:](&v3, sel_viewWillAppear_, a3);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetApplicationOrientation:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LevelPageViewControllerAccessibility;
  -[LevelPageViewControllerAccessibility viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetApplicationOrientation:", 0);
}

- (void)_updateOffsetLabel:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LevelPageViewControllerAccessibility;
  -[LevelPageViewControllerAccessibility _updateOffsetLabel:](&v5, sel__updateOffsetLabel_);
  -[LevelPageViewControllerAccessibility _axAnnounceDegreesIfNeeded:](self, "_axAnnounceDegreesIfNeeded:", a3);
}

- (BOOL)_updateForRotation:(double)a3 shiftAngle:(double)a4
{
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  objc_super v15;

  v7 = -[LevelPageViewControllerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_orientation"));
  v15.receiver = self;
  v15.super_class = (Class)LevelPageViewControllerAccessibility;
  v8 = -[LevelPageViewControllerAccessibility _updateForRotation:shiftAngle:](&v15, sel__updateForRotation_shiftAngle_, a3, a4);
  v9 = -[LevelPageViewControllerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_orientation"));
  if (v7 != v9)
  {
    v10 = v9;
    if (-[LevelPageViewControllerAccessibility _axShouldAnnounce](self, "_axShouldAnnounce"))
    {
      if ((unint64_t)(v10 - 3) >= 2)
        v11 = CFSTR("LEVEL_FACE_UP");
      else
        v11 = CFSTR("LEVEL_HORIZONTAL");
      if ((unint64_t)(v10 - 1) >= 2)
        v12 = (__CFString *)v11;
      else
        v12 = CFSTR("LEVEL_VERTICAL");
      accessibilityLocalizedString(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakOrQueueIfNeeded();

    }
  }
  return v8;
}

@end
