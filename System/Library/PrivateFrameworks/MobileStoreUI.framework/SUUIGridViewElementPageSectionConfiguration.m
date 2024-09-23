@implementation SUUIGridViewElementPageSectionConfiguration

- (double)columnContentWidth
{
  double result;

  -[SUUIGridViewElementPageSectionConfiguration columnWidth](self, "columnWidth");
  -[SUUIGridViewElementPageSectionConfiguration _columnContentWidthPaddingForWidth:](self, "_columnContentWidthPaddingForWidth:");
  return result;
}

- (double)columnWidth
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  if (self->_numberOfColumns < 1)
    return 0.0;
  -[SUUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v4 * v6;

  v8 = floor(v7 / (double)self->_numberOfColumns);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v8 / v10;

  return v11;
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_dataSource, obj);
    *(_BYTE *)&self->_dataSourceRespondsToSelectorFlags = *(_BYTE *)&self->_dataSourceRespondsToSelectorFlags & 0xFE | objc_opt_respondsToSelector() & 1;

  }
}

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_numberOfColumns = a3;
  self->_cellContentWidth = 0.0;
  self->_cellPaddingLeftEdgeHorizontal = 0.0;
  self->_cellPaddingRightEdgeHorizontal = 0.0;
  self->_cellPaddingInteriorHorizontal = 0.0;
  self->_cellPaddingNeedsReloading = 1;
}

- (id)backgroundColorForViewElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ikBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (objc_msgSend(v3, "elementType") == 48)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (Class)cellClassForViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  objc_class *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  v6 = 0;
  if (v5 > 48)
  {
    if (v5 <= 65)
    {
      if (v5 == 49 || v5 == 50)
        goto LABEL_16;
    }
    else
    {
      if (v5 == 66)
      {
        v6 = -[SUUIGridViewElementPageSectionConfiguration lockupCellClassWithLockup:](self, "lockupCellClassWithLockup:", v4);
        goto LABEL_17;
      }
      if (v5 == 141 || v5 == 152)
        goto LABEL_16;
    }
  }
  else if (v5 > 13)
  {
    if (v5 == 14)
    {
      v6 = -[SUUIGridViewElementPageSectionConfiguration _cardCellClassForCard:](self, "_cardCellClassForCard:", v4);
      goto LABEL_17;
    }
    if (v5 == 48)
      goto LABEL_16;
  }
  else if ((unint64_t)(v5 - 12) < 2 || v5 == 4)
  {
LABEL_16:
    v6 = (objc_class *)objc_opt_class();
  }
LABEL_17:
  v7 = v6;

  return v7;
}

- (id)cellForViewElement:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  SUUIStorePageSectionContext *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v15;
  void *v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = self->_pageSectionContext;
  v9 = objc_msgSend(v6, "elementType");
  v10 = 0;
  if (v9 <= 48)
  {
    if (v9 > 13)
    {
      if (v9 == 14)
      {
        v17 = objc_msgSend(v6, "cardType");
        -[SUUIStorePageSectionContext collectionView](v8, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v17 == 3)
          v13 = CFSTR("SUUIEditorialCardCellReuseIdentifier");
        else
          v13 = CFSTR("SUUICardViewElementReuseIdentifier");
      }
      else
      {
        if (v9 != 48)
          goto LABEL_20;
        -[SUUIStorePageSectionContext collectionView](v8, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("SUUISectionHeaderReuseIdentifier");
      }
      goto LABEL_17;
    }
    if ((unint64_t)(v9 - 12) >= 2)
    {
      if (v9 != 4)
        goto LABEL_20;
      -[SUUIStorePageSectionContext collectionView](v8, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("SUUIActivityIndicatorReuseIdentifier");
      goto LABEL_17;
    }
LABEL_16:
    -[SUUIStorePageSectionContext collectionView](v8, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("SUUIButtonReuseIdentifier");
LABEL_17:
    objc_msgSend(v11, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v9 <= 65)
  {
    if (v9 != 49)
    {
      if (v9 != 50)
        goto LABEL_20;
      goto LABEL_16;
    }
    goto LABEL_21;
  }
  if (v9 != 66)
  {
    if (v9 == 141)
      goto LABEL_16;
    if (v9 != 152)
      goto LABEL_20;
LABEL_21:
    -[SUUIStorePageSectionContext collectionView](v8, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x251205968, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setShowsReflectionImage:", 0);
    if (!v10)
      goto LABEL_20;
    goto LABEL_19;
  }
  -[SUUIGridViewElementPageSectionConfiguration _lockupCellReuseIdentifierWithLockup:](self, "_lockupCellReuseIdentifierWithLockup:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSectionContext collectionView](v8, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  if (v10)
LABEL_19:
    -[SUUIGridViewElementPageSectionConfiguration configureCell:forViewElement:indexPath:](self, "configureCell:forViewElement:indexPath:", v10, v6, v7);
LABEL_20:

  return v10;
}

- (CGSize)cellSizeForViewElement:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  double v19;
  __int128 v20;
  uint64_t v21;
  double minimumCellHeight;
  double v23;
  double v24;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[3];
  char v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  CGSize result;

  v6 = a3;
  v7 = a4;
  v39 = 0;
  v40 = (double *)&v39;
  v41 = 0x3010000000;
  v43 = 0;
  v44 = 0;
  v42 = "";
  -[SUUIGridViewElementPageSectionConfiguration columnWidth](self, "columnWidth");
  *((_QWORD *)v40 + 4) = v8;
  -[SUUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth");
  v10 = v9;
  if (objc_msgSend(v6, "elementType") == 48)
  {
    -[SUUIGridViewElementPageSectionConfiguration _cellInsetsForViewElement:indexPath:](self, "_cellInsetsForViewElement:indexPath:", v6, v7);
    v12 = v11;
    v14 = v13;
    -[SUUIGridViewElementPageSectionConfiguration _cellHeightForViewElement:width:](self, "_cellHeightForViewElement:width:", v6, v10 - v15 - v16);
    v17 = v40;
    v19 = v14 + v12 + v18;
    v40[4] = v10;
    v17[5] = v19;
  }
  else
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v38 = 0;
    -[SUUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
    v31 = 0;
    v32 = (double *)&v31;
    v33 = 0x4010000000;
    v34 = "";
    v20 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
    v35 = *MEMORY[0x24BEBE158];
    v36 = v20;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __80__SUUIGridViewElementPageSectionConfiguration_cellSizeForViewElement_indexPath___block_invoke;
    v25[3] = &unk_2511FA648;
    v30 = v21;
    v25[4] = self;
    v27 = &v31;
    v28 = &v39;
    v29 = v37;
    v26 = v7;
    -[SUUIGridViewElementPageSectionConfiguration _enumerateViewElementsForRowOfIndexPath:usingBlock:](self, "_enumerateViewElementsForRowOfIndexPath:usingBlock:", v26, v25);
    v40[5] = v32[6] + v32[4] + v40[5];

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(v37, 8);
    v17 = v40;
    v10 = v40[4];
    v19 = v40[5];
  }
  if (v19 >= self->_minimumCellHeight)
    minimumCellHeight = v19;
  else
    minimumCellHeight = self->_minimumCellHeight;
  v17[5] = minimumCellHeight;
  _Block_object_dispose(&v39, 8);

  v23 = v10;
  v24 = minimumCellHeight;
  result.height = v24;
  result.width = v23;
  return result;
}

void __80__SUUIGridViewElementPageSectionConfiguration_cellSizeForViewElement_indexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BYTE *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double v26;
  id v27;

  v27 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_cellInsetsForViewElement:indexPath:", v27, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = *(_BYTE **)(a1 + 32);
  v15 = *(double *)(a1 + 72) - v8 - v12;
  if (v14[96])
    v16 = v15;
  else
    v16 = *(double *)(a1 + 72);
  objc_msgSend(v14, "_cellHeightForViewElement:width:", v27, v16);
  v18 = v17;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 236))
  {
    if (objc_msgSend(v27, "rendersWithPerspective"))
    {
      v19 = (void *)objc_msgSend(*(id *)(a1 + 32), "cellClassForViewElement:", v27);
      if (class_conformsToProtocol((Class)v19, (Protocol *)&unk_2571FE3F0))
      {
        objc_msgSend(v19, "maximumPerspectiveHeightForSize:", v16, v18);
        v7 = v20;
      }
    }
  }
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v22 = *(double *)(v21 + 48);
  if (v22 < v11)
    v22 = v11;
  *(double *)(v21 + 48) = v22;
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(double *)(v23 + 32);
  if (v24 < v7)
    v24 = v7;
  *(double *)(v23 + 32) = v24;
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v26 = *(double *)(v25 + 40);
  if (v26 < v18)
    v26 = v18;
  *(double *)(v25 + 40) = v26;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && objc_msgSend(*(id *)(a1 + 40), "isEqual:", v5))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = v13 + v9 + v16;
  }

}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "indexPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosition:", -[SUUIGridViewElementPageSectionConfiguration positionForIndexPath:](self, "positionForIndexPath:", v5));

}

- (void)configureCell:(id)a3 forViewElement:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  SUUIStorePageSectionContext *v10;
  uint64_t v11;
  id v12;
  int v13;
  _BOOL4 v14;
  __CFString *v15;
  UIColor *v16;
  double top;
  double left;
  double bottom;
  double right;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  uint64_t separatorStyle;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  SUUIStorePageSectionContext *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
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
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  id v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  _BOOL4 v68;
  id v69;
  double v70;
  id v71;
  CGRect v72;

  v71 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self->_pageSectionContext;
  v11 = objc_msgSend(v8, "elementType");
  v12 = 0;
  v13 = 0;
  if (v11 <= 48)
  {
    if (v11 == 14)
    {
      if (objc_msgSend(v8, "cardType") != 3)
      {
        v12 = v71;
        v13 = 0;
        goto LABEL_7;
      }
LABEL_6:
      v13 = 0;
      v12 = 0;
LABEL_7:
      v14 = 0;
      goto LABEL_12;
    }
    v14 = 0;
    if (v11 == 48)
    {
      v12 = 0;
      v14 = 0;
      v13 = 1;
    }
  }
  else
  {
    if (v11 == 49)
    {
LABEL_5:
      objc_msgSend(v71, "setShowsReflectionImage:", 0);
      goto LABEL_6;
    }
    if (v11 != 66)
    {
      v14 = 0;
      if (v11 != 152)
        goto LABEL_12;
      goto LABEL_5;
    }
    -[SUUIGridViewElementPageSectionConfiguration _lockupCellReuseIdentifierWithLockup:](self, "_lockupCellReuseIdentifierWithLockup:", v8);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = v15 == CFSTR("SUUIHorizontalLockupReuseID");

    v13 = 0;
    v12 = 0;
  }
LABEL_12:
  v16 = self->_separatorColor;
  top = self->_separatorWidths.top;
  left = self->_separatorWidths.left;
  bottom = self->_separatorWidths.bottom;
  right = self->_separatorWidths.right;
  v21 = self->_separatorMargins.top;
  v22 = self->_separatorMargins.left;
  v23 = self->_separatorMargins.bottom;
  v24 = self->_separatorMargins.right;
  if (v13)
  {
    objc_msgSend(v8, "style");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "valueForStyle:", *MEMORY[0x24BE518B8]);
    separatorStyle = objc_claimAutoreleasedReturnValue();

    v69 = v9;
    if (separatorStyle)
    {
      objc_msgSend(v25, "borderWidths");
      top = v27;
      left = v28;
      bottom = v29;
      right = v30;
      separatorStyle = 2;
    }
    objc_msgSend(v25, "valueForStyle:", *MEMORY[0x24BE518A8]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = v14;
    v32 = v10;
    if (v31)
    {
      objc_msgSend(v25, "ikBorderColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "color");
      v34 = objc_claimAutoreleasedReturnValue();

      v16 = (UIColor *)v34;
    }
    objc_msgSend(v25, "valueForStyle:", *MEMORY[0x24BE518B0]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v25, "borderMargins");
      v21 = v36;
      v22 = v37;
      v23 = v38;
      v24 = v39;
    }
    objc_msgSend(v8, "parent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "style");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "ikBackgroundColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42 && objc_msgSend(v42, "colorType") == 3)
      self->_hasHeader = 1;

    v9 = v69;
    v10 = v32;
    v14 = v68;
  }
  else
  {
    separatorStyle = self->_separatorStyle;
    if (self->_hasHeader && objc_msgSend(v9, "item") == 1)
      separatorStyle = 0;
  }
  v70 = v24;
  v43 = v23;
  v44 = v22;
  v45 = v21;
  if (objc_msgSend(v8, "elementType") == 48)
  {
    -[SUUIStorePageSectionContext activePageWidth](v10, "activePageWidth");
    v47 = v46;
    -[SUUIGridViewElementPageSectionConfiguration _cellPaddingLeftEdgeHorizontal](self, "_cellPaddingLeftEdgeHorizontal");
    v49 = v47 - v48;
    -[SUUIGridViewElementPageSectionConfiguration _cellPaddingRightEdgeHorizontal](self, "_cellPaddingRightEdgeHorizontal");
    v51 = v49 - v50;
  }
  else
  {
    -[SUUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
    v51 = v52;
  }
  objc_msgSend(v71, "reloadWithViewElement:width:context:", v8, self->_cellLayoutContext, v51);
  objc_msgSend(v71, "setSeparatorColor:", v16);
  objc_msgSend(v71, "setSeparatorStyle:", separatorStyle);
  objc_msgSend(v71, "setSeparatorWidths:", top, left, bottom, right);
  objc_msgSend(v71, "setSeparatorInsets:", v45, v44, v43, v70);
  if (v14)
    objc_msgSend(v71, "setEditing:animated:", self->_showsEditMode, 0);
  -[SUUIGridViewElementPageSectionConfiguration _normalizedContentInsetForViewElement:indexPath:](self, "_normalizedContentInsetForViewElement:indexPath:", v8, v9);
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  if (-[SUUIGridViewElementPageSectionConfiguration rendersWithPerspective](self, "rendersWithPerspective")
    && objc_msgSend(v71, "conformsToProtocol:", &unk_2571FE3F0))
  {
    v61 = v71;
    -[SUUIStorePageSectionContext parentViewController](self->_pageSectionContext, "parentViewController");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "view");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v61, "setPerspectiveTargetView:", v63);
    objc_msgSend(v63, "bounds");
    objc_msgSend(v61, "setVanishingPoint:", CGRectGetMidX(v72), -800.0);
    if (objc_msgSend(v8, "rendersWithPerspective"))
    {
      objc_msgSend((id)objc_opt_class(), "sizeThatFitsWidth:viewElement:context:", v8, self->_cellLayoutContext, v51);
      objc_msgSend((id)objc_opt_class(), "maximumPerspectiveHeightForSize:", v64, v65);
      if (v54 < v66)
        v54 = v66;
    }

  }
  objc_msgSend(v71, "setContentInset:", v54, v56, v58, v60);
  if (v12)
  {
    -[SUUIGridViewElementPageSectionConfiguration _cardArtworkBoundingSizeForIndexPath:](self, "_cardArtworkBoundingSizeForIndexPath:", v9);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setArtworkBoundingSize:", v67);

  }
}

- (Class)lockupCellClassWithLockup:(id)a3
{
  void *v3;

  if ((unint64_t)-[SUUIGridViewElementPageSectionConfiguration _lockupTypeForLockup:](self, "_lockupTypeForLockup:", a3) <= 8)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (int64_t)positionForIndexPath:(id)a3
{
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  id WeakRetained;
  int64_t v11;

  v5 = objc_msgSend(a3, "item");
  v6 = 1;
  v11 = 1;
  if ((v5 & 0x8000000000000000) == 0)
  {
    v7 = v5;
    if (v5 >= -[NSArray count](self->_positions, "count"))
    {
      v6 = 1;
    }
    else
    {
      -[NSArray objectAtIndex:](self->_positions, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "integerValue");
      v11 = v6;

    }
  }
  if ((*(_BYTE *)&self->_dataSourceRespondsToSelectorFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "gridViewElementPageSectionConfiguration:configurePosition:forItemAtIndexPath:", self, &v11, a3);

    return v11;
  }
  return v6;
}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x25120A6C8);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x25120A6E8);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251211FE8);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x25120FE88);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251210428);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251205968);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251211F68);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251210CE8);
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x25120A268);

}

- (void)reloadCellWithIndexPath:(id)a3 forViewElement:(id)a4 reason:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  -[SUUIStorePageSectionContext collectionView](self->_pageSectionContext, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v8, self->_cellLayoutContext);
  if (a5 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "setEditing:animated:", self->_showsEditMode, 1);
  }
  if (-[SUUIGridViewElementPageSectionConfiguration viewElementIsStandardCard:](self, "viewElementIsStandardCard:", v8))
  {
    -[SUUIGridViewElementPageSectionConfiguration _cardArtworkBoundingSizeForIndexPath:](self, "_cardArtworkBoundingSizeForIndexPath:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setArtworkBoundingSize:", v11);

  }
  -[SUUIGridViewElementPageSectionConfiguration _normalizedContentInsetForViewElement:indexPath:](self, "_normalizedContentInsetForViewElement:indexPath:", v8, v12);
  objc_msgSend(v10, "setContentInset:");

}

- (void)requestCellLayoutForViewElement:(id)a3
{
  objc_class *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  v4 = -[SUUIGridViewElementPageSectionConfiguration cellClassForViewElement:](self, "cellClassForViewElement:", v11);
  if (objc_msgSend(v11, "elementType") == 48)
  {
    -[SUUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth");
    v6 = v5;
    -[SUUIGridViewElementPageSectionConfiguration _cellPaddingLeftEdgeHorizontal](self, "_cellPaddingLeftEdgeHorizontal");
    v8 = v6 - v7;
    -[SUUIGridViewElementPageSectionConfiguration _cellPaddingRightEdgeHorizontal](self, "_cellPaddingRightEdgeHorizontal");
    v10 = v8 - v9;
  }
  else
  {
    -[SUUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
  }
  -[objc_class requestLayoutForViewElement:width:context:](v4, "requestLayoutForViewElement:width:context:", v11, self->_cellLayoutContext, (double)(uint64_t)v10);

}

- (UIEdgeInsets)sectionContentInsetAdjustedFromValue:(UIEdgeInsets)a3 forGridViewElement:(id)a4
{
  CGFloat right;
  double bottom;
  CGFloat left;
  double top;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v16 = 0;
  objc_msgSend(a4, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SUUIViewElementPaddingForStyle(v8, &v16);
  v11 = v10;

  if (v16)
    v12 = v11;
  else
    v12 = bottom;
  if (v16)
    v13 = v9;
  else
    v13 = top;
  v14 = left;
  v15 = right;
  result.right = v15;
  result.bottom = v12;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)updateLayoutPropertiesForGridViewElement:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  int64_t numberOfColumns;
  unsigned int v22;
  uint64_t v23;
  int64_t v24;
  BOOL v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSArray *positions;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIGridViewElementPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activePageWidth");
  v7 = v6;
  self->_cellContentWidth = 0.0;
  objc_msgSend(v4, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGridViewElementPageSectionConfiguration setNumberOfColumns:](self, "setNumberOfColumns:", -[SUUIGridViewElementPageSectionConfiguration _numberOfColumnsForWidth:style:](self, "_numberOfColumnsForWidth:style:", v8, v7));

  v31 = v5;
  objc_msgSend(v5, "clientContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = SUUIUserInterfaceIdiom(v9);

  if (v10 == 1)
  {
    if (-[SUUIGridViewElementPageSectionConfiguration _isContainedWithinExploreTemplateWithGridViewElement:](self, "_isContainedWithinExploreTemplateWithGridViewElement:", v4))
    {
      v11 = 3;
    }
    else
    {
      v11 = 4;
    }
LABEL_10:
    self->_cardVerticalSpacingStyle = v11;
    goto LABEL_11;
  }
  if (v7 >= 414.0)
  {
    if (self->_numberOfColumns > 1)
      v11 = 2;
    else
      v11 = 1;
    goto LABEL_10;
  }
  self->_cardVerticalSpacingStyle = 0;
LABEL_11:
  v12 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v32 = v4;
  objc_msgSend(v4, "flattenedChildren");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v13)
  {
    v16 = 0;
    goto LABEL_37;
  }
  v14 = v13;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = *(_QWORD *)v35;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v35 != v19)
        objc_enumerationMutation(obj);
      numberOfColumns = self->_numberOfColumns;
      if (numberOfColumns == 1)
        goto LABEL_19;
      if (objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "elementType") == 48)
      {
        numberOfColumns = self->_numberOfColumns;
        v15 = numberOfColumns - 1;
LABEL_19:
        v22 = 5;
        v16 = v18 + i;
        goto LABEL_25;
      }
      numberOfColumns = self->_numberOfColumns;
      if (v15 == numberOfColumns - 1)
        v22 = 4;
      else
        v22 = 2;
      if (!v15)
      {
        v15 = 0;
        v16 = v18 + i;
        v22 = 1;
      }
LABEL_25:
      if (v17)
        v23 = v22;
      else
        v23 = v22 | 8;
      v24 = numberOfColumns - 1;
      v25 = v15 < v24;
      if (v15 < v24)
        ++v15;
      else
        v15 = 0;
      if (!v25)
        ++v17;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v12, "addObject:", v26);

    }
    v18 += v14;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  }
  while (v14);
LABEL_37:

  for (; v16 < -[NSArray count](v12, "count"); ++v16)
  {
    -[NSArray objectAtIndex:](v12, "objectAtIndex:", v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "integerValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v28 | 0x20u);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray replaceObjectAtIndex:withObject:](v12, "replaceObjectAtIndex:withObject:", v16, v29);

  }
  positions = self->_positions;
  self->_positions = v12;

}

- (void)updateStylePropertiesForGridViewElement:(id)a3 gridItemViewElements:(id)a4 numberOfGridItems:(unint64_t)a5
{
  id v7;
  NSArray *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  char v19;
  double gridViewElementStyleItemWidth;
  BOOL *p_gridIsEdgeToEdge;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  int64_t v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  NSArray *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  BOOL v49;
  void *v50;
  BOOL v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  NSArray *viewElements;
  void *v57;
  void *v58;
  int64_t v59;
  void *v60;
  float v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSArray *obj;
  uint64_t v66;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (NSArray *)a4;
  objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;

  if (objc_msgSend(v7, "elementType") == 45)
    v13 = objc_msgSend(v7, "showsEditMode");
  else
    v13 = 0;
  self->_showsEditMode = v13;
  objc_msgSend(v7, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemWidth");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "floatValue");
  self->_gridViewElementStyleItemWidth = v18;
  v68 = v17;
  v19 = objc_msgSend(v17, "hasSuffix:", CFSTR("%"));
  self->_gridViewElementStyleItemWidthIsPercentage = v19;
  if ((v19 & 1) != 0)
  {
    gridViewElementStyleItemWidth = self->_gridViewElementStyleItemWidth;
    self->_gridIsEdgeToEdge = gridViewElementStyleItemWidth == 100.0;
    p_gridIsEdgeToEdge = &self->_gridIsEdgeToEdge;
    if (gridViewElementStyleItemWidth == 100.0)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v22 = objc_claimAutoreleasedReturnValue();

      v24 = *MEMORY[0x24BEBE158];
      v23 = *(double *)(MEMORY[0x24BEBE158] + 8);
      v25 = *(double *)(MEMORY[0x24BEBE158] + 16);
      v26 = *(double *)(MEMORY[0x24BEBE158] + 24);
      v9 = (void *)v22;
      goto LABEL_9;
    }
  }
  else
  {
    self->_gridIsEdgeToEdge = 0;
    p_gridIsEdgeToEdge = &self->_gridIsEdgeToEdge;
  }
  v25 = 0.0;
  v26 = 15.0;
  v23 = 15.0;
  v24 = 0.0;
LABEL_9:
  v27 = 1.0 / v12;
  objc_msgSend(v14, "ikBorderColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "color");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = objc_retainAutorelease(v29);
    if (CGColorGetAlpha((CGColorRef)objc_msgSend(v30, "CGColor")) <= 0.00000011920929)
    {

      v9 = 0;
      v33 = 0;
      v34 = v27;
      v35 = v27;
      v36 = v27;
      goto LABEL_29;
    }
    v31 = v30;

    v9 = v31;
  }
  objc_msgSend(v14, "dividerType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "isEqualToString:", CFSTR("grid-full")) & 1) != 0)
  {
    v33 = 2;
  }
  else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("grid-top")) & 1) != 0)
  {
    v33 = 3;
  }
  else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("full")) & 1) != 0)
  {
    v33 = 4;
  }
  else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("grid-vertical")) & 1) != 0)
  {
    v33 = 6;
  }
  else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v33 = 0;
  }
  else if (*p_gridIsEdgeToEdge || (objc_msgSend(v32, "isEqualToString:", CFSTR("edge-to-edge")) & 1) != 0)
  {
    v33 = 7;
  }
  else
  {
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v8;
    v62 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (v62)
    {
      v63 = v62;
      v66 = *(_QWORD *)v70;
      v33 = 1;
LABEL_46:
      v64 = 0;
      while (1)
      {
        if (*(_QWORD *)v70 != v66)
          objc_enumerationMutation(obj);
        if (!SUUIIKViewElementTypeIsButton(objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v64), "elementType")))
          break;
        if (v63 == ++v64)
        {
          v63 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
          if (v63)
            goto LABEL_46;
          goto LABEL_52;
        }
      }
    }
    else
    {
LABEL_52:
      v33 = 4;
    }

  }
  objc_msgSend(v14, "valueForStyle:", *MEMORY[0x24BE518B8]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v27;
  v35 = v27;
  v36 = v27;
  if (v37)
  {
    objc_msgSend(v14, "borderWidths");
    v36 = v38;
    v35 = v39;
    v34 = v40;
    v27 = v41;
  }

LABEL_29:
  v42 = v8;
  objc_msgSend(v14, "valueForStyle:", *MEMORY[0x24BE518B0]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v14, "borderMargins");
    v24 = v44;
    v23 = v45;
    v25 = v46;
    v26 = v47;
  }
  objc_msgSend(v14, "valueForStyle:", *MEMORY[0x24BE518F0]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 1;
  if (!v48)
  {
    objc_msgSend(v14, "valueForStyle:", CFSTR("itml-padding"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v50 != 0;

  }
  if (v14)
    v51 = v49;
  else
    v51 = 0;
  self->_hasGridViewElementStyle = v51;
  objc_msgSend(v14, "elementPadding");
  self->_gridViewElementStyleElementPadding.top = v52;
  self->_gridViewElementStyleElementPadding.left = v53;
  self->_gridViewElementStyleElementPadding.bottom = v54;
  self->_gridViewElementStyleElementPadding.right = v55;
  self->_numberOfGridItems = a5;
  self->_separatorStyle = v33;
  objc_storeStrong((id *)&self->_separatorColor, v9);
  self->_separatorMargins.top = v24;
  self->_separatorMargins.left = v23;
  self->_separatorMargins.bottom = v25;
  self->_separatorMargins.right = v26;
  self->_separatorWidths.top = v36;
  self->_separatorWidths.left = v35;
  self->_separatorWidths.bottom = v34;
  self->_separatorWidths.right = v27;
  viewElements = self->_viewElements;
  self->_viewElements = v42;

  self->_cellContentWidth = 0.0;
  self->_cellPaddingNeedsReloading = 1;
  self->_cellPaddingLeftEdgeHorizontal = 0.0;
  self->_cellPaddingRightEdgeHorizontal = 0.0;
  self->_cellPaddingInteriorHorizontal = 0.0;
  objc_msgSend(v7, "style");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "lockupType");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
    v59 = SUUILockupViewTypeForString(v58);
  else
    v59 = -1;
  self->_lockupType = v59;
  objc_msgSend(v14, "itemHeight");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60 || (objc_msgSend(v14, "rowHeight"), (v60 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v60, "floatValue");
    self->_minimumCellHeight = v61;

  }
  else
  {
    self->_minimumCellHeight = 44.0;
  }

}

- (BOOL)viewElementIsStandardCard:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "elementType") == 14 && objc_msgSend(v3, "cardType") != 3;

  return v4;
}

- (id)_cardArtworkBoundingSizeForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v5 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__50;
  v14 = __Block_byref_object_dispose__50;
  v15 = 0;
  if (self->_numberOfColumns >= 2)
  {
    -[SUUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __84__SUUIGridViewElementPageSectionConfiguration__cardArtworkBoundingSizeForIndexPath___block_invoke;
    v9[3] = &unk_2511FA670;
    v9[6] = v6;
    v9[4] = self;
    v9[5] = &v10;
    -[SUUIGridViewElementPageSectionConfiguration _enumerateViewElementsForRowOfIndexPath:usingBlock:](self, "_enumerateViewElementsForRowOfIndexPath:usingBlock:", v4, v9);
    v5 = (void *)v11[5];
  }
  v7 = v5;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __84__SUUIGridViewElementPageSectionConfiguration__cardArtworkBoundingSizeForIndexPath___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  SUUISizeValue *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "viewElementIsStandardCard:"))
  {
    +[SUUICardViewElementCollectionViewCell artworkBoundingSizeWithViewElement:width:context:](SUUICardViewElementCollectionViewCell, "artworkBoundingSizeWithViewElement:width:context:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240), *(double *)(a1 + 48));
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      objc_msgSend(v5, "unionWithSize:", v3, v4);
    }
    else
    {
      v6 = -[SUUISizeValue initWithSize:]([SUUISizeValue alloc], "initWithSize:", v3, v4);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }

}

- (Class)_cardCellClassForCard:(id)a3
{
  objc_msgSend(a3, "cardType");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (double)_cellContentWidth
{
  double result;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  double v16;
  double cellContentWidth;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  result = self->_cellContentWidth;
  if (result >= 0.00000011920929)
    return result;
  result = self->_gridViewElementStyleItemWidth;
  if (result <= 0.00000011920929)
  {
    -[SUUIGridViewElementPageSectionConfiguration columnContentWidth](self, "columnContentWidth");
    v8 = v7;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_viewElements;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (!v10)
      goto LABEL_36;
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "elementType", (_QWORD)v18);
        if (v15 == 66)
        {
          if (objc_msgSend(v14, "lockupViewType") == 7)
          {
            -[SUUIGridViewElementPageSectionConfiguration columnWidth](self, "columnWidth");
LABEL_33:
            self->_cellContentWidth = v16;
            continue;
          }
          if (objc_msgSend(v14, "lockupViewType") == 2 && v8 <= 0.0)
          {
            +[SUUIHorizontalLockupCollectionViewCell preferredSizeForViewElement:context:](SUUIHorizontalLockupCollectionViewCell, "preferredSizeForViewElement:context:", v14, self->_cellLayoutContext);
            -[SUUIGridViewElementPageSectionConfiguration _columnContentWidthPaddingForWidth:](self, "_columnContentWidthPaddingForWidth:");
            cellContentWidth = self->_cellContentWidth;
LABEL_31:
            if (cellContentWidth >= v16)
              v16 = cellContentWidth;
            goto LABEL_33;
          }
LABEL_28:
          v16 = self->_cellContentWidth;
          if (v16 < v8)
            v16 = v8;
          goto LABEL_33;
        }
        if (v15 != 48)
        {
          if (v15 == 14
            && -[SUUIGridViewElementPageSectionConfiguration viewElementIsStandardCard:](self, "viewElementIsStandardCard:", v14))
          {
            +[SUUICardViewElementCollectionViewCell preferredSizeForViewElement:context:](SUUICardViewElementCollectionViewCell, "preferredSizeForViewElement:context:", v14, self->_cellLayoutContext);
            cellContentWidth = self->_cellContentWidth;
            if (v16 >= v8)
              v16 = v8;
            goto LABEL_31;
          }
          goto LABEL_28;
        }
        v16 = v8;
        if (self->_cellContentWidth < 0.00000011920929)
          goto LABEL_33;
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v16);
      if (!v11)
      {
LABEL_36:

        return self->_cellContentWidth;
      }
    }
  }
  if (self->_gridViewElementStyleItemWidthIsPercentage)
  {
    v4 = result / 100.0;
    v5 = 1.0;
    if (v4 <= 1.0)
    {
      v5 = v4;
      if (v4 < 0.00000011920929)
        v5 = 0.0;
    }
    -[SUUIGridViewElementPageSectionConfiguration columnWidth](self, "columnWidth");
    result = v5 * v6;
  }
  self->_cellContentWidth = result;
  return result;
}

- (double)_cellHeightForViewElement:(id)a3 width:(double)a4
{
  id v6;
  objc_class *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  void *v16;
  float v17;

  v6 = a3;
  v7 = -[SUUIGridViewElementPageSectionConfiguration cellClassForViewElement:](self, "cellClassForViewElement:", v6);
  if (v7)
  {
    -[objc_class sizeThatFitsWidth:viewElement:context:](v7, "sizeThatFitsWidth:viewElement:context:", v6, self->_cellLayoutContext, a4);
    v9 = v8;
  }
  else
  {
    v9 = 0.0;
  }
  objc_msgSend(v6, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemHeight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "floatValue");
    v14 = v13;
  }
  else
  {
    objc_msgSend(v10, "rowHeight");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "floatValue");
      v14 = v17;
    }
    else
    {
      v14 = 0.0;
    }

  }
  if (v9 < v14)
    v9 = v14;

  return v9;
}

- (UIEdgeInsets)_cellInsetsForViewElement:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  char v32;
  double v33;
  double v34;
  double v35;
  void *v36;
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
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  char v58;
  UIEdgeInsets result;

  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BEBE158];
  v57 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v9 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v10 = *(double *)(MEMORY[0x24BEBE158] + 24);
  objc_msgSend(v6, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v12 = SUUIViewElementPaddingForStyle(v11, &v58);
  if (v58)
  {
    v16 = v8 + v12;
    v17 = v9 + v14;
    v18 = v57 + v13;
    v19 = v10 + v15;
    goto LABEL_18;
  }
  v19 = v10;
  v17 = v9;
  v18 = v57;
  v16 = v8;
  if (!self->_hasGridViewElementStyle)
  {
    v20 = objc_msgSend(v6, "elementType", v12);
    if (v20 > 47)
    {
      if (v20 == 48)
      {
        v17 = v9 + 10.0;
        v16 = v8 + 4.0;
        -[SUUIGridViewElementPageSectionConfiguration _cellPaddingLeftEdgeHorizontal](self, "_cellPaddingLeftEdgeHorizontal");
        v18 = v57 + v50;
        -[SUUIGridViewElementPageSectionConfiguration _cellPaddingRightEdgeHorizontal](self, "_cellPaddingRightEdgeHorizontal");
        v19 = v10 + v51;
        goto LABEL_18;
      }
      if (v20 != 141 && v20 != 50)
      {
LABEL_14:
        v21 = 10.0;
LABEL_15:
        v17 = v9 + v21;
LABEL_16:
        v16 = v8 + v21;
LABEL_17:
        v19 = v10;
        v18 = v57;
        goto LABEL_18;
      }
    }
    else if ((unint64_t)(v20 - 12) >= 2)
    {
      if (v20 == 14
        && -[SUUIGridViewElementPageSectionConfiguration viewElementIsStandardCard:](self, "viewElementIsStandardCard:", v6))
      {
        v19 = v10;
        v17 = v9;
        v18 = v57;
        v16 = v8;
        switch(self->_cardVerticalSpacingStyle)
        {
          case 0:
          case 4:
            v17 = v9 + 30.0;
            v21 = 20.0;
            goto LABEL_16;
          case 1:
            v21 = 25.0;
            goto LABEL_15;
          case 2:
            v17 = v9 + 24.0;
            v21 = 33.0;
            goto LABEL_16;
          case 3:
            objc_msgSend(v6, "firstChildForElementType:", 66);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52)
              v17 = v9 + 20.0;
            else
              v17 = v9;
            if (v52)
              v16 = v8 + 30.0;
            else
              v16 = v8 + 25.0;
            goto LABEL_17;
          default:
            goto LABEL_18;
        }
        goto LABEL_18;
      }
      goto LABEL_14;
    }
    v17 = v9 + 12.0;
    v21 = 11.0;
    goto LABEL_16;
  }
LABEL_18:
  if (objc_msgSend(v6, "elementType") != 48)
  {
    v55 = v16;
    v56 = v17;
    -[SUUIGridViewElementPageSectionConfiguration _cellPaddingInteriorHorizontal](self, "_cellPaddingInteriorHorizontal");
    v23 = v19 + v18 + v22 * 2.0;
    -[SUUIGridViewElementPageSectionConfiguration columnContentWidth](self, "columnContentWidth");
    v25 = v23 + v24;
    -[SUUIGridViewElementPageSectionConfiguration columnWidth](self, "columnWidth");
    v27 = v25 <= v26;
    if (v25 <= v26)
      v28 = v19;
    else
      v28 = 0.0;
    if (v27)
      v29 = v18;
    else
      v29 = 0.0;
    -[SUUIGridViewElementPageSectionConfiguration _cellPaddingInteriorHorizontal](self, "_cellPaddingInteriorHorizontal");
    v31 = v30;
    v32 = -[SUUIGridViewElementPageSectionConfiguration positionForIndexPath:](self, "positionForIndexPath:", v7);
    if ((v32 & 1) != 0)
    {
      -[SUUIGridViewElementPageSectionConfiguration _cellPaddingLeftEdgeHorizontal](self, "_cellPaddingLeftEdgeHorizontal");
      v35 = v34;
      v33 = v31;
    }
    else
    {
      if ((v32 & 4) != 0)
        -[SUUIGridViewElementPageSectionConfiguration _cellPaddingRightEdgeHorizontal](self, "_cellPaddingRightEdgeHorizontal");
      else
        v33 = v31;
      v35 = v31;
    }
    v18 = v29 + v35;
    v19 = v28 + v33;
    if (objc_msgSend(v6, "elementType") == 66)
    {
      v53 = v9;
      v54 = v10;
      -[SUUIGridViewElementPageSectionConfiguration cellLayoutContext](self, "cellLayoutContext");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "largeScreenElementPadding");
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v44 = v43;

      if (v57 != v40 || v8 != v38 || v54 != v44 || v53 != v42)
      {
        v19 = v44;
        v55 = v38;
        v56 = v42;
        v18 = v40;
      }
      v45 = -0.0;
      if (self->_gridViewElementStyleItemWidthIsPercentage)
        v45 = v31;
      v17 = v56 + v45;
      v16 = v55 + v45;
    }
    else
    {
      v17 = v56;
    }
  }

  v46 = v16;
  v47 = v18;
  v48 = v17;
  v49 = v19;
  result.right = v49;
  result.bottom = v48;
  result.left = v47;
  result.top = v46;
  return result;
}

- (double)_cellPaddingInteriorHorizontal
{
  -[SUUIGridViewElementPageSectionConfiguration _reloadCellPaddingIfNeeded](self, "_reloadCellPaddingIfNeeded");
  return self->_cellPaddingInteriorHorizontal;
}

- (double)_cellPaddingLeftEdgeHorizontal
{
  -[SUUIGridViewElementPageSectionConfiguration _reloadCellPaddingIfNeeded](self, "_reloadCellPaddingIfNeeded");
  return self->_cellPaddingLeftEdgeHorizontal;
}

- (double)_cellPaddingRightEdgeHorizontal
{
  -[SUUIGridViewElementPageSectionConfiguration _reloadCellPaddingIfNeeded](self, "_reloadCellPaddingIfNeeded");
  return self->_cellPaddingRightEdgeHorizontal;
}

- (double)_columnContentWidthPaddingForWidth:(double)a3
{
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = -[SUUIGridViewElementPageSectionConfiguration _useOrdinalPadding](self, "_useOrdinalPadding");
  -[SUUIGridViewElementPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "horizontalPadding");
  v8 = a3 - v7;
  v9 = a3 + v7 * -2.0;
  if (v5)
    v10 = v8;
  else
    v10 = v9;

  return v10;
}

- (void)_enumerateViewElementsForRowOfIndexPath:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, _BYTE *);
  uint64_t v8;
  uint64_t v9;
  int64_t numberOfGridItems;
  void *v11;
  int64_t v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v6 = a3;
  v7 = (void (**)(id, void *, void *, _BYTE *))a4;
  v8 = objc_msgSend(v6, "item") / self->_numberOfColumns * self->_numberOfColumns;
  v18 = v6;
  v9 = objc_msgSend(v6, "section");
  v19 = 0;
  numberOfGridItems = self->_numberOfGridItems;
  -[SUUIGridViewElementPageSectionConfiguration dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  do
  {
    if (v12 >= self->_numberOfColumns + v8 || v12 >= numberOfGridItems)
      break;
    v14 = (void *)MEMORY[0x2426A2860]();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v12, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "gridViewElementPageSectionConfiguration:viewElementForIndexPath:", self, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 && objc_msgSend(v16, "elementType") != 48)
      v7[2](v7, v17, v15, &v19);

    objc_autoreleasePoolPop(v14);
    ++v12;
  }
  while (!v19);

}

- (BOOL)_isContainedWithinExploreTemplateWithGridViewElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    do
    {
      v6 = objc_msgSend(v5, "elementType");
      objc_msgSend(v5, "parent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v7;
      v8 = v6 == 37;
    }
    while (!v8 && v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_lockupCellReuseIdentifierWithLockup:(id)a3
{
  unint64_t v3;
  id v4;

  v3 = -[SUUIGridViewElementPageSectionConfiguration _lockupTypeForLockup:](self, "_lockupTypeForLockup:", a3);
  if (v3 <= 8)
    v4 = (id)*off_2511FA700[v3];
  return v4;
}

- (int64_t)_lockupTypeForLockup:(id)a3
{
  int64_t result;

  result = self->_lockupType;
  if (result == -1)
    return objc_msgSend(a3, "lockupViewType");
  return result;
}

- (UIEdgeInsets)_normalizedContentInsetForViewElement:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[4];
  id v21;
  SUUIGridViewElementPageSectionConfiguration *v22;
  uint64_t *v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  const char *v27;
  __int128 v28;
  __int128 v29;
  UIEdgeInsets result;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = (double *)&v24;
  v26 = 0x4010000000;
  v27 = "";
  v28 = 0u;
  v29 = 0u;
  -[SUUIGridViewElementPageSectionConfiguration _cellInsetsForViewElement:indexPath:](self, "_cellInsetsForViewElement:indexPath:", v6, v7);
  *(_QWORD *)&v28 = v8;
  *((_QWORD *)&v28 + 1) = v9;
  *(_QWORD *)&v29 = v10;
  *((_QWORD *)&v29 + 1) = v11;
  if (objc_msgSend(v6, "elementType") != 48)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __95__SUUIGridViewElementPageSectionConfiguration__normalizedContentInsetForViewElement_indexPath___block_invoke;
    v20[3] = &unk_2511FA698;
    v21 = v6;
    v22 = self;
    v23 = &v24;
    -[SUUIGridViewElementPageSectionConfiguration _enumerateViewElementsForRowOfIndexPath:usingBlock:](self, "_enumerateViewElementsForRowOfIndexPath:usingBlock:", v7, v20);

  }
  v12 = v25[4];
  v13 = v25[5];
  v14 = v25[6];
  v15 = v25[7];
  _Block_object_dispose(&v24, 8);

  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

uint64_t __95__SUUIGridViewElementPageSectionConfiguration__normalizedContentInsetForViewElement_indexPath___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;

  if (*(_QWORD *)(result + 32) != a2)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 40), "_cellInsetsForViewElement:indexPath:", a2, a3);
    v6 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8);
    v7 = *(double *)(v6 + 48);
    if (v7 < v5)
      v7 = v5;
    *(double *)(v6 + 48) = v7;
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8);
    if (*(double *)(v8 + 32) >= v4)
      v4 = *(double *)(v8 + 32);
    *(double *)(v8 + 32) = v4;
  }
  return result;
}

- (int64_t)_numberOfColumnsForWidth:(double)a3 style:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "columnCount");
    v9 = -[SUUIStorePageSectionContext layoutStyle](self->_pageSectionContext, "layoutStyle");
    if (v8 != -1)
    {
      if ((float)((float)v8 * 320.0) + 320.0 <= a3)
        ++v8;
      goto LABEL_18;
    }
  }
  else
  {
    v9 = -[SUUIStorePageSectionContext layoutStyle](self->_pageSectionContext, "layoutStyle");
  }
  v10 = (uint64_t)(a3 / 320.0);
  if (v10 <= 1)
    v10 = 1;
  if ((unint64_t)v10 >= 3)
    v10 = 3;
  v11 = 1;
  if (a3 >= 640.0)
    v11 = 2;
  if (v9 == 2)
    v10 = v11;
  if (v9 == 1)
    v8 = 1;
  else
    v8 = v10;
LABEL_18:

  return v8;
}

- (void)_reloadCellPaddingIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  CGFloat left;
  CGFloat right;
  float v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  int64_t numberOfColumns;
  float v22;
  double v23;
  float v24;
  double v25;
  double v26;
  double v27;

  if (self->_cellPaddingNeedsReloading)
  {
    -[SUUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth");
    if (v3 <= 0.0)
    {
      -[SUUIGridViewElementPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "horizontalPadding");
      v7 = v9 + v9;

    }
    else
    {
      -[SUUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth");
      v5 = v4;
      -[SUUIGridViewElementPageSectionConfiguration _cellContentWidth](self, "_cellContentWidth");
      *(float *)&v6 = v5 - v6 * (double)self->_numberOfColumns;
      v7 = floorf(*(float *)&v6);
    }
    v10 = -[SUUIGridViewElementPageSectionConfiguration _useOrdinalPadding](self, "_useOrdinalPadding");
    v11 = v10;
    if (self->_numberOfColumns > 1)
    {
      if (self->_hasGridViewElementStyle)
      {
        left = self->_gridViewElementStyleElementPadding.left;
        right = self->_gridViewElementStyleElementPadding.right;
      }
      else
      {
        -[SUUIGridViewElementPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "horizontalPadding");
        left = v17;

        if (v11)
        {
          right = left;
          left = 0.0;
        }
        else
        {
          -[SUUIGridViewElementPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "horizontalPadding");
          right = v19;

        }
      }
      if (!self->_gridViewElementStyleItemWidthIsPercentage)
      {
        self->_cellPaddingLeftEdgeHorizontal = left;
        self->_cellPaddingRightEdgeHorizontal = right;
        numberOfColumns = self->_numberOfColumns;
        v22 = (v7 - left - right) / (double)(numberOfColumns - 1) * 0.5;
        v23 = floorf(v22);
        self->_cellPaddingInteriorHorizontal = v23;
        if (right < v23)
        {
          v24 = v7 / (float)((float)(numberOfColumns + 1) + (float)(numberOfColumns + 1));
          v25 = floorf(v24);
          v26 = v25 + v25;
          self->_cellPaddingRightEdgeHorizontal = v25 + v25;
          v27 = fmax(left - right, 0.0);
          if (v11)
            v26 = v27;
          self->_cellPaddingInteriorHorizontal = v25;
          self->_cellPaddingLeftEdgeHorizontal = v26;
        }
        goto LABEL_25;
      }
      self->_cellPaddingLeftEdgeHorizontal = 0.0;
      self->_cellPaddingRightEdgeHorizontal = 0.0;
      if (!self->_hasGridViewElementStyle)
      {
        self->_cellPaddingInteriorHorizontal = 0.0;
        goto LABEL_25;
      }
      v20 = self->_gridViewElementStyleElementPadding.left;
      if (v20 < self->_gridViewElementStyleElementPadding.right)
        v20 = self->_gridViewElementStyleElementPadding.right;
      v15 = v20 * 0.5;
    }
    else
    {
      if (v10)
      {
        self->_cellPaddingLeftEdgeHorizontal = 0.0;
        self->_cellPaddingRightEdgeHorizontal = v7;
        self->_cellPaddingInteriorHorizontal = v7;
LABEL_25:
        self->_cellPaddingNeedsReloading = 0;
        return;
      }
      v14 = v7 * 0.5;
      v15 = floorf(v14);
      self->_cellPaddingLeftEdgeHorizontal = v15;
      self->_cellPaddingRightEdgeHorizontal = v15;
    }
    self->_cellPaddingInteriorHorizontal = v15;
    goto LABEL_25;
  }
}

- (BOOL)_useOrdinalPadding
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[NSArray firstObject](self->_viewElements, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "elementType") == 48 && -[NSArray count](self->_viewElements, "count") >= 2)
  {
    -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (objc_msgSend(v3, "elementType") == 66)
  {
    -[SUUIViewElementLayoutContext largeScreenElementPadding](self->_cellLayoutContext, "largeScreenElementPadding");
    if (*(double *)(MEMORY[0x24BEBE158] + 8) == v8
      && *MEMORY[0x24BEBE158] == v5
      && *(double *)(MEMORY[0x24BEBE158] + 24) == v7
      && *(double *)(MEMORY[0x24BEBE158] + 16) == v6)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __65__SUUIGridViewElementPageSectionConfiguration__useOrdinalPadding__block_invoke;
      v14[3] = &unk_2511F4B90;
      v14[4] = &v15;
      objc_msgSend(v3, "enumerateChildrenUsingBlock:", v14);
    }
  }
  v12 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t __65__SUUIGridViewElementPageSectionConfiguration__useOrdinalPadding__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "elementType");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == 80;
  *a3 = 1;
  return result;
}

- (SUUIViewElementLayoutContext)cellLayoutContext
{
  return self->_cellLayoutContext;
}

- (void)setCellLayoutContext:(id)a3
{
  objc_storeStrong((id *)&self->_cellLayoutContext, a3);
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (SUUIStorePageSectionContext)pageSectionContext
{
  return self->_pageSectionContext;
}

- (void)setPageSectionContext:(id)a3
{
  objc_storeStrong((id *)&self->_pageSectionContext, a3);
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  self->_rendersWithPerspective = a3;
}

- (BOOL)showsEditMode
{
  return self->_showsEditMode;
}

- (SUUIGridViewElementPageSectionConfigurationDataSource)dataSource
{
  return (SUUIGridViewElementPageSectionConfigurationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_pageSectionContext, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_positions, 0);
}

@end
