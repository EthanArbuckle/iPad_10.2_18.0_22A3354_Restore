@implementation SUUIShelfPageSectionConfiguration

- (UICollectionView)existingShelfCollectionView
{
  return self->_shelfCollectionView;
}

- (unint64_t)numberOfIterations
{
  return 1;
}

- (UICollectionView)shelfCollectionView
{
  UICollectionView *shelfCollectionView;
  void *v4;
  id v5;
  UICollectionView *v6;
  UICollectionView *v7;
  UICollectionView *v8;

  shelfCollectionView = self->_shelfCollectionView;
  if (!shelfCollectionView)
  {
    -[SUUIShelfPageSectionConfiguration _styledShelfCollectionViewLayoutForExistingLayout:](self, "_styledShelfCollectionViewLayoutForExistingLayout:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BEBD450]);
    v6 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v7 = self->_shelfCollectionView;
    self->_shelfCollectionView = v6;

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251211FE8);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251209A48);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x25120FE88);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251210428);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251205968);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251211F68);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_shelfCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x25120A268);
    -[UICollectionView setAlwaysBounceHorizontal:](self->_shelfCollectionView, "setAlwaysBounceHorizontal:", 1);
    -[UICollectionView setBackgroundColor:](self->_shelfCollectionView, "setBackgroundColor:", self->_shelfCollectionViewBackgroundColor);
    -[UICollectionView setClipsToBounds:](self->_shelfCollectionView, "setClipsToBounds:", objc_msgSend((id)objc_opt_class(), "collectionViewCanClipToBounds"));
    -[UICollectionView setDataSource:](self->_shelfCollectionView, "setDataSource:", self->_shelfCollectionViewDataSource);
    v8 = self->_shelfCollectionView;
    objc_msgSend((id)objc_opt_class(), "snapToBoundariesDecelerationRate");
    -[UICollectionView setDecelerationRate:](v8, "setDecelerationRate:");
    -[UICollectionView setDelegate:](self->_shelfCollectionView, "setDelegate:", self->_shelfCollectionViewDelegate);
    -[UICollectionView setScrollsToTop:](self->_shelfCollectionView, "setScrollsToTop:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](self->_shelfCollectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setShowsVerticalScrollIndicator:](self->_shelfCollectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setPrefetchingEnabled:](self->_shelfCollectionView, "setPrefetchingEnabled:", 0);
    if (self->_rendersWithPerspective)
      -[UICollectionView setClipsToBounds:](self->_shelfCollectionView, "setClipsToBounds:", 0);

    shelfCollectionView = self->_shelfCollectionView;
  }
  return shelfCollectionView;
}

- (void)setShelfCollectionViewBackgroundColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_shelfCollectionViewBackgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_shelfCollectionViewBackgroundColor, a3);
    -[UICollectionView setBackgroundColor:](self->_shelfCollectionView, "setBackgroundColor:", v5);
  }

}

- (void)setShelfCollectionViewDataSource:(id)a3
{
  if (self->_shelfCollectionViewDataSource != a3)
  {
    self->_shelfCollectionViewDataSource = (UICollectionViewDataSource *)a3;
    -[UICollectionView setDataSource:](self->_shelfCollectionView, "setDataSource:");
  }
}

- (void)setShelfCollectionViewDelegate:(id)a3
{
  if (self->_shelfCollectionViewDelegate != a3)
  {
    self->_shelfCollectionViewDelegate = (UICollectionViewDelegate *)a3;
    -[UICollectionView setDelegate:](self->_shelfCollectionView, "setDelegate:");
  }
}

- (void)setShelfViewElementStyle:(id)a3
{
  void *v5;
  float v6;
  double v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  UICollectionView *shelfCollectionView;
  void *v16;
  void *v17;
  UICollectionView *v18;
  IKViewElementStyle *v19;

  v19 = (IKViewElementStyle *)a3;
  if (self->_shelfViewElementStyle != v19)
  {
    objc_storeStrong((id *)&self->_shelfViewElementStyle, a3);
    -[IKViewElementStyle valueForStyle:](self->_shelfViewElementStyle, "valueForStyle:", CFSTR("itml-shelf-zooming-layout-peeking-item-width"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

    -[IKViewElementStyle valueForStyle:](self->_shelfViewElementStyle, "valueForStyle:", CFSTR("itml-shelf-zooming-layout-inter-item-spacing"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    self->_zoomingShelfLayoutInterItemSpacing = v9;

    -[IKViewElementStyle valueForStyle:](self->_shelfViewElementStyle, "valueForStyle:", CFSTR("itml-shelf-zooming-layout-item-width"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    self->_zoomingShelfLayoutItemWidth = v11;

    -[IKViewElementStyle valueForStyle:](self->_shelfViewElementStyle, "valueForStyle:", CFSTR("itml-shelf-zooming-layout-zoomed-item-width"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    self->_zoomingShelfLayoutScaledItemWidth = v13;

    self->_zoomingShelfLayoutFocusedItemHorizontalCenterOffset = self->_zoomingShelfLayoutInterItemSpacing
                                                               + v7
                                                               + self->_zoomingShelfLayoutScaledItemWidth * 0.5;
    -[IKViewElementStyle valueForStyle:](self->_shelfViewElementStyle, "valueForStyle:", CFSTR("itml-shelf-layout"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_wantsZoomingShelfLayout = objc_msgSend(v14, "isEqualToString:", CFSTR("zooming"));

    -[SUUIShelfPageSectionConfiguration _updateShelfLayoutDataContentInset](self, "_updateShelfLayoutDataContentInset");
    shelfCollectionView = self->_shelfCollectionView;
    if (shelfCollectionView)
    {
      -[UICollectionView collectionViewLayout](shelfCollectionView, "collectionViewLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIShelfPageSectionConfiguration _styledShelfCollectionViewLayoutForExistingLayout:](self, "_styledShelfCollectionViewLayoutForExistingLayout:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 != v17)
      {
        -[UICollectionView setCollectionViewLayout:](self->_shelfCollectionView, "setCollectionViewLayout:", v17);
        v18 = self->_shelfCollectionView;
        objc_msgSend((id)objc_opt_class(), "snapToBoundariesDecelerationRate");
        -[UICollectionView setDecelerationRate:](v18, "setDecelerationRate:");
        -[UICollectionView setClipsToBounds:](self->_shelfCollectionView, "setClipsToBounds:", objc_msgSend((id)objc_opt_class(), "collectionViewCanClipToBounds"));
      }

    }
  }

}

- (id)actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:(id)a3 numberOfShelfItems:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[SUUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations") == 1)
  {
    v7 = v6;
  }
  else
  {
    v8 = objc_msgSend(v6, "item");
    -[SUUIShelfPageSectionConfiguration shelfCollectionView](self, "shelfCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathsForVisibleItems");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
LABEL_5:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
        if (objc_msgSend(v15, "item", (_QWORD)v27) % a4 == v8)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v12)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v7 = v15;

      if (v7)
        goto LABEL_24;
    }
    else
    {
LABEL_11:

    }
    if (objc_msgSend(v10, "count", (_QWORD)v27))
    {
      objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v17;
      if (v17 != v18)
      {
        v20 = objc_msgSend(v17, "item") % a4;
        v21 = objc_msgSend(v18, "item") % a4;
        v22 = v20 - v8;
        if ((uint64_t)(v20 - v8) < 0)
          v22 = v8 - v20;
        v23 = v21 - v8;
        if (v23 < 0)
          v23 = -v23;
        if (v22 >= v23)
          v19 = v18;
        else
          v19 = v17;
      }
      v24 = v19;
      v25 = objc_msgSend(v24, "item");
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v8 + v25 / a4 * a4, objc_msgSend(v6, "section"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v16;
    }
    else
    {
      v7 = v6;
    }
LABEL_24:

  }
  return v7;
}

uint64_t __127__SUUIShelfPageSectionConfiguration_actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath_numberOfShelfItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "item");
  v6 = objc_msgSend(v4, "item");

  v7 = -1;
  if (v5 >= v6)
    v7 = 1;
  if (v5 == v6)
    return 0;
  else
    return v7;
}

- (id)backgroundColorForShelfViewElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ikBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cellForShelfViewElement:(id)a3 indexPath:(id)a4
{
  SUUIStorePageSectionContext *pageSectionContext;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  pageSectionContext = self->_pageSectionContext;
  v6 = a4;
  -[SUUIStorePageSectionContext collectionView](pageSectionContext, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x25120BEC8, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIShelfPageSectionConfiguration shelfCollectionView](self, "shelfCollectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCollectionView:", v9);
  if (self->_needsShelfCollectionViewReload)
  {
    objc_msgSend(v9, "reloadData");
    self->_needsShelfCollectionViewReload = 0;
  }
  if (self->_rendersWithPerspective)
  {
    -[SUUIShelfLayoutData totalContentSize](self->_shelfLayoutData, "totalContentSize");
    -[SUUIShelfPageSectionConfiguration _perspectiveHeightForContentSize:](self, "_perspectiveHeightForContentSize:", v10);
    objc_msgSend(v8, "setContentInset:");
    objc_msgSend(v8, "setRendersWithPerspective:", 1);
  }
  else
  {
    objc_msgSend(v8, "setContentInset:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
    objc_msgSend(v8, "setRendersWithPerspective:", 0);
    objc_msgSend(v8, "setRendersWithParallax:", 0);
  }

  return v8;
}

- (CGSize)cellSizeForShelfViewElement:(id)a3 indexPath:(id)a4 numberOfShelfItems:(int64_t)a5
{
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[SUUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth", a3, a4);
  v8 = v7;
  if (self->_needsShelfCollectionViewLayout)
  {
    v9 = -[SUUIShelfPageSectionConfiguration _reloadShelfLayoutDataWithNumberOfShelfItems:](self, "_reloadShelfLayoutDataWithNumberOfShelfItems:", a5);
    self->_needsShelfCollectionViewLayout = 0;
  }
  -[SUUIShelfLayoutData totalContentSize](self->_shelfLayoutData, "totalContentSize");
  v11 = v10;
  if (self->_rendersWithPerspective)
  {
    -[SUUIShelfPageSectionConfiguration _perspectiveHeightForContentSize:](self, "_perspectiveHeightForContentSize:", v10);
    v11 = v11 + v12;
  }
  if (self->_wantsZoomingShelfLayout)
    v11 = v11 + self->_zoomingShelfLayoutScaledItemWidth - self->_zoomingShelfLayoutItemWidth;
  v13 = v8;
  v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)cellForShelfItemViewElement:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  SUUIStorePageSectionContext *pageSectionContext;
  id v21;
  void *v22;
  void *v23;
  CGRect v25;

  v6 = a3;
  v7 = a4;
  -[SUUIShelfPageSectionConfiguration shelfCollectionView](self, "shelfCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:](self, "effectiveViewElementForShelfItemViewElement:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "elementType");
  v11 = 0;
  if (v10 <= 48)
  {
    if (v10 == 14)
    {
      if (objc_msgSend(v6, "cardType") != 3)
      {
        objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x251211FE8, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setArtworkBoundingSize:", 0);
        goto LABEL_14;
      }
      v12 = CFSTR("SUUIEditorialCardCellReuseIdentifier");
    }
    else
    {
      if (v10 != 28)
        goto LABEL_14;
      v12 = CFSTR("SUUICounterReuseIdentifier");
    }
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v10 == 49)
  {
LABEL_5:
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x251205968, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShowsReflectionImage:", 0);
    goto LABEL_14;
  }
  if (v10 != 66)
  {
    if (v10 != 152)
      goto LABEL_14;
    goto LABEL_5;
  }
  -[SUUIShelfPageSectionConfiguration shelfCollectionView](self, "shelfCollectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShelfPageSectionConfiguration _dequeueCellForLockup:collectionView:indexPath:](self, "_dequeueCellForLockup:collectionView:indexPath:", v9, v13, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  -[SUUIShelfLayoutData sizeForItemAtIndex:](self->_shelfLayoutData, "sizeForItemAtIndex:", objc_msgSend(v7, "item"));
  v15 = v14;
  objc_msgSend(v9, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "visibility");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("hidden"));

  if (v18)
    v19 = 0;
  else
    v19 = v9;
  objc_msgSend(v11, "reloadWithViewElement:width:context:", v19, self->_cellLayoutContext, v15);
  if (self->_rendersWithPerspective && objc_msgSend(v11, "conformsToProtocol:", &unk_2571FE3F0))
  {
    pageSectionContext = self->_pageSectionContext;
    v21 = v11;
    -[SUUIStorePageSectionContext parentViewController](pageSectionContext, "parentViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setPerspectiveTargetView:", v23);
    objc_msgSend(v23, "bounds");
    objc_msgSend(v21, "setVanishingPoint:", CGRectGetMidX(v25), -800.0);

  }
  return v11;
}

- (id)effectiveViewElementForShelfItemViewElement:(id)a3
{
  return a3;
}

- (int64_t)lockupTypeForLockup:(id)a3
{
  int64_t result;

  result = self->_lockupType;
  if (result == -1)
    return objc_msgSend(a3, "lockupViewType");
  return result;
}

- (id)normalizedShelfItemIndexPathFromActualIndexPath:(id)a3 numberOfShelfItems:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  if (-[SUUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations") == 1)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(v6, "item") % a4, objc_msgSend(v6, "section"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (unint64_t)numberOfCellsForNumberOfShelfItems:(unint64_t)a3
{
  return -[SUUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations") * a3;
}

- (int64_t)numberOfSectionCells
{
  return 1;
}

- (BOOL)prefetchResourcesForShelfItemViewElement:(id)a3 reason:(int64_t)a4
{
  void *v6;

  -[SUUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:](self, "effectiveViewElementForShelfItemViewElement:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[objc_class prefetchResourcesForViewElement:reason:context:](-[SUUIShelfPageSectionConfiguration _cellClassForEffectiveShelfItemViewElement:](self, "_cellClassForEffectiveShelfItemViewElement:", v6), "prefetchResourcesForViewElement:reason:context:", v6, a4, self->_cellLayoutContext);

  return a4;
}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x25120BEC8);

}

- (void)reloadLockupTypeForShelfViewElement:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;

  objc_msgSend(a3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockupType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7)
  {
    v6 = SUUILockupViewTypeForString(v7);
    v5 = v7;
  }
  else
  {
    v6 = -1;
  }
  self->_lockupType = v6;

}

- (void)reloadShelfLayoutDataForShelfViewElement:(id)a3 withShelfItemViewElements:(id)a4 requestCellLayouts:(BOOL)a5 numberOfShelfItems:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  SUUIShelfLayoutData *v12;
  uint64_t v13;
  double v14;
  double v15;
  SUUIShelfLayoutData *v16;
  SUUIShelfLayoutData *shelfLayoutData;
  void *v18;
  unint64_t v19;
  int64_t v20;
  SUUIShelfLayoutData *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  SUUIShelfPageSectionConfiguration *v25;
  int64_t v26;
  int64_t v27;
  unint64_t v28;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [SUUIShelfLayoutData alloc];
  v13 = objc_msgSend(v11, "numberOfRows");

  -[SUUIShelfPageSectionConfiguration _columnSpacingForShelfItemViewElements:](self, "_columnSpacingForShelfItemViewElements:", v10);
  v15 = v14;

  v16 = -[SUUIShelfLayoutData initWithNumberOfRows:columnSpacing:](v12, "initWithNumberOfRows:columnSpacing:", v13, v15);
  shelfLayoutData = self->_shelfLayoutData;
  self->_shelfLayoutData = v16;

  -[SUUIShelfPageSectionConfiguration _updateShelfLayoutDataContentInset](self, "_updateShelfLayoutDataContentInset");
  -[SUUIShelfPageSectionConfiguration _reloadShelfLayoutDataWithNumberOfShelfItems:](self, "_reloadShelfLayoutDataWithNumberOfShelfItems:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v19 = -[SUUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations");
    v20 = -[SUUIShelfLayoutData numberOfRows](self->_shelfLayoutData, "numberOfRows");
    v21 = self->_shelfLayoutData;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __142__SUUIShelfPageSectionConfiguration_reloadShelfLayoutDataForShelfViewElement_withShelfItemViewElements_requestCellLayouts_numberOfShelfItems___block_invoke;
    v23[3] = &unk_2511F97F8;
    v26 = v20;
    v27 = a6;
    v28 = v19;
    v24 = v18;
    v25 = self;
    -[SUUIShelfLayoutData enumerateColumnsUsingBlock:](v21, "enumerateColumnsUsingBlock:", v23);

  }
  -[UICollectionView collectionViewLayout](self->_shelfCollectionView, "collectionViewLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLayoutData:", self->_shelfLayoutData);

}

void __142__SUUIShelfPageSectionConfiguration_reloadShelfLayoutDataForShelfViewElement_withShelfItemViewElements_requestCellLayouts_numberOfShelfItems___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = *(_QWORD *)(a1 + 48);
  if (v3 >= 1)
  {
    v6 = 0;
    v7 = v3 * a2;
    do
    {
      v8 = v7 + v6;
      v9 = *(_QWORD *)(a1 + 56);
      if (v7 + v6 >= (unint64_t)(*(_QWORD *)(a1 + 64) * v9))
        break;
      v10 = v8 % v9;
      v11 = *(void **)(a1 + 32);
      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8 % v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          continue;
      }
      objc_msgSend(*(id *)(a1 + 40), "_shelfItemViewElementAtIndex:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "requestCellLayoutForViewElement:withColumnWidth:", v14, a3);
      v15 = *(void **)(a1 + 32);
      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObjectForKey:", v16);

      }
      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 48));
  }
}

- (void)requestCellLayoutForViewElement:(id)a3 withColumnWidth:(double)a4
{
  id v6;

  -[SUUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:](self, "effectiveViewElementForShelfItemViewElement:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[objc_class requestLayoutForViewElement:width:context:](-[SUUIShelfPageSectionConfiguration _cellClassForEffectiveShelfItemViewElement:](self, "_cellClassForEffectiveShelfItemViewElement:", v6), "requestLayoutForViewElement:width:context:", v6, self->_cellLayoutContext, a4);

}

- (UIEdgeInsets)sectionContentInsetAdjustedFromValue:(UIEdgeInsets)a3 forShelfViewElement:(id)a4 withSectionIndex:(int64_t)a5
{
  CGFloat right;
  double bottom;
  CGFloat left;
  double top;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v18 = 0;
  objc_msgSend(a4, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = SUUIViewElementPaddingForStyle(v10, &v18);
  v13 = v12;

  if (a5)
    v14 = top;
  else
    v14 = bottom;
  if (v18)
    v15 = v13;
  else
    v15 = bottom;
  if (v18)
    v14 = v11;
  v16 = left;
  v17 = right;
  result.right = v17;
  result.bottom = v15;
  result.left = v16;
  result.top = v14;
  return result;
}

- (void)shelfItemsCollectionView:(id)a3 willApplyLayoutAttributes:(id)a4 forViewElement:(id)a5 withItemIndex:(int64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v10 = a4;
  -[SUUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:](self, "effectiveViewElementForShelfItemViewElement:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ikBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v10, "setBackgroundColor:", v14);
  }
  else
  {
    objc_msgSend(v18, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v15);

  }
  v16 = -[SUUIShelfLayoutData numberOfRows](self->_shelfLayoutData, "numberOfRows");
  if (v16 == 1)
  {
    v17 = 40;
  }
  else if (a6 % v16)
  {
    if (a6 % v16 == v16 - 1)
      v17 = 32;
    else
      v17 = 16;
  }
  else
  {
    v17 = 8;
  }
  objc_msgSend(v10, "setPosition:", v17);

}

- (BOOL)supportsDuplicateShelfItems
{
  return -[SUUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations") > 1;
}

- (Class)_cellClassForEffectiveShelfItemViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  objc_class *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  v6 = 0;
  if (v5 <= 48)
  {
    if (v5 != 14)
    {
      if (v5 == 28)
        goto LABEL_11;
      goto LABEL_12;
    }
    objc_msgSend(v4, "cardType");
LABEL_11:
    v6 = (objc_class *)objc_opt_class();
    goto LABEL_12;
  }
  switch(v5)
  {
    case 49:
      goto LABEL_11;
    case 66:
      v6 = -[SUUIShelfPageSectionConfiguration _lockupCellClassWithLockup:](self, "_lockupCellClassWithLockup:", v4);
      break;
    case 152:
      goto LABEL_11;
  }
LABEL_12:
  v7 = v6;

  return v7;
}

- (double)_columnSpacingForShelfItemViewElements:(id)a3
{
  void *v4;
  uint64_t v5;
  double result;
  double v7;
  BOOL v8;

  -[SUUIStorePageSectionContext clientContext](self->_pageSectionContext, "clientContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SUUIUserInterfaceIdiom(v4);

  result = 15.0;
  if (v5 == 1)
  {
    -[SUUIStorePageSectionContext activePageWidth](self->_pageSectionContext, "activePageWidth", 15.0);
    v8 = v7 < 768.0;
    result = 30.0;
    if (v8)
      return 20.0;
  }
  return result;
}

- (id)_dequeueCellForLockup:(id)a3 collectionView:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  __CFString *v12;

  v8 = a4;
  v9 = a5;
  v10 = -[SUUIShelfPageSectionConfiguration lockupTypeForLockup:](self, "lockupTypeForLockup:", a3);
  if (v10 > 8)
  {
    v11 = 0;
  }
  else if (((1 << v10) & 0x1E6) != 0)
  {
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x251210428, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSeparatorStyle:", 5);
  }
  else
  {
    if (((1 << v10) & 0x11) != 0)
      v12 = CFSTR("SUUIVerticalLockupReuseIdentifier");
    else
      v12 = CFSTR("SUUIProductLockupReuseIdentifier");
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (Class)_lockupCellClassWithLockup:(id)a3
{
  void *v3;

  if ((unint64_t)-[SUUIShelfPageSectionConfiguration lockupTypeForLockup:](self, "lockupTypeForLockup:", a3) <= 8)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (double)_perspectiveHeightForContentSize:(double)a3
{
  double v4;
  double v5;
  _BOOL4 v6;
  double result;

  +[SUUIStackedImageView maximumPerspectiveHeightForSize:](SUUIStackedImageView, "maximumPerspectiveHeightForSize:", a3, a3);
  v5 = v4;
  v6 = -[SUUIShelfPageSectionConfiguration isTopSection](self, "isTopSection");
  result = v5 + -15.0;
  if (v6)
    return v5;
  return result;
}

- (id)_reloadShelfLayoutDataWithNumberOfShelfItems:(int64_t)a3
{
  unint64_t v5;
  id v6;
  SUUIShelfLayoutData *shelfLayoutData;
  int64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  SUUIShelfPageSectionConfiguration *v14;
  int64_t v15;

  v5 = -[SUUIShelfPageSectionConfiguration numberOfIterations](self, "numberOfIterations");
  if (v5 < 2)
    v6 = 0;
  else
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  shelfLayoutData = self->_shelfLayoutData;
  v8 = v5 * a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __82__SUUIShelfPageSectionConfiguration__reloadShelfLayoutDataWithNumberOfShelfItems___block_invoke;
  v12[3] = &unk_2511F9820;
  v15 = a3;
  v9 = v6;
  v13 = v9;
  v14 = self;
  -[SUUIShelfLayoutData reloadWithItemCount:sizeBlock:](shelfLayoutData, "reloadWithItemCount:sizeBlock:", v8, v12);
  v10 = v9;

  return v10;
}

double __82__SUUIShelfPageSectionConfiguration__reloadShelfLayoutDataWithNumberOfShelfItems___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2 % v3;
  v5 = *(void **)(a1 + 32);
  if (v5
    && (objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2 % v3),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKey:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    objc_msgSend(v7, "CGSizeValue");
    v9 = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_shelfItemViewElementAtIndex:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "effectiveViewElementForShelfItemViewElement:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_cellClassForEffectiveShelfItemViewElement:", v10), "preferredSizeForViewElement:context:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
    v9 = v11;
    v13 = *(void **)(a1 + 32);
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v14, v15);

    }
  }

  return v9;
}

- (id)_shelfItemViewElementAtIndex:(int64_t)a3
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "shelfPageSectionConfiguration:viewElementAtIndex:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_styledShelfCollectionViewLayoutForExistingLayout:(id)a3
{
  id v4;
  SUUIZoomingShelfCollectionViewLayout *v5;

  v4 = a3;
  if (self->_wantsZoomingShelfLayout)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (SUUIZoomingShelfCollectionViewLayout *)v4;
    }
    else
    {
      v5 = objc_alloc_init(SUUIZoomingShelfCollectionViewLayout);
      -[SUUIZoomingShelfCollectionViewLayout setLayoutData:](v5, "setLayoutData:", self->_shelfLayoutData);
    }
    -[SUUIZoomingShelfCollectionViewLayout setFocusedItemHorizontalCenterOffset:](v5, "setFocusedItemHorizontalCenterOffset:", self->_zoomingShelfLayoutFocusedItemHorizontalCenterOffset);
    -[SUUIZoomingShelfCollectionViewLayout setInterItemSpacing:](v5, "setInterItemSpacing:", self->_zoomingShelfLayoutInterItemSpacing);
    -[SUUIZoomingShelfCollectionViewLayout setItemWidth:](v5, "setItemWidth:", self->_zoomingShelfLayoutItemWidth);
    -[SUUIZoomingShelfCollectionViewLayout setScaledItemWidth:](v5, "setScaledItemWidth:", self->_zoomingShelfLayoutScaledItemWidth);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (SUUIZoomingShelfCollectionViewLayout *)v4;
    }
    else
    {
      v5 = objc_alloc_init(SUUIShelfCollectionViewLayout);
      -[SUUIZoomingShelfCollectionViewLayout setLayoutData:](v5, "setLayoutData:", self->_shelfLayoutData);
    }
  }

  return v5;
}

- (void)_updateShelfLayoutDataContentInset
{
  SUUIShelfLayoutData *shelfLayoutData;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  if (self->_wantsZoomingShelfLayout)
  {
    shelfLayoutData = self->_shelfLayoutData;
    v4 = *MEMORY[0x24BEBE158];
    v5 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v6 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v7 = *(double *)(MEMORY[0x24BEBE158] + 24);
  }
  else
  {
    -[SUUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "horizontalPadding");
    v10 = v9;
    -[SUUIShelfPageSectionConfiguration pageSectionContext](self, "pageSectionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "horizontalPadding");
    v13 = v12;

    v5 = v10 + 100.0;
    if (self->_rendersWithPerspective)
    {
      v7 = v13 + 100.0;
    }
    else
    {
      v5 = v10;
      v7 = v13;
    }
    shelfLayoutData = self->_shelfLayoutData;
    v4 = 0.0;
    v6 = 0.0;
  }
  -[SUUIShelfLayoutData setContentInset:](shelfLayoutData, "setContentInset:", v4, v5, v6, v7);
}

- (SUUIViewElementLayoutContext)cellLayoutContext
{
  return self->_cellLayoutContext;
}

- (void)setCellLayoutContext:(id)a3
{
  objc_storeStrong((id *)&self->_cellLayoutContext, a3);
}

- (SUUIShelfPageSectionConfigurationDataSource)dataSource
{
  return (SUUIShelfPageSectionConfigurationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (BOOL)needsShelfCollectionViewReload
{
  return self->_needsShelfCollectionViewReload;
}

- (void)setNeedsShelfCollectionViewReload:(BOOL)a3
{
  self->_needsShelfCollectionViewReload = a3;
}

- (BOOL)needsShelfCollectionViewLayout
{
  return self->_needsShelfCollectionViewLayout;
}

- (void)setNeedsShelfCollectionViewLayout:(BOOL)a3
{
  self->_needsShelfCollectionViewLayout = a3;
}

- (SUUIStorePageSectionContext)pageSectionContext
{
  return self->_pageSectionContext;
}

- (void)setPageSectionContext:(id)a3
{
  objc_storeStrong((id *)&self->_pageSectionContext, a3);
}

- (BOOL)rendersWithParallax
{
  return self->_rendersWithParallax;
}

- (void)setRendersWithParallax:(BOOL)a3
{
  self->_rendersWithParallax = a3;
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  self->_rendersWithPerspective = a3;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (UIColor)shelfCollectionViewBackgroundColor
{
  return self->_shelfCollectionViewBackgroundColor;
}

- (UICollectionViewDataSource)shelfCollectionViewDataSource
{
  return self->_shelfCollectionViewDataSource;
}

- (UICollectionViewDelegate)shelfCollectionViewDelegate
{
  return self->_shelfCollectionViewDelegate;
}

- (SUUIShelfLayoutData)shelfLayoutData
{
  return self->_shelfLayoutData;
}

- (IKViewElementStyle)shelfViewElementStyle
{
  return self->_shelfViewElementStyle;
}

- (BOOL)isTopSection
{
  return self->_topSection;
}

- (void)setTopSection:(BOOL)a3
{
  self->_topSection = a3;
}

- (BOOL)wantsZoomingShelfLayout
{
  return self->_wantsZoomingShelfLayout;
}

- (double)zoomingShelfLayoutFocusedItemHorizontalCenterOffset
{
  return self->_zoomingShelfLayoutFocusedItemHorizontalCenterOffset;
}

- (double)zoomingShelfLayoutInterItemSpacing
{
  return self->_zoomingShelfLayoutInterItemSpacing;
}

- (double)zoomingShelfLayoutItemWidth
{
  return self->_zoomingShelfLayoutItemWidth;
}

- (double)zoomingShelfLayoutScaledItemWidth
{
  return self->_zoomingShelfLayoutScaledItemWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelfViewElementStyle, 0);
  objc_storeStrong((id *)&self->_shelfLayoutData, 0);
  objc_storeStrong((id *)&self->_shelfCollectionViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pageSectionContext, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
  objc_storeStrong((id *)&self->_shelfCollectionView, 0);
}

@end
