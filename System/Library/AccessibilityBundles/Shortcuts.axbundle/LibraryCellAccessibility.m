@implementation LibraryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Shortcuts.LibraryCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Shortcuts.LibraryCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Shortcuts.LibraryViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFWorkflowDescriptor"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFWorkflowReference"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Shortcuts.LibraryCell"), CFSTR("workflowReference"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Shortcuts.LibraryViewController"), CFSTR("libraryCellDidRequestComposeUI:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Shortcuts.LibraryViewController"), CFSTR("axDeleteWorkflowAction:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Shortcuts.LibraryViewController"), CFSTR("axDuplicateWorkflowAction:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Shortcuts.LibraryCell"), CFSTR("autoShortcut"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFExecutableAppShortcut"), CFSTR("phrase"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LNAutoShortcutLocalizedPhrase"), CFSTR("localizedPhrase"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[LibraryCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("workflowReference"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safeStringForKey:", CFSTR("name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeStringForKey:", CFSTR("subtitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
  }
  else
  {
    -[LibraryCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("autoShortcut"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("phrase"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeStringForKey:", CFSTR("localizedPhrase"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LibraryCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[LibraryCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  LibraryCellAccessibility *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v3 = (void *)objc_opt_new();
  -[LibraryCellAccessibility _axLibraryViewController](self, "_axLibraryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LibraryCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("workflowReference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  v7 = MEMORY[0x24BDAC760];
  if ((v6 & 1) != 0)
  {
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("delete.action"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke;
    v27[3] = &unk_250357E98;
    v28 = v4;
    v29 = v5;
    v10 = (void *)objc_msgSend(v8, "initWithName:actionHandler:", v9, v27);
    objc_msgSend(v3, "addObject:", v10);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("duplicate.action"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_3;
    v24[3] = &unk_250357E98;
    v25 = v4;
    v26 = v5;
    v13 = (void *)objc_msgSend(v11, "initWithName:actionHandler:", v12, v24);
    objc_msgSend(v3, "addObject:", v13);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("edit.action"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v7;
    v19 = 3221225472;
    v20 = __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_5;
    v21 = &unk_250357E98;
    v22 = v4;
    v23 = self;
    v16 = (void *)objc_msgSend(v14, "initWithName:actionHandler:", v15, &v18);
    objc_msgSend(v3, "addObject:", v16, v18, v19, v20, v21);

  }
  return v3;
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id v3;
  id v4;

  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "axDeleteWorkflowAction:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id v3;
  id v4;

  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "axDuplicateWorkflowAction:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __54__LibraryCellAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "libraryCellDidRequestComposeUI:", *(_QWORD *)(a1 + 40));
}

- (id)_axLibraryViewController
{
  void *v2;
  void *v3;

  -[LibraryCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
