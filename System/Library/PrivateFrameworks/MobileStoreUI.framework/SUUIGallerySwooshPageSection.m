@implementation SUUIGallerySwooshPageSection

- (SUUIGallerySwooshPageSection)initWithPageComponent:(id)a3
{
  SUUIGallerySwooshPageSection *v3;
  uint64_t v4;
  NSMapTable *componentArtworkRequests;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIGallerySwooshPageSection;
  v3 = -[SUUIStorePageSection initWithPageComponent:](&v7, sel_initWithPageComponent_, a3);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    componentArtworkRequests = v3->_componentArtworkRequests;
    v3->_componentArtworkRequests = (NSMapTable *)v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIGallerySwooshViewController setDelegate:](self->_swooshViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIGallerySwooshPageSection;
  -[SUUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemViewElement:", v7);

  -[SUUIGallerySwooshViewController indexPathsForVisibleItems](self->_swooshViewController, "indexPathsForVisibleItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SUUIGallerySwooshPageSection _addImpressionForIndex:toSession:](self, "_addImpressionForIndex:toSession:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "item"), v5);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)willAppearInContext:(id)a3
{
  id v3;

  objc_msgSend(a3, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SUUIGallerySwooshPageSectionReuseIdentifier"));

}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("SUUIGallerySwooshPageSectionReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIGallerySwooshPageSection _swooshViewController](self, "_swooshViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentChildView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    objc_msgSend(v7, "setContentChildView:", v9);
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[SUUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIGallerySwooshPageSection _swooshViewController](self, "_swooshViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sizeToFit");
  objc_msgSend(v7, "frame");
  v9 = v8;
  objc_msgSend(v5, "bounds");
  v11 = v10;

  v12 = v11;
  v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSMapTable *componentArtworkRequests;
  void *v16;
  void *v18;
  void *v19;
  id v20;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaComponents");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceLoader");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIGallerySwooshPageSection _swooshViewController](self, "_swooshViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v20, "count");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    v9 = 1;
    do
    {
      objc_msgSend(v20, "objectAtIndex:", v9 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](self->_componentArtworkRequests, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(v19, "artworkForItemAtIndex:", v9 - 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[SUUIGallerySwooshPageSection _newArtworkRequestWithArtwork:](self, "_newArtworkRequestWithArtwork:", v12);
        v14 = v13;
        if (v13)
        {
          componentArtworkRequests = self->_componentArtworkRequests;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "requestIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](componentArtworkRequests, "setObject:forKey:", v16, v10);

          objc_msgSend(v18, "loadResourceWithRequest:reason:", v14, a3);
          ++v8;
        }

      }
      if (v9 >= v7)
        break;
      ++v9;
    }
    while (v8 < 4);
  }

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "requestIdentifier");
  -[SUUIGallerySwooshPageSection _swooshViewController](self, "_swooshViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathsForVisibleItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    v22 = v7;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v17, "item"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](self->_componentArtworkRequests, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "unsignedIntegerValue") == v10)
        {
          -[SUUIGallerySwooshPageSection _swooshViewController](self, "_swooshViewController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v17, "item");
          v7 = v22;
          objc_msgSend(v20, "setImage:forItemAtIndex:", v22, v21);

          goto LABEL_11;
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v7 = v22;
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)swoosh:(id)a3 didChangePlaybackState:(int64_t)a4 forItemAtIndex:(int64_t)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  -[SUUIStorePageSection context](self, "context", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metricsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "canRecordEventWithType:", *MEMORY[0x24BEB2920]))
  {
    v10 = objc_alloc_init(MEMORY[0x24BEB1F08]);
    SUUIMetricsMediaEventTypeForPlaybackState((id)a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMediaEventType:", v11);

    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "mediaIdentifier");
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setItemIdentifier:", v16);

    }
    objc_msgSend(v14, "mediaURLString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMediaURL:", v17);

    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationWithPageComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "locationWithPageComponent:", v14);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v19 && v20)
    {
      v23[0] = v20;
      v23[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLocationWithEventLocations:", v22);

    }
    objc_msgSend(v9, "recordEvent:", v10);

  }
}

- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection clickEventWithMedia:elementName:index:](self, "clickEventWithMedia:elementName:index:", v8, *MEMORY[0x24BEB2978], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SUUIStorePageSection context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metricsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordEvent:", v9);

  }
  if (objc_msgSend(v8, "mediaType"))
  {
    objc_msgSend(v13, "performActionForItemAtIndex:animated:", a4, 1);
  }
  else
  {
    objc_msgSend(v8, "link");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSection showPageWithLink:](self, "showPageWithLink:", v12);

  }
}

- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSMapTable *componentArtworkRequests;
  void *v19;

  v6 = a3;
  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_componentArtworkRequests, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  if (!v13)
    goto LABEL_4;
  objc_msgSend(v8, "cachedResourceForRequestIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if ((objc_msgSend(v8, "trySetReason:forRequestWithIdentifier:", 1, v13) & 1) != 0)
    {
LABEL_7:
      v14 = 0;
      goto LABEL_8;
    }
LABEL_4:
    objc_msgSend(v6, "artworkForItemAtIndex:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SUUIGallerySwooshPageSection _newArtworkRequestWithArtwork:](self, "_newArtworkRequestWithArtwork:", v15);
    v17 = v16;
    if (v16)
    {
      componentArtworkRequests = self->_componentArtworkRequests;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "requestIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](componentArtworkRequests, "setObject:forKey:", v19, v11);

      objc_msgSend(v8, "loadResourceWithRequest:reason:", v17, 1);
    }

    goto LABEL_7;
  }
LABEL_8:

  return v14;
}

- (void)swoosh:(id)a3 willDisplayCellAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SUUIStorePageSection context](self, "context", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metricsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeImpressionsSession");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    -[SUUIGallerySwooshPageSection _addImpressionForIndex:toSession:](self, "_addImpressionForIndex:toSession:", a4, v9);
    v8 = v9;
  }

}

- (void)_addImpressionForIndex:(int64_t)a3 toSession:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addItemIdentifier:", objc_msgSend(v10, "mediaIdentifier"));
  objc_msgSend(v10, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItemViewElement:", v9);

}

- (id)_newArtworkRequestWithArtwork:(id)a3
{
  id v4;
  void *v5;
  SUUIArtworkRequest *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(SUUIArtworkRequest);
    +[SUUISizeToFitImageDataConsumer consumerWithConstraintSize:](SUUISizeToFitImageDataConsumer, "consumerWithConstraintSize:", (double)objc_msgSend(v4, "width"), (double)objc_msgSend(v4, "height"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkRequest setDataConsumer:](v6, "setDataConsumer:", v7);

    -[SUUIArtworkRequest setDelegate:](v6, "setDelegate:", self);
    -[SUUIArtworkRequest setURL:](v6, "setURL:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_swooshViewController
{
  SUUIGallerySwooshViewController *swooshViewController;
  void *v4;
  void *v5;
  SUUIGallerySwooshViewController *v6;
  void *v7;
  SUUIGallerySwooshViewController *v8;
  SUUIGallerySwooshViewController *v9;
  SUUIGallerySwooshViewController *v10;
  void *v11;
  SUUIGallerySwooshViewController *v12;
  void *v13;

  swooshViewController = self->_swooshViewController;
  if (!swooshViewController)
  {
    -[SUUIStorePageSection context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [SUUIGallerySwooshViewController alloc];
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUUIGallerySwooshViewController initWithGallerySwoosh:](v6, "initWithGallerySwoosh:", v7);
    v9 = self->_swooshViewController;
    self->_swooshViewController = v8;

    v10 = self->_swooshViewController;
    objc_msgSend(v5, "clientContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISwooshViewController setClientContext:](v10, "setClientContext:", v11);

    v12 = self->_swooshViewController;
    objc_msgSend(v4, "colorScheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGallerySwooshViewController setColorScheme:](v12, "setColorScheme:", v13);

    -[SUUIGallerySwooshViewController setDelegate:](self->_swooshViewController, "setDelegate:", self);
    objc_msgSend(v5, "addChildViewController:", self->_swooshViewController);

    swooshViewController = self->_swooshViewController;
  }
  return swooshViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshViewController, 0);
  objc_storeStrong((id *)&self->_componentArtworkRequests, 0);
}

@end
