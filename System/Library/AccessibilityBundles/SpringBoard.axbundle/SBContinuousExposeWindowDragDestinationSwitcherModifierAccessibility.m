@implementation SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBContinuousExposeWindowDragDestinationSwitcherModifier");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBContinuousExposeWindowDragDestinationSwitcherModifier"), CFSTR("proposedDestination"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBContinuousExposeWindowDragDestinationSwitcherModifier"), CFSTR("selectedDisplayItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBContinuousExposeWindowDragDestinationSwitcherModifier"), CFSTR("handleGestureEvent:"), "@", "@", 0);

}

- (id)handleGestureEvent:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility;
  -[SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility handleGestureEvent:](&v13, sel_handleGestureEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("proposedDestination"));
  -[SBContinuousExposeWindowDragDestinationSwitcherModifierAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedDisplayItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 != 2)
  {
    if (v5)
      goto LABEL_12;
    if (cancelDrag != 1)
      goto LABEL_12;
    accessibilityLocalizedString(CFSTR("continuous.expose.window.drag.destination.cancel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    cancelDrag = 0;
    if (!v8)
      goto LABEL_12;
LABEL_11:
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v8);

    goto LABEL_12;
  }
  if ((cancelDrag & 1) == 0)
  {
    objc_msgSend(v6, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      accessibilityLocalizedString(CFSTR("continuous.expose.window.drag.destination.add.to.stage"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessibilityLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AXCFormattedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    cancelDrag = 1;

    if (v8)
      goto LABEL_11;
  }
LABEL_12:

  return v4;
}

@end
