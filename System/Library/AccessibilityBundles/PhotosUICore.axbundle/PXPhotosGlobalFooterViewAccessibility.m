@implementation PXPhotosGlobalFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPhotosGlobalFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXPhotosGlobalFooterView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXPhotosGlobalFooterView"), CFSTR("_subtitle2Label"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXPhotosGlobalFooterView"), CFSTR("_subtitle1TextView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXPhotosGlobalFooterView"), CFSTR("_progressView"), "UIProgressView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXPhotosGlobalFooterView"), CFSTR("_filterView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXPhotosGlobalFooterView"), CFSTR("_accessoryView"), "UIView");

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_axFilterView
{
  return (id)-[PXPhotosGlobalFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_filterView"));
}

- (id)_axAccessoryView
{
  return (id)-[PXPhotosGlobalFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessoryView"));
}

- (id)_axFooterElement
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAXFooterElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityElements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PXPhotosGlobalFooterViewAccessibility _axAccessoryView](self, "_axAccessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "safeBoolForKey:", CFSTR("isHidden")) & 1) == 0)
  {
    objc_msgSend(v5, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  -[PXPhotosGlobalFooterViewAccessibility _axFooterElement](self, "_axFooterElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    -[PXPhotosGlobalFooterViewAccessibility _accessibilityBounds](self, "_accessibilityBounds");
    objc_msgSend(v8, "setBounds:");
    objc_initWeak(&location, self);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __62__PXPhotosGlobalFooterViewAccessibility_accessibilityElements__block_invoke_2;
    v15 = &unk_24FF06D90;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v8, "setAccessibilityLabelBlock:", &v12);
    -[PXPhotosGlobalFooterViewAccessibility _setAXFooterElement:](self, "_setAXFooterElement:", v8, v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  -[PXPhotosGlobalFooterViewAccessibility _axFooterElement](self, "_axFooterElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v9);

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

uint64_t __62__PXPhotosGlobalFooterViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

id __62__PXPhotosGlobalFooterViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_axLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  const __CFString *v16;
  void *v17;

  -[PXPhotosGlobalFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGlobalFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitle2Label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGlobalFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_progressView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "safeBoolForKey:", CFSTR("isHidden")) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXPhotosGlobalFooterViewAccessibility _axFilterView](self, "_axFilterView", v15, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGlobalFooterViewAccessibility _axSubtitle1TextView](self, "_axSubtitle1TextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "safeBoolForKey:", CFSTR("isHidden")))
  {
    __UIAXStringForVariables();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "accessibilityLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)_axSubtitle1TextView
{
  return (id)-[PXPhotosGlobalFooterViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_subtitle1TextView"));
}

- (id)_accessibilityInternalTextLinks
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

  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[PXPhotosGlobalFooterViewAccessibility _axSubtitle1TextView](self, "_axSubtitle1TextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityInternalTextLinks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  -[PXPhotosGlobalFooterViewAccessibility _axAccessoryView](self, "_axAccessoryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_accessibilityInternalTextLinks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "axSafelyAddObjectsFromArray:", v11);

  return v9;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;

  -[PXPhotosGlobalFooterViewAccessibility _axFilterView](self, "_axFilterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySupplementaryFooterViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
