@implementation PDFDocumentView

- (PDFDocumentView)initWithPDFView:(id)a3
{
  id v4;
  PDFDocumentView *v5;
  PDFDocumentViewPrivate *v6;
  PDFDocumentViewPrivate *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFDocumentView;
  v5 = -[PDFTextInputView initWithDelegate:](&v11, sel_initWithDelegate_, self);
  if (v5)
  {
    v6 = objc_alloc_init(PDFDocumentViewPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->pdfView, v4);
    objc_msgSend(v4, "renderingProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_private->renderingProperties, v8);
    v5->_private->ignoreChangedBoundsForBoxNotification = 1;
    -[PDFDocumentView updateNotificationsForDocument](v5, "updateNotificationsForDocument");
    if ((objc_msgSend(v8, "isUsingPDFExtensionView") & 1) == 0)
      -[PDFDocumentView becomeFirstResponder](v5, "becomeFirstResponder");
    -[PDFTextInputView updateGestureRecognizerDependencies](v5, "updateGestureRecognizerDependencies");
    -[PDFDocumentView layer](v5, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsEdgeAntialiasing:", 0);

  }
  return v5;
}

- (void)dealloc
{
  PDFPageBackgroundManager *pageBackgroundManager;
  PDFDocumentViewPrivate *v4;
  PDFPageBackgroundManager *v5;
  void *v6;
  objc_super v7;

  pageBackgroundManager = self->_private->pageBackgroundManager;
  if (pageBackgroundManager)
  {
    -[PDFPageBackgroundManager cancel](pageBackgroundManager, "cancel");
    v4 = self->_private;
    v5 = v4->pageBackgroundManager;
    v4->pageBackgroundManager = 0;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)PDFDocumentView;
  -[PDFDocumentView dealloc](&v7, sel_dealloc);
}

- (void)setDocument:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  PDFDocumentViewPrivate *v15;
  NSMutableDictionary *pageViews;
  NSMutableDictionary *v17;
  PDFDocumentViewPrivate *v18;
  NSMutableDictionary *pageFrames;
  PDFDocumentContentView *v20;
  uint64_t v21;
  PDFDocumentViewPrivate *v22;
  PDFDocumentContentView *contentView;
  PDFPageBackgroundManager *pageBackgroundManager;
  PDFPageBackgroundManager *v25;
  id v26;
  uint64_t v27;
  PDFDocumentViewPrivate *v28;
  PDFPageBackgroundManager *v29;
  PDFDocumentViewPrivate *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  if (WeakRetained != v4)
  {
    v31 = WeakRetained;
    -[NSMutableDictionary allValues](self->_private->pageViews, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
          v12 = objc_loadWeakRetained((id *)&self->_private->pdfView);
          v13 = objc_msgSend(v11, "visibilityDelegateIndex");
          objc_msgSend(v12, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 2, v11, v13);
          objc_msgSend(v11, "removeFromSuperview");
          objc_msgSend(v12, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 3, v11, v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v8);
    }
    objc_storeWeak((id *)&self->_private->document, v4);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = self->_private;
    pageViews = v15->pageViews;
    v15->pageViews = v14;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v18 = self->_private;
    pageFrames = v18->pageFrames;
    v18->pageFrames = v17;

    objc_msgSend(v4, "setPageChangeDelegate:", self);
    v20 = [PDFDocumentContentView alloc];
    -[PDFDocumentView frame](self, "frame");
    v21 = -[PDFDocumentContentView initWithFrame:](v20, "initWithFrame:");
    v22 = self->_private;
    contentView = v22->contentView;
    v22->contentView = (PDFDocumentContentView *)v21;

    -[PDFDocumentView addSubview:](self, "addSubview:", self->_private->contentView);
    pageBackgroundManager = self->_private->pageBackgroundManager;
    if (pageBackgroundManager)
      -[PDFPageBackgroundManager cancel](pageBackgroundManager, "cancel");
    if (v4)
    {
      if (objc_msgSend(v4, "isLinearized") && (objc_msgSend(v4, "hasHighLatencyDataProvider") & 1) != 0)
        goto LABEL_17;
      v25 = [PDFPageBackgroundManager alloc];
      v26 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
      v27 = -[PDFPageBackgroundManager initWithDelegate:andRenderingProperties:](v25, "initWithDelegate:andRenderingProperties:", self, v26);
      v28 = self->_private;
      v29 = v28->pageBackgroundManager;
      v28->pageBackgroundManager = (PDFPageBackgroundManager *)v27;

    }
    else
    {
      -[PDFPageBackgroundManager cancel](self->_private->pageBackgroundManager, "cancel");
      v30 = self->_private;
      v26 = v30->pageBackgroundManager;
      v30->pageBackgroundManager = 0;
    }

LABEL_17:
    -[PDFDocumentContentView setUserInteractionEnabled:](self->_private->contentView, "setUserInteractionEnabled:", 0);
    -[PDFDocumentView updateNotificationsForDocument](self, "updateNotificationsForDocument");

    WeakRetained = v31;
  }

}

- (id)document
{
  return objc_loadWeakRetained((id *)&self->_private->document);
}

- (void)updateNotificationsForDocument
{
  id WeakRetained;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("PDFPageChangedBoundsForBox"), 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("PDFPageDidRotate"), 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("PDFPageDidChangeBounds"), 0);
  if (WeakRetained)
  {
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_changedBoundsForBoxNotification_, CFSTR("PDFPageChangedBoundsForBox"), WeakRetained);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_didRotatePageNotification_, CFSTR("PDFPageDidRotate"), WeakRetained);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_didRotatePageNotification_, CFSTR("PDFPageDidChangeBounds"), WeakRetained);
  }

}

- (id)pageViewForPageAtIndex:(unint64_t)a3
{
  NSMutableDictionary *pageViews;
  void *v6;
  void *v7;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !-[NSMutableDictionary count](self->_private->pageViews, "count"))
  {
    v7 = 0;
  }
  else
  {
    pageViews = self->_private->pageViews;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](pageViews, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)createPageViewForPageAtIndex:(unint64_t)a3 withFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  NSMutableDictionary *pageFrames;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *pageViews;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  unint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v34 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (WeakRetained)
  {
    pageFrames = self->_private->pageFrames;
    v27 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](pageFrames, "objectForKey:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v13 = objc_loadWeakRetained((id *)&self->_private->document);
      objc_msgSend(v13, "pageAtIndex:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setView:", WeakRetained);
      -[PDFDocumentView _createPageView:](self, "_createPageView:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_private->pageViews;
      objc_sync_enter(v16);
      objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 0, v15, a3);
      pageViews = self->_private->pageViews;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](pageViews, "setObject:forKey:", v15, v18);

      -[PDFDocumentView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v15, self->_private->contentView);
      -[PDFTextInputView updateTextSelectionGraphics](self, "updateTextSelectionGraphics");
      objc_sync_exit(v16);

      objc_msgSend(v15, "setFrame:", x, y, width, height);
      objc_msgSend(WeakRetained, "highlightedSelections");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v23, "pages");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "containsObject:", v14);

            if (v25)
              objc_msgSend(v15, "addSearchSelection:", v23);
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v20);
      }
      objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 1, v15, v27);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)removePageViewForPageAtIndex:(unint64_t)a3
{
  NSMutableDictionary *pageViews;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableDictionary *obj;

  obj = self->_private->pageViews;
  objc_sync_enter(obj);
  pageViews = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pageViews, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "visibilityDelegateIndex");
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 2, v7, v8);
  v10 = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

  objc_msgSend(v7, "removeFromSuperview");
  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 3, v7, v8);

  objc_sync_exit(obj);
}

- (id)pageViews
{
  return (id)-[NSMutableDictionary allValues](self->_private->pageViews, "allValues");
}

- (void)layoutDocumentView
{
  id WeakRetained;
  void *v4;
  NSMutableDictionary *v5;
  PDFDocumentViewPrivate *v6;
  NSMutableDictionary *pageFrames;
  id v8;
  uint64_t v9;
  PDFDocumentViewPrivate *v10;
  CGFloat v11;
  CGFloat v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  void *v17;
  double v18;
  double v19;
  int v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  uint64_t v34;
  NSMutableDictionary *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  self->_private->ignoreChangedBoundsForBoxNotification = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "PDFLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = self->_private;
  pageFrames = v6->pageFrames;
  v6->pageFrames = v5;

  v8 = objc_loadWeakRetained((id *)&self->_private->document);
  objc_msgSend(WeakRetained, "currentPage");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "pageAtIndex:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "contentSizeWithCurrentPage:", v9, v9);
  v10 = self->_private;
  v10->documentViewSize.width = v11;
  v10->documentViewSize.height = v12;
  v13.n128_u64[0] = 0;
  v14.n128_u64[0] = 0;
  -[PDFDocumentView setFrame:](self, "setFrame:", PDFRectMake(v13, v14, self->_private->documentViewSize.width, self->_private->documentViewSize.height));
  v15.n128_u64[0] = 0;
  v16.n128_u64[0] = 0;
  -[PDFDocumentView setBounds:](self, "setBounds:", PDFRectMake(v15, v16, self->_private->documentViewSize.width, self->_private->documentViewSize.height));
  v39 = WeakRetained;
  objc_msgSend(WeakRetained, "documentScrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFDocumentView frame](self, "frame");
  objc_msgSend(v17, "setContentSize:", v18, v19);
  objc_msgSend(v17, "centerAlign");

  v20 = objc_msgSend(v8, "pageCount");
  v21 = v8;
  if (v20 >= 1)
  {
    v22 = 0;
    v23 = v20;
    do
    {
      objc_msgSend(v8, "pageAtIndex:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v4, "boundsForPage:", v24);
        -[PDFDocumentView _pixelAlignPageFrameOrigin:](self, "_pixelAlignPageFrameOrigin:");
        v25 = self->_private->pageFrames;
        objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v26, v27);

        v8 = v21;
      }

      ++v22;
    }
    while (v23 != v22);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[NSMutableDictionary allValues](self->_private->pageViews, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v32, "page");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v8, "indexForPage:", v33);
        v35 = self->_private->pageFrames;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](v35, "objectForKey:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v37, "PDFKitPDFRectValue");
          objc_msgSend(v32, "setFrame:");
        }

        v8 = v21;
      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v29);
  }

  -[PDFTextInputView updateTextSelectionGraphics](self, "updateTextSelectionGraphics");
  self->_private->ignoreChangedBoundsForBoxNotification = 0;

}

- (CGSize)documentViewSize
{
  PDFDocumentViewPrivate *v2;
  double width;
  double height;
  CGSize result;

  v2 = self->_private;
  width = v2->documentViewSize.width;
  height = v2->documentViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)updateVisibility
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[PDFDocumentView _updateVisibility](self, "_updateVisibility");
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__PDFDocumentView_updateVisibility__block_invoke;
    block[3] = &unk_24C25C350;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __35__PDFDocumentView_updateVisibility__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibility");
}

- (void)_updateVisibility
{
  id WeakRetained;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  uint64_t v18;
  NSMutableDictionary *pageFrames;
  void *v20;
  void *v21;
  NSMutableDictionary *pageViews;
  void *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  uint64_t v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  void *v53;
  BOOL v54;
  _BOOL4 v55;
  BOOL v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  _BOOL4 v62;
  id v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (WeakRetained)
  {
    v66 = WeakRetained;
    objc_msgSend(WeakRetained, "PDFLayout");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "functionalDisplayMode");
    objc_msgSend(v66, "bounds");
    objc_msgSend(v66, "convertRect:toView:", self);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
    if (objc_msgSend(v12, "isUsingPDFExtensionView"))
    {
      objc_msgSend(v66, "extensionViewBoundsInDocument");
      v5 = v13;
      v7 = v14;
      v9 = v15;
      v11 = v16;
    }

    v69.origin.x = v5;
    v69.origin.y = v7;
    v69.size.width = v9;
    v69.size.height = v11;
    PDFRectInset(v69, -(v9 - v9 * 2.0) * -0.5, -(v11 - v11 * 3.0) * -0.5);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
      objc_msgSend(MEMORY[0x24BDE57D8], "activateBackground:", 1);
    v67 = objc_loadWeakRetained((id *)&self->_private->document);
    v17 = objc_msgSend(v67, "pageCount");
    if (v17 >= 1)
    {
      v18 = 0;
      v68 = v17;
      while (1)
      {
        pageFrames = self->_private->pageFrames;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](pageFrames, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          break;
LABEL_41:

        if (v68 == ++v18)
          goto LABEL_42;
      }
      pageViews = self->_private->pageViews;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](pageViews, "objectForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v67, "pageAtIndex:", v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = self->_private->pageFrames;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v26, "objectForKey:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "PDFKitPDFRectValue");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;

      v37 = -[PDFDocumentView _pixelAlignPageFrameOrigin:](self, "_pixelAlignPageFrameOrigin:", v30, v32, v34, v36);
      v39 = v38;
      v41 = v40;
      v42 = PDFRectToCGRect(v37);
      v44 = v43;
      v46 = v45;
      v48 = v47;
      v71.origin.x = PDFRectToCGRect(v49);
      v71.origin.y = v50;
      v71.size.width = v51;
      v71.size.height = v52;
      v70.origin.x = v42;
      v70.origin.y = v44;
      v70.size.width = v46;
      v70.size.height = v48;
      if (!CGRectIntersectsRect(v70, v71))
      {
        LOBYTE(v55) = 0;
        v56 = v24 == 0;
        goto LABEL_37;
      }
      if (v65 == 2)
      {
        v57 = objc_msgSend(v66, "displaysAsBook");
        objc_msgSend(v66, "currentPage");
        v58 = objc_claimAutoreleasedReturnValue();
        v53 = (void *)v58;
        if (v18 || !v57)
        {
          objc_msgSend(v64, "facingPageForPage:", v58);
          v59 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v66, "currentPage");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v60 == v25 || v59 == (_QWORD)v25;

          v53 = (void *)v59;
          goto LABEL_28;
        }
        v54 = v58 == (_QWORD)v25;
      }
      else
      {
        if (v65)
        {
          v55 = 1;
          goto LABEL_29;
        }
        objc_msgSend(v66, "currentPage");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53 == v25;
      }
      v55 = v54;
LABEL_28:

LABEL_29:
      v56 = v24 == 0;
      if (v24 && v55)
      {
        objc_msgSend(v24, "setFrame:", v39, v41, v34, v36);
        -[PDFDocumentView _updateVisibilityDelegateForVisiblePageView:atIndex:](self, "_updateVisibilityDelegateForVisiblePageView:atIndex:", v24, v18);
LABEL_40:

        goto LABEL_41;
      }
      if (v24)
        v62 = 0;
      else
        v62 = v55;
      if (v62)
      {
        -[PDFDocumentView createPageViewForPageAtIndex:withFrame:](self, "createPageViewForPageAtIndex:withFrame:", v18, v39, v41, v34, v36);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
LABEL_37:
      if (!v56 && !v55)
        -[PDFDocumentView removePageViewForPageAtIndex:](self, "removePageViewForPageAtIndex:", v18);
      goto LABEL_40;
    }
LABEL_42:
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    v63 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
    if ((objc_msgSend(v63, "isUsingPDFExtensionView") & 1) != 0)
      objc_msgSend(v66, "syncPageIndexToScrollView");

    WeakRetained = v66;
  }

}

- (void)previewRotateShiftPages:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_private->pageViews, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "frame");
        objc_msgSend(v9, "setFrame:", v10 + a3);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)willForceUpdate
{
  -[PDFPageBackgroundManager willForceUpdate](self->_private->pageBackgroundManager, "willForceUpdate");
}

- (void)forceUpdateActivePageIndex:(unint64_t)a3 withMaxDuration:(double)a4
{
  -[PDFDocumentView updateVisibility](self, "updateVisibility");
  -[PDFPageBackgroundManager forceUpdateActivePageIndex:withMaxDuration:](self->_private->pageBackgroundManager, "forceUpdateActivePageIndex:withMaxDuration:", a3, a4);
}

- (id)pageBackgroundManager
{
  return self->_private->pageBackgroundManager;
}

- (id)_createPageView:(id)a3
{
  PDFView **p_pdfView;
  id v5;
  id WeakRetained;
  PDFPageView *v7;
  id v8;
  PDFPageView *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v14;

  p_pdfView = &self->_private->pdfView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pdfView);
  v7 = [PDFPageView alloc];
  v8 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
  v9 = -[PDFPageView initWithPage:geometryInterface:andRenderingProperties:](v7, "initWithPage:geometryInterface:andRenderingProperties:", v5, WeakRetained, v8);

  -[PDFDocumentView document](self, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexForPage:", v5);

  v14 = 0;
  -[PDFPageBackgroundManager backgroundImageForPageIndex:withFoundQuality:](self->_private->pageBackgroundManager, "backgroundImageForPageIndex:withFoundQuality:", v11, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    -[PDFPageView setBackgroundImage:atBackgroundQuality:](v9, "setBackgroundImage:atBackgroundQuality:", v12, v14);

  return v9;
}

- (void)willInsertPage:(id)a3 atIndex:(unint64_t)a4
{
  -[PDFDocumentView _removePageOverlaysStartingAtIndex:](self, "_removePageOverlaysStartingAtIndex:", a4);
}

- (void)didInsertPage:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *pageViews;
  void *v9;
  void *v10;
  id WeakRetained;

  v6 = a3;
  -[PDFDocumentView _shiftPagesAtIndex:downwards:](self, "_shiftPagesAtIndex:downwards:", a4, 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(v6, "setView:", WeakRetained);
  -[PDFDocumentView _createPageView:](self, "_createPageView:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 0, v7, a4);
  -[PDFDocumentView addSubview:](self, "addSubview:", v7);
  pageViews = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](pageViews, "setObject:forKey:", v7, v9);

  -[PDFPageBackgroundManager didInsertPageAtIndex:](self->_private->pageBackgroundManager, "didInsertPageAtIndex:", a4);
  objc_msgSend(WeakRetained, "PDFLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateInternalDocumentGeometry");
  -[PDFDocumentView layoutDocumentView](self, "layoutDocumentView");
  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 1, v7, a4);
  -[PDFDocumentView _reAddPageOverlaysStartingAtIndex:](self, "_reAddPageOverlaysStartingAtIndex:", a4 + 1);
  -[PDFDocumentView updateVisibility](self, "updateVisibility");

}

- (void)willRemovePage:(id)a3 atIndex:(unint64_t)a4
{
  NSMutableDictionary *pageViews;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  id v10;

  -[PDFDocumentView _removePageOverlaysStartingAtIndex:](self, "_removePageOverlaysStartingAtIndex:", a4 + 1);
  pageViews = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pageViews, "objectForKey:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v10, "visibilityDelegateIndex");
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 2, v10, v8);

}

- (void)didRemovePage:(id)a3 atIndex:(unint64_t)a4
{
  NSMutableDictionary *pageViews;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  void *v10;
  id WeakRetained;
  id v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "setView:", 0);
  pageViews = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pageViews, "objectForKey:", v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v14, "visibilityDelegateIndex");
  v9 = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);

  objc_msgSend(v14, "removeFromSuperview");
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 3, v14, v8);

  -[PDFDocumentView _shiftPagesAtIndex:downwards:](self, "_shiftPagesAtIndex:downwards:", a4 + 1, 0);
  -[PDFPageBackgroundManager didRemovePageAtIndex:](self->_private->pageBackgroundManager, "didRemovePageAtIndex:", a4);
  v12 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(v12, "PDFLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidateInternalDocumentGeometry");
  -[PDFDocumentView layoutDocumentView](self, "layoutDocumentView");
  -[PDFDocumentView _reAddPageOverlaysStartingAtIndex:](self, "_reAddPageOverlaysStartingAtIndex:", a4);
  -[PDFDocumentView updateVisibility](self, "updateVisibility");

}

- (void)willSwapPage:(id)a3 atIndex:(unint64_t)a4 forPage:(id)a5 atIndex:(unint64_t)a6
{
  NSMutableDictionary *pageViews;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id WeakRetained;
  id v16;

  pageViews = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pageViews, "objectForKey:", v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v10 = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v16, "visibilityDelegateIndex");
  v14 = objc_msgSend(v12, "visibilityDelegateIndex");
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 2, v16, v13);
  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 3, v16, v13);
  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 2, v12, v14);
  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 3, v12, v14);

}

- (void)didSwapPage:(id)a3 atIndex:(unint64_t)a4 forPage:(id)a5 atIndex:(unint64_t)a6
{
  NSMutableDictionary *pageViews;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  id v24;

  pageViews = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pageViews, "objectForKey:", v10);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  v11 = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 0, v24, a6);
  objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 0, v13, a4);
  v15 = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v16);

  v17 = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v18);

  if (v24)
  {
    v19 = self->_private->pageViews;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v24, v20);

  }
  if (v13)
  {
    v21 = self->_private->pageViews;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v13, v22);

  }
  -[PDFPageBackgroundManager didSwapPageAtIndex:withIndex:](self->_private->pageBackgroundManager, "didSwapPageAtIndex:withIndex:", a4, a6);
  objc_msgSend(WeakRetained, "PDFLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "invalidateInternalDocumentGeometry");
  -[PDFDocumentView layoutDocumentView](self, "layoutDocumentView");
  if (v24)
    objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 1, v24, a6);
  if (v13)
    objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 1, v13, a4);
  -[PDFDocumentView updateVisibility](self, "updateVisibility");

}

- (void)_shiftPagesAtIndex:(unint64_t)a3 downwards:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableDictionary *pageViews;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  _BOOL4 v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v26 = a4;
  v38 = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[NSMutableDictionary allKeys](self->_private->pageViews, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v12, "unsignedIntegerValue") >= a3)
        {
          -[NSMutableDictionary objectForKey:](self->_private->pageViews, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v13, v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v9);
  }

  pageViews = self->_private->pageViews;
  objc_msgSend(v6, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](pageViews, "removeObjectsForKeys:", v15);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    if (v26)
      v19 = 1;
    else
      v19 = -1;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        v22 = objc_msgSend(v21, "unsignedIntegerValue") + v19;
        objc_msgSend(v6, "objectForKey:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = self->_private->pageViews;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v23, v25);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v17);
  }

}

- (void)_removePageOverlaysStartingAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_private->pageViews, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        if (objc_msgSend(v10, "unsignedIntegerValue") >= a3)
        {
          -[NSMutableDictionary objectForKey:](self->_private->pageViews, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "visibilityDelegateIndex");
          WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
          objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 2, v11, v12);
          objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 3, v11, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)_reAddPageOverlaysStartingAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id WeakRetained;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allKeys](self->_private->pageViews, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "unsignedIntegerValue");
        if (v11 >= a3)
        {
          v12 = v11;
          -[NSMutableDictionary objectForKey:](self->_private->pageViews, "objectForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
          objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 0, v13, v12);
          objc_msgSend(WeakRetained, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 1, v13, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)_updateVisibilityDelegateForVisiblePageView:(id)a3 atIndex:(unint64_t)a4
{
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_msgSend(v11, "visibilityDelegateIndex");
      v10 = v9;
      if (v9 == 0x7FFFFFFFFFFFFFFFLL || v9 != a4)
      {
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v7, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 2, v11, v9);
          objc_msgSend(v7, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 3, v11, v10);
        }
        objc_msgSend(v7, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 0, v11, a4);
        objc_msgSend(v7, "callPageVisibilityDelegateMethod:forPageView:atPageIndex:", 1, v11, a4);
      }
    }
  }

}

- (void)changedBoundsForBoxNotification:(id)a3
{
  if (!self->_private->ignoreChangedBoundsForBoxNotification)
    -[PDFDocumentView updateVisibility](self, "updateVisibility", a3);
}

- (void)didRotatePageNotification:(id)a3
{
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__PDFDocumentView_didRotatePageNotification___block_invoke;
  block[3] = &unk_24C25CD18;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__PDFDocumentView_didRotatePageNotification___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_loadWeakRetained((id *)(WeakRetained[63] + 8));
    objc_msgSend(v3, "PDFLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "invalidateInternalDocumentGeometry");
    objc_msgSend(*(id *)(a1 + 32), "layoutDocumentView");

    WeakRetained = v5;
  }

}

- (id)backgroundImageForPage:(id)a3 withQuality:(int *)a4
{
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *pageViews;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = self->_private->pageViews;
  objc_sync_enter(v7);
  -[PDFDocumentView document](self, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexForPage:", v6);

  pageViews = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pageViews, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && objc_msgSend(v12, "hasBackgroundImage"))
  {
    *a4 = objc_msgSend(v12, "backgroundImageQuality");
    objc_msgSend(v12, "backgroundImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  objc_sync_exit(v7);
  return v13;
}

- (void)recieveBackgroundImage:(id)a3 atBackgroundQuality:(int)a4 forPage:(id)a5
{
  uint64_t v6;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *pageViews;
  void *v13;
  void *v14;
  id v15;

  v6 = *(_QWORD *)&a4;
  v15 = a3;
  v8 = a5;
  v9 = self->_private->pageViews;
  objc_sync_enter(v9);
  -[PDFDocumentView document](self, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexForPage:", v8);

  pageViews = self->_private->pageViews;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pageViews, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v14, "setBackgroundImage:atBackgroundQuality:", v15, v6);

  objc_sync_exit(v9);
}

- (id)pdfView
{
  PDFDocumentViewPrivate *v2;
  id WeakRetained;

  v2 = self->_private;
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)&v2->pdfView);
  else
    WeakRetained = 0;
  return WeakRetained;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id WeakRetained;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  PDFAnnotationPointerTrackingView *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  objc_super v32;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PDFDocumentView;
  -[PDFDocumentView hitTest:withEvent:](&v32, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v10 = objc_loadWeakRetained((id *)&self->_private->pointerTrackingView);
  if (objc_msgSend(v7, "type") == 11)
  {
    -[PDFDocumentView convertPoint:toView:](self, "convertPoint:toView:", WeakRetained, x, y);
    v12 = v11;
    v14 = v13;
    objc_msgSend(WeakRetained, "pageForPoint:nearest:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "convertPoint:toPage:", v15, v12, v14);
    v17 = v16;
    v19 = v18;
    objc_msgSend(v15, "annotationAtPoint:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20
      || (objc_msgSend(v15, "scannedAnnotationAtPoint:", v17, v19),
          (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v10, "annotation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 != v21)
      {
        objc_msgSend(v10, "removeFromSuperview");
        objc_msgSend(v20, "bounds");
        objc_msgSend(WeakRetained, "convertRect:fromPage:", v15);
        objc_msgSend(WeakRetained, "convertRect:toView:", self);
        v26 = -[PDFAnnotationPointerTrackingView initWithFrame:annotation:]([PDFAnnotationPointerTrackingView alloc], "initWithFrame:annotation:", v20, v22, v23, v24, v25);

        -[PDFDocumentView addSubview:](self, "addSubview:", v26);
        objc_storeWeak((id *)&self->_private->pointerTrackingView, v26);
        v10 = v26;
      }
    }

  }
  else
  {
    objc_msgSend(v10, "removeFromSuperview");
  }
  if ((objc_msgSend(WeakRetained, "isInMarkupMode") & 1) != 0
    || (objc_msgSend(WeakRetained, "isFormDetectionEnabled") & 1) != 0)
  {
    objc_msgSend(WeakRetained, "hitTestForSubviewsOfView:atLocation:withEvent:", self, v7, x, y);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = (void *)v27;
    else
      v29 = v8;
    v30 = v29;

  }
  else
  {
    v30 = v8;
  }

  return v30;
}

- (CGVector)_scaleFromLayerTransforms
{
  id WeakRetained;
  id v4;
  int v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGVector result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  v4 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
  v5 = objc_msgSend(v4, "isUsingPDFExtensionView");

  if (v5)
  {
    objc_msgSend(WeakRetained, "extensionViewZoomScale");
    v7 = v6;
  }
  else
  {
    objc_msgSend(WeakRetained, "documentScrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "zoomScale");
    v7 = v9;

  }
  v10 = v7;
  v11 = v7;
  result.dy = v11;
  result.dx = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
