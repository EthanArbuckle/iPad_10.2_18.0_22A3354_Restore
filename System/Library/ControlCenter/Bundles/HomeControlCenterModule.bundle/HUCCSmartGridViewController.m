@implementation HUCCSmartGridViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t shouldBlockCurrentUserFromHome;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  int v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  objc_super v34;
  uint8_t buf[4];
  _BYTE v36[10];
  const char *v37;
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v36 = v7;
    *(_WORD *)&v36[8] = 2080;
    v37 = "-[HUCCSmartGridViewController viewWillAppear:]";
    _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);

  }
  objc_msgSend_setViewVisible_(self, v8, 1);
  v34.receiver = self;
  v34.super_class = (Class)HUCCSmartGridViewController;
  -[HUControllableItemCollectionViewController viewWillAppear:](&v34, sel_viewWillAppear_, v3);
  if (objc_msgSend_needsLayoutOptionsUpdate(self, v9, v10))
    objc_msgSend__updateLayoutOptions(self, v11, v12);
  objc_msgSend__restorePressedTileIfNeeded(self, v11, v12);
  objc_msgSend_itemManager(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_home(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  shouldBlockCurrentUserFromHome = objc_msgSend_hf_shouldBlockCurrentUserFromHome(v18, v19, v20);

  if ((_DWORD)shouldBlockCurrentUserFromHome != objc_msgSend_shouldBlockCurrentUserFromHome(self, v22, v23))
  {
    HFLogForCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend_shouldBlockCurrentUserFromHome(self, v25, v26);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v36 = v27;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = shouldBlockCurrentUserFromHome;
      _os_log_impl(&dword_230FDD000, v24, OS_LOG_TYPE_DEFAULT, "shouldBlockCurrentUserFromHome was %{BOOL}d and is now %{BOOL}d - reloading HUCCSmartGridItemManager", buf, 0xEu);
    }

    objc_msgSend_setShouldBlockCurrentUserFromHome_(self, v28, shouldBlockCurrentUserFromHome);
    objc_msgSend_itemManager(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_loadDefaultProviderItem(v31, v32, v33);

  }
}

- (HUCCSmartGridViewController)initWithItemType:(unint64_t)a3 delegate:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  HUCCSmartGridItemManager *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  HUCCSmartGridViewController *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  HFHomeKitDispatcher *dispatcher;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  objc_super v28;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BE4F480]);
  objc_msgSend_setMosaicLayout_(self, v8, (uint64_t)v7);

  v9 = [HUCCSmartGridItemManager alloc];
  v11 = (void *)objc_msgSend_initWithMosaicLayoutDelegate_(v9, v10, (uint64_t)self);
  objc_msgSend_mosaicLayout(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)HUCCSmartGridViewController;
  v15 = -[HUControllableItemCollectionViewController initWithItemManager:collectionViewLayout:](&v28, sel_initWithItemManager_collectionViewLayout_, v11, v14);

  if (v15)
  {
    v15->_itemType = a3;
    v15->_needsLayoutOptionsUpdate = 1;
    objc_storeWeak((id *)&v15->_delegate, v6);
    objc_msgSend_sharedDispatcher(MEMORY[0x24BE4D0B0], v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatcher = v15->_dispatcher;
    v15->_dispatcher = (HFHomeKitDispatcher *)v18;

    objc_msgSend_addHomeManagerObserver_(v15->_dispatcher, v20, (uint64_t)v15);
    objc_msgSend_mosaicLayout(v15, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDelegate_(v23, v24, (uint64_t)v15);

    if (objc_msgSend_isViewLoaded(v15, v25, v26))
      NSLog(&CFSTR("View was loaded too early in the initialization process. This is bad, because this code is run very early i"
                   "n SpringBoard's boot process").isa);
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  objc_super v6;

  objc_msgSend_mosaicLayout(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegate_(v4, v5, 0);

  v6.receiver = self;
  v6.super_class = (Class)HUCCSmartGridViewController;
  -[HUCCSmartGridViewController dealloc](&v6, sel_dealloc);
}

- (void)setSizeSubclass:(unint64_t)a3
{
  if (self->_sizeSubclass != a3)
  {
    self->_sizeSubclass = a3;
    MEMORY[0x24BEDD108]();
  }
}

- (id)dismissQuickControlAnimated:(BOOL)a3 wasDismissed:(BOOL *)a4
{
  _BOOL8 v5;
  void *v6;
  const char *v7;
  void *v8;

  v5 = a3;
  objc_msgSend_quickControlPresentationCoordinator(self, a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dismissQuickControlAnimated_wasDismissed_(v6, v7, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_preloadItemsForPossiblePresentation
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  dispatch_time_t v11;
  _QWORD v12[6];

  objc_msgSend_itemManager(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_home(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_shouldBlockCurrentUserFromHome = objc_msgSend_hf_shouldBlockCurrentUserFromHome(v8, v9, v10);

  v11 = dispatch_time(0, 1000000000);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_230FE32B4;
  v12[3] = &unk_24FFD8250;
  v12[4] = self;
  v12[5] = a2;
  dispatch_after(v11, MEMORY[0x24BDAC9B8], v12);
}

- (BOOL)canDismissQuickControl
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isQuickControlPresented;

  objc_msgSend_quickControlPresentationCoordinator(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isQuickControlPresented = objc_msgSend_isQuickControlPresented(v3, v4, v5);

  return isQuickControlPresented;
}

- (HUMosaicLayoutGeometry)mosaicLayoutGeometry
{
  uint64_t v2;
  HUMosaicLayoutGeometry *mosaicLayoutGeometry;
  HUMosaicLayoutGeometry *v5;
  HUMosaicLayoutGeometry *v6;

  mosaicLayoutGeometry = self->_mosaicLayoutGeometry;
  if (!mosaicLayoutGeometry)
  {
    objc_msgSend_layoutGeometry(HUCCSmartGridLayout, a2, v2);
    v5 = (HUMosaicLayoutGeometry *)objc_claimAutoreleasedReturnValue();
    v6 = self->_mosaicLayoutGeometry;
    self->_mosaicLayoutGeometry = v5;

    mosaicLayoutGeometry = self->_mosaicLayoutGeometry;
  }
  return mosaicLayoutGeometry;
}

- (HUGridHomeCell)homeCell
{
  HUGridHomeCell **p_homeCell;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  p_homeCell = &self->_homeCell;
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeCell);
  if (!WeakRetained)
    goto LABEL_3;
  v7 = WeakRetained;
  objc_msgSend_collectionView(self, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)p_homeCell);
  objc_msgSend_indexPathForCell_(v8, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_3:
    objc_msgSend_collectionView(self, v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_visibleCells(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_na_firstObjectPassingTest_(v15, v16, (uint64_t)&unk_24FFD8290);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_homeCell, v17);

  }
  return (HUGridHomeCell *)objc_loadWeakRetained((id *)p_homeCell);
}

- (HUGridSize)occupiedGridSizeForOrientation:(int64_t)a3
{
  unint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  HUMosaicLayoutGeometry *mosaicLayoutGeometry;
  NSObject *v10;
  const char *v11;
  HUMosaicLayoutGeometry *v12;
  HUMosaicLayoutGeometry *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  int64_t v36;
  int64_t v37;
  NSObject *v38;
  const char *v39;
  HUMosaicLayoutGeometry *v40;
  HUMosaicLayoutGeometry *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  int64_t v47;
  NSObject *v48;
  const char *v49;
  const char *v50;
  int64_t v51;
  int64_t v52;
  int v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;
  HUGridSize result;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], a2, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend_userInterfaceIdiom(v5, v6, v7);

    if (v8 != 1)
    {
      HFLogForCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v53) = 0;
        _os_log_impl(&dword_230FDD000, v48, OS_LOG_TYPE_DEFAULT, "Using landscape mosaic layout geometry", (uint8_t *)&v53, 2u);
      }

      objc_msgSend_layoutGeometryIsPortrait_(HUCCSmartGridLayout, v49, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend_gridSizeForGeometry_withEmptyCells_(MEMORY[0x24BE4F490], v50, (uint64_t)v27, 0);
      goto LABEL_17;
    }
  }
  mosaicLayoutGeometry = self->_mosaicLayoutGeometry;
  if (!mosaicLayoutGeometry)
  {
    HFLogForCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v53) = 0;
      _os_log_impl(&dword_230FDD000, v38, OS_LOG_TYPE_DEFAULT, "No mosaic layout geometry available. Using full size grid", (uint8_t *)&v53, 2u);
    }

    objc_msgSend_layoutGeometryIsPortrait_(HUCCSmartGridLayout, v39, v4 < 2);
    v40 = (HUMosaicLayoutGeometry *)objc_claimAutoreleasedReturnValue();
    v41 = self->_mosaicLayoutGeometry;
    self->_mosaicLayoutGeometry = v40;

    v42 = (void *)MEMORY[0x24BE4F490];
    objc_msgSend_mosaicLayoutGeometry(self, v43, v44);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend_gridSizeForGeometry_withEmptyCells_(v42, v45, (uint64_t)v27, 0);
LABEL_17:
    v35 = v46;
    v37 = v47;
    goto LABEL_18;
  }
  if (v4 < 2 != objc_msgSend_isPortrait(mosaicLayoutGeometry, a2, a3))
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v53 = 67109120;
      LODWORD(v54) = v4 < 2;
      _os_log_impl(&dword_230FDD000, v10, OS_LOG_TYPE_DEFAULT, "Updating isPortrait to %{BOOL}d because orientation changed", (uint8_t *)&v53, 8u);
    }

    objc_msgSend_layoutGeometryIsPortrait_(HUCCSmartGridLayout, v11, v4 < 2);
    v12 = (HUMosaicLayoutGeometry *)objc_claimAutoreleasedReturnValue();
    v13 = self->_mosaicLayoutGeometry;
    self->_mosaicLayoutGeometry = v12;

  }
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_itemManager(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_numberOfPlaceholderItems(v17, v18, v19);
    objc_msgSend_mosaicLayoutGeometry(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 134218242;
    v54 = v20;
    v55 = 2112;
    v56 = v23;
    _os_log_impl(&dword_230FDD000, v14, OS_LOG_TYPE_DEFAULT, "Using mosiac layout geometry for %lu placeholder items: %@", (uint8_t *)&v53, 0x16u);

  }
  v24 = (void *)MEMORY[0x24BE4F490];
  objc_msgSend_mosaicLayoutGeometry(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_itemManager(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_numberOfPlaceholderItems(v30, v31, v32);
  v35 = objc_msgSend_gridSizeForGeometry_withEmptyCells_(v24, v34, (uint64_t)v27, v33);
  v37 = v36;

LABEL_18:
  v51 = v35;
  v52 = v37;
  result.var1 = v52;
  result.var0 = v51;
  return result;
}

- (void)viewDidLoad
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v5;
    v25 = 2080;
    v26 = "-[HUCCSmartGridViewController viewDidLoad]";
    _os_log_impl(&dword_230FDD000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);

  }
  v22.receiver = self;
  v22.super_class = (Class)HUCCSmartGridViewController;
  -[HUControllableItemCollectionViewController viewDidLoad](&v22, sel_viewDidLoad);
  objc_msgSend_clearColor(MEMORY[0x24BDF6950], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_collectionView(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackgroundColor_(v11, v12, (uint64_t)v8);

  objc_msgSend_collectionView(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScrollEnabled_(v15, v16, 0);

  objc_msgSend_itemManager(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadDefaultProviderItem(v19, v20, v21);

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)HUCCSmartGridViewController;
  -[HUControllableItemCollectionViewController viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_view(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_window(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("yes");
    if (!v12)
      v13 = CFSTR("no");
    *(_DWORD *)buf = 138412802;
    v16 = v6;
    v17 = 2080;
    v18 = "-[HUCCSmartGridViewController viewDidAppear:]";
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_230FDD000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s — has window: %@", buf, 0x20u);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v7;
    v16 = 2080;
    v17 = "-[HUCCSmartGridViewController viewDidDisappear:]";
    _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s", buf, 0x16u);

  }
  v13.receiver = self;
  v13.super_class = (Class)HUCCSmartGridViewController;
  -[HUControllableItemCollectionViewController viewDidDisappear:](&v13, sel_viewDidDisappear_, v3);
  objc_msgSend_setViewVisible_(self, v8, 0);
  objc_msgSend__restorePressedTileIfNeeded(self, v9, v10);
  objc_msgSend_setMosaicLayoutGeometry_(self, v11, 0);
  objc_msgSend_setIsBoundsChangeUpdate_(self, v12, 0);
}

- (void)_enqueueLayoutOptionsUpdate
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  if (objc_msgSend_isViewVisible(self, a2, v2))
    objc_msgSend__updateLayoutOptions(self, v4, v5);
  else
    MEMORY[0x24BEDD108](self, sel_setNeedsLayoutOptionsUpdate_, 1);
}

- (void)_updateLayoutOptions
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  double v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  double v18;
  double v19;
  void *v20;
  const char *v21;

  objc_msgSend_view(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v4, v5, v6);
  objc_msgSend_layoutOptionsForViewSize_andMosaicSize_(HUCCSmartGridLayout, v7, 1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSingleCellLayoutOptions_(self, v11, (uint64_t)v10);

  objc_msgSend_view(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v14, v15, v16);
  objc_msgSend_layoutOptionsForViewSize_andMosaicSize_(HUCCSmartGridLayout, v17, 2, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExpandedCellLayoutOptions_(self, v21, (uint64_t)v20);

  MEMORY[0x24BEDD108](self, sel_setNeedsLayoutOptionsUpdate_, 0);
}

- (id)_cellLayoutOptionsForItem:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_expandedCellLayoutOptions(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sceneCellOptions(v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend_conformsToProtocol_(v4, v5, (uint64_t)&unk_255EEBEC0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_9;
      objc_msgSend_expandedCellLayoutOptions(self, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sceneCellOptions(v18, v19, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setCellInnerMargin_(v15, v21, v22, 12.0);
      objc_msgSend_setIconInnerHorizontalMargin_(v15, v23, v24, 10.0);
      if (!v15)
        goto LABEL_9;
      goto LABEL_10;
    }
    objc_msgSend_singleCellLayoutOptions(self, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serviceCellOptions(v7, v13, v14);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v10;

  if (!v15)
  {
LABEL_9:
    NSLog(CFSTR("missing cell layout options for item %@!"), v4);
    v15 = 0;
  }
LABEL_10:

  return v15;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_gridLayout
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  unint64_t v10;
  unint64_t v11;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v4 = (void *)MEMORY[0x24BE4F468];
  v5 = objc_msgSend_itemType(self, a2, v2);
  v8 = objc_msgSend_sizeSubclass(self, v6, v7);
  v10 = objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(v4, v9, v5, v8);
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  const char *v13;

  v6 = a3;
  if (objc_msgSend_conformsToProtocol_(v6, v7, (uint64_t)&unk_255EEBEC0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, CFSTR("HUCCSmartGridViewController.m"), 277, CFSTR("Unknown item %@"), v6);

    v10 = 0;
  }

  return (Class)v10;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  uint64_t shouldShowHomeNameInHomeCell;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  objc_super v46;

  v6 = a3;
  v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)HUCCSmartGridViewController;
  -[HUControllableItemCollectionViewController configureCell:forItem:](&v46, sel_configureCell_forItem_, v6, v7);
  v8 = v6;
  if (objc_msgSend_conformsToProtocol_(v8, v9, (uint64_t)&unk_255EEC1C8))
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend__cellLayoutOptionsForItem_(self, v12, (uint64_t)v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLayoutOptions_(v11, v14, (uint64_t)v13);

    objc_msgSend_setPointerInteractionEnabled_(v11, v15, 1);
    objc_msgSend_cellSpacing(HUCCSmartGridLayout, v16, v17);
    objc_msgSend_setPointerRegionMargin_(v11, v18, v19);
  }
  objc_opt_class();
  v20 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if (v22)
  {
    objc_opt_class();
    v23 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
    v25 = v24;

    objc_msgSend_itemManager(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allDisplayedItems(v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v31, v32, v33) == 1)
    {

    }
    else
    {
      objc_msgSend_home(v25, v34, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        shouldShowHomeNameInHomeCell = objc_msgSend__shouldShowHomeNameInHomeCell(self, v36, v38);
        objc_msgSend_setShouldShowHomeName_(v22, v40, shouldShowHomeNameInHomeCell);
        objc_msgSend_setShouldShowAsEmptyHome_(v22, v41, 0);
LABEL_18:

        goto LABEL_19;
      }
    }
    objc_msgSend_setShouldShowAsEmptyHome_(v22, v36, 1);
    objc_msgSend_mosaicLayoutGeometry(self, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMosaicLayoutGeometry_(v22, v45, (uint64_t)v44);

    goto LABEL_18;
  }
LABEL_19:

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend_deselectItemAtIndexPath_animated_(v7, v8, (uint64_t)v6, 0);
  v9.receiver = self;
  v9.super_class = (Class)HUCCSmartGridViewController;
  -[HUItemCollectionViewController collectionView:didSelectItemAtIndexPath:](&v9, sel_collectionView_didSelectItemAtIndexPath_, v7, v6);

}

- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  char isDeviceUnlockedForGridViewController;
  void *v14;
  const char *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  const char *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  HUCCSmartGridViewController *v27;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend_requiresUnlockToPerformActionForItem_(self, v8, (uint64_t)v6))
    goto LABEL_5;
  objc_msgSend_delegate(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isDeviceUnlockedForGridViewController = objc_msgSend_isDeviceUnlockedForGridViewController_(v11, v12, (uint64_t)self);

  if ((isDeviceUnlockedForGridViewController & 1) != 0)
    goto LABEL_5;
  objc_msgSend_delegate(self, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prepareForActionRequiringDeviceUnlockForGridViewController_(v14, v15, (uint64_t)self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = 0;
    v18 = v16;
  }
  else
  {
LABEL_5:
    objc_msgSend_futureWithNoResult(MEMORY[0x24BE6B608], v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = 1;
  }
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_230FE4324;
  v24[3] = &unk_24FFD82B8;
  v25 = v6;
  v26 = v7;
  v27 = self;
  v19 = v7;
  v20 = v6;
  objc_msgSend_flatMap_(v18, v21, (uint64_t)v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  return v22;
}

- (BOOL)_hasTapActionForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HUCCSmartGridViewController;
    v8 = -[HUControllableItemCollectionViewController _hasTapActionForItem:](&v10, sel__hasTapActionForItem_, v5);
  }

  return v8;
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = v10;
    v27 = 2080;
    v28 = "-[HUCCSmartGridViewController _performTapActionForItem:tappedArea:]";
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_230FDD000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s %@", buf, 0x20u);

  }
  objc_opt_class();
  v11 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_initWeak((id *)buf, self);
    v14 = (void *)MEMORY[0x24BE6B608];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_230FE4648;
    v22[3] = &unk_24FFD82E0;
    objc_copyWeak(&v24, (id *)buf);
    v23 = v13;
    objc_msgSend_mainThreadScheduler(MEMORY[0x24BE6B628], v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_futureWithBlock_scheduler_(v14, v18, (uint64_t)v22, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)HUCCSmartGridViewController;
    -[HUControllableItemCollectionViewController _performTapActionForItem:tappedArea:](&v21, sel__performTapActionForItem_tappedArea_, v11, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (void)_showDashboardControllerForHome:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_displayHome_(v8, v7, (uint64_t)v4);

}

- (void)_updateHomeCell
{
  uint64_t v2;
  uint64_t shouldShowHomeNameInHomeCell;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  shouldShowHomeNameInHomeCell = objc_msgSend__shouldShowHomeNameInHomeCell(self, a2, v2);
  objc_msgSend_homeCell(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShouldShowHomeName_(v8, v7, shouldShowHomeNameInHomeCell);

}

- (BOOL)_shouldShowHomeNameInHomeCell
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;

  objc_msgSend_dispatcher(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeManager(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homes(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (unint64_t)objc_msgSend_count(v9, v10, v11) > 1;

  return v12;
}

- (void)_restorePressedTileIfNeeded
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int isHidden;
  const char *v12;
  uint64_t v13;
  const char *v14;
  id v15;

  objc_msgSend_pressedTile(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = (void *)v4;
    objc_msgSend_pressedTile(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isHidden = objc_msgSend_isHidden(v8, v9, v10);

    if (isHidden)
    {
      objc_msgSend_pressedTile(self, v12, v13);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setHidden_(v15, v14, 0);

    }
  }
}

- (id)arranger
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;

  v2 = objc_alloc(MEMORY[0x24BE4F428]);
  v5 = objc_msgSend_mosaicType(HUCCSmartGridLayout, v3, v4);
  return (id)objc_msgSend_initWithCCMosaicType_(v2, v6, v5);
}

- (void)itemManagerDidChangeMosaicLayout:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_isBoundsChangeUpdate(self, a2, (uint64_t)a3))
  {
    objc_msgSend_setIsBoundsChangeUpdate_(self, v4, 0);
  }
  else
  {
    objc_msgSend_delegate(self, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_gridSizeMayHaveChanged(v8, v9, v10);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend_collectionView(self, v6, v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_visibleCells(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v38, v42, 16);
  if (v16)
  {
    v19 = v16;
    v20 = *(_QWORD *)v39;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v14);
        v22 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v21);
        objc_msgSend_collectionView(self, v17, v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_indexPathForCell_(v23, v24, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend_itemManager(self, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_mosaicDetailsForDisplayedItemAtIndexPath_(v28, v29, (uint64_t)v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend_baseItem(v30, v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              objc_msgSend_baseItem(v30, v34, v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_configureCell_forItem_(self, v37, v22, v36);

            }
          }

        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v38, v42, 16);
    }
    while (v19);
  }

}

- (void)itemManagerDidChangeNumberOfPlaceholderItems:(id)a3
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_gridSizeMayHaveChanged(v5, v3, v4);

}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_changes(v7, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationDescription(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v29 = v10;
    v30 = 2080;
    v31 = "-[HUCCSmartGridViewController itemManager:performUpdateRequest:]";
    v32 = 2112;
    v33 = v6;
    v34 = 2112;
    v35 = v16;
    _os_log_impl(&dword_230FDD000, v8, OS_LOG_TYPE_INFO, "%@:%s %@ performing item operations: %@", buf, 0x2Au);

  }
  objc_msgSend__checkForCollectionViewAssertions_(self, v17, (uint64_t)v7);
  v27.receiver = self;
  v27.super_class = (Class)HUCCSmartGridViewController;
  -[HUControllableItemCollectionViewController itemManager:performUpdateRequest:](&v27, sel_itemManager_performUpdateRequest_, v6, v7);
  if (objc_msgSend_isViewLoaded(self, v18, v19))
  {
    objc_msgSend_collectionView(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_indexPathsForVisibleItems(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__performItemConsistencyCheckForIndexPaths_withUpdateRequest_(self, v26, (uint64_t)v25, v7);

  }
}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  objc_super v30;
  uint8_t buf[4];
  HUCCSmartGridViewController *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v13 = a5;
  if (self
    && ((objc_msgSend_isViewVisible(self, v11, v12) & 1) != 0
     || (objc_msgSend_objectForKeyedSubscript_(v13, v14, *MEMORY[0x24BE4CF20]),
         v16 = (void *)objc_claimAutoreleasedReturnValue(),
         v16,
         v16)))
  {
    v17 = (void *)objc_msgSend_superclass(HUCCSmartGridViewController, v14, v15);
    if (objc_msgSend_instancesRespondToSelector_(v17, v18, (uint64_t)a2))
    {
      v30.receiver = self;
      v30.super_class = (Class)HUCCSmartGridViewController;
      -[HUItemCollectionViewController itemManager:futureToUpdateItems:itemUpdateOptions:](&v30, sel_itemManager_futureToUpdateItems_itemUpdateOptions_, v9, v10, v13);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_futureWithNoResult(MEMORY[0x24BE6B608], v19, v20);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)v21;
  }
  else
  {
    HFLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = self;
      _os_log_impl(&dword_230FDD000, v22, OS_LOG_TYPE_DEFAULT, "Blocking full item update for view controller %@ as we are not visible.", buf, 0xCu);
    }

    v23 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend_na_cancelledError(MEMORY[0x24BDD1540], v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_futureWithError_(v23, v27, (uint64_t)v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v28;
}

- (unint64_t)cellSizeForItemAtIndexPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v4 = a3;
  objc_msgSend_itemManager(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mosaicDetailsForDisplayedItemAtIndexPath_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend_itemSize(v9, v10, v11);
  if (v12 <= 1)
    v13 = 1;
  else
    v13 = v12;

  return v13;
}

- (int64_t)preferredModalPresentationStyleForPresentationCoordinator:(id)a3
{
  return 6;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  double y;
  double x;
  const char *v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  objc_super v30;
  _QWORD v31[2];

  y = a4.y;
  x = a4.x;
  v31[1] = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)HUCCSmartGridViewController;
  v10 = -[HUControllableItemCollectionViewController presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:](&v30, sel_presentationCoordinator_shouldBeginInteractivePresentationWithTouchLocation_view_, a3, a5);
  if (v10)
  {
    objc_msgSend_collectionView(self, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_indexPathForItemAtPoint_(v11, v12, v13, x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v31[0] = v14;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v15, (uint64_t)v31, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__performItemConsistencyCheckForIndexPaths_withUpdateRequest_(self, v17, (uint64_t)v16, 0);

      objc_msgSend_itemManager(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_displayedItemAtIndexPath_(v20, v21, (uint64_t)v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend_collectionView(self, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cellForItemAtIndexPath_(v25, v26, (uint64_t)v14);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPressedTile_(self, v28, (uint64_t)v27);

      }
    }

  }
  return v10;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  int v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  char isDeviceUnlockedForGridViewController;
  void *v26;
  char isKindOfClass;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  BOOL v41;
  objc_super v43;
  _QWORD block[5];
  id v45;
  id v46;
  _QWORD v47[5];

  v7 = a3;
  v8 = a4;
  objc_msgSend_itemManager(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_item(v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  objc_msgSend_childItemsForItem_ofClass_(v11, v16, (uint64_t)v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = sub_230FE5208;
  v47[3] = &unk_24FFD8308;
  v47[4] = self;
  v20 = objc_msgSend_na_any_(v17, v19, (uint64_t)v47);

  if (v20)
  {
    objc_msgSend_delegate(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    isDeviceUnlockedForGridViewController = objc_msgSend_isDeviceUnlockedForGridViewController_(v23, v24, (uint64_t)self);

    if ((isDeviceUnlockedForGridViewController & 1) == 0)
    {
      block[0] = v18;
      block[1] = 3221225472;
      block[2] = sub_230FE5214;
      block[3] = &unk_24FFD8358;
      block[4] = self;
      v45 = v8;
      v46 = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      goto LABEL_9;
    }
  }
  objc_msgSend_item(v8, v21, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend_item(v8, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend__performTapActionForItem_(self, v31, (uint64_t)v30);

LABEL_9:
    v41 = 0;
    goto LABEL_10;
  }
  objc_msgSend_controlItems(v8, v28, v29);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_count(v33, v34, v35);

  if (!v36)
    goto LABEL_9;
  v39 = (void *)objc_msgSend_superclass(HUCCSmartGridViewController, v37, v38);
  if (objc_msgSend_instancesRespondToSelector_(v39, v40, (uint64_t)a2))
  {
    v43.receiver = self;
    v43.super_class = (Class)HUCCSmartGridViewController;
    v41 = -[HUControllableItemCollectionViewController presentationCoordinator:shouldBeginPresentationWithContext:](&v43, sel_presentationCoordinator_shouldBeginPresentationWithContext_, v7, v8);
  }
  else
  {
    v41 = 1;
  }
LABEL_10:

  return v41;
}

- (void)presentationCoordinatorWillBeginTransition:(id)a3 presenting:(BOOL)a4
{
  const char *v4;
  id v5;

  if (a4)
  {
    objc_msgSend_pressedTile(self, a2, (uint64_t)a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHidden_(v5, v4, 1);

  }
}

- (void)presentationCoordinatorWillEndTransition:(id)a3 presenting:(BOOL)a4
{
  if (!a4)
    objc_msgSend__restorePressedTileIfNeeded(self, a2, (uint64_t)a3);
}

- (void)presentationCoordinator:(id)a3 didEndPresentationWithContext:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v11 = (void *)objc_msgSend_superclass(HUCCSmartGridViewController, v9, v10);
  if (objc_msgSend_instancesRespondToSelector_(v11, v12, (uint64_t)a2))
  {
    v16.receiver = self;
    v16.super_class = (Class)HUCCSmartGridViewController;
    -[HUControllableItemCollectionViewController presentationCoordinator:didEndPresentationWithContext:](&v16, sel_presentationCoordinator_didEndPresentationWithContext_, v7, v8);
  }
  objc_msgSend__restorePressedTileIfNeeded(self, v13, v14);
  objc_msgSend_setPressedTile_(self, v15, 0);

}

- (id)traitCollectionForPresentationCoordinator:(id)a3
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDF6F30], sel_traitCollectionWithUserInterfaceStyle_, 2);
}

- (BOOL)shouldOverrideTraitCollectionForPresentationCoordinator:(id)a3
{
  return 1;
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (id)detailViewURLHandlerForPresentationCoordinator:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_URLHandler, a3);
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (BOOL)presentationCoordinatorShouldDisablePullToUnlockSettings:(id)a3
{
  return 1;
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  uint64_t v6;

  objc_msgSend__updateHomeCell(self, a2, (uint64_t)a3, a4, a5);
  MEMORY[0x24BEDD108](self, sel__preloadItemsForPossiblePresentation, v6);
}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  uint64_t v4;

  objc_msgSend__updateHomeCell(self, a2, (uint64_t)a3);
  MEMORY[0x24BEDD108](self, sel__preloadItemsForPossiblePresentation, v4);
}

- (void)_performItemConsistencyCheckForIndexPaths:(id)a3 withUpdateRequest:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  _QWORD activity_block[4];
  id v16;
  id v17;
  _QWORD v18[5];

  v14 = a3;
  v6 = a4;
  if (objc_msgSend_isViewLoaded(self, v7, v8))
  {
    v10 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_230FE5568;
    v18[3] = &unk_24FFD8380;
    v18[4] = self;
    objc_msgSend_na_map_(v14, v9, (uint64_t)v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v11, v12, v13))
    {
      activity_block[0] = v10;
      activity_block[1] = 3221225472;
      activity_block[2] = sub_230FE568C;
      activity_block[3] = &unk_24FFD83A8;
      v16 = v11;
      v17 = v6;
      _os_activity_initiate(&dword_230FDD000, "Control Center item update inconsistency", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    }
  }

}

- (void)_checkForCollectionViewAssertions:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  char v17;
  id v18;
  _QWORD activity_block[5];
  id v20;

  v18 = a3;
  objc_msgSend_collectionView(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_numberOfSections(v6, v7, v8);

  if (!v9)
  {
    objc_msgSend_changes(v18, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allOperations(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_na_any_(v15, v16, (uint64_t)&unk_24FFD83E8);

    if ((v17 & 1) == 0)
    {
      activity_block[0] = MEMORY[0x24BDAC760];
      activity_block[1] = 3221225472;
      activity_block[2] = sub_230FE5CC8;
      activity_block[3] = &unk_24FFD83A8;
      activity_block[4] = self;
      v20 = v18;
      _os_activity_initiate(&dword_230FDD000, "Control Center collection view inconsistency", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    }
  }

}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t isViewVisible;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  objc_msgSend_builderWithObject_(MEMORY[0x24BE6B600], a2, (uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_itemType(self, v4, v5) == 1)
    objc_msgSend_appendString_withName_(v3, v6, (uint64_t)CFSTR("Scenes"), CFSTR("itemType"));
  else
    objc_msgSend_appendString_withName_(v3, v6, (uint64_t)CFSTR("Services"), CFSTR("itemType"));
  isViewVisible = objc_msgSend_isViewVisible(self, v7, v8);
  v11 = (id)objc_msgSend_appendBool_withName_(v3, v10, isViewVisible, CFSTR("viewVisible"));
  objc_msgSend_build(v3, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (unint64_t)sizeSubclass
{
  return self->_sizeSubclass;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (HUCCSmartGridViewControllerDelegate)delegate
{
  return (HUCCSmartGridViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUOpenURLHandling)URLHandler
{
  return self->_URLHandler;
}

- (void)setURLHandler:(id)a3
{
  objc_storeStrong((id *)&self->_URLHandler, a3);
}

- (void)setHomeCell:(id)a3
{
  objc_storeWeak((id *)&self->_homeCell, a3);
}

- (HUMosaicLayout)mosaicLayout
{
  return self->_mosaicLayout;
}

- (void)setMosaicLayout:(id)a3
{
  objc_storeStrong((id *)&self->_mosaicLayout, a3);
}

- (void)setMosaicLayoutGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_mosaicLayoutGeometry, a3);
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (BOOL)needsLayoutOptionsUpdate
{
  return self->_needsLayoutOptionsUpdate;
}

- (void)setNeedsLayoutOptionsUpdate:(BOOL)a3
{
  self->_needsLayoutOptionsUpdate = a3;
}

- (HUGridLayoutOptions)singleCellLayoutOptions
{
  return self->_singleCellLayoutOptions;
}

- (void)setSingleCellLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_singleCellLayoutOptions, a3);
}

- (HUGridLayoutOptions)expandedCellLayoutOptions
{
  return self->_expandedCellLayoutOptions;
}

- (void)setExpandedCellLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_expandedCellLayoutOptions, a3);
}

- (HFHomeKitDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (UICollectionViewCell)pressedTile
{
  return (UICollectionViewCell *)objc_loadWeakRetained((id *)&self->_pressedTile);
}

- (void)setPressedTile:(id)a3
{
  objc_storeWeak((id *)&self->_pressedTile, a3);
}

- (BOOL)isBoundsChangeUpdate
{
  return self->_isBoundsChangeUpdate;
}

- (void)setIsBoundsChangeUpdate:(BOOL)a3
{
  self->_isBoundsChangeUpdate = a3;
}

- (BOOL)shouldBlockCurrentUserFromHome
{
  return self->_shouldBlockCurrentUserFromHome;
}

- (void)setShouldBlockCurrentUserFromHome:(BOOL)a3
{
  self->_shouldBlockCurrentUserFromHome = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pressedTile);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_expandedCellLayoutOptions, 0);
  objc_storeStrong((id *)&self->_singleCellLayoutOptions, 0);
  objc_storeStrong((id *)&self->_mosaicLayoutGeometry, 0);
  objc_storeStrong((id *)&self->_mosaicLayout, 0);
  objc_destroyWeak((id *)&self->_homeCell);
  objc_storeStrong((id *)&self->_URLHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)presentAccessoryControlsForItem:(id)a3
{
  id v4;
  HUCCSmartGridViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = HUCCSmartGridViewController.presentAccessoryControls(for:)(v4);

  return v6;
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  HFAccessoryRepresentableItem *v16;
  HFItem *v17;
  HUCCSmartGridViewController *v18;
  uint64_t v19;

  sub_230FEF0A8(&qword_25414D0B0);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  v13 = sub_230FF487C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_255EB1858;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255EB1860;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_230FF33B4((uint64_t)v10, (uint64_t)&unk_255EB1868, (uint64_t)v15);
  swift_release();
}

- (void)willDismissWithViewController:(id)a3
{
  UIViewController *v4;
  HUCCSmartGridViewController *v5;

  v4 = (UIViewController *)a3;
  v5 = self;
  HUCCSmartGridViewController.willDismiss(viewController:)(v4);

}

@end
