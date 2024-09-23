@implementation SUUIStorePageSection

- (SUUIStorePageSection)initWithPageComponent:(id)a3
{
  id v5;
  SUUIStorePageSection *v6;
  SUUIStorePageSection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIStorePageSection;
  v6 = -[SUUIStorePageSection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_component, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIStorePageSection;
  -[SUUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  NSSet *relevantEntityProviders;
  void *v6;

  if (a3 != 2)
  {
    relevantEntityProviders = self->_relevantEntityProviders;
    self->_relevantEntityProviders = 0;

    self->_hasValidRelevantEntityProviders = 0;
  }
  -[SUUIStorePageSection context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSection willAppearInContext:](self, "willAppearInContext:", v6);

  return a3;
}

- (id)backgroundColorForIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[SUUIStorePageSection context](self, "context", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)cellForIndexPath:(id)a3
{
  return 0;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)clickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  -[SUUIStorePageSection _clickEventWithElementName:index:fieldData:](self, "_clickEventWithElementName:index:fieldData:", a4, a5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v8, "itemIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTargetIdentifier:", v10);

    objc_msgSend(v8, "productPageURLString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTargetURL:", v11);

  }
  return v9;
}

- (id)clickEventWithLink:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  -[SUUIStorePageSection _clickEventWithElementName:index:fieldData:](self, "_clickEventWithElementName:index:fieldData:", a4, a5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v10, "itemIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTargetIdentifier:", v12);

      objc_msgSend(v11, "productPageURLString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTargetURL:", v13);
    }
    else
    {
      objc_msgSend(v8, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "absoluteString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTargetURL:", v14);

    }
  }

  return v9;
}

- (id)clickEventWithMedia:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "mediaType"))
  {
    objc_msgSend(v8, "link");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[SUUIStorePageSection clickEventWithLink:elementName:index:](self, "clickEventWithLink:elementName:index:", v13, v9, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
LABEL_9:

    goto LABEL_10;
  }
  -[SUUIStorePageSection _clickEventWithElementName:index:fieldData:](self, "_clickEventWithElementName:index:fieldData:", v9, a5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(v8, "mediaIdentifier");
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTargetIdentifier:", v12);

    }
    objc_msgSend(v8, "mediaURLString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTargetURL:", v13);
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

- (void)collectionViewDidConfirmButtonElement:(id)a3 withClickInfo:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "itemIdentifier");
  if (v8)
  {
    v9 = v8;
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stateForItemWithIdentifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "buyButtonDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "canPerformLocalActionWithItemState:", v11);

      if (v13)
      {
        v14 = objc_msgSend(v11, "state");
        if ((v14 & 2) != 0)
        {
          +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "cancelDownloadForItemWithIdentifier:", v9);
LABEL_14:

          v18 = 6;
          goto LABEL_10;
        }
        if ((v14 & 0x40) != 0)
        {
          objc_msgSend(v6, "personalizationLibraryItems");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "anyObject");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "performActionForLibraryItem:", v15);
          goto LABEL_13;
        }
        if ((v14 & 0x24) == 4)
        {
          v15 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = v16;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v17, &__block_literal_global_65);

LABEL_13:
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v11 = 0;
  }
  v18 = 2;
LABEL_10:
  objc_msgSend(v6, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", v18, 1, 1, v7, 0);

}

void __95__SUUIStorePageSection_collectionViewDidConfirmButtonElement_withClickInfo_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(a2, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x24BEB2A60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    SUUIMetricsLaunchApplicationWithIdentifier((uint64_t)v4, 0);
    CFRelease(v4);
  }

}

- (void)collectionViewDidLongPressItemAtIndexPath:(id)a3
{
  void *v3;
  id v4;

  -[SUUIStorePageSection pageComponent](self, "pageComponent", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 3, 1, 1, 0, 0);
}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3
{
  return 1;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[SUUIStorePageSection fitsToHeight](self, "fitsToHeight"))
  {
    -[SUUIStorePageSectionContext collectionView](self->_context, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "contentInset");
    objc_msgSend(v11, "frame");
    objc_msgSend(v11, "setFrame:");
    objc_msgSend(v11, "setSize:", v6, v8);

  }
  objc_msgSend(v11, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

}

- (BOOL)containsElementWithIndexBarEntryID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstDescendentWithIndexBarEntryID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (double)contentInsetAdjustmentForCollectionView:(id)a3
{
  return 0.0;
}

- (int64_t)defaultItemPinningStyle
{
  return 0;
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  -[SUUIStorePageSection context](self, "context", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSections:", v6);

}

- (NSIndexPath)firstAppearanceIndexPath
{
  return 0;
}

- (BOOL)fitsToHeight
{
  return 0;
}

- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (NSArray)indexPathsForPinningItems
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (-[SUUIStorePageSection numberOfCells](self, "numberOfCells") != 1
    || !-[SUUIStorePageSection _itemPinningStyle](self, "_itemPinningStyle"))
  {
    return (NSArray *)0;
  }
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)itemOfferClickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[SUUIStorePageSection context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "metricsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemOfferClickEventWithItem:locationPosition:", v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "locationWithPosition:type:fieldData:", 0, *MEMORY[0x24BEB2968], 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationWithPageComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "locationWithPosition:type:fieldData:", a5, v9, v8);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v13)
      v18 = v15 == 0;
    else
      v18 = 1;
    if (!v18 && v16 != 0)
    {
      v24[0] = v13;
      v24[1] = v16;
      v24[2] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLocationWithEventLocations:", v20);

    }
    objc_msgSend(v10, "parentViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_visibleMetricsImpressionsString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImpressions:", v22);

  }
  return v12;
}

- (_NSRange)itemRangeForIndexPathRange:(SUUIIndexPathRange *)a3
{
  int64_t v5;
  int64_t var1;
  int64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v5 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  if (a3->var0 >= v5)
    var1 = a3->var1;
  else
    var1 = 0;
  if (a3->var2 == v5)
    v7 = a3->var3 + 1;
  else
    v7 = -[SUUIStorePageSection numberOfCells](self, "numberOfCells");
  v8 = v7 - var1;
  v9 = var1;
  result.length = v8;
  result.location = v9;
  return result;
}

- (int64_t)numberOfCells
{
  return 0;
}

- (BOOL)performDefaultActionForViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  if (v5 == 14)
  {
LABEL_4:
    objc_msgSend(v4, "firstChildForElementType:", 152);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v5 != 152)
  {
    if (v5 != 66)
    {
LABEL_9:
      LOBYTE(v8) = 0;
      goto LABEL_12;
    }
    goto LABEL_4;
  }
  v6 = v4;
LABEL_6:
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  v8 = objc_msgSend(v6, "isEnabled");
  if (v8)
    -[SUUIStorePageSection playVideoForElement:](self, "playVideoForElement:", v7);
  else
    objc_msgSend(v4, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", 0x251210D08, 0x251210D28, 1, 0, 0, 0);

LABEL_12:
  return v8;
}

- (id)performItemOfferActionForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (SUUIItemKindIsSoftwareKind(objc_msgSend(v4, "itemKind")))
  {
    -[SUUIStorePageSection context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "metricsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "performActionForItem:clientContext:", v4, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performActionForItem:clientContext:", v4, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[SUUIStorePageSection showProductViewControllerWithItem:](self, "showProductViewControllerWithItem:", v4);
    v10 = 0;
  }

  return v10;
}

- (int64_t)pinningTransitionStyleForItemAtIndexPath:(id)a3
{
  void *v3;
  int64_t v4;

  -[SUUIStorePageSection context](self, "context", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "defaultPinningTransitionStyle");

  return v4;
}

- (void)playVideoForElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SUUIStorePageSection *v10;

  v4 = a3;
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__SUUIStorePageSection_playVideoForElement___block_invoke;
  v8[3] = &unk_2511F4EE8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __44__SUUIStorePageSection_playVideoForElement___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SUUIPlayableAsset *v13;

  v6 = a2;
  v13 = -[SUUIPlayableAsset initWithVideoViewElement:assetViewElement:]([SUUIPlayableAsset alloc], "initWithVideoViewElement:assetViewElement:", *(_QWORD *)(a1 + 32), v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIVideoPreviewPlayPlayableVideoWithAsset(v7, v13, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "presentViewController:animated:completion:", v10, 1, 0);
    SUUIVideoPreviewDismissOnEnterBackground(v10);
    *a4 = 1;

  }
}

- (void)playVideoWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SUUIPlayableAsset *v10;

  if (a3)
  {
    v4 = a3;
    v10 = -[SUUIPlayableAsset initWithContentURL:]([SUUIPlayableAsset alloc], "initWithContentURL:", v4);

    -[SUUIStorePageSection context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIVideoPreviewPlayPlayableAsset(v10, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SUUIStorePageSection context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "parentViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "presentViewController:animated:completion:", v7, 1, 0);
      SUUIVideoPreviewDismissOnEnterBackground(v7);

    }
  }
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  return 0;
}

- (NSSet)relevantEntityProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!self->_hasValidRelevantEntityProviders)
  {
    self->_hasValidRelevantEntityProviders = 1;
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 0);
      -[SUUIStorePageSection _recursivelyAddRelevantEntityProvidersForViewElement:toSet:](self, "_recursivelyAddRelevantEntityProvidersForViewElement:toSet:", v4, v5);
    }
    else
    {
      v5 = 0;
    }
    if (objc_msgSend(v5, "count"))
      v6 = v5;
    else
      v6 = 0;
    objc_storeStrong((id *)&self->_relevantEntityProviders, v6);

  }
  return self->_relevantEntityProviders;
}

- (void)reloadVisibleCellsWithReason:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  _QWORD v9[7];

  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__SUUIStorePageSection_reloadVisibleCellsWithReason___block_invoke;
  v9[3] = &unk_2511FDB68;
  v9[4] = self;
  v9[5] = v7;
  v9[6] = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __53__SUUIStorePageSection_reloadVisibleCellsWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "section") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "reloadCellWithIndexPath:reason:", v3, *(_QWORD *)(a1 + 48));

}

- (BOOL)requestLayoutWithReloadReason:(int64_t)a3
{
  return 0;
}

- (UIEdgeInsets)sectionContentInset
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 15.0;
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
  }
  else
  {
    v6 = *MEMORY[0x24BEBE158];
    v5 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v4 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v7 = *(double *)(MEMORY[0x24BEBE158] + 24);
  }
  result.right = v7;
  result.bottom = v4;
  result.left = v5;
  result.top = v6;
  return result;
}

- (void)sendXEventWithItem:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "lookupDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSection _sendXEventWithDictionary:completionBlock:](self, "_sendXEventWithDictionary:completionBlock:", v7, v6);

}

- (void)sendXEventWithLink:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SUUIStorePageSection sendXEventWithItem:completionBlock:](self, "sendXEventWithItem:completionBlock:", v7, v6);
  }
  else
  {
    objc_msgSend(v9, "linkDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSection _sendXEventWithDictionary:completionBlock:](self, "_sendXEventWithDictionary:completionBlock:", v8, v6);

  }
}

- (void)showPageWithLink:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  SUUIURL *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5)
  {
    if (!v6)
      goto LABEL_17;
    -[SUUIStorePageSection context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((objc_msgSend(v10, "sectionsViewController:showStorePageForURL:", v9, v7) & 1) != 0)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(v4, "targetString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("external"));

      if (v12)
      {
        v13 = SUUIMobileCoreServicesFramework();
        objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("LSApplicationWorkspace"), v13), "defaultWorkspace");
        v14 = (SUUIURL *)objc_claimAutoreleasedReturnValue();
        -[SUUIURL openSensitiveURL:withOptions:](v14, "openSensitiveURL:withOptions:", v7, 0);
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
    }
    v14 = -[SUUIURL initWithURL:]([SUUIURL alloc], "initWithURL:", v7);
    -[SUUIURL actionString](v14, "actionString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "application:openURL:sourceApplication:annotation:", v18, v7, 0, MEMORY[0x24BDBD1B8]);
      }
      else
      {
        v19 = SUUIMobileCoreServicesFramework();
        objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("LSApplicationWorkspace"), v19), "defaultWorkspace");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "openSensitiveURL:withOptions:", v7, 0);
      }

    }
    else
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __41__SUUIStorePageSection_showPageWithLink___block_invoke;
      v20[3] = &unk_2511FA080;
      v21 = v9;
      v22 = v4;
      v23 = v7;
      -[SUUIStorePageSection sendXEventWithLink:completionBlock:](self, "sendXEventWithLink:completionBlock:", v22, v20);

    }
    goto LABEL_15;
  }
  -[SUUIStorePageSection showProductViewControllerWithItem:](self, "showProductViewControllerWithItem:", v5);
LABEL_17:

}

void __41__SUUIStorePageSection_showPageWithLink___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  SUUIStorePageViewController *v6;

  if ((a2 & 1) == 0)
  {
    v6 = objc_alloc_init(SUUIStorePageViewController);
    objc_msgSend(*(id *)(a1 + 32), "clientContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageViewController setClientContext:](v6, "setClientContext:", v3);

    objc_msgSend(*(id *)(a1 + 40), "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageViewController setTitle:](v6, "setTitle:", v4);

    -[SUUIStorePageViewController loadURL:withCompletionBlock:](v6, "loadURL:withCompletionBlock:", *(_QWORD *)(a1 + 48), 0);
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v6, 1);

  }
}

- (void)showProductViewControllerWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  SUUIStorePageSection *v11;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v7, "sectionsViewController:showProductPageForItem:", v6, v4) & 1) == 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __58__SUUIStorePageSection_showProductViewControllerWithItem___block_invoke;
    v8[3] = &unk_2511FA080;
    v9 = v4;
    v10 = v6;
    v11 = self;
    -[SUUIStorePageSection sendXEventWithItem:completionBlock:](self, "sendXEventWithItem:completionBlock:", v9, v8);

  }
}

void __58__SUUIStorePageSection_showProductViewControllerWithItem___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  SUUIProductPageOverlayController *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  SUUIIPhoneProductPageViewController *v17;
  _QWORD v18[4];
  id v19;

  if ((a2 & 1) == 0)
  {
    if (SUUIItemKindIsSoftwareKind(objc_msgSend(*(id *)(a1 + 32), "itemKind")))
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "userInterfaceIdiom");

      if (v4)
      {
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 48) + 40))
        {
          v5 = -[SUUIProductPageOverlayController initWithParentViewController:]([SUUIProductPageOverlayController alloc], "initWithParentViewController:", *(_QWORD *)(a1 + 40));
          v6 = *(_QWORD *)(a1 + 48);
          v7 = *(void **)(v6 + 40);
          *(_QWORD *)(v6 + 40) = v5;

          v8 = *(void **)(*(_QWORD *)(a1 + 48) + 40);
          objc_msgSend(*(id *)(a1 + 40), "clientContext");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setClientContext:", v9);

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "setDelegate:");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "showWithInitialItem:", *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 40), "_setActiveProductPageOverlayController:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40));
        }
      }
      else
      {
        v17 = -[SUUIIPhoneProductPageViewController initWithItem:]([SUUIIPhoneProductPageViewController alloc], "initWithItem:", *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 40), "clientContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIViewController setClientContext:](v17, "setClientContext:", v15);

        objc_msgSend(*(id *)(a1 + 40), "navigationController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pushViewController:animated:", v17, 1);

      }
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x24BDEA6E0]);
      objc_msgSend(v10, "setAutomaticallyDismisses:", 1);
      v11 = objc_alloc(MEMORY[0x24BDBCE70]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "itemIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v12, CFSTR("id"), 0);

      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __58__SUUIStorePageSection_showProductViewControllerWithItem___block_invoke_2;
      v18[3] = &unk_2511F52A0;
      v19 = v10;
      v14 = v10;
      objc_msgSend(v14, "loadProductWithParameters:completionBlock:", v13, v18);
      objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v14, 1, 0);

    }
  }
}

uint64_t __58__SUUIStorePageSection_showProductViewControllerWithItem___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return result;
}

- (id)targetScrollingIndexPathForElementWithIndexBarEntryID:(id)a3 relativeSectionIndex:(int64_t)a4
{
  uint64_t v6;
  void *v7;

  v6 = -[SUUIStorePageSection numberOfCells](self, "numberOfCells", a3);
  if (v6 < 1)
  {
    v7 = 0;
  }
  else
  {
    if (v6 - 1 < a4)
      a4 = v6 - 1;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a4, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (int64_t)updateWithContext:(id)a3 pageComponent:(id)a4
{
  id v6;
  SUUIPageComponent *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  SUUIPageComponent *component;
  int64_t v16;

  v6 = a3;
  v7 = (SUUIPageComponent *)a4;
  -[SUUIPageComponent viewElement](v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "updateType"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "activePageWidth");
    v11 = v10;
    -[SUUIStorePageSection context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activePageWidth");
    v14 = vabdd_f64(v11, v13);

    if (v14 > 0.00000011920929)
      v9 = 1;
    else
      v9 = 2;
  }
  -[SUUIStorePageSection _setContext:](self, "_setContext:", v6);
  component = self->_component;
  self->_component = v7;

  v16 = -[SUUIStorePageSection applyUpdateType:](self, "applyUpdateType:", v9);
  return v16;
}

- (void)productPageOverlayDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  SUUIProductPageOverlayController *overlayController;

  -[SUUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pageSectionDidDismissOverlayController:", self->_overlayController);

  -[SUUIProductPageOverlayController setDelegate:](self->_overlayController, "setDelegate:", 0);
  overlayController = self->_overlayController;
  self->_overlayController = 0;

}

- (void)_setContext:(id)a3
{
  SUUIStorePageSectionContext *v5;
  SUUIStorePageSectionContext **p_context;
  SUUIStorePageSectionContext *context;
  SUUIStorePageSectionContext *v8;

  v5 = (SUUIStorePageSectionContext *)a3;
  context = self->_context;
  p_context = &self->_context;
  if (context != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_context, a3);
    v5 = v8;
  }

}

- (id)_clickEventWithElementName:(id)a3 index:(int64_t)a4 fieldData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[SUUIStorePageSection context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "metricsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "canRecordEventWithType:", *MEMORY[0x24BEB2910]))
  {
    v12 = objc_alloc_init(MEMORY[0x24BEB1EC8]);
    objc_msgSend(v12, "setTargetType:", v8);
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationWithPageComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "locationWithPosition:type:fieldData:", a4, v8, v9);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v14 && v15)
    {
      v21[0] = v15;
      v21[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLocationWithEventLocations:", v17);

    }
    objc_msgSend(v10, "parentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_visibleMetricsImpressionsString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImpressions:", v19);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)_itemPinningStyle
{
  void *v3;
  void *v4;
  int64_t v5;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 1;
    switch(objc_msgSend(v4, "pinStyle"))
    {
      case 1:
        v5 = 0;
        break;
      case 2:
        break;
      case 3:
        v5 = 2;
        break;
      case 4:
        v5 = 3;
        break;
      case 5:
        v5 = 4;
        break;
      default:
        goto LABEL_3;
    }
  }
  else
  {
LABEL_3:
    v5 = -[SUUIStorePageSection defaultItemPinningStyle](self, "defaultItemPinningStyle");
  }

  return v5;
}

- (int64_t)_itemPinningGroup
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "pinGroup");
  return v4;
}

- (void)_recursivelyAddRelevantEntityProvidersForViewElement:(id)a3 toSet:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    objc_msgSend(v8, "explicitEntityProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "addObject:", v7);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __83__SUUIStorePageSection__recursivelyAddRelevantEntityProvidersForViewElement_toSet___block_invoke;
    v9[3] = &unk_2511F78E0;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v8, "enumerateChildrenUsingBlock:", v9);

  }
}

uint64_t __83__SUUIStorePageSection__recursivelyAddRelevantEntityProvidersForViewElement_toSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recursivelyAddRelevantEntityProvidersForViewElement:toSet:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_sendXEventWithDictionary:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  -[SUUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    SUUIXEventSidepackDictionary((uint64_t)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __66__SUUIStorePageSection__sendXEventWithDictionary_completionBlock___block_invoke;
    v12[3] = &unk_2511F49A8;
    v13 = v7;
    objc_msgSend(v10, "sendOnXEventWithDictionary:completionBlock:", v11, v12);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __66__SUUIStorePageSection__sendXEventWithDictionary_completionBlock___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  if (*(_QWORD *)(a1 + 32))
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __66__SUUIStorePageSection__sendXEventWithDictionary_completionBlock___block_invoke_2;
    v3[3] = &unk_2511F5658;
    v4 = *(id *)(a1 + 32);
    v5 = a2;
    dispatch_async(MEMORY[0x24BDAC9B8], v3);

  }
}

uint64_t __66__SUUIStorePageSection__sendXEventWithDictionary_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isBottomSection
{
  return self->_bottomSection;
}

- (void)setBottomSection:(BOOL)a3
{
  self->_bottomSection = a3;
}

- (SUUIStorePageSectionContext)context
{
  return self->_context;
}

- (SUUIPageComponent)pageComponent
{
  return self->_component;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (BOOL)isTopSection
{
  return self->_topSection;
}

- (void)setTopSection:(BOOL)a3
{
  self->_topSection = a3;
}

- (IKColor)backgroundColorForSection
{
  return self->_backgroundColorForSection;
}

- (NSArray)indexPathsForBackgroundItems
{
  return self->_indexPathsForBackgroundItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathsForBackgroundItems, 0);
  objc_storeStrong((id *)&self->_backgroundColorForSection, 0);
  objc_storeStrong((id *)&self->_relevantEntityProviders, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
