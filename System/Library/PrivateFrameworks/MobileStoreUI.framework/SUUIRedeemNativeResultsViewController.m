@implementation SUUIRedeemNativeResultsViewController

+ (BOOL)canShowResultsForRedeem:(id)a3
{
  return 1;
}

- (SUUIRedeemNativeResultsViewController)initWithRedeem:(id)a3
{
  id v4;
  SUUIRedeemNativeResultsViewController *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  SUUIItemStateCenter *itemStateCenter;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSOperationQueue *v18;
  NSOperationQueue *operationQueue;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUUIRedeemNativeResultsViewController;
  v5 = -[SUUIRedeemResultsViewController initWithRedeem:](&v21, sel_initWithRedeem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
      v8 = objc_claimAutoreleasedReturnValue();
      itemStateCenter = v5->_itemStateCenter;
      v5->_itemStateCenter = (SUUIItemStateCenter *)v8;

      -[SUUIItemStateCenter addObserver:](v5->_itemStateCenter, "addObserver:", v5);
      objc_msgSend(v4, "downloads");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v4, "downloads");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          v12 = v11;
        else
          v12 = (void *)MEMORY[0x24BDBD1A8];
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v4, "items");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v16, "itemIdentifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          -[SUUIItemStateCenter addRelationshipForParentAdamId:withChildAdamIds:](v5->_itemStateCenter, "addRelationshipForParentAdamId:withChildAdamIds:", v17, v13);

      }
    }
    v18 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v18;

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  SUUIItemStateCenter *itemStateCenter;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[UIButton removeTarget:action:forControlEvents:](self->_anotherButton, "removeTarget:action:forControlEvents:", self, 0, 64);
  -[SUUITextBoxView removeTarget:action:forControlEvents:](self->_extendedMessageView, "removeTarget:action:forControlEvents:", self, 0, 64);
  -[SUUIGiftItemView itemOfferButton](self->_itemView, "itemOfferButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 64);

  itemStateCenter = self->_itemStateCenter;
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v8, "itemIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemStateCenter removeRelationshipsForParentAdamId:](itemStateCenter, "removeRelationshipsForParentAdamId:", v9);

  -[SUUIItemStateCenter removeObserver:](self->_itemStateCenter, "removeObserver:", self);
  -[SUUIRedeemITunesPassLockup removeTarget:action:forControlEvents:](self->_passbookLockup, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v10.receiver = self;
  v10.super_class = (Class)SUUIRedeemNativeResultsViewController;
  -[SUUIRedeemNativeResultsViewController dealloc](&v10, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  SUUIRedeemResultsView *v6;

  v6 = objc_alloc_init(SUUIRedeemResultsView);
  -[SUUIRedeemResultsView setResultsDelegate:](v6, "setResultsDelegate:", self);
  -[SUUIRedeemResultsView setContentInsetAdjustmentBehavior:](v6, "setContentInsetAdjustmentBehavior:", 101);
  -[SUUIRedeemNativeResultsViewController setView:](self, "setView:", v6);
  -[SUUIRedeemNativeResultsViewController _reloadSections](self, "_reloadSections");
  -[SUUIRedeemStepViewController clientContext](self, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("REDEEM_VIEW_TITLE"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_VIEW_TITLE"), 0, CFSTR("Redeem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemNativeResultsViewController setTitle:](self, "setTitle:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;

  v3 = a3;
  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerArtworkProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    if (v9 == 2.0)
      objc_msgSend(v6, "largestArtwork");
    else
      objc_msgSend(v6, "smallestArtwork");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x24BEB2040]);
    objc_msgSend(v10, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithURL:", v12);

    +[SSVURLDataConsumer consumer](SUUIImageDataConsumer, "consumer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDataConsumer:", v14);

    objc_initWeak(&location, self);
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke;
    v27[3] = &unk_2511F4A00;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v13, "setOutputBlock:", v27);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v13);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  -[SUUIGiftItemView artworkContext](self->_itemView, "artworkContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemNativeResultsViewController _item](self, "_item");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLForItem:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x24BEB2040]);
    -[SUUIRedeemNativeResultsViewController _item](self, "_item");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLForItem:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithURL:", v20);

    -[SUUIRedeemNativeResultsViewController _item](self, "_item");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataConsumerForItem:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDataConsumer:", v23);

    objc_initWeak(&location, self);
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_3;
    v25[3] = &unk_2511F4A00;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v21, "setOutputBlock:", v25);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v21);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  v24.receiver = self;
  v24.super_class = (Class)SUUIRedeemNativeResultsViewController;
  -[SUUIRedeemNativeResultsViewController viewWillAppear:](&v24, sel_viewWillAppear_, v3);

}

void __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_2;
  v5[3] = &unk_2511F6980;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v7);

}

void __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_setHeaderImage:", *(_QWORD *)(a1 + 32));

  }
}

void __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_4;
  v5[3] = &unk_2511F6980;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v7);

}

void __56__SUUIRedeemNativeResultsViewController_viewWillAppear___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_setItemImage:", *(_QWORD *)(a1 + 32));

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
  v7[2] = __75__SUUIRedeemNativeResultsViewController_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __75__SUUIRedeemNativeResultsViewController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "itemIdentifier");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = *(id *)(a1 + 40);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "itemIdentifier", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "longLongValue");

          if (v12 == v4)
          {
            objc_msgSend(*(id *)(a1 + 32), "_itemView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setItemState:animated:", v10, 1);

            objc_msgSend(*(id *)(a1 + 32), "_reloadResultViewMessage");
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
}

- (void)redeemResultsView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "links");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v13, "section");
    -[SUUIRedeemNativeResultsViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") - 2;

    if (v7 == v10)
    {
      objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v13, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        SUUIMetricsOpenURL(v12);

    }
  }

}

- (void)_extendedMessageAction:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double *v14;
  id v15;

  if (!self->_extendedMessageIsExpanded)
  {
    -[SUUITextBoxView frame](self->_extendedMessageView, "frame", a3);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    -[SUUITextLayout textSize](self->_extendedMessageTextLayout, "textSize");
    v11 = v10;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v14 = (double *)&kSUUITextBoxLayoutTextBottomPaddingIPad;
    else
      v14 = (double *)&kSUUITextBoxLayoutTextBottomPaddingIPhone;
    -[SUUITextBoxView setFrame:](self->_extendedMessageView, "setFrame:", v5, v7, v9, v11 + *v14);
    -[SUUITextBoxView setNumberOfVisibleLines:](self->_extendedMessageView, "setNumberOfVisibleLines:", 0);
    self->_extendedMessageIsExpanded = 1;
    -[SUUIRedeemNativeResultsViewController view](self, "view");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadData");

  }
}

- (void)_openAction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIItemStateCenter stateForItemWithIdentifier:](self->_itemStateCenter, "stateForItemWithIdentifier:", objc_msgSend(v7, "itemIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v8, "state");

  if ((v5 & 4) != 0)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__38;
    v23 = __Block_byref_object_dispose__38;
    objc_msgSend(v7, "bundleIdentifier");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)v20[5];
    if (v9)
      goto LABEL_4;
    v10 = dispatch_semaphore_create(0);
    v11 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v7, "itemIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__SUUIRedeemNativeResultsViewController__openAction___block_invoke;
    v16[3] = &unk_2511F6D88;
    v18 = &v19;
    v14 = v10;
    v17 = v14;
    objc_msgSend(v11, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v13, v16);

    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    v9 = (void *)v20[5];
    if (v9)
    {
LABEL_4:
      v15 = v9;
      SUUIMetricsLaunchApplicationWithIdentifier((uint64_t)v15, 0);
      CFRelease(v15);
    }
    _Block_object_dispose(&v19, 8);

  }
}

intptr_t __53__SUUIRedeemNativeResultsViewController__openAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BEB2A60]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_passbookLockupAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SUUIRedeemITunesPassLearnMoreViewController *v8;

  v8 = objc_alloc_init(SUUIRedeemITunesPassLearnMoreViewController);
  -[SUUIRedeemStepViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemStepViewController setClientContext:](v8, "setClientContext:", v4);

  -[SUUIRedeemStepViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemStepViewController setConfiguration:](v8, "setConfiguration:", v5);

  -[SUUIRedeemNativeResultsViewController operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemStepViewController setOperationQueue:](v8, "setOperationQueue:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  -[SUUIRedeemNativeResultsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_redeemAnotherAction:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[SUUIRedeemNativeResultsViewController navigationController](self, "navigationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      v6 &= 2u;
    if (v6)
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      *(_DWORD *)v13 = 138543618;
      *(_QWORD *)&v13[4] = v8;
      *(_WORD *)&v13[12] = 2114;
      *(_QWORD *)&v13[14] = objc_opt_class();
      v10 = *(id *)&v13[14];
      LODWORD(v12) = 22;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, v13, v12, *(_OWORD *)v13, *(_QWORD *)&v13[16]);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v11);
      SSFileLog();
    }

    goto LABEL_12;
  }
  objc_msgSend(v3, "redeemAgainAnimated:", 1);
LABEL_13:

}

- (id)_anotherButtonSection
{
  UIButton *v3;
  UIButton *anotherButton;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIButton *v15;
  double v16;
  double v17;
  SUUIRedeemResultSimpleTableViewSection *v18;
  double v19;
  double v20;
  double v21;
  float v22;

  if (!self->_anotherButton)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
    anotherButton = self->_anotherButton;
    self->_anotherButton = v3;

    -[UIButton addTarget:action:forControlEvents:](self->_anotherButton, "addTarget:action:forControlEvents:", self, sel__redeemAnotherAction_, 64);
    -[UIButton setAutoresizingMask:](self->_anotherButton, "setAutoresizingMask:", 5);
    -[UIButton setContentHorizontalAlignment:](self->_anotherButton, "setContentHorizontalAlignment:", 0);
    -[UIButton setContentEdgeInsets:](self->_anotherButton, "setContentEdgeInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
    v5 = self->_anotherButton;
    -[SUUIRedeemStepViewController clientContext](self, "clientContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "localizedStringForKey:inTable:", CFSTR("REDEEM_SUCCESS_REDEEM_AGAIN"), CFSTR("Redeem"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_SUCCESS_REDEEM_AGAIN"), 0, CFSTR("Redeem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v5, "setTitle:forState:", v8, 0);

    -[UIButton titleLabel](self->_anotherButton, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    -[UIButton frame](self->_anotherButton, "frame");
    v12 = v11;
    v14 = v13;
    v15 = self->_anotherButton;
    -[SUUIRedeemNativeResultsViewController _tableWidth](self, "_tableWidth");
    -[UIButton sizeThatFits:](v15, "sizeThatFits:");
    -[UIButton setFrame:](self->_anotherButton, "setFrame:", v12, v14, v16, v17);
  }
  v18 = -[SUUIRedeemResultSimpleTableViewSection initWithView:]([SUUIRedeemResultSimpleTableViewSection alloc], "initWithView:", self->_anotherButton);
  -[SUUIRedeemNativeResultsViewController _tableWidth](self, "_tableWidth");
  v20 = v19;
  -[UIButton bounds](self->_anotherButton, "bounds");
  v22 = (v20 - v21) * 0.5;
  -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v18, "setContentInsets:", -2.0, floorf(v22), -2.0, 0.0);
  return v18;
}

- (id)_emptySection
{
  SUUIRedeemResultSimpleTableViewSection *v2;
  id v3;
  void *v4;
  SUUIRedeemResultSimpleTableViewSection *v5;

  v2 = [SUUIRedeemResultSimpleTableViewSection alloc];
  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v5 = -[SUUIRedeemResultSimpleTableViewSection initWithView:](v2, "initWithView:", v4);

  return v5;
}

- (id)_extendedMessageViewSection
{
  void *v3;
  void *v4;
  SUUITextBoxView *v5;
  SUUITextBoxView *extendedMessageView;
  SUUITextLayoutRequest *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  SUUITextLayout *v15;
  SUUITextLayout *extendedMessageTextLayout;
  double v17;
  double v18;
  double v19;
  double v20;
  SUUITextBoxView *v21;
  void *v22;
  void *v23;
  SUUIRedeemResultSimpleTableViewSection *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  double *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  double v36;
  void *v37;
  uint64_t v38;
  double v39;

  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!self->_extendedMessageView)
    {
      v5 = objc_alloc_init(SUUITextBoxView);
      extendedMessageView = self->_extendedMessageView;
      self->_extendedMessageView = v5;

      -[SUUITextBoxView addTarget:action:forControlEvents:](self->_extendedMessageView, "addTarget:action:forControlEvents:", self, sel__extendedMessageAction_, 64);
      -[SUUITextBoxView setContentInsets:](self->_extendedMessageView, "setContentInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
      v7 = objc_alloc_init(SUUITextLayoutRequest);
      -[SUUITextLayoutRequest setNumberOfLines:](v7, "setNumberOfLines:", 3);
      -[SUUITextLayoutRequest setFontSize:](v7, "setFontSize:", 14.0);
      -[SUUIRedeemResultsViewController redeem](self, "redeem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "message");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUITextLayoutRequest setText:](v7, "setText:", v9);

      -[SUUIRedeemNativeResultsViewController _tableWidth](self, "_tableWidth");
      v11 = v10;
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceIdiom");

      v14 = 60.0;
      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        v14 = 30.0;
      -[SUUITextLayoutRequest setWidth:](v7, "setWidth:", v11 - v14);
      v15 = -[SUUITextLayout initWithLayoutRequest:]([SUUITextLayout alloc], "initWithLayoutRequest:", v7);
      extendedMessageTextLayout = self->_extendedMessageTextLayout;
      self->_extendedMessageTextLayout = v15;

      -[SUUITextBoxView setFixedWidthTextFrame:](self->_extendedMessageView, "setFixedWidthTextFrame:", -[SUUITextLayout textFrame](self->_extendedMessageTextLayout, "textFrame"));
      -[SUUITextBoxView setNumberOfVisibleLines:](self->_extendedMessageView, "setNumberOfVisibleLines:", 3);
      -[SUUITextBoxView frame](self->_extendedMessageView, "frame");
      v18 = v17;
      v20 = v19;
      if (-[SUUITextLayout requiresTruncation](self->_extendedMessageTextLayout, "requiresTruncation"))
      {
        v21 = self->_extendedMessageView;
        -[SUUIRedeemStepViewController clientContext](self, "clientContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
          objc_msgSend(v22, "localizedStringForKey:", CFSTR("MORE_BUTTON"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("MORE_BUTTON"), 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUITextBoxView setMoreButtonTitle:](v21, "setMoreButtonTitle:", v27);

        -[SUUITextLayout truncatedSize](self->_extendedMessageTextLayout, "truncatedSize");
        v26 = v28;
      }
      else
      {
        -[SUUITextLayout textSize](self->_extendedMessageTextLayout, "textSize");
        v26 = v25;
        self->_extendedMessageIsExpanded = 1;
      }
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "userInterfaceIdiom");

      if ((v30 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v31 = (double *)&kSUUITextBoxLayoutTextBottomPaddingIPad;
      else
        v31 = (double *)&kSUUITextBoxLayoutTextBottomPaddingIPhone;
      v32 = v26 + *v31;
      -[SUUITextLayoutRequest width](v7, "width");
      -[SUUITextBoxView setFrame:](self->_extendedMessageView, "setFrame:", v18, v20, v33, v32);

    }
    v24 = -[SUUIRedeemResultSimpleTableViewSection initWithView:]([SUUIRedeemResultSimpleTableViewSection alloc], "initWithView:", self->_extendedMessageView);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "userInterfaceIdiom");

    if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v36 = 30.0;
    else
      v36 = 15.0;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "userInterfaceIdiom");

    if ((v38 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v39 = 30.0;
    else
      v39 = 15.0;
    -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v24, "setContentInsets:", -5.0, v36, -3.0, v39);
  }
  else
  {
    v24 = 0;
  }
  return v24;
}

- (id)_headerImageViewSection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  UIImageView *v10;
  UIImageView *headerImageView;
  SUUIRedeemResultSimpleTableViewSection *v12;

  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerArtworkProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!self->_headerImageView)
    {
      objc_msgSend(v4, "smallestArtwork");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc(MEMORY[0x24BEBD668]);
      -[SUUIRedeemNativeResultsViewController _tableWidth](self, "_tableWidth");
      v8 = v7;
      objc_msgSend(v5, "size");
      v10 = (UIImageView *)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, v8, v9);
      headerImageView = self->_headerImageView;
      self->_headerImageView = v10;

      -[UIImageView setContentMode:](self->_headerImageView, "setContentMode:", 4);
    }
    v12 = -[SUUIRedeemResultSimpleTableViewSection initWithView:]([SUUIRedeemResultSimpleTableViewSection alloc], "initWithView:", self->_headerImageView);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_itemViewSection
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  SUUIRedeemResultSimpleTableViewSection *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;

  -[SUUIRedeemNativeResultsViewController _itemView](self, "_itemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  -[SUUIRedeemNativeResultsViewController _tableWidth](self, "_tableWidth");
  v9 = v8;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  v12 = 60.0;
  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v12 = 30.0;
  objc_msgSend(v3, "sizeThatFits:", v9 - v12, 1.79769313e308);
  objc_msgSend(v3, "setFrame:", v5, v7, v13, v14);
  v15 = -[SUUIRedeemResultSimpleTableViewSection initWithView:]([SUUIRedeemResultSimpleTableViewSection alloc], "initWithView:", v3);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v18 = 30.0;
  else
    v18 = 15.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v21 = 30.0;
  else
    v21 = 15.0;
  -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v15, "setContentInsets:", 0.0, v18, 0.0, v21);

  return v15;
}

- (id)_messageViewSection
{
  SUUIRedeemResultMessageView *v3;
  SUUIRedeemResultMessageView *messageView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  SUUIRedeemResultSimpleTableViewSection *v14;

  if (!self->_messageView)
  {
    v3 = objc_alloc_init(SUUIRedeemResultMessageView);
    messageView = self->_messageView;
    self->_messageView = v3;

    -[SUUIRedeemResultsViewController redeem](self, "redeem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inAppPurchase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SUUIRedeemStepViewController clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("REDEEM_SUCCESS_MESSAGE_IN_APP"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_SUCCESS_MESSAGE_IN_APP"), 0, CFSTR("Redeem"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SUUIRedeemResultsViewController redeem](self, "redeem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        -[SUUIRedeemStepViewController clientContext](self, "clientContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          objc_msgSend(v12, "localizedStringForKey:inTable:", CFSTR("REDEEM_SUCCESS_MESSAGE"), CFSTR("Redeem"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_SUCCESS_MESSAGE"), 0, CFSTR("Redeem"));
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

    -[SUUIRedeemResultMessageView setTitle:](self->_messageView, "setTitle:", v11);
    -[SUUIRedeemNativeResultsViewController _reloadResultViewMessage](self, "_reloadResultViewMessage");

  }
  v14 = -[SUUIRedeemResultSimpleTableViewSection initWithView:]([SUUIRedeemResultSimpleTableViewSection alloc], "initWithView:", self->_messageView);
  -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v14, "setContentInsets:", -5.0, 0.0, -3.0, 0.0);
  return v14;
}

- (id)_resultImageViewSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SUUIRedeemResultSimpleTableViewSection *v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  void *v13;
  uint64_t v14;
  float v15;

  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("RedemptionCardStack"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v5);
  v7 = -[SUUIRedeemResultSimpleTableViewSection initWithView:]([SUUIRedeemResultSimpleTableViewSection alloc], "initWithView:", v6);
  -[SUUIRedeemNativeResultsViewController _tableWidth](self, "_tableWidth");
  v9 = v8;
  objc_msgSend(v6, "bounds");
  v11 = (v9 - v10) * 0.5;
  v12 = floorf(v11);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  v15 = 54.0;
  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v15 = 27.0;
  -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v7, "setContentInsets:", -0.0, v12, (float)-v15, 0.0);

  return v7;
}

- (id)_linksSection
{
  void *v2;
  void *v3;
  SUUIRedeemResultLinksTableViewSection *v4;

  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "links");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
    v4 = -[SUUIRedeemResultLinksTableViewSection initWithLinks:]([SUUIRedeemResultLinksTableViewSection alloc], "initWithLinks:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)_item
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[SUUIRedeemResultsViewController redeem](self, "redeem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_itemView
{
  void *v3;
  SUUIGiftItemView *v4;
  void *v5;
  SUUIGiftItemView *v6;
  SUUIGiftItemView *itemView;
  SUUIGiftItemView *v8;
  void *v9;
  SUUIGiftItemView *v10;
  void *v11;
  SUUIGiftItemView *v12;
  void *v13;
  void *v14;
  SUUIGiftItemView *v15;
  void *v16;
  void *v17;
  SUUIGiftItemView *v18;
  void *v19;
  SUUIGiftItemView *v20;
  float v21;
  double v22;
  SUUIGiftItemView *v23;
  void *v24;
  void *v25;
  SUUIGiftItemView *v26;

  -[SUUIRedeemNativeResultsViewController _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !self->_itemView)
  {
    v4 = [SUUIGiftItemView alloc];
    -[SUUIRedeemStepViewController clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIGiftItemView initWithStyle:item:clientContext:](v4, "initWithStyle:item:clientContext:", 3, v3, v5);
    itemView = self->_itemView;
    self->_itemView = v6;

    v8 = self->_itemView;
    objc_msgSend(v3, "artistName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftItemView setArtistName:](v8, "setArtistName:", v9);

    v10 = self->_itemView;
    objc_msgSend(v3, "categoryName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftItemView setCategoryName:](v10, "setCategoryName:", v11);

    v12 = self->_itemView;
    if (self->_itemImage)
    {
      -[SUUIGiftItemView setItemImage:](self->_itemView, "setItemImage:");
    }
    else
    {
      -[SUUIGiftItemView artworkContext](self->_itemView, "artworkContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "placeholderImageForItem:", v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIGiftItemView setItemImage:](v12, "setItemImage:", v14);

    }
    -[SUUIGiftItemView setNumberOfUserRatings:](self->_itemView, "setNumberOfUserRatings:", objc_msgSend(v3, "numberOfUserRatings"));
    v15 = self->_itemView;
    objc_msgSend(v3, "primaryItemOffer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "buttonText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftItemView setPrice:](v15, "setPrice:", v17);

    v18 = self->_itemView;
    objc_msgSend(v3, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftItemView setTitle:](v18, "setTitle:", v19);

    v20 = self->_itemView;
    objc_msgSend(v3, "userRating");
    *(float *)&v22 = v21 / 5.0;
    -[SUUIGiftItemView setUserRating:](v20, "setUserRating:", v22);
    v23 = self->_itemView;
    -[SUUIItemStateCenter stateForItemWithIdentifier:](self->_itemStateCenter, "stateForItemWithIdentifier:", objc_msgSend(v3, "itemIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftItemView setItemState:](v23, "setItemState:", v24);

    -[SUUIGiftItemView itemOfferButton](self->_itemView, "itemOfferButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__openAction_, 64);

  }
  v26 = self->_itemView;

  return v26;
}

- (id)_passbookLearnMoreSection
{
  SUUIRedeemITunesPassLockup *v3;
  void *v4;
  void *v5;
  void *v6;
  SUUIRedeemITunesPassLockup *v7;
  SUUIRedeemITunesPassLockup *passbookLockup;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SUUIRedeemResultSimpleTableViewSection *v20;

  if (!self->_passbookLockup)
  {
    v3 = [SUUIRedeemITunesPassLockup alloc];
    -[SUUIRedeemStepViewController configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ITunesPassConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemStepViewController clientContext](self, "clientContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SUUIRedeemITunesPassLockup initWithITunesPassConfiguration:clientContext:](v3, "initWithITunesPassConfiguration:clientContext:", v5, v6);
    passbookLockup = self->_passbookLockup;
    self->_passbookLockup = v7;

    -[SUUIRedeemITunesPassLockup addTarget:action:forControlEvents:](self->_passbookLockup, "addTarget:action:forControlEvents:", self, sel__passbookLockupAction_, 64);
    -[SUUIRedeemNativeResultsViewController _tableWidth](self, "_tableWidth");
    v10 = v9;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    v13 = 60.0;
    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      v13 = 30.0;
    v14 = v10 - v13;
    -[SUUIRedeemITunesPassLockup frame](self->_passbookLockup, "frame");
    v16 = v15;
    v18 = v17;
    -[SUUIRedeemITunesPassLockup sizeThatFits:](self->_passbookLockup, "sizeThatFits:", v14, 1.79769313e308);
    -[SUUIRedeemITunesPassLockup setFrame:](self->_passbookLockup, "setFrame:", v16, v18, v14, v19);
  }
  v20 = -[SUUIRedeemResultSimpleTableViewSection initWithView:]([SUUIRedeemResultSimpleTableViewSection alloc], "initWithView:", self->_passbookLockup);
  -[SUUIRedeemResultSimpleTableViewSection setContentInsets:](v20, "setContentInsets:", 0.0, 30.0, 0.0, 30.0);
  return v20;
}

- (void)_reloadResultViewMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL4 IsSoftwareKind;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  SUUIRedeemResultMessageView *messageView;
  double v33;
  double v34;
  _BOOL4 IsTVOnly;
  uint64_t v36;
  const __CFString *v37;
  const __CFString *v38;
  __CFString *v39;

  -[SUUIRedeemNativeResultsViewController _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "inAppPurchase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SUUIRedeemResultsViewController redeem](self, "redeem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inAppPurchase");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
      v39 = (__CFString *)v8;
LABEL_23:

      -[SUUIRedeemResultMessageView setMessage:](self->_messageView, "setMessage:", v39);
      goto LABEL_24;
    }
    v12 = objc_msgSend(v3, "itemKind");
    if ((unint64_t)(v12 - 1) > 0x10)
      v13 = CFSTR("UNKNOWN");
    else
      v13 = off_2511F8338[v12 - 1];
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stateForItemWithIdentifier:", objc_msgSend(v3, "itemIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "state");

    -[SUUIRedeemNativeResultsViewController setCurrentItemStateFlag:](self, "setCurrentItemStateFlag:", -[SUUIRedeemNativeResultsViewController currentItemStateFlag](self, "currentItemStateFlag") | v16);
    v17 = -[SUUIRedeemNativeResultsViewController currentItemStateFlag](self, "currentItemStateFlag");
    if ((v17 & 0x44) != 0)
    {
      -[SUUIRedeemStepViewController clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("REDEEM_SUCCESS_INSTALLED_");
      goto LABEL_14;
    }
    v25 = v17 & 3;
    IsSoftwareKind = SUUIItemKindIsSoftwareKind(objc_msgSend(v3, "itemKind"));
    v27 = IsSoftwareKind;
    if (v25)
    {
      -[SUUIRedeemStepViewController clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        v18 = CFSTR("REDEEM_SUCCESS_INSTALLING_");
      else
        v18 = CFSTR("REDEEM_SUCCESS_DOWNLOADING_");
LABEL_14:
      -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", v19, CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v19, 0, CFSTR("Redeem"));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
    if (IsSoftwareKind)
    {
      IsTVOnly = SUUIItemDeviceFamilyIsTVOnly(objc_msgSend(v3, "deviceFamilies"));
      -[SUUIRedeemStepViewController clientContext](self, "clientContext");
      v36 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v36;
      if (IsTVOnly)
      {
        if (v36)
        {
          v37 = CFSTR("REDEEM_SUCCESS_TV_INSTALL");
LABEL_34:
          objc_msgSend(v7, "localizedStringForKey:inTable:", v37, CFSTR("Redeem"));
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
        v38 = CFSTR("REDEEM_SUCCESS_TV_INSTALL");
      }
      else
      {
        if (v36)
        {
          v37 = CFSTR("REDEEM_SUCCESS_PREPARE_TO_INSTALL");
          goto LABEL_34;
        }
        v38 = CFSTR("REDEEM_SUCCESS_PREPARE_TO_INSTALL");
      }
    }
    else
    {
      -[SUUIRedeemStepViewController clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v37 = CFSTR("REDEEM_SUCCESS_PREPARE_TO_DOWNLOAD");
        goto LABEL_34;
      }
      v38 = CFSTR("REDEEM_SUCCESS_PREPARE_TO_DOWNLOAD");
    }
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v38, 0, CFSTR("Redeem"));
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_msgSend(v4, "credit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SUUIRedeemStepViewController clientContext](self, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "localizedStringForKey:inTable:", CFSTR("REDEEM_SUCCESS_CREDIT_FORMAT"), CFSTR("Redeem"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_SUCCESS_CREDIT_FORMAT"), 0, CFSTR("Redeem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BDD17C8];
    -[SUUIRedeemResultsViewController redeem](self, "redeem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "credit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemResultsViewController redeem](self, "redeem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "balance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@%@"), 0, v22, v24);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  v39 = &stru_2511FF0C8;
  -[SUUIRedeemResultMessageView setMessage:](self->_messageView, "setMessage:", &stru_2511FF0C8);
LABEL_24:
  -[SUUIRedeemResultMessageView frame](self->_messageView, "frame");
  v29 = v28;
  v31 = v30;
  messageView = self->_messageView;
  -[SUUIRedeemNativeResultsViewController _tableWidth](self, "_tableWidth");
  -[SUUIRedeemResultMessageView sizeThatFits:](messageView, "sizeThatFits:");
  -[SUUIRedeemResultMessageView setFrame:](self->_messageView, "setFrame:", v29, v31, v33, v34);

}

- (double)_tableWidth
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  uint64_t v11;

  -[SUUIRedeemNativeResultsViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom")
    || -[SUUIRedeemNativeResultsViewController interfaceOrientation](self, "interfaceOrientation") == 1)
  {

  }
  else
  {
    v11 = objc_msgSend(v3, "verticalSizeClass");

    if (v11 != 2)
    {
      v7 = 414.0;
      goto LABEL_7;
    }
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v7 = 540.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v7 = v9;

  }
LABEL_7:

  return v7;
}

- (void)_reloadSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  double v52;
  double v53;
  void *v54;
  id v55;

  v55 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thankYouDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUUIRedeemNativeResultsViewController _item](self, "_item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SUUIRedeemResultsViewController redeem](self, "redeem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "headerArtworkProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "smallestArtwork");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8 || (objc_msgSend(v8, "size"), v9 < 150.0))
      {
        -[SUUIRedeemNativeResultsViewController _emptySection](self, "_emptySection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "userInterfaceIdiom");

        __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v12, v55, v10);
      }
      -[SUUIRedeemNativeResultsViewController _headerImageViewSection](self, "_headerImageViewSection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userInterfaceIdiom");

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v15, v55, v13);
      -[SUUIRedeemNativeResultsViewController _messageViewSection](self, "_messageViewSection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "userInterfaceIdiom");

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(5.0, v18, v55, v16);
      -[SUUIRedeemNativeResultsViewController _itemViewSection](self, "_itemViewSection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "userInterfaceIdiom");

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v21, v55, v19);
    }
    else
    {
      -[SUUIRedeemNativeResultsViewController _emptySection](self, "_emptySection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "userInterfaceIdiom");

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v30, v55, v28);
      -[SUUIRedeemNativeResultsViewController _resultImageViewSection](self, "_resultImageViewSection");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "userInterfaceIdiom");

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v33, v55, v31);
      -[SUUIRedeemNativeResultsViewController _messageViewSection](self, "_messageViewSection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "userInterfaceIdiom");

      __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(5.0, v35, v55, v8);
    }

    -[SUUIRedeemNativeResultsViewController _extendedMessageViewSection](self, "_extendedMessageViewSection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "userInterfaceIdiom");

    __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(5.0, v38, v55, v36);
    -[SUUIRedeemNativeResultsViewController _linksSection](self, "_linksSection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, (uint64_t)v39, v55, v39);

    -[SUUIRedeemNativeResultsViewController _emptySection](self, "_emptySection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "userInterfaceIdiom");

    __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v42, v55, v40);
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  if ((v23 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    -[SUUIRedeemNativeResultsViewController _emptySection](self, "_emptySection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "userInterfaceIdiom");

    __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v26, v55, v24);
  }
  -[SUUIRedeemNativeResultsViewController _item](self, "_item");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    -[SUUIRedeemNativeResultsViewController _itemViewSection](self, "_itemViewSection");
  else
    -[SUUIRedeemNativeResultsViewController _resultImageViewSection](self, "_resultImageViewSection");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "userInterfaceIdiom");

  __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(0.0, v45, v55, v43);
  -[SUUIRedeemNativeResultsViewController _messageViewSection](self, "_messageViewSection");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "userInterfaceIdiom");

  __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(5.0, v48, v55, v46);
  -[SUUIRedeemNativeResultsViewController _anotherButtonSection](self, "_anotherButtonSection");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(2.0, (uint64_t)v49, v55, v49);

  if (-[SUUIRedeemStepViewController shouldShowPassbookLearnMore](self, "shouldShowPassbookLearnMore"))
  {
    -[SUUIRedeemNativeResultsViewController _passbookLearnMoreSection](self, "_passbookLearnMoreSection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "bounds");
    v52 = 11.0;
    if (v53 > 480.0)
      v52 = 30.0;
    __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(v52, v51, v55, v40);

    goto LABEL_18;
  }
LABEL_19:
  -[SUUIRedeemNativeResultsViewController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setSections:", v55);

}

void __56__SUUIRedeemNativeResultsViewController__reloadSections__block_invoke(double a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  double v8;
  id v9;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "lastObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "contentInsets");
      objc_msgSend(v9, "setContentInsets:");
    }
    objc_msgSend(v6, "contentInsets");
    objc_msgSend(v6, "setContentInsets:", v8 + a1);
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (void)_setItemImage:(id)a3
{
  UIImage **p_itemImage;
  id v6;
  id v7;

  p_itemImage = &self->_itemImage;
  objc_storeStrong((id *)&self->_itemImage, a3);
  v6 = a3;
  -[SUUIRedeemNativeResultsViewController _itemView](self, "_itemView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItemImage:", *p_itemImage);

}

- (void)_setHeaderImage:(id)a3
{
  -[UIImageView setImage:](self->_headerImageView, "setImage:", a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (UIButton)anotherButton
{
  return self->_anotherButton;
}

- (void)setAnotherButton:(id)a3
{
  objc_storeStrong((id *)&self->_anotherButton, a3);
}

- (SUUITextLayout)extendedMessageTextLayout
{
  return self->_extendedMessageTextLayout;
}

- (void)setExtendedMessageTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_extendedMessageTextLayout, a3);
}

- (SUUITextBoxView)extendedMessageView
{
  return self->_extendedMessageView;
}

- (void)setExtendedMessageView:(id)a3
{
  objc_storeStrong((id *)&self->_extendedMessageView, a3);
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (void)setHeaderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_headerImageView, a3);
}

- (UIImage)itemImage
{
  return self->_itemImage;
}

- (void)setItemImage:(id)a3
{
  objc_storeStrong((id *)&self->_itemImage, a3);
}

- (SUUIItemStateCenter)itemStateCenter
{
  return self->_itemStateCenter;
}

- (void)setItemStateCenter:(id)a3
{
  objc_storeStrong((id *)&self->_itemStateCenter, a3);
}

- (SUUIGiftItemView)itemView
{
  return self->_itemView;
}

- (void)setItemView:(id)a3
{
  objc_storeStrong((id *)&self->_itemView, a3);
}

- (SUUIRedeemResultMessageView)messageView
{
  return self->_messageView;
}

- (void)setMessageView:(id)a3
{
  objc_storeStrong((id *)&self->_messageView, a3);
}

- (SUUIRedeemITunesPassLockup)passbookLockup
{
  return self->_passbookLockup;
}

- (void)setPassbookLockup:(id)a3
{
  objc_storeStrong((id *)&self->_passbookLockup, a3);
}

- (unint64_t)currentItemStateFlag
{
  return self->_currentItemStateFlag;
}

- (void)setCurrentItemStateFlag:(unint64_t)a3
{
  self->_currentItemStateFlag = a3;
}

- (BOOL)extendedMessageIsExpanded
{
  return self->_extendedMessageIsExpanded;
}

- (void)setExtendedMessageIsExpanded:(BOOL)a3
{
  self->_extendedMessageIsExpanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passbookLockup, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_itemStateCenter, 0);
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_extendedMessageView, 0);
  objc_storeStrong((id *)&self->_extendedMessageTextLayout, 0);
  objc_storeStrong((id *)&self->_anotherButton, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
