@implementation AKTextAttributesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKTextAttributesViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AKSegmentedCtrl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKTextAttributesViewController"), CFSTR("tableView: cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKTextAttributesViewController"), CFSTR("createRowAlignmentCell"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKSegmentedCtrl"), CFSTR("segmentAtIndex:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKSegmentedCtrl"), CFSTR("tagForSegment:"), "q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKTextAttributesViewController"), CFSTR("presetFontController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKTextAttributesViewController"), CFSTR("currentFontFamilyName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKFontListController"), CFSTR("fonts"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKTextAttributesViewControllerAccessibility;
  -[AKTextAttributesViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[AKTextAttributesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("alignmentTableCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKTextAttributesViewControllerAccessibility _axAddAlignmentLabels:](self, "_axAddAlignmentLabels:", v4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AKTextAttributesViewControllerAccessibility;
  -[AKTextAttributesViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v22, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[AKTextAttributesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("presetFontController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("fonts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v7, "row");
  if (v12 < objc_msgSend(v11, "count"))
  {
    objc_opt_class();
    objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKTextAttributesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentFontFamilyName"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = *MEMORY[0x24BDF73B0];
    if (v14 && v15)
    {
      objc_msgSend(v14, "familyName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsString:", v16);

      v20 = *MEMORY[0x24BDF7400];
      if (!v19)
        v20 = 0;
      v17 |= v20;
    }
    objc_msgSend(v8, "setAccessibilityTraits:", v17);

  }
  return v8;
}

- (void)_axAddAlignmentLabels:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v11 = a3;
  objc_msgSend(v11, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "safeUnsignedIntegerForKey:", CFSTR("segmentCount"));
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy__0;
      v18 = __Block_byref_object_dispose__0;
      v19 = 0;
      v13 = v4;
      AXPerformSafeBlock();
      v8 = (id)v15[5];

      _Block_object_dispose(&v14, 8);
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v17 = 0;
      v12 = v13;
      AXPerformSafeBlock();
      v9 = v15[3];

      _Block_object_dispose(&v14, 8);
      if (v9 < 4)
      {
        accessibilityLocalizedString(off_25014EF18[v9]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAccessibilityLabel:", v10);

      }
    }
  }

}

uint64_t __69__AKTextAttributesViewControllerAccessibility__axAddAlignmentLabels___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23490590C](CFSTR("AKSegmentedCtrl"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __69__AKTextAttributesViewControllerAccessibility__axAddAlignmentLabels___block_invoke_212(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "segmentAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __69__AKTextAttributesViewControllerAccessibility__axAddAlignmentLabels___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "tagForSegment:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)createRowAlignmentCell
{
  void *v3;
  void *v4;
  objc_super v6;
  char v7;

  v7 = 0;
  objc_opt_class();
  v6.receiver = self;
  v6.super_class = (Class)AKTextAttributesViewControllerAccessibility;
  -[AKTextAttributesViewControllerAccessibility createRowAlignmentCell](&v6, sel_createRowAlignmentCell);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    abort();
  -[AKTextAttributesViewControllerAccessibility _axAddAlignmentLabels:](self, "_axAddAlignmentLabels:", v4);
  return v4;
}

@end
