@implementation LocalParticipantViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.LocalParticipantView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("accessibilityConstraintController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("toggleReactionsView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("reactionsViewController"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("ConversationKit.VideoReactionPickerViewController"), CFSTR("view"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNKFaceTimeConstraintsController"), CFSTR("localParticipantState"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ParticipantViewAccessibility"), CFSTR("_accessibilityVideoView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.LocalParticipantView"), CFSTR("controlsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.LocalParticipantControlsView"), CFSTR("collapseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.LocalParticipantView"), CFSTR("updateCountdownWith:"), "v", "q", 0);

}

- (id)_axGetParticipantView
{
  JUMPOUT(0x23490C1D0);
}

- (void)_axSetParticipantView:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (BOOL)isAccessibilityElement
{
  return !-[LocalParticipantViewAccessibility _accessibilityIsFullScreen](self, "_accessibilityIsFullScreen");
}

- (id)accessibilityAttributedLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;

  accessibilityLocalizedString(CFSTR("participant.video"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LocalParticipantViewAccessibility _axParticipantView](self, "_axParticipantView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v5, v12, CFSTR("__AXStringForVariablesSentinel"));
  v7 = *MEMORY[0x24BDF7378];
  v8 = objc_msgSend(v3, "length");
  v9 = objc_msgSend(v5, "length");
  v10 = objc_msgSend(v3, "length");
  objc_msgSend(v6, "addAttribute:value:range:", v7, MEMORY[0x24BDBD1C8], v8, v9 - v10);

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[LocalParticipantViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindDescendant:", &__block_literal_global_219);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LocalParticipantViewAccessibility _accessibilityIsExpanded](self, "_accessibilityIsExpanded"))
  {
    accessibilityLocalizedString(CFSTR("fullscreen"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[LocalParticipantViewAccessibility _axIsShowingVideo](self, "_axIsShowingVideo"))
    objc_msgSend(v4, "accessibilityValue");
  else
    accessibilityLocalizedString(CFSTR("video.hidden"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __55__LocalParticipantViewAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490C0EC](CFSTR("ConversationKit.MultiwayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __55__LocalParticipantViewAccessibility_accessibilityValue__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AXCFXViewFinder"));

  return v3;
}

- (id)accessibilityHint
{
  _BOOL4 v3;
  _BOOL4 v4;
  __CFString *v5;
  void *v6;

  v3 = -[LocalParticipantViewAccessibility _accessibilityIsExpanded](self, "_accessibilityIsExpanded");
  v4 = -[LocalParticipantViewAccessibility _axReactionsVisible](self, "_axReactionsVisible");
  if (-[LocalParticipantViewAccessibility _axIsShowingVideo](self, "_axIsShowingVideo"))
  {
    if (v3 || v4)
      v5 = CFSTR("minimize.hint");
    else
      v5 = CFSTR("maximize.hint");
    accessibilityLocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unint64_t)accessibilityTraits
{
  _BOOL4 v2;
  unint64_t *v3;

  v2 = -[LocalParticipantViewAccessibility _axIsShowingVideo](self, "_axIsShowingVideo");
  v3 = (unint64_t *)MEMORY[0x24BDF73B0];
  if (!v2)
    v3 = (unint64_t *)MEMORY[0x24BDF73E0];
  return *v3;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  UIAccessibilityNotifications v8;
  void *v9;
  __CFString *v10;
  void *v11;

  -[LocalParticipantViewAccessibility _axParticipantView](self, "_axParticipantView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LocalParticipantViewAccessibility _accessibilityIsExpanded](self, "_accessibilityIsExpanded");
  v5 = -[LocalParticipantViewAccessibility _axReactionsVisible](self, "_axReactionsVisible");
  if (-[LocalParticipantViewAccessibility _axIsShowingVideo](self, "_axIsShowingVideo"))
  {
    if (v4)
    {
      objc_opt_class();
      -[LocalParticipantViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("controlsView.collapseButton"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v7) = v6 != 0;
      if (v6)
      {
        objc_msgSend(v6, "sendActionsForControlEvents:", 64);
        v8 = *MEMORY[0x24BDF71E8];
        accessibilityLocalizedString(CFSTR("minimized.local"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilityPostNotification(v8, v9);

        UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
      }

    }
    else
    {
      objc_msgSend(v3, "safeValueForKey:", CFSTR("_axHandleSingleTap"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        LODWORD(v7) = *MEMORY[0x24BDF71E8];
        if (v5)
          v10 = CFSTR("minimized.local");
        else
          v10 = CFSTR("maximized.local");
        accessibilityLocalizedString(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilityPostNotification((UIAccessibilityNotifications)v7, v11);

        UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
        LOBYTE(v7) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (BOOL)accessibilityPerformEscape
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  UIAccessibilityNotifications v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  UIAccessibilityNotifications v11;
  void *v12;

  v3 = -[LocalParticipantViewAccessibility _accessibilityIsExpanded](self, "_accessibilityIsExpanded");
  if (-[LocalParticipantViewAccessibility _axReactionsVisible](self, "_axReactionsVisible"))
  {
    -[LocalParticipantViewAccessibility _axParticipantView](self, "_axParticipantView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_axHandleSingleTap"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = *MEMORY[0x24BDF71E8];
      accessibilityLocalizedString(CFSTR("minimized.local"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v6, v7);

      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
      return 1;
    }

  }
  if (!v3)
    return 0;
  objc_opt_class();
  -[LocalParticipantViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("controlsView.collapseButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10 != 0;
  if (v10)
  {
    objc_msgSend(v10, "sendActionsForControlEvents:", 64);
    v11 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("minimized.local"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v11, v12);

    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }

  return v8;
}

- (id)accessibilityCustomActions
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!-[LocalParticipantViewAccessibility _axReactionsVisible](self, "_axReactionsVisible")
    && !-[LocalParticipantViewAccessibility _accessibilityIsExpanded](self, "_accessibilityIsExpanded"))
  {
    v4 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("camera.open.reactions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithName:target:selector:", v5, self, sel__axHandleLongPress);
    objc_msgSend(v3, "addObject:", v6);

  }
  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[LocalParticipantViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("controlsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateCountdownWith:(int64_t)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LocalParticipantViewAccessibility;
  -[LocalParticipantViewAccessibility updateCountdownWith:](&v6, sel_updateCountdownWith_);
  v4 = *MEMORY[0x24BDF71E8];
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%ld"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

- (BOOL)_axIsShowingVideo
{
  void *v2;
  void *v3;
  char v4;

  -[LocalParticipantViewAccessibility _axParticipantView](self, "_axParticipantView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("_accessibilityVideoView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden") ^ 1;

  return v4;
}

- (BOOL)_axReactionsVisible
{
  void *v2;
  char v3;

  -[LocalParticipantViewAccessibility _axMultiwayViewController](self, "_axMultiwayViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isShowingReactions"));

  return v3;
}

- (id)_axParticipantView
{
  void *v3;

  -[LocalParticipantViewAccessibility _axGetParticipantView](self, "_axGetParticipantView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[LocalParticipantViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x23490C0EC](CFSTR("ConversationKit.ParticipantView")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[LocalParticipantViewAccessibility _axSetParticipantView:](self, "_axSetParticipantView:", v3);
  }
  return v3;
}

- (id)_axMultiwayViewController
{
  void *v2;
  void *v3;

  -[LocalParticipantViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_254, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __62__LocalParticipantViewAccessibility__axMultiwayViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490C0EC](CFSTR("ConversationKit.MultiwayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axConstraintsController
{
  void *v2;
  void *v3;

  -[LocalParticipantViewAccessibility _axMultiwayViewController](self, "_axMultiwayViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityConstraintController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsExpanded
{
  void *v2;
  uint64_t v3;

  -[LocalParticipantViewAccessibility _axConstraintsController](self, "_axConstraintsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("localParticipantState"));

  return v3 == 2;
}

- (BOOL)_accessibilityIsFullScreen
{
  void *v2;
  uint64_t v3;

  -[LocalParticipantViewAccessibility _axConstraintsController](self, "_axConstraintsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("localParticipantState"));

  return v3 == 3;
}

- (BOOL)_axHandleLongPress
{
  void *v2;
  uint64_t v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;

  -[LocalParticipantViewAccessibility _axMultiwayViewController](self, "_axMultiwayViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __55__LocalParticipantViewAccessibility__axHandleLongPress__block_invoke;
  v12 = &unk_2501E5A90;
  v13 = v2;
  AXPerformSafeBlock();
  v4 = dispatch_time(0, 1000000000);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __55__LocalParticipantViewAccessibility__axHandleLongPress__block_invoke_2;
  v7[3] = &unk_2501E5A90;
  v8 = v13;
  v5 = v13;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], v7);

  return 1;
}

uint64_t __55__LocalParticipantViewAccessibility__axHandleLongPress__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleReactionsView");
}

void __55__LocalParticipantViewAccessibility__axHandleLongPress__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("reactionsViewController"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("view"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v1);

}

@end
