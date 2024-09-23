@implementation SUUIBrickGridPageSection

- (SUUIBrickGridPageSection)initWithPageComponent:(id)a3
{
  SUUIBrickGridPageSection *v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  NSMapTable *artworkRequests;
  uint64_t v12;
  NSMapTable *editorialLayouts;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SUUIBrickGridPageSection;
  v3 = -[SUUIStorePageSection initWithPageComponent:](&v15, sel_initWithPageComponent_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    v6 = 145.0;
    if (v5 == 1)
      v6 = 208.0;
    v7 = 2;
    if (v5 == 1)
      v7 = 3;
    v8 = 10.0;
    v9 = 20.0;
    if (v5 == 1)
      v8 = 20.0;
    else
      v9 = 15.0;
    *(_QWORD *)&v3->_baseHeight = qword_241EFB950[v5 == 1];
    v3->_columnWidth = v6;
    v3->_numberOfColumns = v7;
    v3->_paddingHorizontal = v8;
    v3->_paddingTop = v9;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    artworkRequests = v3->_artworkRequests;
    v3->_artworkRequests = (NSMapTable *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    editorialLayouts = v3->_editorialLayouts;
    v3->_editorialLayouts = (NSMapTable *)v12;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIBrickGridPageSection;
  -[SUUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addItemViewElement:", v8);

  v9 = objc_msgSend(v6, "item");
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 < objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndex:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addItemIdentifier:", objc_msgSend(v12, "brickIdentifier"));

  }
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIImage *v20;
  UIImage *placeholderImage;
  void *v22;
  void *v23;
  UIImage *v24;
  UIImage *v25;
  void *v26;
  void *v28;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x25120BD88, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  v9 = objc_msgSend(v4, "row");
  v10 = (uint64_t)v9 % self->_numberOfColumns;
  objc_msgSend(v6, "bounds");
  -[SUUIBrickGridPageSection _contentInsetsForColumnIndex:rowWidth:](self, "_contentInsetsForColumnIndex:rowWidth:", v10, v11);
  objc_msgSend(v7, "setContentInsets:");
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "children");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 >= objc_msgSend(v13, "count"))
  {
    objc_msgSend(v7, "applyEditorialLayout:orientation:", 0, 0);
    objc_msgSend(v7, "setBrickImage:", 0);
    goto LABEL_11;
  }
  objc_msgSend(v13, "objectAtIndex:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v15);

  -[SUUIBrickGridPageSection _editorialLayoutForBrick:](self, "_editorialLayoutForBrick:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyEditorialLayout:orientation:", v16, 0);
  objc_msgSend(v5, "resourceLoader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_artworkRequests, "objectForKey:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  if (!v19)
    goto LABEL_5;
  objc_msgSend(v17, "cachedResourceForRequestIdentifier:", v19);
  v20 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if ((objc_msgSend(v17, "trySetReason:forRequestWithIdentifier:", 1, v19) & 1) != 0)
    {
LABEL_6:
      placeholderImage = self->_placeholderImage;
      if (!placeholderImage)
      {
        +[SUUIStyledImageDataConsumer brickConsumer](SUUIStyledImageDataConsumer, "brickConsumer");
        v28 = v16;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "imageForColor:", v23);
        v24 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v25 = self->_placeholderImage;
        self->_placeholderImage = v24;

        v16 = v28;
        placeholderImage = self->_placeholderImage;
      }
      v20 = placeholderImage;
      goto LABEL_9;
    }
LABEL_5:
    -[SUUIBrickGridPageSection _loadArtworkForBrick:artworkLoader:reason:](self, "_loadArtworkForBrick:artworkLoader:reason:", v14, v17, 1);
    goto LABEL_6;
  }
LABEL_9:
  objc_msgSend(v7, "setBrickImage:", v20);
  objc_msgSend(v5, "colorScheme");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColoringWithColorScheme:", v26);

LABEL_11:
  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  double v4;
  uint64_t v5;
  int64_t numberOfColumns;
  void *v7;
  void *v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double columnWidth;
  void *v20;
  void *v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double baseHeight;
  void *v28;
  void *v29;
  double v30;
  double v32;
  double v33;
  CGSize result;

  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v5 = objc_msgSend(a3, "item");
  numberOfColumns = self->_numberOfColumns;
  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v5 % self->_numberOfColumns;
  objc_msgSend(v8, "bounds");
  -[SUUIBrickGridPageSection _contentInsetsForColumnIndex:rowWidth:](self, "_contentInsetsForColumnIndex:rowWidth:", v9, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  columnWidth = self->_columnWidth;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "children");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "count");
  v23 = self->_numberOfColumns;
  if (v23 >= 1)
  {
    v24 = v22;
    v25 = v23 * (v5 / numberOfColumns);
    if (v25 < v22)
    {
      v26 = v23 * (v5 / numberOfColumns);
      do
      {
        baseHeight = self->_baseHeight;
        objc_msgSend(v21, "objectAtIndex:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIBrickGridPageSection _editorialLayoutForBrick:](self, "_editorialLayoutForBrick:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v29, "layoutHeightForOrientation:expanded:", 0, 1);
          baseHeight = v30 + self->_baseHeight + 27.0;
        }
        if (v4 < baseHeight)
          v4 = baseHeight;

      }
      while (++v26 < self->_numberOfColumns + v25 && v26 < v24);
    }
  }

  v32 = v14 + v18 + columnWidth;
  v33 = v12 + v16 + v4;
  result.height = v33;
  result.width = v32;
  return result;
}

- (id)clickEventWithLink:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUUIBrickGridPageSection;
  -[SUUIStorePageSection clickEventWithLink:elementName:index:](&v13, sel_clickEventWithLink_elementName_index_, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SUUIStorePageSection context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a5, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    SUUIMetricsSetClickEventPositionWithView(v7, v11);
  }
  return v7;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "children");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "item");
  v7 = v6 >= objc_msgSend(v14, "count");
  v8 = v14;
  if (!v7)
  {
    objc_msgSend(v14, "objectAtIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "link");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBrickGridPageSection clickEventWithLink:elementName:index:](self, "clickEventWithLink:elementName:index:", v10, *MEMORY[0x24BEB2960], v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SUUIStorePageSection context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "metricsController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordEvent:", v11);

    }
    -[SUUIStorePageSection showPageWithLink:](self, "showPageWithLink:", v10);

    v8 = v14;
  }

}

- (int64_t)numberOfCells
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = v5 % self->_numberOfColumns + v5;
  return v6;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  int64_t v13;
  _QWORD v14[4];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__SUUIBrickGridPageSection_prefetchResourcesWithReason___block_invoke;
  v10[3] = &unk_2511F52F0;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = v14;
  v13 = a3;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(v14, 8);
}

void __56__SUUIBrickGridPageSection_prefetchResourcesWithReason___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadArtworkForBrick:artworkLoader:reason:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    *a4 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) > 8;
  }

}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x25120BD88);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
  {
    objc_msgSend(v6, "bounds");
    v9 = 3;
    if (v10 > v11)
      v9 = 4;
    self->_numberOfColumns = v9;
  }
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "children");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        -[SUUIBrickGridPageSection _editorialLayoutForBrick:](self, "_editorialLayoutForBrick:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "enqueueLayoutRequests");

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  v20.receiver = self;
  v20.super_class = (Class)SUUIBrickGridPageSection;
  -[SUUIStorePageSection willAppearInContext:](&v20, sel_willAppearInContext_, v4);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  int64_t v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  height = a3.height;
  width = a3.width;
  v32 = *MEMORY[0x24BDAC8D0];
  v25 = a4;
  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "portraitPageWidth");
  v9 = v8;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == 1)
  {
    if (width <= height)
    {
      v13 = 3;
    }
    else
    {
      objc_msgSend(v7, "landscapePageWidth");
      v9 = v12;
      v13 = 4;
    }
    self->_numberOfColumns = v13;
  }
  -[SUUIStorePageSection context](self, "context", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  objc_msgSend(v15, "indexPathsForVisibleItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v22, "section") == v16)
        {
          objc_msgSend(v15, "cellForItemAtIndexPath:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIBrickGridPageSection _contentInsetsForColumnIndex:rowWidth:](self, "_contentInsetsForColumnIndex:rowWidth:", objc_msgSend(v22, "item") % self->_numberOfColumns, v9);
          objc_msgSend(v23, "setContentInsets:");

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }
  v26.receiver = self;
  v26.super_class = (Class)SUUIBrickGridPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v26, sel_willTransitionToSize_withTransitionCoordinator_, v25, width, height);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v6 = a4;
  v7 = objc_msgSend(a3, "requestIdentifier");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__SUUIBrickGridPageSection_artworkRequest_didLoadImage___block_invoke;
  v9[3] = &unk_2511F5318;
  v10 = v6;
  v11 = v7;
  v9[4] = self;
  v8 = v6;
  -[SUUIBrickGridPageSection _enumerateVisibleBricksUsingBlock:](self, "_enumerateVisibleBricksUsingBlock:", v9);

}

void __56__SUUIBrickGridPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "unsignedIntegerValue") == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, objc_msgSend(*(id *)(a1 + 32), "sectionIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setBrickImage:", *(_QWORD *)(a1 + 40));
    *a4 = 1;

  }
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  int64_t v20;

  v17 = a4;
  v7 = a5;
  if (objc_msgSend(v17, "count"))
  {
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "_updateWithMissingItems:", v17);

  }
  if (objc_msgSend(v7, "count"))
  {
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_updateWithInvalidItemIdentifiers:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v13 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __82__SUUIBrickGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
      v18[3] = &unk_2511F5340;
      v19 = v12;
      v20 = v13;
      v14 = v12;
      objc_msgSend(v11, "enumerateIndexesUsingBlock:", v18);
      -[SUUIStorePageSection context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "collectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "deleteItemsAtIndexPaths:", v14);
    }

  }
}

void __82__SUUIBrickGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (UIEdgeInsets)_contentInsetsForColumnIndex:(int64_t)a3 rowWidth:(double)a4
{
  int64_t numberOfColumns;
  uint64_t v5;
  float v6;
  double paddingHorizontal;
  double *p_paddingTop;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  numberOfColumns = self->_numberOfColumns;
  v5 = numberOfColumns - 1;
  if (numberOfColumns == 1)
  {
    v6 = (a4 - self->_columnWidth) * 0.5;
    paddingHorizontal = floorf(v6);
    p_paddingTop = &self->_paddingTop;
    v9 = paddingHorizontal;
  }
  else
  {
    paddingHorizontal = self->_paddingHorizontal;
    v10 = (a4 + paddingHorizontal * -2.0 - self->_columnWidth * (double)numberOfColumns) / (double)v5;
    v11 = floorf(v10);
    if (a3)
    {
      p_paddingTop = &self->_paddingTop;
      v12 = floorf(v11 * 0.5);
      if (v5 == a3)
        v9 = self->_paddingHorizontal;
      else
        v9 = v12;
      paddingHorizontal = v12;
    }
    else
    {
      p_paddingTop = &self->_paddingTop;
      v9 = floorf(v11 * 0.5);
    }
  }
  v13 = *p_paddingTop;
  v14 = 0.0;
  result.right = v9;
  result.bottom = v14;
  result.left = paddingHorizontal;
  result.top = v13;
  return result;
}

- (id)_editorialLayoutForBrick:(id)a3
{
  id v4;
  SUUIEditorialLayout *v5;
  void *v6;
  SUUIEditorialLayout *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_editorialLayouts, "objectForKey:", v4);
  v5 = (SUUIEditorialLayout *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "editorial");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = [SUUIEditorialLayout alloc];
      -[SUUIStorePageSection context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLayoutCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[SUUIEditorialLayout initWithEditorial:layoutCache:](v7, "initWithEditorial:layoutCache:", v6, v9);

      -[SUUIEditorialLayout setLayoutWidth:forOrientation:](v5, "setLayoutWidth:forOrientation:", 0, self->_columnWidth);
      -[NSMapTable setObject:forKey:](self->_editorialLayouts, "setObject:forKey:", v5, v4);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)_enumerateVisibleBricksUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  int64_t v16;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[SUUIStorePageSection sectionIndex](self, "sectionIndex");
  objc_msgSend(v12, "indexPathsForVisibleItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__SUUIBrickGridPageSection__enumerateVisibleBricksUsingBlock___block_invoke;
  v13[3] = &unk_2511F5368;
  v15 = v4;
  v16 = v8;
  v14 = v6;
  v10 = v4;
  v11 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

}

void __62__SUUIBrickGridPageSection__enumerateVisibleBricksUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "section") == *(_QWORD *)(a1 + 48))
  {
    v3 = objc_msgSend(v5, "item");
    if (v3 < objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

- (void)_loadArtworkForBrick:(id)a3 artworkLoader:(id)a4 reason:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  SUUIArtworkRequest *v11;
  void *v12;
  NSMapTable *artworkRequests;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  objc_msgSend(v15, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(SUUIArtworkRequest);
    +[SUUIStyledImageDataConsumer brickConsumerWithBrickSize:](SUUIStyledImageDataConsumer, "brickConsumerWithBrickSize:", self->_columnWidth, self->_baseHeight);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkRequest setDataConsumer:](v11, "setDataConsumer:", v12);

    -[SUUIArtworkRequest setDelegate:](v11, "setDelegate:", self);
    -[SUUIArtworkRequest setURL:](v11, "setURL:", v10);
    artworkRequests = self->_artworkRequests;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v11, "requestIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](artworkRequests, "setObject:forKey:", v14, v15);

    objc_msgSend(v8, "loadResourceWithRequest:reason:", v11, a5);
  }

}

- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4
{
  void *v7;
  id v8;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isMissingItemData"))
  {
    -[SUUIBrickGridPageSection _missingItemLoader](self, "_missingItemLoader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadItemsForPageComponent:startIndex:reason:", v8, a3, a4);

  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_editorialLayouts, 0);
  objc_storeStrong((id *)&self->_artworkRequests, 0);
}

@end
