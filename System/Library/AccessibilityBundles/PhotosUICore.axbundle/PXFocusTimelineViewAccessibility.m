@implementation PXFocusTimelineViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXFocusTimelineView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axFocusTimelineViewAXElements
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAXFocusTimelineViewAXElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXFocusTimelineView"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXFocusTimelineView"), CFSTR("_focusEventsView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXFocusTimelineView"), CFSTR("_focusEvents"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXFocusTimelineView"), CFSTR("_axDescriptionForFocusEvent:"), "@", 0);

}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityPhotosUICoreLocalizedString(CFSTR("photos.focus.timeline"));
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
  __int128 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;
  _QWORD v22[5];
  _QWORD v23[4];
  __int128 v24;
  __int128 v25;
  objc_super v26;
  objc_super v27;

  -[PXFocusTimelineViewAccessibility _axFocusTimelineViewAXElements](self, "_axFocusTimelineViewAXElements");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v27.receiver = self;
    v27.super_class = (Class)PXFocusTimelineViewAccessibility;
    -[PXFocusTimelineViewAccessibility accessibilityElements](&v27, sel_accessibilityElements);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v26.receiver = self;
      v26.super_class = (Class)PXFocusTimelineViewAccessibility;
      -[PXFocusTimelineViewAccessibility accessibilityElements](&v26, sel_accessibilityElements);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[PXFocusTimelineViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_focusEventsView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFocusTimelineViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_focusEvents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "sortUsingSelector:", sel_accessibilityCompareGeometry_);
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x4010000000;
    v23[3] = "";
    v11 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
    v12 = MEMORY[0x24BDAC760];
    v24 = *MEMORY[0x24BDBF070];
    v25 = v11;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __57__PXFocusTimelineViewAccessibility_accessibilityElements__block_invoke;
    v22[3] = &unk_24FF06A98;
    v22[4] = v23;
    objc_msgSend(v10, "ax_filteredArrayUsingBlock:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_initWeak(&location, self);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __57__PXFocusTimelineViewAccessibility_accessibilityElements__block_invoke_2;
    v17[3] = &unk_24FF06AC0;
    v15 = v14;
    v18 = v15;
    objc_copyWeak(&v20, &location);
    v3 = v6;
    v19 = v3;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);
    -[PXFocusTimelineViewAccessibility _setAXFocusTimelineViewAXElements:](self, "_setAXFocusTimelineViewAXElements:", v3);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    _Block_object_dispose(v23, 8);

  }
  return v3;
}

BOOL __57__PXFocusTimelineViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat *v9;
  CGRect v10;

  objc_msgSend(a2, "accessibilityFrame");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  if (CGRectEqualToRect(v10, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32)))
    return 0;
  v9 = *(CGFloat **)(*(_QWORD *)(a1 + 32) + 8);
  v9[4] = x;
  v9[5] = y;
  v9[6] = width;
  v9[7] = height;
  return a2 != 0;
}

void __57__PXFocusTimelineViewAccessibility_accessibilityElements__block_invoke_2(id *a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a2;
  if (objc_msgSend(a1[4], "count") > a3)
  {
    objc_msgSend(a1[4], "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsAccessibilityElement:", 1);
    MEMORY[0x2348C1678](CFSTR("PXFocusTimelineEvent"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
      objc_msgSend(v7, "accessibilityFocusEventTimeString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessibilityFocusEventTypeString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAccessibilityLabel:", v10, v9, CFSTR("__AXStringForVariablesSentinel"));

      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__1;
      v19 = __Block_byref_object_dispose__1;
      v20 = 0;
      objc_copyWeak(&v14, a1 + 6);
      v13 = v7;
      AXPerformSafeBlock();
      v11 = (id)v16[5];

      objc_destroyWeak(&v14);
      _Block_object_dispose(&v15, 8);

      objc_msgSend(v6, "setAccessibilityValue:", v11);
      objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73E0]);
      accessibilityPhotosUICoreLocalizedString(CFSTR("focus.hint"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAccessibilityHint:", v12);

    }
    objc_msgSend(a1[5], "axSafelyAddObject:", v6);

  }
}

void __57__PXFocusTimelineViewAccessibility_accessibilityElements__block_invoke_332(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_axDescriptionForFocusEvent:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFocusTimelineViewAccessibility;
  -[PXFocusTimelineViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PXFocusTimelineViewAccessibility _setAXFocusTimelineViewAXElements:](self, "_setAXFocusTimelineViewAXElements:", 0);
}

@end
