@implementation SUUIReviewCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIReviewCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SUUIReviewCollectionViewCell"), CFSTR("SUUIViewReuseCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIViewReuseCollectionViewCell"), CFSTR("allExistingViews"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[SUUIReviewCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("allExistingViews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isAccessibilityElement"))
        {
          objc_msgSend(v4, "addObject:", v11);
        }
        else if (objc_msgSend(v11, "_accessibilityHasOrderedChildren"))
        {
          v14[0] = v9;
          v14[1] = 3221225472;
          v14[2] = __63__SUUIReviewCollectionViewCellAccessibility_accessibilityLabel__block_invoke;
          v14[3] = &unk_2502A6BD0;
          v15 = v4;
          objc_msgSend(v11, "accessibilityEnumerateContainerElementsUsingBlock:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  MEMORY[0x234916290](v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __63__SUUIReviewCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isAccessibilityElement"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
