@implementation PDFPageViewController

- (void)setRenderingProperties:(id)a3
{
  objc_storeStrong((id *)&self->_private->renderingProperties, a3);
}

- (void)setPDFView:(id)a3
{
  objc_storeWeak((id *)&self->_private->pdfView, a3);
}

- (void)setPageBreakMargins:(UIEdgeInsets)a3
{
  self->_private->pageMargins = a3;
}

- (void)setPDFPage:(id)a3
{
  objc_storeStrong((id *)&self->_private->page, a3);
}

- (id)PDFPage
{
  return self->_private->page;
}

- (id)pageView
{
  return self->_private->pageView;
}

- (id)scrollView
{
  return self->_private->scrollView;
}

- (id)textInputView
{
  return self->_private->pageViewContainerView;
}

- (void)setAutoScales:(BOOL)a3
{
  if (a3)
    -[PDFPageViewController enforceAutoScaleFactor](self, "enforceAutoScaleFactor");
}

- (void)enforceAutoScaleFactor
{
  double v3;
  double v4;
  PDFPageViewControllerPrivate *v5;

  -[PDFPageViewController autoScaleFactor](self, "autoScaleFactor");
  v4 = v3;
  v5 = self->_private;
  if (v5->minScale > v3)
  {
    v5->minScale = v3;
    -[UIScrollView setMinimumZoomScale:](self->_private->scrollView, "setMinimumZoomScale:", v3);
    v5 = self->_private;
  }
  if (v5->maxScale < v4)
  {
    v5->maxScale = v4;
    -[UIScrollView setMaximumZoomScale:](self->_private->scrollView, "setMaximumZoomScale:", v4);
    v5 = self->_private;
  }
  -[UIScrollView setZoomScale:](v5->scrollView, "setZoomScale:", v4);
}

- (void)setMinScaleFactor:(double)a3 withMaxScaleFactor:(double)a4
{
  id WeakRetained;
  UIScrollView *scrollView;
  double v9;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (WeakRetained)
  {
    self->_private->minScale = a3;
    self->_private->maxScale = a4;
    v11 = WeakRetained;
    -[UIScrollView setMinimumZoomScale:](self->_private->scrollView, "setMinimumZoomScale:", a3);
    -[UIScrollView setMaximumZoomScale:](self->_private->scrollView, "setMaximumZoomScale:", a4);
    if (objc_msgSend(v11, "autoScales"))
    {
      scrollView = self->_private->scrollView;
      if (scrollView)
      {
        -[UIScrollView zoomScale](scrollView, "zoomScale");
        if (v9 < a3 || v9 > a4)
          objc_msgSend(v11, "setAutoScales:", 0);
      }
    }
    -[UIScrollView zoomScale](self->_private->scrollView, "zoomScale");
    -[PDFPageViewController setScaleFactor:](self, "setScaleFactor:");
    WeakRetained = v11;
  }

}

- (void)setScaleFactor:(double)a3
{
  id WeakRetained;
  double v6;
  UIScrollView *scrollView;
  double v8;
  double v9;
  double v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v6 = CGFloatClamp(a3, self->_private->minScale, self->_private->maxScale);
    if (objc_msgSend(v11, "autoScales"))
    {
      scrollView = self->_private->scrollView;
      if (scrollView)
      {
        -[UIScrollView zoomScale](scrollView, "zoomScale");
        v9 = v8;
        -[PDFPageViewController autoScaleFactor](self, "autoScaleFactor");
        if (vabdd_f64(v10, v9) > 0.001)
          objc_msgSend(v11, "setAutoScales:", 0);
      }
    }
    -[UIScrollView setZoomScale:](self->_private->scrollView, "setZoomScale:", v6);
    WeakRetained = v11;
  }

}

- (double)scaleFactor
{
  double result;

  -[UIScrollView zoomScale](self->_private->scrollView, "zoomScale");
  return result;
}

- (double)autoScaleFactor
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PDFPageViewControllerPrivate *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    -[PDFPage boundsForBox:](self->_private->page, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));
    PDFRectRotate(-[PDFPage rotation](self->_private->page, "rotation"), v5, v6);
    v8 = v7;
    v10 = v9;
    v11 = PDFPointMake(0.0, 0.0);
    v13 = v12;
    v14 = self->_private;
    v15 = v8 + v14->pageMargins.left + v14->pageMargins.right;
    v16 = v10 + v14->pageMargins.top + v14->pageMargins.bottom;
    objc_msgSend(v4, "bounds");
    v21 = PDFScaleRectToRect(v11, v13, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    v21 = 1.0;
  }

  return v21;
}

- (void)setSelection:(id)a3
{
  -[PDFTextInputView setSelection:](self->_private->pageViewContainerView, "setSelection:", a3);
}

- (id)selection
{
  return -[PDFTextInputView selection](self->_private->pageViewContainerView, "selection");
}

- (void)setBackgroundImage:(id)a3 atBackgroundQuality:(int)a4
{
  id v7;
  PDFPageViewControllerPrivate *v8;
  PDFPageView *pageView;
  id v10;

  v7 = a3;
  v8 = self->_private;
  pageView = v8->pageView;
  v10 = v7;
  if (pageView)
  {
    -[PDFPageView setBackgroundImage:atBackgroundQuality:](pageView, "setBackgroundImage:atBackgroundQuality:");
  }
  else
  {
    objc_storeStrong((id *)&v8->backgroundImage, a3);
    self->_private->backgroundQuality = a4;
  }

}

- (PDFPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PDFPageViewController *v4;
  PDFPageViewControllerPrivate *v5;
  PDFPageViewControllerPrivate *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDFPageViewController;
  v4 = -[PDFPageViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
  {
    v5 = objc_alloc_init(PDFPageViewControllerPrivate);
    v6 = v4->_private;
    v4->_private = v5;

    v4->_private->minScale = 0.25;
    v4->_private->maxScale = 5.0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[PDFPageViewController _removePDFView](self, "_removePDFView");
  v3.receiver = self;
  v3.super_class = (Class)PDFPageViewController;
  -[PDFPageViewController dealloc](&v3, sel_dealloc);
}

- (void)removeAKOverlay
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  PDFPageView *v6;

  v6 = self->_private->pageView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (v6)
  {
    -[PDFPage document](self->_private->page, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexForPage:", self->_private->page);

    objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 2, v6, v5);
    objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 3, v6, v5);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDFPageViewController;
  -[PDFPageViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (self->_private->page)
  {
    -[PDFPageViewController _buildPDFPageView](self, "_buildPDFPageView");
    -[PDFPageView setEnableTileUpdates:](self->_private->pageView, "setEnableTileUpdates:", 1);
    -[PDFPageView setNeedsTilesUpdate](self->_private->pageView, "setNeedsTilesUpdate");
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
    objc_msgSend(WeakRetained, "currentSelection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setCurrentSelection:", v5);

    -[PDFPage document](self->_private->page, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexForPage:", self->_private->page);

    objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 0, self->_private->pageView, v7);
    objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 1, self->_private->pageView, v7);
    -[PDFPageViewController _updateAnnotations](self, "_updateAnnotations");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewController;
  -[PDFPageViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PDFPageView setEnableTileUpdates:](self->_private->pageView, "setEnableTileUpdates:", 1);
  -[PDFPageView setNeedsTilesUpdate](self->_private->pageView, "setNeedsTilesUpdate");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewController;
  -[PDFPageViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PDFPageView setEnableTileUpdates:](self->_private->pageView, "setEnableTileUpdates:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewController;
  -[PDFPageViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PDFPage setView:](self->_private->page, "setView:", 0);
  -[PDFPageViewController removeAKOverlay](self, "removeAKOverlay");
  -[PDFPageView setBackgroundImage:atBackgroundQuality:](self->_private->pageView, "setBackgroundImage:atBackgroundQuality:", 0, 2);
}

- (void)viewWillLayoutSubviews
{
  id WeakRetained;
  int v4;
  UIScrollView *scrollView;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFPageViewController;
  -[PDFPageViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v4 = objc_msgSend(WeakRetained, "autoScales");

  if (v4)
    -[PDFPageViewController enforceAutoScaleFactor](self, "enforceAutoScaleFactor");
  scrollView = self->_private->scrollView;
  -[PDFPageViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[UIScrollView setFrame:](scrollView, "setFrame:");

  -[PDFPageViewController _centerAlign](self, "_centerAlign");
}

- (void)_buildPDFPageView
{
  id WeakRetained;
  id v4;
  PDFPageView *v5;
  PDFPageViewControllerPrivate *v6;
  PDFPageView *pageView;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  PDFPageViewControllerPrivate *v25;
  UIScrollView *scrollView;
  PDFTextInputView *v27;
  PDFPageViewControllerPrivate *v28;
  PDFTextInputView *pageViewContainerView;
  PDFPageViewControllerPrivate *v30;
  PDFTextInputView *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  -[PDFPage setView:](self->_private->page, "setView:", WeakRetained);
  if (self->_private->pageView)
  {
    -[PDFPageViewController enforceAutoScaleFactor](self, "enforceAutoScaleFactor");
    -[PDFPageView setBackgroundImage:atBackgroundQuality:](self->_private->pageView, "setBackgroundImage:atBackgroundQuality:", self->_private->backgroundImage, self->_private->backgroundQuality);
  }
  else
  {
    v4 = WeakRetained;
    v5 = -[PDFPageView initWithPage:geometryInterface:andRenderingProperties:]([PDFPageView alloc], "initWithPage:geometryInterface:andRenderingProperties:", self->_private->page, v4, self->_private->renderingProperties);
    v6 = self->_private;
    pageView = v6->pageView;
    v6->pageView = v5;

    -[PDFPage boundsForBox:](self->_private->page, "boundsForBox:", objc_msgSend(v4, "displayBox"));
    PDFRectRotate(-[PDFPage rotation](self->_private->page, "rotation"), v8, v9);
    v11 = v10;
    v13 = v12;
    -[PDFPageView setFrame:](self->_private->pageView, "setFrame:", PDFPointMake(0.0, 0.0));
    v36 = v4;
    objc_msgSend(v4, "highlightedSelections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v19, "pages");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsObject:", self->_private->page);

          if (v21)
            -[PDFPageView addSearchSelection:](self->_private->pageView, "addSearchSelection:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v16);
    }
    v22 = objc_alloc(MEMORY[0x24BDF6D50]);
    -[PDFPageViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v24 = objc_msgSend(v22, "initWithFrame:");
    v25 = self->_private;
    scrollView = v25->scrollView;
    v25->scrollView = (UIScrollView *)v24;

    -[UIScrollView setDelegate:](self->_private->scrollView, "setDelegate:", self);
    -[UIScrollView _setAutoScrollEnabled:](self->_private->scrollView, "_setAutoScrollEnabled:", 0);
    -[UIScrollView setContentSize:](self->_private->scrollView, "setContentSize:", v11, v13);
    -[UIScrollView setMinimumZoomScale:](self->_private->scrollView, "setMinimumZoomScale:", self->_private->minScale);
    -[UIScrollView setMaximumZoomScale:](self->_private->scrollView, "setMaximumZoomScale:", self->_private->maxScale);
    v27 = -[PDFTextInputView initWithDelegate:]([PDFTextInputView alloc], "initWithDelegate:", self);
    v28 = self->_private;
    pageViewContainerView = v28->pageViewContainerView;
    v28->pageViewContainerView = v27;

    v30 = self->_private;
    v31 = v30->pageViewContainerView;
    -[PDFPageView frame](v30->pageView, "frame");
    -[PDFTextInputView setFrame:](v31, "setFrame:");
    -[PDFTextInputView addSubview:](self->_private->pageViewContainerView, "addSubview:", self->_private->pageView);
    -[PDFPageView setBackgroundImage:atBackgroundQuality:](self->_private->pageView, "setBackgroundImage:atBackgroundQuality:", self->_private->backgroundImage, self->_private->backgroundQuality);
    -[UIScrollView addSubview:](self->_private->scrollView, "addSubview:", self->_private->pageViewContainerView);
    -[PDFPageViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", self->_private->scrollView);

    -[PDFPageViewController _setupGestureRecognizerDependencies](self, "_setupGestureRecognizerDependencies");
    -[PDFPageViewController enforceAutoScaleFactor](self, "enforceAutoScaleFactor");
    -[PDFPageViewController _centerAlign](self, "_centerAlign");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", self, sel_changedBoundsForBoxNotification_, CFSTR("PDFPageChangedBoundsForBox"), self->_private->page);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", self, sel_didRotatePageNotification_, CFSTR("PDFPageDidRotate"), self->_private->page);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", self, sel_didRotatePageNotification_, CFSTR("PDFPageDidChangeBounds"), self->_private->page);

  }
}

- (void)_setupGestureRecognizerDependencies
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "longPressGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIScrollView panGestureRecognizer](self->_private->scrollView, "panGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requireGestureRecognizerToFail:", v3);

  }
  -[PDFTextInputView updateGestureRecognizerDependencies](self->_private->pageViewContainerView, "updateGestureRecognizerDependencies");

}

- (void)_removePDFView
{
  PDFPageView *pageView;
  PDFPageViewControllerPrivate *v4;
  PDFPageView *v5;
  PDFPageViewControllerPrivate *v6;
  UIScrollView *scrollView;

  pageView = self->_private->pageView;
  if (pageView)
  {
    -[PDFPageView removeFromSuperview](pageView, "removeFromSuperview");
    v4 = self->_private;
    v5 = v4->pageView;
    v4->pageView = 0;

    -[UIScrollView removeFromSuperview](self->_private->scrollView, "removeFromSuperview");
    v6 = self->_private;
    scrollView = v6->scrollView;
    v6->scrollView = 0;

  }
}

- (void)_updateAnnotations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[PDFPage annotations](self->_private->page, "annotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
        -[PDFPageView pageLayer](self->_private->pageView, "pageLayer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "convertRectToRootView:fromPageLayer:", v10, 0.0, 0.0, 1.0, 1.0);
        v12 = v11;

        objc_msgSend(v8, "setScaleFactor:", v12);
        -[PDFPageView updateAnnotation:](self->_private->pageView, "updateAnnotation:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (id)pdfView
{
  return objc_loadWeakRetained((id *)&self->_private->pdfView);
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  void *v5;
  id WeakRetained;

  -[PDFPageView setNeedsTilesUpdate](self->_private->pageView, "setNeedsTilesUpdate", a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "setAutoScales:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuWillChangeScrollPosition"), self);

}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  -[PDFPageView setNeedsTilesUpdate](self->_private->pageView, "setNeedsTilesUpdate", a3, a4, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "setAutoScales:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("PDFViewScaleChanged"), WeakRetained);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuWillChangeZoomFactor"), self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuDidChangeScrollPosition"), self);

}

- (void)scrollViewDidZoom:(id)a3
{
  id v4;

  -[PDFPageView setNeedsTilesUpdate](self->_private->pageView, "setNeedsTilesUpdate", a3);
  -[PDFPageViewController _centerAlign](self, "_centerAlign");
  -[PDFPageView updateBookmark](self->_private->pageView, "updateBookmark");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuWillChangeZoomFactor"), 0);

}

- (void)scrollViewDidScroll:(id)a3
{
  -[PDFPageView setNeedsTilesUpdate](self->_private->pageView, "setNeedsTilesUpdate", a3);
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_private->pageViewContainerView;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuWillChangeScrollPosition"), self);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuDidChangeScrollPosition"), self);

}

- (void)changedBoundsForBoxNotification:(id)a3
{
  -[PDFTextInputView updateTextSelectionGraphics](self->_private->pageViewContainerView, "updateTextSelectionGraphics", a3);
}

- (void)didRotatePageNotification:(id)a3
{
  -[PDFTextInputView updateTextSelectionGraphics](self->_private->pageViewContainerView, "updateTextSelectionGraphics", a3);
}

- (void)_centerAlign
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PDFTextInputView *v15;

  v15 = self->_private->pageViewContainerView;
  -[PDFTextInputView center](v15, "center");
  -[UIScrollView bounds](self->_private->scrollView, "bounds");
  v4 = v3;
  -[UIScrollView contentSize](self->_private->scrollView, "contentSize");
  v6 = (v4 - v5) * 0.5;
  if (v6 >= 0.0)
    v7 = v6;
  else
    v7 = 0.0;
  -[UIScrollView contentSize](self->_private->scrollView, "contentSize");
  v9 = v7 + v8 * 0.5;
  -[UIScrollView bounds](self->_private->scrollView, "bounds");
  v11 = v10;
  -[UIScrollView contentSize](self->_private->scrollView, "contentSize");
  if ((v11 - v12) * 0.5 >= 0.0)
    v13 = (v11 - v12) * 0.5;
  else
    v13 = 0.0;
  -[UIScrollView contentSize](self->_private->scrollView, "contentSize");
  -[PDFTextInputView setCenter:](v15, "setCenter:", v9, v13 + v14 * 0.5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
