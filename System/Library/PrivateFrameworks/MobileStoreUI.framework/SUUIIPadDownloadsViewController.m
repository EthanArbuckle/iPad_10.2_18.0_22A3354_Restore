@implementation SUUIIPadDownloadsViewController

- (void)setDownloads:(id)a3
{
  id v3;
  NSArray *v5;
  NSArray **p_downloads;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  NSArray *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v5 = (NSArray *)a3;
  p_downloads = &self->_downloads;
  if (self->_downloads != v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_editing)
    {
      v19 = v3;
      v20 = v5;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            -[NSArray objectAtIndex:](*p_downloads, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "item"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v13, "persistentIdentifier"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v10);
      }

      v3 = v19;
      v5 = v20;
    }
    objc_storeStrong((id *)&self->_downloads, v3);
    -[SUUIIPadDownloadsViewController _reload](self, "_reload");
    if (-[NSArray count](*p_downloads, "count"))
    {
      v15 = 0;
      while (1)
      {
        -[NSArray objectAtIndex:](*p_downloads, "objectAtIndex:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v16, "persistentIdentifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "containsObject:", v17))
          goto LABEL_16;
        v18 = objc_msgSend(v16, "isCancelable");

        if (v18)
          break;
LABEL_17:

        if (++v15 >= -[NSArray count](*p_downloads, "count"))
          goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v15, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v17, 0, 0);
LABEL_16:

      goto LABEL_17;
    }
LABEL_18:

  }
}

- (void)reloadDownloadsAtIndexes:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__SUUIIPadDownloadsViewController_reloadDownloadsAtIndexes___block_invoke;
  v3[3] = &unk_2511F4E08;
  v3[4] = self;
  objc_msgSend(a3, "enumerateIndexesUsingBlock:", v3);
}

void __60__SUUIIPadDownloadsViewController_reloadDownloadsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "objectAtIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
  objc_msgSend(WeakRetained, "childViewController:artworkForDownload:", *(_QWORD *)(a1 + 32), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIConfigureDownloadsCellView(v7, v6, v9, 1u, *(void **)(*(_QWORD *)(a1 + 32) + 1008));

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1000))
  {
    if (objc_msgSend(v6, "isCancelable"))
      v10 = 1;
    else
      v10 = 2;
    objc_msgSend(v12, "cellView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setButtonType:", 0);

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v12, "setCellState:", v10);

}

- (void)loadView
{
  SUUISearchCollectionViewFlowLayout *v3;
  id v4;
  UICollectionView *v5;
  UICollectionView *collectionView;
  UICollectionView *v7;
  void *v8;
  SUUIDownloadsView *v9;

  v9 = objc_alloc_init(SUUIDownloadsView);
  -[SUUIIPadDownloadsViewController setView:](self, "setView:", v9);
  v3 = objc_alloc_init(SUUISearchCollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", 0.0);
  -[SUUISearchCollectionViewFlowLayout setBackfills:](v3, "setBackfills:", 0);
  v4 = objc_alloc(MEMORY[0x24BEBD450]);
  -[SUUIDownloadsView bounds](v9, "bounds");
  v5 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("a"));
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  v7 = self->_collectionView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[UICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", 1);
  -[UICollectionView setAllowsMultipleSelection:](self->_collectionView, "setAllowsMultipleSelection:", 1);
  -[UICollectionView setPrefetchingEnabled:](self->_collectionView, "setPrefetchingEnabled:", 0);
  -[SUUIDownloadsView setContentView:](v9, "setContentView:", self->_collectionView);
  -[SUUIIPadDownloadsViewController _reload](self, "_reload");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  -[SUUIIPadDownloadsViewController _reloadLayout](self, "_reloadLayout");
  v3.receiver = self;
  v3.super_class = (Class)SUUIIPadDownloadsViewController;
  -[SUUIIPadDownloadsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  NSArray *downloads;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;

  downloads = self->_downloads;
  v7 = a4;
  v8 = a3;
  -[NSArray objectAtIndex:](downloads, "objectAtIndex:", objc_msgSend(v7, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("a"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "cellView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "childViewController:artworkForDownload:", self, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIConfigureDownloadsCellView(v11, v9, v13, 1u, self->_clientContext);

  if (self->_editing)
  {
    if (objc_msgSend(v9, "isCancelable"))
      v14 = 1;
    else
      v14 = 2;
    objc_msgSend(v10, "cellView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setButtonType:", 0);

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v10, "setCellState:", v14);

  return v10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_downloads, "count", a3, a4);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(a4, "item", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCancelable");

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  if (self->_editing)
  {
    -[SUUIIPadDownloadsViewController _reloadNavigationItem](self, "_reloadNavigationItem");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(v7, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "childViewController:performActionForDownload:", self, v6);

  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  if (self->_editing)
  {
    -[SUUIIPadDownloadsViewController _reloadNavigationItem](self, "_reloadNavigationItem");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(v7, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "childViewController:performActionForDownload:", self, v6);

  }
}

- (void)_editAction:(id)a3
{
  self->_editing = 1;
  -[SUUIIPadDownloadsViewController _reload](self, "_reload", a3);
}

- (void)_cancelAction:(id)a3
{
  self->_editing = 0;
  -[SUUIIPadDownloadsViewController _reload](self, "_reload", a3);
}

- (void)_deleteAction:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "item"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "childViewController:removeDownloads:", self, v4);

  self->_editing = 0;
  -[SUUIIPadDownloadsViewController _reload](self, "_reload");

}

- (void)_reload
{
  void *v3;
  SUUIClientContext *clientContext;
  void *v5;
  SUUIClientContext *v6;
  void *v7;
  id v8;
  _UIContentUnavailableView *v9;
  _UIContentUnavailableView *noContentView;
  _UIContentUnavailableView *v11;
  void *v12;
  void *v13;

  if (-[NSArray count](self->_downloads, "count"))
  {
    -[UICollectionView reloadData](self->_collectionView, "reloadData");
    -[SUUIIPadDownloadsViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOverlayView:", 0);

  }
  else
  {
    if (!self->_noContentView)
    {
      clientContext = self->_clientContext;
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("NO_CONTENT_TITLE"), CFSTR("Download"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("NO_CONTENT_TITLE"), 0, CFSTR("Download"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = self->_clientContext;
      if (v6)
        -[SUUIClientContext localizedStringForKey:inTable:](v6, "localizedStringForKey:inTable:", CFSTR("NO_CONTENT_MESSAGE"), CFSTR("Download"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("NO_CONTENT_MESSAGE"), 0, CFSTR("Download"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x24BEBDBB0]);
      v9 = (_UIContentUnavailableView *)objc_msgSend(v8, "initWithFrame:title:style:", v5, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      noContentView = self->_noContentView;
      self->_noContentView = v9;

      v11 = self->_noContentView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContentUnavailableView setBackgroundColor:](v11, "setBackgroundColor:", v12);

      -[_UIContentUnavailableView setMessage:](self->_noContentView, "setMessage:", v7);
    }
    -[SUUIIPadDownloadsViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOverlayView:", self->_noContentView);

    -[UICollectionView reloadData](self->_collectionView, "reloadData");
  }
  -[SUUIIPadDownloadsViewController _reloadNavigationItem](self, "_reloadNavigationItem");
}

- (void)_reloadLayout
{
  UICollectionView *collectionView;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  id v13;

  collectionView = self->_collectionView;
  v4 = SUUILayoutGuideInsets(self);
  SUUIScrollViewSetDefaultContentInsets(collectionView, v4, v5, v6, v7);
  -[SUUIIPadDownloadsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v12 = 2.0;
  if (v10 > 1000.0)
    v12 = 3.0;
  objc_msgSend(v11, "setItemSize:", v10 / v12, 100.0);
  objc_msgSend(v13, "invalidateLayout");

}

- (void)_reloadNavigationItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  SUUIClientContext *clientContext;
  void *v7;
  void *v8;
  void *v9;
  SUUIClientContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  -[SUUIIPadDownloadsViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftItemsSupplementBackButton:", 1);

  if (-[NSArray count](self->_downloads, "count"))
  {
    if (self->_editing)
    {
      -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      clientContext = self->_clientContext;
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("CANCEL"), CFSTR("Download"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CANCEL"), 0, CFSTR("Download"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_clientContext;
      if (v5)
      {
        if (v10)
          -[SUUIClientContext localizedStringForKey:inTable:](v10, "localizedStringForKey:inTable:", CFSTR("DELETE_FORMAT"), CFSTR("Download"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DELETE_FORMAT"), 0, CFSTR("Download"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (v10)
          -[SUUIClientContext localizedStringForKey:inTable:](v10, "localizedStringForKey:inTable:", CFSTR("DELETE"), CFSTR("Download"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DELETE"), 0, CFSTR("Download"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v7, 2, self, sel__cancelAction_);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v14, 0, self, sel__deleteAction_);
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTintColor:", v17);

      objc_msgSend(v16, "setEnabled:", v5 > 0);
      -[SUUIIPadDownloadsViewController navigationItem](self, "navigationItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v15;
      v21[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLeftBarButtonItems:", v19);

    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__editAction_);
      -[SUUIIPadDownloadsViewController navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLeftBarButtonItems:", v9);

    }
  }
  else
  {
    -[SUUIIPadDownloadsViewController navigationItem](self, "navigationItem");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLeftBarButtonItems:", 0);

  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIDownloadsChildViewControllerDelegate)delegate
{
  return (SUUIDownloadsChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)downloads
{
  return self->_downloads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
