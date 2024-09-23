@implementation ShelfTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.ShelfTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.ShelfTitleView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.ShelfTitleView"), CFSTR("prepareForReuse"), "v", 0);

}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  uint64_t v13;
  double height;
  double width;
  double y;
  double x;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  float v35;
  CGFloat v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  CGRect v46;
  CGRect remainder;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[ShelfTitleViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[ShelfTitleViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("subviews"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_189_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDBF070];
    v8 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v10 = *(double *)(MEMORY[0x24BDBF070] + 24);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    height = v10;
    width = v11;
    y = v8;
    x = v9;
    if (v13)
    {
      v18 = v13;
      v19 = *(_QWORD *)v53;
      height = v10;
      width = v11;
      y = v8;
      x = v9;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v53 != v19)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v20), "frame");
          v68.origin.x = v21;
          v68.origin.y = v22;
          v68.size.width = v23;
          v68.size.height = v24;
          v60.origin.x = x;
          v60.origin.y = y;
          v60.size.width = width;
          v60.size.height = height;
          v61 = CGRectUnion(v60, v68);
          x = v61.origin.x;
          y = v61.origin.y;
          width = v61.size.width;
          height = v61.size.height;
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v18);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v25 = v7;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v49;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v49 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v29), "frame");
          v69.origin.x = v30;
          v69.origin.y = v31;
          v69.size.width = v32;
          v69.size.height = v33;
          v62.origin.x = v9;
          v62.origin.y = v8;
          v62.size.width = v11;
          v62.size.height = v10;
          v63 = CGRectUnion(v62, v69);
          v9 = v63.origin.x;
          v8 = v63.origin.y;
          v11 = v63.size.width;
          v10 = v63.size.height;
          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v27);
    }

    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v70.origin.x = v9;
    v70.origin.y = v8;
    v70.size.width = v11;
    v70.size.height = v10;
    v65 = CGRectIntersection(v64, v70);
    v34 = v65.size.width;
    if (!CGRectIsNull(v65))
    {
      v35 = v34;
      memset(&remainder, 0, sizeof(remainder));
      memset(&v46, 0, sizeof(v46));
      v36 = v35;
      v66.origin.x = x;
      v66.origin.y = y;
      v66.size.width = width;
      v66.size.height = height;
      CGRectDivide(v66, &v46, &remainder, v36, CGRectMaxXEdge);
      x = remainder.origin.x;
      y = remainder.origin.y;
      width = remainder.size.width;
      height = remainder.size.height;
    }
    LOBYTE(remainder.origin.x) = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v37 = objc_claimAutoreleasedReturnValue();
    if (LOBYTE(remainder.origin.x))
      abort();
    v38 = (void *)v37;
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", v37);
    objc_msgSend(v12, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_194);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    AXLabelForElements();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAccessibilityLabel:", v41);

    objc_msgSend(v39, "setIsAccessibilityElement:", 1);
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    if (CGRectIsNull(v67))
    {
      x = *MEMORY[0x24BDBF090];
      y = *(double *)(MEMORY[0x24BDBF090] + 8);
      width = *(double *)(MEMORY[0x24BDBF090] + 16);
      height = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    objc_msgSend(v39, "setAccessibilityFrameInContainerSpace:", x, y, width, height);
    objc_msgSend(v39, "setAccessibilityTraits:", *MEMORY[0x24BDF7410] | *MEMORY[0x24BDF73C0]);
    -[ShelfTitleViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_196);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v42;
    v4 = 0;
    if (v39 && v42)
    {
      v56 = v39;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "arrayByAddingObjectsFromArray:", v43);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[ShelfTitleViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, *v3);
    }

  }
  return v4;
}

uint64_t __52__ShelfTitleViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__ShelfTitleViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __52__ShelfTitleViewAccessibility_accessibilityElements__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "accessibilityAttributedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "accessibilityAttributedLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAccessibilityLabel:", v5);

  }
  objc_msgSend(v2, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __52__ShelfTitleViewAccessibility_accessibilityElements__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = 0;
  if (v2 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ShelfTitleViewAccessibility;
  -[ShelfTitleViewAccessibility prepareForReuse](&v3, sel_prepareForReuse);
  -[ShelfTitleViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
}

@end
