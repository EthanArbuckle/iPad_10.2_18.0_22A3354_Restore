@implementation SBMoveGestureFloatingSwitcherModifierAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBMoveGestureFloatingSwitcherModifier");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_axGetCurrentFloatingConfiguration
{
  return (int)__UIAccessibilityGetAssociatedInt();
}

- (void)_axSetCurrentFloatingConfiguration:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInt();
}

- (int64_t)_axGetFinishedFloatingConfiguration
{
  return (int)__UIAccessibilityGetAssociatedInt();
}

- (void)_axSetFinishedFloatingConfiguration:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInt();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBMoveGestureFloatingSwitcherModifier"), CFSTR("SBSwitcherModifier"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMoveGestureFloatingSwitcherModifier"), CFSTR("initialFloatingConfiguration"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMoveGestureFloatingSwitcherModifier"), CFSTR("_updateForGestureDidBeginWithEvent:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMoveGestureFloatingSwitcherModifier"), CFSTR("_updateForGestureDidChangeWithEvent:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMoveGestureFloatingSwitcherModifier"), CFSTR("_updateForGestureDidEndWithEvent:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMoveGestureFloatingSwitcherModifier"), CFSTR("containerViewBounds"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBSwitcherModifier"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SBSwitcherModifier"), CFSTR("SBSwitcherContextProviding"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBSwitcherContextProviding"), CFSTR("switcherViewBounds"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBSwitcherContextProviding"), CFSTR("medusaSettings"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBGestureSwitcherModifierEvent"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBGestureSwitcherModifierEvent"), CFSTR("translationInContainerView"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBGestureSwitcherModifierEvent"), CFSTR("velocityInContainerView"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBMedusaSettings"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMedusaSettings"), CFSTR("movePanGestureNegativeVelocityThreshold"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMedusaSettings"), CFSTR("movePanGesturePositiveVelocityThreshold"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMedusaSettings"), CFSTR("movePanGestureThresholdPercentage"), "d", 0);

}

- (id)_updateForGestureDidBeginWithEvent:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMoveGestureFloatingSwitcherModifierAccessibility;
  -[SBMoveGestureFloatingSwitcherModifierAccessibility _updateForGestureDidBeginWithEvent:](&v6, sel__updateForGestureDidBeginWithEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMoveGestureFloatingSwitcherModifierAccessibility _axSetCurrentFloatingConfiguration:](self, "_axSetCurrentFloatingConfiguration:", -[SBMoveGestureFloatingSwitcherModifierAccessibility _axInitialFloatingConfiguration](self, "_axInitialFloatingConfiguration"));
  return v4;
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  int v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBMoveGestureFloatingSwitcherModifierAccessibility;
  v4 = a3;
  -[SBMoveGestureFloatingSwitcherModifierAccessibility _updateForGestureDidChangeWithEvent:](&v14, sel__updateForGestureDidChangeWithEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBMoveGestureFloatingSwitcherModifierAccessibility _axGetCurrentFloatingConfiguration](self, "_axGetCurrentFloatingConfiguration", v14.receiver, v14.super_class);
  v7 = -[SBMoveGestureFloatingSwitcherModifierAccessibility _axFloatingConfigurationForGestureEvent:withZeroVelocity:](self, "_axFloatingConfigurationForGestureEvent:withZeroVelocity:", v4, 1);

  if (v6 != v7 && (unint64_t)(v7 - 1) <= 1)
  {
    -[SBMoveGestureFloatingSwitcherModifierAccessibility _axSetCurrentFloatingConfiguration:](self, "_axSetCurrentFloatingConfiguration:", v7);
    v8 = -[SBMoveGestureFloatingSwitcherModifierAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL");
    if (v7 == 2)
    {
      v9 = CFSTR("lift.move.app.right");
      v10 = CFSTR("lift.move.app.left");
    }
    else
    {
      if (v7 != 1)
      {
        v12 = 0;
LABEL_12:
        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v12);

        return v5;
      }
      v9 = CFSTR("lift.move.app.left");
      v10 = CFSTR("lift.move.app.right");
    }
    if (v8)
      v11 = (__CFString *)v10;
    else
      v11 = (__CFString *)v9;
    accessibilityLocalizedString(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  return v5;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMoveGestureFloatingSwitcherModifierAccessibility;
  v4 = a3;
  -[SBMoveGestureFloatingSwitcherModifierAccessibility _updateForGestureDidEndWithEvent:](&v8, sel__updateForGestureDidEndWithEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBMoveGestureFloatingSwitcherModifierAccessibility _axFloatingConfigurationForGestureEvent:withZeroVelocity:](self, "_axFloatingConfigurationForGestureEvent:withZeroVelocity:", v4, 0, v8.receiver, v8.super_class);

  -[SBMoveGestureFloatingSwitcherModifierAccessibility _axSetFinishedFloatingConfiguration:](self, "_axSetFinishedFloatingConfiguration:", v6);
  return v5;
}

- (int64_t)_axInitialFloatingConfiguration
{
  return -[SBMoveGestureFloatingSwitcherModifierAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("initialFloatingConfiguration"));
}

- (int64_t)_axFloatingConfigurationForGestureEvent:(id)a3 withZeroVelocity:(BOOL)a4
{
  id v6;
  int64_t v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  uint64_t v25;
  double Width;
  id v27;
  double MinX;
  double MaxX;
  double v30;
  id *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  _BOOL4 v38;
  _BOOL4 v39;
  int v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  int64_t v46;
  int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  int64_t v56;
  uint64_t v58;
  double v59;
  double v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v6 = a3;
  v7 = -[SBMoveGestureFloatingSwitcherModifierAccessibility _axInitialFloatingConfiguration](self, "_axInitialFloatingConfiguration");
  -[SBMoveGestureFloatingSwitcherModifierAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("switcherViewBounds"));
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[SBMoveGestureFloatingSwitcherModifierAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("containerViewBounds"));
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v6, "safeCGPointForKey:", CFSTR("translationInContainerView"));
  v60 = v24;
  v25 = 0;
  if (!a4)
    objc_msgSend(v6, "safeCGPointForKey:", CFSTR("velocityInContainerView"), 0.0);
  v58 = v25;
  v61.origin.x = v17;
  v61.origin.y = v19;
  v61.size.width = v21;
  v61.size.height = v23;
  Width = CGRectGetWidth(v61);
  -[SBMoveGestureFloatingSwitcherModifierAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("medusaSettings"));
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v62.origin.x = v9;
  v62.origin.y = v11;
  v62.size.width = v13;
  v62.size.height = v15;
  MinX = CGRectGetMinX(v62);
  v63.origin.x = v9;
  v63.origin.y = v11;
  v63.size.width = v13;
  v63.size.height = v15;
  MaxX = CGRectGetMaxX(v63);
  v30 = Width * 0.5;
  v31 = (id *)MEMORY[0x24BDF74F8];
  v32 = Width * 0.5 + MinX + 24.0;
  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection") == 1)
    v33 = MaxX + -24.0 - v30;
  else
    v33 = v30 + MinX + 24.0;
  if (objc_msgSend(*v31, "userInterfaceLayoutDirection", v58) != 1)
    v32 = MaxX + -24.0 - v30;
  v34 = MinX + -24.0 - v30;
  v35 = v30 + MaxX + 24.0;
  if (objc_msgSend(*v31, "userInterfaceLayoutDirection") == 1)
    v36 = v35;
  else
    v36 = MinX + -24.0 - v30;
  if (objc_msgSend(*v31, "userInterfaceLayoutDirection") == 1)
    v35 = v34;
  v37 = objc_msgSend(*v31, "userInterfaceLayoutDirection");
  v38 = v32 >= v60;
  if (v37 == 1)
    v38 = v32 <= v60;
  v39 = v33 <= v60;
  if (v37 == 1)
    v39 = v33 >= v60;
  if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    v40 = v39;
  else
    v40 = v38;
  switch(v7)
  {
    case 0:
    case 4:
      v41 = v40 == 0;
      if (v40)
        v36 = v33;
      else
        v36 = v32;
      if (v40)
        v33 = v32;
      else
        v33 = v35;
      v40 = 1;
      if (v41)
        v42 = 2;
      else
        v42 = 1;
      goto LABEL_47;
    case 1:
      if (v40)
      {
        v36 = v33;
        v33 = v32;
        v42 = 1;
      }
      else
      {
        v42 = 3;
      }
      if (v40)
        v43 = 2;
      else
        v43 = 1;
      v40 = 0;
      break;
    case 2:
      v41 = v40 == 0;
      if (v40)
        v36 = v33;
      else
        v36 = v32;
      if (v40)
        v33 = v32;
      else
        v33 = v35;
      if (v40)
        v42 = 1;
      else
        v42 = 2;
LABEL_47:
      if (v41)
        v43 = 4;
      else
        v43 = 2;
      break;
    case 3:
      if (v40)
      {
        v36 = v33;
        v33 = v32;
        v42 = 1;
      }
      else
      {
        v42 = 3;
      }
      if (v40)
        v43 = 2;
      else
        v43 = 1;
      break;
    default:
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v33 = 0.0;
      v36 = 0.0;
      break;
  }
  if (objc_msgSend(*v31, "userInterfaceLayoutDirection") == 1)
    v44 = v33;
  else
    v44 = v36;
  if (objc_msgSend(*v31, "userInterfaceLayoutDirection") == 1)
    v45 = v36;
  else
    v45 = v33;
  if (objc_msgSend(*v31, "userInterfaceLayoutDirection") == 1)
    v46 = v43;
  else
    v46 = v42;
  if (objc_msgSend(*v31, "userInterfaceLayoutDirection") == 1)
    v43 = v42;
  v47 = v40 ^ (objc_msgSend(*v31, "userInterfaceLayoutDirection") == 1);
  objc_msgSend(v27, "safeCGFloatForKey:", CFSTR("movePanGestureNegativeVelocityThreshold"));
  v49 = v48;
  objc_msgSend(v27, "safeCGFloatForKey:", CFSTR("movePanGesturePositiveVelocityThreshold"));
  v51 = v50;
  objc_msgSend(v27, "safeCGFloatForKey:", CFSTR("movePanGestureThresholdPercentage"));
  if (v47)
    v53 = -v49;
  else
    v53 = v51;
  v54 = -v51;
  if (!v47)
    v54 = v49;
  if (v44 >= v45)
    -[SBMoveGestureFloatingSwitcherModifierAccessibility _axFloatingConfigurationForGestureEvent:withZeroVelocity:].cold.1();
  if (v53 <= 0.0)
    -[SBMoveGestureFloatingSwitcherModifierAccessibility _axFloatingConfigurationForGestureEvent:withZeroVelocity:].cold.2();
  if (v54 >= 0.0)
    -[SBMoveGestureFloatingSwitcherModifierAccessibility _axFloatingConfigurationForGestureEvent:withZeroVelocity:].cold.3();
  if (v44 >= v60)
    v55 = v44;
  else
    v55 = v60;
  if (v45 <= v55)
    v55 = v45;
  v56 = v43;
  if (v53 > v59)
  {
    v56 = v46;
    if (v54 < v59)
    {
      if (v47)
        v52 = 1.0 - v52;
      if (v55 <= v44 + (v45 - v44) * v52)
        v56 = v46;
      else
        v56 = v43;
    }
  }

  return v56;
}

- (void)_axFloatingConfigurationForGestureEvent:withZeroVelocity:.cold.1()
{
  __assert_rtn("AXSBFloatingConfigurationForMovingFloatingApplication", "SBMoveGestureFloatingSwitcherModifierAccessibility.m", 273, "effectiveMinCenterX < effectiveMaxCenterX");
}

- (void)_axFloatingConfigurationForGestureEvent:withZeroVelocity:.cold.2()
{
  __assert_rtn("AXSBFloatingConfigurationForMovingFloatingApplication", "SBMoveGestureFloatingSwitcherModifierAccessibility.m", 274, "positiveVelocity > 0.0f");
}

- (void)_axFloatingConfigurationForGestureEvent:withZeroVelocity:.cold.3()
{
  __assert_rtn("AXSBFloatingConfigurationForMovingFloatingApplication", "SBMoveGestureFloatingSwitcherModifierAccessibility.m", 275, "negativeVelocity < 0.0f");
}

@end
