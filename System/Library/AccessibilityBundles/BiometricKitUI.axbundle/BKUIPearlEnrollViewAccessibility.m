@implementation BKUIPearlEnrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUIPearlEnrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlEnrollView"), CFSTR("_tutorialMovieView"), "BKUIPearlMovieLoopView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlEnrollView"), CFSTR("_repositionPhoneLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlEnrollView"), CFSTR("state"), "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlEnrollView"), CFSTR("_updateRaiseLowerGuidanceLabelIfNeededForPitch:"), "v", "d", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollViewAccessibility;
  -[BKUIPearlEnrollViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[BKUIPearlEnrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tutorialMovieView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("pearl.tutorial.movie.description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (BKUIPearlEnrollViewAccessibility)init
{
  BKUIPearlEnrollViewAccessibility *v2;
  BKUIPearlEnrollViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollViewAccessibility;
  v2 = -[BKUIPearlEnrollViewAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BKUIPearlEnrollViewAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

- (id)_axSpokenGuidance
{
  JUMPOUT(0x234908ECCLL);
}

- (void)_setAXSpokenGuidance:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_updateRaiseLowerGuidanceLabelIfNeededForPitch:(double)a3
{
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKUIPearlEnrollViewAccessibility;
  -[BKUIPearlEnrollViewAccessibility _updateRaiseLowerGuidanceLabelIfNeededForPitch:](&v7, sel__updateRaiseLowerGuidanceLabelIfNeededForPitch_, a3);
  if (-[BKUIPearlEnrollViewAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("_state")) == 4)
  {
    -[BKUIPearlEnrollViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_repositionPhoneLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      -[BKUIPearlEnrollViewAccessibility _axSpokenGuidance](self, "_axSpokenGuidance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "isEqualToString:", v5);

      if ((v6 & 1) == 0)
      {
        -[BKUIPearlEnrollViewAccessibility _setAXSpokenGuidance:](self, "_setAXSpokenGuidance:", v4);
        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v4);
      }
    }

  }
  else
  {
    -[BKUIPearlEnrollViewAccessibility _setAXSpokenGuidance:](self, "_setAXSpokenGuidance:", 0);
  }
}

@end
