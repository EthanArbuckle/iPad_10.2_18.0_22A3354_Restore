@implementation PMiOSSliderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PMiOSSliderViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PMiOSSliderViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSSliderViewController"), CFSTR("selectedItem"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSSliderViewController"), CFSTR("provider"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PMiOSSliderViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSSliderViewController"), CFSTR("viewDidLayoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSSliderViewController"), CFSTR("setSelectedItem:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSSliderViewController"), CFSTR("scrollViewWillBeginDragging:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSSliderViewController"), CFSTR("scrollViewDidEndDragging: willDecelerate:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSSliderViewController"), CFSTR("_setFontStyleForCell: highlighted:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("PMSliderProviderProtocol"), CFSTR("displayNameForIndex:"));

}

- (id)_axMemoriesMoodSlider
{
  JUMPOUT(0x2348C0868);
}

- (void)_setAXMemoriesMoodSlider:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (int64_t)_axMemoriesEditSliderType
{
  return __UIAccessibilityGetAssociatedInteger();
}

- (void)_setAXMemoriesEditSliderType:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInteger();
}

- (BOOL)_axDraggingSlider
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_setAXDraggingSlider:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_axLastSpokenSliderDescription
{
  JUMPOUT(0x2348C0868);
}

- (void)_setAXLastSpokenSliderDescription:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_axSetMemoriesEditSliderType:(int64_t)a3
{
  id v5;

  -[PMiOSSliderViewControllerAccessibility _setAXMemoriesEditSliderType:](self, "_setAXMemoriesEditSliderType:");
  -[PMiOSSliderViewControllerAccessibility _axMemoriesMoodSlider](self, "_axMemoriesMoodSlider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSliderType:", a3);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  -[PMiOSSliderViewControllerAccessibility viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PMiOSSliderViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  AXMemoriesSlider *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  -[PMiOSSliderViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  -[PMiOSSliderViewControllerAccessibility _setAXDraggingSlider:](self, "_setAXDraggingSlider:", 0);
  -[PMiOSSliderViewControllerAccessibility _axMemoriesMoodSlider](self, "_axMemoriesMoodSlider");
  v3 = (AXMemoriesSlider *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[AXMemoriesSlider initWithAccessibilityContainer:]([AXMemoriesSlider alloc], "initWithAccessibilityContainer:", self);
    -[PMiOSSliderViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedItem"));
    -[AXMemoriesSlider setSliderType:](v3, "setSliderType:", -[PMiOSSliderViewControllerAccessibility _axMemoriesEditSliderType](self, "_axMemoriesEditSliderType"));
    -[PMiOSSliderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("provider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v16 = 0;
    v10 = MEMORY[0x24BDAC760];
    v5 = v4;
    AXPerformSafeBlock();
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    -[AXMemoriesSlider setSelectedDescription:](v3, "setSelectedDescription:", v6);

    -[PMiOSSliderViewControllerAccessibility _setAXMemoriesMoodSlider:](self, "_setAXMemoriesMoodSlider:", v3);
    LOBYTE(v11) = 0;
    objc_opt_class();
    -[PMiOSSliderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)v11)
      abort();
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v3, v10, 3221225472, __84__PMiOSSliderViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke, &unk_24FEF70C8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityElements:", v9);

  }
}

void __84__PMiOSSliderViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "displayNameForIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSelectedItem:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  -[PMiOSSliderViewControllerAccessibility setSelectedItem:](&v14, sel_setSelectedItem_, a3);
  -[PMiOSSliderViewControllerAccessibility _axMemoriesMoodSlider](self, "_axMemoriesMoodSlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PMiOSSliderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("provider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PMiOSSliderViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedItem"));
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy_;
    v12 = __Block_byref_object_dispose_;
    v13 = 0;
    v7 = v5;
    AXPerformSafeBlock();
    v6 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
    objc_msgSend(v4, "setSelectedDescription:", v6);

  }
}

void __58__PMiOSSliderViewControllerAccessibility_setSelectedItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "displayNameForIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  -[PMiOSSliderViewControllerAccessibility scrollViewWillBeginDragging:](&v4, sel_scrollViewWillBeginDragging_, a3);
  -[PMiOSSliderViewControllerAccessibility _setAXDraggingSlider:](self, "_setAXDraggingSlider:", 1);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  -[PMiOSSliderViewControllerAccessibility scrollViewDidEndDragging:willDecelerate:](&v5, sel_scrollViewDidEndDragging_willDecelerate_, a3, a4);
  -[PMiOSSliderViewControllerAccessibility _setAXDraggingSlider:](self, "_setAXDraggingSlider:", 0);
}

- (void)_setFontStyleForCell:(id)a3 highlighted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  objc_super v23;

  v4 = a4;
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PMiOSSliderViewControllerAccessibility;
  -[PMiOSSliderViewControllerAccessibility _setFontStyleForCell:highlighted:](&v23, sel__setFontStyleForCell_highlighted_, v6, v4);
  if (-[PMiOSSliderViewControllerAccessibility _axDraggingSlider](self, "_axDraggingSlider") && v4)
  {
    objc_opt_class();
    -[PMiOSSliderViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("collectionView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "indexPathForCell:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PMiOSSliderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("provider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    v11 = v10;
    v12 = v9;
    AXPerformSafeBlock();
    v13 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
    -[PMiOSSliderViewControllerAccessibility _axLastSpokenSliderDescription](self, "_axLastSpokenSliderDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("●")))
      {
        accessibilityMemoriesLocalizedString(CFSTR("slider.value.neutral"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilitySpeak();

      }
      else
      {
        UIAccessibilitySpeak();
      }
      -[PMiOSSliderViewControllerAccessibility _setAXLastSpokenSliderDescription:](self, "_setAXLastSpokenSliderDescription:", v13);
    }

  }
}

void __75__PMiOSSliderViewControllerAccessibility__setFontStyleForCell_highlighted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "displayNameForIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
