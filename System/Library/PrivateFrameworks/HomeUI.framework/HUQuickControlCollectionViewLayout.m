@implementation HUQuickControlCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (HUQuickControlCollectionViewLayout)init
{
  HUQuickControlCollectionViewLayout *v2;
  uint64_t v3;
  NSMutableDictionary *cachedLayoutAttributesByIndexPath;
  uint64_t v5;
  NSMutableDictionary *cachedSectionHeaderLayoutAttributes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlCollectionViewLayout;
  v2 = -[HUQuickControlCollectionViewLayout init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cachedLayoutAttributesByIndexPath = v2->_cachedLayoutAttributesByIndexPath;
    v2->_cachedLayoutAttributesByIndexPath = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    cachedSectionHeaderLayoutAttributes = v2->_cachedSectionHeaderLayoutAttributes;
    v2->_cachedSectionHeaderLayoutAttributes = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[HUQuickControlCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (CGSize)collectionViewContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUQuickControlCollectionViewLayout layoutInfo](self, "layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlCollectionViewLayout;
  v4 = a3;
  -[HUQuickControlCollectionViewLayout invalidateLayoutWithContext:](&v8, sel_invalidateLayoutWithContext_, v4);
  -[HUQuickControlCollectionViewLayout cachedLayoutAttributesByIndexPath](self, "cachedLayoutAttributesByIndexPath", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[HUQuickControlCollectionViewLayout cachedSectionHeaderLayoutAttributes](self, "cachedSectionHeaderLayoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  LODWORD(v6) = objc_msgSend(v4, "invalidateEverything");
  if ((_DWORD)v6)
  {
    -[HUQuickControlCollectionViewLayout layoutManager](self, "layoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generateSectionSettings");

  }
}

- (void)prepareLayout
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUQuickControlCollectionViewLayout;
  -[HUQuickControlCollectionViewLayout prepareLayout](&v11, sel_prepareLayout);
  -[HUQuickControlCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4)
  {
    -[HUQuickControlCollectionViewLayout _computeLayoutInfo](self, "_computeLayoutInfo");
    -[HUQuickControlCollectionViewLayout layoutInfo](self, "layoutInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutDetailsArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__HUQuickControlCollectionViewLayout_prepareLayout__block_invoke;
    v10[3] = &unk_1E6F60A38;
    v10[4] = self;
    objc_msgSend(v6, "na_each:", v10);

    -[HUQuickControlCollectionViewLayout collectionViewContentSize](self, "collectionViewContentSize");
    v8 = v7;
    -[HUQuickControlCollectionViewLayout heightConstraint](self, "heightConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", v8);

  }
}

uint64_t __51__HUQuickControlCollectionViewLayout_prepareLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeGridLayoutAttributesForLayoutInfo:", a2);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[8];
  _QWORD v18[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HUQuickControlCollectionViewLayout cachedLayoutAttributesByIndexPath](self, "cachedLayoutAttributesByIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__HUQuickControlCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v18[3] = &__block_descriptor_64_e76___UICollectionViewLayoutAttributes_16__0__UICollectionViewLayoutAttributes_8l;
  *(CGFloat *)&v18[4] = x;
  *(CGFloat *)&v18[5] = y;
  *(CGFloat *)&v18[6] = width;
  *(CGFloat *)&v18[7] = height;
  objc_msgSend(v9, "na_map:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  -[HUQuickControlCollectionViewLayout cachedSectionHeaderLayoutAttributes](self, "cachedSectionHeaderLayoutAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __72__HUQuickControlCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v17[3] = &__block_descriptor_64_e54_B16__0__HUQuickControlCollectionViewLayoutAttributes_8l;
  *(CGFloat *)&v17[4] = x;
  *(CGFloat *)&v17[5] = y;
  *(CGFloat *)&v17[6] = width;
  *(CGFloat *)&v17[7] = height;
  objc_msgSend(v14, "na_filter:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObjectsFromArray:", v15);
  return v12;
}

id __72__HUQuickControlCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(CGRect *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  CGRect v7;

  v3 = a2;
  objc_msgSend(v3, "frame");
  if (CGRectIntersectsRect(v7, a1[1]))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

BOOL __72__HUQuickControlCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2(CGRect *a1, void *a2)
{
  CGRect v4;

  objc_msgSend(a2, "frame");
  return CGRectIntersectsRect(v4, a1[1]);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HUQuickControlCollectionViewLayout cachedLayoutAttributesByIndexPath](self, "cachedLayoutAttributesByIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[HUQuickControlCollectionViewLayout prepareLayout](self, "prepareLayout");
    -[HUQuickControlCollectionViewLayout cachedLayoutAttributesByIndexPath](self, "cachedLayoutAttributesByIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      NSLog(CFSTR("did not create attributes for index path %@!"), v4);
  }

  return v6;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  if ((id)*MEMORY[0x1E0CEB3B0] == a3)
  {
    NSLog(CFSTR("collection view layout asking for a footer unexpectedly"));
    v9 = 0;
  }
  else
  {
    -[HUQuickControlCollectionViewLayout cachedSectionHeaderLayoutAttributes](self, "cachedSectionHeaderLayoutAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      NSLog(CFSTR("did not create attributes for index path %@!"), v6);
  }

  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  BOOL v8;

  height = a3.size.height;
  width = a3.size.width;
  -[HUQuickControlCollectionViewLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v8 = v7 != height || v6 != width;

  return v8;
}

- (void)setLayoutOptions:(id)a3
{
  void *v5;
  HUQuickControlCollectionViewControllerLayoutOptions *v6;

  v6 = (HUQuickControlCollectionViewControllerLayoutOptions *)a3;
  if (self->_layoutOptions != v6)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[HUQuickControlCollectionViewLayout layoutManager](self, "layoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayoutOptions:", v6);

  }
}

- (id)delegate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[HUQuickControlCollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2B0820))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)_intrinsicSizeDescriptorForItemAtIndexPath:(id)a3 itemSize:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUQuickControlCollectionViewLayout delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0
    || (-[HUQuickControlCollectionViewLayout delegate](self, "delegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "intrinsicSizeDescriptorForItemAtIndexPath:itemSize:", v6, a4),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    v11 = objc_msgSend(v6, "section");
    -[HUQuickControlCollectionViewLayout layoutManager](self, "layoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "numberOfSections");

    if (v11 >= v14)
    {
      NSLog(CFSTR("Unexpected index path %@"), v6);
    }
    else
    {
      HFLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_error_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_ERROR, "indexPath %@ is valid but we don't have an intrinsic size descriptor", buf, 0xCu);
      }

    }
    +[HUIntrinsicSizeDescriptor noIntrinsicSizeDescriptor](HUIntrinsicSizeDescriptor, "noIntrinsicSizeDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_computeSizingLayoutInfo
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  HUQuickControlCollectionViewGridLayoutDetails *v24;
  void *v25;
  void *v26;
  BOOL v27;
  HUQuickControlCollectionViewGridLayoutRowInfo *v28;
  HUQuickControlCollectionViewGridLayoutItemInfo *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id obj;
  HUQuickControlCollectionViewLayoutInfo *v41;
  _QWORD v42[6];
  uint64_t v43;
  double *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  HUQuickControlCollectionViewGridLayoutItemInfo *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v41 = objc_alloc_init(HUQuickControlCollectionViewLayoutInfo);
  -[HUQuickControlCollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  -[HUQuickControlCollectionViewLayout contentInset](self, "contentInset");
  -[HUQuickControlCollectionViewLayoutInfo setAvailableContentFrame:](v41, "setAvailableContentFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  -[HUQuickControlCollectionViewLayout layoutManager](self, "layoutManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collectionSectionSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewLayoutInfo setLayoutDetailsArray:](v41, "setLayoutDetailsArray:", v17);

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v16;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v49;
    v20 = *MEMORY[0x1E0C9D538];
    v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v49 != v19)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v22);
        v24 = objc_alloc_init(HUQuickControlCollectionViewGridLayoutDetails);
        -[HUQuickControlCollectionViewGridLayoutDetails setSettings:](v24, "setSettings:", v23);
        -[HUQuickControlCollectionViewGridLayoutDetails setSectionIndex:](v24, "setSectionIndex:", objc_msgSend(v23, "sectionNumber"));
        objc_msgSend(v23, "sectionHeader");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {

        }
        else
        {
          objc_msgSend(v23, "sectionAttributedHeader");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26 == 0;

          if (v27)
            goto LABEL_10;
        }
        v28 = objc_alloc_init(HUQuickControlCollectionViewGridLayoutRowInfo);
        -[HUQuickControlCollectionViewGridLayoutRowInfo setNumberOfItems:](v28, "setNumberOfItems:", 1);
        -[HUQuickControlCollectionViewGridLayoutRowInfo setRowOrigin:](v28, "setRowOrigin:", v20, v21);
        v29 = objc_alloc_init(HUQuickControlCollectionViewGridLayoutItemInfo);
        -[HUQuickControlCollectionViewGridLayoutItemInfo setPreferredSize:](v29, "setPreferredSize:", v8, 50.0);
        v52 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlCollectionViewGridLayoutRowInfo setItemLayouts:](v28, "setItemLayouts:", v30);

        -[HUQuickControlCollectionViewGridLayoutRowInfo setContentSize:](v28, "setContentSize:", v8, 50.0);
        -[HUQuickControlCollectionViewGridLayoutDetails setSectionHeaderLayout:](v24, "setSectionHeaderLayout:", v28);

LABEL_10:
        -[HUQuickControlCollectionViewLayout _computeRowLayoutsForGridLayout:gridLayoutSettings:](self, "_computeRowLayoutsForGridLayout:gridLayoutSettings:", v24, v23);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0;
        v44 = (double *)&v43;
        v45 = 0x3010000000;
        v46 = &unk_1B94F0049;
        v47 = *MEMORY[0x1E0C9D820];
        -[HUQuickControlCollectionViewGridLayoutDetails sectionHeaderLayout](v24, "sectionHeaderLayout");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          -[HUQuickControlCollectionViewGridLayoutDetails sectionHeaderLayout](v24, "sectionHeaderLayout");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "contentSize");
          v44[5] = v34 + v44[5];

        }
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __62__HUQuickControlCollectionViewLayout__computeSizingLayoutInfo__block_invoke;
        v42[3] = &unk_1E6F60AA0;
        v42[4] = v23;
        v42[5] = &v43;
        objc_msgSend(v31, "enumerateObjectsUsingBlock:", v42);
        -[HUQuickControlCollectionViewGridLayoutDetails setRowLayouts:](v24, "setRowLayouts:", v31);
        v35 = HUSizeRoundedToScreenScale();
        -[HUQuickControlCollectionViewGridLayoutDetails setContentFrame:](v24, "setContentFrame:", v20, v21, v35, v36);
        -[HUQuickControlCollectionViewLayoutInfo layoutDetailsArray](v41, "layoutDetailsArray");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v24);

        _Block_object_dispose(&v43, 8);
        ++v22;
      }
      while (v18 != v22);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v18);
  }

  return v41;
}

void __62__HUQuickControlCollectionViewLayout__computeSizingLayoutInfo__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  v6 = a2;
  objc_msgSend(v6, "contentSize");
  if (v5 >= v7)
    v7 = v5;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v7;
  v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v6, "contentSize");
  v10 = v9;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v8 + v10;
  if (a3)
  {
    v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "rowSpacing");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v11 + v12;
  }
}

- (id)_computeRowLayoutsForGridLayout:(id)a3 gridLayoutSettings:(id)a4
{
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  HUQuickControlCollectionViewGridLayoutRowInfo *v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  void *v17;
  HUQuickControlCollectionViewGridLayoutItemInfo *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v33 = objc_msgSend(v6, "numberOfRows");
  v34 = (id)objc_opt_new();
  if (v33)
  {
    v8 = 0;
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v11 = *MEMORY[0x1E0CEBDE0];
    *(_QWORD *)&v7 = 138412546;
    v32 = v7;
    do
    {
      v12 = objc_alloc_init(HUQuickControlCollectionViewGridLayoutRowInfo);
      -[HUQuickControlCollectionViewGridLayoutRowInfo setNumberOfItems:](v12, "setNumberOfItems:", objc_msgSend(v5, "numberOfColumnsInRow:", v8));
      objc_msgSend(v34, "addObject:", v12);
      v13 = (void *)objc_opt_new();
      if (-[HUQuickControlCollectionViewGridLayoutRowInfo numberOfItems](v12, "numberOfItems"))
      {
        v14 = 0;
        v15 = v9;
        v16 = v10;
        do
        {
          objc_msgSend(v5, "indexPathForRow:column:", v8, v14, v32);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_alloc_init(HUQuickControlCollectionViewGridLayoutItemInfo);
          -[HUQuickControlCollectionViewGridLayoutItemInfo setTitlePosition:](v18, "setTitlePosition:", objc_msgSend(v6, "titlePosition"));
          -[HUQuickControlCollectionViewLayout _intrinsicSizeDescriptorForItemAtIndexPath:itemSize:](self, "_intrinsicSizeDescriptorForItemAtIndexPath:itemSize:", v17, objc_msgSend(v6, "itemSize"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "intrinsicSize");
          -[HUQuickControlCollectionViewGridLayoutItemInfo setPreferredSize:](v18, "setPreferredSize:");
          -[HUQuickControlCollectionViewGridLayoutItemInfo preferredSize](v18, "preferredSize");
          v22 = v21;
          v23 = v20;
          if (v20 == v11 || v20 < 57.0)
          {
            HFLogForCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v32;
              v37 = v17;
              v38 = 2048;
              v39 = v23;
              _os_log_error_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_ERROR, "item at indexPath %@ has height %f that is very small.", buf, 0x16u);
            }

            objc_msgSend(v19, "aspectRatio");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = 57.0;
            if (v25)
            {
              objc_msgSend(v19, "aspectRatio");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "doubleValue");
              v22 = v27 * 57.0;

              v23 = 57.0;
            }
          }
          -[HUQuickControlCollectionViewGridLayoutItemInfo setSize:](v18, "setSize:", v22, v23);
          -[HUQuickControlCollectionViewGridLayoutItemInfo size](v18, "size");
          v15 = v15 + v28;
          if (v14)
          {
            objc_msgSend(v6, "interitemSpacing");
            v15 = v15 + v29;
          }
          -[HUQuickControlCollectionViewGridLayoutItemInfo size](v18, "size");
          if (v16 < v30)
            v16 = v30;
          objc_msgSend(v13, "addObject:", v18);

          ++v14;
        }
        while (v14 < -[HUQuickControlCollectionViewGridLayoutRowInfo numberOfItems](v12, "numberOfItems"));
      }
      -[HUQuickControlCollectionViewGridLayoutRowInfo setItemLayouts:](v12, "setItemLayouts:", v13, v32);
      -[HUQuickControlCollectionViewGridLayoutRowInfo setContentSize:](v12, "setContentSize:", HUSizeRoundedToScreenScale());

      ++v8;
    }
    while (v8 != v33);
  }

  return v34;
}

- (void)_computeLayoutInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  double v23;
  _QWORD v24[6];
  _QWORD v25[5];
  id v26;

  -[HUQuickControlCollectionViewLayout _computeSizingLayoutInfo](self, "_computeSizingLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutDetailsArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke;
  v25[3] = &unk_1E6F60AF0;
  v25[4] = self;
  v6 = v3;
  v26 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v25);

  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_3;
  v24[3] = &unk_1E6F60B18;
  v20 = v6;
  v24[4] = v20;
  v24[5] = self;
  objc_msgSend(v20, "setCollectionViewContentSize:", __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_3((uint64_t)v24));
  objc_msgSend(v20, "collectionViewContentSize");
  v8 = v7;
  objc_msgSend(v20, "availableContentFrame");
  v10 = v9;
  objc_msgSend(v20, "layoutDetailsArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentFrame");
  v14 = v13;

  objc_msgSend(v20, "availableContentFrame");
  v16 = HURoundToScreenScale(v15 + fmax((v10 - (v8 - v14)) * 0.5, 0.0));
  if (v16 > v14)
  {
    v17 = v16 - v14;
    objc_msgSend(v20, "layoutDetailsArray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_4;
    v21[3] = &unk_1E6F60B40;
    v23 = v17;
    v19 = v20;
    v22 = v19;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v21);

    objc_msgSend(v19, "collectionViewContentSize");
    objc_msgSend(v19, "setCollectionViewContentSize:");

  }
  -[HUQuickControlCollectionViewLayout setLayoutInfo:](self, "setLayoutInfo:", v20);

}

void __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_computeRowLayoutOriginsFromLayoutDetails:forSectionSettings:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRowLayouts:", v8);

  objc_msgSend(v5, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionTopPadding");
  v11 = v10;

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_2;
  v15[3] = &unk_1E6F60AC8;
  v16 = *(id *)(a1 + 40);
  v17 = v5;
  v18 = a3;
  v19 = v11;
  v14 = v5;
  v12 = v16;
  objc_msgSend(v14, "setContentFrame:", __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_2((uint64_t)v15));
  objc_msgSend(*(id *)(a1 + 40), "layoutDetailsArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:atIndexedSubscript:", v14, a3);

}

double __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v25;

  objc_msgSend(*(id *)(a1 + 32), "availableContentFrame");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "contentFrame");
  v5 = (v3 - v4) * 0.5;
  objc_msgSend(*(id *)(a1 + 40), "contentFrame");
  objc_msgSend(*(id *)(a1 + 32), "availableContentFrame");
  v7 = v6;
  v8 = fmax(v5, 0.0);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "layoutDetailsArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", *(_QWORD *)(a1 + 48) - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentFrame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v25.origin.x = v12;
    v25.origin.y = v14;
    v25.size.width = v16;
    v25.size.height = v18;
    CGRectGetMaxY(v25);
  }
  v19 = v7 + v8;
  if (v5 < 0.0)
  {
    objc_msgSend(*(id *)(a1 + 40), "contentFrame");
    v21 = v19 + v20;
    objc_msgSend(*(id *)(a1 + 32), "availableContentFrame");
    if (v21 > v22)
    {
      objc_msgSend(*(id *)(a1 + 32), "availableContentFrame");
      return v5 + v23;
    }
  }
  return v19;
}

double __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MaxX;
  double v15;
  double v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v25;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  objc_msgSend(*(id *)(a1 + 32), "layoutDetailsArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return *MEMORY[0x1E0C9D820];
  objc_msgSend(*(id *)(a1 + 32), "layoutDetailsArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  MaxX = CGRectGetMaxX(v27);
  objc_msgSend(*(id *)(a1 + 40), "contentInset");
  v16 = MaxX + v15;
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  CGRectGetMaxY(v28);
  objc_msgSend(*(id *)(a1 + 40), "contentInset");
  objc_msgSend(*(id *)(a1 + 32), "layoutDetailsArray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 >= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "layoutDetailsArray");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "contentFrame");
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
    v25 = CGRectGetMaxX(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    CGRectGetMaxY(v30);
    objc_msgSend(*(id *)(a1 + 40), "contentInset");
    if (v16 < v25)
      v16 = v25;

  }
  return v16;
}

void __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(v5, "contentFrame");
  objc_msgSend(v5, "setContentFrame:");
  objc_msgSend(*(id *)(a1 + 32), "layoutDetailsArray");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:atIndexedSubscript:", v5, a3);

}

- (id)_computeRowLayoutOriginsFromLayoutDetails:(id)a3 forSectionSettings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(v5, "sectionHeaderLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "sectionHeaderLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentSize");
    v19[3] = (unint64_t)(v9 + (double)(unint64_t)v19[3]);

  }
  objc_msgSend(v5, "rowLayouts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke;
  v14[3] = &unk_1E6F60BB8;
  v17 = &v18;
  v11 = v6;
  v15 = v11;
  v12 = v5;
  v16 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD aBlock[4];
  id v20;
  id v21;
  uint64_t v22;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke_2;
  aBlock[3] = &unk_1E6F60B68;
  v22 = *(_QWORD *)(a1 + 48);
  v5 = v3;
  v20 = v5;
  v21 = *(id *)(a1 + 32);
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v5, "contentSize");
  v8 = v7;
  v12 = v4;
  v13 = 3221225472;
  v14 = __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke_3;
  v15 = &unk_1E6F60B90;
  v9 = *(id *)(a1 + 32);
  v16 = v9;
  v10 = *(id *)(a1 + 40);
  v17 = v10;
  v18 = v8;
  v11 = __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke_3((uint64_t)&v12);
  objc_msgSend(v5, "setRowOrigin:", v11, (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v12, v13, v14, v15, v16);

  if (v6)
    v6[2](v6);

}

double __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "contentSize");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "rowSpacing");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = v3 + v4 + (double)*(unint64_t *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = (unint64_t)result;
  return result;
}

double __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "horizontalAlignment");
  v3 = 0.0;
  if (v2 != 1)
  {
    if (v2 == 3)
    {
      objc_msgSend(*(id *)(a1 + 40), "contentFrame");
      if ((v4 - *(double *)(a1 + 48)) * 0.5 >= 0.0)
        return (v4 - *(double *)(a1 + 48)) * 0.5;
      else
        return 0.0;
    }
    else
    {
      NSLog(CFSTR("Unsupported alignment option"));
    }
  }
  return v3;
}

- (void)_computeGridLayoutAttributesForLayoutInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  HUQuickControlCollectionViewLayout *v17;

  v4 = a3;
  objc_msgSend(v4, "sectionHeaderLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "indexPathForSectionHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlCollectionViewLayout cachedSectionHeaderLayoutAttributes](self, "cachedSectionHeaderLayoutAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "sectionIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](HUQuickControlCollectionViewLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", *MEMORY[0x1E0CEB3B8], v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sectionHeaderLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentSize");

      objc_msgSend(v4, "contentFrame");
      objc_msgSend(v9, "setFrame:", 0.0);
      -[HUQuickControlCollectionViewLayout cachedSectionHeaderLayoutAttributes](self, "cachedSectionHeaderLayoutAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "sectionIndex"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v12);

    }
  }
  objc_msgSend(v4, "rowLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__HUQuickControlCollectionViewLayout__computeGridLayoutAttributesForLayoutInfo___block_invoke;
  v15[3] = &unk_1E6F60BE0;
  v16 = v4;
  v17 = self;
  v14 = v4;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

}

void __80__HUQuickControlCollectionViewLayout__computeGridLayoutAttributesForLayoutInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id v25;

  v25 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contentFrame");
  v6 = v5;
  objc_msgSend(v25, "rowOrigin");
  v8 = v7;
  if (objc_msgSend(v25, "numberOfItems"))
  {
    v9 = 0;
    v10 = v6 + v8;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "indexPathForRow:column:", a3, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "cachedLayoutAttributesByIndexPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(v25, "itemLayouts");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "size");
        objc_msgSend(v25, "contentSize");
        objc_msgSend(v15, "size");
        v17 = v16;
        objc_msgSend(*(id *)(a1 + 32), "settings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "itemSize");

        +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](HUQuickControlCollectionViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTitlePosition:", objc_msgSend(v15, "titlePosition"));
        objc_msgSend(v13, "setItemSize:", v19);
        objc_msgSend(*(id *)(a1 + 40), "collectionView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "traitCollection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "displayScale");
        UIRectIntegralWithScale();
        objc_msgSend(v13, "setFrame:");

        objc_msgSend(*(id *)(a1 + 40), "cachedLayoutAttributesByIndexPath");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v13, v11);

        objc_msgSend(*(id *)(a1 + 32), "settings");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "interitemSpacing");
        v10 = v10 + v17 + v24;

      }
      ++v9;
    }
    while (v9 < objc_msgSend(v25, "numberOfItems"));
  }

}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (HUQuickControlCollectionViewControllerLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (HUQuickControlGridLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (void)setLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_layoutManager, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSMutableDictionary)cachedLayoutAttributesByIndexPath
{
  return self->_cachedLayoutAttributesByIndexPath;
}

- (NSMutableDictionary)cachedSectionHeaderLayoutAttributes
{
  return self->_cachedSectionHeaderLayoutAttributes;
}

- (HUQuickControlCollectionViewLayoutInfo)layoutInfo
{
  return self->_layoutInfo;
}

- (void)setLayoutInfo:(id)a3
{
  objc_storeStrong((id *)&self->_layoutInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_storeStrong((id *)&self->_cachedSectionHeaderLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_cachedLayoutAttributesByIndexPath, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
