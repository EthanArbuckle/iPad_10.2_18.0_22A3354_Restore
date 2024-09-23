@implementation PXCuratedLibraryZoomLevelControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXCuratedLibraryZoomLevelControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (Class)_axCuratedLibraryUIViewControllerClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryZoomLevelControl"), CFSTR("selectedZoomLevel"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryZoomLevelControl"), CFSTR("zoomLevelIdentifiers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryZoomLevelControl"), CFSTR("setSelectedZoomLevel:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryZoomLevelControl"), CFSTR("zoomLevelIdentifiers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryZoomLevelControl"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryZoomLevelControl"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryViewModel"), CFSTR("setZoomLevel:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryViewModel"), CFSTR("performChanges:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXCuratedLibraryUIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryUIViewController"), CFSTR("gridView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGView"), CFSTR("scrollViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXUIScrollViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXUIScrollViewController"), CFSTR("_scrollView"), "_PXUIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryZoomLevelControl"), CFSTR("_updateSegmentedControl"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXCuratedLibraryUIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryUIViewController"), CFSTR("isCollapsed"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibraryZoomLevelControlAccessibility;
  -[PXCuratedLibraryZoomLevelControlAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[PXCuratedLibraryZoomLevelControlAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryZoomLevelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("zoomLevelIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXCuratedLibraryZoomLevelControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedZoomLevel"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __91__PXCuratedLibraryZoomLevelControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_24FF06BC0;
  v8 = v4;
  v9 = v5;
  v6 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __91__PXCuratedLibraryZoomLevelControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  MEMORY[0x2348C1678](CFSTR("UIButton"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

void __91__PXCuratedLibraryZoomLevelControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];
  char v9;

  v3 = a2;
  v9 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v4, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__PXCuratedLibraryZoomLevelControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v8[3] = &__block_descriptor_48_e5_Q8__0l;
  v7 = *(_QWORD *)(a1 + 40);
  v8[4] = v6;
  v8[5] = v7;
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v8);

}

uint64_t __91__PXCuratedLibraryZoomLevelControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  uint64_t v1;

  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(a1 + 40))
    v1 = *MEMORY[0x24BDF7400];
  else
    v1 = 0;
  return v1 | *MEMORY[0x24BDF73B0];
}

- (void)_updateSegmentedControl
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryZoomLevelControlAccessibility;
  -[PXCuratedLibraryZoomLevelControlAccessibility _updateSegmentedControl](&v3, sel__updateSegmentedControl);
  -[PXCuratedLibraryZoomLevelControlAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (BOOL)isAccessibilityElement
{
  return AXRequestingClient() == 3;
}

- (BOOL)accessibilityElementsHidden
{
  void *v3;
  void *v4;
  char v5;

  objc_opt_class();
  -[PXCuratedLibraryZoomLevelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isCollapsed"));
  return v5;
}

- (id)accessibilityLabel
{
  return accessibilityPhotosUICoreLocalizedString(CFSTR("photos.zoom.level.picker"));
}

- (id)accessibilityValue
{
  -[PXCuratedLibraryZoomLevelControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedZoomLevel"));
  return (id)PXCuratedLibraryZoomLevelLocalizedTitle();
}

- (id)accessibilityPath
{
  -[PXCuratedLibraryZoomLevelControlAccessibility accessibilityFrame](self, "accessibilityFrame");
  return (id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:");
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryZoomLevelControlAccessibility;
  return *MEMORY[0x24BDF73A0] | -[PXCuratedLibraryZoomLevelControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)_axAdjustZoomLevel:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v3 = a3;
  -[PXCuratedLibraryZoomLevelControlAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("zoomLevelIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXCuratedLibraryZoomLevelControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedZoomLevel"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v3)
    {
      if (v8 + 1 >= (unint64_t)objc_msgSend(v5, "count"))
        v9 = v8;
      else
        v9 = v8 + 1;
    }
    else if (v8)
    {
      v9 = v8 - 1;
    }
    else
    {
      v9 = 0;
    }
    if (v9 < objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "integerValue");

      -[PXCuratedLibraryZoomLevelControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewModel"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12;
      AXPerformSafeBlock();

    }
  }

}

uint64_t __68__PXCuratedLibraryZoomLevelControlAccessibility__axAdjustZoomLevel___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "setSelectedZoomLevel:", *(_QWORD *)(a1 + 48));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__PXCuratedLibraryZoomLevelControlAccessibility__axAdjustZoomLevel___block_invoke_2;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  v2 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v2, "performChanges:", v4);
}

uint64_t __68__PXCuratedLibraryZoomLevelControlAccessibility__axAdjustZoomLevel___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevel:", *(_QWORD *)(a1 + 32));
}

- (void)setSelectedZoomLevel:(int64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryZoomLevelControlAccessibility;
  -[PXCuratedLibraryZoomLevelControlAccessibility setSelectedZoomLevel:](&v5, sel_setSelectedZoomLevel_, a3);
  -[PXCuratedLibraryZoomLevelControlAccessibility _axSiblingScrollView](self, "_axSiblingScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axSetPXGScrollViewElements:", 0);

}

- (id)_axSiblingScrollView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[PXCuratedLibraryZoomLevelControlAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_368, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("gridView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("scrollViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2348C1678](CFSTR("PXUIScrollViewController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_scrollView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityIdentification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("AXCuratedLibraryScrollView"));

  if ((v8 & 1) == 0)
  {

LABEL_4:
    v6 = 0;
  }

  return v6;
}

uint64_t __69__PXCuratedLibraryZoomLevelControlAccessibility__axSiblingScrollView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C1678](CFSTR("PXCuratedLibraryUIViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)accessibilityIncrement
{
  -[PXCuratedLibraryZoomLevelControlAccessibility _axAdjustZoomLevel:](self, "_axAdjustZoomLevel:", 1);
}

- (void)accessibilityDecrement
{
  -[PXCuratedLibraryZoomLevelControlAccessibility _axAdjustZoomLevel:](self, "_axAdjustZoomLevel:", 0);
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

@end
