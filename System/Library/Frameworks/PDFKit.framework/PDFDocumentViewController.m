@implementation PDFDocumentViewController

- (PDFDocumentViewController)initWithPDFView:(id)a3 pageIndex:(unint64_t)a4 navigationOrientation:(int64_t)a5 withRenderingProperties:(id)a6 andOptions:(id)a7
{
  id v12;
  id v13;
  id v14;
  PDFDocumentViewController *v15;
  PDFDocumentViewControllerPrivate *v16;
  PDFDocumentViewControllerPrivate *v17;
  PDFPageBackgroundManager *v18;
  PDFDocumentViewControllerPrivate *v19;
  PDFPageBackgroundManager *pageBackgroundManager;
  uint64_t v21;
  PDFDocumentViewControllerPrivate *v22;
  NSHashTable *weakPageViewControllers;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v40.receiver = self;
  v40.super_class = (Class)PDFDocumentViewController;
  v15 = -[PDFDocumentViewController initWithTransitionStyle:navigationOrientation:options:](&v40, sel_initWithTransitionStyle_navigationOrientation_options_, 1, a5, v14);
  if (v15)
  {
    v35 = v14;
    v16 = objc_alloc_init(PDFDocumentViewControllerPrivate);
    v17 = v15->_private;
    v15->_private = v16;

    objc_storeWeak((id *)&v15->_private->pdfView, v12);
    objc_storeStrong((id *)&v15->_private->renderingProperties, a6);
    v15->_private->minScale = 0.25;
    v15->_private->maxScale = 5.0;
    v15->_private->displaysRTL = 0;
    v18 = -[PDFPageBackgroundManager initWithDelegate:andRenderingProperties:]([PDFPageBackgroundManager alloc], "initWithDelegate:andRenderingProperties:", v15, v13);
    v19 = v15->_private;
    pageBackgroundManager = v19->pageBackgroundManager;
    v19->pageBackgroundManager = v18;

    v15->_private->weakPageViewControllersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v15->_private;
    weakPageViewControllers = v22->weakPageViewControllers;
    v22->weakPageViewControllers = (NSHashTable *)v21;

    -[PDFDocumentViewController setDelegate:](v15, "setDelegate:", v15);
    -[PDFDocumentViewController setDataSource:](v15, "setDataSource:", v15);
    -[PDFDocumentViewController _setupDocument:](v15, "_setupDocument:", a4);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[PDFDocumentViewController view](v15, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "subviews");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = v31;

            v28 = v32;
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v27);
    }
    else
    {
      v28 = 0;
    }

    objc_msgSend(v28, "_setAutoScrollEnabled:", 0);
    objc_storeWeak((id *)&v15->_private->scrollView, v28);
    objc_msgSend(v28, "setDelegate:", v15);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v15, sel__documentChanged, CFSTR("PDFViewChangedDocument"), v12);

    v14 = v35;
  }

  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PDFPageBackgroundManager cancel](self->_private->pageBackgroundManager, "cancel");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PDFDocumentViewController;
  -[PDFDocumentViewController dealloc](&v4, sel_dealloc);
}

- (id)pageViews
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PDFDocumentViewController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "pageView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "pageView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)goToPage:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  BOOL v16;
  id v17;
  void *v18;
  _BOOL4 v20;
  _QWORD v21[4];
  id v22[2];
  id location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v20 = a5;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "indexForPage:", v6);

  if (v9 != (void *)0x7FFFFFFFFFFFFFFFLL)
  {
    -[PDFDocumentViewController viewControllers](self, "viewControllers");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
        objc_msgSend(v14, "PDFPage");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = v15 == v6;

        if (v16)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v17 = v14;

      if (v17)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

    }
    -[PDFDocumentViewController _pageViewControllerCreate:](self, "_pageViewControllerCreate:", (int)v9);
    v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    objc_initWeak(&location, self);
    v28 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __57__PDFDocumentViewController_goToPage_direction_animated___block_invoke;
    v21[3] = &unk_24C25D068;
    objc_copyWeak(v22, &location);
    v22[1] = v9;
    -[PDFDocumentViewController setViewControllers:direction:animated:completion:](self, "setViewControllers:direction:animated:completion:", v18, a4, v20, v21);

    -[PDFDocumentViewController _updateCurrentPageViewController:](self, "_updateCurrentPageViewController:", v17);
    objc_destroyWeak(v22);
    objc_destroyWeak(&location);

  }
}

void __57__PDFDocumentViewController_goToPage_direction_animated___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (a2 && WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)(*((_QWORD *)WeakRetained + 158) + 8));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("PDFViewVisiblePagesChanged"), v6);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("pageIndex");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PDFDocumentViewControllerChangedPage"), v6, v10);

  }
}

- (id)currentPage
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  objc_msgSend(WeakRetained, "PDFPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAutoScales:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  -[PDFDocumentViewController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAutoScales:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (double)autoScaleFactor
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  objc_msgSend(WeakRetained, "autoScaleFactor");
  v4 = v3;

  return v4;
}

- (void)setMinScaleFactor:(double)a3 withMaxScaleFactor:(double)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  self->_private->minScale = a3;
  self->_private->maxScale = a4;
  -[PDFDocumentViewController viewControllers](self, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setMinScaleFactor:withMaxScaleFactor:", a3, a4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (double)minScaleFactor
{
  return self->_private->minScale;
}

- (double)maxScaleFactor
{
  return self->_private->maxScale;
}

- (void)setScaleFactor:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[PDFDocumentViewController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setScaleFactor:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (double)scaleFactor
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  objc_msgSend(WeakRetained, "scaleFactor");
  v4 = v3;

  return v4;
}

- (void)setSelection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PDFDocumentViewController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setSelection:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)selection
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  objc_msgSend(WeakRetained, "selection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDisplaysRTL:(BOOL)a3
{
  self->_private->displaysRTL = a3;
}

- (void)setScrollViewScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->scrollView);
  objc_msgSend(WeakRetained, "setScrollEnabled:", v3);

}

- (id)scrollView
{
  return objc_loadWeakRetained((id *)&self->_private->scrollView);
}

- (id)pageBackgroundManager
{
  return self->_private->pageBackgroundManager;
}

- (void)updateScrollViews
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v4 = objc_msgSend(WeakRetained, "showsScrollIndicators");

  -[PDFDocumentViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", v4);

  -[PDFDocumentViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", v4);

  -[PDFDocumentViewController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "scrollView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setShowsVerticalScrollIndicator:", v4);

        objc_msgSend(v12, "scrollView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setShowsHorizontalScrollIndicator:", v4);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)willForceUpdate
{
  -[PDFPageBackgroundManager willForceUpdate](self->_private->pageBackgroundManager, "willForceUpdate");
}

- (void)forceUpdateActivePageIndex:(unint64_t)a3 withMaxDuration:(double)a4
{
  -[PDFPageBackgroundManager forceUpdateActivePageIndex:withMaxDuration:](self->_private->pageBackgroundManager, "forceUpdateActivePageIndex:withMaxDuration:", a3, a4);
}

- (id)pageForPoint:(CGPoint)a3 nearest:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  _BOOL8 v29;
  id v30;
  unint64_t v31;
  void *v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat MidY;
  double v42;
  id v43;
  id v44;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CGPoint v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v53 = *MEMORY[0x24BDAC8D0];
  -[PDFDocumentViewController viewControllers](self, "viewControllers");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v8)
  {
    v9 = v8;
    v46 = 0;
    v10 = *(_QWORD *)v49;
    v11 = 1.79769313e308;
    v12 = 0x2545AF000uLL;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v14, "pageView", v46);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "PDFPage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained(*(id **)((char *)&self->super.super.super.super.isa + *(int *)(v12 + 3060)) + 1);
        v18 = PDFRectToCGRect(objc_msgSend(v16, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox")));
        v20 = v19;
        v22 = v21;
        v24 = v23;
        -[PDFDocumentViewController convertPoint:toPage:](self, "convertPoint:toPage:", v16, x, y);
        v54.x = PDFPointToCGPoint(v25, v26);
        v54.y = v27;
        v55.origin.x = v18;
        v55.origin.y = v20;
        v55.size.width = v22;
        v55.size.height = v24;
        if (CGRectContainsPoint(v55, v54))
        {

          v44 = v46;
          goto LABEL_17;
        }
        if (v4)
        {
          v28 = v10;
          v29 = v4;
          v30 = v7;
          v31 = v12;
          -[PDFDocumentViewController view](self, "view");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "bounds");
          v33 = PDFRectToCGRect(objc_msgSend(v32, "convertRect:fromView:", v15));
          v35 = v34;
          v37 = v36;
          v39 = v38;

          v56.origin.x = v33;
          v56.origin.y = v35;
          v56.size.width = v37;
          v56.size.height = v39;
          v40 = x - CGRectGetMidX(v56);
          v57.origin.x = v33;
          v57.origin.y = v35;
          v57.size.width = v37;
          v57.size.height = v39;
          MidY = CGRectGetMidY(v57);
          v42 = (y - MidY) * (y - MidY) + v40 * v40;
          if (v42 < v11)
          {
            v43 = v16;

            v46 = v43;
            v11 = v42;
          }
          v12 = v31;
          v7 = v30;
          v4 = v29;
          v10 = v28;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v46 = 0;
  }

  v44 = v46;
  v16 = v44;
LABEL_17:

  return v16;
}

- (CGPoint)convertPoint:(CGPoint)a3 toPage:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  objc_msgSend(WeakRetained, "PDFPage");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    -[PDFDocumentViewController _convertPoint:toPDFPageViewController:](self, "_convertPoint:toPDFPageViewController:", WeakRetained, x, y);
    v17 = v21;
    v18 = v22;
  }
  else
  {
    -[PDFDocumentViewController viewControllers](self, "viewControllers");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v15, "PDFPage", (_QWORD)v25);
          v16 = (id)objc_claimAutoreleasedReturnValue();

          if (v16 == v7)
          {
            -[PDFDocumentViewController _convertPoint:toPDFPageViewController:](self, "_convertPoint:toPDFPageViewController:", v15, x, y);
            v17 = v19;
            v18 = v20;

            goto LABEL_13;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v12)
          continue;
        break;
      }
    }

    v17 = *MEMORY[0x24BDBEFB0];
    v18 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
LABEL_13:

  v23 = v17;
  v24 = v18;
  result.y = v24;
  result.x = v23;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 toPDFPageViewController:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id WeakRetained;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  uint64_t v31;
  float64x2_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  float64x2_t v46;
  double v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = PDFPointToCGPoint(x, y);
  v10 = v9;
  objc_msgSend(v7, "PDFPage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDFDocumentViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertPoint:toView:", v12, v8, v10);
  v47 = v14;
  v16 = v15;

  objc_msgSend(v12, "bounds");
  v45 = v17 - v16;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(v11, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));
  v43 = v19;
  v44 = v20;
  v22 = v21;
  v24 = v23;

  v26 = *MEMORY[0x24BDBD8B8];
  v25 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
  v28 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
  v27 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
  v30 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
  v29 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
  v31 = objc_msgSend(v11, "rotation");
  v32.f64[0] = v47;
  v32.f64[1] = v45;
  if (v31 > 179)
  {
    if (v31 == 180)
    {
      v46 = v32;
      v37 = PDFDegToRad(180.0);
      v48.a = v26;
      v48.b = v25;
      v48.c = v28;
      v48.d = v27;
      v48.tx = v30;
      v48.ty = v29;
      CGAffineTransformRotate(&v49, &v48, v37);
      v35 = -v22 - v43;
      v34 = -v24 - v44;
      v48 = v49;
      goto LABEL_10;
    }
    if (v31 == 270)
    {
      v46 = v32;
      v36 = PDFDegToRad(270.0);
      v48.a = v26;
      v48.b = v25;
      v48.c = v28;
      v48.d = v27;
      v48.tx = v30;
      v48.ty = v29;
      CGAffineTransformRotate(&v49, &v48, v36);
      v35 = -v24 - v44;
      v48 = v49;
      v34 = v43;
      goto LABEL_10;
    }
  }
  else
  {
    if (!v31)
    {
      v48.a = v26;
      v48.b = v25;
      v48.c = v28;
      v48.d = v27;
      v48.tx = v30;
      v48.ty = v29;
      v46 = v32;
      v35 = v43;
      v34 = v44;
      goto LABEL_10;
    }
    if (v31 == 90)
    {
      v46 = v32;
      v33 = PDFDegToRad(90.0);
      v48.a = v26;
      v48.b = v25;
      v48.c = v28;
      v48.d = v27;
      v48.tx = v30;
      v48.ty = v29;
      CGAffineTransformRotate(&v49, &v48, v33);
      v34 = -v22 - v43;
      v48 = v49;
      v35 = v44;
LABEL_10:
      CGAffineTransformTranslate(&v49, &v48, v35, v34);
      v32 = vaddq_f64(*(float64x2_t *)&v49.tx, vmlaq_n_f64(vmulq_laneq_f64(*(float64x2_t *)&v49.c, v46, 1), *(float64x2_t *)&v49.a, v47));
    }
  }
  v38 = PDFPointFromCGPoint(v32.f64[0], v32.f64[1]);
  v40 = v39;

  v41 = v38;
  v42 = v40;
  result.y = v42;
  result.x = v41;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromPage:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  objc_msgSend(WeakRetained, "PDFPage");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    -[PDFDocumentViewController _convertPoint:fromPDFPageViewController:](self, "_convertPoint:fromPDFPageViewController:", WeakRetained, x, y);
    v17 = v21;
    v18 = v22;
  }
  else
  {
    -[PDFDocumentViewController viewControllers](self, "viewControllers");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v15, "PDFPage", (_QWORD)v25);
          v16 = (id)objc_claimAutoreleasedReturnValue();

          if (v16 == v7)
          {
            -[PDFDocumentViewController _convertPoint:fromPDFPageViewController:](self, "_convertPoint:fromPDFPageViewController:", v15, x, y);
            v17 = v19;
            v18 = v20;

            goto LABEL_13;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v12)
          continue;
        break;
      }
    }

    v17 = *MEMORY[0x24BDBEFB0];
    v18 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
LABEL_13:

  v23 = v17;
  v24 = v18;
  result.y = v24;
  result.x = v23;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromPDFPageViewController:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  void *v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  float64x2_t v25;
  CGFloat tx;
  CGFloat ty;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  __int128 v43;
  __int128 v44;
  double v45;
  float64_t v46;
  float64x2_t v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v45 = PDFPointToCGPoint(x, y);
  v46 = v8;
  objc_msgSend(v7, "PDFPage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(v9, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = objc_msgSend(v9, "rotation");
  v20 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
  v22 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
  v21 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
  v24 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
  v23 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
  v25.f64[0] = v45;
  v25.f64[1] = v46;
  v47 = v25;
  if (v19 > 179)
  {
    if (v19 == 180)
    {
      v48.a = *(CGFloat *)MEMORY[0x24BDBD8B8];
      v48.b = v20;
      v48.c = v22;
      v48.d = v21;
      v48.tx = v24;
      v48.ty = v23;
      CGAffineTransformTranslate(&v49, &v48, v16 + v12, v18 + v14);
      v44 = *(_OWORD *)&v49.a;
      v43 = *(_OWORD *)&v49.c;
      tx = v49.tx;
      ty = v49.ty;
      v28 = 180.0;
      goto LABEL_10;
    }
    if (v19 == 270)
    {
      v48.a = *(CGFloat *)MEMORY[0x24BDBD8B8];
      v48.b = v20;
      v48.c = v22;
      v48.d = v21;
      v48.tx = v24;
      v48.ty = v23;
      CGAffineTransformTranslate(&v49, &v48, v18 + v14, -v12);
      v44 = *(_OWORD *)&v49.a;
      v43 = *(_OWORD *)&v49.c;
      tx = v49.tx;
      ty = v49.ty;
      v28 = 90.0;
      goto LABEL_10;
    }
  }
  else
  {
    if (!v19)
    {
      v48.a = *(CGFloat *)MEMORY[0x24BDBD8B8];
      v48.b = v20;
      v48.c = v22;
      v48.d = v21;
      v48.tx = v24;
      v48.ty = v23;
      CGAffineTransformTranslate(&v49, &v48, -v12, -v14);
LABEL_11:
      v47 = vaddq_f64(*(float64x2_t *)&v49.tx, vmlaq_n_f64(vmulq_laneq_f64(*(float64x2_t *)&v49.c, v47, 1), *(float64x2_t *)&v49.a, v45));
      goto LABEL_12;
    }
    if (v19 == 90)
    {
      v48.a = *(CGFloat *)MEMORY[0x24BDBD8B8];
      v48.b = v20;
      v48.c = v22;
      v48.d = v21;
      v48.tx = v24;
      v48.ty = v23;
      CGAffineTransformTranslate(&v49, &v48, -v14, v16 + v12);
      v44 = *(_OWORD *)&v49.a;
      v43 = *(_OWORD *)&v49.c;
      tx = v49.tx;
      ty = v49.ty;
      v28 = 270.0;
LABEL_10:
      v29 = PDFDegToRad(v28);
      *(_OWORD *)&v48.a = v44;
      *(_OWORD *)&v48.c = v43;
      v48.tx = tx;
      v48.ty = ty;
      CGAffineTransformRotate(&v49, &v48, v29);
      goto LABEL_11;
    }
  }
LABEL_12:
  objc_msgSend(v7, "pageView", v43, v44);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v31 - v47.f64[1];
  -[PDFDocumentViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "convertPoint:fromView:", v30, v47.f64[0], v32);
  v35 = v34;
  v37 = v36;

  v38 = PDFPointFromCGPoint(v35, v37);
  v40 = v39;

  v41 = v38;
  v42 = v40;
  result.y = v42;
  result.x = v41;
  return result;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "firstObject", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFDocumentViewController _updateCurrentPageViewController:](self, "_updateCurrentPageViewController:", v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("PDFViewVisiblePagesChanged"), WeakRetained);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuWillChangeScrollPosition"), WeakRetained);

  os_unfair_lock_lock(&self->_private->weakPageViewControllersLock);
  -[NSHashTable addObject:](self->_private->weakPageViewControllers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_private->weakPageViewControllersLock);

}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  _BOOL4 v7;
  id v9;
  id WeakRetained;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const __CFString *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v7 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (a6)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v15), "pageView", (_QWORD)v26);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "clearTiles");

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v13);
    }

    objc_msgSend(WeakRetained, "clearSelection");
  }
  else
  {
    objc_msgSend(v9, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFDocumentViewController _updateCurrentPageViewController:](self, "_updateCurrentPageViewController:", v17);

  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuDidChangeScrollPosition"), WeakRetained);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", (_QWORD)v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postNotificationName:object:", CFSTR("PDFViewVisiblePagesChanged"), WeakRetained);

  objc_msgSend(WeakRetained, "document");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFDocumentViewController currentPage](self, "currentPage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "indexForPage:", v21);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = CFSTR("pageIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "postNotificationName:object:userInfo:", CFSTR("PDFDocumentViewControllerChangedPage"), WeakRetained, v25);

}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  uint64_t v5;

  if (self->_private->displaysRTL)
    v5 = 1;
  else
    v5 = 0xFFFFFFFFLL;
  return -[PDFDocumentViewController _pageViewController:nextViewController:forViewController:](self, "_pageViewController:nextViewController:forViewController:", a3, v5, a4);
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  uint64_t v5;

  if (self->_private->displaysRTL)
    v5 = 0xFFFFFFFFLL;
  else
    v5 = 1;
  return -[PDFDocumentViewController _pageViewController:nextViewController:forViewController:](self, "_pageViewController:nextViewController:forViewController:", a3, v5, a4);
}

- (id)document
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasBackgroundImage
{
  return 0;
}

- (void)viewWillLayoutSubviews
{
  id WeakRetained;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)PDFDocumentViewController;
  -[PDFDocumentViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v4 = objc_msgSend(WeakRetained, "autoScales");

  if (v4)
  {
    -[PDFDocumentViewController viewControllers](self, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "enforceAutoScaleFactor");
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  objc_msgSend(WeakRetained, "pageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsTilesUpdate");

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  objc_msgSend(WeakRetained, "pageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsTilesUpdate");

}

- (void)_setupDocument:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[PDFDocumentViewController document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    if (objc_msgSend(v5, "isLocked"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__documentWasUnlocked, CFSTR("PDFDocumentDidUnlock"), v7);

    }
    else if (objc_msgSend(v7, "pageCount"))
    {
      -[PDFDocumentViewController _loadDocument:](self, "_loadDocument:", a3);
    }
    objc_msgSend(v7, "setPageChangeDelegate:", self);
    v5 = v7;
  }

}

- (void)_loadDocument:(unint64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[PDFDocumentViewController _pageViewControllerCreate:](self, "_pageViewControllerCreate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_private->activePageView, v5);
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFDocumentViewController setViewControllers:direction:animated:completion:](self, "setViewControllers:direction:animated:completion:", v6, 0, 0, 0);

  -[NSHashTable addObject:](self->_private->weakPageViewControllers, "addObject:", v5);
  -[PDFPageBackgroundManager updateActivePageIndex:](self->_private->pageBackgroundManager, "updateActivePageIndex:", a3);

}

- (void)_documentWasUnlocked
{
  -[PDFDocumentViewController _loadDocument:](self, "_loadDocument:", 0);
}

- (void)_documentChanged
{
  -[PDFDocumentViewController _setupDocument:](self, "_setupDocument:", 0);
}

- (id)_pageViewController:(id)a3 nextViewController:(int)a4 forViewController:(id)a5
{
  PDFView **p_pdfView;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  p_pdfView = &self->_private->pdfView;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_pdfView);
  objc_msgSend(v8, "PDFPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "pageCount");
  v13 = 0;
  v14 = objc_msgSend(v11, "indexForPage:", v10) + a4;
  if ((int)v14 >= 0 && (int)v14 < v12)
  {
    -[PDFDocumentViewController findPageViewControllerForPageIndex:](self, "findPageViewControllerForPageIndex:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      -[PDFDocumentViewController _pageViewControllerCreate:](self, "_pageViewControllerCreate:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13;
}

- (id)_pageViewControllerCreate:(unint64_t)a3
{
  PDFPageViewController *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v14;

  v5 = objc_alloc_init(PDFPageViewController);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  -[PDFPageViewController setRenderingProperties:](v5, "setRenderingProperties:", self->_private->renderingProperties);
  -[PDFPageViewController setPDFView:](v5, "setPDFView:", WeakRetained);
  objc_msgSend(WeakRetained, "pageBreakMargins");
  -[PDFPageViewController setPageBreakMargins:](v5, "setPageBreakMargins:");
  objc_msgSend(WeakRetained, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pageAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFPageViewController setPDFPage:](v5, "setPDFPage:", v8);

  v9 = objc_msgSend(WeakRetained, "showsScrollIndicators");
  -[PDFPageViewController scrollView](v5, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShowsVerticalScrollIndicator:", v9);

  -[PDFPageViewController scrollView](v5, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsHorizontalScrollIndicator:", v9);

  -[PDFPageViewController setMinScaleFactor:withMaxScaleFactor:](v5, "setMinScaleFactor:withMaxScaleFactor:", self->_private->minScale, self->_private->maxScale);
  v14 = 0;
  -[PDFPageBackgroundManager backgroundImageForPageIndex:withFoundQuality:](self->_private->pageBackgroundManager, "backgroundImageForPageIndex:withFoundQuality:", a3, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (-[PDFPageBackgroundManager forceUpdateActivePageIndex:withMaxDuration:](self->_private->pageBackgroundManager, "forceUpdateActivePageIndex:withMaxDuration:", a3, 0.0166666667), -[PDFPageBackgroundManager backgroundImageForPageIndex:withFoundQuality:](self->_private->pageBackgroundManager, "backgroundImageForPageIndex:withFoundQuality:", a3, &v14), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[PDFPageViewController setBackgroundImage:atBackgroundQuality:](v5, "setBackgroundImage:atBackgroundQuality:", v12, v14);

  }
  return v5;
}

- (id)findPageViewControllerForPageIndex:(int64_t)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id WeakRetained;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  -[PDFDocumentViewController viewControllers](self, "viewControllers");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "PDFPage");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(WeakRetained, "document");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "PDFPage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "indexForPage:", v14);

          if (v15 == a3)
          {
            v16 = v10;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (void)_updateCurrentPageViewController:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v6 = v4;
  objc_storeWeak((id *)&self->_private->activePageView, v6);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("PDFViewChangedPage"), WeakRetained);

  objc_msgSend(WeakRetained, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PDFPage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexForPage:", v9);

  v13 = 0;
  -[PDFPageBackgroundManager backgroundImageForPageIndex:withFoundQuality:](self->_private->pageBackgroundManager, "backgroundImageForPageIndex:withFoundQuality:", v10, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v6, "setBackgroundImage:atBackgroundQuality:", v11, v13);
  objc_msgSend(v6, "pageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsTilesUpdate");

}

- (id)backgroundImageForPage:(id)a3 withQuality:(int *)a4
{
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock(&self->_private->weakPageViewControllersLock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_private->weakPageViewControllers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "pageView", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "page");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (v14 == v6)
          {
            v15 = objc_msgSend(v13, "hasBackgroundImage");

            if (v15)
            {
              *a4 = objc_msgSend(v13, "backgroundImageQuality");
              objc_msgSend(v13, "backgroundImage");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_14;
            }
          }
          else
          {

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_14:

  os_unfair_lock_unlock(&self->_private->weakPageViewControllersLock);
  return v16;
}

- (void)recieveBackgroundImage:(id)a3 atBackgroundQuality:(int)a4 forPage:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  PDFDocumentViewController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  os_unfair_lock_lock(&self->_private->weakPageViewControllersLock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = self;
  v10 = self->_private->weakPageViewControllers;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "pageView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "page");
          v17 = (id)objc_claimAutoreleasedReturnValue();

          if (v17 == v9)
            objc_msgSend(v16, "setBackgroundImage:atBackgroundQuality:", v8, v6);
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  os_unfair_lock_unlock(&v18->_private->weakPageViewControllersLock);
}

- (void)didInsertPage:(id)a3 atIndex:(unint64_t)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activePageView);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = WeakRetained;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFDocumentViewController setViewControllers:direction:animated:completion:](self, "setViewControllers:direction:animated:completion:", v7, 0, 0, 0);

  }
}

- (void)didRemovePage:(id)a3 atIndex:(unint64_t)a4
{
  id WeakRetained;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v7 = objc_loadWeakRetained((id *)&self->_private->activePageView);
  if (v7)
  {
    objc_msgSend(WeakRetained, "document");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "pageCount") > a4)
    {
      objc_msgSend(v8, "pageAtIndex:", a4);

    }
    if (v9)
      -[PDFDocumentViewController goToPage:direction:animated:](self, "goToPage:direction:animated:", v9, 0, 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
