@implementation GKCollectionGridLayout

- (void)applyDefaults
{
  -[UICollectionViewFlowLayout setScrollDirection:](self, "setScrollDirection:", 0);
  -[UICollectionViewFlowLayout setSectionInset:](self, "setSectionInset:", 8.0, 0.0, 0.0, 0.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self, "setMinimumInteritemSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self, "setMinimumLineSpacing:", 12.0);
  -[UICollectionViewFlowLayout setItemSize:](self, "setItemSize:", 144.0, 70.0);
  -[UICollectionViewFlowLayout setHeaderReferenceSize:](self, "setHeaderReferenceSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[GKCollectionFocusingLayout setFocusScaleFactor:](self, "setFocusScaleFactor:", 1.0);
  -[GKCollectionGridLayout setAutoWidthColumns:](self, "setAutoWidthColumns:", 0);
  -[GKCollectionFocusingLayout setFocusHeaderOffset:](self, "setFocusHeaderOffset:", 0.0);
  -[GKCollectionGridLayout setShouldPerformInitialScrollToContentInsetTop:](self, "setShouldPerformInitialScrollToContentInsetTop:", 0);
  -[GKCollectionGridLayout setDidPerformInitialContentInsetScroll:](self, "setDidPerformInitialContentInsetScroll:", 0);
}

- (void)setAutoWidthColumns:(int64_t)a3
{
  if (self->_autoWidthColumns != a3)
  {
    self->_autoWidthColumns = a3;
    -[GKCollectionGridLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)prepareLayout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
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
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v40;
  double v41;
  double v42;
  double extraSectionHeaderToCellSpace;
  double v44;
  double v45;
  int64_t autoWidthColumns;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v69;
  uint64_t v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  void *v77;
  double v78;
  double v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD aBlock[5];
  objc_super v93;

  -[GKCollectionGridLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  if (v4 != 0.0)
  {
    v5 = v4;
    v93.receiver = self;
    v93.super_class = (Class)GKCollectionGridLayout;
    -[GKCollectionFocusingLayout prepareLayout](&v93, sel_prepareLayout);
    -[GKCollectionGridLayout collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentInset");
    v8 = v7;
    v10 = v9;
    v12 = v11;

    if (-[GKCollectionGridLayout shouldPerformInitialScrollToContentInsetTop](self, "shouldPerformInitialScrollToContentInsetTop")&& !-[GKCollectionGridLayout didPerformInitialContentInsetScroll](self, "didPerformInitialContentInsetScroll")&& v8 > 0.0)
    {
      objc_msgSend(v3, "contentOffset");
      objc_msgSend(v3, "setContentOffset:animated:", 0);
      -[GKCollectionGridLayout setDidPerformInitialContentInsetScroll:](self, "setDidPerformInitialContentInsetScroll:", 1);
    }
    v13 = objc_msgSend(v3, "numberOfSections");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v13);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v13;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v13);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionFocusingLayout sectionInset](self, "sectionInset");
    v78 = v16;
    v79 = v15;
    v18 = v17;
    v20 = v19;
    -[GKCollectionFocusingLayout topHeaderHeight](self, "topHeaderHeight");
    v22 = v21;
    v85 = v18;
    if (self->_sectionInsetRelativeWithContentInset)
      v23 = v5 - v18 - v20 - v10 - v12;
    else
      v23 = v5 - v18 - v20;
    -[GKCollectionFocusingLayout topHeaderHeight](self, "topHeaderHeight");
    if (v24 > 0.0)
    {
      v25 = (void *)MEMORY[0x1E0DC3628];
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("GKCollectionLayoutTopHeaderKind"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKCollectionFocusingLayout setTopHeaderAttributes:](self, "setTopHeaderAttributes:", v27);

      -[GKCollectionFocusingLayout topHeaderHeight](self, "topHeaderHeight");
      v29 = v28;
      -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFrame:", 0.0, 0.0, v5, v29);

    }
    if (v80 >= 1)
    {
      v31 = 0;
      v76 = *MEMORY[0x1E0DC48A8];
      v75 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v74 = *MEMORY[0x1E0DC48A0];
      v32 = v23;
      v77 = v3;
      while (1)
      {
        v33 = objc_msgSend(v3, "numberOfItemsInSection:", v31);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_headerAttributes, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v35)
        {
          objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v76, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setZIndex:", 1024);
        }
        v36 = v79 + v22;
        -[GKCollectionFocusingLayout sizeForHeaderInSection:](self, "sizeForHeaderInSection:", v31);
        if (v38 > 0.0 && v37 == 0.0)
          v40 = v23;
        else
          v40 = v37;
        objc_msgSend(v35, "setFrame:", v85, v36, v40, v38);
        objc_msgSend(v82, "setObject:forKeyedSubscript:", v35, v34);
        objc_msgSend(v35, "frame");
        v42 = v41;
        extraSectionHeaderToCellSpace = self->_extraSectionHeaderToCellSpace;
        -[GKCollectionFocusingLayout minimumInteritemSpacingForSectionAtIndex:](self, "minimumInteritemSpacingForSectionAtIndex:", v31);
        v45 = v44;
        autoWidthColumns = self->_autoWidthColumns;
        v84 = 0.0;
        if (autoWidthColumns >= 1)
          v84 = (v23 - v44 * (double)(autoWidthColumns - 1)) / (double)autoWidthColumns;
        v47 = v36 + v42 + extraSectionHeaderToCellSpace + 0.0;
        -[GKCollectionFocusingLayout minimumLineSpacingForSectionAtIndex:](self, "minimumLineSpacingForSectionAtIndex:", v31);
        v49 = v48;
        if (v33 >= 1)
          break;
        v58 = v48 + v75;
LABEL_40:
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v31);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        -[GKCollectionGridLayout footerAttributes](self, "footerAttributes");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v63)
        {
          objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v74, v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setZIndex:", 1024);
        }
        v64 = v58 + v47;
        -[GKCollectionFocusingLayout sizeForFooterInSection:](self, "sizeForFooterInSection:", v31);
        v67 = v66;
        if (v66 > 0.0 && v65 == 0.0)
          v69 = v23;
        else
          v69 = v65;
        objc_msgSend(v63, "setFrame:", v85, v64, v69, v66);
        objc_msgSend(v81, "setObject:forKeyedSubscript:", v63, v61);
        v22 = v78 + v64 + v67;

        ++v31;
        v3 = v77;
        if (v31 == v80)
        {
          if (self->_centersItemsInExcessSpace && v32 < v23)
          {
            v70 = MEMORY[0x1E0C809B0];
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __39__GKCollectionGridLayout_prepareLayout__block_invoke;
            aBlock[3] = &__block_descriptor_40_e42_v16__0__UICollectionViewLayoutAttributes_8l;
            *(double *)&aBlock[4] = (v23 - (v85 + v32)) * 0.5;
            v90[0] = MEMORY[0x1E0C809B0];
            v90[1] = 3221225472;
            v90[2] = __39__GKCollectionGridLayout_prepareLayout__block_invoke_2;
            v90[3] = &unk_1E59C47D0;
            v71 = _Block_copy(aBlock);
            v91 = v71;
            objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v90);
            v88[0] = v70;
            v88[1] = 3221225472;
            v88[2] = __39__GKCollectionGridLayout_prepareLayout__block_invoke_3;
            v88[3] = &unk_1E59C47D0;
            v72 = v71;
            v89 = v72;
            objc_msgSend(v82, "enumerateKeysAndObjectsUsingBlock:", v88);
            v86[0] = v70;
            v86[1] = 3221225472;
            v86[2] = __39__GKCollectionGridLayout_prepareLayout__block_invoke_4;
            v86[3] = &unk_1E59C47D0;
            v87 = v72;
            v73 = v72;
            objc_msgSend(v81, "enumerateKeysAndObjectsUsingBlock:", v86);

          }
          goto LABEL_52;
        }
      }
      v83 = v34;
      v50 = 0;
      v51 = v23;
      v52 = v85;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v50, v31);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_itemAttributes, "objectForKeyedSubscript:", v53);
        v54 = objc_claimAutoreleasedReturnValue();

        v35 = (void *)v54;
        if (!v54)
        {
          objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v53);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[GKCollectionFocusingLayout sizeForItemAtIndexPath:](self, "sizeForItemAtIndexPath:", v53);
        if (v55 == 0.0)
          break;
        v57 = v55;
        if (v55 > v23)
          goto LABEL_32;
LABEL_33:
        v58 = v49 + v56;
        v59 = -0.0;
        if (v57 > v51)
          v59 = v49 + v56;
        v47 = v47 + v59;
        if (v57 > v51)
          v52 = v85;
        objc_msgSend(v35, "setFrame:", v52, v47, v57);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v35, v53);
        v60 = v57 + v52;
        v52 = v45 + v60;
        v51 = v85 + v23 - (v45 + v60);

        if (v33 == ++v50)
        {
          v32 = v60 - v85;
          v34 = v83;
          goto LABEL_40;
        }
      }
      v57 = v84;
      if (self->_autoWidthColumns)
        goto LABEL_33;
      v57 = v51;
      if (v51 > 0.0)
        goto LABEL_33;
LABEL_32:
      v57 = v23;
      goto LABEL_33;
    }
LABEL_52:
    -[GKCollectionGridLayout setHeaderAttributes:](self, "setHeaderAttributes:", v82);
    -[GKCollectionGridLayout setFooterAttributes:](self, "setFooterAttributes:", v81);
    -[GKCollectionGridLayout setItemAttributes:](self, "setItemAttributes:", v14);

  }
}

void __39__GKCollectionGridLayout_prepareLayout__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:", *(double *)(a1 + 32) + v3);

}

uint64_t __39__GKCollectionGridLayout_prepareLayout__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__GKCollectionGridLayout_prepareLayout__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__GKCollectionGridLayout_prepareLayout__block_invoke_4(uint64_t a1)
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *itemAttributes;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void *v37;
  GKCollectionGridLayout *v38;
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGRect v50;
  CGRect v51;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSDictionary count](self->_itemAttributes, "count") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionGridLayout sectionsThatShowHeaderWhenEmpty](self, "sectionsThatShowHeaderWhenEmpty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[GKCollectionGridLayout sectionsThatShowHeaderWhenEmpty](self, "sectionsThatShowHeaderWhenEmpty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[GKCollectionGridLayout sectionsThatShowFootersWhenEmpty](self, "sectionsThatShowFootersWhenEmpty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[GKCollectionGridLayout sectionsThatShowFootersWhenEmpty](self, "sectionsThatShowFootersWhenEmpty");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  itemAttributes = self->_itemAttributes;
  v16 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke;
  v42[3] = &unk_1E59C47F8;
  v46 = x;
  v47 = y;
  v48 = width;
  v49 = height;
  v42[4] = self;
  v17 = v8;
  v43 = v17;
  v18 = v11;
  v44 = v18;
  v19 = v14;
  v45 = v19;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](itemAttributes, "enumerateKeysAndObjectsUsingBlock:", v42);
  v40[0] = v16;
  v40[1] = 3221225472;
  v40[2] = __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v40[3] = &unk_1E59C4820;
  v40[4] = self;
  v20 = v17;
  v41 = v20;
  objc_msgSend(v18, "enumerateIndexesUsingBlock:", v40);
  v34 = v16;
  v35 = 3221225472;
  v36 = __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke_3;
  v37 = &unk_1E59C4820;
  v38 = self;
  v21 = v20;
  v39 = v21;
  objc_msgSend(v19, "enumerateIndexesUsingBlock:", &v34);
  -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes", v34, v35, v36, v37, v38);
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v51.origin.x = v25;
    v51.origin.y = v26;
    v51.size.width = v27;
    v51.size.height = v28;
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    v29 = CGRectIntersectsRect(v50, v51);

    if (v29)
    {
      -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v30);

    }
  }
  v31 = v39;
  v32 = v21;

  return v32;
}

void __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 64), v12))
  {
    objc_msgSend(*(id *)(a1 + 32), "focusAdjustedAttributesForItemAttributes:", v5);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v11, "section"));
    objc_msgSend(*(id *)(a1 + 56), "addIndex:", objc_msgSend(v11, "section"));
    v5 = (id)v10;
  }

}

void __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2)
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

void __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", *MEMORY[0x1E0DC48A0]);
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
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("GKCollectionLayoutTopHeaderKind")))
  {
    -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
    {
      -[GKCollectionGridLayout footerAttributes](self, "footerAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_6;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 0.0);
      goto LABEL_9;
    }
    -[NSDictionary objectForKeyedSubscript:](self->_headerAttributes, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  if (!v8)
    goto LABEL_8;
LABEL_6:
  -[GKCollectionFocusingLayout focusAdjustedAttributesForSupplementaryViewAttributes:](self, "focusAdjustedAttributesForSupplementaryViewAttributes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v10;
}

- (CGSize)collectionViewContentSize
{
  double MaxY;
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGSize result;
  CGRect v42;
  CGRect v43;

  if (!-[NSDictionary count](self->_itemAttributes, "count"))
    -[GKCollectionGridLayout prepareLayout](self, "prepareLayout");
  MaxY = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v4 = -[GKCollectionGridLayout lastValidSection](self, "lastValidSection");
  v40 = MaxY;
  if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_footerAttributes, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "frame");
      MaxY = CGRectGetMaxY(v42);
    }
    else
    {
      -[GKCollectionGridLayout collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "numberOfItemsInSection:", v5);

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10 - 1, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](self->_itemAttributes, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      MaxY = CGRectGetMaxY(v43);

    }
  }
  -[GKCollectionGridLayout collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "numberOfSections");

  -[GKCollectionFocusingLayout sectionInset](self, "sectionInset");
  v16 = v15;
  -[GKCollectionFocusingLayout sectionInset](self, "sectionInset");
  v18 = v17;
  -[GKCollectionFocusingLayout topHeaderHeight](self, "topHeaderHeight");
  v20 = v19;
  -[GKCollectionGridLayout collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;

  -[GKCollectionGridLayout collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "adjustedContentInset");
  v26 = v25;
  v28 = v27;

  -[GKCollectionGridLayout collectionView](self, "collectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  v31 = v30;

  if (self->_sectionInsetRelativeWithContentInset)
  {
    -[GKCollectionGridLayout collectionView](self, "collectionView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "contentInset");
    v34 = v31 - v33;
    -[GKCollectionGridLayout collectionView](self, "collectionView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "contentInset");
    v31 = v34 - v36;

  }
  v37 = v23 - (v26 + v28);
  v38 = v20 + MaxY + v16 * (double)v14 + v18 * (double)v14;
  if (v40 >= v37)
    v37 = v40;
  if (v38 < v37)
    v38 = v37;
  v39 = v31;
  result.height = v38;
  result.width = v39;
  return result;
}

- (int64_t)lastValidSection
{
  void *v3;
  int64_t v4;
  void *v6;
  uint64_t v7;

  -[GKCollectionGridLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  while (v4-- >= 1)
  {
    -[GKCollectionGridLayout collectionView](self, "collectionView");
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

- (BOOL)sectionInsetRelativeWithContentInset
{
  return self->_sectionInsetRelativeWithContentInset;
}

- (void)setSectionInsetRelativeWithContentInset:(BOOL)a3
{
  self->_sectionInsetRelativeWithContentInset = a3;
}

- (int64_t)autoWidthColumns
{
  return self->_autoWidthColumns;
}

- (double)extraSectionHeaderToCellSpace
{
  return self->_extraSectionHeaderToCellSpace;
}

- (void)setExtraSectionHeaderToCellSpace:(double)a3
{
  self->_extraSectionHeaderToCellSpace = a3;
}

- (NSIndexSet)sectionsThatShowHeaderWhenEmpty
{
  return self->_sectionsThatShowHeaderWhenEmpty;
}

- (void)setSectionsThatShowHeaderWhenEmpty:(id)a3
{
  objc_storeStrong((id *)&self->_sectionsThatShowHeaderWhenEmpty, a3);
}

- (NSIndexSet)sectionsThatShowFootersWhenEmpty
{
  return self->_sectionsThatShowFootersWhenEmpty;
}

- (void)setSectionsThatShowFootersWhenEmpty:(id)a3
{
  objc_storeStrong((id *)&self->_sectionsThatShowFootersWhenEmpty, a3);
}

- (BOOL)shouldPerformInitialScrollToContentInsetTop
{
  return self->_shouldPerformInitialScrollToContentInsetTop;
}

- (void)setShouldPerformInitialScrollToContentInsetTop:(BOOL)a3
{
  self->_shouldPerformInitialScrollToContentInsetTop = a3;
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

- (NSDictionary)footerAttributes
{
  return self->_footerAttributes;
}

- (void)setFooterAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_footerAttributes, a3);
}

- (BOOL)didPerformInitialContentInsetScroll
{
  return self->_didPerformInitialContentInsetScroll;
}

- (void)setDidPerformInitialContentInsetScroll:(BOOL)a3
{
  self->_didPerformInitialContentInsetScroll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerAttributes, 0);
  objc_storeStrong((id *)&self->_headerAttributes, 0);
  objc_storeStrong((id *)&self->_itemAttributes, 0);
  objc_storeStrong((id *)&self->_sectionsThatShowFootersWhenEmpty, 0);
  objc_storeStrong((id *)&self->_sectionsThatShowHeaderWhenEmpty, 0);
}

@end
