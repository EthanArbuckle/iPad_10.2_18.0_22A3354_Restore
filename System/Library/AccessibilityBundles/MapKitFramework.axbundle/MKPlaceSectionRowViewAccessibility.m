@implementation MKPlaceSectionRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlaceSectionRowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[MKPlaceSectionRowViewAccessibility storedIsAccessibilityElement](self, "storedIsAccessibilityElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MKPlaceSectionRowViewAccessibility storedIsAccessibilityElement](self, "storedIsAccessibilityElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[MKPlaceSectionRowViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;
  }

  return v5;
}

uint64_t __60__MKPlaceSectionRowViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MKPlaceSectionRowViewAccessibility _accessibleSubviews](self, "_accessibleSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axFilterObjectsUsingBlock:", &__block_literal_global_184);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234913078]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AXStringByReplacingMiddleDots(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __56__MKPlaceSectionRowViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityViewIsVisible");
}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[MKPlaceSectionRowViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_186, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF67B0]);
    v5 = (void *)MEMORY[0x24BDD17C8];
    AXMapKitLocString(CFSTR("DRAG_CARD_ROW"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionRowViewAccessibility accessibilityLabel](self, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionRowViewAccessibility accessibilityActivationPoint](self, "accessibilityActivationPoint");
    UIAccessibilityPointToPoint();
    v9 = (void *)objc_msgSend(v4, "initWithName:point:inView:", v8, v3);
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MKPlaceSectionRowViewAccessibility;
    -[MKPlaceSectionRowViewAccessibility accessibilityDragSourceDescriptors](&v12, sel_accessibilityDragSourceDescriptors);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __72__MKPlaceSectionRowViewAccessibility_accessibilityDragSourceDescriptors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityCanDrag");
}

@end
