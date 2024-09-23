@implementation ParticipantViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.ParticipantView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ConversationKit.ParticipantViewLabelContainerView"));
  objc_msgSend(v3, "validateClass:", CFSTR("ConversationKit.ParticipantMonogramView"));
  objc_msgSend(v3, "validateClass:", CFSTR("ConversationKit.ParticipantVideoView"));
  objc_msgSend(v3, "validateClass:", CFSTR("ConversationKit.ParticipantVideoOverlayView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantView"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantView"), CFSTR("isInRoster"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantView"), CFSTR("infoView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.TapInteraction"), CFSTR("numberOfTapsRequired"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.TapInteraction"), CFSTR("handleRecognizer:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantInfoView"), CFSTR("isMomentsAvailable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("accessibilityConstraintController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNKFaceTimeConstraintsController"), CFSTR("localParticipantState"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantInfoView"), CFSTR("didTapShutterButton"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("ConversationKit.MultiwayViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("mediaPipFrameInWindowScene"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantView"), CFSTR("kickMemberButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantView"), CFSTR("monogramView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  return -[ParticipantViewAccessibility _accessibilityIsLocalParticipantExpanded](self, "_accessibilityIsLocalParticipantExpanded")|| -[ParticipantViewAccessibility _accessibilityIsLocalParticipantFullScreen](self, "_accessibilityIsLocalParticipantFullScreen");
}

- (id)accessibilityLabel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[ParticipantViewAccessibility _accessibilityMonogramView](self, "_accessibilityMonogramView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[ParticipantViewAccessibility _accessibilityMonogramView](self, "_accessibilityMonogramView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v5, "length"))
  {
    v7 = v5;
  }
  else
  {
    -[ParticipantViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("infoView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityLabel");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[ParticipantViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))
  {
    accessibilityLocalizedString(CFSTR("fullscreen"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[ParticipantViewAccessibility _accessibilityVideoOverlayView](self, "_accessibilityVideoOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHidden") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityCustomActions
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  id v12;
  void *v13;
  char v14;
  int v15;
  __CFString *v16;
  objc_class *v17;
  __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CGRect v32;

  -[ParticipantViewAccessibility _accessibilityMultiwayViewController](self, "_accessibilityMultiwayViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeCGRectForKey:", CFSTR("mediaPipFrameInWindowScene"));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  if (CGRectEqualToRect(v32, *MEMORY[0x24BDBF090]))
  {
    -[ParticipantViewAccessibility _accessibilityVideoView](self, "_accessibilityVideoView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isHidden") & 1) == 0)
    {
      v14 = -[ParticipantViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isInRoster"));

      if ((v14 & 1) != 0)
      {
LABEL_11:
        -[ParticipantViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("monogramView"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "accessibilityCustomActions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v30);

        goto LABEL_12;
      }
      v15 = -[ParticipantViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"));
      v16 = CFSTR("enter.fullscreen");
      if (v15)
        v16 = CFSTR("exit.fullscreen");
      v17 = (objc_class *)MEMORY[0x24BDF6788];
      v18 = v16;
      v19 = [v17 alloc];
      accessibilityLocalizedString(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)objc_msgSend(v19, "initWithName:target:selector:", v20, self, sel__axHandleSingleTap);
      objc_msgSend(v12, "addObject:", v21);

      -[ParticipantViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("infoView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = objc_msgSend(v22, "safeBoolForKey:", CFSTR("isMomentsAvailable"));

      if ((_DWORD)v18)
      {
        v23 = objc_alloc(MEMORY[0x24BDF6788]);
        accessibilityLocalizedString(CFSTR("take.live.photo"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v23, "initWithName:target:selector:", v24, self, sel__axHandleTakeLivePhotoAction);
        objc_msgSend(v12, "addObject:", v25);

      }
      -[ParticipantViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("kickMemberButton"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "_accessibilityViewIsVisible"))
      {
        v26 = objc_alloc(MEMORY[0x24BDF6788]);
        accessibilityLocalizedString(CFSTR("kick.member"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v26, "initWithName:target:selector:", v27, self, sel__axHandleKickMemberAction);
        objc_msgSend(v12, "addObject:", v28);

      }
    }

    goto LABEL_11;
  }
LABEL_12:

  return v12;
}

- (BOOL)_axHandleSingleTap
{
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return 1;
}

void __50__ParticipantViewAccessibility__axHandleSingleTap__block_invoke()
{
  void *v0;
  void *v1;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "interactions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", &__block_literal_global_7);

}

void __50__ParticipantViewAccessibility__axHandleSingleTap__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  AX_RecognizedTapGestureRecognizer *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "safeIntegerForKey:", CFSTR("numberOfTapsRequired")) == 1)
  {
    v5 = objc_alloc_init(AX_RecognizedTapGestureRecognizer);
    objc_msgSend(v6, "handleRecognizer:", v5);

    *a4 = 1;
  }

}

- (BOOL)_axHandleTakeLivePhotoAction
{
  AXPerformSafeBlock();
  return 1;
}

void __60__ParticipantViewAccessibility__axHandleTakeLivePhotoAction__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("infoView"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didTapShutterButton");

}

- (BOOL)_axHandleKickMemberAction
{
  void *v2;
  void *v3;

  -[ParticipantViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("kickMemberButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendActionsForControlEvents:", 64);
  return v3 != 0;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[ParticipantViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("infoView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ParticipantViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("kickMemberButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ParticipantViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("monogramView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_accessibilityIsLocalParticipantExpanded
{
  void *v2;
  BOOL v3;

  -[ParticipantViewAccessibility _axConstraintsController](self, "_axConstraintsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("localParticipantState")) == 2;

  return v3;
}

- (BOOL)_accessibilityIsLocalParticipantFullScreen
{
  void *v2;
  BOOL v3;

  -[ParticipantViewAccessibility _axConstraintsController](self, "_axConstraintsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("localParticipantState")) == 3;

  return v3;
}

- (id)_axConstraintsController
{
  void *v2;
  void *v3;
  void *v4;

  -[ParticipantViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_254_0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityConstraintController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __56__ParticipantViewAccessibility__axConstraintsController__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490C0EC](CFSTR("ConversationKit.MultiwayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityMonogramView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ParticipantViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x23490C0EC](CFSTR("ConversationKit.ParticipantMonogramView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityVideoView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ParticipantViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x23490C0EC](CFSTR("ConversationKit.ParticipantVideoView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityVideoOverlayView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ParticipantViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x23490C0EC](CFSTR("ConversationKit.ParticipantVideoOverlayView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityMultiwayViewController
{
  void *v2;
  void *v3;

  -[ParticipantViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_255, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __68__ParticipantViewAccessibility__accessibilityMultiwayViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490C0EC](CFSTR("ConversationKit.MultiwayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
