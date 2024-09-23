@implementation SBPIPContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBPIPContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBPIPContainerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPIPContainerViewController"), CFSTR("setNeedsLayoutForInteractionController:traits:withReason:behavior:completion:"), "v", "@", "Q", "Q", "i", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPIPContainerViewController"), CFSTR("interactionControllerDidEndAllInteractions:targetWindowScene:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBPIPContainerViewController"), CFSTR("_contentView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBPIPPegasusContainerAdapter"), CFSTR("_pictureInPictureViewController"), "PGPictureInPictureViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBPIPContainerViewController"), CFSTR("_adapter"), "<SBPIPContainerViewControllerAdapter>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPIPContainerViewController"), CFSTR("SB_accessibilitySetContentViewScale:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPIPContainerViewController"), CFSTR("SB_accessibilityContentViewScale"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGControlsContainerView"), CFSTR("_handleSingleTapGestureRecognizer:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPIPContainerViewController"), CFSTR("SB_accessibilityToggleStashed"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGPictureInPictureViewController"), CFSTR("setStashed:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGPictureInPictureViewController"), CFSTR("setStashTabHidden:left:withSpringBehavior:"), "v", "B", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGPictureInPictureViewController"), CFSTR("setStashProgress:"), "v", "d", 0);

}

- (void)interactionControllerDidEndAllInteractions:(id)a3 targetWindowScene:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBPIPContainerViewControllerAccessibility;
  -[SBPIPContainerViewControllerAccessibility interactionControllerDidEndAllInteractions:targetWindowScene:](&v9, sel_interactionControllerDidEndAllInteractions_targetWindowScene_, a3, a4);
  PIPAXCurrentQuad = -[SBPIPContainerViewControllerAccessibility _quadrantForContentView](self, "_quadrantForContentView");
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("pip.window.moving.end"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPContainerViewControllerAccessibility _announcementStringForQuadrant:](self, "_announcementStringForQuadrant:", PIPAXCurrentQuad);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPIPContainerViewControllerAccessibility _postAnnouncement:](self, "_postAnnouncement:", v8);
  PIPAXCurrentQuad = -1;

}

- (void)setNeedsLayoutForInteractionController:(id)a3 traits:(unint64_t)a4 withReason:(unint64_t)a5 behavior:(int)a6 completion:(id)a7
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v9 = PIPAXCurrentQuad;
  v13.receiver = self;
  v13.super_class = (Class)SBPIPContainerViewControllerAccessibility;
  -[SBPIPContainerViewControllerAccessibility setNeedsLayoutForInteractionController:traits:withReason:behavior:completion:](&v13, sel_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion_, a3, a4, a5, *(_QWORD *)&a6, a7);
  if (a5 == 128)
  {
    v10 = -[SBPIPContainerViewControllerAccessibility _quadrantForContentView](self, "_quadrantForContentView");
    PIPAXCurrentQuad = v10;
    if (v9 == -1)
    {
      accessibilityLocalizedString(CFSTR("pip.window.moving.start"));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 == (_DWORD)v10)
        return;
      -[SBPIPContainerViewControllerAccessibility _announcementStringForQuadrant:](self, "_announcementStringForQuadrant:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    if (v11)
    {
      -[SBPIPContainerViewControllerAccessibility _postAnnouncement:](self, "_postAnnouncement:", v11);

    }
  }
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("pip.window.expand"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel__axExpandPIPWindow);

  accessibilityLocalizedString(CFSTR("pip.window.expand.short"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setShortName:", v6);

  v7 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("pip.window.shrink"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:target:selector:", v8, self, sel__axShrinkPIPWindow);

  accessibilityLocalizedString(CFSTR("pip.window.shrink.short"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setShortName:", v10);

  v11 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("pip.window.stash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:target:selector:", v12, self, sel__axStashPIPWindow);

  accessibilityLocalizedString(CFSTR("pip.window.stash"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setShortName:", v14);

  v17[0] = v5;
  v17[1] = v9;
  v17[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)_axStashPIPWindow
{
  AXPerformSafeBlock();
  return 1;
}

void __62__SBPIPContainerViewControllerAccessibility__axStashPIPWindow__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "SB_accessibilityToggleStashed");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)_axShrinkPIPWindow
{
  double v3;
  double v4;
  double v5;
  void *v6;

  -[SBPIPContainerViewControllerAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("SB_accessibilityContentViewScale"));
  v4 = v3 + -0.1;
  if (v4 >= 0.0)
    v5 = v4;
  else
    v5 = 0.0;
  -[SBPIPContainerViewControllerAccessibility SB_accessibilitySetContentViewScale:](self, "SB_accessibilitySetContentViewScale:", v5);
  if (v5 == 0.0)
    accessibilityLocalizedString(CFSTR("pip.window.size.min"));
  else
    AXFormatFloatWithPercentage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPContainerViewControllerAccessibility _postAnnouncement:](self, "_postAnnouncement:", v6);

  AXPerformBlockOnMainThreadAfterDelay();
  return 1;
}

void __63__SBPIPContainerViewControllerAccessibility__axShrinkPIPWindow__block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)_axExpandPIPWindow
{
  double v3;
  double v4;
  double v5;
  void *v6;

  -[SBPIPContainerViewControllerAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("SB_accessibilityContentViewScale"));
  v4 = v3 + 0.1;
  if (v4 <= 1.0)
    v5 = v4;
  else
    v5 = 1.0;
  -[SBPIPContainerViewControllerAccessibility SB_accessibilitySetContentViewScale:](self, "SB_accessibilitySetContentViewScale:", v5);
  if (v5 == 1.0)
    accessibilityLocalizedString(CFSTR("pip.window.size.max"));
  else
    AXFormatFloatWithPercentage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPContainerViewControllerAccessibility _postAnnouncement:](self, "_postAnnouncement:", v6);

  AXPerformBlockOnMainThreadAfterDelay();
  return 1;
}

void __63__SBPIPContainerViewControllerAccessibility__axExpandPIPWindow__block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_postAnnouncement:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDD1458];
  v4 = a3;
  v5 = [v3 alloc];
  v8 = *MEMORY[0x24BDFEAD8];
  v9[0] = &unk_250381810;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:attributes:", v4, v6);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v7);
}

- (int)_quadrantForContentView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;

  objc_opt_class();
  -[SBPIPContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "center");
  v6 = v5;
  v8 = v7;

  objc_opt_class();
  -[SBPIPContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  v15 = v12 * 0.5;
  v16 = v14 * 0.5;
  v17 = v15;
  v18 = v16;
  if (v8 <= v16 && v6 <= v17)
    return 1;
  if (v8 <= v18 && v6 > v17)
    return 2;
  if (v6 <= v17 && v8 > v18)
    return 3;
  else
    return 4;
}

- (id)_announcementStringForQuadrant:(int)a3
{
  if ((a3 - 1) > 3)
    return 0;
  accessibilityLocalizedString(off_2503681F8[a3 - 1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)accessibilityActivate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v7;

  -[SBPIPContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_adapter._pictureInPictureViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_controlsContainerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v4;
  v5 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __66__SBPIPContainerViewControllerAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSingleTapGestureRecognizer:", 0);
}

@end
