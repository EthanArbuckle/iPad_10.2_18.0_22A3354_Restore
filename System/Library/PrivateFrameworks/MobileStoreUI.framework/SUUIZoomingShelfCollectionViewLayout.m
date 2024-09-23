@implementation SUUIZoomingShelfCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (void)prepareLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double focusedItemHorizontalCenterOffset;
  double interItemSpacing;
  double itemWidth;
  double scaledItemWidth;
  double v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *cachedLayoutAttributes;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  float v37;
  double v38;
  void *v39;
  double v40;
  float v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  char v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  objc_super v63;
  CGRect v64;
  CGRect v65;

  v63.receiver = self;
  v63.super_class = (Class)SUUIZoomingShelfCollectionViewLayout;
  -[SUUIZoomingShelfCollectionViewLayout prepareLayout](&v63, sel_prepareLayout);
  -[SUUIZoomingShelfCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v61 = v5;
  v62 = v4;
  v59 = v7;
  v60 = v6;
  v49 = v3;
  objc_msgSend(v3, "contentOffset");
  v9 = v8;
  focusedItemHorizontalCenterOffset = self->_focusedItemHorizontalCenterOffset;
  interItemSpacing = self->_interItemSpacing;
  itemWidth = self->_itemWidth;
  scaledItemWidth = self->_scaledItemWidth;
  v14 = scaledItemWidth * 0.5;
  if (self->_cachedLayoutAttributes && self->_invalidateGeometryOnlyOfExistingLayoutAttributes)
  {
    v55 = 0;
  }
  else
  {
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cachedLayoutAttributes = self->_cachedLayoutAttributes;
    self->_cachedLayoutAttributes = v15;

    v55 = 1;
  }
  v17 = itemWidth * 0.5;
  v57 = interItemSpacing + itemWidth;
  v58 = focusedItemHorizontalCenterOffset - v14;
  v48 = objc_msgSend(v3, "numberOfSections");
  if (v48 <= 0)
  {
    v44 = scaledItemWidth - itemWidth;
    v43 = -1.0;
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v46 = scaledItemWidth * 0.5;
    v47 = focusedItemHorizontalCenterOffset;
    v20 = v17 + interItemSpacing + v14 + v17 + interItemSpacing + v14;
    v53 = v20 * 0.5;
    v54 = v9 + focusedItemHorizontalCenterOffset;
    v56 = scaledItemWidth - itemWidth;
    v52 = v20 - (scaledItemWidth - itemWidth);
    v21 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v51 = *MEMORY[0x24BDBF090];
    v22 = *MEMORY[0x24BDE5D20];
    v23 = scaledItemWidth / itemWidth;
    v24 = 1.0 - scaledItemWidth / itemWidth + 1.0 - scaledItemWidth / itemWidth;
    do
    {
      v25 = objc_msgSend(v49, "numberOfItemsInSection:", v19, *(_QWORD *)&v46, *(_QWORD *)&v47);
      if (v25 >= 1)
      {
        for (i = 0; i != v25; ++i)
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", i, v19);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v55 & 1) != 0
            || (-[NSMutableDictionary objectForKey:](self->_cachedLayoutAttributes, "objectForKey:", v27),
                (v28 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setBackgroundColor:", v50);
          }
          -[SUUIShelfLayoutData sizeForItemAtIndex:](self->_layoutData, "sizeForItemAtIndex:", v18 + i);
          v30 = v29;
          v31 = v17 + v58 + (double)(v18 + i) * v57;
          v32 = (v53 + v31 - v54) / v52;
          if (v32 < 0.0)
            v32 = 0.0;
          v33 = fmin(v32, 1.0);
          objc_msgSend(v28, "_setZoomingImageLambda:", v33);
          v64.origin.y = v61;
          v64.origin.x = v62;
          v64.size.height = v59;
          v64.size.width = v60;
          objc_msgSend(v28, "setCenter:", v31 + v33 * v56, CGRectGetMinY(v64) + v30 * 0.5);
          objc_msgSend(v28, "setBounds:", v51, v21, itemWidth, v30);
          v34 = fabs(v33 + -0.5);
          objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v22);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v36 = 1.0 - v34;
          objc_msgSend(v35, "_solveForInput:", v36);
          v38 = v37;

          objc_msgSend(v28, "setZoomingImageAlpha:", v38);
          objc_msgSend(v28, "setZoomingImageWidth:", itemWidth * (v23 + v24 * v34));
          objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v22);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v40 = v34 + v34;
          objc_msgSend(v39, "_solveForInput:", v40);
          v42 = v41;

          objc_msgSend(v28, "setZoomingImageImposedAlphaOfOtherViews:", v42);
          -[NSMutableDictionary setObject:forKey:](self->_cachedLayoutAttributes, "setObject:forKey:", v28, v27);

        }
      }
      v18 += v25;
      ++v19;
    }
    while (v19 != v48);
    v43 = (double)(v18 - 1);
    v14 = v46;
    focusedItemHorizontalCenterOffset = v47;
    v44 = v56;
  }
  -[SUUIShelfLayoutData totalContentSize](self->_layoutData, "totalContentSize");
  self->_cachedCollectionViewContentSize.width = v17 + v44 + v17 + v58 + v43 * v57;
  self->_cachedCollectionViewContentSize.height = v45;
  v65.origin.y = v61;
  v65.origin.x = v62;
  v65.size.height = v59;
  v65.size.width = v60;
  self->_cachedCollectionViewContentSize.width = self->_cachedCollectionViewContentSize.width
                                               + CGRectGetWidth(v65)
                                               - focusedItemHorizontalCenterOffset
                                               - v14;

}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedCollectionViewContentSize.width;
  height = self->_cachedCollectionViewContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  NSMutableDictionary *cachedLayoutAttributes;
  id v10;
  _QWORD v12[4];
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  cachedLayoutAttributes = self->_cachedLayoutAttributes;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__SUUIZoomingShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v12[3] = &unk_2511F58E0;
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  v10 = v8;
  v13 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedLayoutAttributes, "enumerateKeysAndObjectsUsingBlock:", v12);

  return v10;
}

void __74__SUUIZoomingShelfCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  CGRect v5;

  v4 = a3;
  objc_msgSend(v4, "frame");
  if (CGRectIntersectsRect(v5, *(CGRect *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_cachedLayoutAttributes, "objectForKey:", a3);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  v14.receiver = self;
  v14.super_class = (Class)SUUIZoomingShelfCollectionViewLayout;
  -[SUUIZoomingShelfCollectionViewLayout invalidationContextForBoundsChange:](&v14, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIZoomingShelfCollectionViewLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  if (v9 == width && v11 == height)
    objc_msgSend(v6, "setInvalidateGeometryOnlyOfExistingLayoutAttributes:", 1);
  return v6;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  self->_invalidateGeometryOnlyOfExistingLayoutAttributes = objc_msgSend(v4, "invalidateGeometryOnlyOfExistingLayoutAttributes");
  v5.receiver = self;
  v5.super_class = (Class)SUUIZoomingShelfCollectionViewLayout;
  -[SUUIZoomingShelfCollectionViewLayout invalidateLayoutWithContext:](&v5, sel_invalidateLayoutWithContext_, v4);

}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  double focusedItemHorizontalCenterOffset;
  double interItemSpacing;
  double itemWidth;
  double scaledItemWidth;
  NSMutableDictionary *cachedLayoutAttributes;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  _QWORD v27[7];
  _QWORD v28[4];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[SUUIZoomingShelfCollectionViewLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  focusedItemHorizontalCenterOffset = self->_focusedItemHorizontalCenterOffset;
  interItemSpacing = self->_interItemSpacing;
  itemWidth = self->_itemWidth;
  scaledItemWidth = self->_scaledItemWidth;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__10;
  v33 = __Block_byref_object_dispose__10;
  v34 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0x7FEFFFFFFFFFFFFFLL;
  cachedLayoutAttributes = self->_cachedLayoutAttributes;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __106__SUUIZoomingShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke;
  v27[3] = &unk_2511F5908;
  *(double *)&v27[6] = v7 + focusedItemHorizontalCenterOffset;
  v27[4] = v28;
  v27[5] = &v29;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedLayoutAttributes, "enumerateKeysAndObjectsUsingBlock:", v27);
  v26.receiver = self;
  v26.super_class = (Class)SUUIZoomingShelfCollectionViewLayout;
  -[SUUIZoomingShelfCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v26, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, v7, v6, x, y);
  v17 = v16;
  v18 = (void *)v30[5];
  if (v18)
  {
    v19 = objc_msgSend(v18, "section");
    v20 = objc_msgSend((id)v30[5], "item");
    if (v19 < 1)
    {
      v22 = 0;
    }
    else
    {
      v21 = 0;
      v22 = 0;
      do
        v22 += objc_msgSend(v9, "numberOfItemsInSection:", v21++);
      while (v19 != v21);
    }
    v23 = itemWidth * 0.5
        + focusedItemHorizontalCenterOffset
        - scaledItemWidth * 0.5
        + (double)(v22 + v20) * (interItemSpacing + itemWidth)
        + (scaledItemWidth - itemWidth) * 0.5
        - focusedItemHorizontalCenterOffset;
  }
  else
  {
    v23 = v15;
  }
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v29, 8);

  v24 = v23;
  v25 = v17;
  result.y = v25;
  result.x = v24;
  return result;
}

void __106__SUUIZoomingShelfCollectionViewLayout_targetContentOffsetForProposedContentOffset_withScrollingVelocity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v6;
  double v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(a3, "center");
  v7 = vabdd_f64(v6, *(double *)(a1 + 48));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v7 < *(double *)(v8 + 24))
  {
    *(double *)(v8 + 24) = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)menuBarFocusedItemIndexPathWithTransitionProgress:(double *)a3
{
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void **v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  void *v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x24BDAC8D0];
  -[SUUIZoomingShelfCollectionViewLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");
  objc_msgSend(v4, "indexPathsForVisibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "contentOffset");
    if (v6 <= 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v9;
      v10 = (void **)v32;
    }
    else
    {
      v7 = objc_msgSend(v4, "numberOfSections") - 1;
      v8 = objc_msgSend(v4, "numberOfItemsInSection:", v7);
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v8 - 1, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v9;
      v10 = &v31;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v27;
    v17 = 1.79769313e308;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_cachedLayoutAttributes, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_zoomingImageLambda");
        v22 = v21;
        if (fabs(v21 + -0.5) < fabs(v17 + -0.5))
        {
          v23 = v19;

          v17 = v22;
          v15 = v23;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
    v17 = 1.79769313e308;
  }

  if (a3)
    *a3 = v17 * 2.0 + -1.0;

  return v15;
}

- (void)setMenuBarFocusedItemIndexPath:(id)a3 withTransitionProgress:(double)a4
{
  void *v6;
  double interItemSpacing;
  double itemWidth;
  double scaledItemWidth;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  -[SUUIZoomingShelfCollectionViewLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  interItemSpacing = self->_interItemSpacing;
  itemWidth = self->_itemWidth;
  scaledItemWidth = self->_scaledItemWidth;
  v10 = objc_msgSend(v16, "section");
  if (v10 < 1)
  {
    v13 = 0;
  }
  else
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    do
      v13 += objc_msgSend(v6, "numberOfItemsInSection:", v12++);
    while (v11 != v12);
  }
  v14 = itemWidth * 0.5
      + interItemSpacing
      + scaledItemWidth * 0.5
      + itemWidth * 0.5
      + interItemSpacing
      + scaledItemWidth * 0.5;
  v15 = objc_msgSend(v16, "item") + v13;
  objc_msgSend(v6, "contentOffset");
  objc_msgSend(v6, "setContentOffset:", v14 * 0.5+ itemWidth * 0.5+ scaledItemWidth * -0.5+ (double)v15 * (interItemSpacing + itemWidth)+ (a4 + 1.0) * -0.5 * (v14 - (scaledItemWidth - itemWidth)));

}

- (void)setFocusedItemHorizontalCenterOffset:(double)a3
{
  if (self->_focusedItemHorizontalCenterOffset != a3)
  {
    self->_focusedItemHorizontalCenterOffset = a3;
    -[SUUIZoomingShelfCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setLayoutData:(id)a3
{
  SUUIShelfLayoutData *v5;
  SUUIShelfLayoutData *v6;

  v5 = (SUUIShelfLayoutData *)a3;
  if (self->_layoutData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_layoutData, a3);
    -[SUUIZoomingShelfCollectionViewLayout invalidateLayout](self, "invalidateLayout");
    v5 = v6;
  }

}

- (void)setInterItemSpacing:(double)a3
{
  if (self->_interItemSpacing != a3)
  {
    self->_interItemSpacing = a3;
    -[SUUIZoomingShelfCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setItemWidth:(double)a3
{
  if (self->_itemWidth != a3)
  {
    self->_itemWidth = a3;
    -[SUUIZoomingShelfCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setScaledItemWidth:(double)a3
{
  if (self->_scaledItemWidth != a3)
  {
    self->_scaledItemWidth = a3;
    -[SUUIZoomingShelfCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

+ (double)snapToBoundariesDecelerationRate
{
  return 0.98;
}

+ (BOOL)collectionViewCanClipToBounds
{
  return 0;
}

- (SUUIShelfLayoutData)layoutData
{
  return self->_layoutData;
}

- (double)focusedItemHorizontalCenterOffset
{
  return self->_focusedItemHorizontalCenterOffset;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (double)itemWidth
{
  return self->_itemWidth;
}

- (double)scaledItemWidth
{
  return self->_scaledItemWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutData, 0);
  objc_storeStrong((id *)&self->_cachedLayoutAttributes, 0);
}

@end
