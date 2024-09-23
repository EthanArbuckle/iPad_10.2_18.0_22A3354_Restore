@implementation MFComposeWebViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeWebView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeWebView"), CFSTR("_leadingInputAssistantItemGroups"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeWebView"), CFSTR("_trailingInputAssistantItemGroups"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeWebView"), CFSTR("set_leadingInputAssistantItemGroups:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeWebView"), CFSTR("set_trailingInputAssistantItemGroups:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeWebView"), CFSTR("_shouldShowMarkupButton"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  __CFString *v31;
  char v32;
  char v33;
  char v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  MFComposeWebViewAccessibility *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char v56;
  objc_super v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v57.receiver = self;
  v57.super_class = (Class)MFComposeWebViewAccessibility;
  -[MFComposeWebViewAccessibility _accessibilityLoadAccessibilityInformation](&v57, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[MFComposeWebViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_leadingInputAssistantItemGroups"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0;
  objc_opt_class();
  -[MFComposeWebViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_trailingInputAssistantItemGroups"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v53 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "barButtonItems");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "axSafelyAddObjectsFromArray:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v10);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "barButtonItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "axSafelyAddObjectsFromArray:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v16);
  }
  v37 = v14;
  v38 = v8;
  v42 = self;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v45;
    v23 = *MEMORY[0x24BDDD080];
    v24 = *MEMORY[0x24BDDD088];
    v40 = *MEMORY[0x24BDDD090];
    v41 = *MEMORY[0x24BDDD098];
    v39 = *MEMORY[0x24BDDD078];
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
        objc_msgSend(v26, "image");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "imageAsset");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "safeValueForKey:", CFSTR("assetName"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = objc_msgSend(v29, "containsString:", v23);
        v31 = CFSTR("format.toolbar.button");
        if ((v30 & 1) != 0)
          goto LABEL_29;
        if (objc_msgSend(v29, "containsString:", v24))
        {
          if (-[MFComposeWebViewAccessibility safeBoolForKey:](v42, "safeBoolForKey:", CFSTR("_shouldShowMarkupButton")))v31 = CFSTR("markup.button");
          else
            v31 = CFSTR("drawing.button");
LABEL_29:
          accessibilityLocalizedString(v31);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setAccessibilityLabel:", v36);

          goto LABEL_30;
        }
        v32 = objc_msgSend(v29, "containsString:", v41);
        v31 = CFSTR("scan.document.button");
        if ((v32 & 1) != 0)
          goto LABEL_29;
        v33 = objc_msgSend(v29, "containsString:", CFSTR("compose-accessory-close"));
        v31 = CFSTR("close.toolbar.button");
        if ((v33 & 1) != 0)
          goto LABEL_29;
        v34 = objc_msgSend(v29, "containsString:", v40);
        v31 = CFSTR("insert.photo.label");
        if ((v34 & 1) != 0)
          goto LABEL_29;
        v35 = objc_msgSend(v29, "containsString:", v39);
        v31 = CFSTR("add.attachment.button");
        if (v35)
          goto LABEL_29;
LABEL_30:

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    }
    while (v21);
  }

}

- (void)set_leadingInputAssistantItemGroups:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFComposeWebViewAccessibility;
  -[MFComposeWebViewAccessibility set_leadingInputAssistantItemGroups:](&v4, sel_set_leadingInputAssistantItemGroups_, a3);
  -[MFComposeWebViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)set_trailingInputAssistantItemGroups:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFComposeWebViewAccessibility;
  -[MFComposeWebViewAccessibility set_trailingInputAssistantItemGroups:](&v4, sel_set_trailingInputAssistantItemGroups_, a3);
  -[MFComposeWebViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
