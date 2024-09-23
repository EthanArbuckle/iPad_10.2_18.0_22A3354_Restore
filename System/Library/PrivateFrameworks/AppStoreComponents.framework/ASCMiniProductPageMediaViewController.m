@implementation ASCMiniProductPageMediaViewController

+ (id)log
{
  if (log_onceToken_5 != -1)
    dispatch_once(&log_onceToken_5, &__block_literal_global_17);
  return (id)log_log_5;
}

void __44__ASCMiniProductPageMediaViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppStoreComponents", "ASCMiniProductPageMediaViewController");
  v1 = (void *)log_log_5;
  log_log_5 = (uint64_t)v0;

}

- (ASCMiniProductPageMediaViewController)initWithScreenshots:(id)a3 selectedIndex:(unint64_t)a4
{
  id v7;
  ASCMiniProductPageMediaFlowLayout *v8;
  ASCMiniProductPageMediaViewController *v9;
  ASCMiniProductPageMediaViewController *v10;
  uint64_t v11;
  ASCPresenterContext *context;
  id v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *loadedImages;
  ASCPendingPromises *v17;
  ASCPendingPromises *pendingArtworkPromises;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  ASCMiniProductPageMediaViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v36[4];
  ASCMiniProductPageMediaViewController *v37;

  v7 = a3;
  v8 = objc_alloc_init(ASCMiniProductPageMediaFlowLayout);
  +[ASCMediaCollectionViewCell minimumLineSpacing](ASCMediaCollectionViewCell, "minimumLineSpacing");
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v8, "setMinimumLineSpacing:");
  v9 = -[ASCMiniProductPageMediaViewController initWithCollectionViewLayout:](self, "initWithCollectionViewLayout:", v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_screenshots, a3);
    +[ASCPresenterContext sharedContext](ASCPresenterContext, "sharedContext");
    v11 = objc_claimAutoreleasedReturnValue();
    context = v10->_context;
    v10->_context = (ASCPresenterContext *)v11;

    v13 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[ASCScreenshots artwork](v10->_screenshots, "artwork");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));
    loadedImages = v10->_loadedImages;
    v10->_loadedImages = (NSMutableDictionary *)v15;

    v17 = objc_alloc_init(ASCPendingPromises);
    pendingArtworkPromises = v10->_pendingArtworkPromises;
    v10->_pendingArtworkPromises = v17;

    v10->_selectedIndex = a4;
    -[ASCMiniProductPageMediaViewController setInstallsStandardGestureForInteractiveMovement:](v10, "setInstallsStandardGestureForInteractiveMovement:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageMediaViewController collectionView](v10, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v19);

    -[ASCMiniProductPageMediaViewController collectionView](v10, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsSelection:", 0);

    -[ASCMiniProductPageMediaViewController collectionView](v10, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlwaysBounceHorizontal:", 1);

    v23 = *MEMORY[0x1E0DC5360];
    -[ASCMiniProductPageMediaViewController collectionView](v10, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDecelerationRate:", v23);

    -[ASCMiniProductPageMediaViewController collectionView](v10, "collectionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShowsHorizontalScrollIndicator:", 0);

    -[ASCMiniProductPageMediaViewController collectionView](v10, "collectionView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRemembersLastFocusedIndexPath:", 1);

    -[ASCMiniProductPageMediaViewController collectionView](v10, "collectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("ASCMiniProductPageMediaViewCellIdentifier"));

    v28 = (void *)MEMORY[0x1E0DC3428];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __75__ASCMiniProductPageMediaViewController_initWithScreenshots_selectedIndex___block_invoke;
    v36[3] = &unk_1E75612B8;
    v29 = v10;
    v37 = v29;
    objc_msgSend(v28, "actionWithHandler:", v36);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:primaryAction:", 24, v30);
    -[ASCMiniProductPageMediaViewController navigationItem](v29, "navigationItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setRightBarButtonItem:", v31);

    ASCLocalizedString(CFSTR("MINI_PRODUCT_PAGE_SCREENSHOT_SHEET_TITLE"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageMediaViewController setTitle:](v29, "setTitle:", v34);

    -[ASCMiniProductPageMediaViewController adjustEdgeInsets](v29, "adjustEdgeInsets");
  }

  return v10;
}

uint64_t __75__ASCMiniProductPageMediaViewController_initWithScreenshots_selectedIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewIsAppearing:(BOOL)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ASCMiniProductPageMediaViewController;
  -[ASCMiniProductPageMediaViewController viewIsAppearing:](&v11, sel_viewIsAppearing_, a3);
  -[ASCMiniProductPageMediaViewController performScreenshotsFetch](self, "performScreenshotsFetch");
  if ((-[ASCMiniProductPageMediaViewController selectedIndex](self, "selectedIndex") & 0x8000000000000000) == 0)
  {
    v4 = -[ASCMiniProductPageMediaViewController selectedIndex](self, "selectedIndex");
    -[ASCMiniProductPageMediaViewController screenshots](self, "screenshots");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artwork");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v4 < v7)
    {
      -[ASCMiniProductPageMediaViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layoutIfNeeded");

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[ASCMiniProductPageMediaViewController selectedIndex](self, "selectedIndex"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCMiniProductPageMediaViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scrollToItemAtIndexPath:atScrollPosition:animated:", v9, 16, 0);

    }
  }
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 12.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)adjustEdgeInsets
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  id v7;

  -[ASCMiniProductPageMediaViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[ASCMiniProductPageMediaViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v6 = 8.0;
  if (v4 == 1)
    v6 = 36.0;
  objc_msgSend(v5, "setLayoutMargins:", 8.0, v6, 8.0, v6);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ASCScreenshotDisplayConfiguration *v13;
  void *v14;
  void *v15;
  void *v16;
  ASCScreenshotDisplayConfiguration *v17;

  v5 = a4;
  -[ASCMiniProductPageMediaViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("ASCMiniProductPageMediaViewCellIdentifier"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASCMiniProductPageMediaViewController screenshots](self, "screenshots");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASCMiniProductPageMediaViewController loadedImages](self, "loadedImages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [ASCScreenshotDisplayConfiguration alloc];
  -[ASCMiniProductPageMediaViewController screenshots](self, "screenshots");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mediaPlatform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceCornerRadiusFactor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ASCScreenshotDisplayConfiguration initWithDeviceCornerRadiusFactor:](v13, "initWithDeviceCornerRadiusFactor:", v16);

  objc_msgSend(v7, "applyArtwork:image:screenshotDisplayConfiguration:", v10, v12, v17);
  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[ASCMiniProductPageMediaViewController screenshots](self, "screenshots", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  double v28;
  double v29;
  int v30;
  ASCMiniProductPageMediaViewController *v31;
  uint64_t v32;
  CGSize result;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v7 = objc_msgSend(v6, "item");
  -[ASCMiniProductPageMediaViewController artworkForDisplay](self, "artworkForDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 >= v9)
  {
    +[ASCMiniProductPageMediaViewController log](ASCMiniProductPageMediaViewController, "log");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v30 = 138543362;
      v31 = self;
      _os_log_impl(&dword_1BCB7B000, v27, OS_LOG_TYPE_INFO, "%{public}@: Ignoring out of bounds screenshot artwork", (uint8_t *)&v30, 0xCu);
    }

    v26 = *MEMORY[0x1E0C9D820];
    v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[ASCMiniProductPageMediaViewController artworkForDisplay](self, "artworkForDisplay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASCMiniProductPageMediaViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    -[ASCMiniProductPageMediaViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMargins");
    v20 = v14 - (v18 + v19);
    v23 = v16 - (v21 + v22);

    -[ASCMiniProductPageMediaViewController traitCollection](self, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCMediaCollectionViewCell sizeForArtwork:thatFits:usingTraitCollection:](ASCMediaCollectionViewCell, "sizeForArtwork:thatFits:usingTraitCollection:", v11, v24, v20, v23);
    v26 = v25;

  }
  v28 = v26;
  v29 = v23;
  result.height = v29;
  result.width = v28;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIEdgeInsets result;

  v8 = a4;
  v9 = a3;
  -[ASCMiniProductPageMediaViewController screenshots](self, "screenshots");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "artwork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") - 1;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageMediaViewController collectionView:layout:sizeForItemAtIndexPath:](self, "collectionView:layout:sizeForItemAtIndexPath:", v9, v8, v13);
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageMediaViewController collectionView:layout:sizeForItemAtIndexPath:](self, "collectionView:layout:sizeForItemAtIndexPath:", v9, v8, v16);
  v18 = v17;

  objc_msgSend(v9, "bounds");
  v20 = (v19 - v15) * 0.5;
  objc_msgSend(v9, "bounds");
  v22 = v21;

  v23 = (v22 - v18) * 0.5;
  v24 = 0.0;
  v25 = 0.0;
  v26 = v20;
  result.right = v23;
  result.bottom = v25;
  result.left = v26;
  result.top = v24;
  return result;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "bounds");
  v8 = v6 + v7 * 0.5;
  objc_msgSend(v4, "bounds");
  v10 = v9;

  -[ASCMiniProductPageMediaViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10 * 0.5);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = v13;
  if (v13)
  {
    -[ASCMiniProductPageMediaViewController setSelectedIndex:](self, "setSelectedIndex:", objc_msgSend(v13, "item"));
    v12 = v13;
  }

}

- (id)artworkForDisplay
{
  void *v2;
  void *v3;

  -[ASCMiniProductPageMediaViewController screenshots](self, "screenshots");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy artworkFrom:and:](__ASCLayoutProxy, "artworkFrom:and:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performScreenshotsFetch
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[6];

  -[ASCMiniProductPageMediaViewController artworkForDisplay](self, "artworkForDisplay");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageMediaViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke;
  v6[3] = &unk_1E7561310;
  v6[4] = self;
  v6[5] = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23[2];
  _QWORD v24[4];
  id v25;
  id v26[3];
  id location;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  if ((objc_msgSend(v5, "isPortrait") & 1) == 0)
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      v12 = v10;
    else
      v12 = v8;
    if (!v11)
      v8 = v10;
    v10 = v12;
  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "artworkFetcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageForContentsOfArtwork:withSize:", v5, v8, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "pendingArtworkPromises");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addPromise:", v15);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke_2;
  v24[3] = &unk_1E75612E8;
  v18 = v5;
  v19 = *(void **)(a1 + 40);
  v25 = v18;
  v26[1] = v19;
  objc_copyWeak(v26, &location);
  v26[2] = a3;
  objc_msgSend(v15, "addSuccessBlock:", v24);
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke_3;
  v21[3] = &unk_1E7560BD8;
  objc_copyWeak(v23, &location);
  v20 = v18;
  v22 = v20;
  v23[1] = a3;
  objc_msgSend(v15, "addErrorBlock:", v21);

  objc_destroyWeak(v23);
  objc_destroyWeak(v26);

  objc_destroyWeak(&location);
}

void __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isPortrait") & 1) == 0 && !*(_QWORD *)(a1 + 48))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3870]);
    v4 = objc_retainAutorelease(v7);
    v5 = objc_msgSend(v4, "CGImage");
    objc_msgSend(v4, "scale");
    v7 = (id)objc_msgSend(v3, "initWithCGImage:scale:orientation:", v5, 2);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "screenshotArtwork:didFetchImage:atIndex:", *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(a1 + 56));

}

void __64__ASCMiniProductPageMediaViewController_performScreenshotsFetch__block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "screenshotArtwork:didFailFetchWithError:atIndex:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 48));

}

- (void)performFollowUpWork:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x1E0CB3978];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)screenshotArtwork:(id)a3 didFetchImage:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__ASCMiniProductPageMediaViewController_screenshotArtwork_didFetchImage_atIndex___block_invoke;
  v12[3] = &unk_1E7560C28;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[ASCMiniProductPageMediaViewController performFollowUpWork:](self, "performFollowUpWork:", v12);

}

void __81__ASCMiniProductPageMediaViewController_screenshotArtwork_didFetchImage_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "artworkForDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3 < objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(NSObject **)(a1 + 40);
    if (v4)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      if (v4 == v6)
      {
LABEL_13:
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 56), 0);
        v8 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "loadedImages");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v8);

        objc_msgSend(*(id *)(a1 + 32), "collectionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "reloadItemsAtIndexPaths:", v14);

LABEL_14:
        goto LABEL_15;
      }
    }
    else if ((-[NSObject isEqual:](v4, "isEqual:") & 1) != 0)
    {
      goto LABEL_13;
    }
    +[ASCMiniProductPageMediaViewController log](ASCMiniProductPageMediaViewController, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_1BCB7B000, v8, OS_LOG_TYPE_INFO, "%{public}@: Ignoring screenshot artwork for mismatched lockup", buf, 0xCu);
    }
    goto LABEL_14;
  }
  +[ASCMiniProductPageMediaViewController log](ASCMiniProductPageMediaViewController, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v17 = v10;
    _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "%{public}@: Ignoring out of bounds screenshot artwork", buf, 0xCu);
  }
LABEL_15:

}

- (void)screenshotArtwork:(id)a3 didFailFetchWithError:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__ASCMiniProductPageMediaViewController_screenshotArtwork_didFailFetchWithError_atIndex___block_invoke;
  v9[3] = &unk_1E7560C50;
  v10 = v7;
  v11 = a5;
  v9[4] = self;
  v8 = v7;
  -[ASCMiniProductPageMediaViewController performFollowUpWork:](self, "performFollowUpWork:", v9);

}

void __89__ASCMiniProductPageMediaViewController_screenshotArtwork_didFailFetchWithError_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "artworkForDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 < objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(NSObject **)(a1 + 40);
    if (v4)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      if (v4 == v6)
      {
LABEL_13:
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 48), 0);
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "loadedImages");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v8);

        objc_msgSend(*(id *)(a1 + 32), "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "reloadItemsAtIndexPaths:", v13);

LABEL_14:
        goto LABEL_15;
      }
    }
    else if ((-[NSObject isEqual:](v4, "isEqual:") & 1) != 0)
    {
      goto LABEL_13;
    }
    +[ASCMiniProductPageMediaViewController log](ASCMiniProductPageMediaViewController, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1BCB7B000, v8, OS_LOG_TYPE_INFO, "%{public}@: Ignoring screenshot artwork for mismatched lockup", buf, 0xCu);
    }
    goto LABEL_14;
  }
  +[ASCMiniProductPageMediaViewController log](ASCMiniProductPageMediaViewController, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "%{public}@: Ignoring out of bounds screenshot artwork", buf, 0xCu);
  }
LABEL_15:

}

- (ASCScreenshots)screenshots
{
  return self->_screenshots;
}

- (ASCPresenterContext)context
{
  return self->_context;
}

- (ASCPendingPromises)pendingArtworkPromises
{
  return self->_pendingArtworkPromises;
}

- (NSMutableDictionary)loadedImages
{
  return self->_loadedImages;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedImages, 0);
  objc_storeStrong((id *)&self->_pendingArtworkPromises, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
}

@end
