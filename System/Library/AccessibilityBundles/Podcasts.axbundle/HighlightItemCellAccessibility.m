@implementation HighlightItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.HighlightItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SLHighlightPillView"));
  objc_msgSend(v3, "validateClass:", CFSTR("ShelfKitCollectionViews.ArtworkView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__HighlightItemCellAccessibility_accessibilityLabel__block_invoke;
  v8[3] = &unk_2502FCF10;
  v8[4] = self;
  v9 = v3;
  v4 = v3;
  v5 = (id)-[HighlightItemCellAccessibility _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", v8);
  MEMORY[0x234919BD4](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __52__HighlightItemCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    if (objc_msgSend(v3, "isAccessibilityElement"))
    {
      MEMORY[0x234919BBC](CFSTR("SLHighlightPillView"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        MEMORY[0x234919BBC](CFSTR("ShelfKitCollectionViews.ArtworkView"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
      }
    }
  }

  return 0;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)HighlightItemCellAccessibility;
  -[HighlightItemCellAccessibility _accessibilitySupplementaryFooterViews](&v7, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[HighlightItemCellAccessibility _axPillView](self, "_axPillView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v5);

  return v3;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)HighlightItemCellAccessibility;
  -[HighlightItemCellAccessibility automationElements](&v7, sel_automationElements);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[HighlightItemCellAccessibility _axPillView](self, "_axPillView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v5);

  return v3;
}

- (id)_axPillView
{
  return (id)-[HighlightItemCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x234919BBC](CFSTR("SLHighlightPillView"), a2));
}

@end
