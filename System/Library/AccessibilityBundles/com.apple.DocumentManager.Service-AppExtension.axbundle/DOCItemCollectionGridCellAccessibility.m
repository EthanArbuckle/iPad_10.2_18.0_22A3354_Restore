@implementation DOCItemCollectionGridCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionGridCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionGridCell"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionGridCell"), CFSTR("accessibilitySecondSubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"), CFSTR("accessibilityCellManager"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionListCell"), CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionGridCell"), CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCellContent"), CFSTR("accessibilityIsFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCellContent"), CFSTR("accessibilityItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"), CFSTR("accessibilityThumbnailView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCellContent"), CFSTR("accessibilityItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FPItem"), CFSTR("isCloudItem"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UICollectionView"), CFSTR("_dragAndDropController"), "_UICollectionViewDragAndDropController");

}

- (BOOL)_accessibilitySubviewIsVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  if (AXDoesRequestingClientDeserveAutomation()
    && (objc_opt_class(),
        __UIAccessibilityCastAsClass(),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "window"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    v7 = objc_msgSend(v4, "_accessibilityViewIsVisibleIgnoringAXOverrides:stoppingBeforeContainer:", 0, self);
  }
  else
  {
    v7 = objc_msgSend(v4, "_accessibilityViewIsVisible");
  }
  v8 = v7;

  return v8;
}

- (id)_axAttrTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[DOCItemCollectionGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DOCItemCollectionGridCellAccessibility _accessibilitySubviewIsVisible:](self, "_accessibilitySubviewIsVisible:", v3))
  {
    objc_opt_class();
    -[DOCItemCollectionGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  -[DOCItemCollectionGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCellManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isCloudItem") && (objc_msgSend(v5, "isDownloaded") & 1) == 0)
  {
    accessibilityLocalizedString(CFSTR("in.cloud"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  v28 = v5;
  -[DOCItemCollectionGridCellAccessibility _axAttrTitle](self, "_axAttrTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  v7 = objc_msgSend(v6, "length");
  v8 = *MEMORY[0x24BDF65C0];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __60__DOCItemCollectionGridCellAccessibility_accessibilityLabel__block_invoke;
  v29[3] = &unk_2503EDA80;
  v29[4] = &v30;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v29);
  objc_msgSend(v6, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v31[5];
  v23 = CFSTR("__AXStringForVariablesSentinel");
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  v26 = v3;

  if (!v28)
  {
    v13 = 0;
    goto LABEL_13;
  }
  if (AXDoesRequestingClientDeserveAutomation())
  {
    objc_msgSend(v28, "filename", v22, CFSTR("__AXStringForVariablesSentinel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v12;
    v23 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v10 = v3;
  }
  else
  {
    if (-[DOCItemCollectionGridCellAccessibility _accessibilityIsFolder](self, "_accessibilityIsFolder", v22, CFSTR("__AXStringForVariablesSentinel")))
    {
      accessibilityLocalizedString(CFSTR("folder.type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend(v28, "filename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UIAXFileTypeDescriptionForFileExtension();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:
  -[DOCItemCollectionGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"), v22, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[DOCItemCollectionGridCellAccessibility _accessibilitySubviewIsVisible:](self, "_accessibilitySubviewIsVisible:", v14);
  if (v15)
  {
    -[DOCItemCollectionGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "accessibilityLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  -[DOCItemCollectionGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySecondSubtitleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[DOCItemCollectionGridCellAccessibility _accessibilitySubviewIsVisible:](self, "_accessibilitySubviewIsVisible:", v17);
  if (v18)
  {
    -[DOCItemCollectionGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySecondSubtitleLabel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  __UIAXStringForVariables();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

  }
  if (v15)
  {

  }
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __60__DOCItemCollectionGridCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[DOCItemCollectionGridCellAccessibility _axAttrTitle](self, "_axAttrTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  char v15;
  CGPoint result;

  v15 = 0;
  objc_opt_class();
  -[DOCItemCollectionGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityThumbnailView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "window");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)DOCItemCollectionGridCellAccessibility;
    -[DOCItemCollectionGridCellAccessibility accessibilityActivationPoint](&v14, sel_accessibilityActivationPoint);
  }
  else
  {
    objc_msgSend(v4, "bounds");
    AX_CGRectGetCenter();
    objc_msgSend(v4, "convertPoint:toView:", v6);
    objc_msgSend(v6, "convertPoint:toWindow:", 0);
  }
  v10 = v8;
  v11 = v9;

  v12 = v10;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)accessibilityDropPointDescriptors
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  char v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (-[DOCItemCollectionGridCellAccessibility _accessibilityIsFolder](self, "_accessibilityIsFolder"))
  {
    -[DOCItemCollectionGridCellAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_opt_class();
    -[DOCItemCollectionGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityThumbnailView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "hasActiveDrop"))
      v6 = v5 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      v7 = objc_alloc(MEMORY[0x24BDF67B0]);
      accessibilityLocalizedString(CFSTR("drop.into.folder"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      AX_CGRectGetCenter();
      objc_msgSend(v5, "convertPoint:toView:", v3);
      v9 = (void *)objc_msgSend(v7, "initWithName:point:inView:", v8, v3);
      v14[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return v10;
    }

  }
  v12.receiver = self;
  v12.super_class = (Class)DOCItemCollectionGridCellAccessibility;
  -[DOCItemCollectionGridCellAccessibility accessibilityDropPointDescriptors](&v12, sel_accessibilityDropPointDescriptors);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_accessibilityIsFolder
{
  void *v2;
  void *v3;

  -[DOCItemCollectionGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCellManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "safeBoolForKey:", CFSTR("accessibilityIsFolder"));
  return (char)v2;
}

@end
