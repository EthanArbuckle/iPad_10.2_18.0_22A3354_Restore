@implementation SUUIDynamicShelfPageSection

- (SUUIDynamicShelfPageSection)initWithPageComponent:(id)a3
{
  return -[SUUIDynamicShelfPageSection initWithPageComponent:configuration:](self, "initWithPageComponent:configuration:", a3, 0);
}

- (SUUIDynamicShelfPageSection)initWithPageComponent:(id)a3 configuration:(id)a4
{
  id v6;
  SUUIDynamicShelfPageSection *v7;
  SUUIShelfPageSectionConfiguration *v8;
  SUUIShelfPageSectionConfiguration *configuration;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SUUIDynamicShelfPageSection;
  v7 = -[SUUIStorePageSection initWithPageComponent:](&v11, sel_initWithPageComponent_, a3);
  if (v7)
  {
    if (v6)
      v8 = (SUUIShelfPageSectionConfiguration *)v6;
    else
      v8 = objc_alloc_init(SUUIShelfPageSectionConfiguration);
    configuration = v7->_configuration;
    v7->_configuration = v8;

    -[SUUIShelfPageSectionConfiguration setDataSource:](v7->_configuration, "setDataSource:", v7);
    -[SUUIShelfPageSectionConfiguration setShelfCollectionViewDataSource:](v7->_configuration, "setShelfCollectionViewDataSource:", v7);
    -[SUUIShelfPageSectionConfiguration setShelfCollectionViewDelegate:](v7->_configuration, "setShelfCollectionViewDelegate:", v7);
    -[SUUIDynamicShelfPageSection _reloadViewElementProperties](v7, "_reloadViewElementProperties");
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", 0);
  -[SUUIShelfPageSectionConfiguration setShelfCollectionViewDataSource:](self->_configuration, "setShelfCollectionViewDataSource:", 0);
  -[SUUIShelfPageSectionConfiguration setShelfCollectionViewDelegate:](self->_configuration, "setShelfCollectionViewDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SUUIDynamicShelfPageSection;
  -[SUUIStorePageSection dealloc](&v4, sel_dealloc);
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  objc_super v6;

  -[SUUIDynamicShelfPageSection _reloadViewElementProperties](self, "_reloadViewElementProperties");
  if (!-[SUUIShelfPageSectionConfiguration needsShelfCollectionViewReload](self->_configuration, "needsShelfCollectionViewReload"))-[SUUIShelfPageSectionConfiguration setNeedsShelfCollectionViewReload:](self->_configuration, "setNeedsShelfCollectionViewReload:", -[SUUIDynamicShelfViewElement updateType](self->_dynamicShelfViewElement, "updateType") != 0);
  v6.receiver = self;
  v6.super_class = (Class)SUUIDynamicShelfPageSection;
  return -[SUUIStorePageSection applyUpdateType:](&v6, sel_applyUpdateType_, a3);
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SUUIShelfPageSectionConfiguration backgroundColorForShelfViewElement:](self->_configuration, "backgroundColorForShelfViewElement:", self->_dynamicShelfViewElement);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIDynamicShelfPageSection;
    -[SUUIStorePageSection backgroundColorForIndexPath:](&v7, sel_backgroundColorForIndexPath_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)cellForIndexPath:(id)a3
{
  return -[SUUIShelfPageSectionConfiguration cellForShelfViewElement:indexPath:](self->_configuration, "cellForShelfViewElement:indexPath:", self->_dynamicShelfViewElement, a3);
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  SUUIShelfPageSectionConfiguration *configuration;
  SUUIDynamicShelfViewElement *dynamicShelfViewElement;
  SUUIDynamicPageSectionIndexMapper *dynamicPageSectionIndexMapper;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  configuration = self->_configuration;
  dynamicShelfViewElement = self->_dynamicShelfViewElement;
  dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
  v6 = a3;
  -[SUUIShelfPageSectionConfiguration cellSizeForShelfViewElement:indexPath:numberOfShelfItems:](configuration, "cellSizeForShelfViewElement:indexPath:numberOfShelfItems:", dynamicShelfViewElement, v6, -[SUUIDynamicPageSectionIndexMapper totalNumberOfEntities](dynamicPageSectionIndexMapper, "totalNumberOfEntities"));
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIDynamicShelfPageSection;
  v4 = a3;
  -[SUUIStorePageSection collectionViewWillApplyLayoutAttributes:](&v5, sel_collectionViewWillApplyLayoutAttributes_, v4);
  -[SUUIShelfPageSectionConfiguration collectionViewWillApplyLayoutAttributes:](self->_configuration, "collectionViewWillApplyLayoutAttributes:", v4, v5.receiver, v5.super_class);

}

- (void)deselectItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[SUUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIDynamicShelfPageSection;
  -[SUUIStorePageSection deselectItemsAnimated:](&v11, sel_deselectItemsAnimated_, v3);

}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v5;

  if (self->_entityProvider == a3)
  {
    -[SUUIDynamicPageSectionIndexMapper reloadData](self->_dynamicPageSectionIndexMapper, "reloadData");
    -[SUUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

  }
}

- (void)invalidateCachedLayoutInformation
{
  void *v3;
  objc_super v4;

  -[SUUIShelfPageSectionConfiguration setNeedsShelfCollectionViewLayout:](self->_configuration, "setNeedsShelfCollectionViewLayout:", 1);
  -[SUUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  v4.receiver = self;
  v4.super_class = (Class)SUUIDynamicShelfPageSection;
  -[SUUIStorePageSection invalidateCachedLayoutInformation](&v4, sel_invalidateCachedLayoutInformation);
}

- (int64_t)numberOfCells
{
  return -[SUUIShelfPageSectionConfiguration numberOfSectionCells](self->_configuration, "numberOfSectionCells");
}

- (id)relevantEntityProviders
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIDynamicShelfPageSection;
  -[SUUIStorePageSection relevantEntityProviders](&v7, sel_relevantEntityProviders);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_entityProvider)
  {
    if (v3)
    {
      objc_msgSend(v3, "setByAddingObject:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (UIEdgeInsets)sectionContentInset
{
  SUUIShelfPageSectionConfiguration *configuration;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  UIEdgeInsets result;

  configuration = self->_configuration;
  v12.receiver = self;
  v12.super_class = (Class)SUUIDynamicShelfPageSection;
  -[SUUIStorePageSection sectionContentInset](&v12, sel_sectionContentInset);
  -[SUUIShelfPageSectionConfiguration sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:](configuration, "sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:", self->_dynamicShelfViewElement, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"), v4, v5, v6, v7);
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (void)setTopSection:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUIDynamicShelfPageSection;
  -[SUUIStorePageSection setTopSection:](&v5, sel_setTopSection_);
  -[SUUIShelfPageSectionConfiguration setTopSection:](self->_configuration, "setTopSection:", v3);
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SUUIViewElementTextLayoutCache *v7;
  void *v8;
  SUUIViewElementTextLayoutCache *v9;
  SUUIViewElementTextLayoutCache *labelLayoutCache;
  SUUIViewElementLayoutContext *cellLayoutContext;
  SUUIViewElementLayoutContext *v12;
  SUUIViewElementLayoutContext *v13;
  void *v14;
  SUUIViewElementLayoutContext *v15;
  void *v16;
  SUUIViewElementLayoutContext *v17;
  void *v18;
  SUUIViewElementLayoutContext *v19;
  void *v20;
  SUUIViewElementLayoutContext *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShelfPageSectionConfiguration registerReusableClassesForCollectionView:](self->_configuration, "registerReusableClassesForCollectionView:", v5);
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  v7 = [SUUIViewElementTextLayoutCache alloc];
  objc_msgSend(v4, "textLayoutCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUUIViewElementTextLayoutCache initWithLayoutCache:](v7, "initWithLayoutCache:", v8);
  labelLayoutCache = self->_labelLayoutCache;
  self->_labelLayoutCache = v9;

  cellLayoutContext = self->_cellLayoutContext;
  if (!cellLayoutContext)
  {
    v12 = objc_alloc_init(SUUIViewElementLayoutContext);
    v13 = self->_cellLayoutContext;
    self->_cellLayoutContext = v12;

    -[SUUIViewElementLayoutContext setAggregateValue:forKey:](self->_cellLayoutContext, "setAggregateValue:forKey:", MEMORY[0x24BDBD1C8], 0x25120EC88);
    -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_cellLayoutContext, "setArtworkRequestDelegate:", self);
    cellLayoutContext = self->_cellLayoutContext;
  }
  objc_msgSend(v4, "clientContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setClientContext:](cellLayoutContext, "setClientContext:", v14);

  -[SUUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", -[SUUIDynamicShelfViewElement elementType](self->_dynamicShelfViewElement, "elementType"));
  -[SUUIViewElementLayoutContext setLabelLayoutCache:](self->_cellLayoutContext, "setLabelLayoutCache:", self->_labelLayoutCache);
  v15 = self->_cellLayoutContext;
  objc_msgSend(v4, "parentViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setParentViewController:](v15, "setParentViewController:", v16);

  v17 = self->_cellLayoutContext;
  objc_msgSend(v4, "placeholderColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setPlaceholderColor:](v17, "setPlaceholderColor:", v18);

  v19 = self->_cellLayoutContext;
  objc_msgSend(v4, "resourceLoader");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setResourceLoader:](v19, "setResourceLoader:", v20);

  v21 = self->_cellLayoutContext;
  objc_msgSend(v5, "tintColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext setTintColor:](v21, "setTintColor:", v22);

  -[SUUIShelfPageSectionConfiguration setCellLayoutContext:](self->_configuration, "setCellLayoutContext:", self->_cellLayoutContext);
  -[SUUIDynamicShelfViewElement cellTemplateViewElement](self->_dynamicShelfViewElement, "cellTemplateViewElement");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
  {
    v27[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  -[SUUIShelfPageSectionConfiguration reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:](self->_configuration, "reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:", self->_dynamicShelfViewElement, v25, 1, -[SUUIDynamicPageSectionIndexMapper totalNumberOfEntities](self->_dynamicPageSectionIndexMapper, "totalNumberOfEntities"));
  -[SUUIShelfPageSectionConfiguration setNeedsShelfCollectionViewLayout:](self->_configuration, "setNeedsShelfCollectionViewLayout:", 1);
  v26.receiver = self;
  v26.super_class = (Class)SUUIDynamicShelfPageSection;
  -[SUUIStorePageSection willAppearInContext:](&v26, sel_willAppearInContext_, v4);

}

- (void)willHideInContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SUUIDynamicShelfPageSection;
  -[SUUIStorePageSection willHideInContext:](&v6, sel_willHideInContext_, v4);

}

- (void)setSectionIndex:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIDynamicShelfPageSection;
  -[SUUIStorePageSection setSectionIndex:](&v5, sel_setSectionIndex_);
  -[SUUIShelfPageSectionConfiguration setSectionIndex:](self->_configuration, "setSectionIndex:", a3);
}

- (void)_setContext:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIDynamicShelfPageSection;
  v4 = a3;
  -[SUUIStorePageSection _setContext:](&v5, sel__setContext_, v4);
  -[SUUIShelfPageSectionConfiguration setPageSectionContext:](self->_configuration, "setPageSectionContext:", v4, v5.receiver, v5.super_class);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SUUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForVisibleItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[SUUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cellForItemAtIndexPath:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setImage:forArtworkRequest:context:", v7, v6, self->_cellLayoutContext);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__SUUIDynamicShelfPageSection_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __65__SUUIDynamicShelfPageSection_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "existingShelfCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForVisibleItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 40);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v16)
  {
    v14 = *(_QWORD *)v23;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(obj);
        v17 = v3;
        v4 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v3);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v5 = v15;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v19;
          while (2)
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v19 != v8)
                objc_enumerationMutation(v5);
              v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "existingShelfCollectionView");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "cellForItemAtIndexPath:", v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v12, "updateWithItemState:context:animated:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), 1)&& (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "supportsDuplicateShelfItems") & 1) == 0)
              {

                goto LABEL_17;
              }

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v7)
              continue;
            break;
          }
        }
LABEL_17:

        v3 = v17 + 1;
      }
      while (v17 + 1 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v16);
  }

}

- (id)shelfPageSectionConfiguration:(id)a3 viewElementAtIndex:(int64_t)a4
{
  return -[SUUIDynamicShelfPageSection _viewElementForEntityAtGlobalIndex:](self, "_viewElementForEntityAtGlobalIndex:", a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[SUUIDynamicShelfPageSection _normalizedShelfItemIndexPathFromActualIndexPath:](self, "_normalizedShelfItemIndexPathFromActualIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDynamicShelfPageSection _viewElementForEntityAtGlobalIndex:](self, "_viewElementForEntityAtGlobalIndex:", objc_msgSend(v6, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShelfPageSectionConfiguration cellForShelfItemViewElement:indexPath:](self->_configuration, "cellForShelfItemViewElement:indexPath:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[SUUIShelfPageSectionConfiguration numberOfCellsForNumberOfShelfItems:](self->_configuration, "numberOfCellsForNumberOfShelfItems:", -[SUUIDynamicPageSectionIndexMapper totalNumberOfEntities](self->_dynamicPageSectionIndexMapper, "totalNumberOfEntities", a3, a4));
}

- (void)collectionView:(id)a3 didConfirmButtonElement:(id)a4 withClickInfo:(id)a5 forItemAtIndexPath:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v9 = a5;
  v10 = a4;
  -[SUUIDynamicShelfPageSection _normalizedShelfItemIndexPathFromActualIndexPath:](self, "_normalizedShelfItemIndexPathFromActualIndexPath:", a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(v12, "item"), -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSection collectionViewDidConfirmButtonElement:withClickInfo:forItemAtIndexPath:](self, "collectionViewDidConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v10, v9, v11);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", a4, 1);
}

- (void)collectionView:(id)a3 layout:(id)a4 willApplyLayoutAttributes:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDynamicShelfPageSection _normalizedShelfItemIndexPathFromActualIndexPath:](self, "_normalizedShelfItemIndexPathFromActualIndexPath:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v12, "item");
  -[SUUIDynamicShelfPageSection _viewElementForEntityAtGlobalIndex:](self, "_viewElementForEntityAtGlobalIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShelfPageSectionConfiguration shelfItemsCollectionView:willApplyLayoutAttributes:forViewElement:withItemIndex:](self->_configuration, "shelfItemsCollectionView:willApplyLayoutAttributes:forViewElement:withItemIndex:", v8, v7, v11, v10);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "observedScrollViewDidEndDecelerating:", v5);

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  if (-[SUUIShelfPageSectionConfiguration rendersWithParallax](self->_configuration, "rendersWithParallax"))
  {
    -[SUUIShelfPageSectionConfiguration existingShelfCollectionView](self->_configuration, "existingShelfCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SUUICollectionViewUpdatePerspectiveCells(v4, 0);

  }
  -[SUUIShelfPageSectionConfiguration scrollViewDidScroll:](self->_configuration, "scrollViewDidScroll:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "observedScrollViewDidScroll:", v6);

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "observedScrollViewWillBeginDecelerating:", v5);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "observedScrollViewWillBeginDragging:", v5);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id WeakRetained;
  id v10;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "observedScrollViewWillEndDragging:withVelocity:targetContentOffset:", v10, x, y, a5->x, a5->y);

}

- (id)_normalizedShelfItemIndexPathFromActualIndexPath:(id)a3
{
  SUUIShelfPageSectionConfiguration *configuration;
  SUUIDynamicPageSectionIndexMapper *dynamicPageSectionIndexMapper;
  id v5;
  void *v6;

  configuration = self->_configuration;
  dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
  v5 = a3;
  -[SUUIShelfPageSectionConfiguration normalizedShelfItemIndexPathFromActualIndexPath:numberOfShelfItems:](configuration, "normalizedShelfItemIndexPathFromActualIndexPath:numberOfShelfItems:", v5, -[SUUIDynamicPageSectionIndexMapper totalNumberOfEntities](dynamicPageSectionIndexMapper, "totalNumberOfEntities"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_reloadViewElementProperties
{
  void *v3;
  SUUIDynamicShelfViewElement *v4;
  SUUIDynamicShelfViewElement *dynamicShelfViewElement;
  SUUIShelfPageSectionConfiguration *configuration;
  void *v7;
  SUUIShelfPageSectionConfiguration *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SUUIEntityProviding *entityProvider;
  SUUIDynamicPageSectionIndexMapper *dynamicPageSectionIndexMapper;
  SUUIDynamicPageSectionIndexMapper *v14;
  SUUIDynamicPageSectionIndexMapper *v15;
  id obj;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (SUUIDynamicShelfViewElement *)objc_claimAutoreleasedReturnValue();
  dynamicShelfViewElement = self->_dynamicShelfViewElement;
  self->_dynamicShelfViewElement = v4;

  -[SUUIShelfPageSectionConfiguration setRendersWithPerspective:](self->_configuration, "setRendersWithPerspective:", -[SUUIViewElement rendersWithPerspective](self->_dynamicShelfViewElement, "rendersWithPerspective"));
  -[SUUIShelfPageSectionConfiguration setRendersWithParallax:](self->_configuration, "setRendersWithParallax:", -[SUUIViewElement rendersWithParallax](self->_dynamicShelfViewElement, "rendersWithParallax"));
  configuration = self->_configuration;
  -[SUUIDynamicShelfViewElement style](self->_dynamicShelfViewElement, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShelfPageSectionConfiguration setShelfViewElementStyle:](configuration, "setShelfViewElementStyle:", v7);

  v8 = self->_configuration;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDynamicShelfPageSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShelfPageSectionConfiguration setShelfCollectionViewBackgroundColor:](v8, "setShelfCollectionViewBackgroundColor:", v10);

  -[SUUIViewElement entityProvider](self->_dynamicShelfViewElement, "entityProvider");
  v11 = objc_claimAutoreleasedReturnValue();
  entityProvider = self->_entityProvider;
  obj = (id)v11;
  if (entityProvider != (SUUIEntityProviding *)v11
    && (-[SUUIEntityProviding isEqual:](entityProvider, "isEqual:", v11) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_entityProvider, obj);
    dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    if (!dynamicPageSectionIndexMapper)
    {
      v14 = objc_alloc_init(SUUIDynamicPageSectionIndexMapper);
      v15 = self->_dynamicPageSectionIndexMapper;
      self->_dynamicPageSectionIndexMapper = v14;

      dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    }
    -[SUUIDynamicPageSectionIndexMapper setEntityProvider:](dynamicPageSectionIndexMapper, "setEntityProvider:", self->_entityProvider);
  }
  -[SUUIShelfPageSectionConfiguration reloadLockupTypeForShelfViewElement:](self->_configuration, "reloadLockupTypeForShelfViewElement:", self->_dynamicShelfViewElement);

}

- (id)_viewElementForEntityAtGlobalIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SUUIDynamicPageSectionIndexMapper entityIndexPathForGlobalIndex:](self->_dynamicPageSectionIndexMapper, "entityIndexPathForGlobalIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIEntityProviding entityValueProviderAtIndexPath:](self->_entityProvider, "entityValueProviderAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDynamicShelfViewElement cellTemplateViewElement](self->_dynamicShelfViewElement, "cellTemplateViewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntityValueProvider:", v5);

  return v6;
}

- (SUUIShelfPageSectionConfiguration)configuration
{
  return self->_configuration;
}

- (SUUIScrollViewDelegateObserver)scrollViewDelegateObserver
{
  return (SUUIScrollViewDelegateObserver *)objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
}

- (void)setScrollViewDelegateObserver:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegateObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewDelegateObserver);
  objc_storeStrong((id *)&self->_labelLayoutCache, 0);
  objc_storeStrong((id *)&self->_entityProvider, 0);
  objc_storeStrong((id *)&self->_dynamicShelfViewElement, 0);
  objc_storeStrong((id *)&self->_dynamicPageSectionIndexMapper, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

@end
