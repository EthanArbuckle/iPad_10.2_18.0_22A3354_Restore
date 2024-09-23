@implementation SUUIProductPageHeaderViewController

- (SUUIProductPageHeaderViewController)initWithItem:(id)a3
{
  id v5;
  SUUIProductPageHeaderViewController *v6;
  SUUIProductPageHeaderViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIProductPageHeaderViewController;
  v6 = -[SUUIProductPageHeaderViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    v7->_itemIdentifier = -[SUUIItem itemIdentifier](v7->_item, "itemIdentifier");
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);
  -[UIPopoverController setDelegate:](self->_activityPopoverController, "setDelegate:", 0);
  -[UIPopoverController dismissPopoverAnimated:](self->_activityPopoverController, "dismissPopoverAnimated:", 0);
  -[SUUIProductPageHeaderView itemOfferButton](self->_headerView, "itemOfferButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIProductPageHeaderView shareButton](self->_headerView, "shareButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIProductPageHeaderFloatingView sectionControl](self->_floatingView, "sectionControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  v7.receiver = self;
  v7.super_class = (Class)SUUIProductPageHeaderViewController;
  -[SUUIProductPageHeaderViewController dealloc](&v7, sel_dealloc);
}

- (SUUIProductPageHeaderFloatingView)floatingView
{
  SUUIProductPageHeaderFloatingView *floatingView;
  void *v4;
  SUUIProductPageHeaderFloatingView *v5;
  SUUIProductPageHeaderFloatingView *v6;
  SUUIProductPageHeaderFloatingView *v7;
  void *v8;
  void *v9;
  void *v10;

  floatingView = self->_floatingView;
  if (!floatingView)
  {
    -[SUUIProductPageHeaderViewController _segmentedControlTitles](self, "_segmentedControlTitles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SUUIProductPageHeaderFloatingView initWithSectionTitles:isPad:]([SUUIProductPageHeaderFloatingView alloc], "initWithSectionTitles:isPad:", v4, SUUIUserInterfaceIdiom(self->_clientContext) == 1);
    v6 = self->_floatingView;
    self->_floatingView = v5;

    v7 = self->_floatingView;
    -[SUUIProductPage uber](self->_productPage, "uber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorScheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderFloatingView setColorScheme:](v7, "setColorScheme:", v9);

    -[SUUIProductPageHeaderFloatingView sectionControl](self->_floatingView, "sectionControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__sectionControlAction_, 4096);

    -[SUUIProductPageHeaderFloatingView sizeToFit](self->_floatingView, "sizeToFit");
    floatingView = self->_floatingView;
  }
  return floatingView;
}

- (UIImage)iconImage
{
  UIImage *iconImage;
  void *v5;
  void *v6;
  UIImage *placeholderImage;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIImage *v22;
  UIImage *v23;
  void *v24;
  UIImage *v25;
  UIImage *v26;
  UIImage *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  iconImage = self->_iconImage;
  if (iconImage)
    return iconImage;
  -[SUUIProductPageHeaderViewController _activeItem](self, "_activeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  placeholderImage = self->_placeholderImage;
  if (!placeholderImage)
  {
    objc_msgSend(v5, "artworksProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUIArtworkProvidingFactory artworkCacheCandidatesForProvider:](SUUIArtworkProvidingFactory, "artworkCacheCandidatesForProvider:");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      v28 = v6;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v14 = objc_alloc(MEMORY[0x24BEB2040]);
          objc_msgSend(v13, "URL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithURL:", v15);
          objc_msgSend(v16, "cachedURLResponse");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            -[SUUIProductPageHeaderViewController _artworkContext](self, "_artworkContext");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v28;
            objc_msgSend(v18, "dataConsumerForItem:", v28);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "data");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "response");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForData:response:error:", v20, v21, 0);
            v22 = (UIImage *)objc_claimAutoreleasedReturnValue();
            v23 = self->_placeholderImage;
            self->_placeholderImage = v22;

            goto LABEL_14;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        v6 = v28;
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

    placeholderImage = self->_placeholderImage;
    if (!placeholderImage)
    {
      -[SUUIProductPageHeaderViewController _artworkContext](self, "_artworkContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "placeholderImageForItem:", v6);
      v25 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v26 = self->_placeholderImage;
      self->_placeholderImage = v25;

      placeholderImage = self->_placeholderImage;
    }
  }
  v27 = placeholderImage;

  return v27;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  SUUIPersonalizeOfferOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  SSVLoadURLOperation *v20;
  SSVLoadURLOperation *loadIconOperation;
  SSVLoadURLOperation *v22;
  void *v23;
  SSVLoadURLOperation *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;

  -[SUUIProductPageHeaderViewController _activeItem](self, "_activeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_personalizationState)
  {
    if (objc_msgSend(v3, "itemKind") == 17)
    {
      v5 = -[SUUIPersonalizeOfferOperation initWithItemIdentifier:clientContext:]([SUUIPersonalizeOfferOperation alloc], "initWithItemIdentifier:clientContext:", self->_itemIdentifier, self->_clientContext);
      objc_initWeak(&location, self);
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __49__SUUIProductPageHeaderViewController_reloadData__block_invoke;
      v28[3] = &unk_2511F6DD8;
      objc_copyWeak(&v29, &location);
      -[SUUIPersonalizeOfferOperation setOutputBlock:](v5, "setOutputBlock:", v28);
      self->_personalizationState = 1;
      -[SUUIProductPageHeaderViewController operationQueue](self, "operationQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addOperation:", v5);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);

    }
    else
    {
      self->_personalizationState = 2;
    }
  }
  if (!self->_iconImage && !self->_loadIconOperation)
  {
    -[SUUIProductPageHeaderViewController _artworkContext](self, "_artworkContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPage item](self->_productPage, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "URLForItem:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(v7, "imageSizeForItem:", self->_item);
      v11 = v10;
      v13 = v12;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scale");
      v16 = v15;

      objc_msgSend(v7, "artworkForItem:", self->_item);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (double)objc_msgSend(v17, "width");
      v19 = v11 * v16;
      if (v11 * v16 <= v18 || (v18 = (double)objc_msgSend(v17, "height", v18, v19), v19 = v13 * v16, v13 * v16 <= v18))
      {
        objc_msgSend(v17, "URL", v18, v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }

      if (!v9)
        goto LABEL_16;
    }
    v20 = (SSVLoadURLOperation *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", v9);
    loadIconOperation = self->_loadIconOperation;
    self->_loadIconOperation = v20;

    v22 = self->_loadIconOperation;
    objc_msgSend(v7, "dataConsumerForItem:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setDataConsumer:](v22, "setDataConsumer:", v23);

    -[SSVLoadURLOperation setQueuePriority:](self->_loadIconOperation, "setQueuePriority:", 4);
    objc_initWeak(&location, self);
    v24 = self->_loadIconOperation;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_3;
    v26[3] = &unk_2511F4A00;
    objc_copyWeak(&v27, &location);
    -[SSVLoadURLOperation setOutputBlock:](v24, "setOutputBlock:", v26);
    -[SUUIProductPageHeaderViewController operationQueue](self, "operationQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addOperation:", self->_loadIconOperation);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
LABEL_16:

  }
  -[SUUIProductPageHeaderViewController _loadUberImageIfAvailable](self, "_loadUberImageIfAvailable");

}

void __49__SUUIProductPageHeaderViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_2;
  v5[3] = &unk_2511F6220;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setPersonalizedOffer:", *(_QWORD *)(a1 + 32));

}

void __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_4;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __49__SUUIProductPageHeaderViewController_reloadData__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setArtworkWithImage:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (int64_t)selectedSectionIndex
{
  return -[SUUIProductPageHeaderFloatingView selectedSectionIndex](self->_floatingView, "selectedSectionIndex");
}

- (void)setAskPermission:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_askPermission != a3)
  {
    self->_askPermission = a3;
    -[SUUIProductPageHeaderViewController _reloadItemStateAnimated:](self, "_reloadItemStateAnimated:", 0);
    -[SUUIProductPageHeaderView artistButton](self->_headerView, "artistButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", !self->_askPermission);

    -[SUUIProductPageHeaderView shareButton](self->_headerView, "shareButton");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", self->_askPermission);

  }
}

- (void)setProductPage:(id)a3
{
  SUUIProductPage *v5;
  SUUIProductPage **p_productPage;
  void *v7;
  void *v8;
  void *v9;
  SUUIItemArtworkContext *artworkContext;
  void *v11;
  SUUIProductPageHeaderFloatingView *floatingView;
  void *v13;
  SUUIProductPageHeaderView *headerView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SUUIProductPageHeaderView *v19;
  void *v20;
  SUUIProductPageHeaderView *v21;
  void *v22;
  SUUIProductPageHeaderView *v23;
  SUUIClientContext *clientContext;
  void *v25;
  SUUIProductPageHeaderView *v26;
  float v27;
  void *v28;
  SUUIContentRatingArtworkResourceLoader *contentRatingArtworkLoader;
  SUUIContentRatingArtworkResourceLoader *v30;
  SUUIContentRatingArtworkResourceLoader *v31;
  SUUIProductPageHeaderView *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  SUUIProductPageHeaderView *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  SUUIProductPage *v47;

  v5 = (SUUIProductPage *)a3;
  p_productPage = &self->_productPage;
  if (self->_productPage != v5)
  {
    v47 = v5;
    objc_storeStrong((id *)&self->_productPage, a3);
    -[SUUIProductPage item](*p_productPage, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && self->_wantsActivityViewController)
    {
      -[SUUIProductPageHeaderView shareButton](self->_headerView, "shareButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageHeaderViewController _showActivityViewControllerFromView:](self, "_showActivityViewControllerFromView:", v8);

    }
    -[SUUIProductPage uber](*p_productPage, "uber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    artworkContext = self->_artworkContext;
    objc_msgSend(v9, "colorScheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setColorScheme:](artworkContext, "setColorScheme:", v11);

    floatingView = self->_floatingView;
    objc_msgSend(v9, "colorScheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderFloatingView setColorScheme:](floatingView, "setColorScheme:", v13);

    headerView = self->_headerView;
    -[SUUIProductPage uber](*p_productPage, "uber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorScheme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "backgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[SUUIProductPageHeaderView setBackgroundColor:](headerView, "setBackgroundColor:", v17);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageHeaderView setBackgroundColor:](headerView, "setBackgroundColor:", v18);

    }
    v19 = self->_headerView;
    objc_msgSend(v9, "colorScheme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderView setColorScheme:](v19, "setColorScheme:", v20);

    v21 = self->_headerView;
    objc_msgSend(v7, "contentRating");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderView setContentRating:](v21, "setContentRating:", v22);

    v23 = self->_headerView;
    if (objc_msgSend(v7, "hasInAppPurchases"))
    {
      clientContext = self->_clientContext;
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_HEADER"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_HEADER"), 0, CFSTR("ProductPage"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageHeaderView setInAppPurchasesString:](v23, "setInAppPurchasesString:", v25);

    }
    else
    {
      -[SUUIProductPageHeaderView setInAppPurchasesString:](v23, "setInAppPurchasesString:", 0);
    }
    -[SUUIProductPageHeaderView setNumberOfUserRatings:](self->_headerView, "setNumberOfUserRatings:", objc_msgSend(v7, "numberOfUserRatings"));
    v26 = self->_headerView;
    objc_msgSend(v7, "userRating");
    -[SUUIProductPageHeaderView setUserRating:](v26, "setUserRating:", (float)(v27 / 5.0));
    objc_msgSend(v7, "secondaryContentRatings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
    {
      contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
      if (!contentRatingArtworkLoader)
      {
        -[SUUIProductPageHeaderViewController _contentRatingResourceLoader](self, "_contentRatingResourceLoader");
        v30 = (SUUIContentRatingArtworkResourceLoader *)objc_claimAutoreleasedReturnValue();
        v31 = self->_contentRatingArtworkLoader;
        self->_contentRatingArtworkLoader = v30;

        contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
      }
      -[SUUIProductPageHeaderView setContentRatingArtworkLoader:](self->_headerView, "setContentRatingArtworkLoader:", contentRatingArtworkLoader);
      v32 = self->_headerView;
      objc_msgSend(v28, "lastObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageHeaderView setSecondaryContentRating:](v32, "setSecondaryContentRating:", v33);

    }
    objc_msgSend(v9, "artworkProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
      v35 = 630.0;
    else
      v35 = 320.0;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "scale");
    objc_msgSend(v34, "artworkWithWidth:", vcvtmd_s64_f64(v35 * v37));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = self->_headerView;
      objc_msgSend(v38, "size");
      v41 = v40;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "scale");
      v44 = v41 / v43;
      v45 = SUUIUserInterfaceIdiom(self->_clientContext);
      v46 = -60.0;
      if (v45 != 1)
        v46 = -30.0;
      -[SUUIProductPageHeaderView setHeaderImageHeight:](v39, "setHeaderImageHeight:", v44 + v46);

      -[SUUIProductPageHeaderView setHeaderImage:](self->_headerView, "setHeaderImage:", self->_uberImage);
      -[SUUIProductPageHeaderView sizeToFit](self->_headerView, "sizeToFit");
    }
    if (self->_performArtistActionOnLoad && SUUIViewControllerIsVisible(self))
    {
      -[SUUIProductPageHeaderViewController _artistButtonAction:](self, "_artistButtonAction:", 0);
      self->_performArtistActionOnLoad = 0;
    }
    -[SUUIProductPageHeaderViewController _loadUberImageIfAvailable](self, "_loadUberImageIfAvailable");
    -[SUUIProductPageHeaderViewController _reloadItemStateAnimated:](self, "_reloadItemStateAnimated:", 0);

    v5 = v47;
  }

}

- (void)setSelectedSectionIndex:(int64_t)a3
{
  id v4;

  -[SUUIProductPageHeaderViewController floatingView](self, "floatingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedSectionIndex:", a3);

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  void *v4;
  UIPopoverController *activityPopoverController;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SUUIProductPageHeaderViewController;
  -[SUUIProductPageHeaderViewController didRotateFromInterfaceOrientation:](&v15, sel_didRotateFromInterfaceOrientation_, a3);
  if (-[UIPopoverController isPopoverVisible](self->_activityPopoverController, "isPopoverVisible"))
  {
    -[SUUIProductPageHeaderView shareButton](self->_headerView, "shareButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    activityPopoverController = self->_activityPopoverController;
    objc_msgSend(v4, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v4, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](activityPopoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v14, 15, 1, v7, v9, v11, v13);

  }
}

- (void)loadView
{
  SUUIProductPageHeaderView *headerView;
  void *v4;
  void *v5;
  SUUIProductPageHeaderView *v6;
  SUUIProductPageHeaderView *v7;
  SUUIProductPageHeaderView *v8;
  void *v9;
  SUUIProductPageHeaderView *v10;
  void *v11;
  SUUIProductPageHeaderView *v12;
  void *v13;
  SUUIProductPageHeaderView *v14;
  void *v15;
  SUUIProductPageHeaderView *v16;
  void *v17;
  SUUIProductPageHeaderView *v18;
  void *v19;
  SUUIProductPageHeaderView *v20;
  void *v21;
  SUUIProductPageHeaderView *v22;
  SUUIClientContext *clientContext;
  void *v24;
  SUUIProductPageHeaderView *v25;
  float v26;
  void *v27;
  SUUIContentRatingArtworkResourceLoader *contentRatingArtworkLoader;
  SUUIContentRatingArtworkResourceLoader *v29;
  SUUIContentRatingArtworkResourceLoader *v30;
  SUUIProductPageHeaderView *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  SUUIProductPageHeaderView *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  SUUIProductPageHeaderView *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;

  -[SUUIProductPage uber](self->_productPage, "uber");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  headerView = self->_headerView;
  if (!headerView)
  {
    -[SUUIProductPageHeaderViewController _activeItem](self, "_activeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPage item](self->_productPage, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIProductPageHeaderView initWithClientContext:]([SUUIProductPageHeaderView alloc], "initWithClientContext:", self->_clientContext);
    v7 = self->_headerView;
    self->_headerView = v6;

    v8 = self->_headerView;
    objc_msgSend(v56, "colorScheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderView setColorScheme:](v8, "setColorScheme:", v9);

    v10 = self->_headerView;
    objc_msgSend(v4, "artistName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderView setArtistName:](v10, "setArtistName:", v11);

    v12 = self->_headerView;
    -[SUUIProductPageHeaderViewController _ageBandString](self, "_ageBandString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderView setAgeBandString:](v12, "setAgeBandString:", v13);

    v14 = self->_headerView;
    -[SUUIProductPageHeaderViewController iconImage](self, "iconImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderView setIconImage:](v14, "setIconImage:", v15);

    v16 = self->_headerView;
    objc_msgSend(v4, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderView setTitle:](v16, "setTitle:", v17);

    v18 = self->_headerView;
    objc_msgSend(v4, "editorialBadge");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderView setEditorialBadge:](v18, "setEditorialBadge:", v19);

    v20 = self->_headerView;
    objc_msgSend(v5, "contentRating");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderView setContentRating:](v20, "setContentRating:", v21);

    v22 = self->_headerView;
    if (objc_msgSend(v5, "hasInAppPurchases"))
    {
      clientContext = self->_clientContext;
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_HEADER"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_HEADER"), 0, CFSTR("ProductPage"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageHeaderView setInAppPurchasesString:](v22, "setInAppPurchasesString:", v24);

    }
    else
    {
      -[SUUIProductPageHeaderView setInAppPurchasesString:](v22, "setInAppPurchasesString:", 0);
    }
    v25 = self->_headerView;
    objc_msgSend(v4, "userRating");
    -[SUUIProductPageHeaderView setUserRating:](v25, "setUserRating:", (float)(v26 / 5.0));
    -[SUUIProductPageHeaderView setNumberOfUserRatings:](self->_headerView, "setNumberOfUserRatings:", objc_msgSend(v4, "numberOfUserRatings"));
    objc_msgSend(v5, "secondaryContentRatings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "count"))
    {
      contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
      if (!contentRatingArtworkLoader)
      {
        -[SUUIProductPageHeaderViewController _contentRatingResourceLoader](self, "_contentRatingResourceLoader");
        v29 = (SUUIContentRatingArtworkResourceLoader *)objc_claimAutoreleasedReturnValue();
        v30 = self->_contentRatingArtworkLoader;
        self->_contentRatingArtworkLoader = v29;

        contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
      }
      -[SUUIProductPageHeaderView setContentRatingArtworkLoader:](self->_headerView, "setContentRatingArtworkLoader:", contentRatingArtworkLoader);
      v31 = self->_headerView;
      objc_msgSend(v27, "lastObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageHeaderView setSecondaryContentRating:](v31, "setSecondaryContentRating:", v32);

    }
    objc_msgSend(v56, "artworkProvider");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
      v34 = 630.0;
    else
      v34 = 320.0;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "scale");
    objc_msgSend(v33, "artworkWithWidth:", vcvtmd_s64_f64(v34 * v36));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = self->_headerView;
      objc_msgSend(v37, "size");
      v40 = v39;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "scale");
      v43 = v40 / v42;
      v44 = SUUIUserInterfaceIdiom(self->_clientContext);
      v45 = -60.0;
      if (v44 != 1)
        v45 = -30.0;
      -[SUUIProductPageHeaderView setHeaderImageHeight:](v38, "setHeaderImageHeight:", v43 + v45);

      -[SUUIProductPageHeaderView setHeaderImage:](self->_headerView, "setHeaderImage:", self->_uberImage);
    }
    -[SUUIProductPageHeaderView setRestricted:](self->_headerView, "setRestricted:", -[SUUIProductPageHeaderViewController _isRestricted](self, "_isRestricted"));
    -[SUUIProductPageHeaderViewController _reloadItemStateAnimated:](self, "_reloadItemStateAnimated:", 0);
    -[SUUIProductPageHeaderView itemOfferButton](self->_headerView, "itemOfferButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setUniversal:", SUUIItemDeviceFamilyIsUniversal(objc_msgSend(v4, "deviceFamilies")));

    -[SUUIProductPageHeaderView sizeToFit](self->_headerView, "sizeToFit");
    -[SUUIProductPageHeaderView shareButton](self->_headerView, "shareButton");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addTarget:action:forControlEvents:", self, sel__shareButtonAction_, 64);

    -[SUUIProductPageHeaderView shareButton](self->_headerView, "shareButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setHidden:", self->_askPermission);

    -[SUUIProductPageHeaderView artistButton](self->_headerView, "artistButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addTarget:action:forControlEvents:", self, sel__artistButtonAction_, 64);

    -[SUUIProductPageHeaderView artistButton](self->_headerView, "artistButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setEnabled:", !self->_askPermission);

    headerView = self->_headerView;
  }
  -[SUUIProductPageHeaderViewController setView:](self, "setView:", headerView);
  v51 = self->_headerView;
  -[SUUIProductPage uber](self->_productPage, "uber");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "colorScheme");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "backgroundColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    -[SUUIProductPageHeaderView setBackgroundColor:](v51, "setBackgroundColor:", v54);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderView setBackgroundColor:](v51, "setBackgroundColor:", v55);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUUIProductPageHeaderViewController reloadData](self, "reloadData");
  v5.receiver = self;
  v5.super_class = (Class)SUUIProductPageHeaderViewController;
  -[SUUIProductPageHeaderViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUUIProductPageHeaderViewController _destroyPopoverController](self, "_destroyPopoverController");
  v5.receiver = self;
  v5.super_class = (Class)SUUIProductPageHeaderViewController;
  -[SUUIProductPageHeaderViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)_artistButtonAction:(id)a3
{
  SUUIProductPage *productPage;
  void *v5;
  void *v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  productPage = self->_productPage;
  if (productPage)
  {
    -[SUUIProductPage item](productPage, "item", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artistPageURL");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v10;
    if (v10)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = objc_opt_respondsToSelector();

      v6 = v10;
      if ((v8 & 1) != 0)
      {
        v9 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v9, "productPageHeaderView:didSelectURL:", self, v10);

        v6 = v10;
      }
    }

  }
  else
  {
    self->_performArtistActionOnLoad = 1;
  }
}

- (void)_itemOfferButtonAction:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SUUIItemOffer *personalizedOffer;
  SUUIItemOffer *v12;
  SUUIItemOffer *v13;
  void *v14;
  _BOOL4 v15;
  SUUIClientContext *v16;
  id *v17;
  uint64_t v18;
  void *v19;
  SUUIClientContext *clientContext;
  id *v21;
  uint64_t v22;
  void *v23;
  SUUIClientContext *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "metricsControllerForProductPageHeader:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[SUUIProductPageHeaderViewController _activeItem](self, "_activeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  personalizedOffer = self->_personalizedOffer;
  if (personalizedOffer)
  {
    v12 = personalizedOffer;
  }
  else
  {
    objc_msgSend(v9, "primaryItemOffer");
    v12 = (SUUIItemOffer *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  objc_initWeak(&location, self);
  if (!v8)
  {
    if (SUUIItemStateCenterUseAppstoredPurchases(v10))
    {
      +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      clientContext = self->_clientContext;
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke;
      v31[3] = &unk_2511F6E00;
      v21 = &v32;
      objc_copyWeak(&v32, &location);
      objc_msgSend(v19, "performActionForSoftwareItem:offer:clientContext:completionBlock:", v10, v13, clientContext, v31);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = self->_clientContext;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_3;
      v29[3] = &unk_2511F6E28;
      v21 = &v30;
      objc_copyWeak(&v30, &location);
      objc_msgSend(v19, "performActionForItem:offer:clientContext:completionBlock:", v10, v13, v24, v29);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v22;

    objc_destroyWeak(v21);
    if (!v23)
      goto LABEL_20;
LABEL_19:
    -[SUUIProductPageHeaderViewController _setItemState:animated:](self, "_setItemState:animated:", v23, 1);
    goto LABEL_20;
  }
  objc_msgSend(v8, "itemOfferClickEventWithItem:locationPosition:", v10, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v8, "recordEvent:", v14);
  v15 = SUUIItemStateCenterUseAppstoredPurchases(v10);
  v16 = self->_clientContext;
  if (v15)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_5;
    v27[3] = &unk_2511F6E00;
    v17 = &v28;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v8, "performActionForSoftwareItem:offer:clientContext:completionBlock:", v10, v13, v16, v27);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_7;
    v25[3] = &unk_2511F6E28;
    v17 = &v26;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v8, "performActionForItem:offer:clientContext:completionBlock:", v10, v13, v16, v25);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v18;
  objc_destroyWeak(v17);

  if (v23)
    goto LABEL_19;
LABEL_20:
  objc_destroyWeak(&location);

}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_2;
  v5[3] = &unk_2511F6980;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v7);

}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_2(uint64_t a1)
{
  void *WeakRetained;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(WeakRetained, "isEqualToString:", *MEMORY[0x24BEB24A0]))
    goto LABEL_4;
  v3 = objc_msgSend(v4, "code");

  if (v3 == 134)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_showAskPermissionBanner");
LABEL_4:

  }
}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_4;
  v5[3] = &unk_2511F6980;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v7);

}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_4(uint64_t a1)
{
  void *WeakRetained;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(WeakRetained, "isEqualToString:", *MEMORY[0x24BEB24A0]))
    goto LABEL_4;
  v3 = objc_msgSend(v4, "code");

  if (v3 == 134)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_showAskPermissionBanner");
LABEL_4:

  }
}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_6;
  v5[3] = &unk_2511F6980;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v7);

}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_6(uint64_t a1)
{
  void *WeakRetained;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(WeakRetained, "isEqualToString:", *MEMORY[0x24BEB24A0]))
    goto LABEL_4;
  v3 = objc_msgSend(v4, "code");

  if (v3 == 134)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_showAskPermissionBanner");
LABEL_4:

  }
}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_8;
  v5[3] = &unk_2511F6980;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v7);

}

void __62__SUUIProductPageHeaderViewController__itemOfferButtonAction___block_invoke_8(uint64_t a1)
{
  void *WeakRetained;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(WeakRetained, "isEqualToString:", *MEMORY[0x24BEB24A0]))
    goto LABEL_4;
  v3 = objc_msgSend(v4, "code");

  if (v3 == 134)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_showAskPermissionBanner");
LABEL_4:

  }
}

- (void)_sectionControlAction:(id)a3
{
  int64_t v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = -[SUUIProductPageHeaderFloatingView selectedSectionIndex](self->_floatingView, "selectedSectionIndex", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "metricsControllerForProductPageHeader:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "canRecordEventWithType:", *MEMORY[0x24BEB2910]))
    {
      v9 = objc_alloc_init(MEMORY[0x24BEB1EC8]);
      -[SUUIProductPageHeaderViewController _segmentedControlTitles](self, "_segmentedControlTitles");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setActionDetails:", v11);

      objc_msgSend(v9, "setActionType:", *MEMORY[0x24BEB28F8]);
      v12 = *MEMORY[0x24BEB2980];
      objc_msgSend(v9, "setTargetType:", *MEMORY[0x24BEB2980]);
      objc_msgSend(v8, "locationWithPosition:type:fieldData:", 0, CFSTR("tabBar"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "locationWithPosition:type:fieldData:", v4, v12, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      v19[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLocationWithEventLocations:", v15);

      objc_msgSend(v8, "recordEvent:", v9);
    }

  }
  v16 = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v18, "productPageHeaderView:didSelectSectionIndex:", self, v4);

  }
}

- (void)_shareButtonAction:(id)a3
{
  if (self->_productPage)
    -[SUUIProductPageHeaderViewController _showActivityViewControllerFromView:](self, "_showActivityViewControllerFromView:", a3);
  else
    self->_wantsActivityViewController = 1;
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
  v7[2] = __73__SUUIProductPageHeaderViewController_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __73__SUUIProductPageHeaderViewController_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "childItemIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "itemIdentifier", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040);
        if (v10 == objc_msgSend(v9, "longLongValue") || objc_msgSend(v3, "containsObject:", v9))
        {
          objc_msgSend(*(id *)(a1 + 32), "_reloadItemStateAnimated:", 1);
          objc_msgSend(*(id *)(a1 + 32), "_sendDidReloadOffer");

          goto LABEL_12;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__SUUIProductPageHeaderViewController_itemStateCenterRestrictionsChanged___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __74__SUUIProductPageHeaderViewController_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setRestricted:", objc_msgSend(*(id *)(a1 + 32), "_isRestricted"));
}

- (id)_activeItem
{
  void *item;
  void *v4;
  id v5;

  -[SUUIProductPage item](self->_productPage, "item");
  item = (void *)objc_claimAutoreleasedReturnValue();
  v4 = item;
  if (!item)
    item = self->_item;
  v5 = item;

  return v5;
}

- (id)_ageBandString
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SUUIClientContext *clientContext;
  void *v13;
  void *v14;
  uint64_t v16;

  -[SUUIProductPageHeaderViewController _activeItem](self, "_activeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ageBandRange");
  v6 = v5;

  if (v4 == 0x7FFFFFFFFFFFFFFFLL || SUUIUserInterfaceIdiom(self->_clientContext) != 1)
  {
    v13 = 0;
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v7, "setNumberStyle:", 1);
    objc_msgSend(v7, "setUsesGroupingSeparator:", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromNumber:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4 + v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromNumber:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    clientContext = self->_clientContext;
    if (v4)
    {
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_HEADER_AGE_BAND"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_HEADER_AGE_BAND"), 0, CFSTR("ProductPage"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@%@"), 0, v9, v11);
    }
    else
    {
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_HEADER_AGE_MAX"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_HEADER_AGE_MAX"), 0, CFSTR("ProductPage"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), 0, v11, v16);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)_artworkContext
{
  SUUIItemArtworkContext *artworkContext;
  SUUIItemArtworkContext *v4;
  SUUIItemArtworkContext *v5;
  SUUIItemArtworkContext *v6;
  double v7;
  void *v8;
  SUUIItemArtworkContext *v9;
  double v10;
  void *v11;
  SUUIItemArtworkContext *v12;
  double v13;
  void *v14;
  SUUIItemArtworkContext *v15;
  void *v16;
  void *v17;

  artworkContext = self->_artworkContext;
  if (!artworkContext)
  {
    v4 = objc_alloc_init(SUUIItemArtworkContext);
    v5 = self->_artworkContext;
    self->_artworkContext = v4;

    v6 = self->_artworkContext;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
      v7 = 170.0;
    else
      v7 = 100.0;
    +[SUUIStyledImageDataConsumer appIconConsumerWithSize:](SUUIStyledImageDataConsumer, "appIconConsumerWithSize:", v7, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setIconConsumer:](v6, "setIconConsumer:", v8);

    v9 = self->_artworkContext;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
      v10 = 170.0;
    else
      v10 = 100.0;
    +[SUUIStyledImageDataConsumer productImageConsumerWithSize:](SUUIStyledImageDataConsumer, "productImageConsumerWithSize:", v10, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setNewsstandConsumer:](v9, "setNewsstandConsumer:", v11);

    v12 = self->_artworkContext;
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
      v13 = 170.0;
    else
      v13 = 100.0;
    +[SUUIProductImageDataConsumer consumerWithSize:](SUUIProductImageDataConsumer, "consumerWithSize:", v13, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setGeneralConsumer:](v12, "setGeneralConsumer:", v14);

    v15 = self->_artworkContext;
    -[SUUIProductPage uber](self->_productPage, "uber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "colorScheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemArtworkContext setColorScheme:](v15, "setColorScheme:", v17);

    artworkContext = self->_artworkContext;
  }
  return artworkContext;
}

- (void)_destroyPopoverController
{
  UIPopoverController *activityPopoverController;

  -[UIPopoverController setDelegate:](self->_activityPopoverController, "setDelegate:", 0);
  -[UIPopoverController dismissPopoverAnimated:](self->_activityPopoverController, "dismissPopoverAnimated:", 1);
  activityPopoverController = self->_activityPopoverController;
  self->_activityPopoverController = 0;

}

- (id)_contentRatingResourceLoader
{
  SUUIResourceLoader *v3;
  void *v4;
  SUUIResourceLoader *v5;
  SUUIContentRatingArtworkResourceLoader *v6;
  void *v7;

  v3 = [SUUIResourceLoader alloc];
  -[SUUIProductPageHeaderViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUUIResourceLoader initWithClientContext:](v3, "initWithClientContext:", v4);

  v6 = -[SUUIContentRatingArtworkResourceLoader initWithArtworkLoader:]([SUUIContentRatingArtworkResourceLoader alloc], "initWithArtworkLoader:", v5);
  +[SUUIStyledImageDataConsumer appIconConsumerWithSize:](SUUIStyledImageDataConsumer, "appIconConsumerWithSize:", 11.0, 11.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIContentRatingArtworkResourceLoader setImageDataConsumer:](v6, "setImageDataConsumer:", v7);

  return v6;
}

- (void)_disableItemOfferButtonWithTitle:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SUUIItemOffer *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[SUUIItemOffer initWithButtonText:]([SUUIItemOffer alloc], "initWithButtonText:", v6);

  -[SUUIProductPageHeaderView setItemOffer:](self->_headerView, "setItemOffer:", v7);
  -[SUUIProductPageHeaderViewController _setItemState:animated:](self, "_setItemState:animated:", 0, v4);

}

- (BOOL)_isRestricted
{
  void *v2;
  void *v3;
  char v4;

  -[SUUIProductPageHeaderViewController _activeItem](self, "_activeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v2, "parentalControlsRank"));

  return v4;
}

- (void)_loadUberImageIfAvailable
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  SSVLoadURLOperation *v10;
  SSVLoadURLOperation *loadUberOperation;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SSVLoadURLOperation *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id location;

  if (!self->_uberImage && !self->_loadUberOperation)
  {
    -[SUUIProductPage uber](self->_productPage, "uber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "artworkProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
      v5 = 630.0;
    else
      v5 = 320.0;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    objc_msgSend(v4, "artworkWithWidth:", vcvtmd_s64_f64(v5 * v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (SSVLoadURLOperation *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", v9);
      loadUberOperation = self->_loadUberOperation;
      self->_loadUberOperation = v10;

      -[SSVLoadURLOperation setQueuePriority:](self->_loadUberOperation, "setQueuePriority:", 4);
      +[SSVURLDataConsumer consumer](SUUIUberImageDataConsumer, "consumer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPage uber](self->_productPage, "uber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[SUUIProductPage uber](self->_productPage, "uber");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "colorScheme");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "backgroundColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v12, "setBackgroundColor:", v16);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setBackgroundColor:", v17);

        }
      }
      else
      {
        objc_msgSend(v12, "setBackgroundColor:", 0);
      }

      -[SSVLoadURLOperation setDataConsumer:](self->_loadUberOperation, "setDataConsumer:", v12);
      objc_initWeak(&location, self);
      v18 = self->_loadUberOperation;
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __64__SUUIProductPageHeaderViewController__loadUberImageIfAvailable__block_invoke;
      v23 = &unk_2511F4A00;
      objc_copyWeak(&v24, &location);
      -[SSVLoadURLOperation setOutputBlock:](v18, "setOutputBlock:", &v20);
      -[SUUIProductPageHeaderViewController operationQueue](self, "operationQueue", v20, v21, v22, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addOperation:", self->_loadUberOperation);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);

    }
  }
}

void __64__SUUIProductPageHeaderViewController__loadUberImageIfAvailable__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SUUIProductPageHeaderViewController__loadUberImageIfAvailable__block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __64__SUUIProductPageHeaderViewController__loadUberImageIfAvailable__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setUberWithImage:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_reloadItemStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  SUUIProductPageHeaderViewController *v4;
  SUUIItem *v5;
  SUUIItem *item;
  SUUIItem *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  unint64_t v20;
  SUUIProductPageHeaderView *v21;
  void *v22;
  SUUIProductPageHeaderViewController *v23;
  void *v24;
  void *v25;
  SUUIProductPageHeaderView *headerView;
  void *v27;
  SUUIClientContext *clientContext;
  SUUIProductPageHeaderViewController *v29;
  uint64_t v30;
  SUUIClientContext *v31;
  void *v32;
  _BOOL8 v33;
  SUUIProductPageHeaderViewController *v34;
  void *v35;
  SUUIClientContext *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SUUIProductPageHeaderView *v42;
  SUUIClientContext *v43;
  void *v44;
  void *v45;
  SUUIClientContext *v46;
  _BOOL8 v47;
  void *v48;
  uint64_t v49;
  _BOOL4 v50;
  SUUIItem *v51;
  void *v52;
  SUUIItem *v53;
  SUUIProductPageHeaderView *v54;
  SUUIProductPageHeaderView *v55;
  SUUIProductPageHeaderView *v56;
  SUUIProductPageHeaderViewController *v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v3 = a3;
  v4 = self;
  v64 = *MEMORY[0x24BDAC8D0];
  -[SUUIProductPage item](self->_productPage, "item");
  v5 = (SUUIItem *)objc_claimAutoreleasedReturnValue();
  item = v5;
  if (!v5)
    item = v4->_item;
  v7 = item;
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stateForItemWithIdentifier:", -[SUUIItem itemIdentifier](v7, "itemIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUUIItem itemKind](v7, "itemKind") == 17)
  {
    if (v5 && v4->_personalizationState == 2)
    {
      v50 = v3;
      v52 = v9;
      v53 = v7;
      v57 = v4;
      v51 = v5;
      -[SUUIItem childItemIdentifiers](v5, "childItemIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v10, "count");
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      obj = v10;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v60 != v17)
              objc_enumerationMutation(obj);
            objc_msgSend(v8, "stateForItemWithIdentifier:", objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "longLongValue"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "state");

            if ((v20 & 2) != 0)
            {
              ++v16;
            }
            else if ((v20 & 1) != 0)
            {
              ++v14;
            }
            else if ((v20 & 4) != 0)
            {
              ++v15;
            }
            else
            {
              v13 += (v20 >> 3) & 1;
            }
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        }
        while (v12);
      }
      else
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
      }

      headerView = v57->_headerView;
      if (v57->_personalizedOffer)
      {
        -[SUUIProductPageHeaderView setItemOffer:](v57->_headerView, "setItemOffer:");
      }
      else
      {
        -[SUUIItem primaryItemOffer](v53, "primaryItemOffer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIProductPageHeaderView setItemOffer:](headerView, "setItemOffer:", v27);

      }
      v9 = v52;
      if (v14 > 0 || (objc_msgSend(v52, "state") & 1) != 0)
      {
        v4 = v57;
        v29 = v57;
        v30 = 1;
LABEL_36:
        -[SUUIProductPageHeaderViewController _showSynthesizedItemStateWithFlag:animated:](v29, "_showSynthesizedItemStateWithFlag:animated:", v30, v50);
        v5 = v51;
        v7 = v53;
LABEL_37:

        goto LABEL_24;
      }
      if (v16 >= 1 && v16 + v15 == v49)
      {
        v4 = v57;
        clientContext = v57->_clientContext;
        if (clientContext)
          -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("APP_BUNDLE_DOWNLOADING"), CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("APP_BUNDLE_DOWNLOADING"), 0, CFSTR("ProductPage"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v51;
        v7 = v53;
        v33 = v50;
        v34 = v57;
        v35 = v32;
LABEL_51:
        -[SUUIProductPageHeaderViewController _disableItemOfferButtonWithTitle:animated:](v34, "_disableItemOfferButtonWithTitle:animated:", v35, v33);

        goto LABEL_37;
      }
      if (v15 >= 1 && v15 == v49)
      {
        v4 = v57;
        v31 = v57->_clientContext;
        if (v31)
          -[SUUIClientContext localizedStringForKey:inTable:](v31, "localizedStringForKey:inTable:", CFSTR("APP_BUNDLE_INSTALLED"), CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("APP_BUNDLE_INSTALLED"), 0, CFSTR("ProductPage"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v51;
        v7 = v53;
        v34 = v57;
        v35 = v32;
        v33 = v50;
        goto LABEL_51;
      }
      if (v13 >= 1 && v15 + v13 == v49)
      {
        v4 = v57;
        v29 = v57;
        v30 = 8;
        goto LABEL_36;
      }
      v4 = v57;
      v36 = v57->_clientContext;
      if (v36)
        -[SUUIClientContext localizedStringForKey:inTable:](v36, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_COMPLETE_MY_BUNDLE_ORIGINAL_OFFER"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_COMPLETE_MY_BUNDLE_ORIGINAL_OFFER"), 0, CFSTR("ProductPage"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v53;
      if (v57->_personalizedOffer)
      {
        v54 = v57->_headerView;
        v38 = (void *)MEMORY[0x24BDD17C8];
        -[SUUIItem primaryItemOffer](v7, "primaryItemOffer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "buttonText");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithValidatedFormat:validFormatSpecifiers:error:", v37, CFSTR("%@"), 0, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIProductPageHeaderView setItemOfferExplanationText:](v54, "setItemOfferExplanationText:", v41);

        v42 = v57->_headerView;
        v43 = v57->_clientContext;
        v5 = v51;
        if (v43)
          -[SUUIClientContext localizedStringForKey:inTable:](v43, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_COMPLETE_MY_BUNDLE_TITLE"), CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_COMPLETE_MY_BUNDLE_TITLE"), 0, CFSTR("ProductPage"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v50;
        -[SUUIProductPageHeaderView setItemOfferExplanationTitle:](v42, "setItemOfferExplanationTitle:", v44);
      }
      else
      {
        v5 = v51;
        -[SUUIItem regularPriceString](v51, "regularPriceString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v44)
        {
          -[SUUIProductPageHeaderView setItemOfferExplanationText:](v57->_headerView, "setItemOfferExplanationText:", 0);
          -[SUUIProductPageHeaderView setItemOfferExplanationTitle:](v57->_headerView, "setItemOfferExplanationTitle:", 0);
          v47 = v50;
LABEL_65:

          -[SUUIProductPageHeaderViewController _setItemState:animated:](v57, "_setItemState:animated:", v9, v47);
          goto LABEL_37;
        }
        v55 = v57->_headerView;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v37, CFSTR("%@"), 0, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIProductPageHeaderView setItemOfferExplanationText:](v55, "setItemOfferExplanationText:", v45);

        v56 = v57->_headerView;
        v46 = v57->_clientContext;
        if (v46)
          -[SUUIClientContext localizedStringForKey:inTable:](v46, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_BUNDLE_OFFER_TITLE"), CFSTR("ProductPage"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_BUNDLE_OFFER_TITLE"), 0, CFSTR("ProductPage"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v50;
        -[SUUIProductPageHeaderView setItemOfferExplanationTitle:](v56, "setItemOfferExplanationTitle:", v48);

      }
      v9 = v52;
      goto LABEL_65;
    }
    -[SUUIProductPageHeaderView setItemOffer:](v4->_headerView, "setItemOffer:", 0);
    -[SUUIProductPageHeaderView setItemOfferExplanationText:](v4->_headerView, "setItemOfferExplanationText:", 0);
    -[SUUIProductPageHeaderView setItemOfferExplanationTitle:](v4->_headerView, "setItemOfferExplanationTitle:", 0);
    v23 = v4;
    v24 = 0;
  }
  else
  {
    v21 = v4->_headerView;
    -[SUUIItem primaryItemOffer](v7, "primaryItemOffer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderView setItemOffer:](v21, "setItemOffer:", v22);

    -[SUUIProductPageHeaderView setItemOfferExplanationText:](v4->_headerView, "setItemOfferExplanationText:", 0);
    -[SUUIProductPageHeaderView setItemOfferExplanationTitle:](v4->_headerView, "setItemOfferExplanationTitle:", 0);
    v23 = v4;
    v24 = v9;
  }
  -[SUUIProductPageHeaderViewController _setItemState:animated:](v23, "_setItemState:animated:", v24, v3);
LABEL_24:
  -[SUUIProductPageHeaderView itemOfferButton](v4->_headerView, "itemOfferButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeTarget:action:forControlEvents:", v4, 0, 0x20000);
  objc_msgSend(v25, "addTarget:action:forControlEvents:", v4, sel__itemOfferButtonAction_, 0x20000);
  objc_msgSend(v25, "setHidden:", v4->_askPermission);

}

- (id)_segmentedControlTitles
{
  SUUIClientContext *clientContext;
  id v4;
  void *v5;
  SUUIClientContext *v6;
  id v7;
  void *v8;
  SUUIClientContext *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  clientContext = self->_clientContext;
  if (clientContext)
  {
    -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_DETAILS_TAB"), CFSTR("ProductPage"));
  }
  else
  {
    v4 = 0;
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_DETAILS_TAB"), 0, CFSTR("ProductPage"));
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v5;
  v6 = self->_clientContext;
  if (v6)
  {
    -[SUUIClientContext localizedStringForKey:inTable:](v6, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_REVIEWS_TAB"), CFSTR("ProductPage"), v14[0]);
  }
  else
  {
    v7 = 0;
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_REVIEWS_TAB"), 0, CFSTR("ProductPage"), v14[0]);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[1] = v8;
  v9 = self->_clientContext;
  if (v9)
  {
    -[SUUIClientContext localizedStringForKey:inTable:](v9, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_RELATED_TAB"), CFSTR("ProductPage"));
  }
  else
  {
    v10 = 0;
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_RELATED_TAB"), 0, CFSTR("ProductPage"));
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_sendDidReloadOffer
{
  SUUIProductPageHeaderViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SUUIProductPageHeaderViewController _activeItem](self, "_activeItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = v6;
    if (self->_personalizedOffer)
    {
      objc_msgSend(v6, "productPageHeaderView:didReloadItemOffer:", self);
    }
    else
    {
      objc_msgSend(v9, "primaryItemOffer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "productPageHeaderView:didReloadItemOffer:", self, v8);

    }
  }
}

- (void)_setArtworkWithImage:(id)a3 error:(id)a4
{
  SSVLoadURLOperation *loadIconOperation;
  id v7;

  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->_iconImage, a3);
    -[SUUIProductPageHeaderView setIconImage:](self->_headerView, "setIconImage:", self->_iconImage);
  }
  loadIconOperation = self->_loadIconOperation;
  self->_loadIconOperation = 0;

}

- (void)_setPersonalizedOffer:(id)a3
{
  self->_personalizationState = 2;
  objc_storeStrong((id *)&self->_personalizedOffer, a3);
  -[SUUIProductPageHeaderViewController _reloadItemStateAnimated:](self, "_reloadItemStateAnimated:", 0);
  -[SUUIProductPageHeaderViewController _sendDidReloadOffer](self, "_sendDidReloadOffer");
}

- (void)_setItemState:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SUUIProductPageHeaderView *headerView;
  void *v7;
  id v8;

  v4 = a4;
  headerView = self->_headerView;
  v8 = a3;
  -[SUUIProductPageHeaderView itemOfferButton](headerView, "itemOfferButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 1);

  -[SUUIProductPageHeaderView setItemState:animated:](self->_headerView, "setItemState:animated:", v8, v4);
}

- (void)_setUberWithImage:(id)a3 error:(id)a4
{
  SSVLoadURLOperation *loadUberOperation;
  id v7;

  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->_uberImage, a3);
    -[SUUIProductPageHeaderView setHeaderImage:](self->_headerView, "setHeaderImage:", self->_uberImage);
  }
  loadUberOperation = self->_loadUberOperation;
  self->_loadUberOperation = 0;

}

- (void)_showActivityViewControllerFromView:(id)a3
{
  id v4;
  SUUIProductPageActivityViewController *v5;
  void *v6;
  SUUIProductPageActivityViewController *v7;
  id v8;
  UIPopoverController *v9;
  UIPopoverController *activityPopoverController;
  UIPopoverController *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;

  v4 = a3;
  if (!self->_activityPopoverController)
  {
    v5 = [SUUIProductPageActivityViewController alloc];
    -[SUUIProductPage item](self->_productPage, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SUUIProductPageActivityViewController initWithProductPageItem:clientContext:](v5, "initWithProductPageItem:clientContext:", v6, self->_clientContext);

    objc_initWeak(&location, self);
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __75__SUUIProductPageHeaderViewController__showActivityViewControllerFromView___block_invoke;
    v24 = &unk_2511F6E50;
    objc_copyWeak(&v25, &location);
    -[SUUIProductPageActivityViewController setCompletionWithItemsHandler:](v7, "setCompletionWithItemsHandler:", &v21);
    v8 = objc_alloc(MEMORY[0x24BEBD858]);
    v9 = (UIPopoverController *)objc_msgSend(v8, "initWithContentViewController:", v7, v21, v22, v23, v24);
    activityPopoverController = self->_activityPopoverController;
    self->_activityPopoverController = v9;

    v11 = self->_activityPopoverController;
    objc_msgSend(v4, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v4, "superview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v11, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v20, 15, 1, v13, v15, v17, v19);

    -[UIPopoverController setDelegate:](self->_activityPopoverController, "setDelegate:", self);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  self->_wantsActivityViewController = 0;

}

void __75__SUUIProductPageHeaderViewController__showActivityViewControllerFromView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_destroyPopoverController");

}

- (void)_showAskPermissionBanner
{
  SUUIProductPageHeaderViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "productPageHeaderViewDidWantAskPermissionBanner:", self);

  }
  -[SUUIProductPageHeaderView setRestricted:](self->_headerView, "setRestricted:", 1);
}

- (void)_showSynthesizedItemStateWithFlag:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  SUUIItemState *v10;

  v4 = a4;
  v10 = objc_alloc_init(SUUIItemState);
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[SUUIProductPageHeaderViewController _activeItem](self, "_activeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "itemIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemState setItemIdentifier:](v10, "setItemIdentifier:", v9);

  -[SUUIItemState setState:](v10, "setState:", a3);
  -[SUUIProductPageHeaderViewController _setItemState:animated:](self, "_setItemState:animated:", v10, v4);

}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIProductPageHeaderViewDelegate)delegate
{
  return (SUUIProductPageHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUIItem)item
{
  return self->_item;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_uberImage, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_personalizedOffer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadUberOperation, 0);
  objc_storeStrong((id *)&self->_loadIconOperation, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_artworkContext, 0);
  objc_storeStrong((id *)&self->_contentRatingArtworkLoader, 0);
  objc_storeStrong((id *)&self->_activityPopoverController, 0);
}

@end
