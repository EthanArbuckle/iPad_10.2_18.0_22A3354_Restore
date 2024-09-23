@implementation GKCollectionColumnLayout

- (void)applyDefaults
{
  -[UICollectionViewFlowLayout setScrollDirection:](self, "setScrollDirection:", 0);
  -[UICollectionViewFlowLayout setSectionInset:](self, "setSectionInset:", 8.0, 0.0, 0.0, 0.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self, "setMinimumInteritemSpacing:", 16.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self, "setMinimumLineSpacing:", 8.0);
  -[UICollectionViewFlowLayout setItemSize:](self, "setItemSize:", 144.0, 70.0);
  -[UICollectionViewFlowLayout setHeaderReferenceSize:](self, "setHeaderReferenceSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[GKCollectionFocusingLayout setFocusScaleFactor:](self, "setFocusScaleFactor:", 1.0);
  -[GKCollectionFocusingLayout setFocusHeaderOffset:](self, "setFocusHeaderOffset:", 0.0);
  -[GKCollectionFocusingLayout setHeaderToItemSpacing:](self, "setHeaderToItemSpacing:", 8.0);
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
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
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
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v70;
  double v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  objc_super v80;

  -[GKCollectionColumnLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  if (v4 != 0.0)
  {
    v5 = v4;
    v80.receiver = self;
    v80.super_class = (Class)GKCollectionColumnLayout;
    -[GKCollectionFocusingLayout prepareLayout](&v80, sel_prepareLayout);
    v6 = objc_msgSend(v3, "numberOfSections");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v6);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionFocusingLayout sectionInset](self, "sectionInset");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = 0.0;
    v15 = 0.0;
    v16 = v6 - 1;
    if (v6 > 1)
    {
      v17 = 0;
      do
      {
        -[GKCollectionFocusingLayout minimumInteritemSpacingForSectionAtIndex:](self, "minimumInteritemSpacingForSectionAtIndex:", v17);
        v15 = v15 + v18;
        ++v17;
      }
      while (v16 != v17);
    }
    v19 = v5 - v11 - v13;
    v20 = (v19 - v15) / (double)v6;
    v21 = 0.0;
    if (v6 >= 1)
    {
      v22 = 0;
      v14 = 0.0;
      do
      {
        v23 = objc_msgSend(v3, "numberOfItemsInSection:", v22);
        if (v23 >= 1)
        {
          v24 = v23;
          for (i = 0; i != v24; ++i)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[GKCollectionFocusingLayout sizeForItemAtIndexPath:](self, "sizeForItemAtIndexPath:", v26);
            if (v27 == 0.0)
              v27 = v20;
            if (v14 < v27)
              v14 = v27;

          }
        }
        -[GKCollectionFocusingLayout sizeForHeaderInSection:](self, "sizeForHeaderInSection:", v22);
        if (v14 < v28)
          v14 = v28;
        if (v22 < v16)
        {
          -[GKCollectionFocusingLayout minimumInteritemSpacingForSectionAtIndex:](self, "minimumInteritemSpacingForSectionAtIndex:", v22);
          v21 = v21 + v29;
        }
        ++v22;
      }
      while (v22 != v6);
    }
    if (v20 >= v14)
      v30 = v14;
    else
      v30 = v20;
    if (v14 > 0.0)
      v20 = v30;
    v31 = v19 - (v21 + v20 * (double)v6);
    if (v31 <= 0.0)
      v32 = -0.0;
    else
      v32 = v31 * 0.5;
    -[GKCollectionFocusingLayout topHeaderHeight](self, "topHeaderHeight");
    v34 = v33;
    -[GKCollectionFocusingLayout topHeaderHeight](self, "topHeaderHeight");
    if (v35 > 0.0)
    {
      v36 = (void *)MEMORY[0x1E0DC3628];
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("GKCollectionLayoutTopHeaderKind"), v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKCollectionFocusingLayout setTopHeaderAttributes:](self, "setTopHeaderAttributes:", v38);

      -[GKCollectionFocusingLayout topHeaderHeight](self, "topHeaderHeight");
      v40 = v39;
      -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setFrame:", 0.0, 0.0, v5, v40);

    }
    if (v6 >= 1)
    {
      v42 = 0;
      v43 = v11 + v32;
      v44 = v9 + v34;
      v73 = *MEMORY[0x1E0DC48A0];
      v74 = *MEMORY[0x1E0DC48A8];
      v75 = v6;
      v76 = v3;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v42);
        v45 = objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_headerAttributes, "objectForKeyedSubscript:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v46)
        {
          objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v74, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setZIndex:", 1024);
        }
        -[GKCollectionFocusingLayout sizeForHeaderInSection:](self, "sizeForHeaderInSection:", v42);
        if (v48 > 0.0 && v47 == 0.0)
          v50 = v20;
        else
          v50 = v47;
        objc_msgSend(v46, "setFrame:", v43, v44, v50, v48);
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v46, v45);
        objc_msgSend(v46, "frame");
        v52 = v44 + v51;
        -[GKCollectionFocusingLayout headerToItemSpacing](self, "headerToItemSpacing");
        v54 = v53 + v52;
        v55 = objc_msgSend(v3, "numberOfItemsInSection:", v42);
        v79 = (void *)v45;
        if (v55 < 1)
        {
          v59 = v46;
        }
        else
        {
          v56 = v55;
          for (j = 0; j != v56; ++j)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", j, v42);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](self->_itemAttributes, "objectForKeyedSubscript:", v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v59)
            {
              objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[GKCollectionFocusingLayout sizeForItemAtIndexPath:](self, "sizeForItemAtIndexPath:", v58);
            v62 = v61;
            if (v60 == 0.0)
              v63 = v20;
            else
              v63 = v60;
            objc_msgSend(v59, "setFrame:", v43, v54, v63, v61);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v59, v58);
            -[GKCollectionFocusingLayout minimumLineSpacingForSectionAtIndex:](self, "minimumLineSpacingForSectionAtIndex:", v42);
            v54 = v54 + v62 + v64;

            v46 = v59;
          }
        }
        -[GKCollectionColumnLayout footerAttributes](self, "footerAttributes");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKeyedSubscript:", v79);
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v66)
        {
          objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v73, v79);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setZIndex:", 1024);
        }
        -[GKCollectionFocusingLayout sizeForFooterInSection:](self, "sizeForFooterInSection:", v42);
        if (v68 > 0.0 && v67 == 0.0)
          v70 = v20;
        else
          v70 = v67;
        objc_msgSend(v66, "setFrame:", v43 + 12.0, v54, v70, v68);
        objc_msgSend(v77, "setObject:forKeyedSubscript:", v66, v79);
        -[GKCollectionFocusingLayout minimumInteritemSpacingForSectionAtIndex:](self, "minimumInteritemSpacingForSectionAtIndex:", v42);
        v43 = v43 + v20 + v71;

        ++v42;
        v3 = v76;
      }
      while (v42 != v75);
    }
    -[GKCollectionColumnLayout setHeaderAttributes:](self, "setHeaderAttributes:", v78);
    -[GKCollectionColumnLayout setItemAttributes:](self, "setItemAttributes:", v7);
    -[GKCollectionColumnLayout setDecorationAttributes:](self, "setDecorationAttributes:", v72);
    -[GKCollectionColumnLayout setFooterAttributes:](self, "setFooterAttributes:", v77);

  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  NSDictionary *itemAttributes;
  uint64_t v10;
  id v11;
  NSDictionary *headerAttributes;
  id v13;
  NSDictionary *footerAttributes;
  id v15;
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
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, void *);
  void *v30;
  GKCollectionColumnLayout *v31;
  id v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  _QWORD v37[5];
  id v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  _QWORD v43[5];
  id v44;
  _QWORD *v45;
  _QWORD *v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  _QWORD v51[4];
  _QWORD v52[4];
  CGRect v53;
  CGRect v54;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSDictionary count](self->_itemAttributes, "count") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v52[3] = 0x7FEFFFFFFFFFFFFFLL;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  itemAttributes = self->_itemAttributes;
  v10 = MEMORY[0x1E0C809B0];
  v51[3] = 0x10000000000000;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke;
  v43[3] = &unk_1E59C5CE0;
  v43[4] = self;
  v45 = v52;
  v46 = v51;
  v47 = x;
  v48 = y;
  v49 = width;
  v50 = height;
  v11 = v8;
  v44 = v11;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](itemAttributes, "enumerateKeysAndObjectsUsingBlock:", v43);
  headerAttributes = self->_headerAttributes;
  v37[0] = v10;
  v37[1] = 3221225472;
  v37[2] = __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v37[3] = &unk_1E59C5D08;
  v39 = x;
  v40 = y;
  v41 = width;
  v42 = height;
  v37[4] = self;
  v13 = v11;
  v38 = v13;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](headerAttributes, "enumerateKeysAndObjectsUsingBlock:", v37);
  footerAttributes = self->_footerAttributes;
  v27 = v10;
  v28 = 3221225472;
  v29 = __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke_3;
  v30 = &unk_1E59C5D08;
  v33 = x;
  v34 = y;
  v35 = width;
  v36 = height;
  v31 = self;
  v15 = v13;
  v32 = v15;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](footerAttributes, "enumerateKeysAndObjectsUsingBlock:", &v27);
  -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes", v27, v28, v29, v30, v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v54.origin.x = v18;
    v54.origin.y = v19;
    v54.size.width = v20;
    v54.size.height = v21;
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    v22 = CGRectIntersectsRect(v53, v54);

    if (v22)
    {
      -[GKCollectionFocusingLayout topHeaderAttributes](self, "topHeaderAttributes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v23);

    }
  }
  v24 = v32;
  v25 = v15;

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v52, 8);
  return v25;
}

void __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1)
{
  double MinY;
  double MaxY;
  uint64_t v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  objc_msgSend(*(id *)(a1 + 32), "focusAdjustedAttributesForItemAttributes:");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  MinY = CGRectGetMinY(v11);
  objc_msgSend(v10, "frame");
  MaxY = CGRectGetMaxY(v12);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (MinY < *(double *)(v4 + 24))
    *(double *)(v4 + 24) = MinY;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (MaxY > *(double *)(v5 + 24))
    *(double *)(v5 + 24) = MaxY;
  objc_msgSend(v10, "frame");
  v13.origin.x = v6;
  v13.origin.y = v7;
  v13.size.width = v8;
  v13.size.height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 64), v13))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

}

void __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  id v13;
  CGRect v14;

  v13 = a3;
  objc_msgSend(v13, "frame");
  v14.origin.x = v4;
  v14.origin.y = v5;
  v14.size.width = v6;
  v14.size.height = v7;
  if (!CGRectIntersectsRect(*(CGRect *)(a1 + 48), v14)
    || ((objc_msgSend(v13, "frame"), v9 == *MEMORY[0x1E0C9D820])
      ? (v10 = v8 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      : (v10 = 0),
        v10))
  {
    v12 = v13;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "focusAdjustedAttributesForSupplementaryViewAttributes:", v13);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    v12 = (void *)v11;
  }

}

void __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  id v13;
  CGRect v14;

  v13 = a3;
  objc_msgSend(v13, "frame");
  v14.origin.x = v4;
  v14.origin.y = v5;
  v14.size.width = v6;
  v14.size.height = v7;
  if (!CGRectIntersectsRect(*(CGRect *)(a1 + 48), v14)
    || ((objc_msgSend(v13, "frame"), v9 == *MEMORY[0x1E0C9D820])
      ? (v10 = v8 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      : (v10 = 0),
        v10))
  {
    v12 = v13;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "focusAdjustedAttributesForSupplementaryViewAttributes:", v13);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    v12 = (void *)v11;
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
  uint64_t v9;
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
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
      v9 = 608;
    else
      v9 = 624;
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v9), "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;
  if (v8)
  {
    -[GKCollectionFocusingLayout focusAdjustedAttributesForSupplementaryViewAttributes:](self, "focusAdjustedAttributesForSupplementaryViewAttributes:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", 0.0);
  }

  return v11;
}

- (CGSize)collectionViewContentSize
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double MaxY;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD v26[5];
  uint64_t v27;
  double *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  CGSize result;
  CGRect v33;

  if (!-[NSDictionary count](self->_itemAttributes, "count"))
    -[GKCollectionColumnLayout prepareLayout](self, "prepareLayout");
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x3010000000;
  v30 = &unk_1AB8BD257;
  v31 = *MEMORY[0x1E0C9D820];
  -[GKCollectionColumnLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      -[GKCollectionColumnLayout collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "numberOfItemsInSection:", i);

      if (v7 >= 1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7 - 1, i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_itemAttributes, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v28[5];
        objc_msgSend(v9, "frame");
        MaxY = CGRectGetMaxY(v33);
        if (v10 >= MaxY)
          MaxY = v10;
        v28[5] = MaxY;

      }
    }
  }
  -[GKCollectionColumnLayout footerAttributes](self, "footerAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __53__GKCollectionColumnLayout_collectionViewContentSize__block_invoke;
  v26[3] = &unk_1E59C5D30;
  v26[4] = &v27;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v26);

  -[GKCollectionFocusingLayout sectionInset](self, "sectionInset");
  v28[5] = v13 + v28[5];
  -[GKCollectionFocusingLayout topHeaderHeight](self, "topHeaderHeight");
  v15 = v14 + v28[5];
  v28[5] = v15;
  -[GKCollectionColumnLayout collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;

  if (v15 >= v18)
    v19 = v15;
  else
    v19 = v18;
  v28[5] = v19;
  -[GKCollectionColumnLayout collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  *((_QWORD *)v28 + 4) = v21;

  v22 = v28[4];
  v23 = v28[5];
  _Block_object_dispose(&v27, 8);
  v24 = v22;
  v25 = v23;
  result.height = v25;
  result.width = v24;
  return result;
}

void __53__GKCollectionColumnLayout_collectionViewContentSize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  double v5;
  double MaxY;
  id v7;
  CGRect v8;

  v7 = a3;
  if ((objc_msgSend(v7, "isHidden") & 1) == 0)
  {
    objc_msgSend(v7, "size");
    if (v4 > 0.0)
    {
      v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(v7, "frame");
      MaxY = CGRectGetMaxY(v8);
      if (v5 >= MaxY)
        MaxY = v5;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = MaxY;
    }
  }

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

- (NSDictionary)decorationAttributes
{
  return self->_decorationAttributes;
}

- (void)setDecorationAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_decorationAttributes, a3);
}

- (NSDictionary)footerAttributes
{
  return self->_footerAttributes;
}

- (void)setFooterAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_footerAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerAttributes, 0);
  objc_storeStrong((id *)&self->_decorationAttributes, 0);
  objc_storeStrong((id *)&self->_headerAttributes, 0);
  objc_storeStrong((id *)&self->_itemAttributes, 0);
}

@end
