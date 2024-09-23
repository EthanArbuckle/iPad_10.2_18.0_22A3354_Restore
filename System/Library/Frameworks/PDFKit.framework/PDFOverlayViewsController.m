@implementation PDFOverlayViewsController

+ (id)instanceForPlatformWithPDFView:(id)a3
{
  id v3;
  PDFOverlayViewsController_ios *v4;

  v3 = a3;
  v4 = -[PDFOverlayViewsController_ios initWithPDFView:]([PDFOverlayViewsController_ios alloc], "initWithPDFView:", v3);

  return v4;
}

- (PDFOverlayViewsController)initWithPDFView:(id)a3
{
  id v4;
  PDFOverlayViewsController *v5;
  PDFOverlayViewsController *v6;
  uint64_t v7;
  NSMutableIndexSet *observedPageIndices;
  uint64_t v9;
  NSMapTable *pageToOverlayMap;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDFOverlayViewsController;
  v5 = -[PDFOverlayViewsController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pdfView, v4);
    v7 = objc_opt_new();
    observedPageIndices = v6->_observedPageIndices;
    v6->_observedPageIndices = (NSMutableIndexSet *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    pageToOverlayMap = v6->_pageToOverlayMap;
    v6->_pageToOverlayMap = (NSMapTable *)v9;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_isTornDown)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      -[PDFOverlayViewsController _teardown](self, "_teardown");
    else
      NSLog(CFSTR("%s: Called from a background thread, and we aren't torn down yet!"), "-[PDFOverlayViewsController dealloc]");
  }
  v3.receiver = self;
  v3.super_class = (Class)PDFOverlayViewsController;
  -[PDFOverlayViewsController dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[PDFOverlayViewsController _teardown](self, "_teardown");
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__PDFOverlayViewsController_teardown__block_invoke;
    block[3] = &unk_24C25C350;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __37__PDFOverlayViewsController_teardown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_teardown");
}

- (void)_teardown
{
  id v3;

  if (!self->_isTornDown)
  {
    self->_isTornDown = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
}

- (void)pdfView:(id)a3 willSetDocument:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);

  if (WeakRetained != v6 && WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_viewProvider);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "teardownGestureRecognizersForView:", v9);
    -[PDFOverlayViewsController _uninstallAllOverlays](self, "_uninstallAllOverlays");

  }
}

- (void)pdfView:(id)a3 didSetDocument:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);

  if (WeakRetained != v6)
  {
    objc_storeWeak((id *)&self->_pdfDocument, v6);
    if (v6)
    {
      v8 = objc_loadWeakRetained((id *)&self->_viewProvider);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "setupGestureRecognizersForView:", v9);

    }
  }

}

- (void)pdfView:(id)a3 didAddView:(id)a4 forPage:(id)a5 atIndex:(unint64_t)a6
{
  id v9;
  id WeakRetained;
  id v11;

  v11 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);

  if (WeakRetained)
  {
    -[PDFOverlayViewsController _installOverlayForPageView:ofPage:atIndex:](self, "_installOverlayForPageView:ofPage:atIndex:", v11, v9, a6);
    -[PDFOverlayViewsController _setupRotationNotificationObservationForPageAtIndex:](self, "_setupRotationNotificationObservationForPageAtIndex:", a6);
  }

}

- (void)pdfView:(id)a3 willRemoveView:(id)a4 forPage:(id)a5 atIndex:(unint64_t)a6
{
  id v9;
  id WeakRetained;
  id v11;

  v11 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);

  if (WeakRetained)
  {
    -[PDFOverlayViewsController _teardownRotationNotificationObservationForPageAtIndex:](self, "_teardownRotationNotificationObservationForPageAtIndex:", a6);
    -[PDFOverlayViewsController _uninstallOverlayForPageView:ofPage:atIndex:](self, "_uninstallOverlayForPageView:ofPage:atIndex:", v11, v9, a6);
  }

}

- (id)_cachedOverlayViewForPage:(id)a3
{
  return -[NSMapTable objectForKey:](self->_pageToOverlayMap, "objectForKey:", a3);
}

- (id)_callOverlayViewForPage:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_pageToOverlayMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
    -[PDFOverlayViewsController pdfView](self, "pdfView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "pdfView:overlayViewForPage:", v7, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[NSMapTable setObject:forKey:](self->_pageToOverlayMap, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)_callWillEndDisplayingOverlayViewForPage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PDFOverlayViewsController viewProvider](self, "viewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFOverlayViewsController _cachedOverlayViewForPage:](self, "_cachedOverlayViewForPage:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PDFOverlayViewsController pdfView](self, "pdfView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pdfView:willEndDisplayingOverlayView:forPage:", v6, v5, v7);

  }
  -[NSMapTable removeObjectForKey:](self->_pageToOverlayMap, "removeObjectForKey:", v7);

}

- (void)_uninstallAllOverlays
{
  id WeakRetained;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "pageCount");
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        -[PDFOverlayViewsController _teardownRotationNotificationObservationForPageAtIndex:](self, "_teardownRotationNotificationObservationForPageAtIndex:", i);
        v6 = objc_loadWeakRetained((id *)&self->_pdfView);
        objc_msgSend(v6, "pageViewForPageAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "pageAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFOverlayViewsController _uninstallOverlayForPageView:ofPage:atIndex:](self, "_uninstallOverlayForPageView:ofPage:atIndex:", v7, v8, i);

      }
    }
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    WeakRetained = v9;
  }

}

- (void)_setupRotationNotificationObservationForPageAtIndex:(unint64_t)a3
{
  id WeakRetained;
  void *v6;

  if ((-[NSMutableIndexSet containsIndex:](self->_observedPageIndices, "containsIndex:") & 1) == 0)
  {
    if (!-[NSMutableIndexSet count](self->_observedPageIndices, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__pageRotationChanged_, CFSTR("PDFPageDidRotate"), WeakRetained);

    }
    -[NSMutableIndexSet addIndex:](self->_observedPageIndices, "addIndex:", a3);
  }
}

- (void)_teardownRotationNotificationObservationForPageAtIndex:(unint64_t)a3
{
  void *v5;
  id WeakRetained;

  if (-[NSMutableIndexSet containsIndex:](self->_observedPageIndices, "containsIndex:"))
  {
    -[NSMutableIndexSet removeIndex:](self->_observedPageIndices, "removeIndex:", a3);
    if (!-[NSMutableIndexSet count](self->_observedPageIndices, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("PDFPageDidRotate"), WeakRetained);

    }
  }
}

- (void)_pageRotationChanged:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
  objc_msgSend(v12, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == WeakRetained)
  {
    objc_msgSend(v12, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("page"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(WeakRetained, "indexForPage:", v7);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      if (v8 < objc_msgSend(WeakRetained, "pageCount"))
      {
        v10 = objc_loadWeakRetained((id *)&self->_pdfView);
        objc_msgSend(v10, "pageViewForPageAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setEnableTileUpdates:", 0);
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
        -[PDFOverlayViewsController _uninstallOverlayForPageView:ofPage:atIndex:](self, "_uninstallOverlayForPageView:ofPage:atIndex:", v11, v7, v9);
        objc_msgSend(v10, "layoutDocumentView");
        -[PDFOverlayViewsController _installOverlayForPageView:ofPage:atIndex:](self, "_installOverlayForPageView:ofPage:atIndex:", v11, v7, v9);
        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
        objc_msgSend(v11, "setEnableTileUpdates:", 1);

      }
    }

  }
}

- (PDFView)pdfView
{
  return (PDFView *)objc_loadWeakRetained((id *)&self->_pdfView);
}

- (void)setPdfView:(id)a3
{
  objc_storeWeak((id *)&self->_pdfView, a3);
}

- (PDFDocument)pdfDocument
{
  return (PDFDocument *)objc_loadWeakRetained((id *)&self->_pdfDocument);
}

- (void)setPdfDocument:(id)a3
{
  objc_storeWeak((id *)&self->_pdfDocument, a3);
}

- (PDFPageOverlayViewProvider)viewProvider
{
  return (PDFPageOverlayViewProvider *)objc_loadWeakRetained((id *)&self->_viewProvider);
}

- (void)setViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_viewProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_destroyWeak((id *)&self->_pdfDocument);
  objc_destroyWeak((id *)&self->_pdfView);
  objc_storeStrong((id *)&self->_observedPageIndices, 0);
  objc_storeStrong((id *)&self->_pageToOverlayMap, 0);
}

@end
