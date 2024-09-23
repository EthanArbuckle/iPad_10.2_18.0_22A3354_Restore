@implementation CKFeedCollectionViewLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  BOOL v4;
  double v5;
  int64_t v6;
  double v7;

  if (-[CKFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height)|| -[CKFeedCollectionViewLayout shouldFloatThumbnails](self, "shouldFloatThumbnails"))
  {
    v4 = 1;
  }
  else
  {
    -[CKFeedCollectionViewLayout floatingBottomDecorationHeight](self, "floatingBottomDecorationHeight");
    v4 = v5 > 0.0;
  }
  v6 = -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection");
  if (v6)
  {
    if (v6 != 3)
    {
      -[CKFeedCollectionViewLayout sectionHeaderBackgroundHeight](self, "sectionHeaderBackgroundHeight");
      if (v7 > 0.0)
        return 1;
    }
  }
  return v4;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void (**v11)(void *, const __CFString *);
  double v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  v20.receiver = self;
  v20.super_class = (Class)CKFeedCollectionViewLayout;
  -[CKFeedCollectionViewLayout invalidationContextForBoundsChange:](&v20, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFeedCollectionViewLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  if (width == v9 && height == v8)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __65__CKFeedCollectionViewLayout_invalidationContextForBoundsChange___block_invoke;
    v17 = &unk_1E274F048;
    v18 = v7;
    v19 = v6;
    v11 = (void (**)(void *, const __CFString *))_Block_copy(&v14);
    if (-[CKFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders", v14, v15, v16, v17))
    {
      v11[2](v11, CFSTR("CKFeedCollectionElementKindSectionHeader"));
      v11[2](v11, CFSTR("CKFeedCollectionElementKindSectionFooter"));
    }
    -[CKFeedCollectionViewLayout sectionHeaderBackgroundHeight](self, "sectionHeaderBackgroundHeight");
    if (v12 > 0.0)
      v11[2](v11, CFSTR("CKFeedCollectionElementKindSectionHeaderBackground"));
    if (-[CKFeedCollectionViewLayout shouldFloatThumbnails](self, "shouldFloatThumbnails"))
      v11[2](v11, CFSTR("CKFeedCollectionElementKindThumbnail"));

  }
  return v6;
}

void __65__CKFeedCollectionViewLayout_invalidationContextForBoundsChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_indexPathsForVisibleSupplementaryViewsOfKind:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 40), "_invalidateSupplementaryElementsOfKind:atIndexPaths:", v4);

}

- (void)prepareLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFeedCollectionViewLayout;
  -[CKFeedCollectionViewLayout prepareLayout](&v3, sel_prepareLayout);
  -[CKFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
}

- (void)_updateSectionLayoutInfosIfNecessary
{
  NSMutableArray **p_sectionLayoutInfos;
  void *v4;
  uint64_t v5;
  void *v6;
  CKFeedCollectionViewSectionLayoutInfo *v7;
  unint64_t v8;
  NSMutableArray *v9;
  _QWORD v10[7];
  _QWORD v11[4];
  __int128 v12;

  p_sectionLayoutInfos = &self->_sectionLayoutInfos;
  if (!self->_sectionLayoutInfos)
  {
    -[CKFeedCollectionViewLayout feedDatasource](self, "feedDatasource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfSectionsInFeedLayout:", self);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    if (v5 >= 1)
    {
      do
      {
        v7 = objc_alloc_init(CKFeedCollectionViewSectionLayoutInfo);
        objc_msgSend(v6, "addObject:", v7);

        --v5;
      }
      while (v5);
    }
    objc_storeStrong((id *)p_sectionLayoutInfos, v6);
    self->_contentSize = (CGSize)*MEMORY[0x1E0C9D820];
    -[CKFeedCollectionViewLayout _updateGlobalLayoutInfoWithOptions:sectionsWithUpdatedGroupIDs:](self, "_updateGlobalLayoutInfoWithOptions:sectionsWithUpdatedGroupIDs:", 0, 0);
    v8 = -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection");
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3010000000;
    v11[3] = &unk_18E8EEE6F;
    v12 = *MEMORY[0x1E0C9D538];
    v9 = *p_sectionLayoutInfos;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__CKFeedCollectionViewLayout__updateSectionLayoutInfosIfNecessary__block_invoke;
    v10[3] = &unk_1E274F070;
    v10[4] = self;
    v10[5] = v11;
    v10[6] = v8;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](v9, "enumerateObjectsWithOptions:usingBlock:", 2 * (v8 < 2), v10);
    _Block_object_dispose(v11, 8);

  }
}

void __66__CKFeedCollectionViewLayout__updateSectionLayoutInfosIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(double *)(v5 + 32);
  v7 = *(double *)(v5 + 40);
  v8 = a2;
  objc_msgSend(v8, "setOrigin:", v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "_updateLayoutInfoForSection:ignoreSizeChange:", a3, 1);
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  v13 = *(_QWORD *)(a1 + 48);
  if (v13 == 3 || v13 == 0)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v12
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(double *)(v15 + 280);
    if (v16 < v10)
      v16 = v10;
    *(double *)(v15 + 280) = v16;
    v17 = *(_QWORD *)(a1 + 32) + 280;
    v18 = v12 + *(double *)(*(_QWORD *)(a1 + 32) + 288);
  }
  else
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v10
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 32);
    *(double *)(*(_QWORD *)(a1 + 32) + 280) = v10 + *(double *)(*(_QWORD *)(a1 + 32) + 280);
    v17 = *(_QWORD *)(a1 + 32) + 280;
    v18 = *(double *)(*(_QWORD *)(a1 + 32) + 288);
    if (v18 < v12)
      v18 = v12;
  }
  *(double *)(v17 + 8) = v18;
}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _QWORD aBlock[5];
  id v49;
  double v50;
  double v51;
  double v52;
  double v53;
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;
  CGRect v57;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__CKFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  aBlock[3] = &unk_1E274F098;
  aBlock[4] = self;
  v50 = x;
  v51 = y;
  v52 = width;
  v53 = height;
  v10 = v8;
  v49 = v10;
  v11 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v9;
  v39[1] = 3221225472;
  v39[2] = __64__CKFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v39[3] = &unk_1E274F0C0;
  v44 = x;
  v45 = y;
  v46 = width;
  v47 = height;
  v14 = v10;
  v40 = v14;
  v15 = v11;
  v43 = v15;
  v16 = v12;
  v41 = v16;
  v17 = v13;
  v42 = v17;
  -[CKFeedCollectionViewLayout _enumerateSectionsInRect:withBlock:](self, "_enumerateSectionsInRect:withBlock:", v39, x, y, width, height);
  objc_msgSend(v17, "removeIndexes:", v16);
  v37[0] = v9;
  v37[1] = 3221225472;
  v37[2] = __64__CKFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_3;
  v37[3] = &unk_1E274F0E8;
  v31 = v15;
  v32 = v17;
  v38 = v31;
  objc_msgSend(v17, "enumerateIndexesUsingBlock:", v37);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFeedCollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self, "layoutAttributesForDecorationViewOfKind:atIndexPath:", CFSTR("CKFeedCollectionElementKindDecoration"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "frame");
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = height;
    if (CGRectIntersectsRect(v56, v57))
      objc_msgSend(v14, "addObject:", v19);
  }
  v30 = v19;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = v14;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v54, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v25, "indexPath", v30);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v26, "item"), -[CKFeedCollectionViewLayout compositeLayoutSection](self, "compositeLayoutSection"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setIndexPath:", v27);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v54, 16);
    }
    while (v22);
  }

  v28 = v20;
  return v28;
}

void __64__CKFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CGRect v18;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingLayoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "_adjustFloatingLayoutAttributes:inSection:", v11, a2, (_QWORD)v12);
          objc_msgSend(v11, "frame");
          if (CGRectIntersectsRect(v18, *(CGRect *)(a1 + 48)))
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

void __64__CKFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CGRect v18;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v5, "fixedLayoutAttributes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "frame");
        if (CGRectIntersectsRect(v18, *(CGRect *)(a1 + 64)))
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v5, "firstJoinedSection"));

}

uint64_t __64__CKFeedCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "fixedLayoutAttributes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
      if (!objc_msgSend(v11, "representedElementCategory"))
      {
        objc_msgSend(v11, "indexPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
          break;
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v14 = v11;

    if (v14)
      goto LABEL_14;
  }
  else
  {
LABEL_10:

  }
  v15 = objc_msgSend(v4, "item");
  -[CKFeedCollectionViewLayout collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "numberOfItemsInSection:", objc_msgSend(v4, "section"));

  if (v15 >= v17)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForCellWithIndexPath:", v4);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);
    if (v14)
    {
LABEL_14:
      objc_msgSend(v14, "indexPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v18, "item"), -[CKFeedCollectionViewLayout compositeLayoutSection](self, "compositeLayoutSection"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setIndexPath:", v19);

    }
  }

  return v14;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  int64_t v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v29;
  CKFeedCollectionViewLayout *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CKFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  v8 = objc_msgSend(v7, "section");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v9;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("CKFeedCollectionElementKindSectionHeader")) & 1) != 0
    || -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection")
    && -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection") != 3
    && objc_msgSend(v6, "isEqualToString:", CFSTR("CKFeedCollectionElementKindSectionFooter")))
  {
LABEL_2:
    if (-[CKFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders"))
      goto LABEL_3;
LABEL_25:
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v9, "fixedLayoutAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (!v19)
      goto LABEL_40;
    v30 = self;
    v21 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "representedElementCategory") == 1)
        {
          objc_msgSend(v15, "representedElementKind");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "isEqualToString:", v6) & 1) != 0)
          {
            objc_msgSend(v15, "indexPath");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isEqual:", v7);

            if ((v25 & 1) != 0)
            {
              self = v30;
LABEL_38:
              v19 = v15;
              goto LABEL_40;
            }
          }
          else
          {

          }
        }
      }
      v19 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v19)
        continue;
      goto LABEL_37;
    }
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("CKFeedCollectionElementKindSectionHeaderBackground")))
  {
    v20 = -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection");
    if (v20 && v20 != 3)
      goto LABEL_3;
    goto LABEL_2;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("CKFeedCollectionElementKindThumbnail"))
    || !-[CKFeedCollectionViewLayout shouldFloatThumbnails](self, "shouldFloatThumbnails"))
  {
    goto LABEL_25;
  }
LABEL_3:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v9, "floatingLayoutAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v11)
  {
    v12 = v11;
    v29 = v8;
    v30 = self;
    v13 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        if (objc_msgSend(v15, "representedElementCategory") == 1)
        {
          objc_msgSend(v15, "representedElementKind");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isEqualToString:", v6) & 1) != 0)
          {
            objc_msgSend(v15, "indexPath");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqual:", v7);

            if (v18)
            {
              self = v30;
              -[CKFeedCollectionViewLayout _adjustFloatingLayoutAttributes:inSection:](v30, "_adjustFloatingLayoutAttributes:inSection:", v15, v29);
              goto LABEL_38;
            }
          }
          else
          {

          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v12);
    v19 = 0;
LABEL_37:
    self = v30;
    goto LABEL_40;
  }
  v19 = 0;
LABEL_40:

  if (v19)
  {
    objc_msgSend(v19, "indexPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v26, "item"), -[CKFeedCollectionViewLayout compositeLayoutSection](self, "compositeLayoutSection"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIndexPath:", v27);

  }
  return v19;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGRect v15;
  CGRect slice;
  CGRect v17;

  v6 = a3;
  v7 = a4;
  -[CKFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("CKFeedCollectionElementKindDecoration"))
    && (-[CKFeedCollectionViewLayout floatingBottomDecorationHeight](self, "floatingBottomDecorationHeight"), v8 > 0.0))
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForDecorationViewOfKind:withIndexPath:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&slice, 0, sizeof(slice));
    -[CKFeedCollectionViewLayout collectionView](self, "collectionView", 0, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    CGRectDivide(v17, &slice, &v15, v9, CGRectMaxYEdge);

    objc_msgSend(v10, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    objc_msgSend(v10, "setZIndex:", 2);
    if (v10)
    {
      objc_msgSend(v10, "indexPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v12, "item"), -[CKFeedCollectionViewLayout compositeLayoutSection](self, "compositeLayoutSection"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setIndexPath:", v13);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unsigned)flowDirectionEdge
{
  unint64_t v2;

  v2 = -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection");
  if (v2 > 3)
    return 0;
  else
    return dword_18E7CA7F0[v2];
}

- (void)invalidateLayoutAndCache
{
  NSMutableArray *sectionLayoutInfos;

  -[CKFeedCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  sectionLayoutInfos = self->_sectionLayoutInfos;
  self->_sectionLayoutInfos = 0;

}

- (id)sectionsJoinedWithSection:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  -[CKFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isHidden") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "firstJoinedSection");
    v8 = objc_msgSend(v5, "lastJoinedSection");
    if (v7 >= v8)
      v9 = v8;
    else
      v9 = v7;
    if (v7 <= v8)
      v10 = v8;
    else
      v10 = v7;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 + 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isHidden") & 1) == 0)
        objc_msgSend(v6, "addIndex:", v9);

      ++v9;
    }
    while (v11 != v9);
  }

  return v6;
}

- (int64_t)numberOfTilesOmittedInSection:(int64_t)a3
{
  void *v5;
  int64_t v6;

  -[CKFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfTilesOmitted");

  return v6;
}

- (CGRect)frameForSection:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[CKFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "margins");
  v15 = v7 + v14;
  v17 = v9 + v16;
  v19 = v11 - (v14 + v18);
  v21 = v13 - (v16 + v20);

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)enumerateImageElementsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__CKFeedCollectionViewLayout_enumerateImageElementsInRect_usingBlock___block_invoke;
  v11[3] = &unk_1E274F110;
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  v12 = v9;
  v10 = v9;
  -[CKFeedCollectionViewLayout _enumerateSectionsInRect:withBlock:](self, "_enumerateSectionsInRect:withBlock:", v11, x, y, width, height);

}

void __70__CKFeedCollectionViewLayout_enumerateImageElementsInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "sectionType");
  if (v6 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
LABEL_15:

    goto LABEL_16;
  }
  if (!v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "fixedLayoutAttributes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "representedElementCategory");
          objc_msgSend(v12, "frame");
          if (!v13)
          {
            v18 = v16;
            v19 = v17;
            if (CGRectIntersectsRect(*(CGRect *)&v14, *(CGRect *)(a1 + 40)))
            {
              objc_msgSend(v12, "indexPath");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(v18, v19);

            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
    goto LABEL_15;
  }
LABEL_16:

}

- (id)indexPathForImageElementAtPoint:(CGPoint)a3
{
  id v8;
  _QWORD v10[6];
  CGPoint v11;
  __int128 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__CKFeedCollectionViewLayout_indexPathForImageElementAtPoint___block_invoke;
  v10[3] = &unk_1E274F138;
  v11 = a3;
  __asm { FMOV            V2.2D, #1.0 }
  v12 = _Q2;
  v10[4] = self;
  v10[5] = &v13;
  -[CKFeedCollectionViewLayout enumerateImageElementsInRect:usingBlock:](self, "enumerateImageElementsInRect:usingBlock:", v10, a3.x, a3.y, 1.0, 1.0);
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __62__CKFeedCollectionViewLayout_indexPathForImageElementAtPoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  CGRect v17;

  v16 = a2;
  v6 = a3;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("CKFeedCollectionElementKindThumbnail")))
    goto LABEL_3;
  objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v17.origin.x = v9;
  v17.origin.y = v11;
  v17.size.width = v13;
  v17.size.height = v15;
  if (CGRectIntersectsRect(v17, *(CGRect *)(a1 + 48)))
LABEL_3:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (CGRect)frameForTileAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a3;
  -[CKFeedCollectionViewLayout _updateSectionLayoutInfosIfNecessary](self, "_updateSectionLayoutInfosIfNecessary");
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tileLayoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "item");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)_delegate
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  -[CKFeedCollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EE31CD60) & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "CKFeedCollectionViewLayout - Layout delegate is nil / doesn't conform to CKFeedCollectionViewLayoutDelegate", v6, 2u);
    }

  }
  return v3;
}

- (void)_updateGlobalLayoutInfoWithOptions:(int64_t)a3 sectionsWithUpdatedGroupIDs:(id *)a4
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *sectionLayoutInfos;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  CKFeedCollectionViewLayout *v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  int64_t v35;
  _QWORD v36[4];
  _QWORD v37[5];

  -[CKFeedCollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFeedCollectionViewLayout _delegate](self, "_delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (unint64_t)-[CKFeedCollectionViewLayout flowDirection](self, "flowDirection") < 2;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0x7FFFFFFFFFFFFFFFLL;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 2 * v7;
  sectionLayoutInfos = self->_sectionLayoutInfos;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __93__CKFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke;
  v28[3] = &unk_1E274F180;
  v11 = v6;
  v29 = v11;
  v12 = v5;
  v30 = v12;
  v31 = self;
  v33 = v37;
  v34 = v36;
  v13 = v8;
  v32 = v13;
  v35 = a3;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](sectionLayoutInfos, "enumerateObjectsWithOptions:usingBlock:", v9, v28);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__23;
  v26[4] = __Block_byref_object_dispose__23;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self->_sectionLayoutInfos;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __93__CKFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke_3;
  v21[3] = &unk_1E274F1A8;
  v21[4] = self;
  v16 = v11;
  v22 = v16;
  v17 = v12;
  v23 = v17;
  v25 = v26;
  v18 = v14;
  v24 = v18;
  -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](v15, "enumerateObjectsAtIndexes:options:usingBlock:", v13, v9, v21);
  if (a4)
    *a4 = objc_retainAutorelease(v18);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v37, 8);

}

void __93__CKFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**v11)(void *, _QWORD);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD aBlock[5];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:shouldHideSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v5, "setHidden:", 1);
    goto LABEL_9;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:shouldJoinSection:withSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8, a3) & 1) != 0)goto LABEL_7;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  }
  *(_QWORD *)(v7 + 24) = a3;
LABEL_7:
  objc_msgSend(v5, "setHidden:", 0);
  objc_msgSend(v5, "setFirstJoinedSection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 272), "objectAtIndex:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLastJoinedSection:", a3);

  }
LABEL_9:
  objc_msgSend(v5, "setPreviousVisibleSection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 272), "objectAtIndex:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNextVisibleSection:", a3);

  }
  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "addIndex:", a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a3;
  }
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __93__CKFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e42_v16__0__UICollectionViewLayoutAttributes_8l;
    aBlock[4] = a3;
    v11 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v5, "fixedLayoutAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v11[2](v11, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v14);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v5, "floatingLayoutAttributes", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          v11[2](v11, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v19);
    }

  }
}

void __93__CKFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "section") != *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v3, "item"), *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIndexPath:", v4);

  }
}

void __93__CKFeedCollectionViewLayout__updateGlobalLayoutInfoWithOptions_sectionsWithUpdatedGroupIDs___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "lastJoinedSection") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectAtIndex:", objc_msgSend(v11, "firstJoinedSection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLastJoinedSection:", objc_msgSend(v5, "lastJoinedSection"));

  }
  objc_msgSend(v11, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "collectionView:layout:groupIDForSection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) || (objc_msgSend(v7, "isEqual:") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v8);
    v9 = v8;
  }
  objc_msgSend(v11, "setGroupID:", v9);
  objc_msgSend(v11, "groupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v10 && (objc_msgSend(v6, "isEqual:", v10) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 56), "addIndex:", a3);

}

- (void)_updateLayoutInfoForSection:(int64_t)a3 ignoreSizeChange:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  BOOL v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  double v79;
  BOOL v80;
  void *v81;
  void *v82;
  double v83;
  _QWORD v84[6];
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  double v94[4];
  CGRect v95;
  CGRect v96;

  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFeedCollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFeedCollectionViewLayout _delegate](self, "_delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isHidden") & 1) != 0)
    goto LABEL_30;
  v80 = a4;
  v93 = *MEMORY[0x1E0C9D820];
  *(_OWORD *)v94 = v93;
  v92 = v93;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v7, "previousVisibleSection");
  v13 = objc_msgSend(v7, "firstJoinedSection") != a3;
  objc_msgSend(v7, "groupID");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection");
  v91 = 0;
  LOBYTE(v66) = v13;
  v15 = (void *)v11;
  v16 = (void *)v10;
  v81 = (void *)v12;
  -[CKFeedCollectionViewLayout _getSize:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:](self, "_getSize:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:", v94, &v93, &v92, v10, v15, v12, &v91, a3, v66);
  objc_msgSend(v7, "origin");
  v18 = v17;
  v20 = v19;
  v21 = MEMORY[0x1E0CEB4B0];
  v23 = *MEMORY[0x1E0CEB4B0];
  v22 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v24 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v83 = *MEMORY[0x1E0C9D538];
  objc_msgSend(v7, "setFixedLayoutAttributes:", 0);
  if (v14 == 3 || !v14)
  {
    -[CKFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
    if (v9)
    {
      v84[0] = v25;
      memset(&v84[1], 0, 32);
      if (v82)
        v26 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v26 = v78;
      v84[5] = 0;
      objc_msgSend(v9, "collectionView:layout:metricsForSeparatorBetweenSection:andSection:proposedMetrics:", v8, self, v26, a3, v84);
      v27 = v86;
      v28 = v16;
      if (v86 <= 0.0)
        goto LABEL_19;
      v74 = v22;
      v76 = v20;
      v71 = v18;
      v72 = v23;
      v29 = v85;
      v30 = v87;
      v31 = v88;
      v32 = v24;
      v33 = v89;
      v34 = v90;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v83 + v31;
      v70 = v32 - v27;
      v37 = v32 - v27 + v30;
      v38 = v29 - (v31 + v34);
      v95.origin.x = v36;
      v95.origin.y = v37;
      v95.size.width = v38;
      v95.size.height = v27 - (v30 + v33);
      if (!CGRectIsEmpty(v95))
      {
        objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindSeparator"), v35);
        v68 = v15;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setFrame:", v36, v37, v38, v27 - (v30 + v33));
        objc_msgSend(v28, "addObject:", v39);

        v15 = v68;
      }
      v23 = v72 + v27;

      v22 = v74;
      goto LABEL_17;
    }
LABEL_18:
    v28 = v16;
    goto LABEL_19;
  }
  -[CKFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
  if (!v9)
    goto LABEL_18;
  v84[0] = 0;
  v84[1] = v40;
  memset(&v84[2], 0, 32);
  objc_msgSend(v9, "collectionView:layout:metricsForSeparatorBetweenSection:andSection:proposedMetrics:", v8, self, v78, a3, v84);
  v41 = v85;
  if (v85 <= 0.0)
    goto LABEL_18;
  v75 = v22;
  v76 = v20;
  v71 = v18;
  v73 = v23;
  v42 = v86;
  v43 = v87;
  v44 = v24;
  v45 = v88;
  v46 = v89;
  v47 = v90;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v83 - v41;
  v70 = v44;
  v48 = v44 + v43;
  v49 = v41 - (v45 + v47);
  v96.origin.x = v83 + v45;
  v96.origin.y = v48;
  v96.size.width = v49;
  v96.size.height = v42 - (v43 + v46);
  v28 = v16;
  if (!CGRectIsEmpty(v96))
  {
    objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindSeparator"), v67);
    v69 = v15;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFrame:", v83 + v45, v48, v49, v42 - (v43 + v46));
    objc_msgSend(v16, "addObject:", v50);

    v15 = v69;
  }
  v22 = v75 + v41;

  v23 = v73;
LABEL_17:
  v24 = v70;
  v18 = v71;
  v20 = v76;
LABEL_19:
  v51 = *(double *)(v21 + 16);
  v52 = *(double *)(v21 + 24);
  if (v82)
  {
    v53 = v81;
    if (v14 != 3 && v14)
    {
      v61 = v80;
    }
    else
    {
      v77 = v20;
      -[CKFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
      objc_msgSend(v9, "collectionView:layout:headerSizeForGroupID:proposedSize:", v8, self, v82);
      if (v54 > 0.0)
      {
        v55 = v54;
        objc_msgSend(v9, "collectionView:layout:spacingBetweenSection:andHeaderForGroupID:", v8, self, v78, v82);
        v79 = v56;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindSectionGroupHeader"), v57);
        v58 = v15;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
        objc_msgSend(v59, "setFrame:", v83, v24 - v55, v60, v55);
        objc_msgSend(v59, "setZIndex:", 5);
        objc_msgSend(v28, "addObject:", v59);
        v24 = v24 - (v55 + v79);
        v23 = v23 + v55 + v79;

        v15 = v58;
        v53 = v81;

      }
      v61 = v80;
      v20 = v77;
    }
  }
  else
  {
    v61 = v80;
    v53 = v81;
  }
  objc_msgSend(v7, "setOrigin:", v83, v24);
  v94[0] = v52 + v22 + v94[0];
  v94[1] = v51 + v23 + v94[1];
  objc_msgSend(v7, "frame");
  v63 = v62;
  v65 = v64;
  objc_msgSend(v7, "setSize:", *(_OWORD *)v94);
  objc_msgSend(v7, "setHeaderSize:", v93);
  objc_msgSend(v7, "setFooterSize:", v92);
  objc_msgSend(v7, "setFixedLayoutAttributes:", v28);
  objc_msgSend(v7, "setTileLayoutAttributes:", v15);
  objc_msgSend(v7, "setFloatingLayoutAttributes:", v53);
  objc_msgSend(v7, "setOrigin:", v18, v20);
  objc_msgSend(v7, "setMargins:", v23, v22, v51, v52);
  objc_msgSend(v7, "setSectionType:", v91);
  if (!v61)
    -[CKFeedCollectionViewLayout _sectionAtIndex:sizeDidChangeFrom:to:](self, "_sectionAtIndex:sizeDidChangeFrom:to:", a3, v63, v65, *(_OWORD *)v94);

LABEL_30:
}

- (void)_sectionAtIndex:(int64_t)a3 sizeDidChangeFrom:(CGSize)a4 to:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  CGSize *p_contentSize;
  double v18;
  double v19;
  id v20;
  _QWORD v21[8];

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v11 = -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection");
  if (v11 > 1)
  {
    v13 = a3 + 1;
    if (v13 >= -[NSMutableArray count](self->_sectionLayoutInfos, "count"))
    {
      v14 = 0;
      v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v13, -[NSMutableArray count](self->_sectionLayoutInfos, "count") - v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
    }
  }
  else
  {
    if (a3 < 0)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = 2;
  }
  v15 = width - v8;
  v16 = height - v7;
  v21[1] = 3221225472;
  v21[2] = __67__CKFeedCollectionViewLayout__sectionAtIndex_sizeDidChangeFrom_to___block_invoke;
  v21[3] = &unk_1E274F1D0;
  v21[4] = self;
  v21[5] = v11;
  *(double *)&v21[6] = v15;
  *(double *)&v21[7] = v16;
  v20 = v12;
  v21[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v12, "enumerateIndexesWithOptions:usingBlock:", v14, v21);
  if (v11 != 3 && v11)
  {
    p_contentSize = &self->_contentSize;
    v19 = self->_contentSize.height;
    v18 = v15 + self->_contentSize.width;
    if (v19 < height)
      v19 = height;
  }
  else
  {
    p_contentSize = &self->_contentSize;
    v18 = self->_contentSize.width;
    if (v18 < width)
      v18 = width;
    v19 = v16 + self->_contentSize.height;
  }
  p_contentSize->width = v18;
  p_contentSize->height = v19;

}

void __67__CKFeedCollectionViewLayout__sectionAtIndex_sizeDidChangeFrom_to___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3;
  double v4;
  uint64_t v5;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectAtIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "origin");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 == 3 || v5 == 0)
    v4 = v4 + *(double *)(a1 + 56);
  else
    v3 = v3 + *(double *)(a1 + 48);
  objc_msgSend(v7, "setOrigin:", v3, v4);

}

- (void)_adjustFloatingLayoutAttributes:(id)a3 inSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  BOOL v11;
  CGRectEdge v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  double v87;
  double v88;
  CGFloat v89;
  double MaxX;
  double v91;
  double v92;
  _BOOL4 v93;
  double v94;
  double v95;
  double v96;
  double MinY;
  double v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double MaxY;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  BOOL v109;
  double v110;
  double v111;
  double v112;
  BOOL v113;
  double v114;
  double v115;
  double v116;
  double MinX;
  CGFloat v118;
  CGFloat v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  BOOL v133;
  double v134;
  double v135;
  double v136;
  BOOL v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  CGFloat v144;
  void *v145;
  _BYTE v146[32];
  CGFloat v147;
  CGFloat v148;
  CGFloat v149;
  double amount;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  uint64_t v154;
  CGRect slice;
  __int128 v156;
  CGRect remainder;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;

  v6 = a3;
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFeedCollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection");
  v10 = v9;
  if (v9)
    v11 = v9 == 3;
  else
    v11 = 1;
  v12 = v11;
  objc_msgSend(v8, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v8, "contentInset");
  v22 = v14 + v21;
  v24 = v16 + v23;
  v26 = v18 - (v21 + v25);
  v28 = v20 - (v23 + v27);
  -[CKFeedCollectionViewLayout floatPadding](self, "floatPadding");
  *(double *)v146 = v22 + v30;
  *(double *)&v146[8] = v24 + v29;
  *(double *)&v146[16] = v26 - (v30 + v31);
  *(double *)&v146[24] = v28 - (v29 + v32);
  objc_msgSend(v6, "frame");
  v147 = v34;
  v148 = v33;
  v36 = v35;
  amount = v37;
  objc_msgSend(v7, "frame");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  objc_msgSend(v7, "margins");
  v47 = v39 + v46;
  v49 = v41 + v48;
  v51 = v43 - (v46 + v50);
  remainder.origin.x = v47;
  remainder.origin.y = v49;
  v53 = v45 - (v48 + v52);
  remainder.size.width = v51;
  remainder.size.height = v53;
  objc_msgSend(v6, "representedElementKind");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = v36;
  if ((objc_msgSend(v54, "isEqualToString:", CFSTR("CKFeedCollectionElementKindSectionHeader")) & 1) != 0
    || (objc_msgSend(v54, "isEqualToString:", CFSTR("CKFeedCollectionElementKindSectionHeaderBackground")) & 1) != 0
    || objc_msgSend(v54, "isEqualToString:", CFSTR("CKFeedCollectionElementKindSectionFooter")))
  {
    -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", objc_msgSend(v7, "lastJoinedSection"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "frame");
    v57 = v56;
    v59 = v58;
    v61 = v60;
    v63 = v62;
    objc_msgSend(v55, "margins");
    v171.origin.x = v57 + v64;
    v171.origin.y = v59 + v65;
    v171.size.width = v61 - (v64 + v66);
    v171.size.height = v63 - (v65 + v67);
    v158.origin.x = v47;
    v158.origin.y = v49;
    v158.size.width = v51;
    v158.size.height = v53;
    v159 = CGRectUnion(v158, v171);
    remainder = v159;
    v68 = 0.0;
    v69 = 50.0;
    if (v10 && v10 != 3)
    {
      x = v159.origin.x;
      y = v159.origin.y;
      width = v159.size.width;
      height = v159.size.height;
      if ((objc_msgSend(v54, "isEqualToString:", CFSTR("CKFeedCollectionElementKindSectionHeader")) & 1) != 0
        || objc_msgSend(v54, "isEqualToString:", CFSTR("CKFeedCollectionElementKindSectionFooter")))
      {
        memset(&slice, 0, sizeof(slice));
        v74 = CGRectGetWidth(*(CGRect *)v146) * 0.800000012;
        if (amount >= v74)
          v75 = v74;
        else
          v75 = amount;
        if (objc_msgSend(v54, "isEqualToString:", CFSTR("CKFeedCollectionElementKindSectionFooter")))
        {
          objc_msgSend(v7, "headerSize");
          if (v76 >= v74)
            v77 = v74;
          else
            v77 = v76;
          v160.origin.x = x;
          v160.origin.y = y;
          v160.size.width = width;
          v160.size.height = height;
          v78 = CGRectGetWidth(v160);
          objc_msgSend(v7, "footerSize");
          v80 = v78 - v79;
          if (v77 >= v80)
            v81 = v80;
          else
            v81 = v77;
          v161.origin.x = x;
          v161.origin.y = y;
          v161.size.width = width;
          v161.size.height = height;
          CGRectDivide(v161, &slice, &remainder, v81, CGRectMinXEdge);
          v12 = CGRectMaxXEdge;
        }
        else
        {
          objc_msgSend(v7, "footerSize");
          v89 = v88;
          v162.origin.x = x;
          v162.origin.y = y;
          v162.size.width = width;
          v162.size.height = height;
          CGRectDivide(v162, &slice, &remainder, v89, CGRectMaxXEdge);
        }
        MaxX = CGRectGetMaxX(remainder);
        v163.size.height = v147;
        v163.origin.x = v148;
        v163.origin.y = v149;
        v163.size.width = v75;
        v91 = MaxX - CGRectGetMinX(v163);
        if (v75 < v91)
          v91 = v75;
        amount = v91;
        if (!-[CKFeedCollectionViewLayout shouldFloatOverShortDistances](self, "shouldFloatOverShortDistances"))
        {
          v164.origin.x = x;
          v164.origin.y = y;
          v164.size.width = width;
          v164.size.height = height;
          if (CGRectGetWidth(v164) < v74)
            CGRectDivide(remainder, &remainder, &slice, amount, v12);
        }
        v69 = 100.0;
        v68 = 100.0;
      }
      else
      {
        v69 = 0.0;
        if (objc_msgSend(v54, "isEqualToString:", CFSTR("CKFeedCollectionElementKindSectionHeaderBackground")))
        {
          v141 = CGRectGetWidth(*(CGRect *)v146);
          v168.origin.x = x;
          v168.origin.y = y;
          v168.size.width = width;
          v168.size.height = height;
          v142 = CGRectGetWidth(v168);
          if (v141 < v142)
            v142 = v141;
          amount = v142;
          v68 = 0.0;
        }
      }
    }
    v92 = v147;

    goto LABEL_40;
  }
  v69 = 0.0;
  if (!objc_msgSend(v54, "isEqualToString:", CFSTR("CKFeedCollectionElementKindThumbnail")))
  {
    v68 = 0.0;
LABEL_120:
    v92 = v147;
    goto LABEL_40;
  }
  v69 = 150.0;
  if (v10 != 3 && v10)
    goto LABEL_119;
  v82 = objc_msgSend(v7, "nextVisibleSection");
  if (v82 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v83 = v82;
    -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", v82);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "groupID");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v84)
    {
      -[CKFeedCollectionViewLayout _delegate](self, "_delegate");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
      if (v85)
      {
        v151 = v86;
        v152 = 0u;
        v153 = 0u;
        v154 = 0;
        objc_msgSend(v85, "collectionView:layout:metricsForSeparatorBetweenSection:andSection:proposedMetrics:", v8, self, a4, v83, &v151);
        v87 = slice.size.width;
      }
      else
      {
        v156 = 0u;
        memset(&slice, 0, sizeof(slice));
        v87 = 0.0;
      }
      v53 = v87 + v53;
      remainder.size.height = v53;

    }
  }
  if (-[CKFeedCollectionViewLayout shouldFloatOverShortDistances](self, "shouldFloatOverShortDistances"))
  {
LABEL_119:
    v68 = 150.0;
    goto LABEL_120;
  }
  v169.origin.x = v47;
  v169.origin.y = v49;
  v169.size.width = v51;
  v169.size.height = v53;
  v143 = CGRectGetHeight(v169);
  v92 = v147;
  v170.origin.x = v148;
  v170.origin.y = v36;
  v170.size.width = amount;
  v170.size.height = v147;
  v144 = CGRectGetHeight(v170);
  if (v143 < v144 + v144)
    remainder.size.height = v147;
  v68 = 150.0;
LABEL_40:
  v93 = -[CKFeedCollectionViewLayout shouldFloatWithEase](self, "shouldFloatWithEase");
  if (v93)
    v94 = v69;
  else
    v94 = 0.0;
  if (v93)
    v95 = v68;
  else
    v95 = 0.0;
  if (v12 == CGRectMaxXEdge)
  {
    v98 = CGRectGetMaxX(*(CGRect *)v146);
    v96 = v148;
    v165.origin.y = v149;
    v165.origin.x = v148;
    v165.size.width = amount;
    v165.size.height = v92;
    MinY = v98 - CGRectGetWidth(v165);
  }
  else if (v12 == CGRectMinYEdge)
  {
    MinY = CGRectGetMinY(*(CGRect *)v146);
    v96 = v148;
  }
  else
  {
    v96 = v148;
    MinY = CGRectGetMinX(*(CGRect *)v146);
  }
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "scale");
  v101 = v100;

  if (v10 != 3 && v10)
  {
    MinX = CGRectGetMinX(remainder);
    v118 = CGRectGetMaxX(remainder);
    v119 = v96;
    v120 = v118;
    v167.origin.x = v119;
    v167.origin.y = v149;
    v167.size.width = amount;
    v167.size.height = v92;
    v121 = v120 - CGRectGetWidth(v167);
    -[CKFeedCollectionViewLayout floatPadding](self, "floatPadding");
    if (MinX >= v122)
      v123 = MinX;
    else
      v123 = v122;
    -[CKFeedCollectionViewLayout collectionViewContentSize](self, "collectionViewContentSize");
    v125 = v124;
    -[CKFeedCollectionViewLayout floatPadding](self, "floatPadding");
    v127 = v125 - v126;
    if (v121 < v125 - v126)
      v127 = v121;
    if (v127 >= v123)
      v128 = v127;
    else
      v128 = v123;
    if (MinY >= v123)
      v129 = MinY;
    else
      v129 = v123;
    if (v129 >= v128)
      v129 = v128;
    v130 = v128 - v123;
    if (v95 > 0.0)
    {
      v131 = v130 * 0.5;
      if (v130 * 0.5 > v95)
        v131 = v95;
      v132 = (MinY - (v123 - v131)) / (v131 + v131);
      v133 = v132 >= 1.0 || v132 <= 0.0;
      v134 = v123 + v132 * v132 * v131;
      if (!v133)
        v129 = v134;
    }
    if (v94 > 0.0)
    {
      v135 = v130 * 0.5;
      if (v135 > v94)
        v135 = v94;
      v136 = (v128 + v135 - MinY) / (v135 + v135);
      v137 = v136 >= 1.0 || v136 <= 0.0;
      v138 = v128 + -(v136 * v136) * v135;
      if (!v137)
        v129 = v138;
    }
    v115 = v149;
    v96 = round(v101 * v129) / v101;
    v139 = CGRectGetWidth(remainder);
    v140 = amount;
    if (amount >= v139)
      v140 = v139;
    amount = v140;
    v116 = 1.0;
  }
  else
  {
    v102 = CGRectGetMinY(remainder);
    MaxY = CGRectGetMaxY(remainder);
    v166.origin.x = v96;
    v166.origin.y = v149;
    v166.size.width = amount;
    v166.size.height = v92;
    v104 = MaxY - CGRectGetHeight(v166);
    if (MinY >= v102)
      v105 = MinY;
    else
      v105 = v102;
    if (v105 >= v104)
      v105 = v104;
    v106 = v104 - v102;
    if (v95 > 0.0)
    {
      v107 = v106 * 0.5;
      if (v106 * 0.5 > v95)
        v107 = v95;
      v108 = (MinY - (v102 - v107)) / (v107 + v107);
      v109 = v108 >= 1.0 || v108 <= 0.0;
      v110 = v102 + v108 * v108 * v107;
      if (!v109)
        v105 = v110;
    }
    if (v94 > 0.0)
    {
      v111 = v106 * 0.5;
      if (v111 > v94)
        v111 = v94;
      v112 = (v104 + v111 - MinY) / (v111 + v111);
      v113 = v112 >= 1.0 || v112 <= 0.0;
      v114 = v104 + -(v112 * v112) * v111;
      if (!v113)
        v105 = v114;
    }
    v115 = round(v101 * v105) / v101;
    v116 = 1.0;
    if (objc_msgSend(v54, "isEqualToString:", CFSTR("CKFeedCollectionElementKindSectionHeaderBackground")))v116 = (v115 - CGRectGetMinY(remainder)) / 20.0;
  }
  objc_msgSend(v6, "setFrame:", v96, v115, amount, v92);
  objc_msgSend(v6, "setAlpha:", v116);

}

- (void)_enumerateSectionsInRect:(CGRect)a3 withBlock:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v9)(id, unint64_t, void *, _BYTE *);
  unint64_t v10;
  NSMutableArray *sectionLayoutInfos;
  BOOL v12;
  char v13;
  unint64_t i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double MaxX;
  double MinX;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double MinY;
  double MaxY;
  char v32;
  _QWORD v33[9];
  char v34;
  BOOL v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void (**)(id, unint64_t, void *, _BYTE *))a4;
  v10 = -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection");
  sectionLayoutInfos = self->_sectionLayoutInfos;
  if (v10)
    v12 = v10 == 3;
  else
    v12 = 1;
  v13 = v12;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __65__CKFeedCollectionViewLayout__enumerateSectionsInRect_withBlock___block_invoke;
  v33[3] = &unk_1E274F1F8;
  v33[4] = self;
  v34 = v13;
  v35 = v10 < 2;
  *(CGFloat *)&v33[5] = x;
  *(CGFloat *)&v33[6] = y;
  *(CGFloat *)&v33[7] = width;
  *(CGFloat *)&v33[8] = height;
  for (i = -[NSMutableArray indexOfObjectPassingTest:](sectionLayoutInfos, "indexOfObjectPassingTest:", v33);
        i < -[NSMutableArray count](self->_sectionLayoutInfos, "count");
        ++i)
  {
    -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isHidden") & 1) != 0)
      goto LABEL_24;
    objc_msgSend(v15, "frame");
    v16 = v36.origin.x;
    v17 = v36.origin.y;
    v18 = v36.size.width;
    v19 = v36.size.height;
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    if (CGRectIntersectsRect(v36, v41))
    {
      v32 = 0;
      v9[2](v9, i, v15, &v32);
      if (v32)
        goto LABEL_25;
      goto LABEL_24;
    }
    if (v10 != 3 && v10)
    {
      v26 = v16;
      v27 = v17;
      v28 = v18;
      v29 = v19;
      if (v10 <= 1)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v26);
        v38.origin.x = x;
        v38.origin.y = y;
        v38.size.width = width;
        v38.size.height = height;
        MinX = CGRectGetMinX(v38);
LABEL_19:
        if (MaxX < MinX)
          goto LABEL_25;
        goto LABEL_24;
      }
      MinY = CGRectGetMinX(*(CGRect *)&v26);
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      MaxY = CGRectGetMaxX(v40);
    }
    else
    {
      v20 = v16;
      v21 = v17;
      v22 = v18;
      v23 = v19;
      if (v10 <= 1)
      {
        MaxX = CGRectGetMaxY(*(CGRect *)&v20);
        v37.origin.x = x;
        v37.origin.y = y;
        v37.size.width = width;
        v37.size.height = height;
        MinX = CGRectGetMinY(v37);
        goto LABEL_19;
      }
      MinY = CGRectGetMinY(*(CGRect *)&v20);
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      MaxY = CGRectGetMaxY(v39);
    }
    if (MinY > MaxY)
    {
LABEL_25:

      break;
    }
LABEL_24:

  }
}

BOOL __65__CKFeedCollectionViewLayout__enumerateSectionsInRect_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double MinX;
  double MaxX;
  _BOOL8 v9;
  double MaxY;
  double MinY;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectAtIndex:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  if (!*(_BYTE *)(a1 + 72))
  {
    if (*(_BYTE *)(a1 + 73))
    {
      MinX = CGRectGetMinX(*(CGRect *)&v3);
      MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 40));
      goto LABEL_6;
    }
    MaxY = CGRectGetMaxX(*(CGRect *)&v3);
    MinY = CGRectGetMinX(*(CGRect *)(a1 + 40));
LABEL_9:
    v9 = MaxY > MinY;
    goto LABEL_10;
  }
  if (!*(_BYTE *)(a1 + 73))
  {
    MaxY = CGRectGetMaxY(*(CGRect *)&v3);
    MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
    goto LABEL_9;
  }
  MinX = CGRectGetMinY(*(CGRect *)&v3);
  MaxX = CGRectGetMaxY(*(CGRect *)(a1 + 40));
LABEL_6:
  v9 = MinX < MaxX;
LABEL_10:

  return v9;
}

- (void)_getSize:(CGSize *)a3 headerSize:(CGSize *)a4 footerSize:(CGSize *)a5 fixedLayoutAttributes:(id)a6 tileLayoutAttributes:(id)a7 floatingLayoutAttributes:(id)a8 type:(int64_t *)a9 forSection:(int64_t)a10 isJoined:(BOOL)a11
{
  id v17;
  id v18;
  int64_t v19;
  uint64_t v20;
  id v21;

  v21 = a6;
  v17 = a7;
  v18 = a8;
  v19 = -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection");
  if (v19 != 3 && v19)
  {
    LOBYTE(v20) = a11;
    -[CKFeedCollectionViewLayout _getSizeForHorizontalFlowDirection:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:](self, "_getSizeForHorizontalFlowDirection:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:", a3, a4, a5, v21, v17, v18, a9, a10, v20);
  }
  else
  {
    LOBYTE(v20) = a11;
    -[CKFeedCollectionViewLayout _getSizeForVerticalFlowDirection:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:](self, "_getSizeForVerticalFlowDirection:headerSize:footerSize:fixedLayoutAttributes:tileLayoutAttributes:floatingLayoutAttributes:type:forSection:isJoined:", a3, a4, a5, v21, v17, v18, a9, a10, v20);
  }

}

- (void)_getSizeForVerticalFlowDirection:(CGSize *)a3 headerSize:(CGSize *)a4 footerSize:(CGSize *)a5 fixedLayoutAttributes:(id)a6 tileLayoutAttributes:(id)a7 floatingLayoutAttributes:(id)a8 type:(int64_t *)a9 forSection:(int64_t)a10 isJoined:(BOOL)a11
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double width;
  double MaxX;
  CGSize *v36;
  double height;
  double MaxY;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  CGSize *v65;
  double v66;
  double v67;
  CGFloat v68;
  CKVerticalTiledLayoutGenerator *v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  double v82;
  double v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  CGFloat v96;
  double v97;
  double v98;
  CGSize *v99;
  double v100;
  double v101;
  void *v102;
  BOOL IsEmpty;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double MinY;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  CGSize *v119;
  double v120;
  void *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  CGSize *v133;
  double v134;
  double v135;
  CGSize *v136;
  id v137;
  id v138;
  CGSize *v139;
  CGSize *v140;
  CGSize *v141;
  id v142;
  CGFloat v143;
  double v144;
  CGFloat v145;
  double v148;
  int64_t v149;
  void *v150;
  double v151;
  double v152;
  id v153;
  double v154;
  CGFloat rect;
  double v156;
  __int128 v157;
  __int128 v158;
  uint64_t v159;
  double v160;
  double v161;
  uint64_t v162;
  double v163;
  double v164;
  double v165;
  _QWORD v166[4];
  id v167;
  id v168;
  double *v169;
  uint64_t *v170;
  double *v171;
  int64_t v172;
  double v173;
  double v174;
  double v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  _QWORD v181[4];
  id v182;
  id v183;
  CKFeedCollectionViewLayout *v184;
  int64_t v185;
  _QWORD v186[4];
  id v187;
  id v188;
  CKFeedCollectionViewLayout *v189;
  int64_t v190;
  _QWORD v191[4];
  id v192;
  id v193;
  CKFeedCollectionViewLayout *v194;
  int64_t v195;
  _QWORD v196[4];
  id v197;
  id v198;
  CKFeedCollectionViewLayout *v199;
  int64_t v200;
  _QWORD v201[4];
  id v202;
  id v203;
  CKFeedCollectionViewLayout *v204;
  int64_t v205;
  uint64_t v206;
  CGSize *v207;
  uint64_t v208;
  void *v209;
  __int128 v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;

  v153 = a6;
  v15 = a7;
  v16 = a8;
  -[CKFeedCollectionViewLayout collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFeedCollectionViewLayout _delegate](self, "_delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v206 = 0;
  v207 = (CGSize *)&v206;
  v208 = 0x3010000000;
  v209 = &unk_18E8EEE6F;
  v210 = *MEMORY[0x1E0C9D820];
  v21 = *MEMORY[0x1E0C9D820];
  v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v22 = *MEMORY[0x1E0C9D538];
  v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v150 = v17;
  if (!a11 && (objc_msgSend(v18, "collectionView:layout:shouldHideHeaderInSection:", v17, self, a10) & 1) == 0)
  {
    -[CKFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
    v25 = v24;
    -[CKFeedCollectionViewLayout sectionsJoinedWithSection:](self, "sectionsJoinedWithSection:", a10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "collectionView:layout:sizeForHeaderOfSections:proposedSize:", v17, self, v26, v25, 0.0);
    v20 = v27;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindSectionHeader"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
    v21 = v30;
    objc_msgSend(v29, "setFrame:", v22, v23, v30, v20);
    objc_msgSend(v29, "setZIndex:", 4);
    if (-[CKFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders"))
    {
      objc_msgSend(v16, "addObject:", v29);
      -[CKFeedCollectionViewLayout sectionHeaderBackgroundHeight](self, "sectionHeaderBackgroundHeight");
      v32 = v31;
      if (v31 > 0.0)
      {
        v139 = a5;
        objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindSectionHeaderBackground"), v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setFrame:", v22, v23, v21, v32);
        objc_msgSend(v33, "setZIndex:", 3);
        objc_msgSend(v16, "addObject:", v33);

        a5 = v139;
      }
    }
    else
    {
      objc_msgSend(v153, "addObject:", v29);
    }
    width = v207[2].width;
    v211.origin.x = v22;
    v211.origin.y = v23;
    v211.size.width = v21;
    v211.size.height = v20;
    MaxX = CGRectGetMaxX(v211);
    if (width >= MaxX)
      MaxX = width;
    v36 = v207;
    v207[2].width = MaxX;
    height = v36[2].height;
    v212.origin.x = v22;
    v212.origin.y = v23;
    v212.size.width = v21;
    v212.size.height = v20;
    MaxY = CGRectGetMaxY(v212);
    if (height >= MaxY)
      MaxY = height;
    v207[2].height = MaxY;
    v213.origin.x = v22;
    v213.origin.y = v23;
    v213.size.width = v21;
    v213.size.height = v20;
    v23 = CGRectGetMaxY(v213);

    v17 = v150;
  }
  objc_msgSend(v19, "collectionView:layout:contentInsetsForSection:", v17, self, a10);
  v144 = v39;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  -[CKFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
  v47 = v46;
  v149 = objc_msgSend(v19, "collectionView:layout:typeForSection:", v17, self, a10);
  v143 = v21;
  v145 = v20;
  -[CKFeedCollectionViewLayout feedDatasource](self, "feedDatasource");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "numberOfItemsInSection:forFeedLayout:", a10, self);
  v50 = v22 + v43;
  v51 = v23 + v41;
  v52 = v47 - (v43 + v45);

  if ((unint64_t)(v149 - 1) >= 2)
  {
    if (v149)
    {
      v49 = 0;
    }
    else
    {
      v138 = v16;
      v141 = a5;
      v69 = objc_alloc_init(CKVerticalTiledLayoutGenerator);
      -[CKTiledLayoutGenerator setTileCount:](v69, "setTileCount:", v49);
      v70 = MEMORY[0x1E0C809B0];
      v201[0] = MEMORY[0x1E0C809B0];
      v201[1] = 3221225472;
      v201[2] = __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke;
      v201[3] = &unk_1E274F220;
      v205 = a10;
      v71 = v19;
      v202 = v71;
      v72 = v150;
      v203 = v72;
      v204 = self;
      -[CKTiledLayoutGenerator setTileImageSizeBlock:](v69, "setTileImageSizeBlock:", v201);
      v196[0] = v70;
      v196[1] = 3221225472;
      v196[2] = __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_2;
      v196[3] = &unk_1E274F220;
      v200 = a10;
      v73 = v71;
      v197 = v73;
      v74 = v72;
      v198 = v74;
      v199 = self;
      -[CKTiledLayoutGenerator setTileMinimumSizeBlock:](v69, "setTileMinimumSizeBlock:", v196);
      v191[0] = v70;
      v191[1] = 3221225472;
      v191[2] = __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_3;
      v191[3] = &unk_1E274F248;
      v195 = a10;
      v75 = v73;
      v192 = v75;
      v76 = v74;
      v193 = v76;
      v194 = self;
      -[CKTiledLayoutGenerator setTileHasCaptionBlock:](v69, "setTileHasCaptionBlock:", v191);
      v186[0] = v70;
      v186[1] = 3221225472;
      v186[2] = __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_4;
      v186[3] = &unk_1E274F270;
      v190 = a10;
      v77 = v75;
      v187 = v77;
      v78 = v76;
      v188 = v78;
      v189 = self;
      -[CKTiledLayoutGenerator setTileCaptionSizeBlock:](v69, "setTileCaptionSizeBlock:", v186);
      v181[0] = v70;
      v181[1] = 3221225472;
      v181[2] = __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_5;
      v181[3] = &unk_1E274F298;
      v185 = a10;
      v79 = v77;
      v182 = v79;
      v80 = v78;
      v183 = v80;
      v184 = self;
      -[CKTiledLayoutGenerator setTileBatchIDBlock:](v69, "setTileBatchIDBlock:", v181);
      -[CKFeedCollectionViewLayout interTileSpacing](self, "interTileSpacing");
      -[CKTiledLayoutGenerator setInterTileSpacing:](v69, "setInterTileSpacing:");
      -[CKFeedCollectionViewLayout captionPadding](self, "captionPadding");
      -[CKTiledLayoutGenerator setCaptionPadding:](v69, "setCaptionPadding:");
      -[CKFeedCollectionViewLayout noCaptionSpacing](self, "noCaptionSpacing");
      -[CKTiledLayoutGenerator setNoCaptionSpacing:](v69, "setNoCaptionSpacing:");
      -[CKVerticalTiledLayoutGenerator setShouldDisplayCaptionsBelowBatches:](v69, "setShouldDisplayCaptionsBelowBatches:", -[CKFeedCollectionViewLayout shouldDisplayCaptionsBelowBatches](self, "shouldDisplayCaptionsBelowBatches"));
      -[CKVerticalTiledLayoutGenerator setReferenceWidth:](v69, "setReferenceWidth:", v52);
      -[CKTiledLayoutGenerator setNumberOfMagneticGuidelines:](v69, "setNumberOfMagneticGuidelines:", 5);
      -[CKTiledLayoutGenerator setRoundingScale:](v69, "setRoundingScale:", 1.0);
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "scale");
      v83 = v82;

      v160 = 0.0;
      v161 = COERCE_DOUBLE(&v160);
      v162 = 0x2020000000;
      LOBYTE(v163) = 0;
      v156 = 0.0;
      *(_QWORD *)&v157 = &v156;
      *((_QWORD *)&v157 + 1) = 0x2020000000;
      *(_QWORD *)&v158 = -1;
      v179 = 0;
      v180 = 0;
      objc_msgSend(v79, "collectionView:layout:referenceMaximumLength:minimumNumberOfTilesToOmit:forSection:", v80, self, &v180, &v179, a10);
      v166[0] = v70;
      v166[1] = 3221225472;
      v166[2] = __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_6;
      v166[3] = &unk_1E274F2C0;
      v172 = a10;
      v84 = v15;
      v167 = v84;
      v169 = &v160;
      v173 = v83;
      v174 = v50;
      v175 = v51;
      v168 = v153;
      v170 = &v206;
      v171 = &v156;
      v176 = v180;
      v177 = v49;
      v178 = v179;
      -[CKTiledLayoutGenerator enumerateFramesWithBlock:](v69, "enumerateFramesWithBlock:", v166);
      v85 = *(_QWORD *)(v157 + 24);
      if (*(_BYTE *)(*(_QWORD *)&v161 + 24))
        objc_msgSend(v84, "sortUsingComparator:", &__block_literal_global_57);
      v49 += ~v85;
      v207[2].height = round(v83 * v207[2].height) / v83;

      _Block_object_dispose(&v156, 8);
      _Block_object_dispose(&v160, 8);

      a5 = v141;
      v16 = v138;
      v17 = v150;
    }
  }
  else
  {
    v54 = *MEMORY[0x1E0C9D648];
    v53 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    rect = v53;
    if (v149 == 2)
    {
      objc_msgSend(v19, "collectionView:layout:sizeForThumbnailInSection:", v17, self, a10);
      v214.size.width = v55;
      v57 = v56;
      v214.origin.x = v54;
      v214.origin.y = rect;
      v58 = v214.size.width;
      v214.size.height = v57;
      v53 = CGRectGetWidth(v214);
      if (!v49)
        goto LABEL_59;
      v59 = v53;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a10);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindThumbnail"), v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = v50 + v52 - v59;
      objc_msgSend(v61, "setFrame:");
      objc_msgSend(v61, "setZIndex:", -1);
      if (-[CKFeedCollectionViewLayout shouldFloatThumbnails](self, "shouldFloatThumbnails"))
        v62 = v16;
      else
        v62 = v153;
      objc_msgSend(v62, "addObject:", v61);
      v63 = v207[2].width;
      v215.origin.x = v154;
      v215.origin.y = v51;
      v215.size.width = v58;
      v215.size.height = v57;
      v64 = CGRectGetMaxX(v215);
      v137 = v16;
      if (v63 >= v64)
        v64 = v63;
      v65 = v207;
      v207[2].width = v64;
      v66 = v65[2].height;
      v216.origin.x = v154;
      v216.origin.y = v51;
      v216.size.width = v58;
      v216.size.height = v57;
      v67 = CGRectGetMaxY(v216);
      v140 = a5;
      v142 = v15;
      if (v66 >= v67)
        v67 = v66;
      v207[2].height = v67;

      rect = v51;
      v17 = v150;
      v68 = v58;
    }
    else
    {
      if (!v49)
        goto LABEL_59;
      v154 = *MEMORY[0x1E0C9D648];
      v137 = v16;
      v140 = a5;
      v142 = v15;
      v68 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v57 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    v86 = 0;
    v151 = v57;
    v152 = v68;
    v148 = v52;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v86, a10);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      if (v86)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v86 - 1, a10);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v156 = v52;
          v157 = 0u;
          v158 = 0u;
          v159 = 0;
          objc_msgSend(v19, "collectionView:layout:metricsForSeparatorBetweenRowAtIndexPath:andRowAtIndexPath:proposedMetrics:", v17, self, v88, v87, &v156);
          v89 = v161;
          if (v161 <= 0.0)
          {
            if (v161 < 0.0)
              v51 = v51 + v161;
          }
          else
          {
            v90 = v160;
            v92 = *(double *)&v162;
            v91 = v163;
            v94 = v164;
            v93 = v165;
            objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindSeparator"), v87);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "setFrame:", v50 + v91, v51 + v92, v90 - (v91 + v93), v89 - (v92 + v94));
            objc_msgSend(v153, "addObject:", v95);
            v217.origin.x = v50;
            v217.origin.y = v51;
            v217.size.width = v90;
            v217.size.height = v89;
            v96 = CGRectGetMaxY(v217);
            v97 = v207[2].width;
            v218.origin.x = v50;
            v218.origin.y = v51;
            v218.size.width = v90;
            v218.size.height = v89;
            v98 = CGRectGetMaxX(v218);
            v52 = v148;
            v57 = v151;
            if (v97 >= v98)
              v98 = v97;
            v99 = v207;
            v207[2].width = v98;
            v100 = v99[2].height;
            v219.origin.x = v50;
            v219.origin.y = v51;
            v219.size.width = v90;
            v219.size.height = v89;
            v101 = CGRectGetMaxY(v219);
            if (v100 >= v101)
              v101 = v100;
            v207[2].height = v101;

            v51 = v96;
            v17 = v150;
            v68 = v152;
          }
        }

      }
      objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForCellWithIndexPath:", v87);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v220.origin.x = v154;
      v220.origin.y = rect;
      v220.size.width = v68;
      v220.size.height = v57;
      IsEmpty = CGRectIsEmpty(v220);
      v104 = v52;
      if (!IsEmpty)
      {
        v221.origin.x = v154;
        v221.origin.y = rect;
        v221.size.width = v68;
        v221.size.height = v57;
        v105 = CGRectGetWidth(v221);
        -[CKFeedCollectionViewLayout thumbnailSpacing](self, "thumbnailSpacing");
        v104 = v52 - (v105 + v106);
      }
      objc_msgSend(v19, "collectionView:layout:sizeForRowAtIndexPath:proposedSize:", v17, self, v87, v104, 0.0);
      v108 = v107;
      v110 = v109;
      if (v49 == 1)
      {
        v222.origin.x = v50;
        v222.origin.y = v51;
        v222.size.width = v108;
        v222.size.height = v110;
        MinY = CGRectGetMinY(v222);
        v223.origin.x = v154;
        v223.origin.y = rect;
        v223.size.width = v68;
        v223.size.height = v57;
        v112 = CGRectGetHeight(v223);
        v224.origin.x = v50;
        v224.origin.y = v51;
        v224.size.width = v108;
        v224.size.height = v110;
        v113 = CGRectGetHeight(v224);
        if (CKMainScreenScale_once_25 != -1)
          dispatch_once(&CKMainScreenScale_once_25, &__block_literal_global_485_0);
        v114 = *(double *)&CKMainScreenScale_sMainScreenScale_25;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_25 == 0.0)
          v114 = 1.0;
        v115 = round((v112 - v113) * 0.5 * v114) / v114;
        if (MinY >= v115)
          v51 = MinY;
        else
          v51 = v115;
        v57 = v151;
      }
      objc_msgSend(v102, "setFrame:", v50, v51, v108, v110);
      objc_msgSend(v153, "addObject:", v102);
      v225.origin.x = v50;
      v225.origin.y = v51;
      v225.size.width = v108;
      v225.size.height = v110;
      v116 = CGRectGetMaxY(v225);
      v117 = v207[2].width;
      v226.origin.x = v50;
      v226.origin.y = v51;
      v226.size.width = v108;
      v226.size.height = v110;
      v118 = CGRectGetMaxX(v226);
      if (v117 >= v118)
        v118 = v117;
      v119 = v207;
      v120 = v207[2].height;
      if (v120 < v116)
        v120 = v116;
      v207[2].width = v118;
      v119[2].height = v120;

      ++v86;
      v51 = v116;
      v68 = v152;
    }
    while (v49 != v86);
    v49 = 0;
    a5 = v140;
    v15 = v142;
    v16 = v137;
  }
LABEL_59:
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a10, v53);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "setNumberOfTilesOmitted:", v49);
  objc_msgSend(v19, "collectionView:layout:sizeForFooterInSection:proposedSize:", v17, self, a10, v52, 0.0);
  v123 = v122;
  v125 = v124;
  if (v124 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a10);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindSectionFooter"), v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
    v129 = v128 - v123;
    v130 = v207[2].height;
    objc_msgSend(v127, "setFrame:", v128 - v123, v130, v123, v125);
    objc_msgSend(v153, "addObject:", v127);
    v131 = v207[2].width;
    v227.origin.x = v129;
    v227.origin.y = v130;
    v227.size.width = v123;
    v227.size.height = v125;
    v132 = CGRectGetMaxX(v227);
    if (v131 >= v132)
      v132 = v131;
    v133 = v207;
    v207[2].width = v132;
    v134 = v133[2].height;
    v228.origin.x = v129;
    v228.origin.y = v130;
    v228.size.width = v123;
    v228.size.height = v125;
    v135 = CGRectGetMaxY(v228);
    if (v134 >= v135)
      v135 = v134;
    v207[2].height = v135;

    v17 = v150;
  }
  v136 = v207;
  v207[2].height = v144 + v207[2].height;
  if (a3)
    *a3 = v136[2];
  if (a4)
  {
    a4->width = v143;
    a4->height = v145;
  }
  if (a5)
  {
    a5->width = v123;
    a5->height = v125;
  }
  if (a9)
    *a9 = v149;

  _Block_object_dispose(&v206, 8);
}

double __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:imageSizeForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v5 = v4;

  return v5;
}

double __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:mininumSizeForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v5 = v4;

  return v5;
}

uint64_t __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:shouldShowCaptionForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);

  return v4;
}

double __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_4(uint64_t a1, uint64_t a2, double a3, double a4)
{
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:captionSizeForTileAtIndexPath:proposedSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7, a3, a4);
  v9 = v8;

  return v9;
}

id __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:batchIDForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v16;
  void *v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v22;
  double MaxX;
  double v24;
  double MaxY;
  uint64_t v26;
  uint64_t v27;
  double v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 72));
  v16 = objc_claimAutoreleasedReturnValue();
  v29 = (id)v16;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindCaption"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    a6 = round(a6 * *(double *)(a1 + 80)) / *(double *)(a1 + 80);
  }
  else if (a3)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForCellWithIndexPath:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "count") != a2)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
  }
  v30.origin.x = a5;
  v30.origin.y = a6;
  v30.size.width = a7;
  v30.size.height = a8;
  v31 = CGRectOffset(v30, *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96));
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  objc_msgSend(v17, "setFrame:");
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
  v22 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MaxX = CGRectGetMaxX(v32);
  if (v22 >= MaxX)
    MaxX = v22;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = MaxX;
  v24 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MaxY = CGRectGetMaxY(v33);
  if (v24 >= MaxY)
    MaxY = v24;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = MaxY;
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v27 = *(_QWORD *)(v26 + 24);
  if (v27 <= a2)
    v27 = a2;
  *(_QWORD *)(v26 + 24) = v27;
  v28 = *(double *)(a1 + 104);
  if (v28 > 0.0
    && *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) > v28
    && *(_QWORD *)(a1 + 112) + ~a2 >= *(_QWORD *)(a1 + 120))
  {
    *a4 = 1;
  }

}

uint64_t __178__CKFeedCollectionViewLayout__getSizeForVerticalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_getSizeForHorizontalFlowDirection:(CGSize *)a3 headerSize:(CGSize *)a4 footerSize:(CGSize *)a5 fixedLayoutAttributes:(id)a6 tileLayoutAttributes:(id)a7 floatingLayoutAttributes:(id)a8 type:(int64_t *)a9 forSection:(int64_t)a10 isJoined:(BOOL)a11
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  double v31;
  unint64_t v32;
  uint64_t v33;
  CKHorizontalTiledLayoutGenerator *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  id v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double width;
  _BOOL4 v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double MaxX;
  CGSize *v72;
  double height;
  double MaxY;
  _BOOL4 v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  void *v83;
  _BOOL4 v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  unint64_t v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  CGSize *v97;
  double v98;
  void *v99;
  double v100;
  int64_t v101;
  double v102;
  id v106;
  _QWORD v107[4];
  id v108;
  id v109;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t *v112;
  int64_t v113;
  double v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  char v128;
  _QWORD v129[4];
  id v130;
  id v131;
  CKFeedCollectionViewLayout *v132;
  int64_t v133;
  _QWORD v134[4];
  id v135;
  id v136;
  CKFeedCollectionViewLayout *v137;
  int64_t v138;
  _QWORD v139[4];
  id v140;
  id v141;
  CKFeedCollectionViewLayout *v142;
  int64_t v143;
  _QWORD v144[4];
  id v145;
  id v146;
  CKFeedCollectionViewLayout *v147;
  int64_t v148;
  uint64_t v149;
  CGSize *v150;
  uint64_t v151;
  void *v152;
  __int128 v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;

  v14 = a6;
  v15 = a7;
  v106 = a8;
  -[CKFeedCollectionViewLayout collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFeedCollectionViewLayout _delegate](self, "_delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = 0;
  v150 = (CGSize *)&v149;
  v151 = 0x3010000000;
  v152 = &unk_18E8EEE6F;
  v153 = *MEMORY[0x1E0C9D820];
  objc_msgSend(v17, "collectionView:layout:contentInsetsForSection:", v16, self, a10);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[CKFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
  v27 = v26;
  v28 = objc_msgSend(v17, "collectionView:layout:typeForSection:", v16, self, a10);
  -[CKFeedCollectionViewLayout feedDatasource](self, "feedDatasource");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "numberOfItemsInSection:forFeedLayout:", a10, self);
  v31 = *MEMORY[0x1E0C9D538] + v21;

  v32 = 0x1E0CEA000;
  v101 = v28;
  if (v28)
  {
    v33 = 0;
  }
  else
  {
    v99 = v15;
    v34 = objc_alloc_init(CKHorizontalTiledLayoutGenerator);
    -[CKTiledLayoutGenerator setTileCount:](v34, "setTileCount:", v30);
    v144[0] = MEMORY[0x1E0C809B0];
    v144[1] = 3221225472;
    v144[2] = __180__CKFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke;
    v144[3] = &unk_1E274F220;
    v148 = a10;
    v35 = v17;
    v145 = v35;
    v36 = v16;
    v146 = v36;
    v147 = self;
    -[CKTiledLayoutGenerator setTileImageSizeBlock:](v34, "setTileImageSizeBlock:", v144);
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = __180__CKFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_2;
    v139[3] = &unk_1E274F220;
    v143 = a10;
    v37 = v35;
    v140 = v37;
    v38 = v36;
    v141 = v38;
    v142 = self;
    -[CKTiledLayoutGenerator setTileMinimumSizeBlock:](v34, "setTileMinimumSizeBlock:", v139);
    v134[0] = MEMORY[0x1E0C809B0];
    v134[1] = 3221225472;
    v134[2] = __180__CKFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_3;
    v134[3] = &unk_1E274F248;
    v138 = a10;
    v39 = v37;
    v135 = v39;
    v40 = v38;
    v136 = v40;
    v137 = self;
    -[CKTiledLayoutGenerator setTileHasCaptionBlock:](v34, "setTileHasCaptionBlock:", v134);
    v129[0] = MEMORY[0x1E0C809B0];
    v129[1] = 3221225472;
    v129[2] = __180__CKFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_4;
    v129[3] = &unk_1E274F270;
    v133 = a10;
    v41 = v39;
    v130 = v41;
    v42 = v40;
    v131 = v42;
    v132 = self;
    -[CKTiledLayoutGenerator setTileCaptionSizeBlock:](v34, "setTileCaptionSizeBlock:", v129);
    -[CKFeedCollectionViewLayout interTileSpacing](self, "interTileSpacing");
    -[CKTiledLayoutGenerator setInterTileSpacing:](v34, "setInterTileSpacing:");
    -[CKFeedCollectionViewLayout captionPadding](self, "captionPadding");
    -[CKTiledLayoutGenerator setCaptionPadding:](v34, "setCaptionPadding:");
    -[CKFeedCollectionViewLayout noCaptionSpacing](self, "noCaptionSpacing");
    -[CKTiledLayoutGenerator setNoCaptionSpacing:](v34, "setNoCaptionSpacing:");
    -[CKHorizontalTiledLayoutGenerator setReferenceHeight:](v34, "setReferenceHeight:", v27 - (v19 + v23));
    -[CKTiledLayoutGenerator setNumberOfMagneticGuidelines:](v34, "setNumberOfMagneticGuidelines:", 5);
    -[CKTiledLayoutGenerator setRoundingScale:](v34, "setRoundingScale:", 1.0);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "scale");
    v45 = v44;

    v125 = 0;
    v126 = &v125;
    v127 = 0x2020000000;
    v128 = 0;
    v121 = 0;
    v122 = &v121;
    v123 = 0x2020000000;
    v124 = -1;
    v119 = 0;
    v120 = 0;
    objc_msgSend(v41, "collectionView:layout:referenceMaximumLength:minimumNumberOfTilesToOmit:forSection:", v42, self, &v120, &v119, a10);
    v46 = *(double *)(MEMORY[0x1E0C9D538] + 8) + v19;
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = __180__CKFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_5;
    v107[3] = &unk_1E274F308;
    v113 = a10;
    v47 = v99;
    v108 = v47;
    v110 = &v125;
    v114 = v31;
    v115 = v46;
    v109 = v14;
    v111 = &v149;
    v112 = &v121;
    v116 = v120;
    v117 = v30;
    v118 = v119;
    -[CKTiledLayoutGenerator enumerateFramesWithBlock:](v34, "enumerateFramesWithBlock:", v107);
    v48 = v122[3];
    if (*((_BYTE *)v126 + 24))
      objc_msgSend(v47, "sortUsingComparator:", &__block_literal_global_237_0);
    v33 = v30 + ~v48;
    v150[2].width = round(v45 * v150[2].width) / v45;

    _Block_object_dispose(&v121, 8);
    _Block_object_dispose(&v125, 8);

    v15 = v99;
    v32 = 0x1E0CEA000uLL;
  }
  v102 = v25;
  -[NSMutableArray objectAtIndex:](self->_sectionLayoutInfos, "objectAtIndex:", a10);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setNumberOfTilesOmitted:", v33);
  v50 = *MEMORY[0x1E0C9D820];
  v51 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a11)
  {
    v52 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v53 = *MEMORY[0x1E0C9D820];
  }
  else
  {
    -[CKFeedCollectionViewLayout sectionReferenceSize](self, "sectionReferenceSize");
    v55 = v54;
    v57 = v56;
    objc_msgSend(v17, "collectionView:layout:sizeForFooterInSection:proposedSize:", v16, self, a10);
    v53 = v58;
    v52 = v59;
    if (v58 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a10);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v55;
      objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindSectionFooter"), v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v50;
      width = v150[2].width;
      v63 = -[CKFeedCollectionViewLayout shouldDisplaySectionHeadersBelowSections](self, "shouldDisplaySectionHeadersBelowSections");
      v64 = v31 + width - v53;
      v65 = 0.0;
      if (!v63)
        v65 = v52;
      v66 = v57 - v65;
      objc_msgSend(v61, "setFrame:", v64, v57 - v65, v53, v52);
      if (-[CKFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders"))
        v67 = v106;
      else
        v67 = v14;
      objc_msgSend(v67, "addObject:", v61);
      v68 = v57;
      v69 = v31;
      v70 = v150[2].width;
      v154.origin.x = v64;
      v154.origin.y = v66;
      v154.size.width = v53;
      v154.size.height = v52;
      MaxX = CGRectGetMaxX(v154);
      if (v70 >= MaxX)
        MaxX = v70;
      v72 = v150;
      v150[2].width = MaxX;
      height = v72[2].height;
      v155.origin.x = v64;
      v155.origin.y = v66;
      v155.size.width = v53;
      v155.size.height = v52;
      MaxY = CGRectGetMaxY(v155);
      if (height >= MaxY)
        MaxY = height;
      v150[2].height = MaxY;

      v31 = v69;
      v57 = v68;
      v50 = v98;
      v55 = v100;
    }
    if ((objc_msgSend(v17, "collectionView:layout:shouldHideHeaderInSection:", v16, self, a10) & 1) == 0)
    {
      v75 = -[CKFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders");
      -[CKFeedCollectionViewLayout sectionsJoinedWithSection:](self, "sectionsJoinedWithSection:", a10);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 1.79769313e308;
      if (!v75)
        v77 = v55;
      objc_msgSend(v17, "collectionView:layout:sizeForHeaderOfSections:proposedSize:", v16, self, v76, v77, v57);
      v50 = v78;
      v51 = v79;
      v80 = v57;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a10);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v31;
      objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindSectionHeader"), v81);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = -[CKFeedCollectionViewLayout shouldDisplaySectionHeadersBelowSections](self, "shouldDisplaySectionHeadersBelowSections");
      v85 = 0.0;
      if (!v84)
        v85 = v51;
      v86 = v80 - v85;
      objc_msgSend(v83, "setFrame:", v82, v80 - v85, v50, v51);
      objc_msgSend(v83, "setZIndex:", 3);
      if (-[CKFeedCollectionViewLayout shouldFloatSectionHeaders](self, "shouldFloatSectionHeaders"))
        v87 = v106;
      else
        v87 = v14;
      objc_msgSend(v87, "addObject:", v83);
      v88 = v150[2].height;
      v156.origin.x = v82;
      v156.origin.y = v86;
      v156.size.width = v50;
      v156.size.height = v51;
      v89 = CGRectGetMaxY(v156);
      if (v88 >= v89)
        v89 = v88;
      v150[2].height = v89;
      -[CKFeedCollectionViewLayout sectionHeaderBackgroundHeight](self, "sectionHeaderBackgroundHeight");
      v91 = v90;
      if (v90 > 0.0)
      {
        v92 = v32;
        objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindSectionHeaderBackground"), v81);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v157.origin.x = v82;
        v157.origin.y = v86;
        v157.size.width = v50;
        v157.size.height = v51;
        objc_msgSend(v93, "setFrame:", v82, CGRectGetMaxY(v157) - v91, v150[2].width, v91);
        objc_msgSend(v93, "setZIndex:", 2);
        objc_msgSend(v106, "addObject:", v93);

        v32 = v92;
      }

    }
  }
  v150[2].width = v102 + v150[2].width;
  objc_msgSend(*(id *)(v32 + 2384), "mainScreen");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "scale");
  v96 = v95;

  v97 = v150 + 2;
  v150[2].width = round(v96 * v150[2].width) / v96;
  if (a3)
    *a3 = *v97;
  if (a4)
  {
    a4->width = v50;
    a4->height = v51;
  }
  if (a5)
  {
    a5->width = v53;
    a5->height = v52;
  }
  if (a9)
    *a9 = v101;

  _Block_object_dispose(&v149, 8);
}

double __180__CKFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:imageSizeForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v5 = v4;

  return v5;
}

double __180__CKFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:mininumSizeForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v5 = v4;

  return v5;
}

uint64_t __180__CKFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:shouldShowCaptionForTileAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);

  return v4;
}

double __180__CKFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_4(uint64_t a1, uint64_t a2, double a3, double a4)
{
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:captionSizeForTileAtIndexPath:proposedSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7, a3, a4);
  v9 = v8;

  return v9;
}

void __180__CKFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v16;
  void *v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v22;
  double MaxX;
  double v24;
  double MaxY;
  uint64_t v26;
  uint64_t v27;
  double v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 72));
  v16 = objc_claimAutoreleasedReturnValue();
  v29 = (id)v16;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CKFeedCollectionElementKindCaption"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForCellWithIndexPath:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "count") != a2)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
  }
  v30.origin.x = a5;
  v30.origin.y = a6;
  v30.size.width = a7;
  v30.size.height = a8;
  v31 = CGRectOffset(v30, *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  objc_msgSend(v17, "setFrame:");
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
  v22 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MaxX = CGRectGetMaxX(v32);
  if (v22 >= MaxX)
    MaxX = v22;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = MaxX;
  v24 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MaxY = CGRectGetMaxY(v33);
  if (v24 >= MaxY)
    MaxY = v24;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = MaxY;
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v27 = *(_QWORD *)(v26 + 24);
  if (v27 <= a2)
    v27 = a2;
  *(_QWORD *)(v26 + 24) = v27;
  v28 = *(double *)(a1 + 96);
  if (v28 > 0.0
    && *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) > v28
    && *(_QWORD *)(a1 + 104) + ~a2 >= *(_QWORD *)(a1 + 112))
  {
    *a4 = 1;
  }

}

uint64_t __180__CKFeedCollectionViewLayout__getSizeForHorizontalFlowDirection_headerSize_footerSize_fixedLayoutAttributes_tileLayoutAttributes_floatingLayoutAttributes_type_forSection_isJoined___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)updateCollectionViewWithDeletedSections:(id)a3 insertedSections:(id)a4 updatedSections:(id)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  BOOL v11;
  char v12;
  BOOL v13;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  _BOOL8 v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v49;
  id v50;
  _QWORD v51[5];
  _QWORD v52[4];
  id v53;
  CKFeedCollectionViewLayout *v54;
  id v55;
  _QWORD v56[5];
  char v57;
  BOOL v58;
  _QWORD v59[5];
  _QWORD v60[5];
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  CKFeedCollectionViewLayout *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  CGRect *v69;
  uint64_t v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v8 = a3;
  v50 = a4;
  v49 = a5;
  -[CKFeedCollectionViewLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CKFeedCollectionViewLayout flowDirection](self, "flowDirection");
  if (v10)
    v11 = v10 == 3;
  else
    v11 = 1;
  v12 = v11;
  v13 = v10 < 2;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0x7FFFFFFFFFFFFFFFLL;
  v68 = 0;
  v69 = (CGRect *)&v68;
  v70 = 0x4010000000;
  v71 = &unk_18E8EEE6F;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v72 = *MEMORY[0x1E0C9D648];
  v73 = v14;
  objc_msgSend(v9, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v9, "contentInset");
  v24 = v16 + v23;
  v26 = v18 + v25;
  v28 = v20 - (v23 + v27);
  v30 = v22 - (v25 + v29);
  v31 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke;
  v62[3] = &unk_1E274F350;
  v32 = v8;
  v63 = v32;
  v66 = &v74;
  v33 = v9;
  v67 = &v68;
  v64 = v33;
  v65 = self;
  -[CKFeedCollectionViewLayout _enumerateSectionsInRect:withBlock:](self, "_enumerateSectionsInRect:withBlock:", v62, v24, v26, v28, v30);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v60[0] = v31;
  v60[1] = 3221225472;
  v60[2] = __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_2;
  v60[3] = &unk_1E274E480;
  v60[4] = self;
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v61 = v34;
  objc_msgSend(v32, "enumerateIndexesUsingBlock:", v60);
  v59[0] = v31;
  v59[1] = 3221225472;
  v59[2] = __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_3;
  v59[3] = &unk_1E274F378;
  v59[4] = self;
  objc_msgSend(v32, "enumerateIndexesWithOptions:usingBlock:", 2, v59);
  v56[0] = v31;
  v56[1] = 3221225472;
  v56[2] = __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_4;
  v56[3] = &unk_1E274F3A0;
  v56[4] = self;
  v57 = v12;
  v58 = v13;
  objc_msgSend(v50, "enumerateIndexesUsingBlock:", v56);
  v35 = objc_msgSend(v32, "count") || objc_msgSend(v50, "count");
  v55 = 0;
  -[CKFeedCollectionViewLayout _updateGlobalLayoutInfoWithOptions:sectionsWithUpdatedGroupIDs:](self, "_updateGlobalLayoutInfoWithOptions:sectionsWithUpdatedGroupIDs:", v35, &v55);
  v36 = v55;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addIndexes:", v50);
  objc_msgSend(v37, "addIndexes:", v49);
  v52[0] = v31;
  v52[1] = 3221225472;
  v52[2] = __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_5;
  v52[3] = &unk_1E274E480;
  v38 = v34;
  v53 = v38;
  v54 = self;
  objc_msgSend(v37, "enumerateIndexesUsingBlock:", v52);
  objc_msgSend(v38, "addIndexes:", v36);
  v51[0] = v31;
  v51[1] = 3221225472;
  v51[2] = __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_6;
  v51[3] = &unk_1E274F378;
  v51[4] = self;
  objc_msgSend(v38, "enumerateIndexesUsingBlock:", v51);
  -[CKFeedCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  objc_msgSend(v33, "reloadData");
  if (v75[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "firstIndex");
    objc_msgSend(v33, "layoutIfNeeded");
    objc_msgSend(v33, "contentOffset");
    v42 = v41;
    v44 = v43;
    -[CKFeedCollectionViewLayout frameForSection:](self, "frameForSection:", v40);
    v79 = CGRectOffset(v78, -v42, -v44);
    x = v79.origin.x;
    y = v79.origin.y;
    width = v79.size.width;
    height = v79.size.height;
    CGRectGetMinX(v79);
    CGRectGetMinX(v69[1]);
    v80.origin.x = x;
    v80.origin.y = y;
    v80.size.width = width;
    v80.size.height = height;
    CGRectGetMinY(v80);
    CGRectGetMinY(v69[1]);

  }
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

}

void __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;

  if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2) & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    objc_msgSend(*(id *)(a1 + 40), "contentOffset");
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 48), "frameForSection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = CGRectOffset(v11, -v8, -v10);
    *a4 = 1;
  }
}

void __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "sectionsJoinedWithSection:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    objc_msgSend(*(id *)(a1 + 40), "addIndexes:", v3);

}

void __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectAtIndex:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(*(id *)(a1 + 32), "_sectionAtIndex:sizeDidChangeFrom:to:", a2, v4, v5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "removeObjectAtIndex:", a2);

}

void __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_4(uint64_t a1, unint64_t a2)
{
  double v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MaxY;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MaxX;
  CKFeedCollectionViewSectionLayoutInfo *v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v5 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "count");
  if (v6)
  {
    v7 = v6;
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
    if (v7 <= a2)
    {
      objc_msgSend(v8, "objectAtIndex:", a2 - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v11 = v20;
      v13 = v21;
      v15 = v22;
      v17 = v23;

      if (*(_BYTE *)(a1 + 40))
      {
        if (!*(_BYTE *)(a1 + 41))
          goto LABEL_5;
        goto LABEL_8;
      }
      if (!*(_BYTE *)(a1 + 41))
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndex:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;

      if (*(_BYTE *)(a1 + 40))
      {
        if (*(_BYTE *)(a1 + 41))
        {
LABEL_5:
          v26.origin.x = v11;
          v26.origin.y = v13;
          v26.size.width = v15;
          v26.size.height = v17;
          MaxY = CGRectGetMaxY(v26);
LABEL_9:
          v4 = MaxY;
          goto LABEL_15;
        }
LABEL_8:
        v27.origin.x = v11;
        v27.origin.y = v13;
        v27.size.width = v15;
        v27.size.height = v17;
        MaxY = CGRectGetMinY(v27);
        goto LABEL_9;
      }
      if (*(_BYTE *)(a1 + 41))
      {
LABEL_11:
        v28.origin.x = v11;
        v28.origin.y = v13;
        v28.size.width = v15;
        v28.size.height = v17;
        MaxX = CGRectGetMaxX(v28);
LABEL_14:
        v5 = MaxX;
        goto LABEL_15;
      }
    }
    v29.origin.x = v11;
    v29.origin.y = v13;
    v29.size.width = v15;
    v29.size.height = v17;
    MaxX = CGRectGetMinX(v29);
    goto LABEL_14;
  }
LABEL_15:
  v25 = objc_alloc_init(CKFeedCollectionViewSectionLayoutInfo);
  -[CKFeedCollectionViewSectionLayoutInfo setOrigin:](v25, "setOrigin:", v5, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "insertObject:atIndex:", v25, a2);

}

void __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
  objc_msgSend(*(id *)(a1 + 40), "sectionsJoinedWithSection:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "addIndexes:", v4);
    v4 = v5;
  }

}

uint64_t __103__CKFeedCollectionViewLayout_updateCollectionViewWithDeletedSections_insertedSections_updatedSections___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutInfoForSection:ignoreSizeChange:", a2, 0);
}

- (CKFeedCollectionViewLayoutDatasource)feedDatasource
{
  return (CKFeedCollectionViewLayoutDatasource *)objc_loadWeakRetained((id *)&self->_feedDatasource);
}

- (void)setFeedDatasource:(id)a3
{
  objc_storeWeak((id *)&self->_feedDatasource, a3);
}

- (unint64_t)compositeLayoutSection
{
  return self->_compositeLayoutSection;
}

- (void)setCompositeLayoutSection:(unint64_t)a3
{
  self->_compositeLayoutSection = a3;
}

- (int64_t)flowDirection
{
  return self->_flowDirection;
}

- (void)setFlowDirection:(int64_t)a3
{
  self->_flowDirection = a3;
}

- (CGSize)sectionReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_sectionReferenceSize.width;
  height = self->_sectionReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSectionReferenceSize:(CGSize)a3
{
  self->_sectionReferenceSize = a3;
}

- (CGSize)interTileSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interTileSpacing.width;
  height = self->_interTileSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInterTileSpacing:(CGSize)a3
{
  self->_interTileSpacing = a3;
}

- (UIEdgeInsets)captionPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_captionPadding.top;
  left = self->_captionPadding.left;
  bottom = self->_captionPadding.bottom;
  right = self->_captionPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCaptionPadding:(UIEdgeInsets)a3
{
  self->_captionPadding = a3;
}

- (CGSize)noCaptionSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_noCaptionSpacing.width;
  height = self->_noCaptionSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNoCaptionSpacing:(CGSize)a3
{
  self->_noCaptionSpacing = a3;
}

- (BOOL)shouldDisplayCaptionsBelowBatches
{
  return self->_shouldDisplayCaptionsBelowBatches;
}

- (void)setShouldDisplayCaptionsBelowBatches:(BOOL)a3
{
  self->_shouldDisplayCaptionsBelowBatches = a3;
}

- (BOOL)shouldDisplaySectionHeadersBelowSections
{
  return self->_shouldDisplaySectionHeadersBelowSections;
}

- (void)setShouldDisplaySectionHeadersBelowSections:(BOOL)a3
{
  self->_shouldDisplaySectionHeadersBelowSections = a3;
}

- (BOOL)shouldFloatThumbnails
{
  return self->_shouldFloatThumbnails;
}

- (void)setShouldFloatThumbnails:(BOOL)a3
{
  self->_shouldFloatThumbnails = a3;
}

- (double)thumbnailSpacing
{
  return self->_thumbnailSpacing;
}

- (void)setThumbnailSpacing:(double)a3
{
  self->_thumbnailSpacing = a3;
}

- (BOOL)shouldFloatSectionHeaders
{
  return self->_shouldFloatSectionHeaders;
}

- (void)setShouldFloatSectionHeaders:(BOOL)a3
{
  self->_shouldFloatSectionHeaders = a3;
}

- (double)sectionHeaderBackgroundHeight
{
  return self->_sectionHeaderBackgroundHeight;
}

- (void)setSectionHeaderBackgroundHeight:(double)a3
{
  self->_sectionHeaderBackgroundHeight = a3;
}

- (BOOL)shouldFloatWithEase
{
  return self->_shouldFloatWithEase;
}

- (void)setShouldFloatWithEase:(BOOL)a3
{
  self->_shouldFloatWithEase = a3;
}

- (BOOL)shouldFloatOverShortDistances
{
  return self->_shouldFloatOverShortDistances;
}

- (void)setShouldFloatOverShortDistances:(BOOL)a3
{
  self->_shouldFloatOverShortDistances = a3;
}

- (double)floatingBottomDecorationHeight
{
  return self->_floatingBottomDecorationHeight;
}

- (void)setFloatingBottomDecorationHeight:(double)a3
{
  self->_floatingBottomDecorationHeight = a3;
}

- (UIEdgeInsets)floatPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_floatPadding.top;
  left = self->_floatPadding.left;
  bottom = self->_floatPadding.bottom;
  right = self->_floatPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFloatPadding:(UIEdgeInsets)a3
{
  self->_floatPadding = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedDatasource);
  objc_storeStrong((id *)&self->_sectionLayoutInfos, 0);
}

@end
