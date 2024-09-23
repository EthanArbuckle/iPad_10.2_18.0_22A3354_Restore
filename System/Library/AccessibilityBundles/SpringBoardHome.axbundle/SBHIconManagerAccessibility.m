@implementation SBHIconManagerAccessibility

- (void)setEditing:(BOOL)a3 withFeedbackBehavior:(id)a4 location:(CGPoint)a5
{
  double y;
  double x;
  _BOOL8 v7;
  id v9;
  int v10;
  UIAccessibilityNotifications v11;
  void *v12;
  id v13;
  UIAccessibilityNotifications v14;
  void *v15;
  objc_super v16;

  y = a5.y;
  x = a5.x;
  v7 = a3;
  v9 = a4;
  v10 = -[SBHIconManagerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing"));
  v16.receiver = self;
  v16.super_class = (Class)SBHIconManagerAccessibility;
  -[SBHIconManagerAccessibility setEditing:withFeedbackBehavior:location:](&v16, sel_setEditing_withFeedbackBehavior_location_, v7, v9, x, y);

  if (v10 != -[SBHIconManagerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing")))
  {
    if (v10)
    {
      SBHAXCancelSBAXIconMoveSpeakTimer();
      v11 = *MEMORY[0x24BDF71E8];
      accessibilityLocalizedString(CFSTR("homescreen.editing.ended"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v11, v12);

      if (!AXDeviceIsPad())
      {
LABEL_7:
        UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
        goto LABEL_8;
      }
      -[SBHIconManagerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconDragManager"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
      AXPerformSafeBlock();

    }
    else
    {
      v14 = *MEMORY[0x24BDF71E8];
      accessibilityLocalizedString(CFSTR("homescreen.editing.started"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v14, v13);
    }

    goto LABEL_7;
  }
LABEL_8:
  SBAXIconOpenedFolderWhileJiggling = 0;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHIconManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("hasOpenFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("openedFolder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("iconDragManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("setMainDisplayLibraryViewVisible:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("pushExpandedIcon:location:context:animated:completionHandler:"), "v", "@", "@", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("setEditing:withFeedbackBehavior:location:"), "v", "B", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("closeFolderAnimated:withCompletion:"), "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconDragManager"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("cancelAllDrags"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolder"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("displayName"), "@", 0);

}

- (void)pushExpandedIcon:(id)a3 location:(id)a4 context:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  objc_super v19;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;

  v8 = a6;
  v12 = a3;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_msgSend(a7, "copy");
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __92__SBHIconManagerAccessibility_pushExpandedIcon_location_context_animated_completionHandler___block_invoke;
  v20[3] = &unk_250383C10;
  v23 = v8;
  v20[4] = self;
  v21 = v12;
  v22 = v15;
  v16 = v15;
  v17 = v12;
  v18 = (void *)MEMORY[0x23492034C](v20);
  v19.receiver = self;
  v19.super_class = (Class)SBHIconManagerAccessibility;
  -[SBHIconManagerAccessibility pushExpandedIcon:location:context:animated:completionHandler:](&v19, sel_pushExpandedIcon_location_context_animated_completionHandler_, v17, v14, v13, v8, v18);

}

uint64_t __92__SBHIconManagerAccessibility_pushExpandedIcon_location_context_animated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t result;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    v4 = *(void **)(a1 + 32);
    AXSBIconControllerSharedInstance();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_axIconScrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_axSetCurrentFolderScrollEnabled:", objc_msgSend(v6, "isScrollEnabled"));

  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("hasOpenFolder"));
  if (*(_BYTE *)(a1 + 56))
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    NSClassFromString(CFSTR("SBFolderIcon"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, *MEMORY[0x24BDFEAD8], *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB68], 0);

      v12 = objc_allocWithZone(MEMORY[0x24BDD1458]);
      v13 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("opening.folder"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("displayName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v12, "initWithString:attributes:", v16, v11);

      LODWORD(v16) = *MEMORY[0x24BDF71E8];
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v17);
      SBAXIconOpenedFolderWhileJiggling = 1;
      UIAccessibilityPostNotification((UIAccessibilityNotifications)v16, (id)*MEMORY[0x24BDFEDF0]);

    }
  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __72__SBHIconManagerAccessibility_setEditing_withFeedbackBehavior_location___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAllDrags");
}

- (void)closeFolderAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  objc_super v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;

  v4 = a3;
  v6 = a4;
  -[SBHIconManagerAccessibility _axSetCurrentFolderScrollEnabled:](self, "_axSetCurrentFolderScrollEnabled:", 1);
  -[SBHIconManagerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("openedFolder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("displayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "copy");

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__SBHIconManagerAccessibility_closeFolderAnimated_withCompletion___block_invoke;
  v14[3] = &unk_250383C38;
  v15 = v8;
  v16 = v9;
  v17 = v7 != 0;
  v18 = v4;
  v14[4] = self;
  v10 = v8;
  v11 = v9;
  v12 = (void *)MEMORY[0x23492034C](v14);
  v13.receiver = self;
  v13.super_class = (Class)SBHIconManagerAccessibility;
  -[SBHIconManagerAccessibility closeFolderAnimated:withCompletion:](&v13, sel_closeFolderAnimated_withCompletion_, v4, v12);

}

void __66__SBHIconManagerAccessibility_closeFolderAnimated_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  char v6;
  UIAccessibilityNotifications v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("hasOpenFolder"));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  if (*(_BYTE *)(a1 + 56))
    v6 = v4;
  else
    v6 = 1;
  if ((v6 & 1) == 0 && *(_BYTE *)(a1 + 57))
  {
    v7 = *MEMORY[0x24BDF71E8];
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEDE8]);
    v8 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v9, *MEMORY[0x24BDFEAD8], *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB68], 0);

    v11 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v12 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("closing.folder"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithString:attributes:", v14, v10);

    UIAccessibilityPostNotification(v7, v15);
  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)setMainDisplayLibraryViewVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconManagerAccessibility;
  -[SBHIconManagerAccessibility setMainDisplayLibraryViewVisible:](&v9, sel_setMainDisplayLibraryViewVisible_);
  if (v3)
  {
    AXSBIconControllerSharedInstance();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_axDragManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_axGrabbedIcons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      if (!SBAXPerformingAXDrag)
      {
        accessibilityLocalizedString(CFSTR("icon.finished.scroll.for.app.library"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilitySpeakAndDoNotBeInterrupted();

      }
    }
  }
}

- (void)_axSetCurrentFolderScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  -[SBHIconManagerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentFolderController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilityDescendantOfType:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setScrollEnabled:", v3);
}

@end
