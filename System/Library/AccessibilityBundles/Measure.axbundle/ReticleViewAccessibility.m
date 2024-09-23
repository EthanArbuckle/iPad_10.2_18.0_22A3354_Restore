@implementation ReticleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.ReticleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Measure.ReticleView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("setAlpha:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.ReticleView"), CFSTR("setState:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.ReticleView"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.ReticleView"), CFSTR("currentDiameter"), "f", 0);

}

- (id)axFirstLabelElement
{
  void *v3;
  void *v4;
  void *v5;

  AXMeasureLabelView();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLabelElementsWithAccessibilityContainer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)axIsFocusedOnRectangle
{
  void *v2;
  char v3;

  AXMeasureAccessibilityStateObserver();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "axHasSuggestedRectangle");

  return v3;
}

- (id)_axReticleElement
{
  JUMPOUT(0x234913D78);
}

- (void)_axSetReticleElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ReticleViewAccessibility _axReticleElement](self, "_axReticleElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    objc_initWeak(&location, self);
    v5 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __49__ReticleViewAccessibility_accessibilityElements__block_invoke;
    v15[3] = &unk_25026DEE0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v4, "_setAccessibilityFrameBlock:", v15);
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __49__ReticleViewAccessibility_accessibilityElements__block_invoke_2;
    v13[3] = &unk_25026DF08;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "_setAccessibilityLabelBlock:", v13);
    objc_msgSend(v4, "_setAccessibilityValueBlock:", &__block_literal_global_2);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __49__ReticleViewAccessibility_accessibilityElements__block_invoke_4;
    v11[3] = &unk_25026DF08;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "_setAccessibilityHintBlock:", v11);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __49__ReticleViewAccessibility_accessibilityElements__block_invoke_5;
    v9[3] = &unk_25026DF70;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v9);
    -[ReticleViewAccessibility _axSetReticleElement:](self, "_axSetReticleElement:", v4);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v3, "addObject:", v4);
  AXMeasureLabelView();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilityLabelElementsWithAccessibilityContainer:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  return v3;
}

double __49__ReticleViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axFrameForReticleElement");
  v3 = v2;

  return v3;
}

id __49__ReticleViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axStringForReticleState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __49__ReticleViewAccessibility_accessibilityElements__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axHintForReticleElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __49__ReticleViewAccessibility_accessibilityElements__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_axTraitsForReticleElement");

  return v2;
}

- (CGRect)_axFrameForReticleElement
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[ReticleViewAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("currentDiameter"));
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  UIRectCenteredRect();

  UIAccessibilityFrameForBounds();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_axHintForReticleElement
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ReticleViewAccessibility;
  -[ReticleViewAccessibility accessibilityHint](&v6, sel_accessibilityHint);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ReticleViewAccessibility axIsFocusedOnRectangle](self, "axIsFocusedOnRectangle"))
  {
    accessibilityLocalizedString(CFSTR("RETICLE_HINT_RECTANGLE"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (unint64_t)_axTraitsForReticleElement
{
  return *MEMORY[0x24BDF7430];
}

- (int64_t)_axReticleState
{
  return -[ReticleViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("state"));
}

- (id)_axStringForReticleState
{
  int64_t v3;
  __CFString *v4;

  v3 = -[ReticleViewAccessibility _axReticleState](self, "_axReticleState");
  v4 = CFSTR("RETICLE_STATE_NONE");
  switch(v3)
  {
    case 0:
      goto LABEL_7;
    case 1:
      if (-[ReticleViewAccessibility axIsFocusedOnRectangle](self, "axIsFocusedOnRectangle"))
        v4 = CFSTR("RETICLE_STATE_GOOD_RECTANGLE");
      else
        v4 = CFSTR("RETICLE_STATE_GOOD");
      goto LABEL_7;
    case 2:
      v4 = CFSTR("RETICLE_STATE_POOR");
      goto LABEL_7;
    case 3:
      v4 = CFSTR("RETICLE_STATE_INVALID");
LABEL_7:
      accessibilityLocalizedString(v4);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)_axLastAnnouncementForReticleState
{
  JUMPOUT(0x234913D78);
}

- (void)_axSetLastAnnouncementForReticleState:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_axAnnounceReticleState
{
  void *v3;
  id v4;

  -[ReticleViewAccessibility _axLastAnnouncementForReticleState](self, "_axLastAnnouncementForReticleState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ReticleViewAccessibility _axStringForReticleState](self, "_axStringForReticleState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_msgSend(v4, "isEqualToString:", v3) & 1) == 0)
  {
    AXMeasureSpeakMeasurementAnnouncement(v3);
    -[ReticleViewAccessibility _axSetLastAnnouncementForReticleState:](self, "_axSetLastAnnouncementForReticleState:", v3);
  }

}

- (void)_axAnnounceReticleStateAfterDelay
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__axAnnounceReticleState, 0);
  -[ReticleViewAccessibility performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__axAnnounceReticleState, 0, 0.3);
}

- (void)setState:(int64_t)a3
{
  int64_t v5;
  void *v6;
  double v7;
  double v8;
  objc_super v9;

  v5 = -[ReticleViewAccessibility _axReticleState](self, "_axReticleState");
  v9.receiver = self;
  v9.super_class = (Class)ReticleViewAccessibility;
  -[ReticleViewAccessibility setState:](&v9, sel_setState_, a3);
  if (v5 != a3)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alpha");
    v8 = v7;

    if (v8 >= 1.0)
      -[ReticleViewAccessibility _axAnnounceReticleStateAfterDelay](self, "_axAnnounceReticleStateAfterDelay");
  }
}

- (void)setAlpha:(double)a3
{
  void *v5;
  double v6;
  double v7;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;

  v8.receiver = self;
  v8.super_class = (Class)ReticleViewAccessibility;
  -[ReticleViewAccessibility setAlpha:](&v8, sel_setAlpha_, a3);
  if (a3 >= 1.0 && v7 <= 0.0)
    -[ReticleViewAccessibility _axAnnounceReticleStateAfterDelay](self, "_axAnnounceReticleStateAfterDelay");
}

@end
