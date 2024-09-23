@implementation SUUIProductPageTableLockupsSection

- (SUUIProductPageTableLockupsSection)initWithLockups:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  SUUIProductPageTableLockupsSection *v8;
  uint64_t v9;
  NSMapTable *artworkRequests;
  uint64_t v11;
  NSArray *lockups;
  SUUIProductPageTableHeaderView *v13;
  SUUIProductPageTableHeaderView *headerView;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SUUIProductPageTableLockupsSection;
  v8 = -[SUUIProductPageTableLockupsSection init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
    artworkRequests = v8->_artworkRequests;
    v8->_artworkRequests = (NSMapTable *)v9;

    v11 = objc_msgSend(v6, "copy");
    lockups = v8->_lockups;
    v8->_lockups = (NSArray *)v11;

    if (v7)
    {
      v13 = objc_alloc_init(SUUIProductPageTableHeaderView);
      headerView = v8->_headerView;
      v8->_headerView = v13;

      -[SUUIProductPageTableHeaderView setContentInsets:](v8->_headerView, "setContentInsets:", 11.0, 15.0, 5.0, 15.0);
      -[SUUIProductPageTableHeaderView setTitle:](v8->_headerView, "setTitle:", v7);
      -[SUUIProductPageTableHeaderView sizeToFit](v8->_headerView, "sizeToFit");
    }
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIProductPageTableLockupsSection;
  -[SUUIProductPageTableLockupsSection dealloc](&v3, sel_dealloc);
}

- (id)footerViewForTableView:(id)a3
{
  SUUIProductPageTableSeparatorView *footerView;
  SUUIProductPageTableSeparatorView *v5;
  SUUIProductPageTableSeparatorView *v6;

  footerView = self->_footerView;
  if (!footerView)
  {
    v5 = -[SUUIProductPageTableSeparatorView initWithFrame:]([SUUIProductPageTableSeparatorView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 10.0);
    v6 = self->_footerView;
    self->_footerView = v5;

    footerView = self->_footerView;
  }
  return footerView;
}

- (id)headerViewForTableView:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  SUUIProductPageTableHeaderView *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_lockups;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "_needsItemData", (_QWORD)v15))
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v10, "itemIdentifier"));
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[SUUIProductPageTableLockupsSection _missingItemLoader](self, "_missingItemLoader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loadItemsWithIdentifiers:reason:", v4, 1);

  }
  v13 = self->_headerView;

  return v13;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  void *v4;
  double v5;

  -[SUUIProductPageTableSection clientContext](self, "clientContext", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dbl_241EFB9B0[SUUIUserInterfaceIdiom(v4) == 1];

  return v5;
}

- (int64_t)numberOfRowsInSection
{
  return -[NSArray count](self->_lockups, "count");
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  NSArray *lockups;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  +[SUUIProductPageAction actionWithType:](SUUIProductPageAction, "actionWithType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  lockups = self->_lockups;
  v8 = objc_msgSend(v5, "row");

  -[NSArray objectAtIndex:](lockups, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItem:", v10);

  return v6;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  SUUILockupItemTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  NSArray *lockups;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("LOCKUP"));
  v7 = (SUUILockupItemTableViewCell *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageTableSection clientContext](self, "clientContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[SUUILockupItemTableViewCell initWithStyle:reuseIdentifier:]([SUUILockupItemTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("LOCKUP"));
    -[SUUILockupItemTableViewCell layout](v7, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageTableSection clientContext](self, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = SUUIUserInterfaceIdiom(v10);

    if (v11 == 1)
      v12 = 1;
    else
      v12 = 2;
    -[SUUILockupItemTableViewCell setAccessoryType:](v7, "setAccessoryType:", v11 != 1);
    objc_msgSend(v9, "setItemOfferStyle:", v12);
    objc_msgSend(v9, "setClientContext:", v8);
    objc_msgSend(v9, "setContentInsets:", 0.0, 15.0, 0.0, 5.0);
    objc_msgSend(v9, "setLayoutStyle:", 1);
    objc_msgSend(v9, "setVerticalAlignment:", 1);
    v13 = SUUIUserInterfaceIdiom(v8);
    v14 = 64.0;
    if (v13 == 1)
      v14 = 72.0;
    objc_msgSend(v9, "setImageBoundingSize:", v14, v14);

  }
  v15 = objc_msgSend(v6, "row");
  lockups = self->_lockups;
  v17 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](lockups, "objectAtIndex:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupItemTableViewCell layout](v7, "layout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v18, "lockupStyle");
    v20 = v24;
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v19, "setVisibleFields:", v20);
  objc_msgSend(v18, "item");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[SUUILockupItemTableViewCell configureForItem:clientContext:rowIndex:](v7, "configureForItem:clientContext:rowIndex:", v21, v8, v15);
    -[SUUIProductPageTableLockupsSection _productImageForItem:](self, "_productImageForItem:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIconImage:", v22);

  }
  else
  {
    objc_msgSend(v19, "resetLayout");
    objc_msgSend(v19, "setIconImage:", 0);
  }

  return v7;
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SUUITableViewSection delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24 = v7;
    v22 = v6;
    v25 = objc_msgSend(v6, "requestIdentifier");
    v9 = -[SUUITableViewSection sectionIndex](self, "sectionIndex");
    v21 = v8;
    objc_msgSend(v8, "tableViewForTableViewSection:", self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "indexPathsForVisibleRows");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v14, "section") == v9)
          {
            -[NSArray objectAtIndex:](self->_lockups, "objectAtIndex:", objc_msgSend(v14, "row"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "item");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              -[NSMapTable objectForKey:](self->_artworkRequests, "objectForKey:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "unsignedIntegerValue");

              if (v25 == v18)
              {
                objc_msgSend(v23, "cellForRowAtIndexPath:", v14);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "layout");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setIconImage:", v24);

                goto LABEL_15;
              }
            }

          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_15:

    v8 = v21;
    v6 = v22;
    v7 = v24;
  }

}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v6;
  id v7;
  int64_t v8;
  NSArray *lockups;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  int64_t v18;
  __int128 v19;
  uint64_t v20;

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v19 = 0uLL;
    v20 = 0;
    SUUILockupStyleDefault((uint64_t)&v19);
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = -[SUUITableViewSection sectionIndex](self, "sectionIndex");
    lockups = self->_lockups;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __92__SUUIProductPageTableLockupsSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
    v13[3] = &unk_2511F56F8;
    v14 = v6;
    v16 = v19;
    v17 = v20;
    v10 = v7;
    v15 = v10;
    v18 = v8;
    -[NSArray enumerateObjectsUsingBlock:](lockups, "enumerateObjectsUsingBlock:", v13);
    if (objc_msgSend(v10, "count"))
    {
      -[SUUITableViewSection delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "tableViewForTableViewSection:", self);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 100);

      }
    }

  }
}

void __92__SUUIProductPageTableLockupsSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v5 = a2;
  if (objc_msgSend(v5, "_needsItemData"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v5, "itemIdentifier"));
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v14 = 0uLL;
      v15 = 0;
      if (v5)
        objc_msgSend(v5, "lockupStyle");
      if (objc_msgSend(v7, "itemKind") == 17)
      {
        v12 = *(_OWORD *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 64);
        v10 = v14;
        v11 = v15;
        if (SUUILockupStyleEqualToLockupStyle(&v12, &v10))
        {
          v15 = 214;
          v12 = v14;
          v13 = 214;
          objc_msgSend(v5, "_setLockupStyle:", &v12);
        }
      }
      objc_msgSend(v5, "_setItem:", v7);
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, *(_QWORD *)(a1 + 72));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

- (id)_missingItemLoader
{
  SUUIMissingItemLoader *missingItemLoader;
  SUUIMissingItemLoader *v4;
  void *v5;
  SUUIMissingItemLoader *v6;
  SUUIMissingItemLoader *v7;

  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    v4 = [SUUIMissingItemLoader alloc];
    -[SUUIProductPageTableLockupsSection resourceLoader](self, "resourceLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIMissingItemLoader initWithResourceLoader:](v4, "initWithResourceLoader:", v5);
    v7 = self->_missingItemLoader;
    self->_missingItemLoader = v6;

    -[SUUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", self);
    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (id)_productImageForItem:(id)a3
{
  id v4;
  SUUIStyledImageDataConsumer *v5;
  SUUIStyledImageDataConsumer *productImageDataConsumer;
  void *v7;
  void *v8;
  uint64_t v9;
  UIImage *v10;
  void *v11;
  void *v12;
  void *v13;
  SUUIArtworkRequest *v14;
  NSMapTable *artworkRequests;
  void *v16;
  UIImage *placeholderImage;
  SUUIStyledImageDataConsumer *v18;
  void *v19;
  UIImage *v20;
  UIImage *v21;

  v4 = a3;
  if (!self->_productImageDataConsumer)
  {
    +[SUUIStyledImageDataConsumer parentBundleIconConsumer](SUUIStyledImageDataConsumer, "parentBundleIconConsumer");
    v5 = (SUUIStyledImageDataConsumer *)objc_claimAutoreleasedReturnValue();
    productImageDataConsumer = self->_productImageDataConsumer;
    self->_productImageDataConsumer = v5;

  }
  -[SUUIProductPageTableLockupsSection resourceLoader](self, "resourceLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_artworkRequests, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (!v9
    || (objc_msgSend(v7, "cachedResourceForRequestIdentifier:", v9),
        (v10 = (UIImage *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_msgSend(v7, "trySetReason:forRequestWithIdentifier:", 1, v9) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v4, "artworksProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStyledImageDataConsumer imageSize](self->_productImageDataConsumer, "imageSize");
      objc_msgSend(v11, "bestArtworkForScaledSize:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = objc_alloc_init(SUUIArtworkRequest);
        -[SUUIArtworkRequest setDelegate:](v14, "setDelegate:", self);
        -[SUUIArtworkRequest setDataConsumer:](v14, "setDataConsumer:", self->_productImageDataConsumer);
        -[SUUIArtworkRequest setURL:](v14, "setURL:", v13);
        artworkRequests = self->_artworkRequests;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v14, "requestIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](artworkRequests, "setObject:forKey:", v16, v4);

        objc_msgSend(v7, "loadResourceWithRequest:reason:", v14, 1);
      }
      placeholderImage = self->_placeholderImage;
      if (!placeholderImage)
      {
        v18 = self->_productImageDataConsumer;
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIStyledImageDataConsumer imageForColor:](v18, "imageForColor:", v19);
        v20 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v21 = self->_placeholderImage;
        self->_placeholderImage = v20;

        placeholderImage = self->_placeholderImage;
      }
      v10 = placeholderImage;

    }
  }

  return v10;
}

- (SUUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_productImageDataConsumer, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_lockups, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_artworkRequests, 0);
}

@end
