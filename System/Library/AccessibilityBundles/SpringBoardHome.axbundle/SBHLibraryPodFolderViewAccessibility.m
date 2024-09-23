@implementation SBHLibraryPodFolderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHLibraryPodFolderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("firstIconListView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBHLibraryPodFolderView"), CFSTR("SBFolderView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconListView"), CFSTR("_iconViews"), "NSMapTable");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBHLibraryPodFolderView"), CFSTR("_podScrollView"), "BSUIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("icon"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("_axIconView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryPodFolderViewAccessibility;
  -[SBHLibraryPodFolderViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBHLibraryPodFolderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_podScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityContainerType:", 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodFolderViewAccessibility;
  -[SBHLibraryPodFolderViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[SBHLibraryPodFolderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)automationElements
{
  double v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[SBHLibraryPodFolderViewAccessibility _accessibilityVisibleFrame](self, "_accessibilityVisibleFrame");
  if (v3 == 0.0)
    return MEMORY[0x24BDBD1A8];
  -[SBHLibraryPodFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("firstIconListView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeArrayForKey:", CFSTR("icons"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  -[SBHLibraryPodFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("firstIconListView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("_iconViews"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    v25 = v10;
    v26 = v9;
    v24 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      v27 = v12;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
        objc_msgSend(v15, "safeValueForKey:", CFSTR("_axIconView"));
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          objc_msgSend(v28, "objectEnumerator");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
          if (v16)
          {
            v18 = *(_QWORD *)v30;
            while (2)
            {
              for (i = 0; i != v16; i = (char *)i + 1)
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v17);
                v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
                objc_msgSend(v20, "safeValueForKey:", CFSTR("icon"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "isEqual:", v15);

                if (v22)
                {
                  v16 = v20;
                  goto LABEL_19;
                }
              }
              v16 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
              if (v16)
                continue;
              break;
            }
LABEL_19:
            v10 = v25;
            v9 = v26;
            v13 = v24;
            v12 = v27;
          }

        }
        if (v16)
          v23 = v16;
        else
          v23 = v15;
        objc_msgSend(v9, "addObject:", v23);

        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v12);
  }

  return v9;
}

@end
