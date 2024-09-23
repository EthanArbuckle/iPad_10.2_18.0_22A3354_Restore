@implementation AVTAvatarAttributeEditorSectionColorControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTAvatarAttributeEditorSectionColorController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AVTAttributeCollectionViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("AVTAvatarAttributeEditorSectionColorItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("AVTCoreModelColor"));
  objc_msgSend(v3, "validateClass:", CFSTR("AVTAvatarAttributeEditorSectionColorDataSource"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionColorItem"), CFSTR("color"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTCoreModelColor"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAttributeCollectionViewCell"), CFSTR("attributeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionColorController"), CFSTR("selectedIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionColorController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionColorController"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionColorController"), CFSTR("sliderContainerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarColorSliderContainerView"), CFSTR("slider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionColorController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionColorController"), CFSTR("colorDataSource:didChangeDisplayMode:previousDisplayMode:"), "v", "@", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionColorDataSource"), CFSTR("sectionItemAtIndex:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("AVTAvatarAttributeEditorSectionCoordinator"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionCoordinator"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorViewController"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorDataSource"), CFSTR("categories"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorDataSource"), CFSTR("currentCategoryIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorCategory"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorCategory"), CFSTR("sections"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVTAvatarAttributeEditorSection"), CFSTR("localizedName"));

}

- (void)_axLoadAccessibilityForAttributeCell:(id)a3 atIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = a4;
  MEMORY[0x23490761C](CFSTR("AVTAttributeCollectionViewCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = v5;
    AXPerformSafeBlock();

  }
}

void __112__AVTAvatarAttributeEditorSectionColorControllerAccessibility__axLoadAccessibilityForAttributeCell_atIndexPath___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1[4], "safeValueForKey:", CFSTR("dataSource"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490761C](CFSTR("AVTAvatarAttributeEditorSectionColorDataSource"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "sectionItemAtIndex:", objc_msgSend(a1[5], "row"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safeValueForKey:", CFSTR("color"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeStringForKey:", CFSTR("localizedName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "safeUIViewForKey:", CFSTR("attributeView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v4);
    objc_msgSend(v5, "_accessibilitySetShouldIncludeRowRangeInElementDescription:", 1);

  }
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
  v17.super_class = (Class)AVTAvatarAttributeEditorSectionColorControllerAccessibility;
  -[AVTAvatarAttributeEditorSectionColorControllerAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  v16 = 0;
  objc_opt_class();
  -[AVTAvatarAttributeEditorSectionColorControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "visibleCells", 0);
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
        objc_msgSend(v4, "indexPathForCell:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTAvatarAttributeEditorSectionColorControllerAccessibility _axLoadAccessibilityForAttributeCell:atIndexPath:](self, "_axLoadAccessibilityForAttributeCell:atIndexPath:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

}

- (id)collectionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AVTAvatarAttributeEditorSectionColorControllerAccessibility;
  -[AVTAvatarAttributeEditorSectionColorControllerAccessibility collectionView](&v18, sel_collectionView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityContainerType:", 4);
  -[AVTAvatarAttributeEditorSectionColorControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("section"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("localizedName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_10;
  -[AVTAvatarAttributeEditorSectionColorControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490761C](CFSTR("AVTAvatarAttributeEditorSectionCoordinator"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "safeValueForKey:", CFSTR("delegate"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(v6, "safeValueForKey:", CFSTR("dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeArrayForKey:", CFSTR("categories"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "safeUnsignedIntegerForKey:", CFSTR("currentCategoryIndex")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "safeArrayForKey:", CFSTR("sections"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v4);
  if (v12 >= objc_msgSend(v11, "count"))
    goto LABEL_8;
  do
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeValueForKey:", CFSTR("localizedName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    --v12;
  }
  while (v12 < objc_msgSend(v11, "count") && !v5);
  if (!v5)
  {
LABEL_8:
    objc_msgSend(v10, "safeValueForKey:", CFSTR("localizedName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v5)
  {
LABEL_10:
    v14 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("section.name.color"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v15, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v16);

  }
  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarAttributeEditorSectionColorControllerAccessibility;
  v6 = a4;
  -[AVTAvatarAttributeEditorSectionColorControllerAccessibility collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionColorControllerAccessibility _axLoadAccessibilityForAttributeCell:atIndexPath:](self, "_axLoadAccessibilityForAttributeCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (void)colorDataSource:(id)a3 didChangeDisplayMode:(int64_t)a4 previousDisplayMode:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarAttributeEditorSectionColorControllerAccessibility;
  -[AVTAvatarAttributeEditorSectionColorControllerAccessibility colorDataSource:didChangeDisplayMode:previousDisplayMode:](&v15, sel_colorDataSource_didChangeDisplayMode_previousDisplayMode_, v8, a4, a5);
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    -[AVTAvatarAttributeEditorSectionColorControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("sliderContainerView.slider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v9);
  }
  else
  {
    v10 = -[AVTAvatarAttributeEditorSectionColorControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedIndex"));
    objc_opt_class();
    -[AVTAvatarAttributeEditorSectionColorControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = 0;
    else
      v12 = v10;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v14);
  }

}

@end
