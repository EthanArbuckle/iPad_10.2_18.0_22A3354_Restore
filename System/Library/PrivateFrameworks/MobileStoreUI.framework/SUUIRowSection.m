@implementation SUUIRowSection

- (SUUIRowSection)initWithPageComponent:(id)a3
{
  SUUIRowSection *v3;
  uint64_t v4;
  NSMapTable *componentArtworkRequestIDs;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIRowSection;
  v3 = -[SUUIStorePageSection initWithPageComponent:](&v8, sel_initWithPageComponent_, a3);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    componentArtworkRequestIDs = v3->_componentArtworkRequestIDs;
    v3->_componentArtworkRequestIDs = (NSMapTable *)v4;

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_isPad = objc_msgSend(v6, "userInterfaceIdiom") == 1;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SUUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", 0);
  -[SUUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SUUIRowSection;
  -[SUUIStorePageSection dealloc](&v4, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a4;
  v6 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addItemViewElement:", v8);

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "childComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "item");

  if (v11 < objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "componentType");
    if (v13 != 10)
    {
      if (v13 == 9)
      {
        objc_msgSend(v12, "item");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v19, "itemIdentifier");

      }
      else
      {
        if (v13 == 7)
        {
          -[NSMapTable objectForKey:](self->_galleryViewControllers, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "selectedMediaComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "mediaIdentifier");

          objc_msgSend(v14, "selectedMediaComponent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "viewElement");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
          objc_msgSend(v20, "addItemIdentifier:", v16);
          objc_msgSend(v20, "addItemViewElement:", v18);

          goto LABEL_11;
        }
        v16 = 0;
      }
      v18 = 0;
      goto LABEL_10;
    }
    v16 = objc_msgSend(v12, "mediaIdentifier");
    objc_msgSend(v12, "viewElement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:

}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SUUIRowSection;
    -[SUUIStorePageSection backgroundColorForIndexPath:](&v10, sel_backgroundColorForIndexPath_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "item");
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "childComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 >= objc_msgSend(v9, "count"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_msgSend(v10, "componentType");
  if (v11 == 5)
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x251211FC8, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRowSection _reloadEditorialCell:forComponent:columnIndex:](self, "_reloadEditorialCell:forComponent:columnIndex:", v13, v10, v7);
  }
  else if (v11 == 9)
  {
    objc_msgSend(v10, "editorial");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x251200848, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIRowSection _reloadEditorialLockupCell:forComponent:columnIndex:](self, "_reloadEditorialLockupCell:forComponent:columnIndex:", v13, v10, v7);
    }
    else
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x25120D368, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIRowSection _reloadLockupCell:forComponent:columnIndex:](self, "_reloadLockupCell:forComponent:columnIndex:", v13, v10, v7);
    }
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("SUUIRowSectionMiscReuseIdentifer"), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SUUIRowSection _columnViews](self, "_columnViews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v13, "setContentChildView:", v15);
    -[SUUIRowSection _edgeInsetsForColumnIndex:](self, "_edgeInsetsForColumnIndex:", v7);
    objc_msgSend(v13, "setContentInsets:");
    v16 = objc_msgSend(v10, "componentType");
    if (v16 == 10)
    {
      -[SUUIRowSection _reloadView:forMediaComponent:columnIndex:](self, "_reloadView:forMediaComponent:columnIndex:", v15, v10, v7);
    }
    else if (v16 == 7)
    {
      -[SUUIRowSection _loadImagesForGalleryComponent:columnIndex:](self, "_loadImagesForGalleryComponent:columnIndex:", v10, v7);
    }

  }
  return v13;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v20;
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
  CGSize result;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_isPad || !objc_msgSend(v11, "shouldAutoFlow"))
  {
    if (v8 <= v10)
      v18 = 184;
    else
      v18 = 152;
    v17 = *(double *)((char *)&self->super.super.isa + v18);
    if (v17 < 0.00000011920929)
    {
      -[SUUIRowSection _cellContentHeightForRowWidth:](self, "_cellContentHeightForRowWidth:", v8);
      v17 = *(double *)&v19;
      *(Class *)((char *)&self->super.super.isa + v18) = v19;
    }
  }
  else
  {
    v13 = objc_msgSend(v4, "item");
    objc_msgSend(v12, "childComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIRowSection _heightForComponent:columnIndex:rowWidth:](self, "_heightForComponent:columnIndex:rowWidth:", v15, (double)v13, v8);
    v17 = v16;

  }
  v20 = objc_msgSend(v4, "item");
  -[SUUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", v20, v8);
  v22 = v21;
  -[SUUIRowSection _edgeInsetsForColumnIndex:](self, "_edgeInsetsForColumnIndex:", v20);
  v25 = v17 + v24 + v23;
  v28 = v22 + v26 + v27;

  v29 = v28;
  v30 = v25;
  result.height = v30;
  result.width = v29;
  return result;
}

- (id)clickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIRowSection;
  -[SUUIStorePageSection clickEventWithItem:elementName:index:](&v9, sel_clickEventWithItem_elementName_index_, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRowSection _setPositionForClickEvent:elementIndex:](self, "_setPositionForClickEvent:elementIndex:", v7, a5);
  return v7;
}

- (void)collectionViewDidConfirmItemOfferAtIndexPath:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = objc_msgSend(v16, "item");
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "componentType") == 9)
  {
    -[SUUIStorePageSection context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRowSection itemOfferClickEventWithItem:elementName:index:](self, "itemOfferClickEventWithItem:elementName:index:", v9, CFSTR("Column"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v8, "metricsController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "recordEvent:", v10);

    }
    objc_msgSend(v8, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cellForItemAtIndexPath:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIStorePageSection performItemOfferActionForItem:](self, "performItemOfferActionForItem:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setItemState:animated:", v14, 1);

  }
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v8, "componentType"))
  {
    case 5:
      -[SUUIRowSection _expandEditorialComponent:columnIndex:](self, "_expandEditorialComponent:columnIndex:", v8, v5);
      break;
    case 7:
      -[SUUIRowSection _selectGalleryComponent:columnIndex:](self, "_selectGalleryComponent:columnIndex:", v8, v5);
      break;
    case 9:
      -[SUUIRowSection _selectLockupComponent:columnIndex:](self, "_selectLockupComponent:columnIndex:", v8, v5);
      break;
    case 10:
      -[SUUIRowSection _selectMediaComponent:columnIndex:](self, "_selectMediaComponent:columnIndex:", v8, v5);
      break;
    default:
      break;
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUIRowSection;
  -[SUUIStorePageSection collectionViewDidSelectItemAtIndexPath:](&v9, sel_collectionViewDidSelectItemAtIndexPath_, v4);

}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRowSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SUUIRowSection;
  -[SUUIStorePageSection collectionViewWillApplyLayoutAttributes:](&v7, sel_collectionViewWillApplyLayoutAttributes_, v4);

}

- (void)invalidateCachedLayoutInformation
{
  objc_super v2;

  self->_landscapeCellContentHeight = 0.0;
  self->_portraitCellContentHeight = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)SUUIRowSection;
  -[SUUIStorePageSection invalidateCachedLayoutInformation](&v2, sel_invalidateCachedLayoutInformation);
}

- (id)itemOfferClickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIRowSection;
  -[SUUIStorePageSection itemOfferClickEventWithItem:elementName:index:](&v9, sel_itemOfferClickEventWithItem_elementName_index_, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRowSection _setPositionForClickEvent:elementIndex:](self, "_setPositionForClickEvent:elementIndex:", v7, a5);
  return v7;
}

- (int64_t)numberOfCells
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "columnWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "integerValue");
      }
      v7 += v5;
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v10 = objc_msgSend(v2, "numberOfColumns");

  return v7 - v6 + v10;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  void *v5;
  id v6;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isMissingItemData"))
  {
    -[SUUIRowSection _missingItemLoader](self, "_missingItemLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadItemsForPageComponent:startIndex:reason:", v6, 0, a3);

  }
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SUUIClientContext *v9;
  SUUIClientContext *clientContext;
  void *v11;
  objc_super v12;
  _QWORD v13[5];

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SUUIRowSectionMiscReuseIdentifer"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251211FC8);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x25120D368);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x251200848);
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __38__SUUIRowSection_willAppearInContext___block_invoke;
  v13[3] = &unk_2511F7750;
  v13[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
  objc_msgSend(v4, "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientContext");
  v9 = (SUUIClientContext *)objc_claimAutoreleasedReturnValue();
  clientContext = self->_clientContext;
  self->_clientContext = v9;

  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:", self);

  v12.receiver = self;
  v12.super_class = (Class)SUUIRowSection;
  -[SUUIStorePageSection willAppearInContext:](&v12, sel_willAppearInContext_, v4);

}

void __38__SUUIRowSection_willAppearInContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(v8, "componentType");
  if (v5 == 9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_editorialLayoutForLockup:columnIndex:", v8, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v5 == 5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_editorialLayoutForEditorial:columnIndex:", v8, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v6;
    objc_msgSend(v6, "enqueueLayoutRequests");

  }
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
  v6.super_class = (Class)SUUIRowSection;
  -[SUUIStorePageSection willHideInContext:](&v6, sel_willHideInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  _BOOL8 v18;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[SUUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "childComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__SUUIRowSection_willTransitionToSize_withTransitionCoordinator___block_invoke;
  v15[3] = &unk_2511F7778;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = width > height;
  v13 = v9;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);
  v14.receiver = self;
  v14.super_class = (Class)SUUIRowSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v14, sel_willTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

void __65__SUUIRowSection_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = objc_msgSend(v10, "componentType");
  if (v5 == 9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_editorialLayoutForLockup:columnIndex:", v10, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applyEditorialLayout:withOrientation:", v6, *(_QWORD *)(a1 + 56));
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v5 == 5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_editorialLayoutForEditorial:columnIndex:", v10, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applyEditorialLayout:withOrientation:expanded:", v6, *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "containsIndex:", a3));
LABEL_7:

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v6 = a4;
  v7 = a3;
  -[SUUIRowSection _columnViews](self, "_columnViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "requestIdentifier");

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "childComponents");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__SUUIRowSection_artworkRequest_didLoadImage___block_invoke;
  v14[3] = &unk_2511F77A0;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  v17 = v9;
  v11 = v8;
  v12 = v6;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

}

void __46__SUUIRowSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "unsignedIntegerValue") == *(_QWORD *)(a1 + 56))
  {
    v8 = objc_msgSend(v14, "componentType");
    if (v8 == 10)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setThumbnailImage:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (v8 != 9)
      {
LABEL_7:
        *a4 = 1;
        goto LABEL_8;
      }
      objc_msgSend(*(id *)(a1 + 32), "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, objc_msgSend(*(id *)(a1 + 32), "sectionIndex"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cellForItemAtIndexPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "layout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIconImage:", *(_QWORD *)(a1 + 40));

    }
    goto LABEL_7;
  }
LABEL_8:

}

- (void)mediaView:(id)a3 playbackStateDidChange:(int64_t)a4
{
  id v6;
  NSMapTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMapTable *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = self->_columnViews;
  v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
      -[NSMapTable objectForKey:](self->_columnViews, "objectForKey:", v12, (_QWORD)v31);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isDescendantOfView:", v13))
        break;

      if (v9 == ++v11)
      {
        v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_24;
      }
    }
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "childComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "indexOfObjectIdenticalTo:", v12);

    v17 = objc_msgSend(v12, "componentType");
    if (v17 == 10)
    {
      v19 = v12;
    }
    else
    {
      if (v17 != 7)
      {
        v19 = v7;
LABEL_23:

        v7 = v19;
        goto LABEL_24;
      }
      -[NSMapTable objectForKey:](self->_galleryViewControllers, "objectForKey:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "selectedMediaComponent");
      v19 = (NSMapTable *)objc_claimAutoreleasedReturnValue();

    }
    if (!v19)
      goto LABEL_25;
    -[SUUIStorePageSection context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "metricsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "canRecordEventWithType:", *MEMORY[0x24BEB2920]))
    {
      v21 = objc_alloc_init(MEMORY[0x24BEB1F08]);
      SUUIMetricsMediaEventTypeForPlaybackState((id)a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setMediaEventType:", v22);

      -[SUUIStorePageSection pageComponent](self, "pageComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "locationWithPageComponent:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "locationWithPosition:type:fieldData:", v16, CFSTR("Column"), 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v24 && v25)
      {
        v35[0] = v25;
        v35[1] = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLocationWithEventLocations:", v27);

      }
      v28 = -[NSMapTable mediaIdentifier](v19, "mediaIdentifier");
      if (v28)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setItemIdentifier:", v29);

      }
      -[NSMapTable mediaURLString](v19, "mediaURLString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setMediaURL:", v30);

      objc_msgSend(v13, "recordEvent:", v21);
    }
    goto LABEL_23;
  }
LABEL_24:

LABEL_25:
}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "itemIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __52__SUUIRowSection_itemStateCenter_itemStatesChanged___block_invoke;
  v15[3] = &unk_2511F46D0;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

void __52__SUUIRowSection_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__SUUIRowSection_itemStateCenter_itemStatesChanged___block_invoke_2;
  v6[3] = &unk_2511F77C8;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "_enumerateLockupsWithBlock:", v6);

}

void __52__SUUIRowSection_itemStateCenter_itemStatesChanged___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "cellForItemAtIndexPath:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v7, "itemIdentifier"));
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v12, "layout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setItemState:animated:", v10, 1);

    }
  }

}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__SUUIRowSection_itemStateCenterRestrictionsChanged___block_invoke;
  v6[3] = &unk_2511F46D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __53__SUUIRowSection_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__SUUIRowSection_itemStateCenterRestrictionsChanged___block_invoke_2;
  v6[3] = &unk_2511F77C8;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "_enumerateLockupsWithBlock:", v6);

}

void __53__SUUIRowSection_itemStateCenterRestrictionsChanged___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "cellForItemAtIndexPath:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v6, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRestricted:", objc_msgSend(v8, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v9, "parentalControlsRank")));
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SUUIRowSection *v18;
  int64_t v19;

  v14 = a4;
  if (objc_msgSend(v14, "count"))
  {
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateWithMissingItems:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v6, "childComponents");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStorePageSection context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __72__SUUIRowSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
      v15[3] = &unk_2511F77F0;
      v16 = v10;
      v17 = v8;
      v18 = self;
      v19 = v11;
      v12 = v8;
      v13 = v10;
      objc_msgSend(v7, "enumerateIndexesUsingBlock:", v15);

    }
  }

}

void __72__SUUIRowSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editorial");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 48);
    if (v7)
      objc_msgSend(v8, "_reloadEditorialLockupCell:forComponent:columnIndex:", v9, v6, a2);
    else
      objc_msgSend(v8, "_reloadLockupCell:forComponent:columnIndex:", v9, v6, a2);

  }
}

- (void)productPageOverlayDidDismiss:(id)a3
{
  void *v4;
  SUUILockupComponent *overlaySourceComponent;
  void *v6;
  void *v7;
  SUUIProductPageOverlayController *overlayController;
  id v9;

  -[SUUIRowSection _overlaySourceCell](self, "_overlaySourceCell", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconImageHidden:", 0);

  overlaySourceComponent = self->_overlaySourceComponent;
  self->_overlaySourceComponent = 0;

  -[SUUIStorePageSection context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pageSectionDidDismissOverlayController:", self->_overlayController);

  -[SUUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", 0);
  overlayController = self->_overlayController;
  self->_overlayController = 0;

}

- (double)_cellContentHeightForRowWidth:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  _QWORD v9[7];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__SUUIRowSection__cellContentHeightForRowWidth___block_invoke;
  v9[3] = &unk_2511F7818;
  *(double *)&v9[6] = a3;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  v7 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __48__SUUIRowSection__cellContentHeightForRowWidth___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;
  double v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "_heightForComponent:columnIndex:rowWidth:", a2, (double)a3, *(double *)(a1 + 48));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v6 + 24) >= v5)
    v5 = *(double *)(v6 + 24);
  *(double *)(v6 + 24) = v5;
  return result;
}

- (id)_columnViews
{
  NSMapTable *columnViews;
  NSMapTable *v4;
  NSMapTable *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  columnViews = self->_columnViews;
  if (!columnViews)
  {
    v4 = (NSMapTable *)objc_alloc_init(MEMORY[0x24BDD1650]);
    v5 = self->_columnViews;
    self->_columnViews = v4;

    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "childComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __30__SUUIRowSection__columnViews__block_invoke;
    v9[3] = &unk_2511F7750;
    v9[4] = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

    columnViews = self->_columnViews;
  }
  return columnViews;
}

void __30__SUUIRowSection__columnViews__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "componentType");
  switch(v3)
  {
    case 10:
      v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newViewWithMediaComponent:", v7);
      if (!v5)
        goto LABEL_10;
      goto LABEL_9;
    case 7:
      objc_msgSend(*(id *)(a1 + 32), "_viewControllerForGalleryComponent:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_viewControllerForCountdownComponent:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_10;
  }
  v6 = v4;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_9:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKey:", v5, v7);

  }
LABEL_10:

}

- (double)_columnWidthForColumnIndex:(int64_t)a3 rowWidth:(double)a4
{
  void *v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_isPad || !objc_msgSend(v7, "shouldAutoFlow"))
  {
    objc_msgSend(v8, "columnWidths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "numberOfColumns");
    -[SUUIRowSection _interColumnSpacing](self, "_interColumnSpacing");
    v13 = v12;
    *(float *)&v12 = (a4 + -30.0 - v12 * (double)(v11 - 1)) / (double)v11;
    v14 = floorf(*(float *)&v12);
    if (a3 < 1)
    {
      v16 = 15.0;
    }
    else
    {
      v15 = 0;
      v16 = 15.0;
      do
      {
        if (objc_msgSend(v10, "count") <= (unint64_t)a3)
        {
          v18 = 1;
        }
        else
        {
          objc_msgSend(v10, "objectAtIndex:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "integerValue");

        }
        v16 = v13 + v16 + v13 * (double)(v18 - 1) + (double)v18 * v14;
        ++v15;
      }
      while (a3 != v15);
    }
    if (objc_msgSend(v10, "count") <= (unint64_t)a3)
    {
      v20 = 1;
    }
    else
    {
      objc_msgSend(v10, "objectAtIndex:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "integerValue");

    }
    if (v11 - v20 == a3)
      v9 = a4 + -15.0 - v16;
    else
      v9 = v13 * (double)(v20 - 1) + (double)v20 * v14;

  }
  else
  {
    v9 = a4 + -30.0;
  }

  return v9;
}

- (UIEdgeInsets)_edgeInsetsForColumnIndex:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRowSection _interColumnSpacing](self, "_interColumnSpacing");
  v7 = v6;
  v8 = objc_msgSend(v5, "numberOfColumns");
  if (self->_isPad || (v9 = 15.0, v10 = 15.0, (objc_msgSend(v5, "shouldAutoFlow") & 1) == 0))
  {
    v11 = v7 * 0.5;
    v12 = floorf(v11);
    if (a3)
      v10 = v12;
    else
      v10 = 15.0;
    if (v8 - 1 == a3)
      v9 = 15.0;
    else
      v9 = v12;
  }

  v13 = 15.0;
  v14 = 15.0;
  v15 = v10;
  v16 = v9;
  result.right = v16;
  result.bottom = v14;
  result.left = v15;
  result.top = v13;
  return result;
}

- (id)_editorialLayoutForEditorial:(id)a3 columnIndex:(int64_t)a4
{
  id v6;
  NSMapTable *editorialLayouts;
  NSMapTable *v8;
  NSMapTable *v9;
  SUUIEditorialLayout *v10;
  void *v11;
  SUUIEditorialLayout *v12;
  void *v13;
  void *v14;

  v6 = a3;
  editorialLayouts = self->_editorialLayouts;
  if (!editorialLayouts)
  {
    v8 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    v9 = self->_editorialLayouts;
    self->_editorialLayouts = v8;

    editorialLayouts = self->_editorialLayouts;
  }
  -[NSMapTable objectForKey:](editorialLayouts, "objectForKey:", v6);
  v10 = (SUUIEditorialLayout *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[SUUIStorePageSection context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [SUUIEditorialLayout alloc];
    -[SUUIStorePageSection context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textLayoutCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SUUIEditorialLayout initWithEditorial:layoutCache:](v12, "initWithEditorial:layoutCache:", v6, v14);

    objc_msgSend(v11, "portraitPageWidth");
    -[SUUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", a4);
    -[SUUIEditorialLayout setLayoutWidth:forOrientation:](v10, "setLayoutWidth:forOrientation:", 0);
    objc_msgSend(v11, "landscapePageWidth");
    -[SUUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", a4);
    -[SUUIEditorialLayout setLayoutWidth:forOrientation:](v10, "setLayoutWidth:forOrientation:", 1);
    -[NSMapTable setObject:forKey:](self->_editorialLayouts, "setObject:forKey:", v10, v6);

  }
  return v10;
}

- (id)_editorialLayoutForLockup:(id)a3 columnIndex:(int64_t)a4
{
  id v6;
  void *v7;
  NSMapTable *editorialLayouts;
  NSMapTable *v9;
  NSMapTable *v10;
  SUUIEditorialLayout *v11;
  void *v12;
  SUUIEditorialLayout *v13;
  void *v14;
  void *v15;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v6 = a3;
  objc_msgSend(v6, "editorial");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    editorialLayouts = self->_editorialLayouts;
    if (!editorialLayouts)
    {
      v9 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      v10 = self->_editorialLayouts;
      self->_editorialLayouts = v9;

      editorialLayouts = self->_editorialLayouts;
    }
    -[NSMapTable objectForKey:](editorialLayouts, "objectForKey:", v7);
    v11 = (SUUIEditorialLayout *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[SUUIStorePageSection context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = [SUUIEditorialLayout alloc];
      -[SUUIStorePageSection context](self, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textLayoutCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SUUIEditorialLayout initWithEditorial:layoutCache:](v13, "initWithEditorial:layoutCache:", v7, v15);

      v19 = 0uLL;
      v20 = 0;
      -[SUUIRowSection _lockupStyleForComponent:columnIndex:](self, "_lockupStyleForComponent:columnIndex:", v6, a4);
      objc_msgSend(v12, "portraitPageWidth");
      -[SUUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", a4);
      v17 = v19;
      v18 = v20;
      +[SUUIEditorialLockupCellLayout editorialWidthForCellWidth:lockupStyle:](SUUIEditorialLockupCellLayout, "editorialWidthForCellWidth:lockupStyle:", &v17);
      -[SUUIEditorialLayout setLayoutWidth:forOrientation:](v11, "setLayoutWidth:forOrientation:", 0);
      objc_msgSend(v12, "landscapePageWidth");
      -[SUUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", a4);
      v17 = v19;
      v18 = v20;
      +[SUUIEditorialLockupCellLayout editorialWidthForCellWidth:lockupStyle:](SUUIEditorialLockupCellLayout, "editorialWidthForCellWidth:lockupStyle:", &v17);
      -[SUUIEditorialLayout setLayoutWidth:forOrientation:](v11, "setLayoutWidth:forOrientation:", 1);
      -[NSMapTable setObject:forKey:](self->_editorialLayouts, "setObject:forKey:", v11, v7);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_enumerateLockupsWithBlock:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v4 = a3;
  v5 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__SUUIRowSection__enumerateLockupsWithBlock___block_invoke;
  v9[3] = &unk_2511F7840;
  v10 = v4;
  v11 = v5;
  v8 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __45__SUUIRowSection__enumerateLockupsWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "componentType") == 9)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)_expandEditorialComponent:(id)a3 columnIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  NSMutableIndexSet *expandedEditorialIndexes;
  NSMutableIndexSet *v13;
  NSMutableIndexSet *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = SUUIEditorialLayoutOrientationForView(v8);
  -[SUUIRowSection _editorialLayoutForEditorial:columnIndex:](self, "_editorialLayoutForEditorial:columnIndex:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "bodyTextLayoutForOrientation:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "requiresTruncation")
    && (-[NSMutableIndexSet containsIndex:](self->_expandedEditorialIndexes, "containsIndex:", a4) & 1) == 0)
  {
    expandedEditorialIndexes = self->_expandedEditorialIndexes;
    if (!expandedEditorialIndexes)
    {
      v13 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
      v14 = self->_expandedEditorialIndexes;
      self->_expandedEditorialIndexes = v13;

      expandedEditorialIndexes = self->_expandedEditorialIndexes;
    }
    -[NSMutableIndexSet addIndex:](expandedEditorialIndexes, "addIndex:", a4);
    self->_landscapeCellContentHeight = 0.0;
    self->_portraitCellContentHeight = 0.0;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a4, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadItemsAtIndexPaths:", v16);

  }
}

- (double)_heightForArtwork:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  float v13;

  v8 = a3;
  -[SUUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", a4, a5);
  v10 = v9;
  v11 = (double)objc_msgSend(v8, "height");
  v12 = objc_msgSend(v8, "width");

  v13 = v10 / (double)v12 * v11;
  return floorf(v13);
}

- (double)_heightForComponent:(id)a3 columnIndex:(double)a4 rowWidth:(double)a5
{
  id v8;
  double v9;
  double v10;

  v8 = a3;
  v9 = 0.0;
  switch(objc_msgSend(v8, "componentType"))
  {
    case 2:
      -[SUUIRowSection _heightForCountdownComponent:columnIndex:rowWidth:](self, "_heightForCountdownComponent:columnIndex:rowWidth:", v8, (uint64_t)a4, a5);
      goto LABEL_8;
    case 5:
      -[SUUIRowSection _heightForEditorialComponent:columnIndex:rowWidth:](self, "_heightForEditorialComponent:columnIndex:rowWidth:", v8, (uint64_t)a4, a5);
      goto LABEL_8;
    case 7:
      -[SUUIRowSection _heightForGalleryComponent:columnIndex:rowWidth:](self, "_heightForGalleryComponent:columnIndex:rowWidth:", v8, (uint64_t)a4, a5);
      goto LABEL_8;
    case 9:
      -[SUUIRowSection _heightForLockupComponent:columnIndex:rowWidth:](self, "_heightForLockupComponent:columnIndex:rowWidth:", v8, (uint64_t)a4, a5);
      goto LABEL_8;
    case 10:
      -[SUUIRowSection _heightForMediaComponent:columnIndex:rowWidth:](self, "_heightForMediaComponent:columnIndex:rowWidth:", v8, (uint64_t)a4, a5);
      goto LABEL_8;
    case 14:
      objc_msgSend(v8, "height");
LABEL_8:
      v9 = v10;
      break;
    default:
      break;
  }

  return v9;
}

- (double)_heightForCountdownComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  objc_msgSend(a3, "countdown");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artworkProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "largestArtwork");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUUIRowSection _heightForArtwork:columnIndex:rowWidth:](self, "_heightForArtwork:columnIndex:rowWidth:", v10, a4, a5);
    v12 = v11;
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

- (double)_heightForEditorialComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  double v11;
  double v12;

  -[SUUIRowSection _editorialLayoutForEditorial:columnIndex:](self, "_editorialLayoutForEditorial:columnIndex:", a3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = SUUIEditorialLayoutOrientationForView(v9);

  objc_msgSend(v7, "layoutHeightForOrientation:expanded:", v10, -[NSMutableIndexSet containsIndex:](self->_expandedEditorialIndexes, "containsIndex:", a4));
  v12 = v11 + 17.0;

  return v12;
}

- (double)_heightForGalleryComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "childComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[SUUIRowSection _heightForMediaComponent:columnIndex:rowWidth:](self, "_heightForMediaComponent:columnIndex:rowWidth:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), a4, a5);
        if (v12 < v14)
          v12 = v14;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

- (double)_heightForLockupComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  double v18;
  double v19;
  double v20;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v7 = a3;
  -[SUUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editorial");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0uLL;
  v25 = 0;
  -[SUUIRowSection _lockupStyleForComponent:columnIndex:](self, "_lockupStyleForComponent:columnIndex:", v7, a4);
  objc_msgSend(v7, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v24;
  v23 = v25;
  +[SUUILockupItemCellLayout heightForLockupStyle:item:editorial:clientContext:](SUUILockupItemCellLayout, "heightForLockupStyle:item:editorial:clientContext:", &v22, v10, v9, v12);
  v14 = v13;

  if (v9)
  {
    -[SUUIRowSection _editorialLayoutForLockup:columnIndex:](self, "_editorialLayoutForLockup:columnIndex:", v7, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = SUUIEditorialLayoutOrientationForView(v16);

    objc_msgSend(v15, "layoutHeightForOrientation:expanded:", v17, 1);
    v19 = v18 + 17.0;
    if (SUUILockupLayoutStyleIsHorizontal(*((uint64_t *)&v24 + 1)))
    {
      v14 = v14 + v19;
    }
    else
    {
      v20 = v19 + 26.0;
      if ((v25 & 4) == 0)
        v20 = v19;
      if (v20 >= v14)
        v14 = v20;
    }

  }
  return v14;
}

- (double)_heightForMediaComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  void *v8;
  double v9;
  double v10;

  objc_msgSend(a3, "bestThumbnailArtwork");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SUUIRowSection _heightForArtwork:columnIndex:rowWidth:](self, "_heightForArtwork:columnIndex:rowWidth:", v8, a4, a5);
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (id)_imageConsumerWithItem:(id)a3 lockupSize:(int64_t)a4
{
  unint64_t v5;
  void *v6;

  v5 = objc_msgSend(a3, "itemKind");
  if (v5 <= 0x11 && ((1 << v5) & 0x21020) != 0)
  {
    +[SUUIStyledImageDataConsumer lockupIconConsumerWithSize:](SUUIStyledImageDataConsumer, "lockupIconConsumerWithSize:", a4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SUUIProductImageDataConsumer lockupConsumerWithSize:itemKind:](SUUIProductImageDataConsumer, "lockupConsumerWithSize:itemKind:", a4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (double)_interColumnSpacing
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  if (!self->_isPad)
    return 20.0;
  -[SUUIStorePageSection context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  result = 28.0;
  if (v5 > v7)
    return 30.0;
  return result;
}

- (void)_loadImagesForGalleryComponent:(id)a3 columnIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v14 = a3;
  -[SUUIRowSection _viewControllerForGalleryComponent:](self, "_viewControllerForGalleryComponent:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SUUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "landscapePageWidth");
    v9 = v8;
    objc_msgSend(v7, "portraitPageWidth");
    if (v9 >= v10)
      v10 = v9;
    -[SUUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", a4, v10);
    v12 = v11;
    objc_msgSend(v14, "childComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61__SUUIRowSection__loadImagesForGalleryComponent_columnIndex___block_invoke;
    v15[3] = &unk_2511F7868;
    v16 = v6;
    v17 = v12;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

  }
}

uint64_t __61__SUUIRowSection__loadImagesForGalleryComponent_columnIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadArtworkForChildComponent:reason:constraintWidth:", a2, a3 == 0, *(double *)(a1 + 40));
}

- (id)_lockupImageForComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  SUUIArtworkRequest *v18;
  void *v19;
  NSMapTable *componentArtworkRequestIDs;
  void *v21;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_componentArtworkRequestIDs, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v6, "cachedResourceForRequestIdentifier:", objc_msgSend(v7, "unsignedIntegerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
LABEL_6:
      v12 = v11;
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v8, "unsignedIntegerValue")))
    {
      -[SUUIRowSection _lockupPlaceholderForComponent:](self, "_lockupPlaceholderForComponent:", v4);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  objc_msgSend(v4, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "lockupStyle");
  v13 = SUUILockupImageSizeForLockupSize(0, objc_msgSend(v10, "itemKind"));
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = (uint64_t)(v15 * (double)(uint64_t)v13);

  objc_msgSend(v10, "artworkURLForSize:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = objc_alloc_init(SUUIArtworkRequest);
    -[SUUIRowSection _imageConsumerWithItem:lockupSize:](self, "_imageConsumerWithItem:lockupSize:", v10, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkRequest setDataConsumer:](v18, "setDataConsumer:", v19);

    -[SUUIArtworkRequest setDelegate:](v18, "setDelegate:", self);
    -[SUUIArtworkRequest setURL:](v18, "setURL:", v17);
    componentArtworkRequestIDs = self->_componentArtworkRequestIDs;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v18, "requestIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](componentArtworkRequestIDs, "setObject:forKey:", v21, v4);

    objc_msgSend(v6, "loadResourceWithRequest:reason:", v18, 1);
  }
  -[SUUIRowSection _lockupPlaceholderForComponent:](self, "_lockupPlaceholderForComponent:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v12;
}

- (id)_lockupPlaceholderForComponent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "lockupStyle");
    v6 = v11;
  }
  else
  {
    v6 = 0;
  }
  -[SUUIRowSection _imageConsumerWithItem:lockupSize:](self, "_imageConsumerWithItem:lockupSize:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageForColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SUUILockupStyle)_lockupStyleForComponent:(SEL)a3 columnIndex:(id)a4
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SUUILockupStyle *result;
  int64_t layoutStyle;
  id v16;

  v8 = a4;
  retstr->layoutStyle = 0;
  retstr->visibleFields = 0;
  retstr->artworkSize = 0;
  v16 = v8;
  if (v8)
  {
    objc_msgSend(v8, "lockupStyle");
    v8 = v16;
  }
  if (self->_isPad)
  {
    if ((unint64_t)(retstr->artworkSize - 3) >= 2)
    {
      if (retstr->artworkSize != 5)
        goto LABEL_13;
    }
    else
    {
      -[SUUIStorePageSection pageComponent](self, "pageComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "numberOfColumns") < 2)
      {

        goto LABEL_12;
      }
      objc_msgSend(v9, "columnWidths");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "integerValue");
      v8 = v16;
      if (v12 != 1)
        goto LABEL_13;
    }
    objc_msgSend(v8, "editorial");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      retstr->layoutStyle = 0;
LABEL_12:
      v8 = v16;
      goto LABEL_13;
    }
    layoutStyle = retstr->layoutStyle;
    if (layoutStyle == 1)
    {
      retstr->layoutStyle = 3;
      goto LABEL_12;
    }
    v8 = v16;
    if (!layoutStyle)
      retstr->layoutStyle = 2;
  }
LABEL_13:

  return result;
}

- (id)_missingItemLoader
{
  SUUIMissingItemLoader *missingItemLoader;
  SUUIMissingItemLoader *v4;
  void *v5;
  void *v6;
  SUUIMissingItemLoader *v7;
  SUUIMissingItemLoader *v8;

  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    v4 = [SUUIMissingItemLoader alloc];
    -[SUUIStorePageSection context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resourceLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SUUIMissingItemLoader initWithResourceLoader:](v4, "initWithResourceLoader:", v6);
    v8 = self->_missingItemLoader;
    self->_missingItemLoader = v7;

    -[SUUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", self);
    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (id)_newSizeToFitArtworkRequestWithArtwork:(id)a3 columnIndex:(int64_t)a4
{
  id v6;
  SUUIArtworkRequest *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v6 = a3;
  v7 = objc_alloc_init(SUUIArtworkRequest);
  -[SUUIArtworkRequest setDelegate:](v7, "setDelegate:", self);
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIArtworkRequest setURL:](v7, "setURL:", v8);
  -[SUUIStorePageSection context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "landscapePageWidth");
  v11 = v10;
  objc_msgSend(v9, "portraitPageWidth");
  if (v11 >= v12)
    v12 = v11;
  -[SUUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", a4, v12);
  +[SUUISizeToFitImageDataConsumer consumerWithConstraintSize:](SUUISizeToFitImageDataConsumer, "consumerWithConstraintSize:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIArtworkRequest setDataConsumer:](v7, "setDataConsumer:", v13);

  return v7;
}

- (id)_newViewWithMediaComponent:(id)a3
{
  SUUIEmbeddedMediaView *v4;

  v4 = objc_alloc_init(SUUIEmbeddedMediaView);
  -[SUUIEmbeddedMediaView setDelegate:](v4, "setDelegate:", self);
  return v4;
}

- (id)_overlaySourceCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (self->_overlaySourceComponent)
  {
    -[SUUIStorePageSection context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "childComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", self->_overlaySourceComponent);

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v7, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForItemAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_popSourceViewForOverlayController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = v4;
  if (self->_overlaySourceComponent && objc_msgSend(v4, "numberOfVisibleOverlays") <= 1)
  {
    -[SUUIRowSection _overlaySourceCell](self, "_overlaySourceCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iconImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(v7, "iconImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithImage:", v18);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v20);

    objc_msgSend(v8, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "convertRect:toView:", 0, v10, v12, v14, v16);
    objc_msgSend(v19, "setFrame:");

    objc_msgSend(v7, "setIconImageHidden:", 1);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_reloadEditorialCell:(id)a3 forComponent:(id)a4 columnIndex:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a4;
  -[SUUIRowSection _editorialLayoutForEditorial:columnIndex:](self, "_editorialLayoutForEditorial:columnIndex:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSection context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = SUUIEditorialLayoutOrientationForView(v11);

  if ((-[NSMutableIndexSet containsIndex:](self->_expandedEditorialIndexes, "containsIndex:", a5) & 1) != 0)
    v13 = 0;
  else
    v13 = objc_msgSend(v8, "maximumBodyLines");
  objc_msgSend(v20, "layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applyEditorialLayout:withOrientation:expanded:", v9, v12, v13 == 0);
  -[SUUIRowSection _edgeInsetsForColumnIndex:](self, "_edgeInsetsForColumnIndex:", a5);
  objc_msgSend(v14, "setContentInset:");
  -[SUUIStorePageSection context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "parentViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "textBoxView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v17, "localizedStringForKey:", CFSTR("MORE_BUTTON"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("MORE_BUTTON"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMoreButtonTitle:", v19);

  objc_msgSend(v18, "setNumberOfVisibleLines:", v13);
}

- (void)_reloadEditorialLockupCell:(id)a3 forComponent:(id)a4 columnIndex:(int64_t)a5
{
  SUUILockupComponent *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v8 = (SUUILockupComponent *)a4;
  v9 = a3;
  -[SUUIStorePageSection context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientContext:", self->_clientContext);
  -[SUUIRowSection _edgeInsetsForColumnIndex:](self, "_edgeInsetsForColumnIndex:", a5);
  objc_msgSend(v11, "setContentInsets:");
  v23 = 0;
  v24 = 0;
  v25 = 0;
  -[SUUIRowSection _lockupStyleForComponent:columnIndex:](self, "_lockupStyleForComponent:columnIndex:", v8, a5);
  objc_msgSend(v11, "setLayoutStyle:", v24);
  objc_msgSend(v11, "setVisibleFields:", v25);
  -[SUUILockupComponent item](v8, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureForItem:clientContext:", v12, self->_clientContext);
  objc_msgSend(v9, "setSeparatorStyle:", 0);

  -[SUUIRowSection _lockupImageForComponent:](self, "_lockupImageForComponent:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lockupCellLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClientContext:", self->_clientContext);
  objc_msgSend(v14, "setIconImage:", v13);
  objc_msgSend(v14, "setIconImageHidden:", self->_overlaySourceComponent == v8);
  objc_msgSend(v14, "setImageBoundingSize:", SUUILockupImageSizeForLockupSize(v23, objc_msgSend(v12, "itemKind")));
  objc_msgSend(v14, "setLockupSize:", v23);
  -[SUUIRowSection _editorialLayoutForLockup:columnIndex:](self, "_editorialLayoutForLockup:columnIndex:", v8, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = SUUIEditorialLayoutOrientationForView(v17);

  objc_msgSend(v11, "applyEditorialLayout:withOrientation:", v15, v18);
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stateForItemWithIdentifier:", objc_msgSend(v12, "itemIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorScheme");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColoringWithColorScheme:", v21);

  objc_msgSend(v10, "itemOfferButtonAppearance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItemOfferButtonAppearance:", v22);

  objc_msgSend(v11, "setItemState:", v20);
  objc_msgSend(v11, "setRestricted:", objc_msgSend(v19, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v12, "parentalControlsRank")));

}

- (void)_reloadLockupCell:(id)a3 forComponent:(id)a4 columnIndex:(int64_t)a5
{
  SUUILockupComponent *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = (SUUILockupComponent *)a4;
  v9 = a3;
  -[SUUIStorePageSection context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = 0;
  v21 = 0;
  -[SUUIRowSection _lockupStyleForComponent:columnIndex:](self, "_lockupStyleForComponent:columnIndex:", v8, a5);
  objc_msgSend(v11, "setClientContext:", self->_clientContext);
  -[SUUIRowSection _edgeInsetsForColumnIndex:](self, "_edgeInsetsForColumnIndex:", a5);
  objc_msgSend(v11, "setContentInsets:");
  objc_msgSend(v10, "itemOfferButtonAppearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItemOfferButtonAppearance:", v12);

  objc_msgSend(v11, "setLayoutStyle:", v20);
  objc_msgSend(v11, "setLockupSize:", v19);
  objc_msgSend(v11, "setVerticalAlignment:", 0);
  objc_msgSend(v11, "setVisibleFields:", v21);
  -[SUUILockupComponent item](v8, "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureForItem:clientContext:", v13, self->_clientContext);
  objc_msgSend(v9, "setSeparatorStyle:", 0);

  objc_msgSend(v11, "setImageBoundingSize:", SUUILockupImageSizeForLockupSize(v19, objc_msgSend(v13, "itemKind")));
  -[SUUIRowSection _lockupImageForComponent:](self, "_lockupImageForComponent:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIconImage:", v14);
  v15 = self->_overlaySourceComponent == v8;

  objc_msgSend(v11, "setIconImageHidden:", v15);
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stateForItemWithIdentifier:", objc_msgSend(v13, "itemIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorScheme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColoringWithColorScheme:", v18);

  objc_msgSend(v11, "setItemState:", v17);
  objc_msgSend(v11, "setRestricted:", objc_msgSend(v16, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v13, "parentalControlsRank")));

}

- (void)_reloadView:(id)a3 forMediaComponent:(id)a4 columnIndex:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSMapTable *componentArtworkRequestIDs;
  void *v17;
  NSMapTable *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  -[SUUIStorePageSection context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resourceLoader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_componentArtworkRequestIDs, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v10, "cachedResourceForRequestIdentifier:", objc_msgSend(v11, "unsignedIntegerValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setThumbnailImage:", v13);
    if (!v13
      && (objc_msgSend(v10, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v12, "unsignedIntegerValue")) & 1) == 0)
    {
      objc_msgSend(v8, "bestThumbnailArtwork");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = -[SUUIRowSection _newSizeToFitArtworkRequestWithArtwork:columnIndex:](self, "_newSizeToFitArtworkRequestWithArtwork:columnIndex:", v14, a5);
        componentArtworkRequestIDs = self->_componentArtworkRequestIDs;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "requestIdentifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](componentArtworkRequestIDs, "setObject:forKey:", v17, v8);

        objc_msgSend(v10, "loadResourceWithRequest:reason:", v15, 1);
      }
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v8, "bestThumbnailArtwork");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = -[SUUIRowSection _newSizeToFitArtworkRequestWithArtwork:columnIndex:](self, "_newSizeToFitArtworkRequestWithArtwork:columnIndex:", v13, a5);
      v18 = self->_componentArtworkRequestIDs;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "requestIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](v18, "setObject:forKey:", v19, v8);

      objc_msgSend(v10, "loadResourceWithRequest:reason:", v14, 1);
LABEL_8:

    }
  }

  objc_msgSend(v8, "accessibilityLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAccessibilityLabel:", v20);

  objc_msgSend(v22, "setMediaType:", objc_msgSend(v8, "mediaType"));
  objc_msgSend(v8, "mediaURLString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMediaURLString:", v21);

}

- (void)_selectGalleryComponent:(id)a3 columnIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[NSMapTable objectForKey:](self->_galleryViewControllers, "objectForKey:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedMediaComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSection clickEventWithMedia:elementName:index:](self, "clickEventWithMedia:elementName:index:", v6, CFSTR("Column"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SUUIStorePageSection context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "metricsController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordEvent:", v7);

  }
  objc_msgSend(v10, "performActionForSelectedComponentAnimated:", 1);

}

- (void)_selectLockupComponent:(id)a3 columnIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRowSection clickEventWithItem:elementName:index:](self, "clickEventWithItem:elementName:index:", v7, CFSTR("Column"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SUUIStorePageSection context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metricsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordEvent:", v8);

  }
  -[SUUIStorePageSection context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v13, "sectionsViewController:showProductPageForItem:", v12, v7) & 1) == 0)
  {
    if (SUUIItemKindIsSoftwareKind(objc_msgSend(v7, "itemKind"))
      && (objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "userInterfaceIdiom"),
          v14,
          v15))
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __53__SUUIRowSection__selectLockupComponent_columnIndex___block_invoke;
      v16[3] = &unk_2511F7890;
      v16[4] = self;
      v17 = v12;
      v18 = v6;
      v19 = v7;
      -[SUUIStorePageSection sendXEventWithItem:completionBlock:](self, "sendXEventWithItem:completionBlock:", v19, v16);

    }
    else
    {
      -[SUUIStorePageSection showProductViewControllerWithItem:](self, "showProductViewControllerWithItem:", v7);
    }
  }

}

uint64_t __53__SUUIRowSection__selectLockupComponent_columnIndex___block_invoke(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  SUUIProductPageOverlayController *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 32);
    if (!*(_QWORD *)(v3 + 168))
    {
      v4 = -[SUUIProductPageOverlayController initWithParentViewController:]([SUUIProductPageOverlayController alloc], "initWithParentViewController:", *(_QWORD *)(result + 40));
      v5 = *(_QWORD *)(v2 + 32);
      v6 = *(void **)(v5 + 168);
      *(_QWORD *)(v5 + 168) = v4;

      v7 = *(void **)(*(_QWORD *)(v2 + 32) + 168);
      objc_msgSend(*(id *)(v2 + 40), "clientContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setClientContext:", v8);

      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 168), "setDelegate:");
      v3 = *(_QWORD *)(v2 + 32);
    }
    objc_storeStrong((id *)(v3 + 176), *(id *)(v2 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 168), "showWithInitialItem:", *(_QWORD *)(v2 + 56));
    return objc_msgSend(*(id *)(v2 + 40), "_setActiveProductPageOverlayController:", *(_QWORD *)(*(_QWORD *)(v2 + 32) + 168));
  }
  return result;
}

- (void)_selectMediaComponent:(id)a3 columnIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SUUIStorePageSection clickEventWithMedia:elementName:index:](self, "clickEventWithMedia:elementName:index:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SUUIStorePageSection context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metricsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordEvent:", v5);

  }
  if (objc_msgSend(v9, "mediaType"))
  {
    -[NSMapTable objectForKey:](self->_columnViews, "objectForKey:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginPlaybackAnimated:", 1);
  }
  else
  {
    objc_msgSend(v9, "link");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSection showPageWithLink:](self, "showPageWithLink:", v8);
  }

}

- (void)_setPositionForClickEvent:(id)a3 elementIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    v6 = a3;
    -[SUUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a4, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellForItemAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    SUUIMetricsSetClickEventPositionWithView(v6, v9);
  }
}

- (id)_viewControllerForCountdownComponent:(id)a3
{
  id v4;
  SUUICountdownViewController *v5;
  void *v6;
  SUUICountdownViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSMapTable *countdownViewControllers;
  NSMapTable *v16;
  NSMapTable *v17;
  void *v18;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_countdownViewControllers, "objectForKey:", v4);
  v5 = (SUUICountdownViewController *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[SUUIStorePageSection context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [SUUICountdownViewController alloc];
    objc_msgSend(v6, "resourceLoader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SUUICountdownViewController initWithCountdownComponent:artworkLoader:](v7, "initWithCountdownComponent:artworkLoader:", v4, v8);

    -[SUUICountdownViewController setClientContext:](v5, "setClientContext:", self->_clientContext);
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "childComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfObjectIdenticalTo:", v4);

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v11, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICountdownViewController view](v5, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRowSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

    countdownViewControllers = self->_countdownViewControllers;
    if (!countdownViewControllers)
    {
      v16 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      v17 = self->_countdownViewControllers;
      self->_countdownViewControllers = v16;

      countdownViewControllers = self->_countdownViewControllers;
    }
    -[NSMapTable setObject:forKey:](countdownViewControllers, "setObject:forKey:", v5, v4);
    objc_msgSend(v6, "parentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addChildViewController:", v5);

  }
  return v5;
}

- (id)_viewControllerForGalleryComponent:(id)a3
{
  id v4;
  SUUIGalleryViewController *v5;
  void *v6;
  SUUIGalleryViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMapTable *galleryViewControllers;
  NSMapTable *v15;
  NSMapTable *v16;
  void *v17;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_galleryViewControllers, "objectForKey:", v4);
  v5 = (SUUIGalleryViewController *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[SUUIStorePageSection context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [SUUIGalleryViewController alloc];
    objc_msgSend(v6, "resourceLoader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SUUIGalleryViewController initWithGalleryComponent:artworkLoader:](v7, "initWithGalleryComponent:artworkLoader:", v4, v8);

    -[SUUIGalleryViewController setEmbeddedMediaDelegate:](v5, "setEmbeddedMediaDelegate:", self);
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "childComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfObjectIdenticalTo:", v4);

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v11, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRowSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGalleryViewController setBackgroundColor:](v5, "setBackgroundColor:", v13);

    galleryViewControllers = self->_galleryViewControllers;
    if (!galleryViewControllers)
    {
      v15 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      v16 = self->_galleryViewControllers;
      self->_galleryViewControllers = v15;

      galleryViewControllers = self->_galleryViewControllers;
    }
    -[NSMapTable setObject:forKey:](galleryViewControllers, "setObject:forKey:", v5, v4);
    objc_msgSend(v6, "parentViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addChildViewController:", v5);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlaySourceComponent, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_countdownViewControllers, 0);
  objc_storeStrong((id *)&self->_galleryViewControllers, 0);
  objc_storeStrong((id *)&self->_expandedEditorialIndexes, 0);
  objc_storeStrong((id *)&self->_editorialLayouts, 0);
  objc_storeStrong((id *)&self->_componentArtworkRequestIDs, 0);
  objc_storeStrong((id *)&self->_columnViews, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
