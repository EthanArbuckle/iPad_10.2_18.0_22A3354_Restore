@implementation HorizontalLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.HorizontalLockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)lockupViewCustomActions
{
  JUMPOUT(0x234917684);
}

- (void)setLockupViewCustomActions:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("accessibilityLibraryStatusControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("contextMenuButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("showsContextMenu"), "B", 0);
  objc_msgSend(v3, "validateClass:hasProperty:customGetter:customSetter:withType:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("collectionView"), CFSTR("_collectionView"), CFSTR("_setCollectionView:"), "@");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("UICollectionViewTableCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewTableLayout"), CFSTR("_delegateActual"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:customGetter:customSetter:withType:", CFSTR("UICollectionViewTableCell"), CFSTR("tableLayout"), CFSTR("_tableLayout"), 0, "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewTableLayout"), CFSTR("contextualActionForDeletingRowAtIndexPath:"), "@", "@", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("UICollectionViewDelegateTableLayout"), CFSTR("collectionView:tableLayout:commitEditingStyle:forRowAtIndexPath:"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("reactionsButton"), "Optional<Button>");

}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location[2];

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(location[0]) = 0;
  objc_opt_class();
  -[HorizontalLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLibraryStatusControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIsInCell:", 1);
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && objc_msgSend(v6, "length"))
  {
    objc_initWeak(location, v5);
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v31[3] = &unk_2502C96F8;
    objc_copyWeak(&v32, location);
    v9 = (void *)objc_msgSend(v8, "initWithName:actionHandler:", v7, v31);
    objc_msgSend(v3, "addObject:", v9);

    objc_destroyWeak(&v32);
    objc_destroyWeak(location);
  }
  LOBYTE(location[0]) = 0;
  objc_opt_class();
  -[HorizontalLockupCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("reactionsButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (LOBYTE(location[0]))
    goto LABEL_15;
  if (v11)
  {
    objc_initWeak(location, v11);
    v12 = objc_alloc(MEMORY[0x24BDF6788]);
    objc_msgSend(v11, "accessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
    v29[3] = &unk_2502C96F8;
    objc_copyWeak(&v30, location);
    v16 = (void *)objc_msgSend(v12, "initWithName:actionHandler:", v15, v29, v14, CFSTR("__AXStringForVariablesSentinel"));

    objc_msgSend(v3, "addObject:", v16);
    objc_destroyWeak(&v30);
    objc_destroyWeak(location);
  }
  if (-[HorizontalLockupCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsContextMenu")))
  {
    LOBYTE(location[0]) = 0;
    objc_opt_class();
    -[HorizontalLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contextMenuButton"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsSafeCategory();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!LOBYTE(location[0]))
    {
      objc_msgSend(v18, "accessibilityLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v18 && objc_msgSend(v19, "length"))
      {
        objc_initWeak(location, v18);
        v21 = objc_alloc(MEMORY[0x24BDF6788]);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3;
        v27[3] = &unk_2502C96F8;
        objc_copyWeak(&v28, location);
        v22 = (void *)objc_msgSend(v21, "initWithName:actionHandler:", v20, v27);
        objc_msgSend(v3, "addObject:", v22);

        objc_destroyWeak(&v28);
        objc_destroyWeak(location);
      }

      goto LABEL_14;
    }
LABEL_15:
    abort();
  }
LABEL_14:
  -[HorizontalLockupCollectionViewCellAccessibility setLockupViewCustomActions:](self, "setLockupViewCustomActions:", v3);
  v26.receiver = self;
  v26.super_class = (Class)HorizontalLockupCollectionViewCellAccessibility;
  -[HorizontalLockupCollectionViewCellAccessibility accessibilityCustomActions](&v26, sel_accessibilityCustomActions);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 64);

  return 1;
}

uint64_t __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 64);

  return 1;
}

uint64_t __77__HorizontalLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityShowContextMenuForElement:targetPointValue:", WeakRetained, 0);

  return 1;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HorizontalLockupCollectionViewCellAccessibility;
  -[HorizontalLockupCollectionViewCellAccessibility automationElements](&v10, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[HorizontalLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLibraryStatusControl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v8);

  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HorizontalLockupCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HorizontalLockupCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilityIndexPathForCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[HorizontalLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_privateAccessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  objc_super v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)HorizontalLockupCollectionViewCellAccessibility;
  -[HorizontalLockupCollectionViewCellAccessibility _privateAccessibilityCustomActions](&v13, sel__privateAccessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[HorizontalLockupCollectionViewCellAccessibility _accessibilityIndexPathForCell](self, "_accessibilityIndexPathForCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[HorizontalLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tableLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "safeValueForKey:", CFSTR("_delegateActual"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) != 0)
        {
          objc_msgSend(v7, "contextualActionForDeletingRowAtIndexPath:", v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HorizontalLockupCollectionViewCellAccessibility axCustomActionForContextualAction:](self, "axCustomActionForContextualAction:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "axSafelyAddObject:", v11);

        }
      }
    }
  }

  return v3;
}

- (BOOL)_axPerformCustomAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "_accessibilityValueForKey:", CFSTR("AXHorizontalLockupCollectionViewCellActionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = v5;
    AXPerformSafeBlock();

  }
  return 1;
}

void __74__HorizontalLockupCollectionViewCellAccessibility__axPerformCustomAction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v3 + 2))(v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_16);

  }
}

- (id)axCustomActionForContextualAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "title"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v7))
  {
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    objc_msgSend(v5, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithName:target:selector:", v9, self, sel__axPerformCustomAction_);

    objc_msgSend(v10, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("AXHorizontalLockupCollectionViewCellActionKey"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
