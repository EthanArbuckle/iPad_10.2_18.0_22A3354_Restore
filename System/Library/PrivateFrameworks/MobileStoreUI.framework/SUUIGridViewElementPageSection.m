@implementation SUUIGridViewElementPageSection

- (SUUIGridViewElementPageSection)initWithPageComponent:(id)a3
{
  SUUIGridViewElementPageSection *v3;
  SUUIGridViewElementPageSectionConfiguration *v4;
  SUUIGridViewElementPageSectionConfiguration *configuration;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIGridViewElementPageSection;
  v3 = -[SUUIStorePageSection initWithPageComponent:](&v7, sel_initWithPageComponent_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(SUUIGridViewElementPageSectionConfiguration);
    configuration = v3->_configuration;
    v3->_configuration = v4;

    -[SUUIGridViewElementPageSectionConfiguration setDataSource:](v3->_configuration, "setDataSource:", v3);
    -[SUUIGridViewElementPageSection _reloadViewElementProperties](v3, "_reloadViewElementProperties");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIGridViewElementPageSection;
  -[SUUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *viewElements;
  uint64_t v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemViewElement:", v9);

  viewElements = self->_viewElements;
  v11 = objc_msgSend(v7, "item");

  -[NSArray objectAtIndex:](viewElements, "objectAtIndex:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemViewElement:", v12);

}

- (int64_t)applyUpdateType:(int64_t)a3
{
  _BOOL4 v6;
  NSUInteger v7;
  objc_super v8;
  objc_super v9;

  if (a3 == 2)
    return -[SUUIStorePageSection applyUpdateType:](&v9, sel_applyUpdateType_, 2, v8.receiver, v8.super_class, self, SUUIGridViewElementPageSection);
  v6 = -[SUUIGridViewElementPageSectionConfiguration showsEditMode](self->_configuration, "showsEditMode");
  v7 = -[NSArray count](self->_viewElements, "count");
  -[SUUIGridViewElementPageSection _reloadViewElementProperties](self, "_reloadViewElementProperties");
  if (v6 == -[SUUIGridViewElementPageSectionConfiguration showsEditMode](self->_configuration, "showsEditMode")
    || v7 != -[NSArray count](self->_viewElements, "count"))
  {
    return -[SUUIStorePageSection applyUpdateType:](&v8, sel_applyUpdateType_, a3, self, SUUIGridViewElementPageSection, v9.receiver, v9.super_class);
  }
  -[SUUIGridViewElementPageSection _resetLayoutProperties](self, "_resetLayoutProperties");
  -[SUUIGridViewElementPageSection _requestLayoutForCells](self, "_requestLayoutForCells");
  return 1;
}

- (id)backgroundColorForSection
{
  return self->_backgroundColor;
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(v4, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGridViewElementPageSectionConfiguration backgroundColorForViewElement:](self->_configuration, "backgroundColorForViewElement:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ikBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 || objc_msgSend(0, "colorType") == 3)
  {
    objc_msgSend(v5, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ikBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (objc_msgSend(v12, "color"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
    {
      objc_msgSend(v12, "color");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;

  }
  else if ((objc_msgSend(v5, "handlesBackgroundColorDirectly") & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    if (!v6)
    {
      v17.receiver = self;
      v17.super_class = (Class)SUUIGridViewElementPageSection;
      -[SUUIStorePageSection backgroundColorForIndexPath:](&v17, sel_backgroundColorForIndexPath_, v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v6;
    v15 = v6;
  }

  return v15;
}

- (id)cellForIndexPath:(id)a3
{
  NSArray *viewElements;
  id v5;
  void *v6;
  void *v7;

  viewElements = self->_viewElements;
  v5 = a3;
  -[NSArray objectAtIndex:](viewElements, "objectAtIndex:", objc_msgSend(v5, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGridViewElementPageSectionConfiguration cellForViewElement:indexPath:](self->_configuration, "cellForViewElement:indexPath:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  NSArray *viewElements;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  viewElements = self->_viewElements;
  v5 = a3;
  -[NSArray objectAtIndex:](viewElements, "objectAtIndex:", objc_msgSend(v5, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:](self->_configuration, "cellSizeForViewElement:indexPath:", v6, v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewDidLongPressItemAtIndexPath:(id)a3
{
  id v3;

  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(a3, "item"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEnabled"))
    objc_msgSend(v3, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 3, 1, 1, 0, 0);

}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  SUUIGridViewElementPageSection *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(v4, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isEnabled"))
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __73__SUUIGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke;
      v7[3] = &unk_2511FCBC8;
      objc_copyWeak(&v10, &location);
      v8 = v6;
      v9 = self;
      objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, v7);

      objc_destroyWeak(&v10);
    }
    else
    {
      objc_msgSend(v6, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", 0x251210D08, 0x251210D28, 1, 0, 0, 0);
    }
  }

  objc_destroyWeak(&location);
}

void __73__SUUIGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke(uint64_t a1, char a2, char a3)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  char v11;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__SUUIGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2;
  v6[3] = &unk_2511FCBA0;
  v10 = a2;
  v11 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

  objc_destroyWeak(&v9);
}

void __73__SUUIGridViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  if (!*(_BYTE *)(a1 + 56) || !*(_BYTE *)(a1 + 57))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "performDefaultActionForViewElement:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 40), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (SUUIViewControllerIsVisible(v5))
  {
    objc_msgSend(v5, "transitionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      objc_msgSend(*(id *)(a1 + 40), "deselectItemsAnimated:", 1);
  }

}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3
{
  return 1;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeMetricsImpressionSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "beginActiveImpressionForViewElement:", v8);
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(v4, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "beginActiveImpressionForViewElement:", v9);
  v10.receiver = self;
  v10.super_class = (Class)SUUIGridViewElementPageSection;
  -[SUUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v10, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  objc_super v11;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeMetricsImpressionSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endActiveImpressionForViewElement:", v8);
  v9 = objc_msgSend(v4, "item");
  if (v9 < -[NSArray count](self->_viewElements, "count"))
  {
    -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "endActiveImpressionForViewElement:", v10);
    v8 = (void *)v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIGridViewElementPageSection;
  -[SUUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v11, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  SUUIGridViewElementPageSectionConfiguration *configuration;
  id v5;
  objc_super v6;

  configuration = self->_configuration;
  v5 = a3;
  -[SUUIGridViewElementPageSectionConfiguration collectionViewWillApplyLayoutAttributes:](configuration, "collectionViewWillApplyLayoutAttributes:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIGridViewElementPageSection;
  -[SUUIStorePageSection collectionViewWillApplyLayoutAttributes:](&v6, sel_collectionViewWillApplyLayoutAttributes_, v5);

}

- (void)collectionViewWillScrollToOffset:(CGPoint)a3 visibleRange:(SUUIIndexPathRange *)a4
{
  double y;
  double x;
  int64_t v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;

  y = a3.y;
  x = a3.x;
  v8 = -[SUUIGridViewElementPageSection numberOfCells](self, "numberOfCells");
  if (self->_lastNeedsMoreCount < v8)
  {
    v9 = v8;
    v10 = *(_OWORD *)&a4->var2;
    v17 = *(_OWORD *)&a4->var0;
    v18 = v10;
    v11 = -[SUUIStorePageSection itemRangeForIndexPathRange:](self, "itemRangeForIndexPathRange:", &v17);
    if (v12 + v11 + 20 >= v9)
    {
      self->_lastNeedsMoreCount = v9;
      -[SUUIStorePageSection pageComponent](self, "pageComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewElement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 16, 1, 1, 0, 0);

    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SUUIGridViewElementPageSection;
  v15 = *(_OWORD *)&a4->var2;
  v17 = *(_OWORD *)&a4->var0;
  v18 = v15;
  -[SUUIStorePageSection collectionViewWillScrollToOffset:visibleRange:](&v16, sel_collectionViewWillScrollToOffset_visibleRange_, &v17, x, y);
}

- (void)deselectItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexPathsForSelectedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "section") == v8)
          objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v14, v3);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  v15.receiver = self;
  v15.super_class = (Class)SUUIGridViewElementPageSection;
  -[SUUIStorePageSection deselectItemsAnimated:](&v15, sel_deselectItemsAnimated_, v3);

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
  id v6;
  void (**v7)(id, SUUIModalSourceViewProvider *);
  NSArray *viewElements;
  id v9;
  SUUIModalSourceViewProvider *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  SUUIGridViewElementPageSection *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = (void (**)(id, SUUIModalSourceViewProvider *))a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__87;
  v24 = __Block_byref_object_dispose__87;
  v25 = 0;
  viewElements = self->_viewElements;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__SUUIGridViewElementPageSection_getModalSourceViewForViewElement_completionBlock___block_invoke;
  v16[3] = &unk_2511FA428;
  v9 = v6;
  v18 = self;
  v19 = &v20;
  v17 = v9;
  -[NSArray enumerateObjectsUsingBlock:](viewElements, "enumerateObjectsUsingBlock:", v16);
  if (v21[5])
  {
    v10 = objc_alloc_init(SUUIModalSourceViewProvider);
    -[SUUIModalSourceViewProvider setUserInfo:](v10, "setUserInfo:", v9);
    -[SUUIStorePageSection context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cellForItemAtIndexPath:", v21[5]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "itmlID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewForElementIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[SUUIModalSourceViewProvider setOriginalSourceView:](v10, "setOriginalSourceView:", v15);
    else
      -[SUUIModalSourceViewProvider setOriginalSourceView:](v10, "setOriginalSourceView:", v13);

  }
  else
  {
    v10 = 0;
  }
  v7[2](v7, v10);

  _Block_object_dispose(&v20, 8);
}

void __83__SUUIGridViewElementPageSection_getModalSourceViewForViewElement_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (objc_msgSend(*(id *)(a1 + 32), "isDescendentFromViewElement:", a2))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, objc_msgSend(*(id *)(a1 + 40), "sectionIndex"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

- (id)indexPathsForBackgroundItems
{
  return self->_indexPathsForBackgroundItems;
}

- (int64_t)numberOfCells
{
  return -[NSArray count](self->_viewElements, "count");
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[SUUIStorePageSection context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v14, "section") == v7)
        {
          v15 = objc_msgSend(v14, "item");
          if (v11 <= v15)
            v11 = v15;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewElement");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[NSArray count](self->_viewElements, "count");
  if (v11 < v17)
  {
    v18 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", v11, v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[objc_class prefetchResourcesForViewElement:reason:context:](-[SUUIGridViewElementPageSectionConfiguration cellClassForViewElement:](self->_configuration, "cellClassForViewElement:", v19), "prefetchResourcesForViewElement:reason:context:", v19, a3, self->_cellLayoutContext))
      {
        if (-[SUUIGridViewElementPageSectionConfiguration viewElementIsStandardCard:](self->_configuration, "viewElementIsStandardCard:", v19))
        {
          v20 = 10
              / -[SUUIGridViewElementPageSectionConfiguration numberOfColumns](self->_configuration, "numberOfColumns");
          if (v20 <= 1)
            v20 = 1;
        }
        else
        {
          v20 = 1;
        }
        v18 += v20;
      }

      if (v18 > 19)
        break;
      ++v11;
    }
    while (v11 < v17);
  }
  v21 = v22;
  if (v17 <= 19 && self->_lastNeedsMoreCount < v17)
  {
    self->_lastNeedsMoreCount = v17;
    objc_msgSend(v22, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 16, 1, 1, 0, 0);
  }
  v24.receiver = self;
  v24.super_class = (Class)SUUIGridViewElementPageSection;
  -[SUUIStorePageSection prefetchResourcesWithReason:](&v24, sel_prefetchResourcesWithReason_, a3, v22);

}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[SUUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertPoint:fromView:", v10, x, y);
  objc_msgSend(v9, "indexPathForItemAtPoint:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(v11, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSection context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "previewViewControllerForViewElement:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  NSArray *viewElements;
  id v7;
  id v8;

  viewElements = self->_viewElements;
  v7 = a3;
  -[NSArray objectAtIndex:](viewElements, "objectAtIndex:", objc_msgSend(v7, "item"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIGridViewElementPageSectionConfiguration reloadCellWithIndexPath:forViewElement:reason:](self->_configuration, "reloadCellWithIndexPath:forViewElement:reason:", v7, v8, a4);

}

- (void)reloadVisibleCellsWithReason:(int64_t)a3
{
  SUUIViewElementLayoutContext *cellLayoutContext;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIGridViewElementPageSection;
  -[SUUIStorePageSection reloadVisibleCellsWithReason:](&v6, sel_reloadVisibleCellsWithReason_, a3);
  cellLayoutContext = self->_cellLayoutContext;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUUIGridViewElementPageSectionConfiguration showsEditMode](self->_configuration, "showsEditMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setAggregateValue:forKey:](cellLayoutContext, "setAggregateValue:forKey:", v5, 0x251210448);

}

- (BOOL)requestLayoutWithReloadReason:(int64_t)a3
{
  if (a3 == 2)
    -[SUUIGridViewElementPageSection _requestLayoutForCells](self, "_requestLayoutForCells");
  return a3 == 2;
}

- (UIEdgeInsets)sectionContentInset
{
  SUUIGridViewElementPageSectionConfiguration *configuration;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
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
  objc_super v26;
  UIEdgeInsets result;

  configuration = self->_configuration;
  v26.receiver = self;
  v26.super_class = (Class)SUUIGridViewElementPageSection;
  -[SUUIStorePageSection sectionContentInset](&v26, sel_sectionContentInset);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGridViewElementPageSectionConfiguration sectionContentInsetAdjustedFromValue:forGridViewElement:](configuration, "sectionContentInsetAdjustedFromValue:forGridViewElement:", v13, v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (id)targetScrollingIndexPathForElementWithIndexBarEntryID:(id)a3 relativeSectionIndex:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSUInteger v12;
  void *v13;

  v5 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstDescendentWithIndexBarEntryID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    do
    {
      v11 = v10;
      v12 = -[NSArray indexOfObject:](self->_viewElements, "indexOfObject:", v10);
      objc_msgSend(v10, "parent");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    while (v10 && v12 == 0x7FFFFFFFFFFFFFFFLL);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v12, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[SUUIStorePageSection context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForItemAtIndexPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "updateWithItemState:context:animated:", v9, self->_cellLayoutContext, v5);
  if (v13)
  {
    -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(v8, "item"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGridViewElementPageSectionConfiguration requestCellLayoutForViewElement:](self->_configuration, "requestCellLayoutForViewElement:", v14);

  }
  return v13;
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  SUUIViewElementLayoutContext *v6;
  SUUIViewElementLayoutContext *v7;
  SUUIViewElementLayoutContext *cellLayoutContext;
  SUUIViewElementLayoutContext *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  IKColor *v17;
  IKColor *backgroundColor;
  void *v19;
  NSArray *v20;
  NSArray *indexPathsForBackgroundItems;
  IKColor *v22;
  NSArray *v23;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGridViewElementPageSectionConfiguration registerReusableClassesForCollectionView:](self->_configuration, "registerReusableClassesForCollectionView:", v5);
  v6 = self->_cellLayoutContext;
  v7 = -[SUUIViewElementLayoutContext initWithStorePageSectionContext:previousLayoutContext:]([SUUIViewElementLayoutContext alloc], "initWithStorePageSectionContext:previousLayoutContext:", v4, v6);
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", self);
  v9 = self->_cellLayoutContext;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUUIGridViewElementPageSectionConfiguration showsEditMode](self->_configuration, "showsEditMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setAggregateValue:forKey:](v9, "setAggregateValue:forKey:", v10, 0x251210448);

  -[SUUIViewElementLayoutContext setAggregateValue:forKey:](self->_cellLayoutContext, "setAggregateValue:forKey:", MEMORY[0x24BDBD1C8], 0x251209688);
  -[SUUIViewElementLayoutContext setAggregateValue:forKey:](self->_cellLayoutContext, "setAggregateValue:forKey:", &unk_2512EEDC0, 0x25120CA28);
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", objc_msgSend(v12, "elementType"));
  if (-[SUUIGridViewElementPageSection _containsOnlyShelfElements](self, "_containsOnlyShelfElements"))
    -[SUUIViewElementLayoutContext setAggregateValue:forKey:](self->_cellLayoutContext, "setAggregateValue:forKey:", MEMORY[0x24BDBD1C8], 0x25120EC88);
  -[SUUIGridViewElementPageSectionConfiguration setCellLayoutContext:](self->_configuration, "setCellLayoutContext:", self->_cellLayoutContext);
  -[SUUIGridViewElementPageSection _resetLayoutProperties](self, "_resetLayoutProperties");
  -[SUUIGridViewElementPageSection _requestLayoutForCells](self, "_requestLayoutForCells");
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewElement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ikBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && objc_msgSend(v16, "colorType") == 3)
  {
    v17 = (IKColor *)objc_msgSend(v16, "copy");
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v17;

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    indexPathsForBackgroundItems = self->_indexPathsForBackgroundItems;
    self->_indexPathsForBackgroundItems = v20;

  }
  else
  {
    v22 = self->_backgroundColor;
    self->_backgroundColor = 0;

    v23 = self->_indexPathsForBackgroundItems;
    self->_indexPathsForBackgroundItems = 0;

  }
  v24.receiver = self;
  v24.super_class = (Class)SUUIGridViewElementPageSection;
  -[SUUIStorePageSection willAppearInContext:](&v24, sel_willAppearInContext_, v4);

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
  -[SUUIGridViewElementPageSection _resetLayoutProperties](self, "_resetLayoutProperties");
  -[SUUIGridViewElementPageSection _requestLayoutForCells](self, "_requestLayoutForCells");
  v9.receiver = self;
  v9.super_class = (Class)SUUIGridViewElementPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (void)_setContext:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIGridViewElementPageSection;
  v4 = a3;
  -[SUUIStorePageSection _setContext:](&v5, sel__setContext_, v4);
  -[SUUIGridViewElementPageSectionConfiguration setPageSectionContext:](self->_configuration, "setPageSectionContext:", v4, v5.receiver, v5.super_class);

}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
    self->_editing = a3;
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  SUUIGridViewElementPageSection *v17;

  v6 = a3;
  v7 = a4;
  -[SUUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__SUUIGridViewElementPageSection_artworkRequest_didLoadImage___block_invoke;
  v13[3] = &unk_2511F7EB0;
  v14 = v9;
  v15 = v7;
  v16 = v6;
  v17 = self;
  v10 = v6;
  v11 = v7;
  v12 = v9;
  -[SUUIGridViewElementPageSection _enumerateVisibleViewElementsUsingBlock:](self, "_enumerateVisibleViewElementsUsingBlock:", v13);

}

void __62__SUUIGridViewElementPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  BOOL v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(a3, "elementType");
  v6 = (unint64_t)(v5 - 14) > 0x34 || ((1 << (v5 - 14)) & 0x10003C00000001) == 0;
  if (!v6 || v5 == 154 || v5 == 152)
  {
    objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:forArtworkRequest:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 96));

  }
}

- (id)gridViewElementPageSectionConfiguration:(id)a3 viewElementForIndexPath:(id)a4
{
  unint64_t v5;
  void *v6;

  v5 = objc_msgSend(a4, "item", a3);
  if (v5 >= -[NSArray count](self->_viewElements, "count"))
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)_containsOnlyShelfElements
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_viewElements;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
      if (objc_msgSend(v7, "elementType", (_QWORD)v10) != 66 || objc_msgSend(v7, "lockupViewType") != 4)
        break;
      if (v4 == ++v6)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v8 = 1;
        if (v4)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (void)_enumerateVisibleViewElementsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__SUUIGridViewElementPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke;
  v10[3] = &unk_2511FCBF0;
  v11 = v4;
  v12 = v7;
  v10[4] = self;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

}

void __74__SUUIGridViewElementPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "section") == a1[6])
  {
    v6 = a1[5];
    objc_msgSend(*(id *)(a1[4] + 160), "objectAtIndex:", objc_msgSend(v8, "item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, uint64_t))(v6 + 16))(v6, v8, v7, a4);

  }
}

- (void)_reloadViewElementProperties
{
  void *v3;
  NSArray *v4;
  NSArray *viewElements;
  void *v6;
  id v7;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIGridViewElementPageSectionConfiguration setRendersWithPerspective:](self->_configuration, "setRendersWithPerspective:", objc_msgSend(v7, "rendersWithPerspective"));
  objc_msgSend(v7, "flattenedChildren");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewElements = self->_viewElements;
  self->_viewElements = v4;

  -[SUUIGridViewElementPageSectionConfiguration updateStylePropertiesForGridViewElement:gridItemViewElements:numberOfGridItems:](self->_configuration, "updateStylePropertiesForGridViewElement:gridItemViewElements:numberOfGridItems:", v7, self->_viewElements, -[NSArray count](self->_viewElements, "count"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "collectionFeature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCollectionTarget:", self);

  }
}

- (void)_requestLayoutForCells
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_viewElements;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SUUIGridViewElementPageSectionConfiguration requestCellLayoutForViewElement:](self->_configuration, "requestCellLayoutForViewElement:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_resetLayoutProperties
{
  SUUIGridViewElementPageSectionConfiguration *configuration;
  void *v3;
  id v4;

  configuration = self->_configuration;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGridViewElementPageSectionConfiguration updateLayoutPropertiesForGridViewElement:](configuration, "updateLayoutPropertiesForGridViewElement:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_indexPathsForBackgroundItems, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
