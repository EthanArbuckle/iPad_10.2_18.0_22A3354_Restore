@implementation PDFView

+ (void)EnableAnnotationKit
{
  SetAKEnabled(1);
}

- (PDFDocument)document
{
  return self->_private->document;
}

- (void)setDocument:(PDFDocument *)document
{
  -[PDFView setDocument:waitDuration:](self, "setDocument:waitDuration:", document, 0.25);
}

- (void)setDocument:(id)a3 withInitialPageIndex:(unint64_t)a4
{
  PDFViewPrivate *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  self->_private->wantsForceUpdate = 0;
  self->_private->blockingWaitDuration = 0.0;
  v6 = self->_private;
  if (v6->isUsingPageViewController)
  {
    -[PDFDocumentViewController willForceUpdate](v6->documentViewController, "willForceUpdate");
    -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "willForceUpdate");

  }
  -[PDFView setDocument:waitDuration:](self, "setDocument:waitDuration:", v9, 0.0);
  objc_msgSend(v9, "pageAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFView goToPage:](self, "goToPage:", v8);

}

- (void)setDocument:(id)a3 waitDuration:(double)a4
{
  PDFDocument *v7;
  PDFViewPrivate *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  PDFViewPrivate *v13;
  OS_dispatch_queue *pagePreloadQueue;
  PDFViewPrivate *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  void *v24;
  void *v25;
  BOOL v26;
  PDFDocument *v27;

  v7 = (PDFDocument *)a3;
  v8 = self->_private;
  if (v8->document == v7)
    goto LABEL_30;
  v27 = v7;
  -[PDFTimer cancel](v8->pageSyncTimer, "cancel");
  -[PDFOverlayViewsController pdfView:willSetDocument:](self->_overlayViewController, "pdfView:willSetDocument:", self, v27);
  -[PDFDocument akDocumentAdaptor](self->_private->document, "akDocumentAdaptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPdfView:", 0);

  objc_storeStrong((id *)&self->_private->document, a3);
  -[PDFDocument setRenderingProperties:](self->_private->document, "setRenderingProperties:", self->_private->renderingProperties);
  -[PDFViewLayout setDocument:](self->_private->viewLayout, "setDocument:", v27);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("PDFViewChangedDocument"), self);

  if (-[PDFDocument isLinearized](v27, "isLinearized")
    && -[PDFDocument hasHighLatencyDataProvider](v27, "hasHighLatencyDataProvider"))
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("LinearizedPagePreload", v11);
    v13 = self->_private;
    pagePreloadQueue = v13->pagePreloadQueue;
    v13->pagePreloadQueue = (OS_dispatch_queue *)v12;

  }
  else
  {
    v15 = self->_private;
    v11 = v15->pagePreloadQueue;
    v15->pagePreloadQueue = 0;
  }

  if (!v27)
  {
    -[PDFView _releaseDocument](self, "_releaseDocument");
    -[PDFView layoutDocumentView](self, "layoutDocumentView");
    -[PDFOverlayViewsController pdfView:didSetDocument:](self->_overlayViewController, "pdfView:didSetDocument:", self, 0);
LABEL_29:
    v7 = v27;
    goto LABEL_30;
  }
  if (GetDefaultsWriteAKEnabled())
  {
    -[PDFView undoManager](self, "undoManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isUndoRegistrationEnabled");
    if (v17)
      objc_msgSend(v16, "disableUndoRegistration");
    -[PDFView _ensureOverlayViewController](self, "_ensureOverlayViewController");
    -[PDFDocument setupAKDocumentAdaptorIfNecessaryWithView:](v27, "setupAKDocumentAdaptorIfNecessaryWithView:", self);
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  if (-[PDFDocument isLocked](v27, "isLocked"))
  {
    if (!-[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView"))
    {
      -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        -[PDFScrollView setDocument:](self->_private->scrollView, "setDocument:", 0);
      -[PDFView _setupPasswordView](self, "_setupPasswordView");
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_documentWasUnlocked, CFSTR("PDFDocumentDidUnlock"), self->_private->document);
  }
  else
  {
    -[PDFView _removePasswordView](self, "_removePasswordView");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObserver:name:object:", self, CFSTR("PDFDocumentDidUnlock"), v27);

    -[PDFScrollView setDocument:](self->_private->scrollView, "setDocument:", v27);
    -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pageBackgroundManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_pageBackgroundManager, v22);

    WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
    -[PDFView setNewPageVisibilityDelegate:withOldDelegate:](self, "setNewPageVisibilityDelegate:withOldDelegate:", WeakRetained, 0);

    if (a4 <= 0.0)
    {
      -[PDFView layoutDocumentView](self, "layoutDocumentView");
    }
    else
    {
      self->_private->wantsForceUpdate = 1;
      self->_private->blockingWaitDuration = a4;
      -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "willForceUpdate");

      -[PDFDocument pageAtIndex:](v27, "pageAtIndex:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFView goToPage:](self, "goToPage:", v25);

    }
    -[PDFView setAutoScales:](self, "setAutoScales:", -[PDFView autoScales](self, "autoScales"));
    if (!-[PDFDocument pageCount](self->_private->document, "pageCount"))
      goto LABEL_25;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("PDFViewChangedPage"), self);
  }

LABEL_25:
  if (v17)
    objc_msgSend(v16, "enableUndoRegistration");
  -[PDFDocument setRenderingProperties:](v27, "setRenderingProperties:", self->_private->renderingProperties);

  -[PDFOverlayViewsController pdfView:didSetDocument:](self->_overlayViewController, "pdfView:didSetDocument:", self, v27);
  v26 = -[PDFDocument isLocked](v27, "isLocked");
  v7 = v27;
  if (!v26)
  {
    -[PDFView performOverlayAdaptorPageVisibilityTrueUpAfterSettingDocument](self, "performOverlayAdaptorPageVisibilityTrueUpAfterSettingDocument");
    goto LABEL_29;
  }
LABEL_30:

}

- (void)_releaseDocument
{
  void *v3;
  void *v4;
  PDFViewPrivate *v5;
  PDFDocument *document;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PDFDocumentDidUnlock"), self->_private->document);

  -[PDFViewLayout setDocument:](self->_private->viewLayout, "setDocument:", 0);
  -[PDFScrollView setDocument:](self->_private->scrollView, "setDocument:", 0);
  -[PDFDocument akDocumentAdaptor](self->_private->document, "akDocumentAdaptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPdfView:", 0);

  v5 = self->_private;
  document = v5->document;
  v5->document = 0;

}

- (BOOL)canGoToFirstPage
{
  return self->_currentPageIndex != 0;
}

- (void)goToFirstPage:(id)sender
{
  void *v4;
  void *v5;
  id v6;

  if (-[PDFView canGoToFirstPage](self, "canGoToFirstPage", sender))
  {
    -[PDFView currentDestination](self, "currentDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView pushDestination:](self, "pushDestination:", v4);

    -[PDFView document](self, "document");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pageAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView goToPageNoPush:](self, "goToPageNoPush:", v5);

  }
}

- (BOOL)canGoToLastPage
{
  unint64_t currentPageIndex;

  currentPageIndex = self->_currentPageIndex;
  return currentPageIndex != -[PDFView lastPageIndex](self, "lastPageIndex");
}

- (void)goToLastPage:(id)sender
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[PDFView canGoToLastPage](self, "canGoToLastPage", sender))
  {
    -[PDFView currentDestination](self, "currentDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView pushDestination:](self, "pushDestination:", v4);

    -[PDFView document](self, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pageAtIndex:", -[PDFView lastPageIndex](self, "lastPageIndex"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v7;
    if (v7)
    {
      -[PDFView goToPageNoPush:](self, "goToPageNoPush:", v7);
      v6 = v7;
    }

  }
}

- (BOOL)canGoToNextPage
{
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  _BOOL4 v7;
  BOOL v8;
  unint64_t currentPageIndex;

  -[PDFView document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PDFView PDFLayout](self, "PDFLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "functionalDisplayMode");

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v6 = -[PDFView lastPageIndex](self, "lastPageIndex");
    v7 = -[PDFView displaysAsBook](self, "displaysAsBook");
    v8 = (v6 & 1) == 0;
    if (!v7)
      v8 = v6;
    currentPageIndex = self->_currentPageIndex + v8;
  }
  else
  {
    currentPageIndex = self->_currentPageIndex;
  }
  return currentPageIndex < -[PDFView lastPageIndex](self, "lastPageIndex");
}

- (void)goToNextPage:(id)sender
{
  void *v4;
  id v5;

  -[PDFView nextPage](self, "nextPage", sender);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PDFView currentDestination](self, "currentDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView pushDestination:](self, "pushDestination:", v4);

    -[PDFView goToPageNoPush:](self, "goToPageNoPush:", v5);
  }

}

- (BOOL)canGoToPreviousPage
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  unint64_t currentPageIndex;

  -[PDFView document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PDFView PDFLayout](self, "PDFLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "functionalDisplayMode");

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v6 = -[PDFView displaysAsBook](self, "displaysAsBook");
    currentPageIndex = self->_currentPageIndex;
    if (!v6)
      return currentPageIndex > 1;
  }
  else
  {
    currentPageIndex = self->_currentPageIndex;
  }
  return currentPageIndex != 0;
}

- (void)goToPreviousPage:(id)sender
{
  void *v4;
  id v5;

  -[PDFView previousPage](self, "previousPage", sender);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PDFView currentDestination](self, "currentDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView pushDestination:](self, "pushDestination:", v4);

    -[PDFView goToPageNoPush:](self, "goToPageNoPush:", v5);
  }

}

- (BOOL)canGoBack
{
  void *v3;

  -[PDFView document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 && self->_private->historyIndex > 0;
}

- (void)goBack:(id)sender
{
  PDFViewPrivate *v4;
  unint64_t historyIndex;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[PDFView canGoBack](self, "canGoBack", sender))
  {
    v4 = self->_private;
    historyIndex = v4->historyIndex;
    if (historyIndex >= -[NSMutableArray count](v4->destinationHistory, "count"))
    {
      -[PDFView currentDestination](self, "currentDestination");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFView pushDestination:](self, "pushDestination:", v6);

      self->_private->historyIndex = -[NSMutableArray count](self->_private->destinationHistory, "count") - 1;
    }
    -[NSMutableArray objectAtIndex:](self->_private->destinationHistory, "objectAtIndex:", --self->_private->historyIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView goToDestinationNoPush:](self, "goToDestinationNoPush:", v7);

    objc_msgSend(MEMORY[0x24BDD16D8], "defaultQueue");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("PDFViewChangedHistory"), self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enqueueNotification:postingStyle:", v8, 1);

  }
}

- (BOOL)canGoForward
{
  void *v3;
  PDFViewPrivate *v4;
  unint64_t v5;

  -[PDFView document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = self->_private;
  v5 = v4->historyIndex + 1;
  return v5 < -[NSMutableArray count](v4->destinationHistory, "count");
}

- (void)goForward:(id)sender
{
  void *v4;
  void *v5;
  id v6;

  if (-[PDFView canGoForward](self, "canGoForward", sender))
  {
    -[NSMutableArray objectAtIndex:](self->_private->destinationHistory, "objectAtIndex:", ++self->_private->historyIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView goToDestinationNoPush:](self, "goToDestinationNoPush:", v4);

    objc_msgSend(MEMORY[0x24BDD16D8], "defaultQueue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("PDFViewChangedHistory"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enqueueNotification:postingStyle:", v5, 1);

  }
}

- (PDFPage)currentPage
{
  void *v3;

  v3 = -[PDFDocument pageCount](self->_private->document, "pageCount");
  if (v3)
  {
    -[PDFDocument pageAtIndex:](self->_private->document, "pageAtIndex:", self->_currentPageIndex);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PDFPage *)v3;
}

- (void)setCurrentPageIndex:(unint64_t)a3 withNotification:(BOOL)a4
{
  _BOOL4 v4;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  if (self->_currentPageIndex != a3)
  {
    v4 = a4;
    self->_currentPageIndex = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_pageBackgroundManager);
    objc_msgSend(WeakRetained, "updateActivePageIndex:", self->_currentPageIndex);

    if (self->_private->pagePreloadQueue)
    {
      -[PDFView document](self, "document");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "preloadDataOfPagesInRange:onQueue:completion:", self->_currentPageIndex + 1, 3, self->_private->pagePreloadQueue, 0);

    }
    -[PDFView _getDocumentAKController](self, "_getDocumentAKController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentPageIndex:", self->_currentPageIndex);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("PDFViewChangedPage"), self);

    }
  }
}

- (void)goToPage:(PDFPage *)page
{
  -[PDFView _goToPage:animated:withBackgroundUpdate:](self, "_goToPage:animated:withBackgroundUpdate:", page, 0, 1);
}

- (void)goToPage:(id)a3 animated:(BOOL)a4
{
  -[PDFView _goToPage:animated:withBackgroundUpdate:](self, "_goToPage:animated:withBackgroundUpdate:", a3, a4, 1);
}

- (void)goToPageWithoutBackgroundUpdate:(id)a3
{
  -[PDFView _goToPage:animated:withBackgroundUpdate:](self, "_goToPage:animated:withBackgroundUpdate:", a3, 0, 0);
}

- (void)_goToPage:(id)a3 animated:(BOOL)a4 withBackgroundUpdate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  PDFViewPrivate *v14;
  _BOOL4 isUsingPageViewController;
  PDFViewPrivate *v16;
  void *v17;
  id v18;
  void *v19;
  PDFViewPrivate *v20;
  PDFPage *toPage;
  id v22;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  if (v9)
  {
    v22 = v9;
    -[PDFView PDFLayout](self, "PDFLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "functionalDisplayMode");

    if (v5 && ((v11 & 1) == 0 || self->_private->wantsForceUpdate))
    {
      objc_msgSend(v22, "document");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "indexForPage:", v22);

      v14 = self->_private;
      isUsingPageViewController = v14->isUsingPageViewController;
      v14->wantsForceUpdate = 0;
      v16 = self->_private;
      if (isUsingPageViewController)
      {
        -[PDFDocumentViewController forceUpdateActivePageIndex:withMaxDuration:](v16->documentViewController, "forceUpdateActivePageIndex:withMaxDuration:", v13, v16->blockingWaitDuration);
      }
      else
      {
        -[PDFScrollView pdfDocumentView](v16->scrollView, "pdfDocumentView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "forceUpdateActivePageIndex:withMaxDuration:", v13, self->_private->blockingWaitDuration);

      }
    }
    -[PDFView currentPage](self, "currentPage");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v22;
    if (v18 != v22)
    {
      -[PDFView currentDestination](self, "currentDestination");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFView pushDestination:](self, "pushDestination:", v19);

      objc_storeStrong((id *)&self->_private->toPage, a3);
      -[PDFView goToPageNoPush:animated:](self, "goToPageNoPush:animated:", v22, v6);
      v20 = self->_private;
      toPage = v20->toPage;
      v20->toPage = 0;

LABEL_12:
      v9 = v22;
      goto LABEL_13;
    }
    if (self->_private->scrollView)
    {
      -[PDFView _reflectNewPageOn](self, "_reflectNewPageOn");
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (PDFDestination)currentDestination
{
  void *v3;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MaxY;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  PDFDestination *v27;

  -[PDFView document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PDFView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PDFScrollView contentInset](self->_private->scrollView, "contentInset");
    v16 = PDFEdgeInsetsInsetRect(v5, v7, v9, v11, v12, v13, v14, v15);
    MaxY = PDFRectGetMaxY(v16, v17, v18, v19);
    v21 = PDFPointMake(0.0, MaxY);
    v23 = v22;
    -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v24, v21, v23);
    v27 = -[PDFDestination initWithPage:atPoint:]([PDFDestination alloc], "initWithPage:atPoint:", v24, v25, v26);

  }
  else
  {
    v27 = 0;
  }
  return v27;
}

- (void)goToDestination:(PDFDestination *)destination
{
  PDFDestination *v4;
  void *v5;
  void *v6;
  PDFDestination *v7;

  v4 = destination;
  if (v4)
  {
    v7 = v4;
    -[PDFDestination page](v4, "page");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v7;
    if (v5)
    {
      -[PDFView currentDestination](self, "currentDestination");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFView pushDestination:](self, "pushDestination:", v6);

      -[PDFView goToDestinationNoPush:](self, "goToDestinationNoPush:", v7);
      v4 = v7;
    }
  }

}

- (void)goToSelection:(PDFSelection *)selection
{
  PDFSelection *v4;
  PDFSelection *v5;
  BOOL v6;
  void *v7;
  void *v8;
  PDFSelection *v9;

  v4 = selection;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    v6 = -[PDFSelection isEmpty](v4, "isEmpty");
    v5 = v9;
    if (!v6)
    {
      -[PDFSelection pages](v9, "pages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PDFSelection boundsForPage:](v9, "boundsForPage:", v8);
      -[PDFView goToRect:onPage:](self, "goToRect:onPage:", v8);

      v5 = v9;
    }
  }

}

- (void)goToRect:(CGRect)rect onPage:(PDFPage *)page
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  uint64_t v11;
  double MaxX;
  double v13;
  double MaxY;
  double v15;
  PDFDestination *v16;
  PDFPage *v17;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v17 = page;
  if (!-[PDFView isRectVisible:onPage:](self, "isRectVisible:onPage:", x, y, width, height))
  {
    v9 = *MEMORY[0x24BDBEFB0];
    v10 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v11 = -[PDFPage rotation](v17, "rotation");
    if (v11 > 179)
    {
      if (v11 == 180)
      {
        MaxX = PDFRectGetMaxX(x, y, width);
        goto LABEL_11;
      }
      if (v11 != 270)
      {
LABEL_13:
        v16 = -[PDFDestination initWithPage:atPoint:]([PDFDestination alloc], "initWithPage:atPoint:", v17, v9, v10);
        -[PDFView goToDestination:](self, "goToDestination:", v16);

        goto LABEL_14;
      }
      v13 = PDFRectGetMaxX(x, y, width);
      MaxY = PDFRectGetMaxY(x, y, width, height);
      MaxX = v13;
    }
    else
    {
      if (v11)
      {
        if (v11 == 90)
        {
          MaxX = x;
LABEL_11:
          MaxY = y;
          goto LABEL_12;
        }
        goto LABEL_13;
      }
      MaxY = PDFRectGetMaxY(x, y, width, height);
      MaxX = x;
    }
LABEL_12:
    v9 = PDFPointMake(MaxX, MaxY);
    v10 = v15;
    goto LABEL_13;
  }
LABEL_14:

}

- (void)setDisplayMode:(PDFDisplayMode)displayMode
{
  void *v5;
  PDFViewPrivate *v6;
  void *v7;
  id v8;

  -[PDFView currentPage](self, "currentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)displayMode >= 4)
  {
    v8 = v5;
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("setDisplayMode: %ld out of bounds"), displayMode);
LABEL_7:
    v5 = v8;
    goto LABEL_8;
  }
  v6 = self->_private;
  if (v6->displayMode != displayMode)
  {
    v8 = v5;
    v6->displayMode = displayMode;
    -[PDFView layoutDocumentView](self, "layoutDocumentView");
    -[PDFScrollView updateLayout](self->_private->scrollView, "updateLayout");
    if ((displayMode & 1) != 0)
      -[PDFView goToPageNoPush:](self, "goToPageNoPush:", v8);
    -[PDFScrollView setBounces:](self->_private->scrollView, "setBounces:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("PDFViewDisplayModeChanged"), self);

    goto LABEL_7;
  }
LABEL_8:

}

- (PDFDisplayMode)displayMode
{
  return self->_private->displayMode;
}

- (void)setDisplayDirection:(PDFDisplayDirection)displayDirection
{
  PDFViewPrivate *v3;
  PDFViewPrivate *v5;

  v3 = self->_private;
  if (v3->displayDirection != displayDirection)
  {
    v3->displayDirection = displayDirection;
    -[PDFView layoutDocumentView](self, "layoutDocumentView");
    v5 = self->_private;
    if (v5->isUsingPageViewController)
    {
      if (v5->documentViewController)
      {
        -[PDFView _releaseDocumentViewController](self, "_releaseDocumentViewController");
        -[PDFView _setupDocumentViewController](self, "_setupDocumentViewController");
      }
    }
  }
}

- (PDFDisplayDirection)displayDirection
{
  return self->_private->displayDirection;
}

- (void)setDisplaysPageBreaks:(BOOL)displaysPageBreaks
{
  if (-[PDFView displaysPageBreaks](self, "displaysPageBreaks") != displaysPageBreaks)
  {
    self->_private->displaysPageBreaks = displaysPageBreaks;
    -[PDFView layoutDocumentView](self, "layoutDocumentView");
  }
}

- (BOOL)displaysPageBreaks
{
  return self->_private->displaysPageBreaks;
}

- (void)setPageBreakMargins:(UIEdgeInsets)pageBreakMargins
{
  PDFViewPrivate *v3;
  double right;

  if (pageBreakMargins.top < 0.0)
    pageBreakMargins.top = 0.0;
  if (pageBreakMargins.left < 0.0)
    pageBreakMargins.left = 0.0;
  if (pageBreakMargins.bottom < 0.0)
    pageBreakMargins.bottom = 0.0;
  v3 = self->_private;
  v3->pageBreakMargins.top = pageBreakMargins.top;
  v3->pageBreakMargins.left = pageBreakMargins.left;
  if (pageBreakMargins.right >= 0.0)
    right = pageBreakMargins.right;
  else
    right = 0.0;
  v3->pageBreakMargins.bottom = pageBreakMargins.bottom;
  v3->pageBreakMargins.right = right;
}

- (UIEdgeInsets)pageBreakMargins
{
  PDFViewPrivate *v2;
  CGFloat top;
  CGFloat left;
  CGFloat bottom;
  CGFloat right;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  v2 = self->_private;
  top = v2->pageBreakMargins.top;
  left = v2->pageBreakMargins.left;
  bottom = v2->pageBreakMargins.bottom;
  right = v2->pageBreakMargins.right;
  if (!-[PDFView displaysPageBreaks](self, "displaysPageBreaks"))
  {
    top = *MEMORY[0x24BDF7718];
    left = *(double *)(MEMORY[0x24BDF7718] + 8);
    bottom = *(double *)(MEMORY[0x24BDF7718] + 16);
    right = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  v7 = top;
  v8 = left;
  v9 = bottom;
  v10 = right;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)setDocumentMargins:(UIEdgeInsets)a3
{
  self->_private->documentMargins = a3;
  -[PDFView layoutDocumentView](self, "layoutDocumentView");
}

- (UIEdgeInsets)documentMargins
{
  PDFViewPrivate *v2;
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  v2 = self->_private;
  top = v2->documentMargins.top;
  left = v2->documentMargins.left;
  bottom = v2->documentMargins.bottom;
  right = v2->documentMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInFormFillingMode:(BOOL)a3
{
  PDFViewPrivate *v3;
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  PDFViewController *controller;
  void *v10;
  char v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  id location;

  v3 = self->_private;
  if (v3->inFormFillingMode != a3)
  {
    v4 = a3;
    v3->inFormFillingMode = a3;
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __32__PDFView_setInFormFillingMode___block_invoke;
    v12[3] = &unk_24C25E2A0;
    objc_copyWeak(&v13, &location);
    v14 = v4;
    v6 = (void (**)(_QWORD))MEMORY[0x20BD1AEB4](v12);
    -[PDFView _showFormFillingButton:](self, "_showFormFillingButton:", v4);
    -[PDFView document](self, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "akController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "setFormFillingEnabled:", v4);
    controller = self->_private->controller;
    if (v4)
    {
      -[PDFViewController activeAnnotation](controller, "activeAnnotation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isFormField");

      if ((v11 & 1) == 0)
      {
        -[PDFViewController activateNextAnnotation:withCompletion:](self->_private->controller, "activateNextAnnotation:withCompletion:", 0, v6);
LABEL_9:

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
        return;
      }
    }
    else
    {
      -[PDFViewController setActiveAnnotation:](controller, "setActiveAnnotation:", 0);
    }
    v6[2](v6);
    goto LABEL_9;
  }
}

void __32__PDFView_setInFormFillingMode___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "internalForceAnnotationRefresh");
  objc_msgSend(WeakRetained, "highlightDetectedFormFields:", *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)isInFormFillingMode
{
  return self->_private->inFormFillingMode;
}

- (void)setFormFillingUpdatesAnnotationOnEveryTextChange:(BOOL)a3
{
  self->_private->formFillingUpdatesAnnotationOnEveryTextChange = a3;
}

- (BOOL)formFillingUpdatesAnnotationOnEveryTextChange
{
  return self->_private->formFillingUpdatesAnnotationOnEveryTextChange;
}

- (void)setAllowsMarkupAnnotationEditing:(BOOL)a3
{
  self->_private->allowsMarkupAnnotationEditing = a3;
}

- (BOOL)allowsMarkupAnnotationEditing
{
  if (self->_private->allowsMarkupAnnotationEditing)
    return 1;
  else
    return GetDefaultsWriteAKEnabled();
}

- (void)setAllowsUndo:(BOOL)a3
{
  self->_private->allowsUndo = a3;
}

- (BOOL)allowsUndo
{
  return self->_private->allowsUndo;
}

- (void)setTextSelectionEnabled:(BOOL)a3
{
  self->_private->textSelectionEnabled = a3;
}

- (BOOL)isTextSelectionEnabled
{
  return self->_private->textSelectionEnabled;
}

- (void)setDisplayBox:(PDFDisplayBox)displayBox
{
  id v5;

  if (-[PDFView displayBox](self, "displayBox") != displayBox)
  {
    -[PDFRenderingProperties setDisplayBox:](self->_private->renderingProperties, "setDisplayBox:", displayBox);
    -[PDFView layoutDocumentView](self, "layoutDocumentView");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("PDFViewDisplayBoxChanged"), self);

  }
}

- (PDFDisplayBox)displayBox
{
  return -[PDFRenderingProperties displayBox](self->_private->renderingProperties, "displayBox");
}

- (void)setDisplaysAsBook:(BOOL)displaysAsBook
{
  PDFViewPrivate *v3;

  v3 = self->_private;
  if (v3->displaysAsBook != displaysAsBook)
  {
    v3->displaysAsBook = displaysAsBook;
    -[PDFView layoutDocumentView](self, "layoutDocumentView");
  }
}

- (BOOL)displaysAsBook
{
  return self->_private->displaysAsBook;
}

- (void)setShouldAntiAlias:(BOOL)shouldAntiAlias
{
  -[PDFRenderingProperties setShouldAntiAlias:](self->_private->renderingProperties, "setShouldAntiAlias:", shouldAntiAlias);
}

- (BOOL)shouldAntiAlias
{
  return -[PDFRenderingProperties shouldAntiAlias](self->_private->renderingProperties, "shouldAntiAlias");
}

- (void)setGreekingThreshold:(CGFloat)greekingThreshold
{
  -[PDFRenderingProperties setGreekingThreshold:](self->_private->renderingProperties, "setGreekingThreshold:", greekingThreshold);
}

- (CGFloat)greekingThreshold
{
  CGFloat result;

  -[PDFRenderingProperties greekingThreshold](self->_private->renderingProperties, "greekingThreshold");
  return result;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFView;
  -[PDFView setBackgroundColor:](&v3, sel_setBackgroundColor_, backgroundColor);
}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFView;
  -[PDFView backgroundColor](&v3, sel_backgroundColor);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setInterpolationQuality:(PDFInterpolationQuality)interpolationQuality
{
  -[PDFRenderingProperties setInterpolationQuality:](self->_private->renderingProperties, "setInterpolationQuality:", interpolationQuality);
}

- (PDFInterpolationQuality)interpolationQuality
{
  return -[PDFRenderingProperties interpolationQuality](self->_private->renderingProperties, "interpolationQuality");
}

- (BOOL)isUsingPageViewController
{
  return self->_private->isUsingPageViewController;
}

- (id)documentViewController
{
  return self->_private->documentViewController;
}

- (void)usePageViewController:(BOOL)enable withViewOptions:(NSDictionary *)viewOptions
{
  _BOOL4 v5;
  NSDictionary *v7;
  PDFViewPrivate *v8;
  NSDictionary *v9;

  v5 = enable;
  v7 = viewOptions;
  v8 = self->_private;
  if (v8->isUsingPageViewController != v5)
  {
    v9 = v7;
    v8->isUsingPageViewController = v5;
    objc_storeStrong((id *)&self->_private->pageViewControllerOptions, viewOptions);
    if (v5)
    {
      -[PDFView _setupDocumentViewController](self, "_setupDocumentViewController");
      -[PDFView _releaseScrollView](self, "_releaseScrollView");
    }
    else
    {
      -[PDFView _setupScrollView](self, "_setupScrollView");
      -[PDFView _releaseDocumentViewController](self, "_releaseDocumentViewController");
    }
    v7 = v9;
  }

}

- (void)_setupScrollView
{
  PDFScrollView *v3;
  uint64_t v4;
  PDFViewPrivate *v5;
  PDFScrollView *scrollView;
  void *v7;
  uint64_t v8;
  PDFViewPrivate *v9;
  UIDragInteraction *dragInteraction;
  PDFViewPrivate *v11;
  __int128 v12;
  CGRect *p_extensionViewBoundsInDocument;
  CGPoint v14;
  CGSize v15;
  CGRect *p_extensionViewFrame;
  PDFTimer *v17;
  PDFViewPrivate *v18;
  PDFTimer *tilesSyncTimer;
  void *v20;
  void *v21;
  void *v22;

  v3 = [PDFScrollView alloc];
  -[PDFView bounds](self, "bounds");
  v4 = -[PDFScrollView initWithFrame:](v3, "initWithFrame:");
  v5 = self->_private;
  scrollView = v5->scrollView;
  v5->scrollView = (PDFScrollView *)v4;

  -[PDFScrollView setPDFView:](self->_private->scrollView, "setPDFView:", self);
  -[PDFView setMinScaleFactor:](self, "setMinScaleFactor:", 0.1);
  -[PDFView setMaxScaleFactor:](self, "setMaxScaleFactor:", 20.0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_scrollViewSaysPageMayHaveChanged_, CFSTR("PDFScrollViewPageMayHaveChangedNotification"), self->_private->scrollView);

  -[PDFScrollView setShowsVerticalScrollIndicator:](self->_private->scrollView, "setShowsVerticalScrollIndicator:", 1);
  -[PDFScrollView setShowsHorizontalScrollIndicator:](self->_private->scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[PDFScrollView setAutoresizingMask:](self->_private->scrollView, "setAutoresizingMask:", 18);
  -[PDFView gestureInit](self, "gestureInit");
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDF69E8]), "initWithDelegate:", self);
  v9 = self->_private;
  dragInteraction = v9->dragInteraction;
  v9->dragInteraction = (UIDragInteraction *)v8;

  -[PDFView addInteraction:](self, "addInteraction:", self->_private->dragInteraction);
  v11 = self->_private;
  v12 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  *(_OWORD *)&v11->savedSafeAreaInsets.top = *MEMORY[0x24BDF7718];
  *(_OWORD *)&v11->savedSafeAreaInsets.bottom = v12;
  self->_private->horizontalScaleFactorBeforeRotation = 1.0;
  self->_private->documentViewCenterBeforeRotation = (CGPoint)*MEMORY[0x24BDBEFB0];
  p_extensionViewBoundsInDocument = &self->_private->extensionViewBoundsInDocument;
  v14 = (CGPoint)*MEMORY[0x24BDBF090];
  v15 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  p_extensionViewBoundsInDocument->origin = (CGPoint)*MEMORY[0x24BDBF090];
  p_extensionViewBoundsInDocument->size = v15;
  p_extensionViewFrame = &self->_private->extensionViewFrame;
  p_extensionViewFrame->origin = v14;
  p_extensionViewFrame->size = v15;
  self->_private->extensionViewZoomScale = 1.0;
  v17 = -[PDFTimer initWithThrottleDelay:forSelector:forTarget:]([PDFTimer alloc], "initWithThrottleDelay:forSelector:forTarget:", sel__tileRefresh, self, 0.1);
  v18 = self->_private;
  tilesSyncTimer = v18->tilesSyncTimer;
  v18->tilesSyncTimer = v17;

  -[PDFTimer update](self->_private->tilesSyncTimer, "update");
  self->_private->activeMarkupStyle = 0;
  objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFView setBackgroundColor:](self, "setBackgroundColor:", v20);

  -[PDFScrollView setDocument:](self->_private->scrollView, "setDocument:", self->_private->document);
  -[PDFView addSubview:](self, "addSubview:", self->_private->scrollView);
  -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pageBackgroundManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_pageBackgroundManager, v22);

  -[PDFView _updatePasswordView](self, "_updatePasswordView");
}

- (void)_releaseScrollView
{
  PDFViewPrivate *v3;
  PDFScrollView *scrollView;
  void *v5;

  -[PDFScrollView removeFromSuperview](self->_private->scrollView, "removeFromSuperview");
  -[PDFScrollView setDocument:](self->_private->scrollView, "setDocument:", 0);
  v3 = self->_private;
  scrollView = v3->scrollView;
  v3->scrollView = 0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("PDFScrollViewPageMayHaveChangedNotification"), self->_private->scrollView);

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_syncPageIndexToScrollView, 0);
}

- (void)_setupDocumentViewController
{
  double v3;
  double v4;
  double v5;
  double v6;
  PDFDisplayDirection v7;
  PDFDocumentViewController *documentViewController;
  PDFDocumentViewController *v9;
  PDFViewPrivate *v10;
  PDFDocumentViewController *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id WeakRetained;
  PDFViewPrivate *v23;
  _BOOL8 autoScale;
  void *v25;
  void *v26;

  -[PDFScrollView minimumZoomScale](self->_private->scrollView, "minimumZoomScale");
  v4 = v3;
  -[PDFScrollView maximumZoomScale](self->_private->scrollView, "maximumZoomScale");
  v6 = v5;
  v7 = -[PDFView displayDirection](self, "displayDirection");
  documentViewController = self->_private->documentViewController;
  if (!documentViewController)
  {
    if (v6 <= 0.0)
      v6 = 5.0;
    if (v4 <= 0.0)
      v4 = 0.25;
    v9 = -[PDFDocumentViewController initWithPDFView:pageIndex:navigationOrientation:withRenderingProperties:andOptions:]([PDFDocumentViewController alloc], "initWithPDFView:pageIndex:navigationOrientation:withRenderingProperties:andOptions:", self, self->_currentPageIndex, v7 == kPDFDisplayDirectionVertical, self->_private->renderingProperties, self->_private->pageViewControllerOptions);
    v10 = self->_private;
    v11 = v10->documentViewController;
    v10->documentViewController = v9;

    -[PDFDocumentViewController view](self->_private->documentViewController, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView addSubview:](self, "addSubview:", v12);

    -[PDFView bounds](self, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[PDFDocumentViewController view](self->_private->documentViewController, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
    -[PDFView setNewPageVisibilityDelegate:withOldDelegate:](self, "setNewPageVisibilityDelegate:withOldDelegate:", WeakRetained, 0);

    v23 = self->_private;
    autoScale = v23->autoScale;
    -[PDFDocumentViewController setMinScaleFactor:withMaxScaleFactor:](v23->documentViewController, "setMinScaleFactor:withMaxScaleFactor:", v4, v6);
    -[PDFView setAutoScales:](self, "setAutoScales:", autoScale);
    -[PDFDocumentViewController setDisplaysRTL:](self->_private->documentViewController, "setDisplaysRTL:", self->_private->displaysRTL);
    -[PDFDocumentViewController updateScrollViews](self->_private->documentViewController, "updateScrollViews");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", self, sel_pageViewControllerSaysPageChanged_, CFSTR("PDFDocumentViewControllerChangedPage"), self);

    documentViewController = self->_private->documentViewController;
  }
  -[PDFDocumentViewController pageBackgroundManager](documentViewController, "pageBackgroundManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_pageBackgroundManager, v26);

  -[PDFView _updatePasswordView](self, "_updatePasswordView");
}

- (void)_releaseDocumentViewController
{
  void *v3;
  PDFDocumentViewController *documentViewController;
  PDFPageViewController *v5;
  void *v6;
  void *v7;
  PDFViewPrivate *v8;
  PDFDocumentViewController *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PDFDocumentViewControllerChangedPage"), self);

  documentViewController = self->_private->documentViewController;
  v5 = objc_alloc_init(PDFPageViewController);
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFDocumentViewController setViewControllers:direction:animated:completion:](documentViewController, "setViewControllers:direction:animated:completion:", v6, 0, 0, 0);

  -[PDFDocumentViewController view](self->_private->documentViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[PDFDocumentViewController removeFromParentViewController](self->_private->documentViewController, "removeFromParentViewController");
  v8 = self->_private;
  v9 = v8->documentViewController;
  v8->documentViewController = 0;

}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;

  v9 = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);

  v5 = v9;
  if (WeakRetained != v9)
  {
    v6 = objc_loadWeakRetained((id *)&self->_private->delegate);
    -[PDFView setNewPageVisibilityDelegate:withOldDelegate:](self, "setNewPageVisibilityDelegate:withOldDelegate:", v9, v6);
    if (v9)
    {
      self->_private->delegateWillScale = objc_opt_respondsToSelector() & 1;
      self->_private->delegateOrdersPageDrawing = objc_opt_respondsToSelector() & 1;
      v7 = v9;
      self->_private->delegateRespondsToAllowFormFilling = objc_opt_respondsToSelector() & 1;
      self->_private->delegateRespondsToAllowFormFillingWithAutoFill = objc_opt_respondsToSelector() & 1;
      v8 = objc_opt_respondsToSelector();

      self->_private->delegateRespondsToAllowFormFillingWithConfidence = v8 & 1;
    }
    else
    {
      self->_private->delegateWillScale = 0;
      self->_private->delegateOrdersPageDrawing = 0;
      self->_private->delegateRespondsToAllowFormFilling = 0;
      self->_private->delegateRespondsToAllowFormFillingWithAutoFill = 0;
      self->_private->delegateRespondsToAllowFormFillingWithConfidence = 0;
    }

    v5 = v9;
  }

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_private->delegate);
}

- (void)setPageOverlayViewProvider:(id)pageOverlayViewProvider
{
  id WeakRetained;
  id obj;

  obj = pageOverlayViewProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pageOverlayViewProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_pageOverlayViewProvider, obj);
    if (obj)
    {
      -[PDFView _ensureOverlayViewController](self, "_ensureOverlayViewController");
      -[PDFOverlayViewsController setViewProvider:](self->_overlayViewController, "setViewProvider:", obj);
    }
  }

}

- (void)setScaleFactor:(CGFloat)scaleFactor
{
  double v5;
  PDFViewPrivate *v6;

  -[PDFView scaleFactor](self, "scaleFactor");
  if (vabdd_f64(v5, scaleFactor) > 0.00000011920929)
    -[PDFView setAutoScales:](self, "setAutoScales:", 0);
  v6 = self->_private;
  if (v6->isUsingPageViewController)
  {
    -[PDFDocumentViewController setScaleFactor:](v6->documentViewController, "setScaleFactor:", scaleFactor);
  }
  else if (!-[PDFRenderingProperties isUsingPDFExtensionView](v6->renderingProperties, "isUsingPDFExtensionView"))
  {
    -[PDFView _internalSetScaleFactor:](self, "_internalSetScaleFactor:", scaleFactor);
  }
}

- (CGFloat)scaleFactor
{
  PDFViewPrivate *v2;
  CGFloat result;
  _BOOL4 v5;
  PDFViewPrivate *v6;

  v2 = self->_private;
  if (v2->isUsingPageViewController)
  {
    -[PDFDocumentViewController scaleFactor](v2->documentViewController, "scaleFactor");
  }
  else
  {
    v5 = -[PDFRenderingProperties isUsingPDFExtensionView](v2->renderingProperties, "isUsingPDFExtensionView");
    v6 = self->_private;
    if (v5)
      return v6->extensionViewZoomScale;
    else
      -[PDFScrollView zoomScale](v6->scrollView, "zoomScale");
  }
  return result;
}

- (void)zoomIn:(id)sender
{
  void *v4;
  char v5;
  double v6;

  -[PDFView document](self, "document", sender);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocked");

  if ((v5 & 1) == 0)
  {
    -[PDFView setAutoScales:](self, "setAutoScales:", 0);
    -[PDFView scaleFactor](self, "scaleFactor");
    -[PDFView _internalSetScaleFactor:](self, "_internalSetScaleFactor:", v6 * self->_private->zoomIncrement);
  }
}

- (BOOL)canZoomIn
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[PDFView scaleFactor](self, "scaleFactor");
  -[PDFView PDFViewWillChangeScaleFactor:toScale:](self, "PDFViewWillChangeScaleFactor:toScale:", self, v3 * self->_private->zoomIncrement);
  v5 = v4;
  -[PDFView scaleFactor](self, "scaleFactor");
  return v5 != v6;
}

- (void)zoomOut:(id)sender
{
  void *v4;
  char v5;
  double v6;

  -[PDFView document](self, "document", sender);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocked");

  if ((v5 & 1) == 0)
  {
    -[PDFView setAutoScales:](self, "setAutoScales:", 0);
    -[PDFView scaleFactor](self, "scaleFactor");
    -[PDFView _internalSetScaleFactor:](self, "_internalSetScaleFactor:", v6 / self->_private->zoomIncrement);
  }
}

- (BOOL)canZoomOut
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[PDFView scaleFactor](self, "scaleFactor");
  -[PDFView PDFViewWillChangeScaleFactor:toScale:](self, "PDFViewWillChangeScaleFactor:toScale:", self, v3 / self->_private->zoomIncrement);
  v5 = v4;
  -[PDFView scaleFactor](self, "scaleFactor");
  return v5 != v6;
}

- (void)setAutoScales:(BOOL)autoScales
{
  _BOOL8 v3;
  PDFViewPrivate *v5;

  v3 = autoScales;
  self->_private->autoScale = autoScales;
  if (autoScales)
    -[PDFView _internalSetAutoScaleFactor](self, "_internalSetAutoScaleFactor");
  v5 = self->_private;
  if (v5->isUsingPageViewController)
    -[PDFDocumentViewController setAutoScales:](v5->documentViewController, "setAutoScales:", v3);
}

- (BOOL)autoScales
{
  return self->_private->autoScale;
}

- (CGFloat)scaleFactorForSizeToFit
{
  PDFViewPrivate *v2;
  CGFloat result;
  void *v5;
  double v6;
  double v7;

  v2 = self->_private;
  if (v2->isUsingPageViewController)
  {
    -[PDFDocumentViewController autoScaleFactor](v2->documentViewController, "autoScaleFactor");
  }
  else
  {
    -[PDFView currentPage](self, "currentPage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView _unboundAutoScaleFactorForPage:](self, "_unboundAutoScaleFactorForPage:", v5);
    v7 = v6;

    return v7;
  }
  return result;
}

- (PDFAreaOfInterest)areaOfInterestForMouse:(UIEvent *)event
{
  return 0;
}

- (PDFAreaOfInterest)areaOfInterestForPoint:(CGPoint)cursorLocation
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PDFAnnotation *v12;
  void *v13;
  void *v14;
  PDFAnnotation *annotationOver;
  BOOL v16;
  void *v17;
  int v18;
  unsigned int v19;
  void *v20;
  int v21;
  PDFAreaOfInterest v22;
  PDFViewPrivate *v23;
  PDFAnnotation *v24;
  int AreaOfInterestAtPoint;
  unsigned int v26;

  y = cursorLocation.y;
  x = cursorLocation.x;
  -[PDFView document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v12 = 0;
    v22 = 0;
    goto LABEL_43;
  }
  -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v7, x, y);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "annotationAtPoint:");
  v12 = (PDFAnnotation *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (objc_msgSend(v7, "scannedAnnotationAtPoint:", v9, v11),
        (v12 = (PDFAnnotation *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[PDFAnnotation valueForAnnotationKey:](v12, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation valueForAnnotationKey:](v12, "valueForAnnotationKey:", CFSTR("/FT"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    annotationOver = self->_private->annotationOver;
    if (annotationOver)
      v16 = annotationOver == v12;
    else
      v16 = 1;
    if (!v16)
      -[PDFAnnotation setPointerIsOverAnnotation:](annotationOver, "setPointerIsOverAnnotation:", 0);
    -[PDFAnnotation setPointerIsOverAnnotation:](v12, "setPointerIsOverAnnotation:", 1);
    objc_storeStrong((id *)&self->_private->annotationOver, v12);
    -[PDFAnnotation valueForAnnotationKey:](v12, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("/Link"));

    if (v18)
      v19 = 13;
    else
      v19 = 5;
    -[PDFAnnotation valueForAnnotationKey:](v12, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("/Popup"));

    if (v21)
    {
      v19 |= 0x80u;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("/Widget"))
           && objc_msgSend(v14, "isEqualToString:", CFSTR("/Tx"))
           && !-[PDFAnnotation isReadOnly](v12, "isReadOnly"))
    {
      v19 |= 0x20u;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("/Widget"))
           && objc_msgSend(v14, "isEqualToString:", CFSTR("/Btn"))
           && !-[PDFAnnotation isReadOnly](v12, "isReadOnly"))
    {
      v19 |= 0x10u;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("/Text")))
    {
      v19 |= 0x40u;
    }
    else if (-[PDFAnnotation isMarkupAnnotationSubtype](v12, "isMarkupAnnotationSubtype")
           && -[PDFAnnotation noteContainsPoint:](v12, "noteContainsPoint:", v9, v11))
    {
      v19 |= 0x10u;
    }

    v22 = v19;
    if ((v19 & 4) != 0)
      goto LABEL_32;
  }
  else
  {
    v22 = 1;
    v19 = 1;
  }
  -[PDFAnnotation setPointerIsOverAnnotation:](self->_private->annotationOver, "setPointerIsOverAnnotation:", 0);
  v23 = self->_private;
  v24 = v23->annotationOver;
  v23->annotationOver = 0;

LABEL_32:
  if (objc_msgSend(v6, "isSimpleSelectionEnabled"))
  {
    if (objc_msgSend(v7, "pageLayoutIfAvail"))
    {
      PDFPointToCGPoint(v9, v11);
      AreaOfInterestAtPoint = CGPDFPageLayoutGetAreaOfInterestAtPoint();
      v22 = (AreaOfInterestAtPoint << 7) & 0x100 | (2 * (AreaOfInterestAtPoint & 1)) | v19;
    }
  }
  else
  {
    if (objc_msgSend(v7, "columnAtPointIfAvailable:", v9, v11))
      v26 = v19 | 2;
    else
      v26 = v19;
    if (objc_msgSend(v7, "pageLayoutIfAvail") && CGPDFLayoutGetRootNode() && CGPDFNodeGetNodeContainingPoint())
      v26 |= 0x100u;
    v22 = v26;
  }
LABEL_43:

  return v22;
}

- (void)performAction:(PDFAction *)action
{
  PDFAction *v4;
  PDFAction *v5;
  void *v6;
  void *v7;
  PDFAction *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  void (**v29)(_QWORD);
  _QWORD v30[4];
  id v31;
  id v32;
  PDFView *v33;

  v4 = action;
  v5 = v4;
  if (v4)
  {
    -[PDFAction type](v4, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("GoTo")))
    {
      -[PDFAction destination](v5, "destination");
      v8 = (PDFAction *)objc_claimAutoreleasedReturnValue();
      -[PDFView goToDestination:](self, "goToDestination:", v8);
    }
    else
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("GoToR")))
      {
        if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "PDFViewOpenPDF:forRemoteGoToAction:", self, v5);
        else
LABEL_36:
          -[PDFView performBeep](self, "performBeep");
        goto LABEL_37;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("Named")))
      {
        switch(-[PDFAction name](v5, "name"))
        {
          case 1:
            -[PDFView goToNextPage:](self, "goToNextPage:", self);
            break;
          case 2:
            -[PDFView goToPreviousPage:](self, "goToPreviousPage:", self);
            break;
          case 3:
            -[PDFView goToFirstPage:](self, "goToFirstPage:", self);
            break;
          case 4:
            -[PDFView goToLastPage:](self, "goToLastPage:", self);
            break;
          case 5:
            -[PDFView goBack:](self, "goBack:", self);
            break;
          case 6:
            -[PDFView goForward:](self, "goForward:", self);
            break;
          case 7:
            if (!v7 || (objc_opt_respondsToSelector() & 1) == 0)
              goto LABEL_36;
            objc_msgSend(v7, "PDFViewPerformGoToPage:", self);
            break;
          case 8:
            if (!v7 || (objc_opt_respondsToSelector() & 1) == 0)
              goto LABEL_36;
            objc_msgSend(v7, "PDFViewPerformFind:", self);
            break;
          case 10:
            if (!-[PDFView canZoomIn](self, "canZoomIn"))
              goto LABEL_36;
            -[PDFView zoomIn:](self, "zoomIn:", self);
            break;
          case 11:
            if (!-[PDFView canZoomOut](self, "canZoomOut"))
              goto LABEL_36;
            -[PDFView zoomOut:](self, "zoomOut:", self);
            break;
          default:
            goto LABEL_37;
        }
        goto LABEL_37;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("ResetForm")))
      {
        -[PDFView document](self, "document");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = v9;
          objc_msgSend(v9, "resetFormFields:", v5);

        }
        goto LABEL_37;
      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("URI")) & 1) == 0
        && !objc_msgSend(v6, "isEqualToString:", CFSTR("Launch")))
      {
LABEL_37:

        goto LABEL_38;
      }
      v8 = v5;
      -[PDFAction URL](v8, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && (PDFURLLooksSuspicious(v11) & 1) == 0)
      {
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __25__PDFView_performAction___block_invoke;
        v30[3] = &unk_24C25D110;
        v12 = v12;
        v31 = v12;
        v32 = v7;
        v33 = self;
        v13 = (void (**)(_QWORD))MEMORY[0x20BD1AEB4](v30);
        if (-[PDFAction isSuspiciousURL](v8, "isSuspiciousURL"))
        {
          v14 = (void *)MEMORY[0x24BDD17C8];
          PDFKitLocalizedString(CFSTR("Opening the clicked link may send encrypted document content to the server \\U201C%@\\U201D."));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "host");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", v15, v16);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)MEMORY[0x24BDD17C8];
          PDFKitLocalizedString(CFSTR("Link: %@"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", v18, v12);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          PDFKitLocalizedString(CFSTR("Cancel"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          PDFKitLocalizedString(CFSTR("Open Anyway"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v27, v26, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v25, 1, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addAction:", v20);
          v21 = (void *)MEMORY[0x24BDF67E8];
          v28[0] = MEMORY[0x24BDAC760];
          v28[1] = 3221225472;
          v28[2] = __25__PDFView_performAction___block_invoke_2;
          v28[3] = &unk_24C25DD18;
          v29 = v13;
          objc_msgSend(v21, "actionWithTitle:style:handler:", v24, 2, v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addAction:", v22);
          -[PDFView parentViewController](self, "parentViewController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "presentViewController:animated:completion:", v19, 1, 0);

        }
        else
        {
          v13[2](v13);
        }

      }
    }

    goto LABEL_37;
  }
LABEL_38:

}

uint64_t __25__PDFView_performAction___block_invoke(_QWORD *a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), result = objc_opt_isKindOfClass(), (result & 1) != 0))
  {
    if (a1[5] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = (void *)a1[5];
      v4 = (void *)a1[6];
      v5 = a1[4];
    }
    else
    {
      v3 = (void *)a1[6];
      v5 = a1[4];
      v4 = v3;
    }
    return objc_msgSend(v3, "PDFViewWillClickOnLink:withURL:", v4, v5);
  }
  return result;
}

uint64_t __25__PDFView_performAction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PDFSelection)currentSelection
{
  return self->_private->currentSelection;
}

- (void)setCurrentSelection:(PDFSelection *)currentSelection
{
  -[PDFView setCurrentSelection:updateTextInput:](self, "setCurrentSelection:updateTextInput:", currentSelection, 1);
}

- (void)setCurrentSelection:(id)a3 updateTextInput:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  PDFViewPrivate *v9;
  PDFSelection *currentSelection;
  PDFViewPrivate *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PDFViewPrivate *v17;
  PDFSelection *v18;
  PDFSelection *v19;
  void *v20;
  void *v21;
  PDFSelection *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[3];

  v4 = a4;
  v54[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "isEmpty"))
    goto LABEL_9;
  v9 = self->_private;
  currentSelection = v9->currentSelection;
  if (currentSelection)
  {
    v9->currentSelection = 0;

    if (v4)
    {
      v11 = self->_private;
      if (v11->isUsingPageViewController)
      {
        -[PDFDocumentViewController setSelection:](v11->documentViewController, "setSelection:", 0);
        v11 = self->_private;
      }
      -[PDFScrollView pdfDocumentView](v11->scrollView, "pdfDocumentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSelection:", 0);

    }
  }
  if (v8)
  {
LABEL_9:
    if ((objc_msgSend(v8, "isEmpty") & 1) == 0)
    {
      objc_storeStrong((id *)&self->_private->currentSelection, a3);
      if (self->_private->isUsingPageViewController)
      {
        -[PDFView currentPage](self, "currentPage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v8, "pdfKitIndexOfFirstCharacterOnPage:", v13);
        v15 = objc_msgSend(v8, "pdfKitIndexOfLastCharacterOnPage:", v13);
        if (v14 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v13, "selectionForRange:", v14, v15 - v14 + 1);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = self->_private;
          v18 = v17->currentSelection;
          v17->currentSelection = (PDFSelection *)v16;

          v19 = self->_private->currentSelection;
          objc_msgSend(v8, "color");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFSelection setColor:](v19, "setColor:", v20);

          if (v4)
            -[PDFDocumentViewController setSelection:](self->_private->documentViewController, "setSelection:", self->_private->currentSelection);
        }

      }
      if (v4)
      {
        -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setSelection:", self->_private->currentSelection);

      }
    }
  }
  v22 = self->_private->currentSelection;
  if (v22)
  {
    -[PDFSelection pages](v22, "pages");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      -[PDFSelection firstPage](self->_private->currentSelection, "firstPage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFSelection firstSpanBoundsForPage:](self->_private->currentSelection, "firstSpanBoundsForPage:", v25);
      -[PDFView convertPoint:fromPage:](self, "convertPoint:fromPage:", v25, PDFPointMake(v28, v26 + v27));
      v30 = v29;
      v32 = v31;
      -[PDFSelection lastPage](self->_private->currentSelection, "lastPage");
      v33 = objc_claimAutoreleasedReturnValue();

      v50 = (void *)v33;
      -[PDFSelection lastSpanBoundsForPage:](self->_private->currentSelection, "lastSpanBoundsForPage:", v33);
      -[PDFView convertPoint:fromPage:](self, "convertPoint:fromPage:", v33, PDFPointMake(v34 + v35, v36));
      v38 = v37;
      v40 = v39;
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = CFSTR("topLeftSelectionPoint");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v42;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v32);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v43;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = CFSTR("bottomRightSelectionPoint");
      v54[0] = v44;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v45;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v40);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v46;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v47;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "postNotificationName:object:userInfo:", CFSTR("PDFTextSelectionDidChangeTextSelectionPoints"), self, v48);

    }
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "postNotificationName:object:", CFSTR("PDFViewSelectionChanged"), self);

}

- (void)setCurrentSelection:(PDFSelection *)selection animate:(BOOL)animate
{
  _BOOL4 v4;
  PDFSelection *v6;
  BOOL v7;
  void *v8;
  void *v9;
  PDFSelection *v10;

  v4 = animate;
  v10 = selection;
  -[PDFView setCurrentSelection:](self, "setCurrentSelection:", v10);
  v6 = v10;
  if (v10)
  {
    if (v4)
    {
      v7 = -[PDFSelection isEmpty](v10, "isEmpty");
      v6 = v10;
      if (!v7)
      {
        -[PDFSelection pages](v10, "pages");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[PDFSelection boundsForPage:](v10, "boundsForPage:", v9);
        -[PDFCoachMarkManager createCoachMarkForPage:atFrame:](self->_private->coachMarkManager, "createCoachMarkForPage:atFrame:", v9);

        v6 = v10;
      }
    }
  }

}

- (void)clearSelection
{
  PDFViewPrivate *v3;
  PDFSelection *currentSelection;
  void *v5;
  PDFViewPrivate *v6;
  id v7;

  v3 = self->_private;
  currentSelection = v3->currentSelection;
  v3->currentSelection = 0;

  -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelection:", self->_private->currentSelection);

  v6 = self->_private;
  if (v6->isUsingPageViewController)
    -[PDFDocumentViewController setSelection:](v6->documentViewController, "setSelection:", v6->currentSelection);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("PDFViewSelectionChanged"), self);

}

- (void)selectAll:(id)sender
{
  void *v4;
  id v5;

  if (self->_private->isUsingPageViewController)
  {
    -[PDFView currentPage](self, "currentPage", sender);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectionForAll");
  }
  else
  {
    -[PDFView document](self, "document", sender);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectionForEntireDocument");
  }
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PDFView setCurrentSelection:](self, "setCurrentSelection:", v5);
}

- (void)_lookup:(id)a3
{
  id v4;
  PDFSelection *currentSelection;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  PDFSelection *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;

  v4 = a3;
  currentSelection = self->_private->currentSelection;
  if (currentSelection)
  {
    v31 = v4;
    v6 = -[PDFSelection isEmpty](currentSelection, "isEmpty");
    v4 = v31;
    if (!v6)
    {
      -[PDFView parentViewController](self, "parentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[PDFSelection string](self->_private->currentSelection, "string");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(objc_alloc((Class)DDParsecCollectionViewControllerClass()), "initWithString:range:", v8, 0, objc_msgSend(v8, "length"));
        v10 = self->_private->currentSelection;
        -[PDFSelection firstPage](v10, "firstPage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFSelection boundsForPage:](v10, "boundsForPage:", v11);
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;

        -[PDFSelection firstPage](self->_private->currentSelection, "firstPage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v20, v13, v15, v17, v19);
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;

        objc_msgSend(v9, "popoverPresentationController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setSourceView:", self);

        objc_msgSend(v9, "popoverPresentationController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setSourceRect:", v22, v24, v26, v28);

        objc_msgSend(v7, "presentViewController:animated:completion:", v9, 1, 0);
      }
      else
      {
        NSLog(CFSTR("%s: Failed to find our parent view controller"), "-[PDFView _lookup:]");
      }

      v4 = v31;
    }
  }

}

- (void)highlight:(id)a3
{
  NSLog(CFSTR("This is an internal method and should not be called."), a2, a3);
}

- (void)showMarkupMenu:(id)a3
{
  NSLog(CFSTR("This is an internal method and should not be called."), a2, a3);
}

- (void)delete:(id)a3
{
  NSLog(CFSTR("This is an internal method and should not be called."), a2, a3);
}

- (void)scrollSelectionToVisible:(id)sender
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  CGRect v10;
  CGRect v11;

  -[PDFView currentSelection](self, "currentSelection", sender);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    v6 = objc_msgSend(v4, "isEmpty");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(v9, "pages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "boundsForPage:", v8);
      v11 = PDFRectInset(v10, -4.0, -4.0);
      -[PDFView goToRect:onPage:](self, "goToRect:onPage:", v8, v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);

      v5 = v9;
    }
  }

}

- (void)setHighlightedSelections:(NSArray *)highlightedSelections
{
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSArray *highlights;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  NSUInteger v19;
  void *v20;
  void *v21;
  PDFViewPrivate *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSArray *v26;
  NSArray *obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = highlightedSelections;
  if (self->_private->highlights != v5)
  {
    -[PDFView visiblePageViews](self, "visiblePageViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v40 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "setSearchSelections:", 0);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v8);
    }
    objc_storeStrong((id *)&self->_private->highlights, highlightedSelections);
    highlights = self->_private->highlights;
    if (highlights)
    {
      v25 = v6;
      v26 = v5;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = highlights;
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v29)
      {
        v28 = *(_QWORD *)v36;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v36 != v28)
              objc_enumerationMutation(obj);
            v30 = v12;
            v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
            objc_msgSend(v13, "pages", v25, v26);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v32;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v32 != v17)
                    objc_enumerationMutation(v14);
                  v19 = -[PDFDocument indexForPage:](self->_private->document, "indexForPage:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
                  -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "pageViewForPageAtIndex:", v19);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  v22 = self->_private;
                  if (v22->isUsingPageViewController)
                  {
                    -[PDFDocumentViewController findPageViewControllerForPageIndex:](v22->documentViewController, "findPageViewControllerForPageIndex:", v19);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "pageView");
                    v24 = objc_claimAutoreleasedReturnValue();

                    v21 = (void *)v24;
                  }
                  if (v21)
                    objc_msgSend(v21, "addSearchSelection:", v13);

                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
              }
              while (v16);
            }

            v12 = v30 + 1;
          }
          while (v30 + 1 != v29);
          v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v29);
      }

      v6 = v25;
      v5 = v26;
    }

  }
}

- (NSArray)highlightedSelections
{
  return self->_private->highlights;
}

- (void)takePasswordFrom:(id)sender
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = sender;
  -[PDFView document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  if (v4)
  {
    if ((v5 & 1) != 0)
    {
      if (!objc_msgSend(v4, "allowsPrinting")
        || (-[PDFView document](self, "document"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v7 = objc_msgSend(v6, "allowsCopying"),
            v6,
            (v7 & 1) == 0))
      {
        objc_msgSend(v9, "stringValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unlockWithPassword:", v8);

      }
    }
  }

}

- (void)drawPage:(PDFPage *)page toContext:(CGContextRef)context
{
  PDFPage *v6;

  v6 = page;
  -[PDFPage drawWithBox:toContext:](v6, "drawWithBox:toContext:", -[PDFView displayBox](self, "displayBox"), context);

}

- (void)copy:(id)sender
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[PDFView currentSelection](self, "currentSelection", sender);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PDFView document](self, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowsCopying");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("PDFViewCopyPermission"), self);
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v4, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "precomposedStringWithCanonicalMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (PDFKitIsOCREnabled())
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v4, "pages", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isTextFromOCR") & 1) != 0)
            {

              objc_msgSend(v4, "webArchive");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = v14;
              if (v14 && objc_msgSend(v14, "length"))
              {
                if (-[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView"))
                {
                  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = CFSTR("webArchiveData");
                  v27 = v9;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("PDFTextSelectionDidCopyData"), self, v16);

                }
                else
                {
                  objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setValue:forPasteboardType:", v9, CFSTR("Apple Web Archive pasteboard type"));
                }

              }
              goto LABEL_20;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_20:

    }
    if (v8)
    {
      if (-[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView"))
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("plainString");
        v25 = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("PDFTextSelectionDidCopyString"), self, v18);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setString:", v8);

      }
      goto LABEL_25;
    }
  }
LABEL_26:

}

- (PDFPage)pageForPoint:(CGPoint)point nearest:(BOOL)nearest
{
  _BOOL8 v4;
  double y;
  double x;
  PDFViewPrivate *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGPoint v40;
  CGRect v41;

  v4 = nearest;
  y = point.y;
  x = point.x;
  v8 = self->_private;
  if (!v8->isUsingPageViewController)
  {
    -[PDFView document](self, "document");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && (objc_msgSend(v15, "isLocked") & 1) == 0)
    {
      -[PDFView documentView](self, "documentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v18, x, y);
      v20 = v19;
      v22 = v21;

      -[PDFView documentView](self, "documentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      v25 = v24 - v22;

      -[PDFView PDFLayout](self, "PDFLayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFView currentPage](self, "currentPage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pageNearestPoint:currentPage:", v27, v20, v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        goto LABEL_6;
      -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v14, x, y);
      v29 = v28;
      v31 = v30;
      v32 = PDFRectToCGRect(objc_msgSend(v14, "boundsForBox:", -[PDFView displayBox](self, "displayBox")));
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v40.x = PDFPointToCGPoint(v29, v31);
      v40.y = v39;
      v41.origin.x = v32;
      v41.origin.y = v34;
      v41.size.width = v36;
      v41.size.height = v38;
      if (CGRectContainsPoint(v41, v40))
        goto LABEL_6;

    }
    v14 = 0;
LABEL_6:

    return (PDFPage *)v14;
  }
  -[PDFDocumentViewController view](v8->documentViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
  v11 = v10;
  v13 = v12;

  -[PDFDocumentViewController pageForPoint:nearest:](self->_private->documentViewController, "pageForPoint:nearest:", v4, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  return (PDFPage *)v14;
}

- (CGPoint)convertPoint:(CGPoint)point toPage:(PDFPage *)page
{
  double y;
  double x;
  PDFPage *v7;
  PDFPage *v8;
  PDFViewPrivate *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGPoint result;

  y = point.y;
  x = point.x;
  v7 = page;
  v8 = v7;
  v9 = self->_private;
  if (v9->isUsingPageViewController)
  {
    -[PDFDocumentViewController view](v9->documentViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
    v12 = v11;
    v14 = v13;

    -[PDFDocumentViewController convertPoint:toPage:](self->_private->documentViewController, "convertPoint:toPage:", v8, v12, v14);
    x = v15;
    y = v16;
  }
  else if (v7)
  {
    -[PDFView documentView](self, "documentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v17, x, y);
    v19 = v18;
    v21 = v20;

    -[PDFView documentView](self, "documentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23 - v21;

    -[PDFView PDFLayout](self, "PDFLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "convertPoint:toPage:", v8, v19, v24);
    x = v26;
    y = v27;

  }
  v28 = x;
  v29 = y;
  result.y = v29;
  result.x = v28;
  return result;
}

- (CGRect)convertRect:(CGRect)rect toPage:(PDFPage *)page
{
  double height;
  double width;
  double y;
  double x;
  PDFPage *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MaxX;
  double MaxY;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v9 = page;
  -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v9, x, y);
  v11 = v10;
  v13 = v12;
  MaxX = PDFRectGetMaxX(x, y, width);
  MaxY = PDFRectGetMaxY(x, y, width, height);
  -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v9, PDFPointMake(MaxX, MaxY));
  v17 = v16;

  v18 = PDFRectFromPDFPoints(v11, v13, v17);
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)point fromPage:(PDFPage *)page
{
  double y;
  double x;
  PDFPage *v7;
  PDFPage *v8;
  PDFViewPrivate *v9;
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
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGPoint result;

  y = point.y;
  x = point.x;
  v7 = page;
  v8 = v7;
  v9 = self->_private;
  if (v9->isUsingPageViewController)
  {
    -[PDFDocumentViewController convertPoint:fromPage:](v9->documentViewController, "convertPoint:fromPage:", v7, x, y);
    v11 = v10;
    v13 = v12;
    -[PDFDocumentViewController view](self->_private->documentViewController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertPoint:toView:", self, v11, v13);
LABEL_5:
    x = v15;
    y = v16;

    goto LABEL_6;
  }
  if (v7)
  {
    -[PDFView PDFLayout](self, "PDFLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertPoint:fromPage:", v8, x, y);
    v19 = v18;
    v21 = v20;

    -[PDFView documentView](self, "documentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23 - v21;

    -[PDFView documentView](self, "documentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView convertPoint:fromView:](self, "convertPoint:fromView:", v14, v19, v24);
    goto LABEL_5;
  }
LABEL_6:

  v25 = x;
  v26 = y;
  result.y = v26;
  result.x = v25;
  return result;
}

- (CGRect)convertRect:(CGRect)rect fromPage:(PDFPage *)page
{
  double height;
  double width;
  double y;
  double x;
  PDFPage *v9;
  double MinX;
  double MinY;
  double v12;
  double v13;
  double v14;
  double v15;
  double MaxX;
  double MaxY;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v9 = page;
  MinX = PDFRectGetMinX(x, y, width);
  MinY = PDFRectGetMinY(x, y, width, height);
  -[PDFView convertPoint:fromPage:](self, "convertPoint:fromPage:", v9, PDFPointMake(MinX, MinY));
  v13 = v12;
  v15 = v14;
  MaxX = PDFRectGetMaxX(x, y, width);
  MaxY = PDFRectGetMaxY(x, y, width, height);
  -[PDFView convertPoint:fromPage:](self, "convertPoint:fromPage:", v9, PDFPointMake(MaxX, MaxY));
  v19 = v18;

  v20 = PDFRectFromPDFPoints(v13, v15, v19);
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (UIView)documentView
{
  return (UIView *)-[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
}

- (id)pdfDocumentView
{
  return -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
}

- (void)layoutDocumentView
{
  unint64_t currentPageIndex;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_private->scaling)
  {
    currentPageIndex = self->_currentPageIndex;
    -[PDFView document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pageCount");

    if (currentPageIndex >= v5)
    {
      -[PDFView document](self, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "pageCount"))
      {
        -[PDFView document](self, "document");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "pageCount") - 1;

      }
      else
      {
        v8 = 0;
      }

      -[PDFView setCurrentPageIndex:withNotification:](self, "setCurrentPageIndex:withNotification:", v8, 0);
    }
  }
  -[PDFView PDFLayout](self, "PDFLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateInternalDocumentGeometry");

  -[PDFView _findVisiblePages](self, "_findVisiblePages");
  -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutDocumentView");

  -[PDFView _resizeDisplayView:](self, "_resizeDisplayView:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("PDFViewDidLayoutDocumentView"), self);

}

- (void)annotationsChangedOnPage:(PDFPage *)page
{
  void *v4;
  PDFPage *v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = page;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v5, CFSTR("page"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("PDFViewAnnotationsDidChange"), self, v6);
}

- (CGSize)rowSizeForPage:(PDFPage *)page
{
  PDFPage *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  char v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  v4 = page;
  -[PDFView PDFLayout](self, "PDFLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSizeWithCurrentPage:", v4);
  v7 = v6;
  v9 = v8;

  v10 = round(v7);
  -[PDFView gutterWidth](self, "gutterWidth");
  if (v11 > 0.0)
  {
    -[PDFView gutterWidth](self, "gutterWidth");
    v10 = v10 + v12;
    -[PDFView PDFLayout](self, "PDFLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "functionalDisplayMode");

    if (v14 >= 2)
    {
      -[PDFView gutterWidth](self, "gutterWidth");
      v10 = v10 + v15;
    }
  }
  -[PDFView PDFLayout](self, "PDFLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "functionalDisplayMode");

  if ((v17 & 1) != 0)
  {
    -[PDFView _pageViewHeight:](self, "_pageViewHeight:", v4);
    v18 = v19;
  }
  else
  {
    v18 = round(v9);
  }
  -[PDFView scaleFactor](self, "scaleFactor");
  v21 = v18 * v20;
  -[PDFView scaleFactor](self, "scaleFactor");
  v23 = v10 * v22;

  v24 = v23;
  v25 = v21;
  result.height = v25;
  result.width = v24;
  return result;
}

- (NSArray)visiblePages
{
  id v3;
  PDFViewPrivate *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = self->_private;
  if (v4->isUsingPageViewController)
  {
    -[PDFDocumentViewController pageViews](v4->documentViewController, "pageViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "page");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v4 = self->_private;
  }
  if ((int)-[PDFDocument pageCount](v4->document, "pageCount") >= 1)
  {
    v11 = 0;
    do
    {
      -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pageViewForPageAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && objc_msgSend(v13, "isVisible"))
      {
        -[PDFDocument pageAtIndex:](self->_private->document, "pageAtIndex:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v3, "addObject:", v14);

      }
      ++v11;
    }
    while (v11 < (int)-[PDFDocument pageCount](self->_private->document, "pageCount"));
  }
  return (NSArray *)v3;
}

- (id)visiblePageViews
{
  PDFViewPrivate *v2;
  void *v3;
  void *v4;

  v2 = self->_private;
  if (v2->isUsingPageViewController)
  {
    -[PDFDocumentViewController pageViews](v2->documentViewController, "pageViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PDFScrollView pdfDocumentView](v2->scrollView, "pdfDocumentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pageViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)visibleAnnotations
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[PDFView visiblePages](self, "visiblePages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "annotations");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              objc_msgSend(v14, "bounds");
              if (-[PDFView isRectVisible:onPage:](self, "isRectVisible:onPage:", v8))
                objc_msgSend(v4, "addObject:", v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v11);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)enableBackgroundImages:(BOOL)a3
{
  void *v5;
  id v6;

  -[PDFRenderingProperties setEnableBackgroundImages:](self->_private->renderingProperties, "setEnableBackgroundImages:");
  if (!a3)
  {
    -[PDFView documentView](self, "documentView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pageBackgroundManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

  }
}

- (BOOL)backgroundImagesEnabled
{
  return -[PDFRenderingProperties enableBackgroundImages](self->_private->renderingProperties, "enableBackgroundImages");
}

- (void)setBackgroundImage:(id)a3 forPage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[PDFView documentView](self, "documentView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexForPage:", v6);

  objc_msgSend(v11, "pageBackgroundManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "forceSetBackgroundImage:forPageIndex:", v7, v9);

}

- (void)setEnableDataDetectors:(BOOL)enableDataDetectors
{
  -[PDFDocument setEnableDataDetectors:](self->_private->document, "setEnableDataDetectors:", enableDataDetectors);
}

- (BOOL)enableDataDetectors
{
  return -[PDFDocument enableDataDetectors](self->_private->document, "enableDataDetectors");
}

- (id)controller
{
  return self->_private->controller;
}

- (double)PDFViewWillChangeScaleFactor:(id)a3 toScale:(double)a4
{
  double v6;
  double result;
  double v8;

  -[PDFView minScaleFactor](self, "minScaleFactor", a3);
  if (v6 <= a4)
  {
    -[PDFView maxScaleFactor](self, "maxScaleFactor");
    if (v8 >= a4)
      return a4;
    else
      -[PDFView maxScaleFactor](self, "maxScaleFactor");
  }
  else
  {
    -[PDFView minScaleFactor](self, "minScaleFactor");
  }
  return result;
}

- (void)PDFViewWillClickOnLink:(id)a3 withURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  if (a3)
  {
    v16 = v6;
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "canOpenURL:", v16))
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openURL:options:completionHandler:", v16, MEMORY[0x24BDBD1B8], 0);
    }
    else
    {
      PDFKitLocalizedString(CFSTR("ERROR: Cannot open URL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x24BDD17C8];
      PDFKitLocalizedString(CFSTR("Link: %@"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      PDFKitLocalizedString(CFSTR("OK"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v8, v11, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v12, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAction:", v14);
      -[PDFView parentViewController](self, "parentViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "presentViewController:animated:completion:", v13, 1, 0);

    }
    v6 = v16;
  }

}

- (id)viewForPage:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;

  v4 = -[PDFDocument indexForPage:](self->_private->document, "indexForPage:", a3);
  if (v4 >= -[PDFDocument pageCount](self->_private->document, "pageCount"))
  {
    v6 = 0;
  }
  else
  {
    -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pageViewForPageAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)colorWidgetBackgrounds:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v5 = -[PDFDocument pageCount](self->_private->document, "pageCount");
  if (v5 >= 1)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pageViewForPageAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFDocument pageAtIndex:](self->_private->document, "pageAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "colorWidgetBackgrounds:", v3);
      objc_msgSend(v10, "setColorWidgetBackgrounds:", v3);

    }
  }
}

- (void)drawDetectedAnnotationBounds:(BOOL)a3
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
  -[PDFView visiblePageViews](self, "visiblePageViews");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "enableHighlightDetectedFormFields:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (PDFView)initWithCoder:(id)a3
{
  id v4;
  PDFView *v5;
  PDFView *v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  float v12;
  float v13;
  double v14;
  double v15;
  float v16;
  float v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  int v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  float v27;
  float v28;
  float v29;
  unsigned __int8 v30;
  int v31;
  unsigned __int8 v32;
  float v33;
  unsigned __int8 v34;
  int v35;
  int v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PDFView;
  v5 = -[PDFView initWithCoder:](&v37, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[PDFView _commonInit](v5, "_commonInit");
    if (!objc_msgSend(v4, "allowsKeyedCoding"))
    {
      v36 = 0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "i", &v36);
      v35 = 0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "i", &v35);
      -[PDFView setDisplayMode:](v6, "setDisplayMode:", v35);
      v34 = 1;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "B", &v34);
      -[PDFView setDisplaysPageBreaks:](v6, "setDisplaysPageBreaks:", v34);
      v33 = 1.0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "f", &v33);
      -[PDFView setScaleFactor:](v6, "setScaleFactor:", v33);
      v32 = 0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "B", &v32);
      -[PDFView setAutoScales:](v6, "setAutoScales:", v32);
      v31 = 0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "i", &v31);
      -[PDFView setDisplayDirection:](v6, "setDisplayDirection:", v31);
      v30 = 0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "B", &v30);
      -[PDFView setDisplaysRTL:](v6, "setDisplaysRTL:", v30);
      v29 = 1.0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "f", &v29);
      -[PDFView setMinScaleFactor:](v6, "setMinScaleFactor:", v29);
      v28 = 1.0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "f", &v28);
      -[PDFView setMinScaleFactor:](v6, "setMinScaleFactor:", v28);
      v27 = 1.0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "f", &v27);
      v20 = v27;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "f", &v27);
      v21 = v27;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "f", &v27);
      v22 = v27;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "f", &v27);
      -[PDFView setPageBreakMargins:](v6, "setPageBreakMargins:", v22, v20, v27, v21);
      v26 = 0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "B", &v26);
      -[PDFView setDisplaysAsBook:](v6, "setDisplaysAsBook:", v26);
      v25 = 0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "B", &v25);
      -[PDFView setEnableDataDetectors:](v6, "setEnableDataDetectors:", v25);
      v24 = 2;
      objc_msgSend(v4, "decodeValueOfObjCType:at:", "i", &v24);
      v19 = v24;
      goto LABEL_41;
    }
    objc_msgSend(v4, "containsValueForKey:", CFSTR("Version"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("DisplayMode")))
      -[PDFView setDisplayMode:](v6, "setDisplayMode:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("DisplayMode")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PageBreaks")))
      -[PDFView setDisplaysPageBreaks:](v6, "setDisplaysPageBreaks:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PageBreaks")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ScaleFactor")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ScaleFactor"));
      -[PDFView setScaleFactor:](v6, "setScaleFactor:", v7);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AutoScale")))
      -[PDFView setAutoScales:](v6, "setAutoScales:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AutoScale")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("DisplayDirection")))
      -[PDFView setDisplayDirection:](v6, "setDisplayDirection:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisplayDirection")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("DisplaysRTL")))
      -[PDFView setDisplaysRTL:](v6, "setDisplaysRTL:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisplaysRTL")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MinScaleFactor")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MinScaleFactor"));
      -[PDFView setMinScaleFactor:](v6, "setMinScaleFactor:", v8);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MaxScaleFactor")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MaxScaleFactor"));
      -[PDFView setMaxScaleFactor:](v6, "setMaxScaleFactor:", v9);
    }
    if (-[PDFView displaysPageBreaks](v6, "displaysPageBreaks"))
    {
      v10 = 4.0;
      v11 = 4.0;
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PageBreakMargins.left")))
      {
        objc_msgSend(v4, "decodeFloatForKey:", CFSTR("PageBreakMargins.left"));
        v11 = v12;
      }
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PageBreakMargins.left")))
      {
        objc_msgSend(v4, "decodeFloatForKey:", CFSTR("PageBreakMargins.right"));
        v10 = v13;
      }
      v14 = 4.75;
      v15 = 4.75;
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PageBreakMargins.top")))
      {
        objc_msgSend(v4, "decodeFloatForKey:", CFSTR("PageBreakMargins.top"));
        v15 = v16;
      }
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PageBreakMargins.bottom")))
      {
        objc_msgSend(v4, "decodeFloatForKey:", CFSTR("PageBreakMargins.bottom"));
        v14 = v17;
      }
      -[PDFView setPageBreakMargins:](v6, "setPageBreakMargins:", v15, v11, v14, v10);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("DisplaysAsBook")))
      -[PDFView setDisplaysAsBook:](v6, "setDisplaysAsBook:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisplaysAsBook")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("BackgroundColor")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BackgroundColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[PDFView setBackgroundColor:](v6, "setBackgroundColor:", v18);
      }

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("EnableDataDetectors")))
      -[PDFView setEnableDataDetectors:](v6, "setEnableDataDetectors:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnableDataDetectors")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("InterpolationQuality")))
    {
      v19 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("InterpolationQuality"));
LABEL_41:
      -[PDFView setInterpolationQuality:](v6, "setInterpolationQuality:", v19);
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFView;
  -[PDFView encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (PDFView)initWithFrame:(CGRect)a3
{
  PDFView *v3;
  PDFView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDFView;
  v3 = -[PDFView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PDFView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  PDFViewPrivate *v4;
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
  v14.super_class = (Class)PDFView;
  -[PDFView setFrame:](&v14, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = self->_private;
  if (v4)
  {
    if (v4->autoScale)
      -[PDFView _internalSetAutoScaleFactor](self, "_internalSetAutoScaleFactor");
    -[PDFView _updateBookmarksForPages](self, "_updateBookmarksForPages");
    -[PDFView visiblePageViews](self, "visiblePageViews");
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setNeedsTilesUpdate");
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PDFViewPrivate *v8;
  void *v9;
  void *v10;
  PDFViewPrivate *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  dispatch_time_t v16;
  _QWORD block[5];
  id v18;
  id location;
  objc_super v20;

  if (self->_private)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v20.receiver = self;
    v20.super_class = (Class)PDFView;
    -[PDFView setBounds:](&v20, sel_setBounds_, x, y, width, height);
    v8 = self->_private;
    if (v8->autoScale)
    {
      -[PDFView _internalSetAutoScaleFactor](self, "_internalSetAutoScaleFactor");
      v8 = self->_private;
    }
    -[PDFPasswordViewController viewIfLoaded](v8->passwordViewController, "viewIfLoaded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "setFrame:", x, y, width, height);
    -[PDFView _updateBookmarksForPages](self, "_updateBookmarksForPages");
    v11 = self->_private;
    -[PDFView safeAreaInsets](self, "safeAreaInsets");
    v11->savedSafeAreaInsets.top = v12;
    v11->savedSafeAreaInsets.left = v13;
    v11->savedSafeAreaInsets.bottom = v14;
    v11->savedSafeAreaInsets.right = v15;
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    objc_initWeak(&location, self);
    v16 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __21__PDFView_setBounds___block_invoke;
    block[3] = &unk_24C25CD18;
    objc_copyWeak(&v18, &location);
    block[4] = self;
    dispatch_after(v16, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    -[PDFView layoutDocumentView](self, "layoutDocumentView");
  }
}

void __21__PDFView_setBounds___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "visiblePageViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setNeedsTilesUpdate");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)layoutSubviews
{
  dispatch_time_t v3;
  _QWORD block[5];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFView;
  -[PDFView layoutSubviews](&v7, sel_layoutSubviews);
  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 100000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__PDFView_layoutSubviews__block_invoke;
  block[3] = &unk_24C25CD18;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __25__PDFView_layoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v3 = *(id *)(a1 + 32);
    objc_msgSend(v3, "visiblePageViews");
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setNeedsTilesUpdate");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[PDFView clearSelection](self, "clearSelection");
  v3.receiver = self;
  v3.super_class = (Class)PDFView;
  -[PDFView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (void)_commonInit
{
  PDFViewPrivate *v3;
  PDFViewPrivate *v4;
  PDFViewPrivate *v5;
  PDFDocument *document;
  PDFViewPrivate *v7;
  PDFSelection *currentSelection;
  PDFViewPrivate *v9;
  __int128 v10;
  PDFViewLayout *v11;
  PDFViewPrivate *v12;
  PDFViewLayout *viewLayout;
  PDFRenderingProperties *v14;
  PDFViewPrivate *v15;
  PDFRenderingProperties *renderingProperties;
  PDFViewPrivate *v17;
  PDFPage *fromPage;
  uint64_t v19;
  PDFViewPrivate *v20;
  NSMutableArray *destinationHistory;
  PDFViewPrivate *v22;
  NSArray *highlights;
  PDFCoachMarkManager *v24;
  PDFViewPrivate *v25;
  PDFCoachMarkManager *coachMarkManager;
  PDFViewPrivate *v27;
  PDFPasswordViewController *passwordViewController;
  PDFViewPrivate *v29;
  PDFAnnotation *annotationOver;
  PDFViewController *v31;
  PDFViewPrivate *v32;
  PDFViewController *controller;
  PDFViewDebugFlags *v34;
  PDFViewPrivate *v35;
  PDFViewDebugFlags *debugFlags;
  id v37;

  self->_annotationEditingAllowed = 1;
  self->_formDetectionEnabled = 0;
  v3 = objc_alloc_init(PDFViewPrivate);
  v4 = self->_private;
  self->_private = v3;

  v5 = self->_private;
  document = v5->document;
  v5->document = 0;

  v7 = self->_private;
  currentSelection = v7->currentSelection;
  v7->currentSelection = 0;

  self->_private->autoScale = 0;
  self->_private->zoomIncrement = 1.1892;
  objc_storeWeak((id *)&self->_private->delegate, 0);
  self->_private->delegateWillScale = 0;
  self->_private->delegateOrdersPageDrawing = 0;
  self->_private->gutterWide = 0.0;
  self->_private->displaysPageBreaks = 1;
  self->_private->pageBreakMargins = *(UIEdgeInsets *)kPDFViewDefaultPageBreakMargins;
  v9 = self->_private;
  v10 = *MEMORY[0x24BDF7718];
  *(_OWORD *)&v9->documentMargins.bottom = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  *(_OWORD *)&v9->documentMargins.top = v10;
  self->_private->displayMode = 1;
  self->_private->displayDirection = 0;
  v11 = objc_alloc_init(PDFViewLayout);
  v12 = self->_private;
  viewLayout = v12->viewLayout;
  v12->viewLayout = v11;

  -[PDFViewLayout setDelegate:](self->_private->viewLayout, "setDelegate:", self);
  self->_private->displaysAsBook = 0;
  self->_private->displaysRTL = 0;
  v14 = objc_alloc_init(PDFRenderingProperties);
  v15 = self->_private;
  renderingProperties = v15->renderingProperties;
  v15->renderingProperties = v14;

  -[PDFRenderingProperties setPDFView:](self->_private->renderingProperties, "setPDFView:", self);
  self->_private->lastVerticalScrollDirection = 2;
  self->_private->lastHorizontalScrollDirection = 1;
  self->_private->displaysBookmarksForPages = 0;
  self->_private->firstVisiblePage = 0;
  self->_private->lastVisiblePage = 0;
  self->_private->inhibitAutoScroll = 0;
  v17 = self->_private;
  fromPage = v17->fromPage;
  v17->fromPage = 0;

  v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
  v20 = self->_private;
  destinationHistory = v20->destinationHistory;
  v20->destinationHistory = (NSMutableArray *)v19;

  self->_private->historyIndex = 0;
  v22 = self->_private;
  highlights = v22->highlights;
  v22->highlights = 0;

  v24 = -[PDFCoachMarkManager initWithPDFRenderingProperties:]([PDFCoachMarkManager alloc], "initWithPDFRenderingProperties:", self->_private->renderingProperties);
  v25 = self->_private;
  coachMarkManager = v25->coachMarkManager;
  v25->coachMarkManager = v24;

  v27 = self->_private;
  passwordViewController = v27->passwordViewController;
  v27->passwordViewController = 0;

  v29 = self->_private;
  annotationOver = v29->annotationOver;
  v29->annotationOver = 0;

  self->_private->showsScrollIndicators = 1;
  self->_private->dataDetectorsEnabled = 1;
  self->_private->blockingWaitDuration = 0.0;
  self->_private->inFormFillingMode = 0;
  self->_private->formFillingUpdatesAnnotationOnEveryTextChange = 0;
  self->_private->allowsMarkupAnnotationEditing = 0;
  self->_private->allowsUndo = 1;
  self->_private->textSelectionEnabled = 0;
  v31 = -[PDFViewController initWithView:]([PDFViewController alloc], "initWithView:", self);
  v32 = self->_private;
  controller = v32->controller;
  v32->controller = v31;

  -[PDFView colorWidgetBackgrounds:](self, "colorWidgetBackgrounds:", GetDefaultsWriteColorWidgetBackgrounds());
  -[PDFView _setupScrollView](self, "_setupScrollView");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObserver:selector:name:object:", self, sel_pdfViewDidChangeScale_, CFSTR("PDFViewScaleChanged"), self);
  objc_msgSend(v37, "addObserver:selector:name:object:", self, sel_pdfViewDidChangePage_, CFSTR("PDFViewChangedPage"), self);
  objc_msgSend(v37, "addObserver:selector:name:object:", self, sel_visiblePagesChanged_, CFSTR("PDFViewVisiblePagesChanged"), self);
  v34 = -[PDFViewDebugFlags initWithView:]([PDFViewDebugFlags alloc], "initWithView:", self);
  v35 = self->_private;
  debugFlags = v35->debugFlags;
  v35->debugFlags = v34;

}

- (void)dealloc
{
  PDFOverlayViewsController *overlayViewController;
  PDFOverlayViewsController *v4;
  void *v5;
  PDFViewPrivate *v6;
  PDFViewDebugFlags *debugFlags;
  objc_super v8;

  overlayViewController = self->_overlayViewController;
  if (overlayViewController)
  {
    -[PDFOverlayViewsController teardown](overlayViewController, "teardown");
    v4 = self->_overlayViewController;
    self->_overlayViewController = 0;

  }
  -[PDFView _releaseDocument](self, "_releaseDocument");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6 = self->_private;
  debugFlags = v6->debugFlags;
  v6->debugFlags = 0;

  v8.receiver = self;
  v8.super_class = (Class)PDFView;
  -[PDFView dealloc](&v8, sel_dealloc);
}

- (CGAffineTransform)_transformFromPageToPageView:(SEL)a3
{
  id v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  uint64_t v20;
  double MinX;
  CGFloat v22;
  double MinY;
  CGFloat v24;
  uint64_t v25;
  double Width;
  double Height;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGAffineTransform *result;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGFloat rect;
  __int128 recta;
  CGFloat v39;
  __int128 v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v6 = a4;
  v7 = PDFRectToCGRect(objc_msgSend(v6, "boundsForBox:", 0));
  v9 = v8;
  v39 = v10;
  v12 = v11;
  rect = v11;
  v13 = PDFRectToCGRect(objc_msgSend(v6, "boundsForBox:", -[PDFView displayBox](self, "displayBox")));
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = objc_msgSend(v6, "rotation");

  v47.origin.x = v7;
  v47.origin.y = v9;
  v47.size.width = v39;
  v47.size.height = v12;
  MinX = CGRectGetMinX(v47);
  v48.origin.x = v13;
  v48.origin.y = v15;
  v48.size.width = v17;
  v48.size.height = v19;
  v22 = MinX - CGRectGetMinX(v48);
  v49.origin.x = v7;
  v49.origin.y = v9;
  v49.size.width = v39;
  v49.size.height = rect;
  MinY = CGRectGetMinY(v49);
  v50.origin.x = v13;
  v50.origin.y = v15;
  v50.size.width = v17;
  v50.size.height = v19;
  v24 = CGRectGetMinY(v50);
  v25 = MEMORY[0x24BDBD8B8];
  recta = *MEMORY[0x24BDBD8B8];
  v40 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v40;
  v36 = *(_OWORD *)(v25 + 32);
  *(_OWORD *)&retstr->tx = v36;
  CGAffineTransformMakeTranslation(&t2, v22, MinY - v24);
  *(_OWORD *)&t1.a = recta;
  *(_OWORD *)&t1.c = v40;
  *(_OWORD *)&t1.tx = v36;
  CGAffineTransformConcat(retstr, &t1, &t2);
  Width = 0.0;
  if (v20 > 179)
  {
    if (v20 == 180)
    {
      v28 = PDFDegToRad(180.0);
      v54.origin.x = v13;
      v54.origin.y = v15;
      v54.size.width = v17;
      v54.size.height = v19;
      Width = CGRectGetWidth(v54);
      Height = 0.0;
    }
    else
    {
      Height = 0.0;
      if (v20 != 270)
        goto LABEL_12;
      v28 = PDFDegToRad(-90.0);
      v51.origin.x = v13;
      v51.origin.y = v15;
      v51.size.width = v17;
      v51.size.height = v19;
      Width = CGRectGetHeight(v51);
      v52.origin.x = v13;
      v52.origin.y = v15;
      v52.size.width = v17;
      v52.size.height = v19;
      Height = CGRectGetWidth(v52);
    }
    goto LABEL_10;
  }
  if (!v20)
  {
    v53.origin.x = v13;
    v53.origin.y = v15;
    v53.size.width = v17;
    v53.size.height = v19;
    Height = CGRectGetHeight(v53);
    goto LABEL_12;
  }
  Height = 0.0;
  if (v20 == 90)
  {
    v28 = PDFDegToRad(90.0);
LABEL_10:
    if (v28 != 0.0)
    {
      CGAffineTransformMakeRotation(&v44, -v28);
      v29 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v43.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v43.c = v29;
      *(_OWORD *)&v43.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformConcat(&t1, &v43, &v44);
      v30 = *(_OWORD *)&t1.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
      *(_OWORD *)&retstr->c = v30;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
    }
  }
LABEL_12:
  CGAffineTransformMakeScale(&v42, 1.0, -1.0);
  v31 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v43.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v43.c = v31;
  *(_OWORD *)&v43.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&t1, &v43, &v42);
  v33 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v33;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  if (Width != 0.0 || Height != 0.0)
  {
    CGAffineTransformMakeTranslation(&v41, Width, Height);
    v34 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v43.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v43.c = v34;
    *(_OWORD *)&v43.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&t1, &v43, &v41);
    v35 = *(_OWORD *)&t1.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&retstr->c = v35;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  }
  return result;
}

- (CGAffineTransform)_transformFromPageViewToPage:(SEL)a3
{
  CGAffineTransform v6[2];

  memset(&v6[1], 0, sizeof(CGAffineTransform));
  -[PDFView _transformFromPageToPageView:](self, "_transformFromPageToPageView:", a4);
  v6[0] = v6[1];
  return CGAffineTransformInvert(retstr, v6);
}

- (void)_setupPasswordView
{
  PDFPasswordViewController *passwordViewController;
  PDFPasswordViewController *v4;
  PDFViewPrivate *v5;
  PDFPasswordViewController *v6;
  void *v7;
  void *v8;
  id v9;

  passwordViewController = self->_private->passwordViewController;
  if (!passwordViewController)
  {
    v4 = -[PDFPasswordViewController initWithDelegate:]([PDFPasswordViewController alloc], "initWithDelegate:", self);
    v5 = self->_private;
    v6 = v5->passwordViewController;
    v5->passwordViewController = v4;

    passwordViewController = self->_private->passwordViewController;
  }
  -[PDFPasswordViewController view](passwordViewController, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFPasswordViewController view](self->_private->passwordViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[PDFView addSubview:](self, "addSubview:", v9);
    objc_msgSend(v9, "setAutoresizesSubviews:", 1);
    objc_msgSend(v9, "setAutoresizingMask:", 18);
    -[PDFView bounds](self, "bounds");
    objc_msgSend(v9, "setFrame:");
  }
  objc_msgSend(v9, "setHidden:", 0);

}

- (void)_removePasswordView
{
  void *v2;
  id v3;

  -[PDFPasswordViewController viewIfLoaded](self->_private->passwordViewController, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "setHidden:", 1);
    objc_msgSend(v3, "removeFromSuperview");
    v2 = v3;
  }

}

- (void)_updatePasswordView
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[PDFPasswordViewController viewIfLoaded](self->_private->passwordViewController, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "isHidden");
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      -[PDFView bringSubviewToFront:](self, "bringSubviewToFront:", v6);
      v4 = v6;
    }
  }

}

- (BOOL)userDidEnterPassword:(id)a3 forPasswordViewController:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v5 = a3;
  -[PDFView document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLocked");

  if (v7
    && (-[PDFView document](self, "document"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "unlockWithPassword:", v5),
        v8,
        (v9 & 1) == 0))
  {
    -[PDFView window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rootViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "viewControllers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", 0);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    objc_msgSend(v12, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v12, "presentedViewController");
      v16 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v16;
    }
    -[PDFPasswordViewController presentInvalidPasswordAlertWithParentViewController:](self->_private->passwordViewController, "presentInvalidPasswordAlertWithParentViewController:", v12);

    v10 = 0;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)_ensureOverlayViewController
{
  PDFOverlayViewsController *v3;
  PDFOverlayViewsController *overlayViewController;

  if (!self->_overlayViewController)
  {
    +[PDFOverlayViewsController instanceForPlatformWithPDFView:](PDFOverlayViewsController, "instanceForPlatformWithPDFView:", self);
    v3 = (PDFOverlayViewsController *)objc_claimAutoreleasedReturnValue();
    overlayViewController = self->_overlayViewController;
    self->_overlayViewController = v3;

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  char v9;
  int v10;
  unsigned __int8 v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a4;
  v7 = -[PDFViewController textSelectionMenu](self->_private->controller, "textSelectionMenu");
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("delete:"));

  if (v7 == 1
    && -[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView")
    || -[PDFView akAnnotationEditingEnabled](self, "akAnnotationEditingEnabled"))
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PDFView;
    v11 = -[PDFView canPerformAction:withSender:](&v17, sel_canPerformAction_withSender_, a3, v6);
    NSStringFromSelector(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("_lookup:"));

    if (v13)
    {
      -[PDFView currentSelection](self, "currentSelection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[PDFView currentSelection](self, "currentSelection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v15, "isEmpty") ^ 1;

      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
    else
    {
      LOBYTE(v10) = v11 & ~v9;
    }
  }

  return v10;
}

- (void)gestureInit
{
  PDFViewPrivate *v3;
  uint64_t v4;
  PDFViewPrivate *v5;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  uint64_t v7;
  PDFViewPrivate *v8;
  UITapGestureRecognizer *tapGestureRecognizer;
  uint64_t v10;
  PDFViewPrivate *v11;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  id v13;

  v3 = self->_private;
  if (!v3->longPressGestureRecognizer)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self->_private->controller, sel_handleGesture_);
    v5 = self->_private;
    longPressGestureRecognizer = v5->longPressGestureRecognizer;
    v5->longPressGestureRecognizer = (UILongPressGestureRecognizer *)v4;

    -[UILongPressGestureRecognizer setDelegate:](self->_private->longPressGestureRecognizer, "setDelegate:", self);
    -[PDFView addGestureRecognizer:](self, "addGestureRecognizer:", self->_private->longPressGestureRecognizer);
    v3 = self->_private;
  }
  if (!v3->tapGestureRecognizer)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self->_private->controller, sel_handleGesture_);
    v8 = self->_private;
    tapGestureRecognizer = v8->tapGestureRecognizer;
    v8->tapGestureRecognizer = (UITapGestureRecognizer *)v7;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_private->tapGestureRecognizer, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setDelegate:](self->_private->tapGestureRecognizer, "setDelegate:", self);
    -[UITapGestureRecognizer setAllowedTouchTypes:](self->_private->tapGestureRecognizer, "setAllowedTouchTypes:", &unk_24C27DBF0);
    -[PDFView addGestureRecognizer:](self, "addGestureRecognizer:", self->_private->tapGestureRecognizer);
    v3 = self->_private;
  }
  if (!v3->doubleTapGestureRecognizer)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self->_private->controller, sel_handleGesture_);
    v11 = self->_private;
    doubleTapGestureRecognizer = v11->doubleTapGestureRecognizer;
    v11->doubleTapGestureRecognizer = (UITapGestureRecognizer *)v10;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_private->doubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
    -[UITapGestureRecognizer setDelegate:](self->_private->doubleTapGestureRecognizer, "setDelegate:", self);
    -[PDFView addGestureRecognizer:](self, "addGestureRecognizer:", self->_private->doubleTapGestureRecognizer);
    v3 = self->_private;
  }
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v3->tapGestureRecognizer, "requireGestureRecognizerToFail:", v3->longPressGestureRecognizer);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_private->tapGestureRecognizer, "requireGestureRecognizerToFail:", self->_private->doubleTapGestureRecognizer);
  -[PDFScrollView panGestureRecognizer](self->_private->scrollView, "panGestureRecognizer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requireGestureRecognizerToFail:", self->_private->longPressGestureRecognizer);

}

- (void)addGestureRecognizer:(id)a3
{
  void *v4;
  PDFViewPrivate *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PDFView;
  -[PDFView addGestureRecognizer:](&v9, sel_addGestureRecognizer_, a3);
  -[PDFView documentView](self, "documentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_private;
  if (v5->isUsingPageViewController)
  {
    -[PDFDocumentViewController currentPage](v5->documentViewController, "currentPage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFDocumentViewController findPageViewControllerForPageIndex:](self->_private->documentViewController, "findPageViewControllerForPageIndex:", -[PDFDocument indexForPage:](self->_private->document, "indexForPage:", v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textInputView");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  objc_msgSend(v4, "updateGestureRecognizerDependencies");

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  v9 = self->_private->doubleTapGestureRecognizer != v6 || (objc_msgSend(v7, "_isPointerTouch") & 1) == 0;

  return v9;
}

- (BOOL)acceptSingleTouch:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v8, v5, v7);
    v10 = v9;
    v12 = v11;
    objc_msgSend(v8, "annotationAtPoint:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13
       || (objc_msgSend(v8, "scannedAnnotationAtPoint:", v10, v12),
           (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      && (objc_msgSend(v13, "handledByPDFKit") & 1) != 0
      || (-[PDFViewController activeAnnotation](self->_private->controller, "activeAnnotation"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      v15 = 1;
    }
    else
    {
      -[PDFView currentSelection](self, "currentSelection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v15 = v16 && !objc_msgSend(v16, "isEmpty");

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  PDFViewPrivate *v10;
  _BOOL4 v11;
  void *v12;
  PDFSelection *currentSelection;
  _BOOL4 v14;
  void *v15;
  char v16;
  void *v17;
  int v18;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v9 = -[PDFView typeForGestureRecognizer:](self, "typeForGestureRecognizer:", v4);
  v10 = self->_private;
  if (v10->tapGestureRecognizer == v4)
  {
    -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0, v6, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    currentSelection = self->_private->currentSelection;
    if (!currentSelection || (v14 = -[PDFSelection isEmpty](currentSelection, "isEmpty"), v12) || v14)
    {
      if (-[PDFView _shouldHandleAnnotationAtLocation:forGestureType:](self, "_shouldHandleAnnotationAtLocation:forGestureType:", v9, v6, v8))
      {

        v10 = self->_private;
        goto LABEL_2;
      }
      -[PDFViewController activeAnnotation](self->_private->controller, "activeAnnotation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isMarkupAnnotationSubtype");
      objc_msgSend(v15, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("/Text"));

      if ((v16 & 1) != 0 || v18)
        -[PDFViewController removeControlForAnnotation:](self->_private->controller, "removeControlForAnnotation:", v15);

      LOBYTE(v11) = 0;
    }
    else
    {
      LOBYTE(v11) = 1;
    }

    goto LABEL_21;
  }
LABEL_2:
  if (v10->doubleTapGestureRecognizer == v4)
  {
    if (!PDFKitIsFormFillingEnabled() || !-[PDFView isInFormFillingMode](self, "isInFormFillingMode"))
    {
      v11 = !-[PDFView isInMarkupMode](self, "isInMarkupMode");
      goto LABEL_21;
    }
    goto LABEL_12;
  }
  if (v10->longPressGestureRecognizer != v4
    || -[PDFView _shouldHandleAnnotationAtLocation:forGestureType:](self, "_shouldHandleAnnotationAtLocation:forGestureType:", v9, v6, v8))
  {
LABEL_12:
    LOBYTE(v11) = 1;
    goto LABEL_21;
  }
  LOBYTE(v11) = 0;
LABEL_21:

  return v11;
}

- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 isIndirectTouch:(BOOL)a7
{
  _BOOL8 v7;
  double y;
  double x;
  double v10;
  double v11;
  id v15;

  v7 = a7;
  y = a6.y;
  x = a6.x;
  v10 = a5.y;
  v11 = a5.x;
  if (a3 != 1 || !a7)
    -[PDFViewController handleGesture:state:location:](self->_private->controller, "handleGesture:state:location:", a3, a4, a5.x, a5.y);
  if (-[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView"))
  {
    -[PDFView documentView](self, "documentView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleGesture:state:location:locationOfFirstTouch:isIndirectTouch:", a3, a4, v7, v11, v10, x, y);

  }
}

- (unint64_t)typeForGestureRecognizer:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "numberOfTapsRequired") == 2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = 2;
    else
      v4 = 4;
  }

  return v4;
}

- (unint64_t)scrollViewMinimumNumberOfTouches
{
  if (!-[PDFView isInMarkupMode](self, "isInMarkupMode"))
    return 1;
  if (objc_msgSend(MEMORY[0x24BDF6C48], "prefersPencilOnlyDrawing"))
    return 1;
  return 2;
}

- (id)pointerRegionForLocation:(CGPoint)a3
{
  double y;
  double x;
  PDFPointerRegion *v6;
  PDFPointerRegion *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v24;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  v6 = [PDFPointerRegion alloc];
  v7 = -[PDFPointerRegion initWithRect:identifier:](v6, "initWithRect:identifier:", CFSTR("PDFPointerRegionPage"), *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v8 = -[PDFView areaOfInterestForPoint:](self, "areaOfInterestForPoint:", x, y);
  if ((v8 & 0xA) != 0)
  {
    v9 = v8;
    -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 1, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v10, x, y);
    if ((v9 & 8) != 0)
    {
      objc_msgSend(v10, "annotationAtPoint:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFPointerRegion setIdentifier:](v7, "setIdentifier:", CFSTR("PDFPointerRegionLink"));
      objc_msgSend(v11, "bounds");
      -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v10);
      -[PDFPointerRegion setRect:](v7, "setRect:");
    }
    else
    {
      if ((v9 & 2) == 0)
      {
LABEL_9:
        -[PDFPointerRegion rect](v7, "rect");
        v25 = PDFRectInset(v24, -1.2, -1.2);
        -[PDFPointerRegion setRect:](v7, "setRect:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
LABEL_10:

        return v7;
      }
      objc_msgSend(v10, "selectionForLineAtPoint:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14 || !objc_msgSend(v14, "length"))
      {

        goto LABEL_10;
      }
      objc_msgSend(v11, "boundsForPage:", v10);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      -[PDFPointerRegion setIdentifier:](v7, "setIdentifier:", CFSTR("PDFPointerRegionText"));
      -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v10, v16, v18, v20, v22);
      -[PDFPointerRegion setRect:](v7, "setRect:");

    }
    goto LABEL_9;
  }
  return v7;
}

- (id)hitTestForSubviewsOfView:(id)a3 atLocation:(CGPoint)a4 withEvent:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  CGFloat v19;
  CGFloat v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  objc_msgSend(v8, "subviews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__PDFView_hitTestForSubviewsOfView_atLocation_withEvent___block_invoke;
  v15[3] = &unk_24C25E2C8;
  v19 = x;
  v20 = y;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v18 = &v21;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __57__PDFView_hitTestForSubviewsOfView_atLocation_withEvent___block_invoke(double *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  id obj;

  v6 = *((_QWORD *)a1 + 4);
  v7 = a1[7];
  v8 = a1[8];
  v9 = a2;
  objc_msgSend(v9, "convertPoint:fromView:", v6, v7, v8);
  objc_msgSend(v9, "hitTest:withEvent:", *((_QWORD *)a1 + 5));
  obj = (id)objc_claimAutoreleasedReturnValue();

  v10 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*((_QWORD *)a1 + 6) + 8) + 40), obj);
    v10 = obj;
    *a4 = 1;
  }

}

- (BOOL)_shouldHandleAnnotationAtLocation:(CGPoint)a3 forGestureType:(unint64_t)a4
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  char v20;
  char v21;
  void *v22;
  char v23;
  char v24;
  BOOL v25;
  char v26;
  char v27;
  void *v28;
  void *v29;
  const __CFString *v31;
  _QWORD v32[2];

  y = a3.y;
  x = a3.x;
  v32[1] = *MEMORY[0x24BDAC8D0];
  -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v8, x, y);
    v10 = v9;
    v12 = v11;
    objc_msgSend(v8, "annotationAtPoint:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFViewController activeAnnotation](self->_private->controller, "activeAnnotation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v8, "scannedAnnotationAtPoint:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        if (a4)
          v25 = 1;
        else
          v25 = v14 == 0;
        v21 = !v25;
        goto LABEL_29;
      }
    }
    objc_msgSend(v13, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("/Link"));
    v17 = objc_msgSend(v15, "isEqualToString:", CFSTR("/Text"));
    v18 = objc_msgSend(v13, "isMarkupAnnotationSubtype");
    v19 = objc_msgSend(v15, "isEqualToString:", CFSTR("/Widget"));
    if (a4)
    {
      if (a4 == 2)
      {
        if (v18)
          v20 = objc_msgSend(v13, "noteContainsPoint:", v10, v12);
        else
          v20 = 0;
        v21 = v17 | v20;
        goto LABEL_28;
      }
    }
    else if (((v16 | v17 | v18) & 1) != 0
           || v19
           && ((objc_msgSend(v13, "valueForAnnotationKey:", CFSTR("/FT")),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("/Btn")),
                (objc_msgSend(v22, "isEqualToString:", CFSTR("/Tx")) & 1) == 0)
             ? (v24 = objc_msgSend(v22, "isEqualToString:", CFSTR("/Ch")))
             : (v24 = 1),
               v13 != v14 ? (v26 = v24) : (v26 = 0),
               v27 = v23 | v26,
               v22,
               (v27 & 1) != 0))
    {
      v21 = 1;
LABEL_28:

LABEL_29:
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = CFSTR("PDFAnnotationHit");
    v32[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("PDFViewAnnotationHit"), self, v29);

    v21 = 0;
    goto LABEL_28;
  }
  v21 = 0;
LABEL_30:

  return v21;
}

- (id)_dragItemsAtLocationInView:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[2];
  CGRect v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_opt_new();
  if (-[PDFDocument allowsCopying](self->_private->document, "allowsCopying"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD15F0]);
    -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v8, x, y);
    v11 = v9;
    v12 = v10;
    if (v8
      && (objc_msgSend(v8, "annotationAtPoint:", v9, v10), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v14 = v13;
      objc_msgSend(v13, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PDFView currentSelection](self, "currentSelection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v14, "URL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "registerObject:visibility:", v17, 0);

        objc_msgSend(v14, "bounds");
        v26 = PDFRectInset(v25, -3.0, -3.0);
        objc_msgSend(v8, "selectionForRect:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFView setCurrentSelection:](self, "setCurrentSelection:", v18);
        goto LABEL_12;
      }
    }
    else
    {
      -[PDFView currentSelection](self, "currentSelection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
    }
    if (!v16
      || (objc_msgSend(v16, "isEmpty") & 1) != 0
      || !objc_msgSend(v16, "containsPoint:onPage:", v8, v11, v12))
    {
      v21 = 0;
LABEL_15:
      v19 = v6;

      goto LABEL_16;
    }
    objc_msgSend(v16, "string");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerObject:visibility:", v20, 0);

    objc_msgSend(v16, "attributedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerObject:visibility:", v18, 0);
LABEL_12:
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69F0]), "initWithItemProvider:", v7);

    if (v21)
    {
      v24[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
      v22 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v22;
    }
    goto LABEL_15;
  }
  v19 = v6;
LABEL_16:

  return v19;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if (-[PDFView isInMarkupMode](self, "isInMarkupMode"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "locationInView:", self);
    -[PDFView _dragItemsAtLocationInView:](self, "_dragItemsAtLocationInView:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      -[UILongPressGestureRecognizer setEnabled:](self->_private->longPressGestureRecognizer, "setEnabled:", 0);
      -[UILongPressGestureRecognizer setEnabled:](self->_private->longPressGestureRecognizer, "setEnabled:", 1);
    }
  }

  return v6;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;
  void *v8;

  y = a5.y;
  x = a5.x;
  if (-[UITapGestureRecognizer state](self->_private->tapGestureRecognizer, "state", a3, a4) == 5)
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    -[PDFView _dragItemsAtLocationInView:](self, "_dragItemsAtLocationInView:", x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  double v38;
  double v39;
  _QWORD v40[4];
  id v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;
  CGRect v57;
  CGRect v58;

  v56 = *MEMORY[0x24BDAC8D0];
  -[PDFView currentSelection](self, "currentSelection", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v6, "pages");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v52;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v11);
      -[PDFView pageViewForPageAtIndex:](self, "pageViewForPageAtIndex:", -[PDFDocument indexForPage:](self->_private->document, "indexForPage:", v12));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isVisible") & 1) != 0)
        break;

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v12;

    if (v15)
    {
      objc_msgSend(v6, "boundsForPage:", v15);
      v58 = CGRectInset(v57, -4.0, -4.0);
      x = v58.origin.x;
      y = v58.origin.y;
      width = v58.size.width;
      height = v58.size.height;
      -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v15);
      v21 = v20;
      v38 = v22;
      v39 = v20;
      v24 = v23;
      v26 = v25;
      v27 = PDFScreenGetBackingScaleFactor() * (v23 / width);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", v24, v26);
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __57__PDFView_dragInteraction_previewForLiftingItem_session___block_invoke;
      v40[3] = &unk_24C25E2F0;
      v42 = v21;
      v43 = v38;
      v44 = v24;
      v45 = v26;
      v46 = x;
      v41 = v15;
      v47 = y;
      v48 = width;
      v49 = height;
      v50 = v27;
      v7 = v15;
      objc_msgSend(v28, "imageWithActions:", v40);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v29);
      objc_msgSend(v30, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setCornerRadius:", 16.0);

      objc_msgSend(v30, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setMasksToBounds:", 1);

      objc_msgSend(v30, "setFrame:", v39, v38, v24, v26);
      -[PDFView clearSelection](self, "clearSelection");
      v33 = objc_alloc(MEMORY[0x24BDF69F8]);
      v34 = (void *)objc_msgSend(v33, "initWithTextLineRects:", MEMORY[0x24BDBD1A8]);
      v35 = objc_alloc(MEMORY[0x24BDF6A00]);
      UIRectGetCenter();
      v36 = (void *)objc_msgSend(v35, "initWithContainer:center:", self);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E88]), "initWithView:parameters:target:", v30, v34, v36);

      goto LABEL_12;
    }
    v14 = 0;
  }
  else
  {
LABEL_9:
    v14 = 0;
LABEL_12:

  }
  return v14;
}

uint64_t __57__PDFView_dragInteraction_previewForLiftingItem_session___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  double v4;
  double v5;
  CGAffineTransform v7;
  CGAffineTransform t2;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGRect v11;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSetRGBFillColor(v3, 1.0, 1.0, 1.0, 1.0);
  v11.size.width = *(CGFloat *)(a1 + 56);
  v11.size.height = *(CGFloat *)(a1 + 64);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  CGContextFillRect(v3, v11);
  objc_msgSend(*(id *)(a1 + 32), "boundsForBox:", 0);
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeTranslation(&v10, v4 - *(double *)(a1 + 72), v5 - *(double *)(a1 + 80));
  CGAffineTransformMakeScale(&t2, *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 104));
  v7 = v10;
  CGAffineTransformConcat(&v9, &v7, &t2);
  v10 = v9;
  CGContextSetCTM();
  return objc_msgSend(*(id *)(a1 + 32), "drawWithBox:toContext:", 0, v3);
}

- (void)setFindInteractionEnabled:(BOOL)findInteractionEnabled
{
  _BOOL4 v3;
  UIFindInteraction *findInteraction;
  uint64_t v6;
  PDFViewPrivate *v7;
  UIFindInteraction *v8;

  v3 = findInteractionEnabled;
  findInteraction = self->_private->findInteraction;
  if (v3)
  {
    if (!findInteraction)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6A40]), "initWithSessionDelegate:", self);
      v7 = self->_private;
      v8 = v7->findInteraction;
      v7->findInteraction = (UIFindInteraction *)v6;

      findInteraction = self->_private->findInteraction;
    }
    -[PDFView addInteraction:](self, "addInteraction:", findInteraction);
  }
  else if (findInteraction)
  {
    -[PDFView removeInteraction:](self, "removeInteraction:");
  }
}

- (UIFindInteraction)findInteraction
{
  return self->_private->findInteraction;
}

- (void)find:(id)a3
{
  -[UIFindInteraction presentFindNavigatorShowingReplace:](self->_private->findInteraction, "presentFindNavigatorShowingReplace:", 0);
}

- (void)findNext:(id)a3
{
  -[UIFindInteraction findNext](self->_private->findInteraction, "findNext", a3);
}

- (void)findPrevious:(id)a3
{
  -[UIFindInteraction findPrevious](self->_private->findInteraction, "findPrevious", a3);
}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc(MEMORY[0x24BDF6EF0]);
  -[PDFView documentView](self, "documentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithSearchableObject:", v6);

  return v7;
}

- (id)PDFLayout
{
  return self->_private->viewLayout;
}

- (CGRect)normalizedPageBounds:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __n128 v12;
  __n128 v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "boundsForBox:", -[PDFView displayBox](self, "displayBox"));
  v6 = v5;
  v8 = v7;
  v9 = PDFPointMake(0.0, 0.0);
  v11 = v10;
  if (!objc_msgSend(v4, "pageRef"))
  {
    v12.n128_u64[0] = 0;
    v13.n128_u64[0] = 0;
    v9 = PDFRectMake(v12, v13, 306.0, 396.0);
    v11 = v14;
    v6 = v15;
    v8 = v16;
  }
  v17 = objc_msgSend(v4, "rotation");
  if (v17 == 270 || v17 == 90)
  {
    v18 = v6;
  }
  else
  {
    v18 = v8;
    v8 = v6;
  }

  v19 = v9;
  v20 = v11;
  v21 = v8;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)_pageViewHeight:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = a3;
  -[PDFView normalizedPageBounds:](self, "normalizedPageBounds:", v4);
  v6 = v5;
  -[PDFView PDFLayout](self, "PDFLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "functionalDisplayMode");

  if (v8 == 3)
  {
    -[PDFView PDFLayout](self, "PDFLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "facingPageForPage:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PDFView normalizedPageBounds:](self, "normalizedPageBounds:", v10);
      if (v11 > v6)
        v6 = v11;
    }

  }
  -[PDFView pageBreakMargins](self, "pageBreakMargins");
  v14 = v6 + v12 + v13;

  return v14;
}

- (double)autoScaleFactorForPage:(id)a3
{
  double result;

  -[PDFView _unboundAutoScaleFactorForPage:](self, "_unboundAutoScaleFactorForPage:", a3);
  -[PDFView PDFViewWillChangeScaleFactor:toScale:](self, "PDFViewWillChangeScaleFactor:toScale:", self);
  return result;
}

- (double)autoScaleFactorForPageWithSize:(CGSize)a3
{
  double result;

  -[PDFView _unboundAutoScaleFactorForPageWithSize:](self, "_unboundAutoScaleFactorForPageWithSize:", a3.width, a3.height);
  -[PDFView PDFViewWillChangeScaleFactor:toScale:](self, "PDFViewWillChangeScaleFactor:toScale:", self);
  return result;
}

- (double)_unboundAutoScaleFactorForPage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;

  if (!a3)
    return 1.0;
  v4 = a3;
  -[PDFView PDFLayout](self, "PDFLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSizeWithCurrentPage:", v4);
  v7 = v6;
  v9 = v8;

  -[PDFView _unboundAutoScaleFactorForPageWithSize:](self, "_unboundAutoScaleFactorForPageWithSize:", v7, v9);
  return result;
}

- (double)_unboundAutoScaleFactorForPageWithSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double result;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
  void *v31;
  uint64_t v32;
  __n128 v33;
  __n128 v34;
  double v35;
  double v36;
  double v37;
  double v38;

  height = a3.height;
  width = a3.width;
  -[PDFScrollView bounds](self->_private->scrollView, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PDFScrollView safeAreaInsets](self->_private->scrollView, "safeAreaInsets");
  v21 = PDFEdgeInsetsInsetRect(v7, v9, v11, v13, v14, v15, v16, v17);
  result = 1.0;
  if (width != 0.0)
  {
    v23 = v18;
    v24 = v19;
    v25 = v20;
    -[PDFView gutterWidth](self, "gutterWidth", 1.0);
    if (v26 > 0.0)
    {
      -[PDFView gutterWidth](self, "gutterWidth");
      v24 = v24 - v27;
      -[PDFView PDFLayout](self, "PDFLayout");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "functionalDisplayMode");

      if (v29 >= 2)
      {
        -[PDFView gutterWidth](self, "gutterWidth");
        v24 = v24 - v30;
      }
    }
    -[PDFView PDFLayout](self, "PDFLayout");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "functionalDisplayMode");

    if ((v32 & 1) != 0)
    {
      if (-[PDFView displayDirection](self, "displayDirection") == kPDFDisplayDirectionVertical || v32 == 3)
        return v24 / width;
      else
        return v25 / height;
    }
    else
    {
      v33.n128_u64[0] = 0;
      v34.n128_u64[0] = 0;
      v35 = PDFRectMake(v33, v34, width, height);
      return PDFScaleRectToRect(v35, v36, v37, v38, v21, v23, v24, v25);
    }
  }
  return result;
}

- (void)beginPDFViewRotation
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  PDFViewPrivate *v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  id v15;

  if (self->_private->document)
  {
    -[PDFView documentView](self, "documentView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    -[PDFView convertRect:fromView:](self, "convertRect:fromView:", v15);
    v4 = v3;
    -[PDFView bounds](self, "bounds");
    self->_private->horizontalScaleFactorBeforeRotation = v4
                                                        / (v5
                                                         - (self->_private->savedSafeAreaInsets.left
                                                          + self->_private->savedSafeAreaInsets.right));
    -[PDFView convertRect:toView:](self, "convertRect:toView:", v15);
    v7 = v6;
    v8 = self->_private;
    v8->documentViewCenterBeforeRotation.x = PDFRectGetCenterPoint(v9, v6, v10);
    v8->documentViewCenterBeforeRotation.y = v11;
    -[PDFScrollView contentOffset](self->_private->scrollView, "contentOffset");
    v13 = v12;
    -[PDFScrollView contentInset](self->_private->scrollView, "contentInset");
    if (fabs(v13 + v14) < 1.0)
      self->_private->documentViewCenterBeforeRotation.y = v7;

  }
}

- (void)endPDFViewRotation
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  PDFScrollView *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;

  if (self->_private->document)
  {
    -[PDFView documentView](self, "documentView");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    -[PDFView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = self->_private->horizontalScaleFactorBeforeRotation
        * (v7 - (self->_private->savedSafeAreaInsets.left + self->_private->savedSafeAreaInsets.right));
    objc_msgSend(v39, "bounds");
    v13 = v11 / v12;
    -[PDFView autoScaleFactor](self, "autoScaleFactor");
    v15 = v14;
    -[PDFView maxScaleFactor](self, "maxScaleFactor");
    -[PDFView setMinScaleFactor:](self, "setMinScaleFactor:", fmin(v15, v16));
    -[PDFView setScaleFactor:](self, "setScaleFactor:", v13);
    -[PDFView convertRect:toView:](self, "convertRect:toView:", v39, v4, v6, v8, v10);
    objc_msgSend(v39, "convertPoint:toView:", self->_private->scrollView, PDFPointMake(self->_private->documentViewCenterBeforeRotation.x - v17 * 0.5, self->_private->documentViewCenterBeforeRotation.y - v18 * 0.5));
    v20 = v19;
    v22 = v21;
    v23 = self->_private->scrollView;
    -[PDFScrollView bounds](v23, "bounds");
    v25 = v24;
    v27 = v26;
    -[PDFScrollView contentSize](v23, "contentSize");
    v29 = v28;
    v31 = v30;
    -[PDFScrollView contentInset](v23, "contentInset");
    v33 = v32;
    v35 = v34;
    if (v29 - v25 >= 0.0)
      v36 = v29 - v25;
    else
      v36 = 0.0;
    v37 = CGFloatClamp(v20, 0.0, v36);
    if (v31 - v27 + v35 >= 0.0)
      v38 = v31 - v27 + v35;
    else
      v38 = 0.0;
    -[PDFScrollView setContentOffset:](v23, "setContentOffset:", v37, CGFloatClamp(v22, -v33, v38));

  }
}

- (unint64_t)lastPageIndex
{
  unint64_t result;

  result = (unint64_t)self->_private->document;
  if (result)
    return objc_msgSend((id)result, "pageCount") - 1;
  return result;
}

- (void)_internalSetAutoScaleFactor
{
  BOOL autoScale;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  autoScale = self->_private->autoScale;
  -[PDFView autoScaleFactor](self, "autoScaleFactor");
  v5 = v4;
  -[PDFScrollView contentOffset](self->_private->scrollView, "contentOffset");
  v7 = v6;
  -[PDFView minScaleFactor](self, "minScaleFactor");
  if (v8 > v5)
    -[PDFView setMinScaleFactor:](self, "setMinScaleFactor:", v5);
  -[PDFView maxScaleFactor](self, "maxScaleFactor");
  if (v9 < v5)
    -[PDFView setMaxScaleFactor:](self, "setMaxScaleFactor:", v5);
  -[PDFView _internalSetScaleFactor:](self, "_internalSetScaleFactor:", v5);
  if (v7 <= 0.0)
  {
    -[PDFScrollView contentOffset](self->_private->scrollView, "contentOffset");
    v11 = v10;
    -[PDFScrollView contentInset](self->_private->scrollView, "contentInset");
    -[PDFScrollView setContentOffset:](self->_private->scrollView, "setContentOffset:", PDFPointMake(v11, -v12));
  }
  self->_private->autoScale = autoScale;
}

- (void)_internalSetScaleFactor:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[PDFView PDFViewWillChangeScaleFactor:toScale:](self, "PDFViewWillChangeScaleFactor:toScale:", self, a3);
  v5 = v4;
  -[PDFView minScaleFactor](self, "minScaleFactor");
  if (v5 >= v6)
  {
    -[PDFView maxScaleFactor](self, "maxScaleFactor");
    if (v5 <= v8)
      goto LABEL_6;
    -[PDFView maxScaleFactor](self, "maxScaleFactor");
  }
  else
  {
    -[PDFView minScaleFactor](self, "minScaleFactor");
  }
  v5 = v7;
LABEL_6:
  if (v5 != 0.0)
  {
    -[PDFView scaleFactor](self, "scaleFactor");
    if (vabdd_f64(v5, v9) >= 0.00000011920929)
    {
      -[PDFScrollView setZoomScale:](self->_private->scrollView, "setZoomScale:", v5);
      self->_private->scaling = 1;
      -[PDFView layoutDocumentView](self, "layoutDocumentView");
      self->_private->scaling = 0;
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("PDFViewScaleChanged"), self);

    }
  }
}

- (CGFloat)maxScaleFactor
{
  PDFViewPrivate *v2;
  CGFloat result;

  v2 = self->_private;
  if (v2->isUsingPageViewController)
    -[PDFDocumentViewController maxScaleFactor](v2->documentViewController, "maxScaleFactor");
  else
    -[PDFScrollView maximumZoomScale](v2->scrollView, "maximumZoomScale");
  return result;
}

- (CGFloat)minScaleFactor
{
  PDFViewPrivate *v2;
  CGFloat result;

  v2 = self->_private;
  if (v2->isUsingPageViewController)
    -[PDFDocumentViewController minScaleFactor](v2->documentViewController, "minScaleFactor");
  else
    -[PDFScrollView minimumZoomScale](v2->scrollView, "minimumZoomScale");
  return result;
}

- (void)setMaxScaleFactor:(CGFloat)maxScaleFactor
{
  CGFloat v5;
  PDFViewPrivate *v6;
  PDFDocumentViewController *documentViewController;

  -[PDFView setAutoScales:](self, "setAutoScales:", 0);
  -[PDFView scaleFactor](self, "scaleFactor");
  if (v5 > maxScaleFactor)
    -[PDFView setScaleFactor:](self, "setScaleFactor:", maxScaleFactor);
  v6 = self->_private;
  if (v6->isUsingPageViewController)
  {
    documentViewController = v6->documentViewController;
    -[PDFView minScaleFactor](self, "minScaleFactor");
    -[PDFDocumentViewController setMinScaleFactor:withMaxScaleFactor:](documentViewController, "setMinScaleFactor:withMaxScaleFactor:");
  }
  else
  {
    -[PDFScrollView setMaximumZoomScale:](v6->scrollView, "setMaximumZoomScale:", maxScaleFactor);
  }
}

- (void)setMinScaleFactor:(CGFloat)minScaleFactor
{
  CGFloat v5;
  PDFViewPrivate *v6;
  PDFDocumentViewController *documentViewController;
  double v8;

  -[PDFView setAutoScales:](self, "setAutoScales:", 0);
  -[PDFView scaleFactor](self, "scaleFactor");
  if (v5 < minScaleFactor)
    -[PDFView setScaleFactor:](self, "setScaleFactor:", minScaleFactor);
  v6 = self->_private;
  if (v6->isUsingPageViewController)
  {
    documentViewController = v6->documentViewController;
    -[PDFView maxScaleFactor](self, "maxScaleFactor");
    -[PDFDocumentViewController setMinScaleFactor:withMaxScaleFactor:](documentViewController, "setMinScaleFactor:withMaxScaleFactor:", minScaleFactor, v8);
  }
  else
  {
    -[PDFScrollView setMinimumZoomScale:](v6->scrollView, "setMinimumZoomScale:", minScaleFactor);
  }
}

- (void)_reflectNewPageOn
{
  void *v3;
  char v4;
  PDFViewLayout *viewLayout;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  PDFDocument *document;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  int64_t displayDirection;
  double v43;
  double v44;
  double v45;
  double v46;
  BOOL v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _QWORD v53[2];
  _QWORD v54[3];

  v54[2] = *MEMORY[0x24BDAC8D0];
  -[PDFView PDFLayout](self, "PDFLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "functionalDisplayMode");

  if ((v4 & 1) != 0)
  {
    viewLayout = self->_private->viewLayout;
    -[PDFView currentPage](self, "currentPage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFViewLayout boundsForPage:](viewLayout, "boundsForPage:", v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[PDFView documentView](self, "documentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16 - v10 - v14;

    if (-[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView"))
    {
      document = self->_private->document;
      -[PDFView currentPage](self, "currentPage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[PDFDocument indexForPage:](document, "indexForPage:", v19);

      -[PDFView setCurrentPageIndex:withNotification:](self, "setCurrentPageIndex:withNotification:", v20, 0);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = CFSTR("pageIndex");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = CFSTR("pageFrame");
      v54[0] = v22;
      objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v8, v17, v12, v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("PDFExtensionViewGoToPage"), self, v24);

      return;
    }
    if (-[PDFView autoScales](self, "autoScales"))
      -[PDFView _internalSetAutoScaleFactor](self, "_internalSetAutoScaleFactor");
    -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "convertRect:toView:", self->_private->scrollView, v8, v17, v12, v14);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;

    -[PDFScrollView bounds](self->_private->scrollView, "bounds");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    displayDirection = self->_private->displayDirection;
    -[PDFView frame](self, "frame");
    v45 = v44 - v33;
    v46 = (v44 - v33) * 0.5;
    v47 = v45 <= 0.0;
    v48 = 0.0;
    if (v47)
      v46 = 0.0;
    v49 = v29 - v46;
    v50 = v43 - v31;
    if (v50 > 0.0)
      v48 = v50 * 0.5;
    v51 = v27 - v48;
    if (displayDirection == 1)
      v52 = v37;
    else
      v52 = v49;
    if (displayDirection != 1)
      v51 = v35;
    -[PDFScrollView scrollRectToVisible:animated:](self->_private->scrollView, "scrollRectToVisible:animated:", 0, v51, v52, v39, v41);
  }
  else
  {
    -[PDFView _resizeDisplayView:](self, "_resizeDisplayView:", self);
  }
  -[PDFView _findVisiblePages](self, "_findVisiblePages");
}

- (id)determineCurrentPage
{
  void *v3;
  char v4;
  double v5;
  double v6;
  double v7;

  -[PDFView PDFLayout](self, "PDFLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "functionalDisplayMode");

  if ((v4 & 1) != 0)
  {
    -[PDFView bounds](self, "bounds");
    v6 = v5;
    -[PDFView bounds](self, "bounds");
    -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 1, PDFPointMake(0.0, (v6 + v7) * 0.5));
  }
  else
  {
    -[PDFView currentPage](self, "currentPage");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)scrollViewSaysPageMayHaveChanged:(id)a3
{
  PDFScrollView *v4;
  PDFScrollView *scrollView;

  objc_msgSend(a3, "object");
  v4 = (PDFScrollView *)objc_claimAutoreleasedReturnValue();
  scrollView = self->_private->scrollView;

  if (v4 == scrollView)
    -[PDFView syncPageIndexToScrollView](self, "syncPageIndexToScrollView");
}

- (void)pageViewControllerSaysPageChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[PDFView setCurrentPageIndex:withNotification:](self, "setCurrentPageIndex:withNotification:", v6, 1);
}

- (void)_syncPageIndexToScrollView
{
  -[PDFView _updateCurrentPageUsingViewCenter](self, "_updateCurrentPageUsingViewCenter");
  -[PDFView _findVisiblePages](self, "_findVisiblePages");
}

- (void)syncPageIndexToScrollView
{
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__syncPageIndexToScrollView, 0);
  v3 = *MEMORY[0x24BDF7F78];
  v5[0] = *MEMORY[0x24BDBCB80];
  v5[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFView performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__syncPageIndexToScrollView, 0, v4, 0.05);

}

- (void)_updateCurrentPageUsingViewCenter
{
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MidX;
  double MidY;
  PDFPage *toPage;
  PDFPage *v17;
  void *v18;
  uint64_t v19;
  PDFPage *v20;
  CGRect v21;
  CGRect v22;

  v3 = PDFRectToCGRect(-[PDFView bounds](self, "bounds"));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (-[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView"))
  {
    -[PDFView extensionViewBoundsInDocument](self, "extensionViewBoundsInDocument");
    v3 = v10;
    v5 = v11;
    v7 = v12;
    v9 = v13;
  }
  v21.origin.x = v3;
  v21.origin.y = v5;
  v21.size.width = v7;
  v21.size.height = v9;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = v3;
  v22.origin.y = v5;
  v22.size.width = v7;
  v22.size.height = v9;
  MidY = CGRectGetMidY(v22);
  toPage = self->_private->toPage;
  if (toPage)
  {
    v17 = toPage;
  }
  else
  {
    -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 1, PDFPointFromCGPoint(MidX * 0.99, MidY));
    v17 = (PDFPage *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_9;
  }
  v20 = v17;
  -[PDFView document](self, "document");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "indexForPage:", v20);

  if (self->_currentPageIndex != v19)
    -[PDFView setCurrentPageIndex:withNotification:](self, "setCurrentPageIndex:withNotification:", v19, 1);
  v17 = v20;
LABEL_9:

}

- (CGSize)pageViewSizeForPage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = a3;
  if (v4)
  {
    -[PDFView PDFLayout](self, "PDFLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentSizeWithCurrentPage:", v4);
    v7 = v6;
    v9 = v8;

    -[PDFView gutterWidth](self, "gutterWidth");
    if (v10 > 0.0)
    {
      -[PDFView gutterWidth](self, "gutterWidth");
      v7 = v7 + v11;
      -[PDFView PDFLayout](self, "PDFLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "functionalDisplayMode");

      if (v13 >= 2)
      {
        -[PDFView gutterWidth](self, "gutterWidth");
        v7 = v7 + v14;
      }
    }
  }
  else
  {
    v7 = PDFSizeMake(0, 0.0, 0.0);
    v9 = v15;
  }

  v16 = v7;
  v17 = v9;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)_resizeDisplayView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  -[PDFScrollView setContentSize:](self->_private->scrollView, "setContentSize:", v6, v8);
  -[PDFView scaleFactor](self, "scaleFactor");
  v10 = v9;
  -[PDFView documentView](self, "documentView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateVisibility");
  -[PDFView scaleFactor](self, "scaleFactor");
  if (v11 != v10)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("PDFViewScaleChanged"), self);

  }
}

- (void)positionInternalViews:(id)a3
{
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
  double v14;
  double v15;
  PDFViewPrivate *v16;
  double v17;
  int v18;
  PDFScrollView *v19;
  uint64_t v20;
  double v21;
  PDFScrollView *v22;
  int v24;
  PDFScrollView *scrollView;
  uint64_t v26;

  -[PDFView documentView](self, "documentView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  -[PDFView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  -[PDFView scaleFactor](self, "scaleFactor");
  v14 = v13;
  -[PDFView scaleFactor](self, "scaleFactor");
  v16 = self->_private;
  if (!v16->showsScrollIndicators)
  {
    if (v16->isUsingPageViewController)
    {
      -[PDFDocumentViewController updateScrollViews](v16->documentViewController, "updateScrollViews");
      return;
    }
    -[PDFScrollView setShowsVerticalScrollIndicator:](v16->scrollView, "setShowsVerticalScrollIndicator:", 0);
LABEL_27:
    scrollView = self->_private->scrollView;
    v26 = 0;
LABEL_28:
    -[PDFScrollView setShowsHorizontalScrollIndicator:](scrollView, "setShowsHorizontalScrollIndicator:", v26);
    return;
  }
  v17 = v8 * v15;
  if (-[PDFView autoScales](self, "autoScales"))
  {
    if (-[PDFScrollView showsHorizontalScrollIndicator](self->_private->scrollView, "showsHorizontalScrollIndicator"))-[PDFScrollView setShowsHorizontalScrollIndicator:](self->_private->scrollView, "setShowsHorizontalScrollIndicator:", 0);
    v18 = -[PDFScrollView showsVerticalScrollIndicator](self->_private->scrollView, "showsVerticalScrollIndicator");
    if (v17 > v12)
    {
LABEL_6:
      if ((v18 & 1) != 0)
        return;
      v19 = self->_private->scrollView;
      v20 = 1;
LABEL_39:
      -[PDFScrollView setShowsVerticalScrollIndicator:](v19, "setShowsVerticalScrollIndicator:", v20);
      return;
    }
LABEL_37:
    if (!v18)
      return;
    v19 = self->_private->scrollView;
    v20 = 0;
    goto LABEL_39;
  }
  v21 = v6 * v14;
  v22 = self->_private->scrollView;
  if (v6 * v14 <= v10 && v17 <= v12)
  {
    if (-[PDFScrollView showsVerticalScrollIndicator](v22, "showsVerticalScrollIndicator", v21))
      -[PDFScrollView setShowsVerticalScrollIndicator:](self->_private->scrollView, "setShowsVerticalScrollIndicator:", 0);
    v24 = -[PDFScrollView showsHorizontalScrollIndicator](self->_private->scrollView, "showsHorizontalScrollIndicator");
    goto LABEL_24;
  }
  if (v21 <= v10)
  {
    if ((-[PDFScrollView showsVerticalScrollIndicator](v22, "showsVerticalScrollIndicator") & 1) == 0)
      -[PDFScrollView setShowsVerticalScrollIndicator:](self->_private->scrollView, "setShowsVerticalScrollIndicator:", 1);
    v24 = -[PDFScrollView showsHorizontalScrollIndicator](self->_private->scrollView, "showsHorizontalScrollIndicator");
    if (v6 <= v10)
    {
LABEL_24:
      if (!v24)
        return;
      goto LABEL_27;
    }
    if ((v24 & 1) != 0)
      return;
LABEL_33:
    scrollView = self->_private->scrollView;
    v26 = 1;
    goto LABEL_28;
  }
  if (v17 <= v12)
  {
    if ((-[PDFScrollView showsHorizontalScrollIndicator](v22, "showsHorizontalScrollIndicator") & 1) == 0)
      -[PDFScrollView setShowsHorizontalScrollIndicator:](self->_private->scrollView, "setShowsHorizontalScrollIndicator:", 1);
    v18 = -[PDFScrollView showsVerticalScrollIndicator](self->_private->scrollView, "showsVerticalScrollIndicator");
    if (v8 > v12)
      goto LABEL_6;
    goto LABEL_37;
  }
  if ((-[PDFScrollView showsVerticalScrollIndicator](v22, "showsVerticalScrollIndicator") & 1) == 0)
    -[PDFScrollView setShowsVerticalScrollIndicator:](self->_private->scrollView, "setShowsVerticalScrollIndicator:", 1);
  if ((-[PDFScrollView showsHorizontalScrollIndicator](self->_private->scrollView, "showsHorizontalScrollIndicator") & 1) == 0)
    goto LABEL_33;
}

- (CGRect)visibleRectForPageView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MaxInsets;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id WeakRetained;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
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
  CGRect result;

  v4 = a3;
  -[PDFView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PDFView safeAreaInsets](self, "safeAreaInsets");
  MaxInsets = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "pdfViewContentInset");
    MaxInsets = PDFEdgeInsetsGetMaxInsets(MaxInsets, v16, v18, v20, v22);
    v16 = v23;
    v18 = v24;
    v20 = v25;
  }
  v26 = PDFEdgeInsetsInsetRect(v6, v8, v10, v12, MaxInsets, v16, v18, v20);
  v28 = v27;
  v30 = v29;
  v32 = v31;

  -[PDFView convertRect:toView:](self, "convertRect:toView:", v4, v26, v28, v30, v32);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  v41 = v34;
  v42 = v36;
  v43 = v38;
  v44 = v40;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (BOOL)focusOnColumnAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  PDFViewPrivate *v29;
  double v30;
  double v31;
  double width;
  double height;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  __n128 v59;
  double v60;
  __n128 v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  double rect;
  CGFloat recta;
  double v86;
  const __CFString *v87;
  _QWORD v88[2];
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  y = a3.y;
  x = a3.x;
  v88[1] = *MEMORY[0x24BDAC8D0];
  -[PDFView autoScaleFactor](self, "autoScaleFactor");
  v7 = v6;
  -[PDFView scaleFactor](self, "scaleFactor");
  v9 = vabdd_f64(v8, v7);
  -[PDFView renderingProperties](self, "renderingProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isUsingPDFExtensionView");

  if (v9 <= 0.00000011920929 || (v11 & 1) != 0)
  {
    -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0, x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13 != 0;
    if (!v13)
    {
LABEL_14:

      return v12;
    }
    v86 = y;
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v13, x, y);
    objc_msgSend(v13, "columnFrameAtPoint:");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v13);
    rect = v22;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v89.origin.x = v15;
    v89.origin.y = v17;
    v89.size.width = v19;
    v89.size.height = v21;
    if (PDFRectEqualToRect(v89, *MEMORY[0x24BDBF090]))
    {
      if (v11)
      {
        v29 = self->_private;
        v30 = v29->extensionViewBoundsInDocument.origin.x;
        v31 = v29->extensionViewBoundsInDocument.origin.y;
        width = v29->extensionViewBoundsInDocument.size.width;
        height = v29->extensionViewBoundsInDocument.size.height;
      }
      else
      {
        -[PDFView bounds](self, "bounds");
      }
      PDFRectScale(v30, v31, width, height, 0.5);
      v59.n128_f64[0] = x - v58 * 0.5;
      v61.n128_f64[0] = v86 - v60 * 0.5;
      v37 = PDFRectMake(v59, v61, v58, v60);
      v36 = v62;
      v35 = v63;
      v34 = v64;
      if (v11)
        goto LABEL_12;
    }
    else
    {
      v34 = v28;
      v35 = v26;
      v36 = v24;
      v37 = rect;
      if (v11)
      {
LABEL_12:
        -[PDFView documentMargins](self, "documentMargins");
        v66 = v65;
        v68 = v67;
        v70 = v69;
        v72 = v71;
        -[PDFView pageBreakMargins](self, "pageBreakMargins");
        v74 = v37 - (v68 + v73);
        v76 = v36 - (v66 + v75);
        v78 = v35 + v68 + v72 + v73 + v77;
        v80 = v34 + v66 + v70 + v75 + v79;
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = CFSTR("rect");
        objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v74, v76, v78, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = v81;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "postNotificationName:object:userInfo:", CFSTR("PDFExtensionViewZoomToRect"), self, v82);

        goto LABEL_13;
      }
    }
    -[PDFView pageViewForPageAtIndex:](self, "pageViewForPageAtIndex:", -[PDFDocument indexForPage:](self->_private->document, "indexForPage:", v13));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView convertRect:toView:](self, "convertRect:toView:", v38, v37, v36, v35, v34);
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v45 = v36;
    recta = v34;
    v47 = v46;
    -[PDFView safeAreaInsets](self, "safeAreaInsets");
    v48 = v35;
    v51 = v49 + v50;
    -[PDFView bounds](self, "bounds");
    v52 = (CGRectGetWidth(v90) - v51) * 0.85;
    v91.origin.x = v40;
    v91.origin.y = v42;
    v91.size.width = v44;
    v91.size.height = v47;
    v53 = v52 / CGRectGetWidth(v91);
    -[PDFView minScaleFactor](self, "minScaleFactor");
    v55 = v54;
    -[PDFView maxScaleFactor](self, "maxScaleFactor");
    v57 = CGFloatClamp(v53, v55, v56);
    v92.origin.x = v37;
    v92.origin.y = v45;
    v92.size.width = v48;
    v92.size.height = recta;
    -[PDFView setScaleFactor:anchorPoint:](self, "setScaleFactor:anchorPoint:", v57, CGRectGetMidX(v92), v86);
LABEL_13:

    goto LABEL_14;
  }
  -[PDFView setScaleFactor:anchorPoint:](self, "setScaleFactor:anchorPoint:", v7, x, y);
  return 1;
}

- (void)insertFormFieldWithBounds:(CGRect)a3 onPage:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void *)MEMORY[0x24BDF6A70];
  v10 = a4;
  +[PDFAnnotation detectedFormFieldDefaultFontName](PDFAnnotation, "detectedFormFieldDefaultFontName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDFAnnotation detectedFormFieldDefaultFontSize](PDFAnnotation, "detectedFormFieldDefaultFontSize");
  objc_msgSend(v9, "fontWithName:size:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  +[PDFAnnotation createDetectedTextFieldWithBounds:font:textContentType:page:](PDFAnnotation, "createDetectedTextFieldWithBounds:font:textContentType:page:", v13, 0, v10, x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFViewController addDetectedAnnotation:toPage:](self->_private->controller, "addDetectedAnnotation:toPage:", v12, v10);

  -[PDFViewController activateAnnotation:](self->_private->controller, "activateAnnotation:", v12);
}

- (void)insertFormFieldAtDefaultLocation
{
  double v3;
  double v4;
  id v5;

  -[PDFView currentPage](self, "currentPage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFView centerPointOfVisibleRectOfPage:](self, "centerPointOfVisibleRectOfPage:", v5);
  -[PDFView insertFormFieldWithBounds:onPage:](self, "insertFormFieldWithBounds:onPage:", v5, PDFRectMakeFromCenter(v3, v4, 120.0));

}

- (void)insertFormFieldAtBestLocationNearPoint:(CGPoint)a3 onPage:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v7, x, y);
  v9 = v8;
  v11 = v10;
  +[PDFPageAnalyzer sharedInstance](PDFPageAnalyzer, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__PDFView_insertFormFieldAtBestLocationNearPoint_onPage___block_invoke;
  v14[3] = &unk_24C25E318;
  v14[4] = self;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v12, "proposedFormFieldBoundsNearestPoint:onPage:completionBlock:", v13, v14, v9, v11);

}

uint64_t __57__PDFView_insertFormFieldAtBestLocationNearPoint_onPage___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t result;

  result = CGRectIsNull(*(CGRect *)&a2);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "insertFormFieldWithBounds:onPage:", *(_QWORD *)(a1 + 40), a2, a3, a4, a5);
  return result;
}

- (BOOL)handleTabInDetectedFormField
{
  -[PDFViewController activateNextAnnotation:withCompletion:](self->_private->controller, "activateNextAnnotation:withCompletion:", 0, 0);
  return 1;
}

- (BOOL)handleBackTabInDetectedFormField
{
  -[PDFViewController activateNextAnnotation:withCompletion:](self->_private->controller, "activateNextAnnotation:withCompletion:", 1, 0);
  return 1;
}

- (void)handleTextSuggestion:(id)a3 completionHandler:(id)a4
{
  -[PDFViewController handleTextSuggestion:completionHandler:](self->_private->controller, "handleTextSuggestion:completionHandler:", a3, a4);
}

- (void)constrainedScrollToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  y = a3.y;
  x = a3.x;
  -[PDFView documentView](self, "documentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7 - y;

  -[PDFScrollView bounds](self->_private->scrollView, "bounds");
  v10 = v9;
  v12 = v11;
  -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertPoint:toView:", self->_private->scrollView, PDFPointToCGPoint(x, v8));
  v15 = v14;
  v17 = v16;

  -[PDFScrollView scrollRectToVisible:animated:](self->_private->scrollView, "scrollRectToVisible:animated:", 0, v15, v17, v10, v12);
}

- (void)_scrollVerticalBy:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  _BOOL4 v15;
  void *v16;
  _BOOL4 v17;
  double v18;
  uint64_t v19;

  -[PDFView scaleFactor](self, "scaleFactor");
  v6 = a3 / v5;
  -[PDFView determineCurrentPage](self, "determineCurrentPage");
  v19 = objc_claimAutoreleasedReturnValue();
  -[PDFScrollView contentOffset](self->_private->scrollView, "contentOffset");
  v8 = v7;
  v10 = v9;
  -[PDFView constrainedScrollToPoint:](self, "constrainedScrollToPoint:", PDFPointMake(v7, round(v6 + v9)));
  -[PDFView PDFLayout](self, "PDFLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "functionalDisplayMode");

  if ((v12 & 1) != 0)
  {
    -[PDFView determineCurrentPage](self, "determineCurrentPage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 != (void *)v19)
    {
      self->_private->inhibitAutoScroll = 1;
      -[PDFView goToPage:](self, "goToPage:", v16);
      self->_private->inhibitAutoScroll = 0;
    }

    goto LABEL_9;
  }
  -[UIScrollView PDFKitDocumentVisibleRectIncludingContentInsets](self->_private->scrollView, "PDFKitDocumentVisibleRectIncludingContentInsets");
  v13 = (void *)v19;
  if (v14 == v10)
  {
    if (v6 < 0.0)
    {
      v15 = -[PDFView canGoToNextPage](self, "canGoToNextPage");
      v13 = (void *)v19;
      if (v15)
      {
        -[PDFView constrainedScrollToPoint:](self, "constrainedScrollToPoint:", PDFPointMake(v8, 0.0));
        -[PDFView goToNextPage:](self, "goToNextPage:", self);
LABEL_9:
        v13 = (void *)v19;
        goto LABEL_10;
      }
    }
    if (v6 > 0.0)
    {
      v17 = -[PDFView canGoToPreviousPage](self, "canGoToPreviousPage");
      v13 = (void *)v19;
      if (v17)
      {
        -[UIScrollView PDFKitDocumentVisibleRectIncludingContentInsets](self->_private->scrollView, "PDFKitDocumentVisibleRectIncludingContentInsets");
        -[PDFView constrainedScrollToPoint:](self, "constrainedScrollToPoint:", PDFPointMake(v8, v18));
        -[PDFView goToPreviousPage:](self, "goToPreviousPage:", self);
        goto LABEL_9;
      }
    }
  }
LABEL_10:

}

- (void)_scrollHorizontalBy:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[PDFView scaleFactor](self, "scaleFactor");
  v6 = a3 / v5;
  -[UIScrollView PDFKitDocumentVisibleRectIncludingContentInsets](self->_private->scrollView, "PDFKitDocumentVisibleRectIncludingContentInsets");
  -[PDFView constrainedScrollToPoint:](self, "constrainedScrollToPoint:", PDFPointMake(round(v6 + v7), v8));
}

- (void)_scrollByPage:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v3 = a3;
  -[PDFView frame](self, "frame");
  v6 = v5;
  -[PDFView currentPage](self, "currentPage");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFView _pageViewHeight:](self, "_pageViewHeight:");
  v8 = v7;
  if (vabdd_f64(v7, v6) <= 32.0)
  {
    -[PDFView currentPage](self, "currentPage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView _scrollOriginForPageTopLeft:](self, "_scrollOriginForPageTopLeft:", v10);
    v12 = v11;

    -[UIScrollView PDFKitDocumentVisibleRectIncludingContentInsets](self->_private->scrollView, "PDFKitDocumentVisibleRectIncludingContentInsets");
    if (vabdd_f64(v12, v13) < 32.0)
    {
      if (v3)
        -[PDFView goToNextPage:](self, "goToNextPage:", self);
      else
        -[PDFView goToPreviousPage:](self, "goToPreviousPage:", self);
      goto LABEL_13;
    }
    v9 = -v8;
    if (v3)
      v9 = v8;
  }
  else
  {
    v9 = 50.0 - v6;
    if (v3)
      v9 = v6 + -50.0;
  }
  if (v9 != 0.0)
    -[PDFView _scrollVerticalBy:](self, "_scrollVerticalBy:");
LABEL_13:

}

- (CGPoint)_scrollOriginForPageTopLeft:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGPoint result;

  v4 = a3;
  v5 = PDFPointMake(0.0, 0.0);
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v4, "boundsForBox:", -[PDFView displayBox](self, "displayBox"));
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[PDFView pageBreakMargins](self, "pageBreakMargins");
    v17 = v16;
    v19 = v18;
    v20 = objc_msgSend(v4, "rotation");
    if (v20 > 179)
    {
      if (v20 == 180)
      {
        v5 = v17 + PDFPointMake(v13, 0.0);
        goto LABEL_12;
      }
      if (v20 != 270)
      {
LABEL_13:
        -[PDFView convertPoint:fromPage:](self, "convertPoint:fromPage:", v4, v9 + v5, v11 + v7);
        v24 = v23;
        v26 = v25;
        -[PDFView documentView](self, "documentView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "convertPoint:fromView:", self, v24, v26);
        v5 = v28;
        v7 = v29;

        goto LABEL_14;
      }
      v5 = v17 + PDFPointMake(v13, v15);
    }
    else
    {
      if (v20)
      {
        if (v20 == 90)
        {
          v5 = PDFPointMake(0.0, 0.0) - v17;
LABEL_12:
          v7 = v21 - v19;
          goto LABEL_13;
        }
        goto LABEL_13;
      }
      v5 = PDFPointMake(0.0, v15) - v17;
    }
    v7 = v19 + v22;
    goto LABEL_13;
  }
LABEL_14:

  v30 = v5;
  v31 = v7;
  result.y = v31;
  result.x = v30;
  return result;
}

- (void)_findVisiblePages
{
  PDFViewPrivate *v3;
  NSUInteger v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  PDFViewPrivate *v38;
  unint64_t firstVisiblePage;
  unint64_t lastVisiblePage;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = self->_private;
  if (v3->isUsingPageViewController)
  {
    -[PDFDocumentViewController currentPage](v3->documentViewController, "currentPage");
    v49 = (id)objc_claimAutoreleasedReturnValue();
    v4 = -[PDFDocument indexForPage:](self->_private->document, "indexForPage:");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      v5 = 0;
    else
      v5 = v4;
    self->_private->lastVisiblePage = v5;
    self->_private->firstVisiblePage = v5;

  }
  else
  {
    -[PDFView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[PDFView documentView](self, "documentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView convertRect:toView:](self, "convertRect:toView:", v14, v7, v9, v11, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[PDFView PDFLayout](self, "PDFLayout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView currentPage](self, "currentPage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "visiblePagesInBounds:currentPage:", v24, v16, v18, v20, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 && objc_msgSend(v25, "count"))
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v26 = v25;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v51 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "setView:", self);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        }
        while (v28);
      }

      -[PDFView document](self, "document");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndex:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "indexForPage:", v32);

      -[PDFView document](self, "document");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "indexForPage:", v35);
      v37 = v36 + 1;

      v38 = self->_private;
      firstVisiblePage = v38->firstVisiblePage;
      lastVisiblePage = v38->lastVisiblePage;
      if (v33 + 1 != firstVisiblePage || v37 != lastVisiblePage)
      {
        v38->firstVisiblePage = v33 + 1;
        self->_private->lastVisiblePage = v37;
        v41 = (void *)MEMORY[0x24BDBCE70];
        if (firstVisiblePage && lastVisiblePage)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", firstVisiblePage - 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", lastVisiblePage - 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v33);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v36);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "dictionaryWithObjectsAndKeys:", v42, CFSTR("PDFViewWasFirstVisiblePage"), v43, CFSTR("PDFViewWasLastVisiblePage"), v44, CFSTR("PDFViewFirstVisiblePage"), v45, CFSTR("PDFViewLastVisiblePage"), 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v33);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v36);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "dictionaryWithObjectsAndKeys:", v42, CFSTR("PDFViewFirstVisiblePage"), v43, CFSTR("PDFViewLastVisiblePage"), 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(MEMORY[0x24BDD16D8], "defaultQueue");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:userInfo:", CFSTR("PDFViewVisiblePagesChanged"), self, v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "enqueueNotification:postingStyle:", v48, 2);

      }
    }

  }
}

- (void)documentWasUnlocked
{
  id WeakRetained;
  PDFViewPrivate *v4;
  void *v5;
  PDFViewPrivate *v6;
  double blockingWaitDuration;
  id v8;

  -[PDFView _removePasswordView](self, "_removePasswordView");
  -[PDFScrollView setDocument:](self->_private->scrollView, "setDocument:", 0);
  -[PDFScrollView setDocument:](self->_private->scrollView, "setDocument:", self->_private->document);
  -[PDFViewLayout setDocument:](self->_private->viewLayout, "setDocument:", self->_private->document);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
  -[PDFView setNewPageVisibilityDelegate:withOldDelegate:](self, "setNewPageVisibilityDelegate:withOldDelegate:", WeakRetained, 0);

  -[PDFView layoutDocumentView](self, "layoutDocumentView");
  v4 = self->_private;
  if (v4->autoScale)
  {
    -[PDFView _internalSetAutoScaleFactor](self, "_internalSetAutoScaleFactor");
    v4 = self->_private;
  }
  if (-[PDFDocument pageCount](v4->document, "pageCount") && self->_currentPageIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PDFDocument pageAtIndex:](self->_private->document, "pageAtIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_private->wantsForceUpdate = 1;
    v6 = self->_private;
    blockingWaitDuration = v6->blockingWaitDuration;
    v6->blockingWaitDuration = 0.25;
    -[PDFView _goToPage:animated:withBackgroundUpdate:](self, "_goToPage:animated:withBackgroundUpdate:", v5, 0, 1);
    self->_private->blockingWaitDuration = blockingWaitDuration;

  }
  -[PDFView _reflectNewPageOn](self, "_reflectNewPageOn");
  if (-[PDFDocument pageCount](self->_private->document, "pageCount"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("PDFViewChangedPage"), self);

  }
}

- (void)hintScrollDirectionHorizontal:(unint64_t)a3 andVertical:(unint64_t)a4
{
  self->_private->lastHorizontalScrollDirection = a3;
  self->_private->lastVerticalScrollDirection = a4;
}

- (void)_updateAnnotations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (ShouldRenderAnnotationsInPDFKit())
  {
    -[PDFView visiblePages](self, "visiblePages");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      v7 = MEMORY[0x24BDAC760];
      v8 = MEMORY[0x24BDAC9B8];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          v11[0] = v7;
          v11[1] = 3221225472;
          v11[2] = __29__PDFView__updateAnnotations__block_invoke;
          v11[3] = &unk_24C25E340;
          v11[4] = self;
          v11[5] = v10;
          objc_msgSend(v10, "fetchAnnotationsWithCompletion:deliveredOnQueue:", v11, v8);
          ++v9;
        }
        while (v5 != v9);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
}

void __29__PDFView__updateAnnotations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v8, "bounds");
        v10 = 1.0;
        if (objc_msgSend(v9, "isRectVisible:onPage:", *(_QWORD *)(a1 + 40)))
        {
          objc_msgSend(*(id *)(a1 + 32), "scaleFactor");
          v10 = v11;
        }
        objc_msgSend(v8, "setScaleFactor:", v10 * PDFScreenGetBackingScaleFactor());
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (id)renderingProperties
{
  return self->_private->renderingProperties;
}

- (void)visiblePagesChanged:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id obj;
  _QWORD v34[7];
  id v35;
  id location;
  _QWORD v37[4];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (PDFKitIsOCREnabled())
  {
    v32 = v4;
    -[PDFView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[PDFView documentView](self, "documentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    -[PDFView documentView](self, "documentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;

    -[PDFView PDFLayout](self, "PDFLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView currentPage](self, "currentPage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "visiblePagesInBounds:currentPage:", v26, v15, v24 - v17 - v21, v19, v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v27;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v39;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v39 != v29)
            objc_enumerationMutation(obj);
          v31 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v30);
          v37[0] = 0;
          v37[1] = v37;
          v37[2] = 0x2020000000;
          v37[3] = 0;
          objc_initWeak(&location, self);
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __31__PDFView_visiblePagesChanged___block_invoke;
          v34[3] = &unk_24C25E390;
          v34[5] = v31;
          v34[6] = v37;
          v34[4] = self;
          objc_copyWeak(&v35, &location);
          +[PDFPageEvaluator isPageCandidateForOCR:completion:](PDFPageEvaluator, "isPageCandidateForOCR:completion:", v31, v34);
          objc_destroyWeak(&v35);
          objc_destroyWeak(&location);
          _Block_object_dispose(v37, 8);
          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v28);
    }

    v4 = v32;
  }

}

void __31__PDFView_visiblePagesChanged___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  int8x16_t v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  if (a3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= 1uLL;
  if (objc_msgSend(*(id *)(a1 + 32), "isFormDetectionEnabled"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= 2uLL;
  +[PDFPageAnalyzer sharedInstance](PDFPageAnalyzer, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v8 = MEMORY[0x24BDAC9B8];
  v9 = MEMORY[0x24BDAC9B8];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __31__PDFView_visiblePagesChanged___block_invoke_2;
  v10[3] = &unk_24C25E368;
  v11 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  objc_copyWeak(&v13, (id *)(a1 + 56));
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v6, "analyzePage:analysisTypes:completionQueue:completionBlock:", v5, v7, v8, v10);

  objc_destroyWeak(&v13);
}

void __31__PDFView_visiblePagesChanged___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v6;
  id v7;
  void *v8;
  _QWORD *WeakRetained;
  void *v10;
  void *v11;
  _BYTE *v12;
  uint64_t v13;
  id v14;

  if (a2 && !a3)
  {
    v6 = *(void **)(a1 + 32);
    v7 = a2;
    objc_msgSend(v6, "document");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "pageViewForPageAtIndex:", objc_msgSend(v14, "indexForPage:", *(_QWORD *)(a1 + 32)));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v14, "callDelegateDidReceiveAnalysis:forPage:", v7, *(_QWORD *)(a1 + 32));

    if ((objc_msgSend(*(id *)(a1 + 32), "containsFormFields") & 1) != 0
      || objc_msgSend(*(id *)(a1 + 32), "containsDetectedFormFields"))
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = (_BYTE *)WeakRetained[52];
      if (v12[68])
      {
        v13 = objc_msgSend(*(id *)(a1 + 32), "detectedFormFieldsRecognitionConfidence");
        if (v13)
          objc_msgSend(v11, "PDFView:allowsFormFillingMode:withRecognitionConfidence:forPage:", WeakRetained, 1, v13, *(_QWORD *)(a1 + 32));
      }
      else if (v12[67])
      {
        objc_msgSend(v10, "PDFView:allowsFormFillingMode:withAutofill:forPage:", WeakRetained, 1, objc_msgSend(*(id *)(a1 + 32), "containsFormFieldsWithContentType"), *(_QWORD *)(a1 + 32));
      }
      else if (v12[66])
      {
        objc_msgSend(v10, "PDFView:allowsFormFillingMode:forPage:", WeakRetained, 1, *(_QWORD *)(a1 + 32));
      }
      if (objc_msgSend(WeakRetained, "isInFormFillingMode"))
      {
        objc_msgSend(*(id *)(WeakRetained[52] + 24), "populateAnnotationsFromDetectedAnnotationsOnPage:", *(_QWORD *)(a1 + 32));
        objc_msgSend(WeakRetained, "highlightDetectedFormFields:", 1);
      }

    }
    if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) & 1) != 0
      && GetDefaultsWriteDrawOCRQuads())
    {
      objc_msgSend(v8, "forceTileUpdate");
    }
    if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) & 2) != 0
      && GetDefaultsWriteHighlightDetectedAnnotations())
    {
      objc_msgSend(v8, "enableHighlightDetectedFormFields:", 1);
    }
    if (a4)
      objc_msgSend(v8, "resetAccessibilityTree");

  }
}

- (CGPoint)centerPointOfVisibleRectOfPage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double CenterPoint;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  v4 = a3;
  -[PDFView document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexForPage:", v4);

  -[PDFView pageViewForPageAtIndex:](self, "pageViewForPageAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFView visibleRectForPageView:](self, "visibleRectForPageView:", v7);
  objc_msgSend(v7, "convertRect:toView:", self);
  -[PDFView convertRect:toPage:](self, "convertRect:toPage:", v4);
  v9 = v8;
  v11 = v10;
  v13 = v12;

  CenterPoint = PDFRectGetCenterPoint(v9, v11, v13);
  v16 = v15;

  v17 = CenterPoint;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (void)_showFormFillingButton:(BOOL)a3
{
  UIButton *formFieldButton;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  UIButton *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id formFieldButtonShowKeyboardNotification;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  id formFieldButtonHideKeyboardNotification;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  PDFView *v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[3];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x24BDAC8D0];
  formFieldButton = self->_formFieldButton;
  if (a3)
  {
    v5 = 0x24BDBC000;
    if (!formFieldButton)
    {
      objc_msgSend(MEMORY[0x24BDF6888], "filledButtonConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setButtonSize:", 3);
      objc_msgSend(v6, "setCornerStyle:", 4);
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("plus"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImage:", v7);

      objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPreferredSymbolConfigurationForImage:", v8);

      objc_msgSend(MEMORY[0x24BDF6880], "buttonWithConfiguration:primaryAction:", v6, 0);
      v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v10 = self->_formFieldButton;
      self->_formFieldButton = v9;

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_formFieldButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v11 = (void *)MEMORY[0x24BDF67B8];
      PDFKitLocalizedString(CFSTR("Add Text Form Box"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("character.textbox"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x24BDAC760];
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __34__PDFView__showFormFillingButton___block_invoke;
      v57[3] = &unk_24C25D7F0;
      v57[4] = self;
      objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v12, v13, 0, v57);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x24BDF67B8];
      PDFKitLocalizedString(CFSTR("Add Signature"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("signature"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v14;
      v5 = 0x24BDBC000uLL;
      v56[1] = 3221225472;
      v56[2] = __34__PDFView__showFormFillingButton___block_invoke_2;
      v56[3] = &unk_24C25D7F0;
      v56[4] = self;
      objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, v18, 0, v56);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BDF6BA8];
      PDFKitLocalizedString(CFSTR("Add Form Item to PDF"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v15;
      v59[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "menuWithTitle:children:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIButton setMenu:](self->_formFieldButton, "setMenu:", v23);
      -[UIButton setShowsMenuAsPrimaryAction:](self->_formFieldButton, "setShowsMenuAsPrimaryAction:", 1);

      formFieldButton = self->_formFieldButton;
    }
    -[PDFView documentView](self, "documentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", formFieldButton, v24);

    -[UIButton bottomAnchor](self->_formFieldButton, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView bottomAnchor](self, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, -15.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x24BDD1628];
    v58[0] = v27;
    -[UIButton trailingAnchor](self->_formFieldButton, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView trailingAnchor](self, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -15.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v31;
    -[UIButton widthAnchor](self->_formFieldButton, "widthAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton heightAnchor](self->_formFieldButton, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v34;
    objc_msgSend(*(id *)(v5 + 3632), "arrayWithObjects:count:", v58, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v35);

    -[PDFView setNeedsLayout](self, "setNeedsLayout");
    -[PDFView layoutIfNeeded](self, "layoutIfNeeded");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x24BDF7B80];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x24BDAC760];
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __34__PDFView__showFormFillingButton___block_invoke_3;
    v54[3] = &unk_24C25E3B8;
    v54[4] = self;
    v40 = v27;
    v55 = v40;
    objc_msgSend(v36, "addObserverForName:object:queue:usingBlock:", v37, 0, v38, v54);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    formFieldButtonShowKeyboardNotification = self->_formFieldButtonShowKeyboardNotification;
    self->_formFieldButtonShowKeyboardNotification = v41;

    v43 = *MEMORY[0x24BDF7B78];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v39;
    v51[1] = 3221225472;
    v51[2] = __34__PDFView__showFormFillingButton___block_invoke_5;
    v51[3] = &unk_24C25E3B8;
    v52 = v40;
    v53 = self;
    v45 = v40;
    objc_msgSend(v36, "addObserverForName:object:queue:usingBlock:", v43, 0, v44, v51);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    formFieldButtonHideKeyboardNotification = self->_formFieldButtonHideKeyboardNotification;
    self->_formFieldButtonHideKeyboardNotification = v46;

  }
  else
  {
    if (formFieldButton)
      -[UIButton removeFromSuperview](self->_formFieldButton, "removeFromSuperview");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v50 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "removeObserver:", self->_formFieldButtonShowKeyboardNotification);
    v48 = self->_formFieldButtonShowKeyboardNotification;
    self->_formFieldButtonShowKeyboardNotification = 0;

    objc_msgSend(v50, "removeObserver:", self->_formFieldButtonHideKeyboardNotification);
    v49 = self->_formFieldButtonHideKeyboardNotification;
    self->_formFieldButtonHideKeyboardNotification = 0;

  }
}

uint64_t __34__PDFView__showFormFillingButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertFormFieldAtDefaultLocation");
}

void __34__PDFView__showFormFillingButton___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "akController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "signaturesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init((Class)AKSignaturesPresentationContextClass());
  objc_msgSend(*(id *)(a1 + 32), "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", v6);

  objc_msgSend(v4, "setSourceView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  objc_msgSend(v3, "setPresentationContext:", v4);
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "presentSignaturesViewController");

}

void __34__PDFView__showFormFillingButton___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double MaxY;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  double v30;
  CGRect v31;
  CGRect v32;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF7A20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v14, "bounds");
  objc_msgSend(v14, "convertRect:toView:", 0);
  MaxY = CGRectGetMaxY(v31);
  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v13;
  v16 = MaxY - CGRectGetMinY(v32);
  objc_msgSend(v3, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BDF79B8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "integerValue");

  objc_msgSend(v3, "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BDF79C0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  v24 = (void *)MEMORY[0x24BDF6F90];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __34__PDFView__showFormFillingButton___block_invoke_4;
  v27[3] = &unk_24C25DEC8;
  v25 = *(id *)(a1 + 40);
  v30 = v16;
  v26 = *(_QWORD *)(a1 + 32);
  v28 = v25;
  v29 = v26;
  objc_msgSend(v24, "animateWithDuration:delay:options:animations:completion:", v19 | 6, v27, 0, v23, 0.0);

}

uint64_t __34__PDFView__showFormFillingButton___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setConstant:", -15.0 - *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

void __34__PDFView__showFormFillingButton___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF79B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF79C0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = (void *)MEMORY[0x24BDF6F90];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __34__PDFView__showFormFillingButton___block_invoke_6;
  v14[3] = &unk_24C25CBE8;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v15 = v12;
  v16 = v13;
  objc_msgSend(v11, "animateWithDuration:delay:options:animations:completion:", v6 | 6, v14, 0, v10, 0.0);

}

uint64_t __34__PDFView__showFormFillingButton___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setConstant:", -15.0);
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

- (void)signaturesController:(id)a3 didSelectSignatureWithAnnotation:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  CGRect v23;
  CGRect v24;

  v5 = a4;
  -[PDFView currentPage](self, "currentPage");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFView document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexForPage:", v22);

  -[PDFView centerPointOfVisibleRectOfPage:](self, "centerPointOfVisibleRectOfPage:", v22);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v5, "rectangle");
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  v16 = CGRectGetWidth(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  objc_msgSend(v5, "setRectangle:", v9 - v16 * (216.0 / v16) * 0.5, v11 - CGRectGetHeight(v24) * (216.0 / v16) * 0.5);
  -[PDFView document](self, "document");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "akController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setOriginalExifOrientation:", objc_msgSend(v18, "currentExifOrientationForPageAtIndex:", v7));
  objc_msgSend(v18, "currentModelBaseScaleFactorForPageAtIndex:", v7);
  objc_msgSend(v5, "setOriginalModelBaseScaleFactor:");
  objc_msgSend(v22, "akPageAdaptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "akPageModelController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mutableArrayValueForKey:", CFSTR("annotations"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v5);

}

- (id)nextPage
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  if (-[PDFView canGoToNextPage](self, "canGoToNextPage"))
  {
    -[PDFView PDFLayout](self, "PDFLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "functionalDisplayMode");

    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v5 = self->_currentPageIndex + 2;
      if (v5 > -[PDFView lastPageIndex](self, "lastPageIndex"))
        v5 = -[PDFView lastPageIndex](self, "lastPageIndex");
      -[PDFView document](self, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = v5;
    }
    else
    {
      -[PDFView document](self, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = self->_currentPageIndex + 1;
    }
    objc_msgSend(v6, "pageAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)previousPage
{
  void *v3;
  uint64_t v4;
  unint64_t currentPageIndex;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  if (-[PDFView canGoToPreviousPage](self, "canGoToPreviousPage"))
  {
    -[PDFView PDFLayout](self, "PDFLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "functionalDisplayMode");

    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      currentPageIndex = self->_currentPageIndex;
      -[PDFView document](self, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = self->_currentPageIndex;
      if (currentPageIndex < 2)
        v9 = v8 - 1;
      else
        v9 = v8 - 2;
    }
    else
    {
      -[PDFView document](self, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v9 = self->_currentPageIndex - 1;
    }
    objc_msgSend(v6, "pageAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)pushDestination:(id)a3
{
  id v4;
  PDFViewPrivate *v5;
  unint64_t historyIndex;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = self->_private;
    historyIndex = v5->historyIndex;
    if (historyIndex < -[NSMutableArray count](v5->destinationHistory, "count"))
      -[NSMutableArray removeObjectsInRange:](self->_private->destinationHistory, "removeObjectsInRange:", self->_private->historyIndex, -[NSMutableArray count](self->_private->destinationHistory, "count") - self->_private->historyIndex);
    ++self->_private->historyIndex;
    -[NSMutableArray addObject:](self->_private->destinationHistory, "addObject:", v9);
    objc_msgSend(MEMORY[0x24BDD16D8], "defaultQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("PDFViewChangedHistory"), self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueueNotification:postingStyle:", v8, 1);

    v4 = v9;
  }

}

- (void)goToDestinationNoPush:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v14;
  char v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSUInteger v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  unint64_t currentPageIndex;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v12 = 0;
    v6 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v4, "page");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_21;
  objc_msgSend(v5, "point");
  v8 = v7;
  v10 = v9;
  -[PDFView currentPage](self, "currentPage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v11 || v8 != 3.40282347e38)
  {

    goto LABEL_9;
  }

  if (v10 == 3.40282347e38)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
LABEL_9:
  if (v8 == 3.40282347e38 || v10 == 3.40282347e38)
  {
    -[PDFView goToPageNoPush:](self, "goToPageNoPush:", v6);
    goto LABEL_21;
  }
  -[PDFView PDFLayout](self, "PDFLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "functionalDisplayMode");

  if ((v15 & 1) == 0)
    -[PDFView goToPageNoPush:](self, "goToPageNoPush:", v6);
  if (!-[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView"))-[PDFScrollView contentOffset](self->_private->scrollView, "contentOffset");
  objc_msgSend(v6, "boundsForBox:", 0);
  v19 = PDFPointClampInPDFRect(v8, v10, v16, v17, v18);
  v21 = v20;
  objc_msgSend(v6, "rotation");
  -[PDFView convertPoint:fromPage:](self, "convertPoint:fromPage:", v6, v19, v21);
  v23 = v22;
  v25 = v24;
  -[PDFView documentView](self, "documentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "convertPoint:fromView:", self, v23, v25);
  v28 = v27;
  v30 = v29;

  if (-[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView"))
  {
    v31 = -[PDFDocument indexForPage:](self->_private->document, "indexForPage:", v6);
    -[PDFView setCurrentPageIndex:withNotification:](self, "setCurrentPageIndex:withNotification:", v31, 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = CFSTR("pageIndex");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = CFSTR("point");
    v43[0] = v33;
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", v28, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "postNotificationName:object:userInfo:", CFSTR("PDFExtensionViewGoToDestination"), self, v35);

    goto LABEL_21;
  }
  -[PDFView documentView](self, "documentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v38 = v37 - v30;

  -[PDFView constrainedScrollToPoint:](self, "constrainedScrollToPoint:", PDFPointMake(v28, v38));
  -[PDFView determineCurrentPage](self, "determineCurrentPage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFView document](self, "document");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "indexForPage:", v12);
  currentPageIndex = self->_currentPageIndex;

  if (v40 != currentPageIndex)
  {
    self->_private->inhibitAutoScroll = 1;
    -[PDFView goToPageNoPush:](self, "goToPageNoPush:", v12);
    self->_private->inhibitAutoScroll = 0;
  }
LABEL_22:

}

- (void)goToPageNoPush:(id)a3
{
  -[PDFView goToPageNoPush:animated:](self, "goToPageNoPush:animated:", a3, 0);
}

- (void)goToPageNoPush:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  PDFViewPrivate *v7;
  PDFPage *fromPage;
  unint64_t currentPageIndex;
  void *v10;
  unint64_t v11;
  PDFViewPrivate *v13;
  unint64_t v14;
  _BOOL8 v15;
  void *v16;
  id v17;

  v4 = a4;
  v17 = a3;
  if (v17)
  {
    -[PDFView currentPage](self, "currentPage");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = self->_private;
    fromPage = v7->fromPage;
    v7->fromPage = (PDFPage *)v6;

    currentPageIndex = self->_currentPageIndex;
    -[PDFView document](self, "document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView setCurrentPageIndex:withNotification:](self, "setCurrentPageIndex:withNotification:", objc_msgSend(v10, "indexForPage:", v17), 0);

    v11 = self->_currentPageIndex;
    if (!self->_private->inhibitAutoScroll)
    {
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_18;
      -[PDFView _reflectNewPageOn](self, "_reflectNewPageOn");
      objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__syncPageIndexToScrollView, 0);
      v11 = self->_currentPageIndex;
    }
    if (v11 != currentPageIndex && v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PDFView layoutDocumentView](self, "layoutDocumentView");
      v13 = self->_private;
      if (v13->isUsingPageViewController)
      {
        v14 = self->_currentPageIndex;
        v15 = currentPageIndex > v14 && !v13->displaysRTL || currentPageIndex < v14 && v13->displaysRTL;
        -[PDFDocumentViewController goToPage:direction:animated:](v13->documentViewController, "goToPage:direction:animated:", v17, v15, v4);
      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:", CFSTR("PDFViewChangedPage"), self);

    }
  }
LABEL_18:

}

- (BOOL)isRectVisible:(CGRect)a3 onPage:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MaxInsets;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id WeakRetained;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  uint64_t v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  BOOL v42;
  CGRect v44;
  CGRect v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PDFView visiblePages](self, "visiblePages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "containsObject:", v9))
  {
    -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v9, x, y, width, height);
    v11 = PDFRectToCGRect(-[PDFView bounds](self, "bounds"));
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[PDFView safeAreaInsets](self, "safeAreaInsets");
    MaxInsets = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "pdfViewContentInset");
      MaxInsets = PDFEdgeInsetsGetMaxInsets(MaxInsets, v21, v23, v25, v27);
      v21 = v28;
      v23 = v29;
      v25 = v30;
    }
    v31 = PDFEdgeInsetsInsetRect(v11, v13, v15, v17, MaxInsets, v21, v23, v25);
    v33 = v32;
    v35 = v34;
    v37 = v36;

    v45.origin.x = PDFRectToCGRect(v38);
    v45.origin.y = v39;
    v45.size.width = v40;
    v45.size.height = v41;
    v44.origin.x = v31;
    v44.origin.y = v33;
    v44.size.width = v35;
    v44.size.height = v37;
    v42 = CGRectContainsRect(v44, v45);
  }
  else
  {
    v42 = 0;
  }

  return v42;
}

- (double)autoScaleFactor
{
  PDFViewPrivate *v2;
  double result;
  void *v5;
  double v6;
  double v7;

  v2 = self->_private;
  if (v2->isUsingPageViewController)
  {
    -[PDFDocumentViewController autoScaleFactor](v2->documentViewController, "autoScaleFactor");
  }
  else
  {
    -[PDFView currentPage](self, "currentPage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFView _unboundAutoScaleFactorForPage:](self, "_unboundAutoScaleFactorForPage:", v5);
    v7 = v6;

    return v7;
  }
  return result;
}

- (void)setScaleFactor:(double)a3 anchorPoint:(CGPoint)a4
{
  double y;
  double x;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  PDFScrollView *v21;
  PDFViewPrivate *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat width;
  CGFloat height;
  void *v42;
  double v43;
  uint64_t v44;
  _QWORD v45[4];
  PDFScrollView *v46;
  id v47;
  uint64_t v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  y = a4.y;
  x = a4.x;
  -[PDFView setAutoScales:](self, "setAutoScales:", 0);
  -[PDFView bounds](self, "bounds");
  v9 = v8;
  -[PDFView documentView](self, "documentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
  v11 = v9 / a3;
  v43 = a3;
  v14 = PDFRectMakeFromCenter(v12, v13, v9 / a3);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = self->_private->scrollView;
  v22 = self->_private;
  if (!v22->isUsingPageViewController)
    goto LABEL_10;
  -[PDFDocumentViewController currentPage](v22->documentViewController, "currentPage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFDocumentViewController findPageViewControllerForPageIndex:](self->_private->documentViewController, "findPageViewControllerForPageIndex:", -[PDFDocument indexForPage:](self->_private->document, "indexForPage:", v23));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "scrollView");
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "pageView");
    v27 = objc_claimAutoreleasedReturnValue();

    if (v26)
      v28 = v27 == 0;
    else
      v28 = 1;
    if (!v28)
    {
      -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v27, x, y);
      v14 = PDFRectMakeFromCenter(v29, v30, v11);
      v16 = v31;
      v18 = v32;
      v20 = v33;

      v21 = (PDFScrollView *)v26;
      v10 = (id)v27;
LABEL_10:
      objc_msgSend(v10, "bounds", *(_QWORD *)&v43);
      v55.origin.x = v34;
      v55.origin.y = v35;
      v55.size.width = v36;
      v55.size.height = v37;
      v53.origin.x = v14;
      v53.origin.y = v16;
      v53.size.width = v18;
      v53.size.height = v20;
      v54 = CGRectIntersection(v53, v55);
      v38 = v54.origin.x;
      v39 = v54.origin.y;
      width = v54.size.width;
      height = v54.size.height;
      v42 = (void *)MEMORY[0x24BDF6F90];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __38__PDFView_setScaleFactor_anchorPoint___block_invoke;
      v45[3] = &unk_24C25E3E0;
      v21 = v21;
      v46 = v21;
      v48 = v44;
      v10 = v10;
      v47 = v10;
      v49 = v38;
      v50 = v39;
      v51 = width;
      v52 = height;
      objc_msgSend(v42, "animateWithDuration:animations:", v45, 0.25);

      goto LABEL_11;
    }
    v21 = (PDFScrollView *)v26;
    v10 = (id)v27;
  }

LABEL_11:
}

uint64_t __38__PDFView_setScaleFactor_anchorPoint___block_invoke(uint64_t a1)
{
  double v2;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  objc_msgSend(*(id *)(a1 + 32), "setZoomScale:animated:", 0, *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "convertRect:toView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "contentSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "contentInset");
  v15 = v14;
  v17 = v16;
  if (v11 - v7 >= 0.0)
    v18 = v11 - v7;
  else
    v18 = 0.0;
  v19 = CGFloatClamp(v3, 0.0, v18);
  if (v13 - v9 + v17 >= 0.0)
    v20 = v13 - v9 + v17;
  else
    v20 = 0.0;
  v21 = CGFloatClamp(v5, -v15, v20);
  if (v21 <= 0.0)
    v22 = -v15;
  else
    v22 = v21;
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:animated:", 0, v19, v22);
}

- (void)setDisplaysRTL:(BOOL)displaysRTL
{
  PDFViewPrivate *v3;

  self->_private->displaysRTL = displaysRTL;
  v3 = self->_private;
  if (v3->isUsingPageViewController)
    -[PDFDocumentViewController setDisplaysRTL:](v3->documentViewController, "setDisplaysRTL:");
}

- (BOOL)displaysRTL
{
  return self->_private->displaysRTL;
}

- (void)setLineWidthThreshold:(double)a3
{
  -[PDFRenderingProperties setLineWidthThreshold:](self->_private->renderingProperties, "setLineWidthThreshold:", a3);
}

- (double)lineWidthThreshold
{
  double result;

  -[PDFRenderingProperties lineWidthThreshold](self->_private->renderingProperties, "lineWidthThreshold");
  return result;
}

- (void)setPageColor:(id)a3
{
  -[PDFRenderingProperties setPageColor:](self->_private->renderingProperties, "setPageColor:", a3);
}

- (id)pageColor
{
  return -[PDFRenderingProperties pageColor](self->_private->renderingProperties, "pageColor");
}

- (BOOL)displaysBookmarksForPages
{
  return self->_private->displaysBookmarksForPages;
}

- (void)setDisplaysBookmarksForPages:(BOOL)a3
{
  PDFViewPrivate *v3;

  v3 = self->_private;
  if (v3->displaysBookmarksForPages != a3)
  {
    v3->displaysBookmarksForPages = a3;
    -[PDFView _updateBookmarksForPages](self, "_updateBookmarksForPages");
  }
}

- (void)_updateBookmarksForPages
{
  id v3;
  _QWORD v4[5];

  -[PDFDocument bookmarkedPages](self->_private->document, "bookmarkedPages");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__PDFView__updateBookmarksForPages__block_invoke;
  v4[3] = &unk_24C25E408;
  v4[4] = self;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v4);

}

void __35__PDFView__updateBookmarksForPages__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pageViewForPageAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 416) + 208))
      objc_msgSend(v3, "addBookmark");
    else
      objc_msgSend(v3, "removeBookmark");
    v3 = v4;
  }

}

- (id)documentScrollView
{
  return self->_private->scrollView;
}

- (id)pageViewForPageAtIndex:(unint64_t)a3
{
  PDFViewPrivate *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = self->_private;
  if (v4->isUsingPageViewController)
  {
    -[PDFDocumentViewController pageViews](v4->documentViewController, "pageViews");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "page", (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "document");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "indexForPage:", v11);

          if (v13 == a3)
          {
            v14 = v10;

            goto LABEL_12;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_12:

  }
  else
  {
    -[PDFScrollView pdfDocumentView](v4->scrollView, "pdfDocumentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pageViewForPageAtIndex:", a3);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)activeAnnotation
{
  return -[PDFViewController activeAnnotation](self->_private->controller, "activeAnnotation");
}

- (void)setActiveAnnotation:(id)a3
{
  -[PDFViewController setActiveAnnotation:](self->_private->controller, "setActiveAnnotation:", a3);
}

- (void)removeControlForAnnotation:(id)a3
{
  -[PDFViewController removeControlForAnnotation:](self->_private->controller, "removeControlForAnnotation:", a3);
}

- (id)longPressGestureRecognizer
{
  return self->_private->longPressGestureRecognizer;
}

- (id)tapGestureRecognizer
{
  return self->_private->tapGestureRecognizer;
}

- (id)doubleTapGestureRecognizer
{
  return self->_private->doubleTapGestureRecognizer;
}

- (id)parentViewController
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "PDFViewParentViewController");
  else
    -[UIView _PDFViewParentViewController](self, "_PDFViewParentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setEnableTileUpdates:(BOOL)a3
{
  _BOOL4 v3;
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

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  -[PDFRenderingProperties setEnableTileUpdates:](self->_private->renderingProperties, "setEnableTileUpdates:");
  if (v3)
  {
    -[PDFView visiblePageViews](self, "visiblePageViews");
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setNeedsTilesUpdate");
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)forceTileRefresh
{
  void *v3;
  void *v4;
  char v5;

  if (self->_private)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Preview"));

    if ((v5 & 1) == 0)
      -[PDFView internalForceTileRefresh](self, "internalForceTileRefresh");
  }
}

- (void)internalForceTileRefresh
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PDFView visiblePageViews](self, "visiblePageViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "forceTileUpdate");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)internalForceAnnotationRefresh
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[PDFView visiblePages](self, "visiblePages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "annotations", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "makeObjectsPerformSelector:", sel_updateAnnotationEffect);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)highlightPDFRedactions:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  -[PDFView visiblePages](self, "visiblePages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "annotations");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "highlightRedaction:", v3);
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v12);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)highlightDetectedFormFields:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  -[PDFView visiblePages](self, "visiblePages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "annotations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              objc_msgSend(v13, "valueForAnnotationKey:", CFSTR("/AAPL:SFF"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14)
              {
                objc_msgSend(v13, "akAnnotation");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setHighlighted:", v3);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v10);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)printActivePageText
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PDFView currentPage](self, "currentPage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PDFView document](self, "document");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "indexForPage:", v6);

    objc_msgSend(v6, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Page %lu Text:%@"), v4, v5);

  }
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDFView;
  -[PDFView setNeedsDisplay](&v3, sel_setNeedsDisplay);
  -[PDFView forceTileRefresh](self, "forceTileRefresh");
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PDFView;
  -[PDFView setNeedsDisplayInRect:](&v4, sel_setNeedsDisplayInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PDFView forceTileRefresh](self, "forceTileRefresh");
}

- (void)_tileRefresh
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_private)
  {
    -[PDFView visiblePageViews](self, "visiblePageViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setNeedsTilesUpdate");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
    -[PDFTimer update](self->_private->tilesSyncTimer, "update");

  }
}

- (void)setActiveMarkupStyle:(unint64_t)a3
{
  self->_private->activeMarkupStyle = a3;
}

- (unint64_t)activeMarkupStyle
{
  return self->_private->activeMarkupStyle;
}

- (BOOL)isUpdatingSelectionMarkups
{
  return -[PDFViewController isUpdatingSelectionMarkups](self->_private->controller, "isUpdatingSelectionMarkups");
}

- (void)addMarkupWithStyle:(unint64_t)a3 fromSelection:(id)a4
{
  -[PDFViewController setMarkupStyle:forSelection:clearSelection:](self->_private->controller, "setMarkupStyle:forSelection:clearSelection:", a3, a4, 1);
}

- (void)interactWithAnnotation:(id)a3
{
  -[PDFViewController interactWithAnnotation:](self->_private->controller, "interactWithAnnotation:", a3);
}

- (BOOL)handleTabInTextWidget:(id)a3
{
  -[PDFViewController activateNextAnnotation:withCompletion:](self->_private->controller, "activateNextAnnotation:withCompletion:", 0, 0);
  return 1;
}

- (BOOL)handleBackTabInTextWidget:(id)a3
{
  -[PDFViewController activateNextAnnotation:withCompletion:](self->_private->controller, "activateNextAnnotation:withCompletion:", 1, 0);
  return 1;
}

- (BOOL)PDFKitHandleTabInTextWidget:(id)a3
{
  -[PDFViewController activateNextAnnotation:withCompletion:](self->_private->controller, "activateNextAnnotation:withCompletion:", 0, 0);
  return 1;
}

- (BOOL)PDFKitHandleBackTabInTextWidget:(id)a3
{
  -[PDFViewController activateNextAnnotation:withCompletion:](self->_private->controller, "activateNextAnnotation:withCompletion:", 1, 0);
  return 1;
}

- (BOOL)isOverLinkAnnotation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  y = a3.y;
  x = a3.x;
  -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v6, x, y);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "annotationAtPoint:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v6, "scannedAnnotationAtPoint:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("/Link"));

  if ((v13 & 1) != 0)
    v14 = 1;
  else
LABEL_6:
    v14 = 0;

  return v14;
}

- (void)setGutterWidth:(double)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  -[PDFView gutterWidth](self, "gutterWidth");
  if (v5 != a3)
  {
    -[PDFView gutterWidth](self, "gutterWidth");
    if (v6 >= 0.0)
    {
      v7 = (void *)MEMORY[0x24BDD16E0];
      -[PDFView gutterWidth](self, "gutterWidth");
      *(float *)&v8 = v8;
      objc_msgSend(v7, "numberWithFloat:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      self->_private->gutterWide = a3;
      -[PDFView layoutDocumentView](self, "layoutDocumentView");

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("setGutterWidth: width cannot be negative"));
    }
  }
}

- (double)gutterWidth
{
  return self->_private->gutterWide;
}

- (double)defaultGutterWidth
{
  return 224.0;
}

- (BOOL)pageShadowsEnabled
{
  return -[PDFRenderingProperties enablePageShadows](self->_private->renderingProperties, "enablePageShadows");
}

- (void)enablePageShadows:(BOOL)pageShadowsEnabled
{
  -[PDFRenderingProperties setEnablePageShadows:](self->_private->renderingProperties, "setEnablePageShadows:", pageShadowsEnabled);
}

- (void)setForcesTopAlignment:(BOOL)a3
{
  -[PDFScrollView setForcesTopAlignment:](self->_private->scrollView, "setForcesTopAlignment:", a3);
  -[PDFView layoutDocumentView](self, "layoutDocumentView");
}

- (id)_getDocumentAKController
{
  PDFDocument *document;
  void *v3;
  void *v4;
  void *v5;

  document = self->_private->document;
  if (document)
  {
    -[PDFDocument akDocumentAdaptor](document, "akDocumentAdaptor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "akMainController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)akToolbarView
{
  void *v3;
  void *v4;
  void *v5;

  if (-[PDFDocument isLocked](self->_private->document, "isLocked"))
  {
    v3 = 0;
  }
  else
  {
    -[PDFView _getDocumentAKController](self, "_getDocumentAKController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PDFDocument akDocumentAdaptor](self->_private->document, "akDocumentAdaptor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "akToolbarView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)setAkToolbarViewTintColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PDFView akToolbarView](self, "akToolbarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setBarTintColor:", v5);
  }

}

- (id)akToolbarViewTintColor
{
  void *v2;
  void *v3;

  -[PDFView akToolbarView](self, "akToolbarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "barTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setAkToolbarViewItemTintColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PDFView akToolbarView](self, "akToolbarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setTintColor:", v5);
  }

}

- (id)akToolbarViewItemTintColor
{
  void *v2;
  void *v3;

  -[PDFView akToolbarView](self, "akToolbarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)akUndoToolbarItem
{
  void *v2;
  void *v3;
  void *v4;

  -[PDFView _getDocumentAKController](self, "_getDocumentAKController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "toolbarButtonItemOfType:", 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)akRedoToolbarItem
{
  void *v2;
  void *v3;
  void *v4;

  -[PDFView _getDocumentAKController](self, "_getDocumentAKController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "toolbarButtonItemOfType:", 11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)akAnnotationEditingEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[PDFView _getDocumentAKController](self, "_getDocumentAKController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "annotationEditingEnabled");
  else
    v4 = 0;

  return v4;
}

- (void)setAkAnnotationEditingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  PDFViewPrivate *v9;
  id v10;

  v3 = a3;
  -[PDFView _getDocumentAKController](self, "_getDocumentAKController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = v5;
    v6 = objc_msgSend(v5, "annotationEditingEnabled") == v3;
    v5 = v10;
    if (!v6)
    {
      objc_msgSend(v10, "setAnnotationEditingEnabled:", v3);
      if (v3)
      {
        v7 = (void *)objc_opt_new();
        objc_msgSend(v7, "setTag:", 763000);
        objc_msgSend(v10, "performActionForSender:", v7);

      }
      else
      {
        objc_msgSend(v10, "modelController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "deselectAllAnnotations");

        objc_msgSend(v10, "resetToDefaultToolMode");
      }
      v9 = self->_private;
      v5 = v10;
      if (v9->isUsingPageViewController)
      {
        -[PDFDocumentViewController setScrollViewScrollEnabled:](v9->documentViewController, "setScrollViewScrollEnabled:", v3 ^ 1);
        v5 = v10;
      }
    }
  }

}

- (BOOL)isAnnotationEditingEnabled
{
  return self->_annotationEditingAllowed
      || -[PDFView akAnnotationEditingEnabled](self, "akAnnotationEditingEnabled")
      || -[PDFView allowsMarkupAnnotationEditing](self, "allowsMarkupAnnotationEditing");
}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
  self->_annotationEditingAllowed = a3;
}

- (BOOL)isFormDetectionEnabled
{
  return self->_formDetectionEnabled;
}

- (void)setFormDetectionEnabled:(BOOL)a3
{
  if (self->_formDetectionEnabled != a3)
  {
    self->_formDetectionEnabled = a3;
    if (a3)
      -[PDFView visiblePagesChanged:](self, "visiblePagesChanged:", 0);
  }
}

- (BOOL)isInMarkupMode
{
  return self->_inMarkupMode || -[PDFView akAnnotationEditingEnabled](self, "akAnnotationEditingEnabled");
}

- (void)setNewPageVisibilityDelegate:(id)a3 withOldDelegate:(id)a4
{
  id v6;
  id v7;
  PDFViewPrivate *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6 != v7)
  {
    v8 = self->_private;
    if (v8->isUsingPageViewController)
    {
      -[PDFDocumentViewController pageViews](v8->documentViewController, "pageViews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PDFScrollView pdfDocumentView](v8->scrollView, "pdfDocumentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pageViews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_storeWeak((id *)&self->_private->delegate, v7);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    v31 = v11;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v16, "visibilityDelegateIndex") != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v7)
            {
              v17 = objc_msgSend(v16, "visibilityDelegateIndex");
              -[PDFView callPageVisibilityDelegateMethod:forPageView:atPageIndex:](self, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 2, v16, v17);
              v18 = v17;
              v11 = v31;
              -[PDFView callPageVisibilityDelegateMethod:forPageView:atPageIndex:](self, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 3, v16, v18);
            }
            else
            {
              objc_msgSend(v16, "setVisibilityDelegateIndex:", 0x7FFFFFFFFFFFFFFFLL);
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v13);
    }

    objc_storeWeak((id *)&self->_private->delegate, v6);
    if (v6)
    {
      v29 = v7;
      v30 = v6;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v19 = v11;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
            objc_msgSend(v24, "page");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "document");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "page");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v26, "indexForPage:", v27);

            -[PDFView callPageVisibilityDelegateMethod:forPageView:atPageIndex:](self, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 0, v24, v28);
            -[PDFView callPageVisibilityDelegateMethod:forPageView:atPageIndex:](self, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 1, v24, v28);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v21);
      }

      v7 = v29;
      v6 = v30;
      v11 = v31;
    }

  }
}

- (void)callPageVisibilityDelegateMethod:(int)a3 forPageView:(id)a4 atPageIndex:(unint64_t)a5
{
  id v8;
  id WeakRetained;
  PDFOverlayViewsController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
    v10 = self->_overlayViewController;
    switch(a3)
    {
      case 0:
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "page");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "pdfView:willAddView:forPage:atIndex:", self, v8, v11, a5);

        }
        objc_msgSend(v8, "setVisibilityDelegateIndex:", a5);
        break;
      case 1:
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "page");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "pdfView:didAddView:forPage:atIndex:", self, v8, v12, a5);

        }
        objc_msgSend(v8, "page");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFOverlayViewsController pdfView:didAddView:forPage:atIndex:](v10, "pdfView:didAddView:forPage:atIndex:", self, v8, v13, a5);

        -[PDFCoachMarkManager pageLayerDidAppear:](self->_private->coachMarkManager, "pageLayerDidAppear:", v8);
        break;
      case 2:
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "page");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "pdfView:willRemoveView:forPage:atIndex:", self, v8, v14, a5);

        }
        objc_msgSend(v8, "page");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFOverlayViewsController pdfView:willRemoveView:forPage:atIndex:](v10, "pdfView:willRemoveView:forPage:atIndex:", self, v8, v15, a5);

        -[PDFCoachMarkManager pageLayerWillRemove:](self->_private->coachMarkManager, "pageLayerWillRemove:", v8);
        break;
      case 3:
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "page");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "pdfView:didRemoveView:forPage:atIndex:", self, v8, v16, a5);

        }
        objc_msgSend(v8, "setVisibilityDelegateIndex:", 0x7FFFFFFFFFFFFFFFLL);
        objc_msgSend(v8, "page");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFView visiblePageViews](self, "visiblePageViews");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v26 != v21)
                objc_enumerationMutation(v18);
              v23 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * i);
              if (v23 != v8)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "page");
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24 == v17)
                  objc_msgSend(v23, "setVisibilityDelegateIndex:", 0x7FFFFFFFFFFFFFFFLL);
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v20);
        }

        break;
      default:
        NSLog(CFSTR("Incorrect call into PDFDocumentView's _callPageVisibilityDelegateMethod: method"));
        break;
    }

  }
}

- (void)performOverlayAdaptorPageVisibilityTrueUpAfterSettingDocument
{
  PDFViewPrivate *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = self->_private;
  if (v3->isUsingPageViewController)
  {
    -[PDFDocumentViewController pageViews](v3->documentViewController, "pageViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PDFScrollView pdfDocumentView](v3->scrollView, "pdfDocumentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pageViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "visibilityDelegateIndex", (_QWORD)v14);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = v12;
          -[PDFView callPageVisibilityDelegateMethodForOverlayAdaptorOnly:forPageView:atPageIndex:](self, "callPageVisibilityDelegateMethodForOverlayAdaptorOnly:forPageView:atPageIndex:", 0, v11, v12);
          -[PDFView callPageVisibilityDelegateMethodForOverlayAdaptorOnly:forPageView:atPageIndex:](self, "callPageVisibilityDelegateMethodForOverlayAdaptorOnly:forPageView:atPageIndex:", 1, v11, v13);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)callPageVisibilityDelegateMethodForOverlayAdaptorOnly:(int)a3 forPageView:(id)a4 atPageIndex:(unint64_t)a5
{
  PDFOverlayViewsController *v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = self->_overlayViewController;
  switch(a3)
  {
    case 0:
    case 3:
      break;
    case 1:
      objc_msgSend(v10, "page");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFOverlayViewsController pdfView:didAddView:forPage:atIndex:](v8, "pdfView:didAddView:forPage:atIndex:", self, v10, v9, a5);
      goto LABEL_5;
    case 2:
      objc_msgSend(v10, "page");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFOverlayViewsController pdfView:willRemoveView:forPage:atIndex:](v8, "pdfView:willRemoveView:forPage:atIndex:", self, v10, v9, a5);
LABEL_5:

      break;
    default:
      NSLog(CFSTR("Incorrect call into PDFDocumentView's _callPageVisibilityDelegateMethod: method"));
      break;
  }

}

- (BOOL)showsScrollIndicators
{
  return self->_private->showsScrollIndicators;
}

- (void)setShowsScrollIndicators:(BOOL)a3
{
  PDFViewPrivate *v3;

  v3 = self->_private;
  if (v3->showsScrollIndicators != a3)
  {
    v3->showsScrollIndicators = a3;
    -[PDFView positionInternalViews:](self, "positionInternalViews:", 0);
  }
}

+ (void)DisableAnnotationKit
{
  SetAKEnabled(0);
}

- (void)setIsUsingPDFExtensionView:(BOOL)a3
{
  -[PDFRenderingProperties setIsUsingPDFExtensionView:](self->_private->renderingProperties, "setIsUsingPDFExtensionView:", a3);
}

- (void)setScrollViewScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PDFScrollView setScrollEnabled:](self->_private->scrollView, "setScrollEnabled:");
  -[PDFScrollView setUserInteractionEnabled:](self->_private->scrollView, "setUserInteractionEnabled:", v3);
}

- (CGRect)extensionViewBoundsInDocument
{
  PDFViewPrivate *v2;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v2 = self->_private;
  x = v2->extensionViewBoundsInDocument.origin.x;
  y = v2->extensionViewBoundsInDocument.origin.y;
  width = v2->extensionViewBoundsInDocument.size.width;
  height = v2->extensionViewBoundsInDocument.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)extensionViewZoomScale
{
  return self->_private->extensionViewZoomScale;
}

- (CGSize)pdfDocumentViewSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentViewSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)updatePDFViewLayout:(CGRect)a3 scrollViewFrame:(CGRect)a4 zoomScale:(double)a5
{
  id v5;

  self->_private->extensionViewBoundsInDocument = a3;
  self->_private->extensionViewFrame = a4;
  self->_private->extensionViewZoomScale = a5;
  -[PDFScrollView pdfDocumentView](self->_private->scrollView, "pdfDocumentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateVisibility");

}

- (CGRect)rootViewBounds
{
  PDFViewPrivate *v3;
  double x;
  double y;
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  if (-[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView"))
  {
    v3 = self->_private;
    x = v3->extensionViewFrame.origin.x;
    y = v3->extensionViewFrame.origin.y;
    width = v3->extensionViewFrame.size.width;
    height = v3->extensionViewFrame.size.height;
  }
  else
  {
    -[PDFView bounds](self, "bounds");
    -[PDFView convertRect:toView:](self, "convertRect:toView:", 0);
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }
  -[PDFView mainScreenScale](self, "mainScreenScale");
  v13 = PDFRectScale(x, y, width, height, v12);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)targetBackingScaleFactor
{
  double v2;

  -[PDFView mainScreenScale](self, "mainScreenScale");
  return fmax(v2, 1.0);
}

- (CGRect)convertRectToRootView:(CGRect)a3 fromPageLayer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PDFViewPrivate *v19;
  double extensionViewZoomScale;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PDFView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toLayer:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  if (-[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView"))
  {
    v19 = self->_private;
    extensionViewZoomScale = v19->extensionViewZoomScale;
    v12 = v19->extensionViewFrame.origin.x
        + v12 * extensionViewZoomScale
        - v19->extensionViewBoundsInDocument.origin.x * extensionViewZoomScale;
    v16 = v16 * extensionViewZoomScale;
    v18 = v18 * extensionViewZoomScale;
    v21 = v19->extensionViewFrame.size.height
        - v18
        - (v19->extensionViewFrame.origin.y
         + v14 * extensionViewZoomScale
         - v19->extensionViewBoundsInDocument.origin.y * extensionViewZoomScale);
  }
  else
  {
    -[PDFView layer](self, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v21 = v23 - v18 - v14;

  }
  -[PDFView layer](self, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "convertRect:toLayer:", 0, v12, v21, v16, v18);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  -[PDFView mainScreenScale](self, "mainScreenScale");
  v34 = v28 * v33;
  v35 = v30 * v33;
  v36 = v32 * v33;
  v37 = v26 * v33;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v37;
  return result;
}

- (CGRect)convertRootViewRect:(CGRect)a3 toPageLayer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double extensionViewZoomScale;
  double v37;
  double v38;
  double v39;
  double v40;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PDFView mainScreenScale](self, "mainScreenScale");
  v11 = x / v10;
  v12 = y / v10;
  v13 = width / v10;
  v14 = height / v10;
  -[PDFView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertRect:fromLayer:", 0, v11, v12, v13, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[PDFView layer](self, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25 - v23 - v19;

  -[PDFView layer](self, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:fromLayer:", v27, v17, v26, v21, v23);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  if (-[PDFRenderingProperties isUsingPDFExtensionView](self->_private->renderingProperties, "isUsingPDFExtensionView"))
  {
    extensionViewZoomScale = self->_private->extensionViewZoomScale;
    v33 = v33 / extensionViewZoomScale;
    v35 = v35 / extensionViewZoomScale;
  }
  v37 = v29;
  v38 = v31;
  v39 = v33;
  v40 = v35;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (BOOL)flipsTileContents
{
  return 1;
}

- (CGRect)extendedRootViewBounds
{
  CGRect v2;

  -[PDFView rootViewBounds](self, "rootViewBounds");
  return PDFRectInset(v2, v2.size.width * -0.1, v2.size.height * -0.1);
}

- (CGRect)mainScreenBounds
{
  void *v2;
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
  CGRect result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)mainScreenScale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

+ (void)setUseIOSurfaceForTiles:(BOOL)a3
{
  SetUseIOSurfaceForTiles(a3);
}

- (id)pageOverlayViewProvider
{
  return objc_loadWeakRetained((id *)&self->_pageOverlayViewProvider);
}

- (void)setInMarkupMode:(BOOL)inMarkupMode
{
  self->_inMarkupMode = inMarkupMode;
}

- (BOOL)isFindInteractionEnabled
{
  return self->_findInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageOverlayViewProvider);
  objc_storeStrong(&self->_formFieldButtonHideKeyboardNotification, 0);
  objc_storeStrong(&self->_formFieldButtonShowKeyboardNotification, 0);
  objc_storeStrong((id *)&self->_formFieldButton, 0);
  objc_storeStrong((id *)&self->_overlayViewController, 0);
  objc_destroyWeak((id *)&self->_detectedFormFieldPage);
  objc_destroyWeak((id *)&self->_detectedFormField);
  objc_destroyWeak((id *)&self->_pageBackgroundManager);
  objc_storeStrong((id *)&self->_private, 0);
}

@end
