@implementation PDFScrollView

- (PDFScrollView)initWithFrame:(CGRect)a3
{
  PDFScrollView *v3;
  PDFScrollViewPrivate *v4;
  PDFScrollViewPrivate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFScrollView;
  v3 = -[PDFScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PDFScrollViewPrivate);
    v5 = v3->_private;
    v3->_private = v4;

    v3->_private->forcesTopAlignment = 0;
  }
  return v3;
}

- (void)setPDFView:(id)a3
{
  objc_storeWeak((id *)&self->_private->pdfView, a3);
}

- (void)setDocument:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  PDFDocumentView *v7;
  id v8;
  PDFDocumentView *v9;
  PDFTimer *v10;
  PDFScrollViewPrivate *v11;
  PDFTimer *boundsUpdateTimer;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  objc_storeWeak((id *)&self->_private->document, v17);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "setDocument:", 0);
    objc_msgSend(v5, "removeFromSuperview");

    objc_storeWeak((id *)&self->_private->documentView, 0);
  }
  v6 = v17;
  if (v17)
  {
    v7 = [PDFDocumentView alloc];
    v8 = objc_loadWeakRetained((id *)&self->_private->pdfView);
    v9 = -[PDFDocumentView initWithPDFView:](v7, "initWithPDFView:", v8);

    objc_storeWeak((id *)&self->_private->documentView, v9);
    self->_private->oldMagnification = 1.0;
    v10 = -[PDFTimer initWithThrottleDelay:forSelector:forTarget:]([PDFTimer alloc], "initWithThrottleDelay:forSelector:forTarget:", sel_updateVisibility, v9, 0.25);
    v11 = self->_private;
    boundsUpdateTimer = v11->boundsUpdateTimer;
    v11->boundsUpdateTimer = v10;

    -[PDFTimer update](self->_private->boundsUpdateTimer, "update");
    -[PDFScrollView addSubview:](self, "addSubview:", v9);
    -[PDFDocumentView setDocument:](v9, "setDocument:", v17);
    -[PDFDocumentView layoutDocumentView](v9, "layoutDocumentView");
    -[PDFDocumentView documentViewSize](v9, "documentViewSize");
    -[PDFDocumentView setFrame:](v9, "setFrame:", 0.0, 0.0, v13, v14);
    -[PDFDocumentView frame](v9, "frame");
    -[PDFScrollView setContentSize:](self, "setContentSize:", v15, v16);
    -[PDFScrollView setDirectionalLockEnabled:](self, "setDirectionalLockEnabled:", 1);
    -[PDFScrollView setMinimumZoomScale:](self, "setMinimumZoomScale:", 0.25);
    -[PDFScrollView setMaximumZoomScale:](self, "setMaximumZoomScale:", 5.0);
    -[PDFScrollView setDelegate:](self, "setDelegate:", self);
    -[PDFScrollView setContentOffset:](self, "setContentOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    -[PDFScrollView centerAlign](self, "centerAlign");

    v6 = v17;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PDFScrollView;
  -[PDFScrollView dealloc](&v4, sel_dealloc);
}

- (id)pdfDocumentView
{
  return objc_loadWeakRetained((id *)&self->_private->documentView);
}

- (void)updateLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);
  objc_msgSend(WeakRetained, "layoutDocumentView");
  objc_msgSend(WeakRetained, "documentViewSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(WeakRetained, "setBounds:", 0.0, 0.0, v3, v5);
  objc_msgSend(WeakRetained, "setFrame:", 0.0, 0.0, v4, v6);
  objc_msgSend(WeakRetained, "frame");
  -[PDFScrollView setContentSize:](self, "setContentSize:", v7, v8);
  -[PDFScrollView setContentOffset:](self, "setContentOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[PDFScrollView centerAlign](self, "centerAlign");

}

- (void)setForcesTopAlignment:(BOOL)a3
{
  self->_private->forcesTopAlignment = a3;
}

- (void)setFrame:(CGRect)a3
{
  PDFScrollViewPrivate *v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDFScrollView;
  -[PDFScrollView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = self->_private;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v4->documentView);
    objc_msgSend(WeakRetained, "updateVisibility");

    -[PDFScrollView centerAlign](self, "centerAlign");
  }
}

- (void)setBounds:(CGRect)a3
{
  PDFScrollViewPrivate *v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDFScrollView;
  -[PDFScrollView setBounds:](&v6, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = self->_private;
  if (v4)
  {
    if (!v4->isZooming)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v4->documentView);
      objc_msgSend(WeakRetained, "updateVisibility");

    }
    -[PDFScrollView centerAlign](self, "centerAlign");
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  objc_super v32;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[PDFScrollView contentInset](self, "contentInset");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PDFScrollView contentOffset](self, "contentOffset");
  v30 = v17;
  v31 = v16;
  v32.receiver = self;
  v32.super_class = (Class)PDFScrollView;
  -[PDFScrollView setContentInset:](&v32, sel_setContentInset_, top, left, bottom, right);
  if (-[PDFScrollView contentInsetAdjustmentBehavior](self, "contentInsetAdjustmentBehavior") == 2
    && !PDFEdgeInsetsEqualToInsets(top, left, bottom, right, v9, v11, v13, v15))
  {
    if (v9 <= top)
      v18 = top;
    else
      v18 = v9;
    v19 = -1.0 - v18;
    -[PDFScrollView contentSize](self, "contentSize");
    v21 = v20;
    -[PDFScrollView bounds](self, "bounds");
    v23 = v13 + v21 - v22;
    v24 = bottom + v21 - v22;
    if (v23 >= v24)
      v25 = bottom + v21 - v22;
    else
      v25 = v13 + v21 - v22;
    if (v23 < v24)
      v23 = bottom + v21 - v22;
    if (v30 < v19)
      goto LABEL_15;
    v26 = -v9;
    v27 = -top;
    if (v9 > top)
      v26 = -top;
    if (v30 > v26 + 1.0)
    {
LABEL_15:
      v28 = v25 + -1.0;
      if (v30 > v23 + 1.0 || v30 < v28)
        v27 = v30;
      else
        v27 = v24;
    }
    if (!PDFPointEqualToPoint(v31, v27, v31, v30))
      -[PDFScrollView setContentOffset:](self, "setContentOffset:", v31, v27);
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return objc_loadWeakRetained((id *)&self->_private->documentView);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PDFScrollViewWillBeginDraggingNotification"), self);

}

- (void)scrollViewDidScroll:(id)a3
{
  PDFScrollViewPrivate *v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v4 = self->_private;
  if (!v4->isZooming)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v4->documentView);
    objc_msgSend(WeakRetained, "updateVisibility");

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("PDFScrollViewPageMayHaveChangedNotification"), self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuWillChangeScrollPosition"), self);

  -[PDFScrollView centerAlign](self, "centerAlign");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuDidChangeScrollPosition"), self);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuDidChangeScrollPosition"), self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PDFScrollViewPageMayHaveChangedNotification"), self);

  -[PDFScrollView centerAlign](self, "centerAlign");
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id WeakRetained;

  self->_private->isZooming = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);
  objc_msgSend(WeakRetained, "updateVisibility");

  -[PDFScrollView centerAlign](self, "centerAlign");
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;

  self->_private->isZooming = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);
  objc_msgSend(WeakRetained, "updateVisibility");

  -[PDFScrollView centerAlign](self, "centerAlign");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("PDFViewScaleChanged"), v8);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("PDFScrollViewPageMayHaveChangedNotification"), self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuDidChangeScrollPosition"), self);

}

- (void)scrollViewDidZoom:(id)a3
{
  PDFScrollViewPrivate *v4;
  uint64_t v5;
  PDFScrollViewPrivate *v6;
  NSDate *pageSyncDate;
  double v8;
  id WeakRetained;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self->_private;
  if (!v4->scheduledPageSync)
  {
    v4->scheduledPageSync = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = self->_private;
    pageSyncDate = v6->pageSyncDate;
    v6->pageSyncDate = (NSDate *)v5;

    v4 = self->_private;
  }
  -[NSDate timeIntervalSinceNow](v4->pageSyncDate, "timeIntervalSinceNow");
  if (fabs(v8) > 0.25)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);
    objc_msgSend(WeakRetained, "updateVisibility");

    self->_private->scheduledPageSync = 0;
  }
  -[PDFScrollView centerAlign](self, "centerAlign");
  v10 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  objc_msgSend(v10, "setAutoScales:", 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("PDFTextSelectionMenuWillChangeZoomFactor"), 0);

}

- (void)centerAlign
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MidX;
  PDFScrollViewPrivate *v16;
  id WeakRetained;
  uint64_t v18;
  double MidY;
  id v20;
  CGRect v21;
  CGRect v22;

  -[PDFScrollView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PDFScrollView contentSize](self, "contentSize");
  v12 = v11;
  v14 = v13;
  if (v11 <= v8)
  {
    if (-[PDFScrollView isDragging](self, "isDragging"))
    {
      MidX = v12 * 0.5 + fmax((v8 - v12) * 0.5, 0.0);
    }
    else
    {
      v21.origin.x = v4;
      v21.origin.y = v6;
      v21.size.width = v8;
      v21.size.height = v10;
      MidX = CGRectGetMidX(v21);
    }
  }
  else
  {
    MidX = v11 * 0.5;
  }
  v16 = self->_private;
  if (v16->forcesTopAlignment
    && (WeakRetained = objc_loadWeakRetained((id *)&v16->document),
        v18 = objc_msgSend(WeakRetained, "pageCount"),
        WeakRetained,
        v18)
    || v14 > v10)
  {
    MidY = v14 * 0.5;
  }
  else
  {
    v22.origin.x = v4;
    v22.origin.y = v6;
    v22.size.width = v8;
    v22.size.height = v10;
    MidY = CGRectGetMidY(v22);
  }
  v20 = objc_loadWeakRetained((id *)&self->_private->documentView);
  objc_msgSend(v20, "setCenter:", MidX, MidY);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
