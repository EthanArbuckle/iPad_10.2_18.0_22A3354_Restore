@implementation SUUICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SUUIStorePageCollectionViewLayout"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIStorePageCollectionViewLayout"), CFSTR("_itemPinningConfigurationForItemAtIndexPath:"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIStorePageItemPinningConfiguration"), CFSTR("hasValidPinningStyle"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIStorePageItemPinningConfiguration"), CFSTR("pinningStyle"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIStorePageItemPinningConfiguration"), CFSTR("hasValidPinningContentInset"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIStorePageItemPinningConfiguration"), CFSTR("pinningContentInset"), "{UIEdgeInsets=dddd}", 0);

}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

- (BOOL)accessibilityScrollDownPageSupported
{
  void *v3;
  objc_super v5;

  -[SUUICollectionViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("MusicVerticalScrollingContainerCollectionView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)SUUICollectionViewAccessibility;
  return -[SUUICollectionViewAccessibility accessibilityScrollDownPageSupported](&v5, sel_accessibilityScrollDownPageSupported);
}

- (BOOL)accessibilityScrollUpPageSupported
{
  void *v3;
  objc_super v5;

  -[SUUICollectionViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("MusicVerticalScrollingContainerCollectionView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)SUUICollectionViewAccessibility;
  return -[SUUICollectionViewAccessibility accessibilityScrollUpPageSupported](&v5, sel_accessibilityScrollUpPageSupported);
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  double height;
  double y;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  BOOL v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  BOOL v31;
  void *v33;
  void *v34;
  double x;
  double width;
  id v37;
  SUUICollectionViewAccessibility *v38;
  void *v39;
  id obj;
  objc_super v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  id v46;
  uint64_t *v47;
  uint64_t v48;
  double *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t);
  void *v57;
  id v58;
  void *v59;
  uint64_t *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  height = a3.size.height;
  x = a3.origin.x;
  width = a3.size.width;
  y = a3.origin.y;
  v66 = *MEMORY[0x24BDAC8D0];
  v37 = a4;
  v38 = self;
  -[SUUICollectionViewAccessibility collectionViewLayout](self, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUUIStorePageCollectionViewLayout"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "safeValueForKey:", CFSTR("indexPathsForPinningItems"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      -[SUUICollectionViewAccessibility indexPathForCell:](self, "indexPathForCell:");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        obj = v33;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        if (v8)
        {
          v9 = 0;
          v10 = *(_QWORD *)v62;
          do
          {
            v11 = 0;
            v12 = v9;
            do
            {
              if (*(_QWORD *)v62 != v10)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v11);
              v48 = 0;
              v49 = (double *)&v48;
              v50 = 0x3032000000;
              v51 = __Block_byref_object_copy_;
              *(_QWORD *)&v52 = __Block_byref_object_dispose_;
              *((_QWORD *)&v52 + 1) = 0;
              v54 = MEMORY[0x24BDAC760];
              v55 = 3221225472;
              v56 = __71__SUUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke;
              v57 = &unk_2502A6918;
              v60 = &v48;
              v58 = v7;
              v59 = v13;
              AXPerformSafeBlock();
              v14 = *((id *)v49 + 5);

              _Block_object_dispose(&v48, 8);
              v15 = 0.0;
              if (objc_msgSend(v14, "safeBoolForKey:", CFSTR("hasValidPinningStyle")))
              {
                v16 = objc_msgSend(v14, "safeIntegerForKey:", CFSTR("pinningStyle"));
                v9 = v16;
                if (v16
                  && v16 != 3
                  && objc_msgSend(v14, "safeBoolForKey:", CFSTR("hasValidPinningContentInset")))
                {
                  v48 = 0;
                  v49 = (double *)&v48;
                  v50 = 0x4010000000;
                  v51 = (uint64_t (*)(uint64_t, uint64_t))&unk_2327F5243;
                  v52 = 0u;
                  v53 = 0u;
                  v42 = MEMORY[0x24BDAC760];
                  v43 = 3221225472;
                  v44 = __71__SUUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke_2;
                  v45 = &unk_2502A6940;
                  v47 = &v48;
                  v46 = v14;
                  AXPerformSafeBlock();
                  v17 = v49[4];
                  v18 = v49[6];

                  _Block_object_dispose(&v48, 8);
                  -[SUUICollectionViewAccessibility layoutAttributesForItemAtIndexPath:](v38, "layoutAttributesForItemAtIndexPath:", v13);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "size");
                  v21 = v20;

                  v22 = objc_msgSend(v13, "section");
                  v23 = v17 + v18 + v21;
                  if (v22 < objc_msgSend(v39, "section")
                    || (v26 = objc_msgSend(v13, "section"), v26 == objc_msgSend(v39, "section"))
                    && (v27 = objc_msgSend(v13, "row"), v27 < objc_msgSend(v39, "row")))
                  {
                    v24 = v12 == 1 || v9 == 1;
                    v15 = 0.0;
                    if (v24)
                      v25 = v23;
                    else
                      v25 = v23 + 0.0;
                  }
                  else
                  {
                    v28 = objc_msgSend(v13, "isEqual:", v39, v33, v34);
                    if (v9 == 5)
                      v29 = v28;
                    else
                      v29 = 1;
                    v25 = 0.0;
                    if (v29)
                      v15 = 0.0;
                    else
                      v15 = v23 + 0.0;
                  }
                }
                else
                {
                  v25 = 0.0;
                }
              }
              else
              {
                v25 = 0.0;
                v9 = v12;
              }

              y = y - v25;
              height = height + v15 + v25;
              ++v11;
              v12 = v9;
            }
            while (v8 != v11);
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
            v8 = v30;
          }
          while (v30);
        }

      }
    }

  }
  v41.receiver = v38;
  v41.super_class = (Class)SUUICollectionViewAccessibility;
  v31 = -[SUUICollectionViewAccessibility _accessibilityScrollToFrame:forView:](&v41, sel__accessibilityScrollToFrame_forView_, v37, x, y, width, height, v33);

  return v31;
}

void __71__SUUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_itemPinningConfigurationForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __71__SUUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("pinningContentInset"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UIEdgeInsetsValue");
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;

}

@end
