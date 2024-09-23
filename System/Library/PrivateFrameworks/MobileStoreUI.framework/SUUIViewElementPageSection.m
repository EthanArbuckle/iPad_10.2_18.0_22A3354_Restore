@implementation SUUIViewElementPageSection

- (SUUIViewElementPageSection)initWithPageComponent:(id)a3
{
  SUUIViewElementPageSection *v3;
  SUUIViewElementPageSection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIViewElementPageSection;
  v3 = -[SUUIStorePageSection initWithPageComponent:](&v6, sel_initWithPageComponent_, a3);
  v4 = v3;
  if (v3)
    -[SUUIViewElementPageSection _reloadViewElementProperties](v3, "_reloadViewElementProperties");
  return v4;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemViewElement:", v6);

}

- (int64_t)applyUpdateType:(int64_t)a3
{
  objc_super v6;

  if (a3 != 2)
    -[SUUIViewElementPageSection _reloadViewElementProperties](self, "_reloadViewElementProperties");
  v6.receiver = self;
  v6.super_class = (Class)SUUIViewElementPageSection;
  return -[SUUIStorePageSection applyUpdateType:](&v6, sel_applyUpdateType_, a3);
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "handlesBackgroundColorDirectly");

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "ikBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "color");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v13;
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)SUUIViewElementPageSection;
      -[SUUIStorePageSection backgroundColorForIndexPath:](&v16, sel_backgroundColorForIndexPath_, v4);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v14;

  }
  return v8;
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  CGRect v21;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", self->_reuseIdentifier, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setContentInset:", self->_cellContentInset.top, self->_cellContentInset.left, self->_cellContentInset.bottom, self->_cellContentInset.right);
  objc_msgSend(v7, "setSeparatorStyle:", 0);
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "elementType") == 49)
    objc_msgSend(v7, "setShowsReflectionImage:", -[SUUIViewElementPageSection _showsImageReflection](self, "_showsImageReflection"));
  objc_msgSend(v5, "activePageWidth");
  v11 = v10 - self->_cellContentInset.left - self->_cellContentInset.right;
  objc_msgSend(v9, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visibility");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("hidden"));

  if (v14)
    v15 = 0;
  else
    v15 = v9;
  objc_msgSend(v7, "reloadWithViewElement:width:context:", v15, self->_cellLayoutContext, v11);
  if (self->_rendersWithPerspective && objc_msgSend(v7, "conformsToProtocol:", &unk_2571FE3F0))
  {
    v16 = v7;
    -[SUUIStorePageSection context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "parentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setPerspectiveTargetView:", v19);
    objc_msgSend(v19, "bounds");
    objc_msgSend(v16, "setVanishingPoint:", CGRectGetMidX(v21), -800.0);

  }
  objc_storeWeak((id *)&self->_lastCell, v7);

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[SUUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePageWidth");
  v6 = v5;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class sizeThatFitsWidth:viewElement:context:](self->_cellClass, "sizeThatFitsWidth:viewElement:context:", v8, self->_cellLayoutContext, v6 - self->_cellContentInset.left - self->_cellContentInset.right);
  v10 = v9 + self->_cellContentInset.top + self->_cellContentInset.bottom;
  if (-[SUUIViewElementPageSection _showsImageReflection](self, "_showsImageReflection"))
    v10 = v10 + v10;

  v11 = v6;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__SUUIViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke;
  v8[3] = &unk_2511F7158;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  objc_msgSend(v7, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __69__SUUIViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke(uint64_t a1, char a2, char a3)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;
  char v8;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__SUUIViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2;
  block[3] = &unk_2511F7130;
  v7 = a2;
  v8 = a3;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v6);
}

void __69__SUUIViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (!*(_BYTE *)(a1 + 48) || !*(_BYTE *)(a1 + 49))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "performDefaultActionForViewElement:", *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[SUUIStorePageSection pageComponent](self, "pageComponent", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  return v5;
}

- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[SUUIStorePageSection pageComponent](self, "pageComponent", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  return v5;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  objc_super v31;
  CGRect v32;

  v4 = a3;
  if (-[SUUIViewElementPageSection _stretchesToFitCollectionViewBounds](self, "_stretchesToFitCollectionViewBounds"))
  {
    -[SUUIStorePageSection context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "contentInset");
    v16 = v15;
    objc_msgSend(v4, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v32.origin.x = v8;
    v32.origin.y = v10;
    v32.size.width = v12;
    v32.size.height = v14;
    v23 = CGRectGetMaxY(v32) - v16 - v20 - self->_sectionBottomInset;
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "viewElement");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "style");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "maxHeight");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v26, "maxHeight");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      v30 = v29;

      if (v23 < v30)
        v23 = v30;
    }
    objc_msgSend(v4, "setFrame:", v18, v20, v22, v23);
    objc_msgSend(v4, "setSize:", v22, v23);

  }
  v31.receiver = self;
  v31.super_class = (Class)SUUIViewElementPageSection;
  -[SUUIStorePageSection collectionViewWillApplyLayoutAttributes:](&v31, sel_collectionViewWillApplyLayoutAttributes_, v4);

}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SUUIViewElementPageSection;
  -[SUUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v9, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SUUIViewElementPageSection;
  -[SUUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v9, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (double)contentInsetAdjustmentForCollectionView:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  Class cellClass;
  void *v8;
  double v9;
  double v10;
  double v11;

  -[SUUIStorePageSection pageComponent](self, "pageComponent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0.0;
  if (-[SUUIViewElementPageSection _showsImageReflection](self, "_showsImageReflection"))
  {
    cellClass = self->_cellClass;
    -[SUUIStorePageSection context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activePageWidth");
    -[objc_class sizeThatFitsWidth:viewElement:context:](cellClass, "sizeThatFitsWidth:viewElement:context:", v5, self->_cellLayoutContext, v9 - self->_cellContentInset.left - self->_cellContentInset.right);
    v11 = v10;

    v6 = -v11;
  }

  return v6;
}

- (int64_t)defaultItemPinningStyle
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "elementType") == 49)
  {
    v5 = -[SUUIStorePageSection isTopSection](self, "isTopSection");

    if (v5)
      return 3;
  }
  else
  {

  }
  v7.receiver = self;
  v7.super_class = (Class)SUUIViewElementPageSection;
  return -[SUUIStorePageSection defaultItemPinningStyle](&v7, sel_defaultItemPinningStyle);
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[SUUIViewElementPageSection _requestCellLayout](self, "_requestCellLayout");
  v8.receiver = self;
  v8.super_class = (Class)SUUIViewElementPageSection;
  -[SUUIStorePageSection entityProvider:didInvalidateWithContext:](&v8, sel_entityProvider_didInvalidateWithContext_, v7, v6);

}

- (void)expandEditorialForLabelElement:(id)a3 indexPath:(id)a4
{
  SUUIViewElementLayoutContext *cellLayoutContext;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  cellLayoutContext = self->_cellLayoutContext;
  v7 = a4;
  -[SUUIViewElementLayoutContext expandEditorialForLabelElement:](cellLayoutContext, "expandEditorialForLabelElement:", a3);
  -[SUUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "reloadItemsAtIndexPaths:", v10);
}

- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SUUIModalSourceViewProvider *v16;
  SUUIModalSourceViewProvider *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = (void (**)(id, void *))a4;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v19, "isDescendentFromViewElement:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSection context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cellForItemAtIndexPath:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "itmlID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewForElementIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc_init(SUUIModalSourceViewProvider);
    v17 = v16;
    if (v15)
      v18 = v15;
    else
      v18 = v13;
    -[SUUIModalSourceViewProvider setOriginalSourceView:](v16, "setOriginalSourceView:", v18);

  }
  else
  {
    v17 = 0;
  }
  v6[2](v6, v17);

}

- (int64_t)numberOfCells
{
  return 1;
}

- (UIEdgeInsets)pinningContentInsetForItemAtIndexPath:(id)a3
{
  id v4;
  double firstSectionTopInset;
  CGFloat left;
  double sectionBottomInset;
  CGFloat right;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v19;
  UIEdgeInsets result;

  v4 = a3;
  firstSectionTopInset = self->_firstSectionTopInset;
  left = self->_cellContentInset.left;
  sectionBottomInset = self->_sectionBottomInset;
  right = self->_cellContentInset.right;
  v19 = 0;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = SUUIViewElementPaddingForStyle(v11, &v19);
  v14 = v13;

  if (v19)
  {
    firstSectionTopInset = v12;
  }
  else
  {
    v14 = 0.0;
    if (-[SUUIStorePageSection pinningStyleForItemAtIndexPath:](self, "pinningStyleForItemAtIndexPath:", v4) != 3
      && self->_cellContentInset.bottom <= 0.00000011920929)
    {
      v14 = sectionBottomInset;
    }
  }

  v15 = firstSectionTopInset;
  v16 = left;
  v17 = v14;
  v18 = right;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGSize)preferredContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[objc_class preferredSizeForViewElement:context:](self->_cellClass, "preferredSizeForViewElement:context:", v4, self->_cellLayoutContext);
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  Class cellClass;
  void *v6;
  void *v7;
  objc_super v8;

  cellClass = self->_cellClass;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class prefetchResourcesForViewElement:reason:context:](cellClass, "prefetchResourcesForViewElement:reason:context:", v7, a3, self->_cellLayoutContext);

  v8.receiver = self;
  v8.super_class = (Class)SUUIViewElementPageSection;
  -[SUUIStorePageSection prefetchResourcesWithReason:](&v8, sel_prefetchResourcesWithReason_, a3);
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SUUIStorePageSection pageComponent](self, "pageComponent", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewViewControllerForViewElement:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v5 = a3;
  -[SUUIStorePageSection context](self, "context");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "activePageWidth");
  objc_msgSend(v7, "reloadWithViewElement:width:context:", v9, self->_cellLayoutContext, v10 - self->_cellContentInset.left - self->_cellContentInset.right);

}

- (UIEdgeInsets)sectionContentInset
{
  double sectionBottomInset;
  void *v4;
  void *v5;
  void *v6;
  double firstSectionTopInset;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char v14;
  UIEdgeInsets result;

  sectionBottomInset = self->_sectionBottomInset;
  v14 = 0;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  firstSectionTopInset = SUUIViewElementPaddingForStyle(v6, &v14);
  v9 = v8;

  if (v14)
  {
    sectionBottomInset = v9;
  }
  else
  {
    firstSectionTopInset = 0.0;
    if (-[SUUIStorePageSection isTopSection](self, "isTopSection"))
      firstSectionTopInset = self->_firstSectionTopInset;
  }
  v10 = 0.0;
  v11 = 0.0;
  v12 = firstSectionTopInset;
  v13 = sectionBottomInset;
  result.right = v11;
  result.bottom = v13;
  result.left = v10;
  result.top = v12;
  return result;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  SUUIViewElementView **p_lastCell;
  id v8;
  id WeakRetained;
  int v10;

  v5 = a5;
  p_lastCell = &self->_lastCell;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_lastCell);
  v10 = objc_msgSend(WeakRetained, "updateWithItemState:context:animated:", v8, self->_cellLayoutContext, v5);

  if (v10)
    -[SUUIViewElementPageSection _requestCellLayout](self, "_requestCellLayout");
  return v10;
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  SUUIViewElementLayoutContext *v6;
  SUUIViewElementLayoutContext *v7;
  SUUIViewElementLayoutContext *cellLayoutContext;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", self->_cellClass, self->_reuseIdentifier);
  v6 = self->_cellLayoutContext;
  v7 = -[SUUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SUUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v6);
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", self);
  -[SUUIViewElementPageSection _reloadViewElementProperties](self, "_reloadViewElementProperties");
  -[SUUIViewElementPageSection _requestCellLayout](self, "_requestCellLayout");
  v9.receiver = self;
  v9.super_class = (Class)SUUIViewElementPageSection;
  -[SUUIStorePageSection willAppearInContext:](&v9, sel_willAppearInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  SUUIViewElementLayoutContext *cellLayoutContext;
  id v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  cellLayoutContext = self->_cellLayoutContext;
  v8 = a4;
  -[SUUIViewElementLayoutContext invalidateAllEditorialLayouts](cellLayoutContext, "invalidateAllEditorialLayouts");
  -[SUUIViewElementLayoutContext setActivePageWidth:](self->_cellLayoutContext, "setActivePageWidth:", width);
  -[SUUIViewElementPageSection _requestCellLayout](self, "_requestCellLayout");
  v9.receiver = self;
  v9.super_class = (Class)SUUIViewElementPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  SUUIViewElementView **p_lastCell;
  id v7;
  id v8;
  id WeakRetained;

  p_lastCell = &self->_lastCell;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_lastCell);
  objc_msgSend(WeakRetained, "setImage:forArtworkRequest:context:", v7, v8, self->_cellLayoutContext);

}

- (double)defaultVerticalInset
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v12;
  CGRect v13;

  objc_msgSend(MEMORY[0x24BEBDB58], "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  if (CGRectGetWidth(v12) < 1024.0)
    return 15.0;
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  if (CGRectGetHeight(v13) <= 768.0)
    return 15.0;
  else
    return 35.0;
}

- (void)_reloadViewElementProperties
{
  UIEdgeInsets *p_cellContentInset;
  void *v4;
  double v5;
  CGFloat v6;
  void *v7;
  CGFloat v8;
  double v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  void *v20;
  id v21;

  p_cellContentInset = &self->_cellContentInset;
  -[SUUIStorePageSection context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "horizontalPadding");
  v6 = v5;
  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "horizontalPadding");
  p_cellContentInset->top = 0.0;
  p_cellContentInset->left = v6;
  p_cellContentInset->bottom = 0.0;
  p_cellContentInset->right = v8;

  -[SUUIViewElementPageSection defaultVerticalInset](self, "defaultVerticalInset");
  self->_sectionBottomInset = v9;
  self->_firstSectionTopInset = v9;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewElement");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  self->_rendersWithPerspective = objc_msgSend(v21, "rendersWithPerspective");
  v11 = objc_msgSend(v21, "elementType");
  if (v11 > 49)
  {
    if (v11 > 108)
    {
      if (v11 <= 133)
      {
        if (v11 == 109)
        {
          self->_cellClass = (Class)objc_opt_class();
          p_cellContentInset->bottom = 8.0;
          p_cellContentInset->top = 0.0;
          self->_firstSectionTopInset = 7.0;
          objc_storeStrong((id *)&self->_reuseIdentifier, CFSTR("SUUISegmentedControlReuseIdentifier"));
          objc_msgSend(v21, "bottomDivider");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
            self->_sectionBottomInset = 7.0;
        }
        else if (v11 == 131)
        {
          self->_cellClass = (Class)objc_opt_class();
          v12 = CFSTR("SUUIStackListReuseIdentifier");
          goto LABEL_40;
        }
        goto LABEL_41;
      }
      if (v11 == 134)
      {
        self->_cellClass = (Class)objc_opt_class();
        v12 = CFSTR("SUUIStarHistogramCellReuseIdentifier");
        goto LABEL_40;
      }
      if (v11 != 141)
        goto LABEL_41;
    }
    else
    {
      if (v11 > 65)
      {
        if (v11 == 66)
        {
          switch(objc_msgSend(v21, "lockupViewType"))
          {
            case 0:
            case 1:
            case 2:
            case 6:
            case 8:
              self->_cellClass = (Class)objc_opt_class();
              v12 = CFSTR("SUUIHorizontalLockupReuseID");
              goto LABEL_40;
            case 3:
              self->_cellClass = (Class)objc_opt_class();
              v12 = CFSTR("SUUIProductLockupReuseIdentifier");
              goto LABEL_40;
            case 4:
              self->_cellClass = (Class)objc_opt_class();
              v12 = CFSTR("SUUIVerticalLockupReuseIdentifier");
              goto LABEL_40;
            case 5:
              p_cellContentInset->right = 0.0;
              self->_cellClass = (Class)objc_opt_class();
              objc_storeStrong((id *)&self->_reuseIdentifier, CFSTR("SUUIHorizontalLockupReuseID"));
              v19 = 1.0;
              self->_firstSectionTopInset = 1.0;
              goto LABEL_37;
            case 7:
              p_cellContentInset->left = 0.0;
              p_cellContentInset->right = 0.0;
              self->_cellClass = (Class)objc_opt_class();
              objc_storeStrong((id *)&self->_reuseIdentifier, CFSTR("SUUIHorizontalLockupReuseID"));
              self->_firstSectionTopInset = 0.0;
              goto LABEL_27;
            default:
              goto LABEL_41;
          }
        }
        else if (v11 == 77)
        {
          self->_cellClass = (Class)objc_opt_class();
          v12 = CFSTR("SUUIOfferReuseIdentifier");
          goto LABEL_40;
        }
        goto LABEL_41;
      }
      if (v11 != 50)
      {
        if (v11 == 62)
        {
          self->_cellClass = (Class)objc_opt_class();
          v12 = CFSTR("SUUIHorizontalListReuseIdentifier");
LABEL_40:
          objc_storeStrong((id *)&self->_reuseIdentifier, v12);
          goto LABEL_41;
        }
        goto LABEL_41;
      }
    }
    goto LABEL_30;
  }
  if (v11 <= 26)
  {
    if (v11 == 4)
    {
      self->_cellClass = (Class)objc_opt_class();
      v12 = CFSTR("SUUIActivityIndicatorReuseIdentifier");
      goto LABEL_40;
    }
    if (v11 != 12)
    {
      if (v11 == 14)
      {
        self->_cellClass = (Class)objc_opt_class();
        objc_storeStrong((id *)&self->_reuseIdentifier, CFSTR("SUUICardViewElementReuseIdentifier"));
        self->_firstSectionTopInset = 0.0;
      }
      goto LABEL_41;
    }
LABEL_30:
    self->_cellClass = (Class)objc_opt_class();
    objc_storeStrong((id *)&self->_reuseIdentifier, CFSTR("SUUIButtonReuseIdentifier"));
    v19 = 12.0;
    goto LABEL_37;
  }
  if (v11 > 47)
  {
    if (v11 != 48)
    {
      self->_cellClass = (Class)objc_opt_class();
      p_cellContentInset->right = 0.0;
      p_cellContentInset->left = 0.0;
      self->_firstSectionTopInset = 0.0;
      objc_storeStrong((id *)&self->_reuseIdentifier, CFSTR("SUUIImageReuseIdentifier"));
      objc_msgSend(v21, "style");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageTreatment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("uber"));

      if (v15)
        self->_sectionBottomInset = 0.0;
      objc_msgSend(v21, "style");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageTreatment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("uber-banner"));

      if (v18)
LABEL_27:
        self->_sectionBottomInset = 0.0;
      goto LABEL_41;
    }
    self->_cellClass = (Class)objc_opt_class();
    objc_storeStrong((id *)&self->_reuseIdentifier, CFSTR("SUUISectionHeaderReuseIdentifier"));
    v19 = 10.0;
LABEL_37:
    self->_sectionBottomInset = v19;
    goto LABEL_41;
  }
  if (v11 == 27)
  {
    self->_cellClass = (Class)objc_opt_class();
    v12 = CFSTR("SUUIContentUnavailableReuseIdentifier");
    goto LABEL_40;
  }
  if (v11 == 40)
  {
    *(_OWORD *)&p_cellContentInset->top = xmmword_241EFD180;
    *(_OWORD *)&p_cellContentInset->bottom = xmmword_241EFD180;
    self->_cellClass = (Class)objc_opt_class();
    self->_firstSectionTopInset = 0.0;
    v12 = CFSTR("SUUIFilterBarReuseIdentifier");
    goto LABEL_40;
  }
LABEL_41:

}

- (void)_requestCellLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePageWidth");
  v6 = v5 - self->_cellContentInset.left - self->_cellContentInset.right;

  -[objc_class requestLayoutForViewElement:width:context:](self->_cellClass, "requestLayoutForViewElement:width:context:", v7, self->_cellLayoutContext, v6);
}

- (BOOL)_showsImageReflection
{
  return 0;
}

- (BOOL)_stretchesToFitCollectionViewBounds
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[SUUIStorePageSection isBottomSection](self, "isBottomSection");
  if (v3)
  {
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "elementType");

    LOBYTE(v3) = v6 == 4 || v6 == 27;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_destroyWeak((id *)&self->_lastCell);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

@end
