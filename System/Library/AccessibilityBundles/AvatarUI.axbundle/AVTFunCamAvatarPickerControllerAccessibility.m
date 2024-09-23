@implementation AVTFunCamAvatarPickerControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTFunCamAvatarPickerController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFunCamAvatarPickerController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFunCamAvatarPickerController"), CFSTR("collectionView:didSelectItemAtIndexPath:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFunCamAvatarPickerController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFunCamAvatarPickerController"), CFSTR("isDisplayingGridLayout"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFunCamAvatarPickerController"), CFSTR("items"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFunCamAvatarPickerController"), CFSTR("selectedIndexPath"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFunCamAvatarPickerController"), CFSTR("indexPathForNoneItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFunCamAvatarPickerController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarListRecordItem"), CFSTR("avatar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVTFunCamAvatarPickerController"), CFSTR("_allowsCreation"), "BOOL");
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVTAvatarRecord"), CFSTR("isEditable"));

}

- (id)_axFunCamAvatarCarousel
{
  JUMPOUT(0x234907670);
}

- (void)_setAXFunCamAvatarCarousel:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (BOOL)_axFunCamAvatarPickerDidSetupCells
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_setAXFunCamAvatarPickerDidSetupCells:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  AX_FunCamAvatarCarousel *v3;
  AX_FunCamAvatarCarousel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)AVTFunCamAvatarPickerControllerAccessibility;
  -[AVTFunCamAvatarPickerControllerAccessibility _accessibilityLoadAccessibilityInformation](&v24, sel__accessibilityLoadAccessibilityInformation);
  if ((-[AVTFunCamAvatarPickerControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isDisplayingGridLayout")) & 1) == 0)
  {
    -[AVTFunCamAvatarPickerControllerAccessibility _axFunCamAvatarCarousel](self, "_axFunCamAvatarCarousel");
    v3 = (AX_FunCamAvatarCarousel *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [AX_FunCamAvatarCarousel alloc];
      -[AVTFunCamAvatarPickerControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[AX_FunCamAvatarCarousel initWithFunCamAvatarPickerController:accessibilityContainer:](v4, "initWithFunCamAvatarPickerController:accessibilityContainer:", self, v5);

      -[AVTFunCamAvatarPickerControllerAccessibility _setAXFunCamAvatarCarousel:](self, "_setAXFunCamAvatarCarousel:", v3);
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axSafelyAddObject:", v3);
    -[AVTFunCamAvatarPickerControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v8);

    -[AVTFunCamAvatarPickerControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityElements:", v6);

  }
  if (!-[AVTFunCamAvatarPickerControllerAccessibility _axFunCamAvatarPickerDidSetupCells](self, "_axFunCamAvatarPickerDidSetupCells"))
  {
    v23 = 0;
    objc_opt_class();
    -[AVTFunCamAvatarPickerControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v11, "visibleCells", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v11, "indexPathForCell:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTFunCamAvatarPickerControllerAccessibility _setupAccessibilityForCell:atIndexPath:](self, "_setupAccessibilityForCell:atIndexPath:", v17, v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v14);
    }

    -[AVTFunCamAvatarPickerControllerAccessibility _setAXFunCamAvatarPickerDidSetupCells:](self, "_setAXFunCamAvatarPickerDidSetupCells:", 1);
  }
}

- (id)_axLabelForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  -[AVTFunCamAvatarPickerControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTFunCamAvatarPickerControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("indexPathForNoneItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8
    && (-[AVTFunCamAvatarPickerControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_allowsCreation")) & 1) == 0)
  {
    accessibilityLocalizedString(CFSTR("puppet.none"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeValueForKey:", CFSTR("avatar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 || objc_msgSend(v4, "item"))
    {
      objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForAvatarWithRecord:includeVideoPrefix:", v10, 0);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      accessibilityLocalizedString(CFSTR("starfish.add"));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;

  }
  return v12;
}

- (id)_axRecordForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  -[AVTFunCamAvatarPickerControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("items"));
  v5 = objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTFunCamAvatarPickerControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("indexPathForNoneItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v4, "isEqual:", v7);

  if ((v5 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeValueForKey:", CFSTR("avatar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 || objc_msgSend(v4, "item"))
      v10 = v8;

  }
  return v8;
}

- (void)_setupAccessibilityForCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (-[AVTFunCamAvatarPickerControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isDisplayingGridLayout")) & 1) != 0|| objc_msgSend(v7, "item") == 0;
  objc_msgSend(v6, "setIsAccessibilityElement:", v8);
  v9 = objc_msgSend(v6, "accessibilityTraits");
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v9);
  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __87__AVTFunCamAvatarPickerControllerAccessibility__setupAccessibilityForCell_atIndexPath___block_invoke;
  v22[3] = &unk_250182050;
  objc_copyWeak(&v24, &location);
  v11 = v7;
  v23 = v11;
  objc_msgSend(v6, "_setAccessibilityLabelBlock:", v22);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __87__AVTFunCamAvatarPickerControllerAccessibility__setupAccessibilityForCell_atIndexPath___block_invoke_2;
  v19[3] = &unk_250182078;
  objc_copyWeak(&v21, &location);
  v12 = v11;
  v20 = v12;
  objc_msgSend(v6, "_setAccessibilityCustomContentBlock:", v19);
  objc_opt_class();
  -[AVTFunCamAvatarPickerControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("items"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v12, "item"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeValueForKey:", CFSTR("avatar"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v16, "safeBoolForKey:", CFSTR("isEditable"));

  if ((_DWORD)v13)
  {
    accessibilityLocalizedString(CFSTR("starfish.avatar"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityUserInputLabels:", v18);

  }
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

id __87__AVTFunCamAvatarPickerControllerAccessibility__setupAccessibilityForCell_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axLabelForIndexPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __87__AVTFunCamAvatarPickerControllerAccessibility__setupAccessibilityForCell_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axRecordForIndexPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDFFA88], "customContentForAvatarWithRecord:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTFunCamAvatarPickerControllerAccessibility;
  -[AVTFunCamAvatarPickerControllerAccessibility viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[AVTFunCamAvatarPickerControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTFunCamAvatarPickerControllerAccessibility;
  v6 = a4;
  -[AVTFunCamAvatarPickerControllerAccessibility collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTFunCamAvatarPickerControllerAccessibility _setupAccessibilityForCell:atIndexPath:](self, "_setupAccessibilityForCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  -[AVTFunCamAvatarPickerControllerAccessibility _setAXFunCamAvatarPickerDidSetupCells:](self, "_setAXFunCamAvatarPickerDidSetupCells:", 1);
  return v7;
}

@end
