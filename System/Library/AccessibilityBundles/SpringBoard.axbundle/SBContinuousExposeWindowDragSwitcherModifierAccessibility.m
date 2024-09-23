@implementation SBContinuousExposeWindowDragSwitcherModifierAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBContinuousExposeWindowDragSwitcherModifier");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBContinuousExposeWindowDragSwitcherModifier"), CFSTR("selectedDisplayItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBGestureSwitcherModifierEvent"), CFSTR("phase"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBContinuousExposeWindowDragSwitcherModifier"), CFSTR("_destinationModifier"), "SBContinuousExposeWindowDragDestinationSwitcherModifier");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBContinuousExposeWindowDragDestinationSwitcherModifier"), CFSTR("proposedAppLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("allItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBContinuousExposeWindowDragSwitcherModifier"), CFSTR("handleGestureEvent:"), "@", "@", 0);

}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  UIAccessibilityNotifications v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifierAccessibility;
  -[SBContinuousExposeWindowDragSwitcherModifierAccessibility handleGestureEvent:](&v25, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeWindowDragSwitcherModifierAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedDisplayItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("phase"));
  -[SBContinuousExposeWindowDragSwitcherModifierAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_destinationModifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == 3)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v8, "safeValueForKey:", CFSTR("proposedAppLayout"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeArrayForKey:", CFSTR("allItems"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v11);
          if (*(void **)(*((_QWORD *)&v21 + 1) + 8 * i) == v6)
          {
            LODWORD(v12) = 1;
            goto LABEL_12;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_12:

    objc_msgSend(v6, "accessibilityLabel");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if ((_DWORD)v12 && v15)
    {
      v17 = *MEMORY[0x24BDF71E8];
      accessibilityLocalizedString(CFSTR("continuous.expose.window.drag.switcher.modifier.added.to.stage"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AXCFormattedString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v17, v19);

    }
  }

  return v5;
}

@end
