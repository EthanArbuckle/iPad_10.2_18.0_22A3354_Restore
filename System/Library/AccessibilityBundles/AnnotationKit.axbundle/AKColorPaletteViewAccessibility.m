@implementation AKColorPaletteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKColorPaletteView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKColorPaletteView"), CFSTR("collectionView: cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKColorPaletteView"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKColorPaletteView"), CFSTR("colors"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKColorPaletteView"), CFSTR("color"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)AKColorPaletteViewAccessibility;
  -[AKColorPaletteViewAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  v16 = 0;
  objc_opt_class();
  -[AKColorPaletteViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "indexPathsForVisibleItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "cellForItemAtIndexPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKColorPaletteViewAccessibility _axLoadCellAccessibility:atIndexPath:](self, "_axLoadCellAccessibility:atIndexPath:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

}

- (void)_axLoadCellAccessibility:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  LOBYTE(v15) = 0;
  objc_opt_class();
  -[AKColorPaletteViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("colors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "row");
  if (v10 < objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AXColorStringForColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v12);

    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v13 = v11;
    AXPerformSafeBlock();
    if (*((_BYTE *)v16 + 24))
      v14 = *MEMORY[0x24BDF7400];
    else
      v14 = 0;
    objc_msgSend(v6, "setAccessibilityTraits:", v14 | *MEMORY[0x24BDF73B0]);

    _Block_object_dispose(&v15, 8);
  }

}

void __72__AKColorPaletteViewAccessibility__axLoadCellAccessibility_atIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("color"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "akIsEqualToColor:", *(_QWORD *)(a1 + 40));

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKColorPaletteViewAccessibility;
  v6 = a4;
  -[AKColorPaletteViewAccessibility collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKColorPaletteViewAccessibility _axLoadCellAccessibility:atIndexPath:](self, "_axLoadCellAccessibility:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end
