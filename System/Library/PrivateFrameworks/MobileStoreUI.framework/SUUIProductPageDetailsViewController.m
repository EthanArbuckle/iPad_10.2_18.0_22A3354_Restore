@implementation SUUIProductPageDetailsViewController

- (SUUIProductPageDetailsViewController)initWithProductPage:(id)a3
{
  id v5;
  SUUIProductPageDetailsViewController *v6;
  SUUIProductPageDetailsViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIProductPageDetailsViewController;
  v6 = -[SUUIProductPageDetailsViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_productPage, a3);
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_sections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setDelegate:", 0);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)SUUIProductPageDetailsViewController;
  -[SUUIProductPageDetailsViewController dealloc](&v9, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPageDetailsViewController;
  -[SUUIProductPageDetailsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SUUIResourceLoader enterForeground](self->_resourceLoader, "enterForeground");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPageDetailsViewController;
  -[SUUIProductPageDetailsViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SUUIResourceLoader enterBackground](self->_resourceLoader, "enterBackground");
}

+ (double)defaultPageWidthForUserInterfaceIdiom:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  double v7;

  if (a3 == 1)
    return 630.0;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4)
      return 320.0;
  }
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v5 = v7;

  return v5;
}

- (void)setClientContext:(id)a3
{
  SUUIClientContext *v5;
  SUUIClientContext **p_clientContext;
  void *v7;
  SUUIClientContext *v8;

  v5 = (SUUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    if (*p_clientContext)
      -[SUUIClientContext localizedStringForKey:inTable:](*p_clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_DETAILS_TAB"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_DETAILS_TAB"), 0, CFSTR("ProductPage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageDetailsViewController setTitle:](self, "setTitle:", v7);

    v5 = v8;
  }

}

- (void)setAskPermission:(BOOL)a3
{
  unint64_t v4;
  void *v5;
  char isKindOfClass;
  SUUIProductPageTableLinksSection *v7;
  void *v8;
  SUUIProductPageTableLinksSection *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *sections;
  id v14;

  if (self->_askPermission != a3)
  {
    self->_askPermission = a3;
    if (-[NSMutableArray count](self->_sections, "count"))
    {
      if (-[NSMutableArray count](self->_sections, "count"))
      {
        v4 = 0;
        do
        {
          -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", v4);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v7 = [SUUIProductPageTableLinksSection alloc];
            -[SUUIProductPage item](self->_productPage, "item");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = -[SUUIProductPageTableLinksSection initWithItem:clientContext:askPermission:](v7, "initWithItem:clientContext:askPermission:", v8, self->_clientContext, self->_askPermission);

            -[SUUIProductPage uber](self->_productPage, "uber");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "colorScheme");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUUIProductPageTableLinksSection setColorScheme:](v9, "setColorScheme:", v11);

            -[SUUITableViewSection setSectionIndex:](v9, "setSectionIndex:", v4);
            -[NSMutableArray replaceObjectAtIndex:withObject:](self->_sections, "replaceObjectAtIndex:withObject:", v4, v9);

          }
          ++v4;
        }
        while (v4 < -[NSMutableArray count](self->_sections, "count"));
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_sections);
      v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      sections = self->_sections;
      self->_sections = v12;

      -[SUUIProductPageDetailsViewController _tableViewController](self, "_tableViewController");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSections:", self->_sections);

    }
  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  NSMutableArray *v6;
  NSMutableArray *sections;
  SUUILayoutCache *v8;
  SUUILayoutCache *textLayoutCache;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  SUUIProductPageTableInAppPurchasesSection *v33;
  void *v34;
  SUUIProductPageTableInAppPurchasesSection *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  SUUIProductPageTableUpdateHistorySection *v48;
  void *v49;
  void *v50;
  SUUIProductPageTableLinksSection *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  -[SUUIProductPageDetailsViewController _tableViewController](self, "_tableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSMutableArray count](self->_sections, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sections = self->_sections;
    self->_sections = v6;

    v8 = objc_alloc_init(SUUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    -[SUUIProductPage uber](self->_productPage, "uber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorScheme");
    v64 = objc_claimAutoreleasedReturnValue();

    -[SUUIProductPage item](self->_productPage, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageDetailsViewController _storeNotesSection](self, "_storeNotesSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v11;
    if (v12)
    {
      objc_msgSend(v12, "setStringIndex:", objc_msgSend(v5, "count"));
      objc_msgSend(v11, "storeNotes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "standardNotes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageDetailsViewController _textLayoutRequestWithText:widthOffset:](self, "_textLayoutRequestWithText:widthOffset:", v14, 0.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v15);

      v11 = v67;
      objc_msgSend(v12, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      -[NSMutableArray addObject:](self->_sections, "addObject:", v12);
    }
    v62 = v12;
    -[SUUIProductPageDetailsViewController _bundledAppsSection](self, "_bundledAppsSection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v16, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      -[NSMutableArray addObject:](self->_sections, "addObject:", v16);
    }
    v61 = v16;
    -[SUUIProductPageDetailsViewController _parentBundlesSection](self, "_parentBundlesSection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)v64;
    if (v17)
    {
      objc_msgSend(v17, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      -[NSMutableArray addObject:](self->_sections, "addObject:", v17);
    }
    -[SUUIProductPageDetailsViewController _screenshotsSection](self, "_screenshotsSection");
    v60 = v17;
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      v19 = objc_msgSend(v11, "parentalControlsRank");
      +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "parentalControlsRank");

      v22 = v19 < v21;
      v11 = v67;
      if (v22)
      {
        objc_msgSend(v63, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
        -[NSMutableArray addObject:](self->_sections, "addObject:", v63);
      }
    }
    -[SUUIProductPageDetailsViewController _descriptionSection](self, "_descriptionSection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v23;
    if (v23)
    {
      objc_msgSend(v23, "setStringIndex:", objc_msgSend(v5, "count"));
      objc_msgSend(v11, "itemDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageDetailsViewController _textLayoutRequestWithText:widthOffset:](self, "_textLayoutRequestWithText:widthOffset:", v24, 0.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v25);

      objc_msgSend(v66, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      -[NSMutableArray addObject:](self->_sections, "addObject:", v66);
    }
    -[SUUIProductPageDetailsViewController _whatsNewSection](self, "_whatsNewSection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v26;
    if (v26)
    {
      objc_msgSend(v26, "setStringIndex:", objc_msgSend(v5, "count"));
      objc_msgSend(v11, "updateDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageDetailsViewController _textLayoutRequestWithText:widthOffset:](self, "_textLayoutRequestWithText:widthOffset:", v27, 0.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v28);

      objc_msgSend(v65, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      -[NSMutableArray addObject:](self->_sections, "addObject:", v65);
    }
    -[SUUIProductPageDetailsViewController _featuresSection](self, "_featuresSection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v29, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      -[NSMutableArray addObject:](self->_sections, "addObject:", v29);
    }
    v59 = v29;
    -[SUUIProductPageDetailsViewController _infoSection](self, "_infoSection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v30, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      -[NSMutableArray addObject:](self->_sections, "addObject:", v30);
    }
    v58 = v30;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
    {
      v57 = v3;
      objc_msgSend(v11, "inAppPurchases");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (v32)
      {
        v33 = [SUUIProductPageTableInAppPurchasesSection alloc];
        objc_msgSend(v11, "inAppPurchases");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[SUUIProductPageTableInAppPurchasesSection initWithInAppPurchases:clientContext:](v33, "initWithInAppPurchases:clientContext:", v34, self->_clientContext);

        -[SUUIProductPageTableInAppPurchasesSection setColorScheme:](v35, "setColorScheme:", v64);
        -[SUUITableViewSection setSectionIndex:](v35, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
        -[SUUIProductPageTableInAppPurchasesSection headerViewForTableView:](v35, "headerViewForTableView:", v4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIProductPageDetailsViewController _addTapRecognizerForView:action:](self, "_addTapRecognizerForView:action:", v36, sel__expandSection_);

        -[NSMutableArray addObject:](self->_sections, "addObject:", v35);
      }
      v56 = v4;
      objc_msgSend(v11, "releaseNotes");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v39 = v37;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v69 != v42)
              objc_enumerationMutation(v39);
            objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "changeNotes");
            v44 = objc_claimAutoreleasedReturnValue();
            v45 = (void *)v44;
            if (v44)
              v46 = (const __CFString *)v44;
            else
              v46 = &stru_2511FF0C8;
            -[SUUIProductPageDetailsViewController _textLayoutRequestWithText:widthOffset:](self, "_textLayoutRequestWithText:widthOffset:", v46, 15.0);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObject:", v47);

          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
        }
        while (v41);
      }

      v4 = v56;
      v18 = (void *)v64;
      if (objc_msgSend(v39, "count"))
      {
        v48 = -[SUUIProductPageTableUpdateHistorySection initWithClientContext:]([SUUIProductPageTableUpdateHistorySection alloc], "initWithClientContext:", self->_clientContext);
        -[SUUIProductPageTableUpdateHistorySection headerViewForTableView:](v48, "headerViewForTableView:", v56);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIProductPageDetailsViewController _addTapRecognizerForView:action:](self, "_addTapRecognizerForView:action:", v49, sel__expandSection_);

        -[SUUIProductPageTableUpdateHistorySection setColorScheme:](v48, "setColorScheme:", v64);
        -[SUUIProductPageTableUpdateHistorySection setFirstStringIndex:](v48, "setFirstStringIndex:", objc_msgSend(v5, "count"));
        -[SUUIProductPageTableUpdateHistorySection setReleaseNotes:](v48, "setReleaseNotes:", v39);
        -[SUUITableViewSection setSectionIndex:](v48, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
        -[SUUIProductPageTableUpdateHistorySection setTextLayoutCache:](v48, "setTextLayoutCache:", self->_textLayoutCache);
        -[SUUIProductPageTableUpdateHistorySection headerViewForTableView:](v48, "headerViewForTableView:", v56);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIProductPageDetailsViewController _addTapRecognizerForView:action:](self, "_addTapRecognizerForView:action:", v50, sel__expandSection_);

        objc_msgSend(v5, "addObjectsFromArray:", v38);
        -[NSMutableArray addObject:](self->_sections, "addObject:", v48);

      }
      v3 = v57;
      v11 = v67;
    }
    v51 = -[SUUIProductPageTableLinksSection initWithItem:clientContext:askPermission:]([SUUIProductPageTableLinksSection alloc], "initWithItem:clientContext:askPermission:", v11, self->_clientContext, self->_askPermission);
    -[SUUIProductPageTableLinksSection setColorScheme:](v51, "setColorScheme:", v18);
    if (-[SUUIProductPageTableLinksSection numberOfRowsInSection](v51, "numberOfRowsInSection") >= 1)
    {
      -[SUUITableViewSection setSectionIndex:](v51, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      -[NSMutableArray addObject:](self->_sections, "addObject:", v51);
    }
    -[SUUIProductPageDetailsViewController _copyrightSection](self, "_copyrightSection");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v52, "setSectionIndex:", -[NSMutableArray count](self->_sections, "count"));
      -[NSMutableArray addObject:](self->_sections, "addObject:", v52);
    }
    -[SUUILayoutCache populateCacheWithLayoutRequests:](self->_textLayoutCache, "populateCacheWithLayoutRequests:", v5);
    objc_msgSend(v3, "setTextLayoutCache:", self->_textLayoutCache);
    objc_msgSend(v3, "setSections:", self->_sections);

  }
  objc_msgSend(v3, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_alloc(MEMORY[0x24BEBDB00]);
  objc_msgSend(v53, "frame");
  v55 = (void *)objc_msgSend(v54, "initWithFrame:");
  objc_msgSend(v53, "setAutoresizingMask:", 18);
  objc_msgSend(v55, "bounds");
  objc_msgSend(v53, "setFrame:");
  objc_msgSend(v55, "addSubview:", v53);
  -[SUUIProductPageDetailsViewController setView:](self, "setView:", v55);

}

- (SUUIProductPageHeaderViewController)headerViewController
{
  return -[SUUIProductPageTableViewController headerViewController](self->_tableViewController, "headerViewController");
}

- (void)setHeaderViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIProductPageDetailsViewController _tableViewController](self, "_tableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderViewController:", v4);

}

- (void)setDelegate:(id)a3
{
  SUUIProductPageChildViewControllerDelegate **p_delegate;
  id WeakRetained;
  id v6;

  p_delegate = &self->_delegate;
  objc_storeWeak((id *)&self->_delegate, a3);
  -[SUUIProductPageDetailsViewController _tableViewController](self, "_tableViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v6, "setDelegate:", WeakRetained);

}

- (UIScrollView)scrollView
{
  void *v2;
  void *v3;

  -[SUUIProductPageDetailsViewController _tableViewController](self, "_tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v3;
}

- (void)screenshotsWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (!SUUIUserInterfaceIdiom(self->_clientContext))
  {
    -[SUUIProductPageDetailsViewController _tableViewController](self, "_tableViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageDetailsViewController _screenshotsSection](self, "_screenshotsSection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollToView:animated:", v5, 1);

  }
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__SUUIProductPageDetailsViewController_itemStateCenterRestrictionsChanged___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __75__SUUIProductPageDetailsViewController_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "_screenshotsSection");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "isViewLoaded") == 0;
  v2 = v19;
  v3 = v3 || v19 == 0;
  if (v3)
    goto LABEL_20;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "parentalControlsRank");
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "parentalControlsRank");

  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "indexOfObjectIdenticalTo:", v19);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v5 < v7)
  {
    v10 = v8 == 0x7FFFFFFFFFFFFFFFLL && v5 < v7;
    v2 = v19;
    if (!v10)
      goto LABEL_20;
    v11 = *(_QWORD **)(a1 + 32);
    v12 = (void *)v11[130];
    objc_msgSend(v11, "_storeNotesSection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObject:atIndex:", v19, v13 != 0);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "removeObjectIdenticalTo:", v19);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "count"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "objectAtIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSectionIndex:", v14);

      ++v14;
    }
    while (v14 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "count"));
  }
  objc_msgSend(*(id *)(a1 + 32), "_tableViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSections:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));

  objc_msgSend(*(id *)(a1 + 32), "_tableViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadData");

  v2 = v19;
LABEL_20:

}

- (id)tableViewForTableViewSection:(id)a3
{
  return -[SUUIProductPageTableViewController tableView](self->_tableViewController, "tableView", a3);
}

- (void)_expandSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *sections;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  -[SUUIProductPageDetailsViewController _tableViewController](self, "_tableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  sections = self->_sections;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__SUUIProductPageDetailsViewController__expandSection___block_invoke;
  v13[3] = &unk_2511FD7D0;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  v12 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](sections, "enumerateObjectsUsingBlock:", v13);

}

void __55__SUUIProductPageDetailsViewController__expandSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _BOOL4 v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  CGRect v13;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "rectForHeaderInSection:", a3);
  v7 = CGRectContainsPoint(v13, *(CGPoint *)(a1 + 40));
  v8 = v12;
  if (v7)
  {
    if ((objc_msgSend(v12, "isExpanded") & 1) == 0)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v12, "setExpanded:", 1);
      if (objc_msgSend(v12, "numberOfRowsInSection") >= 1)
      {
        v10 = 0;
        do
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v10, a3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v11);

          ++v10;
        }
        while (v10 < objc_msgSend(v12, "numberOfRowsInSection"));
      }
      objc_msgSend(*(id *)(a1 + 32), "insertRowsAtIndexPaths:withRowAnimation:", v9, 2);

    }
    *a4 = 1;
    v8 = v12;
  }

}

- (void)_addTapRecognizerForView:(id)a3 action:(SEL)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x24BEBDA20];
  v7 = a3;
  v10 = (id)objc_msgSend([v6 alloc], "initWithTarget:action:", self, a4);
  -[SUUIProductPageTableViewController tableView](self->_tableViewController, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "panGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requireGestureRecognizerToFail:", v9);

  objc_msgSend(v7, "addGestureRecognizer:", v10);
}

- (id)_bundledAppsSection
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  SUUILockupComponent *v13;
  SUUILockupComponent *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  SUUIClientContext *clientContext;
  SUUIProductPageTableSwooshSection *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SUUIProductPageDetailsViewController *v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[SUUIProductPage item](self->_productPage, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "itemKind") == 17)
  {
    v29 = self;
    objc_msgSend(v3, "childItemIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0uLL;
    v37 = 0;
    SUUILockupStyleDefault((uint64_t)&v36);
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v3, "childItemForIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = [SUUILockupComponent alloc];
          v14 = v13;
          if (v12)
          {
            v30 = v36;
            v31 = v37;
            v15 = -[SUUILockupComponent initWithItem:style:](v13, "initWithItem:style:", v12, &v30);
          }
          else
          {
            v16 = objc_msgSend(v11, "longLongValue");
            v30 = v36;
            v31 = v37;
            v15 = -[SUUILockupComponent initWithItemIdentifier:style:](v14, "initWithItemIdentifier:style:", v16, &v30);
          }
          v17 = (void *)v15;
          if (v15)
            objc_msgSend(v5, "addObject:", v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v8);
    }

    v18 = objc_msgSend(v5, "count");
    if (v18 < 1)
    {
      v22 = 0;
    }
    else
    {
      v19 = v18;
      v20 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      objc_msgSend(v20, "setNumberStyle:", 1);
      clientContext = v29->_clientContext;
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_BUNDLED_APPS_%@"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_BUNDLED_APPS_%@"), 0, CFSTR("ProductPage"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringFromNumber:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%@"), 0, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = -[SUUIProductPageTableSwooshSection initWithLockups:title:]([SUUIProductPageTableSwooshSection alloc], "initWithLockups:title:", v5, v27);
      -[SUUIProductPageDetailsViewController _configureSwooshSection:](v29, "_configureSwooshSection:", v22);

    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)_configureSwooshSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SUUIColorScheme *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  -[SUUIProductPageDetailsViewController _tableViewController](self, "_tableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageDetailsViewController clientContext](self, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientContext:", v6);

  -[SUUIProductPageDetailsViewController _resourceLoader](self, "_resourceLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResourceLoader:", v7);

  -[SUUIProductPage uber](self->_productPage, "uber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorScheme");
  v9 = (SUUIColorScheme *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(SUUIColorScheme);
    objc_msgSend(v5, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIColorScheme setBackgroundColor:](v9, "setBackgroundColor:", v11);

  }
  objc_msgSend(v4, "setColorScheme:", v9);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __64__SUUIProductPageDetailsViewController__configureSwooshSection___block_invoke;
  v16 = &unk_2511FD7F8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v4, "setActionBlock:", &v13);
  objc_msgSend(v4, "swooshViewController", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChildViewController:", v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __64__SUUIProductPageDetailsViewController__configureSwooshSection___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  char v6;
  id v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 124);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained(v4 + 124);
      objc_msgSend(v7, "productPageChildOpenItem:", v8);

    }
  }

}

- (id)_copyrightSection
{
  SUUIProductPageTableHeaderOnlySection *copyrightSection;
  void *v4;
  void *v5;
  SUUIProductPageCopyrightView *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  SUUIProductPageTableHeaderOnlySection *v16;
  SUUIProductPageTableHeaderOnlySection *v17;

  copyrightSection = self->_copyrightSection;
  if (!copyrightSection)
  {
    -[SUUIProductPage item](self->_productPage, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "copyrightString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      v6 = objc_alloc_init(SUUIProductPageCopyrightView);
      -[SUUIProductPage uber](self->_productPage, "uber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "colorScheme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageCopyrightView setColorScheme:](v6, "setColorScheme:", v8);

      -[SUUIProductPageCopyrightView setCopyrightString:](v6, "setCopyrightString:", v5);
      -[SUUIProductPageCopyrightView frame](v6, "frame");
      v10 = v9;
      v12 = v11;
      v13 = (void *)objc_opt_class();
      objc_msgSend(v13, "defaultPageWidthForUserInterfaceIdiom:", SUUIUserInterfaceIdiom(self->_clientContext));
      -[SUUIProductPageCopyrightView sizeThatFits:](v6, "sizeThatFits:");
      -[SUUIProductPageCopyrightView setFrame:](v6, "setFrame:", v10, v12, v14, v15);
      v16 = objc_alloc_init(SUUIProductPageTableHeaderOnlySection);
      v17 = self->_copyrightSection;
      self->_copyrightSection = v16;

      -[SUUIProductPageTableHeaderOnlySection setHeaderView:](self->_copyrightSection, "setHeaderView:", v6);
    }

    copyrightSection = self->_copyrightSection;
  }
  return copyrightSection;
}

- (id)_descriptionSection
{
  SUUIProductPageTableTextBoxSection *descriptionSection;
  void *v4;
  void *v5;
  SUUIProductPageTableTextBoxSection *v6;
  SUUIProductPageTableTextBoxSection *v7;
  SUUIProductPageTableTextBoxSection *v8;
  SUUIClientContext *clientContext;
  void *v10;
  SUUIProductPageTableTextBoxSection *v11;
  void *v12;
  void *v13;

  descriptionSection = self->_descriptionSection;
  if (!descriptionSection)
  {
    -[SUUIProductPage item](self->_productPage, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = -[SUUIProductPageTableTextBoxSection initWithClientContext:]([SUUIProductPageTableTextBoxSection alloc], "initWithClientContext:", self->_clientContext);
      v7 = self->_descriptionSection;
      self->_descriptionSection = v6;

      -[SUUIProductPageTableTextBoxSection setTextLayoutCache:](self->_descriptionSection, "setTextLayoutCache:", self->_textLayoutCache);
      v8 = self->_descriptionSection;
      clientContext = self->_clientContext;
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_DESCRIPTION_TITLE"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_DESCRIPTION_TITLE"), 0, CFSTR("ProductPage"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableTextBoxSection setTitle:](v8, "setTitle:", v10);

      v11 = self->_descriptionSection;
      -[SUUIProductPage uber](self->_productPage, "uber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "colorScheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableTextBoxSection setColorScheme:](v11, "setColorScheme:", v13);

    }
    descriptionSection = self->_descriptionSection;
  }
  return descriptionSection;
}

- (id)_featuresSection
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  SUUIProductPageFeaturesView *v7;
  void *v8;
  void *v9;
  SUUIClientContext *clientContext;
  SUUIProductPageTableHeaderOnlySection *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  -[SUUIProductPage item](self->_productPage, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportedFeatures");

  -[SUUIProductPage item](self->_productPage, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportedGameCenterFeatures");

  if (v4)
  {
    v7 = objc_alloc_init(SUUIProductPageFeaturesView);
    -[SUUIProductPageFeaturesView setClientContext:](v7, "setClientContext:", self->_clientContext);
    -[SUUIProductPage uber](self->_productPage, "uber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorScheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageFeaturesView setColorScheme:](v7, "setColorScheme:", v9);

    -[SUUIProductPageFeaturesView setFeatures:gameCenterFeatures:](v7, "setFeatures:gameCenterFeatures:", v4, v6);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_SUPPORTS_TITLE"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_SUPPORTS_TITLE"), 0, CFSTR("ProductPage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageFeaturesView setTitle:](v7, "setTitle:", v12);

    -[SUUIProductPageFeaturesView frame](v7, "frame");
    v14 = v13;
    v16 = v15;
    v17 = (void *)objc_opt_class();
    objc_msgSend(v17, "defaultPageWidthForUserInterfaceIdiom:", SUUIUserInterfaceIdiom(self->_clientContext));
    -[SUUIProductPageFeaturesView sizeThatFits:](v7, "sizeThatFits:");
    -[SUUIProductPageFeaturesView setFrame:](v7, "setFrame:", v14, v16, v18, v19);
    v11 = objc_alloc_init(SUUIProductPageTableHeaderOnlySection);
    -[SUUIProductPageTableHeaderOnlySection setHeaderView:](v11, "setHeaderView:", v7);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)_infoSection
{
  void *v3;
  void *v4;
  SUUIProductPageInformationViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  SUUIProductPageTableHeaderOnlySection *v20;
  SUUIProductPageTableHeaderOnlySection *v21;

  -[SUUIProductPage item](self->_productPage, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPage productInformation](self->_productPage, "productInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (v3)
    {
      v5 = -[SUUIProductPageInformationViewController initWithItem:clientContext:]([SUUIProductPageInformationViewController alloc], "initWithItem:clientContext:", v3, self->_clientContext);
      if (v5)
        goto LABEL_6;
    }
    else
    {
      v5 = 0;
    }
LABEL_8:
    v20 = 0;
    goto LABEL_9;
  }
  v5 = -[SUUIProductPageInformationViewController initWithProductInformation:clientContext:]([SUUIProductPageInformationViewController alloc], "initWithProductInformation:clientContext:", v4, self->_clientContext);
  if (!v5)
    goto LABEL_8;
LABEL_6:
  -[SUUIProductPageDetailsViewController operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageInformationViewController setOperationQueue:](v5, "setOperationQueue:", v6);

  -[SUUIProductPageInformationViewController view](v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPage uber](self->_productPage, "uber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColorScheme:", v9);

  -[SUUIProductPageDetailsViewController _tableViewController](self, "_tableViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addChildViewController:", v5);

  -[SUUIProductPageInformationViewController view](v5, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_opt_class();
  objc_msgSend(v16, "defaultPageWidthForUserInterfaceIdiom:", SUUIUserInterfaceIdiom(self->_clientContext));
  v18 = v17;
  objc_msgSend(v11, "sizeThatFits:");
  objc_msgSend(v11, "setFrame:", v13, v15, v18, v19);
  v20 = objc_alloc_init(SUUIProductPageTableHeaderOnlySection);
  -[SUUIProductPageTableHeaderOnlySection setHeaderView:](v20, "setHeaderView:", v11);

LABEL_9:
  v21 = v20;

  return v21;
}

- (id)_parentBundlesSection
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  SUUILockupComponent *v12;
  uint64_t v13;
  SUUILockupComponent *v14;
  SUUIClientContext *clientContext;
  void *v16;
  SUUIProductPageTableLockupsSection *v17;
  void *v18;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[SUUIProductPage item](self->_productPage, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentBundleItemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0uLL;
  v27 = 0;
  if (objc_msgSend(v4, "count", SUUILockupStyleDefault((uint64_t)&v26)) == 1
    && SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    v27 = 466;
  }
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = [SUUILockupComponent alloc];
        v13 = objc_msgSend(v11, "longLongValue");
        v20 = v26;
        v21 = v27;
        v14 = -[SUUILockupComponent initWithItemIdentifier:style:](v12, "initWithItemIdentifier:style:", v13, &v20);
        objc_msgSend(v5, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v8);
  }

  clientContext = self->_clientContext;
  if (clientContext)
    -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_PARENT_BUNDLE_TITLE"), CFSTR("ProductPage"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_PARENT_BUNDLE_TITLE"), 0, CFSTR("ProductPage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    v17 = -[SUUIProductPageTableLockupsSection initWithLockups:title:]([SUUIProductPageTableLockupsSection alloc], "initWithLockups:title:", v5, v16);
    -[SUUITableViewSection setDelegate:](v17, "setDelegate:", self);
    -[SUUIProductPageDetailsViewController _resourceLoader](self, "_resourceLoader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageTableLockupsSection setResourceLoader:](v17, "setResourceLoader:", v18);

  }
  else if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v17 = 0;
  }
  else
  {
    v17 = -[SUUIProductPageTableSwooshSection initWithLockups:title:]([SUUIProductPageTableSwooshSection alloc], "initWithLockups:title:", v5, v16);
    -[SUUIProductPageDetailsViewController _configureSwooshSection:](self, "_configureSwooshSection:", v17);
  }

  return v17;
}

- (id)_resourceLoader
{
  SUUIResourceLoader *resourceLoader;
  SUUIResourceLoader *v4;
  void *v5;
  SUUIResourceLoader *v6;
  SUUIResourceLoader *v7;
  SUUIResourceLoader *v8;
  void *v9;

  resourceLoader = self->_resourceLoader;
  if (!resourceLoader)
  {
    v4 = [SUUIResourceLoader alloc];
    -[SUUIProductPageDetailsViewController clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIResourceLoader initWithClientContext:](v4, "initWithClientContext:", v5);
    v7 = self->_resourceLoader;
    self->_resourceLoader = v6;

    v8 = self->_resourceLoader;
    SUUIResourceLoaderGetNameForObject(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIResourceLoader setName:](v8, "setName:", v9);

    resourceLoader = self->_resourceLoader;
  }
  return resourceLoader;
}

- (id)_screenshotsSection
{
  SUUIProductPageTableHeaderOnlySection *screenshotsSection;
  void *v4;
  void *v5;
  void *v6;
  SUUIScreenshotsViewController *v7;
  void *v8;
  SUUIScreenshotsViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  SUUIProductPageTableHeaderOnlySection *v13;
  SUUIProductPageTableHeaderOnlySection *v14;

  screenshotsSection = self->_screenshotsSection;
  if (!screenshotsSection)
  {
    -[SUUIProductPage item](self->_productPage, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screenshots");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
    {
      v7 = [SUUIScreenshotsViewController alloc];
      -[SUUIProductPageDetailsViewController clientContext](self, "clientContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SUUIScreenshotsViewController initWithTrailers:screenshots:clientContext:](v7, "initWithTrailers:screenshots:clientContext:", v6, v5, v8);

      -[SUUIScreenshotsViewController setDelegate:](v9, "setDelegate:", self);
      -[SUUIProductPageDetailsViewController operationQueue](self, "operationQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIScreenshotsViewController setOperationQueue:](v9, "setOperationQueue:", v10);

      -[SUUIProductPageDetailsViewController _tableViewController](self, "_tableViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addChildViewController:", v9);

      -[SUUIScreenshotsViewController view](v9, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAutoresizingMask:", 2);
      v13 = objc_alloc_init(SUUIProductPageTableHeaderOnlySection);
      v14 = self->_screenshotsSection;
      self->_screenshotsSection = v13;

      -[SUUIProductPageTableHeaderOnlySection setHeaderView:](self->_screenshotsSection, "setHeaderView:", v12);
      -[SUUIScreenshotsViewController reloadData](v9, "reloadData");

    }
    screenshotsSection = self->_screenshotsSection;
  }
  return screenshotsSection;
}

- (id)_storeNotesSection
{
  SUUIProductPageTableTextBoxSection *storeNotesSection;
  void *v4;
  void *v5;
  void *v6;
  SUUIProductPageTableTextBoxSection *v7;
  SUUIProductPageTableTextBoxSection *v8;
  SUUIProductPageTableTextBoxSection *v9;
  SUUIClientContext *clientContext;
  void *v11;
  SUUIProductPageTableTextBoxSection *v12;
  void *v13;
  void *v14;

  storeNotesSection = self->_storeNotesSection;
  if (!storeNotesSection)
  {
    -[SUUIProductPage item](self->_productPage, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeNotes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "standardNotes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[SUUIProductPageTableTextBoxSection initWithClientContext:]([SUUIProductPageTableTextBoxSection alloc], "initWithClientContext:", self->_clientContext);
      v8 = self->_storeNotesSection;
      self->_storeNotesSection = v7;

      -[SUUIProductPageTableTextBoxSection setTextLayoutCache:](self->_storeNotesSection, "setTextLayoutCache:", self->_textLayoutCache);
      v9 = self->_storeNotesSection;
      clientContext = self->_clientContext;
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_STORE_NOTES_TITLE"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_STORE_NOTES_TITLE"), 0, CFSTR("ProductPage"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableTextBoxSection setTitle:](v9, "setTitle:", v11);

      v12 = self->_storeNotesSection;
      -[SUUIProductPage uber](self->_productPage, "uber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "colorScheme");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableTextBoxSection setColorScheme:](v12, "setColorScheme:", v14);

    }
    storeNotesSection = self->_storeNotesSection;
  }
  return storeNotesSection;
}

- (id)_tableViewController
{
  SUUIProductPageTableViewController *tableViewController;
  SUUIProductPageTableViewController *v4;
  SUUIProductPageTableViewController *v5;
  SUUIProductPageTableViewController *v6;
  id WeakRetained;
  SUUIProductPageTableViewController *v8;
  void *v9;
  void *v10;

  tableViewController = self->_tableViewController;
  if (!tableViewController)
  {
    v4 = objc_alloc_init(SUUIProductPageTableViewController);
    v5 = self->_tableViewController;
    self->_tableViewController = v4;

    -[SUUIProductPageTableViewController setClientContext:](self->_tableViewController, "setClientContext:", self->_clientContext);
    -[SUUIProductPageTableViewController setDelegateSender:](self->_tableViewController, "setDelegateSender:", self);
    v6 = self->_tableViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[SUUIProductPageTableViewController setDelegate:](v6, "setDelegate:", WeakRetained);

    v8 = self->_tableViewController;
    -[SUUIProductPage uber](self->_productPage, "uber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorScheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageTableViewController setColorScheme:](v8, "setColorScheme:", v10);

    -[SUUIProductPageTableViewController setSections:](self->_tableViewController, "setSections:", self->_sections);
    -[SUUIProductPageTableViewController setTextLayoutCache:](self->_tableViewController, "setTextLayoutCache:", self->_textLayoutCache);
    -[SUUIProductPageDetailsViewController addChildViewController:](self, "addChildViewController:", self->_tableViewController);
    tableViewController = self->_tableViewController;
  }
  return tableViewController;
}

- (id)_textLayoutRequestWithText:(id)a3 widthOffset:(double)a4
{
  id v6;
  SUUITextLayoutRequest *v7;
  void *v8;
  double v9;

  v6 = a3;
  v7 = objc_alloc_init(SUUITextLayoutRequest);
  -[SUUITextLayoutRequest setNumberOfLines:](v7, "setNumberOfLines:", 5);
  -[SUUITextLayoutRequest setText:](v7, "setText:", v6);

  v8 = (void *)objc_opt_class();
  objc_msgSend(v8, "defaultPageWidthForUserInterfaceIdiom:", SUUIUserInterfaceIdiom(self->_clientContext));
  -[SUUITextLayoutRequest setWidth:](v7, "setWidth:", v9 + -30.0 - a4);
  return v7;
}

- (id)_whatsNewSection
{
  SUUIProductPageTableTextBoxSection *whatsNewSection;
  void *v4;
  void *v5;
  SUUIProductPageTableTextBoxSection *v6;
  SUUIProductPageTableTextBoxSection *v7;
  SUUIProductPageTableTextBoxSection *v8;
  SUUIClientContext *clientContext;
  void *v10;
  SUUIProductPageTableTextBoxSection *v11;
  void *v12;
  void *v13;
  void *v14;

  whatsNewSection = self->_whatsNewSection;
  if (!whatsNewSection)
  {
    -[SUUIProductPage item](self->_productPage, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[SUUIProductPageTableTextBoxSection initWithClientContext:]([SUUIProductPageTableTextBoxSection alloc], "initWithClientContext:", self->_clientContext);
      v7 = self->_whatsNewSection;
      self->_whatsNewSection = v6;

      -[SUUIProductPageTableTextBoxSection setTextLayoutCache:](self->_whatsNewSection, "setTextLayoutCache:", self->_textLayoutCache);
      v8 = self->_whatsNewSection;
      clientContext = self->_clientContext;
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_WHATS_NEW_TITLE"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_WHATS_NEW_TITLE"), 0, CFSTR("ProductPage"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableTextBoxSection setTitle:](v8, "setTitle:", v10);

      v11 = self->_whatsNewSection;
      -[SUUIProductPage uber](self->_productPage, "uber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "colorScheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableTextBoxSection setColorScheme:](v11, "setColorScheme:", v13);

      objc_msgSend(v4, "lastUpdateDateString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        -[SUUIProductPageTableTextBoxSection setSubtitle:](self->_whatsNewSection, "setSubtitle:", v14);

    }
    whatsNewSection = self->_whatsNewSection;
  }
  return whatsNewSection;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUIProductPageChildViewControllerDelegate)delegate
{
  return (SUUIProductPageChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (SUUIProductPage)productPage
{
  return self->_productPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whatsNewSection, 0);
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_storeNotesSection, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_screenshotsSection, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_descriptionSection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_copyrightSection, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
