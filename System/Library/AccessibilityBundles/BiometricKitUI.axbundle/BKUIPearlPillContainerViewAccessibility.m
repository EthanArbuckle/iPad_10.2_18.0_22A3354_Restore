@implementation BKUIPearlPillContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUIPearlPillContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("BKUIPearlPillView"));
  objc_msgSend(v3, "validateClass:", CFSTR("BKUIPearlEnrollController"));
  objc_msgSend(v3, "validateClass:", CFSTR("HPSSpatialProfileEnrollmentController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlPillContainerView"), CFSTR("_pillViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlPillContainerView"), CFSTR("_numberOfVisiblePillViews"), "NSInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlEnrollViewController"), CFSTR("_state"), "int");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlEnrollViewController"), CFSTR("_substate"), "int");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlPillContainerView"), CFSTR("state"), "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlPillView"), CFSTR("state"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlPillContainerView"), CFSTR("_indexForPillAtAngle:"), "q", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlPillContainerView"), CFSTR("fillPillsAroundAngle:"), "B", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlPillContainerView"), CFSTR("animateToState:completion:"), "v", "i", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("didMoveToWindow"), "v", 0);

}

- (id)_axPearlEnrollControllerShell
{
  JUMPOUT(0x234908ECCLL);
}

- (void)_setAXPearlEnrollControllerShell:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilitySetPearlEnrollViewController:(id)a3
{
  AXPearlWeakObjectShell *v4;
  id v5;

  v5 = a3;
  MEMORY[0x234908E3C](CFSTR("BKUIPearlEnrollViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(AXPearlWeakObjectShell);
    -[AXPearlWeakObjectShell setWeakObjectReference:](v4, "setWeakObjectReference:", v5);
LABEL_5:
    -[BKUIPearlPillContainerViewAccessibility _setAXPearlEnrollControllerShell:](self, "_setAXPearlEnrollControllerShell:", v4);

    goto LABEL_6;
  }
  MEMORY[0x234908E3C](CFSTR("HPSSpatialProfileEnrollmentController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(AXPearlWeakObjectShell);
    -[AXPearlWeakObjectShell setWeakSpatialProfileReference:](v4, "setWeakSpatialProfileReference:", v5);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)didMoveToWindow
{
  BKUIPearlPillContainerViewAccessibility *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlPillContainerViewAccessibility;
  -[BKUIPearlPillContainerViewAccessibility didMoveToWindow](&v5, sel_didMoveToWindow);
  v3 = self;
  -[BKUIPearlPillContainerViewAccessibility window](v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[BKUIPearlPillContainerViewAccessibility _axStopTimer](v3, "_axStopTimer");
    -[BKUIPearlPillContainerViewAccessibility _setAXNudgeTimer:](v3, "_setAXNudgeTimer:", 0);
  }

}

- (BOOL)isAccessibilityElement
{
  return -[BKUIPearlPillContainerViewAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("state"))
       - 5 < 4;
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  __CFString *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKUIPearlPillContainerViewAccessibility;
  -[BKUIPearlPillContainerViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BKUIPearlPillContainerViewAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("state"));
  if ((v4 - 5) < 2)
  {
    v5 = CFSTR("pearl.scan.first");
LABEL_5:
    accessibilityLocalizedString(v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
    return v3;
  }
  if ((v4 - 7) <= 1)
  {
    v5 = CFSTR("pearl.scan.second");
    goto LABEL_5;
  }
  return v3;
}

- (id)_axAnglesToCheck
{
  return &unk_250195FF0;
}

- (id)_axDirectionForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[BKUIPearlPillContainerViewAccessibility _axAnglesToCheck](self, "_axAnglesToCheck");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 < 0 || objc_msgSend(v4, "count") <= (unint64_t)a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_axLabelKeysForDirection
{
  _QWORD v3[8];
  _QWORD v4[9];

  v4[8] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_250196008;
  v3[1] = &unk_250196018;
  v4[0] = CFSTR("pearl.direction.right");
  v4[1] = CFSTR("pearl.direction.up.right");
  v3[2] = &unk_250196028;
  v3[3] = &unk_250196038;
  v4[2] = CFSTR("pearl.direction.up");
  v4[3] = CFSTR("pearl.direction.up.left");
  v3[4] = &unk_250196048;
  v3[5] = &unk_250196058;
  v4[4] = CFSTR("pearl.direction.left");
  v4[5] = CFSTR("pearl.direction.down.left");
  v3[6] = &unk_250196068;
  v3[7] = &unk_250196078;
  v4[6] = CFSTR("pearl.direction.down");
  v4[7] = CFSTR("pearl.direction.down.right");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_axLookKeysForDirection
{
  _QWORD v3[8];
  _QWORD v4[9];

  v4[8] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_250196008;
  v3[1] = &unk_250196018;
  v4[0] = CFSTR("pearl.direction.look.right");
  v4[1] = CFSTR("pearl.direction.look.up.right");
  v3[2] = &unk_250196028;
  v3[3] = &unk_250196038;
  v4[2] = CFSTR("pearl.direction.look.up");
  v4[3] = CFSTR("pearl.direction.look.up.left");
  v3[4] = &unk_250196048;
  v3[5] = &unk_250196058;
  v4[4] = CFSTR("pearl.direction.look.left");
  v4[5] = CFSTR("pearl.direction.look.down.left");
  v3[6] = &unk_250196068;
  v3[7] = &unk_250196078;
  v4[6] = CFSTR("pearl.direction.look.down");
  v4[7] = CFSTR("pearl.direction.look.down.right");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_axSectionForAngle:(double)a3
{
  int64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -1;
  AXPerformSafeBlock();
  v3 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

float __62__BKUIPearlPillContainerViewAccessibility__axSectionForAngle___block_invoke(uint64_t a1)
{
  unint64_t v2;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_indexForPillAtAngle:", *(double *)(a1 + 48));
  result = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "safeUnsignedIntegerForKey:", CFSTR("_numberOfVisiblePillViews"))* 0.125;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 / vcvtps_u32_f32(result);
  return result;
}

- (id)_axUnfilledDirections
{
  JUMPOUT(0x234908ECCLL);
}

- (void)_setAXUnfilledDirections:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_accessibilityUnfilledDirections
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  BKUIPearlPillContainerViewAccessibility *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[BKUIPearlPillContainerViewAccessibility _axUnfilledDirections](self, "_axUnfilledDirections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlPillContainerViewAccessibility _axAnglesToCheck](self, "_axAnglesToCheck");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      v8 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "floatValue", v11, v12, v13, v14, v15);
          v11 = v8;
          v12 = 3221225472;
          v13 = __75__BKUIPearlPillContainerViewAccessibility__accessibilityUnfilledDirections__block_invoke;
          v14 = &unk_250193C08;
          v15 = self;
          v16 = v3;
          AXPerformSafeBlock();

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v8, 3221225472, __75__BKUIPearlPillContainerViewAccessibility__accessibilityUnfilledDirections__block_invoke, &unk_250193C08, self);
      }
      while (v6);
    }
    -[BKUIPearlPillContainerViewAccessibility _setAXUnfilledDirections:](self, "_setAXUnfilledDirections:", v3);

  }
  return v3;
}

void __75__BKUIPearlPillContainerViewAccessibility__accessibilityUnfilledDirections__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_indexForPillAtAngle:", *(double *)(a1 + 56));
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_pillViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234908E3C](CFSTR("BKUIPearlPillView"));
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "safeUnsignedIntegerForKey:", CFSTR("state")) == 2)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 48));

}

- (id)accessibilityValue
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[BKUIPearlPillContainerViewAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("state"));
  if (v3 == 8 || v3 == 6)
  {
    accessibilityLocalizedString(CFSTR("pearl.scan.completed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BKUIPearlPillContainerViewAccessibility _accessibilityUnfilledDirections](self, "_accessibilityUnfilledDirections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlPillContainerViewAccessibility _axLookKeysForDirection](self, "_axLookKeysForDirection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)BKUIPearlPillContainerViewAccessibility;
  -[BKUIPearlPillContainerViewAccessibility _accessibilityScrollStatus](&v25, sel__accessibilityScrollStatus);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlPillContainerViewAccessibility _accessibilityUnfilledDirections](self, "_accessibilityUnfilledDirections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v20 = v3;
    accessibilityLocalizedString(CFSTR("pearl.direction.incomplete"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        v11 = v5;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
          -[BKUIPearlPillContainerViewAccessibility _axLabelKeysForDirection](self, "_axLabelKeysForDirection", v17, v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          accessibilityLocalizedString(v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = CFSTR("__AXStringForVariablesSentinel");
          __UIAXStringForVariables();
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          ++v10;
          v11 = v5;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16, v17, CFSTR("__AXStringForVariablesSentinel"));
      }
      while (v8);
    }

    __UIAXStringForVariables();
    v15 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v15;
    v4 = v19;
  }

  return v3;
}

- (id)_axSpokenDirections
{
  JUMPOUT(0x234908ECCLL);
}

- (void)_setAXSpokenDirections:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axImpactFeedbackGenerator
{
  JUMPOUT(0x234908ECCLL);
}

- (void)_setAXImpactFeedbackGenerator:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (BOOL)fillPillsAroundAngle:(double)a3
{
  _BOOL4 v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BKUIPearlPillContainerViewAccessibility;
  v5 = -[BKUIPearlPillContainerViewAccessibility fillPillsAroundAngle:](&v16, sel_fillPillsAroundAngle_);
  if (v5 && UIAccessibilityIsVoiceOverRunning())
  {
    v6 = 6.28318531;
    if (a3 + 0.392699082 >= 0.0)
      v6 = 0.0;
    -[BKUIPearlPillContainerViewAccessibility _axDirectionForSection:](self, "_axDirectionForSection:", -[BKUIPearlPillContainerViewAccessibility _axSectionForAngle:](self, "_axSectionForAngle:", a3 + 0.392699082 + v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlPillContainerViewAccessibility _axSpokenDirections](self, "_axSpokenDirections");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      -[BKUIPearlPillContainerViewAccessibility _setAXSpokenDirections:](self, "_setAXSpokenDirections:", v8);
    }
    if ((objc_msgSend(v8, "containsObject:", v7) & 1) == 0)
    {
      -[BKUIPearlPillContainerViewAccessibility _accessibilityUnfilledDirections](self, "_accessibilityUnfilledDirections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v7);
      -[BKUIPearlPillContainerViewAccessibility _setAXUnfilledDirections:](self, "_setAXUnfilledDirections:", v9);
      objc_msgSend(v8, "addObject:", v7);
      objc_msgSend(v8, "count");
      v10 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("pearl.progress.percent"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AXFormatFloatWithPercentage();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      UIAccessibilitySpeak();
      -[BKUIPearlPillContainerViewAccessibility _axImpactFeedbackGenerator](self, "_axImpactFeedbackGenerator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AF0]), "initWithStyle:", 0);
        -[BKUIPearlPillContainerViewAccessibility _setAXImpactFeedbackGenerator:](self, "_setAXImpactFeedbackGenerator:", v14);
      }
      objc_msgSend(v14, "impactOccurred");
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE20]);
      -[BKUIPearlPillContainerViewAccessibility _axResetTimer](self, "_axResetTimer");

    }
  }
  return v5;
}

- (id)_axNudgeTimer
{
  JUMPOUT(0x234908ECCLL);
}

- (void)_setAXNudgeTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_axStartTimer
{
  id v3;

  -[BKUIPearlPillContainerViewAccessibility _axStopTimer](self, "_axStopTimer");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__axProvideNudge, 0, 1, 4.0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlPillContainerViewAccessibility _setAXNudgeTimer:](self, "_setAXNudgeTimer:", v3);

}

- (void)_axStopTimer
{
  id v2;

  -[BKUIPearlPillContainerViewAccessibility _axNudgeTimer](self, "_axNudgeTimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)_axResetTimer
{
  -[BKUIPearlPillContainerViewAccessibility _axStopTimer](self, "_axStopTimer");
  -[BKUIPearlPillContainerViewAccessibility _axStartTimer](self, "_axStartTimer");
}

- (id)_axCurrentNudgeDirection
{
  JUMPOUT(0x234908ECCLL);
}

- (void)_setAXCurrentNudgeDirection:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (int64_t)_axCurrentNudgeCount
{
  return __UIAccessibilityGetAssociatedInteger();
}

- (void)_setAXCurrentNudgeCount:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInteger();
}

- (void)_axProvideNudge
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[BKUIPearlPillContainerViewAccessibility _axPearlEnrollControllerShell](self, "_axPearlEnrollControllerShell");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "weakObjectReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    if ((objc_msgSend(v3, "safeIntForKey:", CFSTR("_state")) & 0xFFFFFFFD) != 5
      || objc_msgSend(v4, "safeIntForKey:", CFSTR("_substate")))
    {
      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(v15, "weakSpatialProfileReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_15;
  }
  -[BKUIPearlPillContainerViewAccessibility _accessibilityUnfilledDirections](self, "_accessibilityUnfilledDirections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlPillContainerViewAccessibility _axCurrentNudgeDirection](self, "_axCurrentNudgeDirection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
    {
      -[BKUIPearlPillContainerViewAccessibility _setAXCurrentNudgeDirection:](self, "_setAXCurrentNudgeDirection:", v6);
      -[BKUIPearlPillContainerViewAccessibility _setAXCurrentNudgeCount:](self, "_setAXCurrentNudgeCount:", 0);
    }
    v8 = -[BKUIPearlPillContainerViewAccessibility _axCurrentNudgeCount](self, "_axCurrentNudgeCount");
    -[BKUIPearlPillContainerViewAccessibility _axLookKeysForDirection](self, "_axLookKeysForDirection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 < 3)
    {
      UIAccessibilitySpeakIfNotSpeaking();
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("pearl.direction.recenter"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakIfNotSpeaking();

    }
    -[BKUIPearlPillContainerViewAccessibility _setAXCurrentNudgeCount:](self, "_setAXCurrentNudgeCount:", v8 + 1);

  }
  else
  {
    -[BKUIPearlPillContainerViewAccessibility _axStopTimer](self, "_axStopTimer");
    -[BKUIPearlPillContainerViewAccessibility _setAXCurrentNudgeDirection:](self, "_setAXCurrentNudgeDirection:", 0);
    -[BKUIPearlPillContainerViewAccessibility _setAXCurrentNudgeCount:](self, "_setAXCurrentNudgeCount:", 0);
  }

LABEL_15:
}

- (void)animateToState:(int)a3 completion:(id)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKUIPearlPillContainerViewAccessibility;
  -[BKUIPearlPillContainerViewAccessibility animateToState:completion:](&v7, sel_animateToState_completion_, *(_QWORD *)&a3, a4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    switch(a3)
    {
      case 5:
      case 7:
        -[BKUIPearlPillContainerViewAccessibility _axStartTimer](self, "_axStartTimer");
        break;
      case 6:
        -[BKUIPearlPillContainerViewAccessibility _axStopTimer](self, "_axStopTimer");
        -[BKUIPearlPillContainerViewAccessibility _axSpokenDirections](self, "_axSpokenDirections");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeAllObjects");
        -[BKUIPearlPillContainerViewAccessibility _setAXUnfilledDirections:](self, "_setAXUnfilledDirections:", 0);
        -[BKUIPearlPillContainerViewAccessibility _setAXCurrentNudgeDirection:](self, "_setAXCurrentNudgeDirection:", 0);
        -[BKUIPearlPillContainerViewAccessibility _setAXCurrentNudgeCount:](self, "_setAXCurrentNudgeCount:", 0);

        break;
      case 8:
        -[BKUIPearlPillContainerViewAccessibility _axStopTimer](self, "_axStopTimer");
        break;
      default:
        return;
    }
  }
}

@end
