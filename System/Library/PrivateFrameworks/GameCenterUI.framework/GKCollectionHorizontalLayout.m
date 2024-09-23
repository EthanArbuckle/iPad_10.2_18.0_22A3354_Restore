@implementation GKCollectionHorizontalLayout

- (void)applyDefaults
{
  -[UICollectionViewFlowLayout setScrollDirection:](self, "setScrollDirection:", 1);
  -[UICollectionViewFlowLayout setSectionInset:](self, "setSectionInset:", 8.0, 90.0, 0.0, 0.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self, "setMinimumInteritemSpacing:", 48.0);
  -[UICollectionViewFlowLayout setItemSize:](self, "setItemSize:", 548.0, 300.0);
  -[UICollectionViewFlowLayout setHeaderReferenceSize:](self, "setHeaderReferenceSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[GKCollectionFocusingLayout setFocusScaleFactor:](self, "setFocusScaleFactor:", 1.0);
  -[GKCollectionFocusingLayout setFocusHeaderOffset:](self, "setFocusHeaderOffset:", 24.0);
  self->_scrollStepIntegral = 0.0;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (double)maxHeaderHeight
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;

  -[GKCollectionHorizontalLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4 < 1)
    return 0.0;
  v5 = 0;
  v6 = 0.0;
  do
  {
    -[GKCollectionFocusingLayout sizeForHeaderInSection:](self, "sizeForHeaderInSection:", v5);
    if (v7 > v6)
      v6 = v7;
    ++v5;
  }
  while (v4 != v5);
  return v6;
}

- (void)prepareLayout
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
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
  double extraSectionHeaderToCellSpace;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  uint64_t i;
  void *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v47;
  void *v48;
  id v49;
  double v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[5];
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD aBlock[5];
  objc_super v68;

  -[GKCollectionHorizontalLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  if (v4 != 0.0)
  {
    v5 = v4;
    v68.receiver = self;
    v68.super_class = (Class)GKCollectionHorizontalLayout;
    -[GKCollectionFocusingLayout prepareLayout](&v68, sel_prepareLayout);
    v6 = objc_msgSend(v3, "numberOfSections");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v6);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionFocusingLayout sectionInset](self, "sectionInset");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[GKCollectionFocusingLayout topHeaderHeight](self, "topHeaderHeight");
    v15 = v9 + v14;
    -[GKCollectionHorizontalLayout maxHeaderHeight](self, "maxHeaderHeight");
    v17 = v15 + v16;
    extraSectionHeaderToCellSpace = self->_extraSectionHeaderToCellSpace;
    -[GKCollectionFocusingLayout topHeaderHeight](self, "topHeaderHeight");
    v56 = v6;
    if (v19 > 0.0)
    {
      v20 = (void *)MEMORY[0x1E0DC3628];
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("GKCollectionLayoutTopHeaderKind"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKCollectionFocusingLayout setTopHeaderAttributes:](self, "setTopHeaderAttributes:", v22);

      -[GKCollectionFocusingLayout topHeaderHeight](self, "topHeaderHeight");
      v24 = v23;
      -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setFrame:", 0.0, 0.0, v5, v24);

    }
    v26 = v17 + extraSectionHeaderToCellSpace;
    v27 = v17 + extraSectionHeaderToCellSpace;
    if (v6 >= 1)
    {
      v28 = 0;
      v29 = v5 - v11 - v13;
      v54 = *MEMORY[0x1E0DC48A8];
      v55 = v3;
      v30 = v11;
      v31 = v29;
      v27 = v26;
      do
      {
        v32 = objc_msgSend(v3, "numberOfItemsInSection:", v28);
        if (v32)
        {
          v33 = v32;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v28);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](self->_headerAttributes, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v35)
          {
            objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v54, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setZIndex:", 1024);
          }
          -[GKCollectionFocusingLayout sizeForHeaderInSection:](self, "sizeForHeaderInSection:", v28);
          objc_msgSend(v35, "setFrame:", v30, v15, v36, v37);
          objc_msgSend(v57, "setObject:forKeyedSubscript:", v35, v34);
          if (v33 >= 1)
          {
            for (i = 0; i != v33; ++i)
            {
              v39 = v34;
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, v28);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSDictionary objectForKeyedSubscript:](self->_itemAttributes, "objectForKeyedSubscript:", v34);
              v40 = objc_claimAutoreleasedReturnValue();

              v35 = (void *)v40;
              if (!v40)
              {
                objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
              }
              -[GKCollectionFocusingLayout sizeForItemAtIndexPath:](self, "sizeForItemAtIndexPath:", v34);
              v43 = v41;
              if (v42 > v27)
                v27 = v42;
              objc_msgSend(v35, "setFrame:", v30, v26, v41, v42);
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, v34);
              v44 = v30 + v43;
              -[GKCollectionFocusingLayout minimumInteritemSpacingForSectionAtIndex:](self, "minimumInteritemSpacingForSectionAtIndex:", v28);
              v30 = v44 + v45;
            }
            v31 = v44 - v11;
            v3 = v55;
            v6 = v56;
          }

        }
        ++v28;
      }
      while (v28 != v6);
      if (self->_centersItemsInExcessSpace && v31 < v29)
      {
        v47 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke;
        aBlock[3] = &__block_descriptor_40_e42_v16__0__UICollectionViewLayoutAttributes_8l;
        *(double *)&aBlock[4] = (v29 - (v11 + v31)) * 0.5;
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_2;
        v65[3] = &unk_1E59C47D0;
        v48 = _Block_copy(aBlock);
        v66 = v48;
        objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v65);
        v63[0] = v47;
        v63[1] = 3221225472;
        v63[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_3;
        v63[3] = &unk_1E59C47D0;
        v64 = v48;
        v49 = v48;
        objc_msgSend(v57, "enumerateKeysAndObjectsUsingBlock:", v63);

      }
    }
    if (!self->_alignItemsToTop)
    {
      objc_msgSend(v3, "frame");
      if (v26 < v50)
      {
        v51 = MEMORY[0x1E0C809B0];
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_4;
        v62[3] = &__block_descriptor_40_e42_v16__0__UICollectionViewLayoutAttributes_8l;
        *(double *)&v62[4] = (v50 - (v26 + v27)) * 0.5;
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_5;
        v60[3] = &unk_1E59C47D0;
        v52 = _Block_copy(v62);
        v61 = v52;
        objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v60);
        v58[0] = v51;
        v58[1] = 3221225472;
        v58[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_6;
        v58[3] = &unk_1E59C47D0;
        v59 = v52;
        v53 = v52;
        objc_msgSend(v57, "enumerateKeysAndObjectsUsingBlock:", v58);

      }
    }
    -[GKCollectionHorizontalLayout setHeaderAttributes:](self, "setHeaderAttributes:", v57);
    -[GKCollectionHorizontalLayout setItemAttributes:](self, "setItemAttributes:", v7);

  }
}

void __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:", *(double *)(a1 + 32) + v3);

}

uint64_t __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "frame");
  objc_msgSend(v2, "setFrame:");

}

uint64_t __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  NSDictionary *itemAttributes;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGRect v36;
  CGRect v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSDictionary count](self->_itemAttributes, "count") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  itemAttributes = self->_itemAttributes;
  v11 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __66__GKCollectionHorizontalLayout_layoutAttributesForElementsInRect___block_invoke;
  v29[3] = &unk_1E59C92D8;
  v32 = x;
  v33 = y;
  v34 = width;
  v35 = height;
  v29[4] = self;
  v12 = v8;
  v30 = v12;
  v13 = v9;
  v31 = v13;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](itemAttributes, "enumerateKeysAndObjectsUsingBlock:", v29);
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __66__GKCollectionHorizontalLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v27[3] = &unk_1E59C4820;
  v27[4] = self;
  v14 = v12;
  v28 = v14;
  objc_msgSend(v13, "enumerateIndexesUsingBlock:", v27);
  -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v37.origin.x = v18;
    v37.origin.y = v19;
    v37.size.width = v20;
    v37.size.height = v21;
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v22 = CGRectIntersectsRect(v36, v37);

    if (v22)
    {
      -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v23);

    }
  }
  v24 = v28;
  v25 = v14;

  return v25;
}

void __66__GKCollectionHorizontalLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  id v11;
  CGRect v12;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v5, "frame");
  v12.origin.x = v6;
  v12.origin.y = v7;
  v12.size.width = v8;
  v12.size.height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v12))
  {
    objc_msgSend(*(id *)(a1 + 32), "focusAdjustedAttributesForItemAttributes:", v5);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v11, "section"));
    v5 = (id)v10;
  }

}

void __66__GKCollectionHorizontalLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", *MEMORY[0x1E0DC48A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  if (v4 > 0.0)
  {
    objc_msgSend(v3, "frame");
    if (v5 > 0.0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_itemAttributes, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[GKCollectionFocusingLayout focusAdjustedAttributesForItemAttributes:](self, "focusAdjustedAttributesForItemAttributes:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);
  }

  return v7;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
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
  void *v36;
  double v37;
  void *v38;
  void *v40;
  id v41;
  CGRect v42;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("GKCollectionLayoutTopHeaderKind")))
    -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
  else
    -[NSDictionary objectForKeyedSubscript:](self->_headerAttributes, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[GKCollectionHorizontalLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentOffset");
    v11 = v10;
    objc_msgSend(v9, "contentInset");
    v13 = v12;
    v14 = objc_msgSend(v9, "numberOfSections");
    if (objc_msgSend(v7, "section") >= v14 - 1)
    {
      v16 = 0;
      v23 = INFINITY;
    }
    else
    {
      v40 = v9;
      v41 = v7;
      v15 = 0;
      v16 = 0;
      v17 = objc_msgSend(v7, "section") + 1;
      do
      {
        v18 = v16;
        v19 = v15;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[GKCollectionHorizontalLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 >= v14)
          break;
        objc_msgSend(v15, "frame");
        ++v17;
      }
      while (v20 == 0.0);
      objc_msgSend(v15, "frame");
      if (v21 <= 0.0)
      {

        v16 = 0;
        v23 = INFINITY;
      }
      else
      {
        objc_msgSend(v15, "frame");
        v23 = v22;
      }

      v9 = v40;
      v7 = v41;
    }
    objc_msgSend(v8, "frame");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[GKCollectionFocusingLayout sectionInset](self, "sectionInset");
    if (v13 + v11 + v33 >= v26)
      v34 = v13 + v11 + v33;
    else
      v34 = v26;
    v42.origin.x = v26;
    v42.origin.y = v28;
    v42.size.width = v30;
    v42.size.height = v32;
    v35 = v23 - CGRectGetWidth(v42);
    if (v16)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_headerAttributes, "objectForKeyedSubscript:", v16);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "frame");
      v35 = v35 - (v23 - v37);

    }
    if (v34 >= v35)
      v34 = v35;
    v38 = (void *)objc_msgSend(v8, "copy");

    objc_msgSend(v38, "setFrame:", v34, v28, v30, v32);
    -[GKCollectionFocusingLayout focusAdjustedAttributesForSupplementaryViewAttributes:](self, "focusAdjustedAttributesForSupplementaryViewAttributes:", v38);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAlpha:", 0.0);
  }

  return v24;
}

- (CGSize)collectionViewContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;
  CGRect v29;

  if (!-[NSDictionary count](self->_itemAttributes, "count"))
    -[GKCollectionHorizontalLayout prepareLayout](self, "prepareLayout");
  -[GKCollectionFocusingLayout sectionInset](self, "sectionInset");
  v4 = v3;
  v6 = v5;
  v7 = -[GKCollectionHorizontalLayout firstValidSection](self, "firstValidSection");
  if (v7 < 0)
  {
    v17 = *MEMORY[0x1E0C9D820];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_itemAttributes, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GKCollectionHorizontalLayout lastValidSection](self, "lastValidSection");
    -[GKCollectionHorizontalLayout collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "numberOfItemsInSection:", v10);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12 - 1, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSDictionary objectForKeyedSubscript:](self->_itemAttributes, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    MaxX = CGRectGetMaxX(v29);
    objc_msgSend(v9, "frame");
    v17 = MaxX - v16;

  }
  if (v6 <= 0.0)
    v18 = v4;
  else
    v18 = v6;
  v19 = v4 + v18 + v17;
  -[GKCollectionHorizontalLayout collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;

  if (v19 >= v22)
    v22 = v19;
  -[GKCollectionHorizontalLayout collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v24;

  v26 = v22;
  v27 = v25;
  result.height = v27;
  result.width = v26;
  return result;
}

- (int64_t)firstValidSection
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  -[GKCollectionHorizontalLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4 < 1)
    return -1;
  v5 = 0;
  while (1)
  {
    -[GKCollectionHorizontalLayout collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfItemsInSection:", v5);

    if (v7 > 0)
      break;
    if (v4 == ++v5)
      return -1;
  }
  return v5;
}

- (int64_t)lastValidSection
{
  void *v3;
  int64_t v4;
  void *v6;
  uint64_t v7;

  -[GKCollectionHorizontalLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  while (v4-- >= 1)
  {
    -[GKCollectionHorizontalLayout collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfItemsInSection:", v4);

    if (v7 >= 1)
      return v4;
  }
  return -1;
}

- (BOOL)centersItemsInExcessSpace
{
  return self->_centersItemsInExcessSpace;
}

- (void)setCentersItemsInExcessSpace:(BOOL)a3
{
  self->_centersItemsInExcessSpace = a3;
}

- (BOOL)alignItemsToTop
{
  return self->_alignItemsToTop;
}

- (void)setAlignItemsToTop:(BOOL)a3
{
  self->_alignItemsToTop = a3;
}

- (double)extraSectionHeaderToCellSpace
{
  return self->_extraSectionHeaderToCellSpace;
}

- (void)setExtraSectionHeaderToCellSpace:(double)a3
{
  self->_extraSectionHeaderToCellSpace = a3;
}

- (NSDictionary)itemAttributes
{
  return self->_itemAttributes;
}

- (void)setItemAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_itemAttributes, a3);
}

- (NSDictionary)headerAttributes
{
  return self->_headerAttributes;
}

- (void)setHeaderAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_headerAttributes, a3);
}

- (double)scrollStepIntegral
{
  return self->_scrollStepIntegral;
}

- (void)setScrollStepIntegral:(double)a3
{
  self->_scrollStepIntegral = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerAttributes, 0);
  objc_storeStrong((id *)&self->_itemAttributes, 0);
}

@end
