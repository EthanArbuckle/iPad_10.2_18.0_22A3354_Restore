@implementation SKUICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SKUIStorePageCollectionViewLayout"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIStorePageCollectionViewLayout"), CFSTR("_itemPinningConfigurationForItemAtIndexPath:"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIStorePageItemPinningConfiguration"), CFSTR("hasValidPinningStyle"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIStorePageItemPinningConfiguration"), CFSTR("pinningStyle"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIStorePageItemPinningConfiguration"), CFSTR("hasValidPinningContentInset"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIStorePageItemPinningConfiguration"), CFSTR("pinningContentInset"), "{UIEdgeInsets=dddd}", 0);

}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

- (BOOL)accessibilityScrollDownPageSupported
{
  void *v3;
  objc_super v5;

  -[SKUICollectionViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("MusicVerticalScrollingContainerCollectionView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)SKUICollectionViewAccessibility;
  return -[SKUICollectionViewAccessibility accessibilityScrollDownPageSupported](&v5, sel_accessibilityScrollDownPageSupported);
}

- (BOOL)accessibilityScrollUpPageSupported
{
  void *v3;
  objc_super v5;

  -[SKUICollectionViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("MusicVerticalScrollingContainerCollectionView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)SKUICollectionViewAccessibility;
  return -[SKUICollectionViewAccessibility accessibilityScrollUpPageSupported](&v5, sel_accessibilityScrollUpPageSupported);
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  double height;
  double y;
  id v7;
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
  void *v37;
  id v38;
  SKUICollectionViewAccessibility *v39;
  void *v40;
  id obj;
  objc_super v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  id v47;
  uint64_t *v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t);
  void *v58;
  id v59;
  void *v60;
  uint64_t *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  height = a3.size.height;
  x = a3.origin.x;
  width = a3.size.width;
  y = a3.origin.y;
  v67 = *MEMORY[0x24BDAC8D0];
  v38 = a4;
  v39 = self;
  -[SKUICollectionViewAccessibility collectionViewLayout](self, "collectionViewLayout");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SKUIStorePageCollectionViewLayout"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v37;
    objc_msgSend(v7, "indexPathsForPinningItems");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      -[SKUICollectionViewAccessibility indexPathForCell:](self, "indexPathForCell:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        obj = v33;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        if (v8)
        {
          v9 = 0;
          v10 = *(_QWORD *)v63;
          do
          {
            v11 = 0;
            v12 = v9;
            do
            {
              if (*(_QWORD *)v63 != v10)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v11);
              v49 = 0;
              v50 = (double *)&v49;
              v51 = 0x3032000000;
              v52 = __Block_byref_object_copy__3;
              *(_QWORD *)&v53 = __Block_byref_object_dispose__3;
              *((_QWORD *)&v53 + 1) = 0;
              v55 = MEMORY[0x24BDAC760];
              v56 = 3221225472;
              v57 = __71__SKUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke;
              v58 = &unk_24FF2BF30;
              v61 = &v49;
              v59 = v7;
              v60 = v13;
              AXPerformSafeBlock();
              v14 = *((id *)v50 + 5);

              _Block_object_dispose(&v49, 8);
              v15 = 0.0;
              if (objc_msgSend(v14, "safeBoolForKey:", CFSTR("hasValidPinningStyle")))
              {
                v16 = objc_msgSend(v14, "safeIntegerForKey:", CFSTR("pinningStyle"));
                v9 = v16;
                if (v16
                  && v16 != 3
                  && objc_msgSend(v14, "safeBoolForKey:", CFSTR("hasValidPinningContentInset")))
                {
                  v49 = 0;
                  v50 = (double *)&v49;
                  v51 = 0x4010000000;
                  v52 = (uint64_t (*)(uint64_t, uint64_t))&unk_230C43F8B;
                  v53 = 0u;
                  v54 = 0u;
                  v43 = MEMORY[0x24BDAC760];
                  v44 = 3221225472;
                  v45 = __71__SKUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke_2;
                  v46 = &unk_24FF2BDC8;
                  v48 = &v49;
                  v47 = v14;
                  AXPerformSafeBlock();
                  v17 = v50[4];
                  v18 = v50[6];

                  _Block_object_dispose(&v49, 8);
                  -[SKUICollectionViewAccessibility layoutAttributesForItemAtIndexPath:](v39, "layoutAttributesForItemAtIndexPath:", v13);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "size");
                  v21 = v20;

                  v22 = objc_msgSend(v13, "section");
                  v23 = v17 + v18 + v21;
                  if (v22 < objc_msgSend(v40, "section")
                    || (v26 = objc_msgSend(v13, "section"), v26 == objc_msgSend(v40, "section"))
                    && (v27 = objc_msgSend(v13, "row"), v27 < objc_msgSend(v40, "row")))
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
                    v28 = objc_msgSend(v13, "isEqual:", v40);
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
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
            v8 = v30;
          }
          while (v30);
        }

      }
    }

  }
  v42.receiver = v39;
  v42.super_class = (Class)SKUICollectionViewAccessibility;
  v31 = -[SKUICollectionViewAccessibility _accessibilityScrollToFrame:forView:](&v42, sel__accessibilityScrollToFrame_forView_, v38, x, y, width, height);

  return v31;
}

void __71__SKUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke(uint64_t a1)
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

void __71__SKUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke_2(uint64_t a1)
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
