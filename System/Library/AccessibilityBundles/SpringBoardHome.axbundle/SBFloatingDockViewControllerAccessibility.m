@implementation SBFloatingDockViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFloatingDockViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockViewController"), CFSTR("dismissPresentedFolderAnimated:completion:"), "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockViewController"), CFSTR("dockViewDidResignVisible"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("hasOpenFolder"), "B", 0);

}

- (BOOL)_axIsClosingFolder
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsClosingFolder:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)dismissPresentedFolderAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  SBFloatingDockViewControllerAccessibility *v19;
  id v20;
  id v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;

  v4 = a3;
  v6 = a4;
  -[SBFloatingDockViewControllerAccessibility _axSetIsClosingFolder:](self, "_axSetIsClosingFolder:", 1);
  AXSBHIconManagerFromSharedIconController();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __87__SBFloatingDockViewControllerAccessibility_dismissPresentedFolderAnimated_completion___block_invoke;
  v27 = &unk_250383A68;
  v28 = v7;
  AXPerformSafeBlock();
  objc_msgSend(v28, "safeValueForKey:", CFSTR("openedFolder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("displayName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "copy");

  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __87__SBFloatingDockViewControllerAccessibility_dismissPresentedFolderAnimated_completion___block_invoke_2;
  v17[3] = &unk_250383BE8;
  v22 = v9 != 0;
  v18 = v28;
  v19 = self;
  v23 = v4;
  v20 = v10;
  v21 = v11;
  v12 = v10;
  v13 = v11;
  v14 = v28;
  v15 = (void *)MEMORY[0x23492034C](v17);
  v16.receiver = self;
  v16.super_class = (Class)SBFloatingDockViewControllerAccessibility;
  -[SBFloatingDockViewControllerAccessibility dismissPresentedFolderAnimated:completion:](&v16, sel_dismissPresentedFolderAnimated_completion_, v4, v15);

}

uint64_t __87__SBFloatingDockViewControllerAccessibility_dismissPresentedFolderAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axSetCurrentFolderScrollEnabled:", 1);
}

void __87__SBFloatingDockViewControllerAccessibility_dismissPresentedFolderAnimated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
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
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  if (*(_BYTE *)(a1 + 64))
    v6 = v4;
  else
    v6 = 1;
  if ((v6 & 1) == 0 && objc_msgSend(*(id *)(a1 + 40), "_axIsClosingFolder"))
  {
    if (*(_BYTE *)(a1 + 65))
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
      objc_msgSend(v12, "stringWithFormat:", v13, *(_QWORD *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v11, "initWithString:attributes:", v14, v10);

      UIAccessibilityPostNotification(v7, v15);
    }
    objc_msgSend(*(id *)(a1 + 40), "_axSetIsClosingFolder:", 0);
  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)dockViewDidResignVisible
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFloatingDockViewControllerAccessibility;
  -[SBFloatingDockViewControllerAccessibility dockViewDidResignVisible](&v3, sel_dockViewDidResignVisible);
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didPotentiallyDismissNonExclusiveSystemUI");

}

@end
