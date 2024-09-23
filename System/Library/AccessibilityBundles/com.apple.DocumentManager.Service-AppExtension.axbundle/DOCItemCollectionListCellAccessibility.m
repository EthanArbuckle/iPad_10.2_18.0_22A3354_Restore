@implementation DOCItemCollectionListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionListCell");
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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionListCell"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionListCell"), CFSTR("accessibilityDateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionListCell"), CFSTR("accessibilitySizeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionListCell"), CFSTR("accessibilityTagView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"), CFSTR("accessibilityCellManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCellContent"), CFSTR("accessibilityItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCellContent"), CFSTR("accessibilityIsFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionListCell"), CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCellContent"), CFSTR("accessibilityItem"), "@", 0);

}

- (id)_axAttrTitle
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[DOCItemCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  -[DOCItemCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCellManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v6;
  if (objc_msgSend(v6, "isCloudItem") && (objc_msgSend(v6, "isDownloaded") & 1) == 0)
  {
    accessibilityLocalizedString(CFSTR("in.cloud"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
  -[DOCItemCollectionListCellAccessibility _axAttrTitle](self, "_axAttrTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__1;
  v44 = __Block_byref_object_dispose__1;
  v45 = 0;
  v8 = objc_msgSend(v7, "length");
  v9 = *MEMORY[0x24BDF65C0];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __60__DOCItemCollectionListCellAccessibility_accessibilityLabel__block_invoke;
  v39[3] = &unk_2503EDA80;
  v39[4] = &v40;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v39);
  v30 = v7;
  objc_msgSend(v7, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v41[5];
  v25 = CFSTR("__AXStringForVariablesSentinel");
  __UIAXStringForVariables();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v4;

  if (!v37)
  {
    v32 = 0;
    goto LABEL_13;
  }
  if (AXDoesRequestingClientDeserveAutomation())
  {
    objc_msgSend(v37, "filename", v24, CFSTR("__AXStringForVariablesSentinel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v12;
    v25 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v13 = objc_claimAutoreleasedReturnValue();

    v32 = 0;
    v38 = (void *)v13;
  }
  else
  {
    if (-[DOCItemCollectionListCellAccessibility _accessibilityIsFolder](self, "_accessibilityIsFolder", v24, CFSTR("__AXStringForVariablesSentinel")))
    {
      accessibilityLocalizedString(CFSTR("folder.type"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend(v37, "filename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UIAXFileTypeDescriptionForFileExtension();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:
  -[DOCItemCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"), v24, v25);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v36, "_accessibilityViewIsVisible");
  if (v35)
  {
    -[DOCItemCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "accessibilityLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  -[DOCItemCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDateLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v33, "_accessibilityViewIsVisible");
  if (v14)
  {
    -[DOCItemCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDateLabel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "accessibilityLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[DOCItemCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySizeLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_accessibilityViewIsVisible");
  if (v17)
  {
    -[DOCItemCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySizeLabel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "accessibilityLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  -[DOCItemCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTagView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "_accessibilityViewIsVisible");
  if (v20)
  {
    -[DOCItemCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTagView"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessibilityLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  __UIAXStringForVariables();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

  }
  if (v17)
  {

  }
  if (v14)
  {

  }
  if (v35)
  {

  }
  _Block_object_dispose(&v40, 8);

  return v22;
}

void __60__DOCItemCollectionListCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
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
  -[DOCItemCollectionListCellAccessibility _axAttrTitle](self, "_axAttrTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_accessibilityIsFolder
{
  void *v2;
  void *v3;

  -[DOCItemCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCellManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "safeBoolForKey:", CFSTR("accessibilityIsFolder"));
  return (char)v2;
}

@end
