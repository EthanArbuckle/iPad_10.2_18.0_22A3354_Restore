@implementation _SSSPDFPageMiniMapView

- (_SSSPDFPageMiniMapView)initWithFrame:(CGRect)a3
{
  _SSSPDFPageMiniMapView *v3;
  UIImageView *v4;
  UIImageView *pageImageView;
  _SSSPDFPageMiniMapVisibleRegionView *v6;
  _SSSPDFPageMiniMapVisibleRegionView *visibleRegionView;
  UIView *v8;
  UIView *scaledScrollViewVisibleRectView;
  UIPanGestureRecognizer *v10;
  UIPanGestureRecognizer *panGestureRecognizer;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_SSSPDFPageMiniMapView;
  v3 = -[_SSSPDFPageMiniMapView initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  pageImageView = v3->_pageImageView;
  v3->_pageImageView = v4;

  -[UIImageView setUserInteractionEnabled:](v3->_pageImageView, "setUserInteractionEnabled:", 0);
  -[_SSSPDFPageMiniMapView addSubview:](v3, "addSubview:", v3->_pageImageView);
  v6 = objc_alloc_init(_SSSPDFPageMiniMapVisibleRegionView);
  visibleRegionView = v3->_visibleRegionView;
  v3->_visibleRegionView = v6;

  -[_SSSPDFPageMiniMapVisibleRegionView setUserInteractionEnabled:](v3->_visibleRegionView, "setUserInteractionEnabled:", 0);
  -[_SSSPDFPageMiniMapView addSubview:](v3, "addSubview:", v3->_visibleRegionView);
  v8 = (UIView *)objc_alloc_init((Class)UIView);
  scaledScrollViewVisibleRectView = v3->_scaledScrollViewVisibleRectView;
  v3->_scaledScrollViewVisibleRectView = v8;

  -[_SSSPDFPageMiniMapView addSubview:](v3, "addSubview:", v3->_scaledScrollViewVisibleRectView);
  v10 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", v3, "userDidPanSelectionRect:");
  panGestureRecognizer = v3->_panGestureRecognizer;
  v3->_panGestureRecognizer = v10;

  -[UIView addGestureRecognizer:](v3->_scaledScrollViewVisibleRectView, "addGestureRecognizer:", v3->_panGestureRecognizer);
  return v3;
}

- (void)dealloc
{
  id updatePageImageBlock;
  id v4;
  objc_super v5;

  updatePageImageBlock = self->_updatePageImageBlock;
  if (updatePageImageBlock)
  {
    dispatch_block_cancel(updatePageImageBlock);
    v4 = self->_updatePageImageBlock;
    self->_updatePageImageBlock = 0;

  }
  -[_SSSPDFPageMiniMapView _removePDFNotifications](self, "_removePDFNotifications");
  v5.receiver = self;
  v5.super_class = (Class)_SSSPDFPageMiniMapView;
  -[_SSSPDFPageMiniMapView dealloc](&v5, "dealloc");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
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
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)_SSSPDFPageMiniMapView;
  -[_SSSPDFPageMiniMapView layoutSubviews](&v20, "layoutSubviews");
  -[_SSSPDFPageMiniMapView bounds](self, "bounds");
  v22 = CGRectInset(v21, 10.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pageImageForSize:](self, "pageImageForSize:", v22.size.width, v22.size.height));
  objc_msgSend(v3, "size");
  v5 = v4;
  objc_msgSend(v3, "size");
  v7 = v6;
  v8 = -[_SSSPDFPageMiniMapView bounds](self, "bounds");
  v13 = UIRectCenteredIntegralRectScale(v8, 0.0, 0.0, v5, v7, v9, v10, v11, v12, 0.0);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UIImageView setFrame:](self->_pageImageView, "setFrame:");
  -[UIImageView setImage:](self->_pageImageView, "setImage:", v3);
  -[_SSSPDFPageMiniMapVisibleRegionView setFrame:](self->_visibleRegionView, "setFrame:", v13, v15, v17, v19);
  if (-[_SSSPDFPageMiniMapView isDraggingVisibleRect](self, "isDraggingVisibleRect"))
    -[_SSSPDFPageMiniMapView updatePDFViewFromVisibleRegionView](self, "updatePDFViewFromVisibleRegionView");
  else
    -[_SSSPDFPageMiniMapView updateVisibleRegionViewFromPDFView](self, "updateVisibleRegionViewFromPDFView");

}

- (void)setPdfView:(id)a3
{
  PDFView *v5;
  PDFView *v6;

  v5 = (PDFView *)a3;
  if (self->_pdfView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pdfView, a3);
    -[_SSSPDFPageMiniMapView _setupPDFNotificationsIfPossible](self, "_setupPDFNotificationsIfPossible");
    -[_SSSPDFPageMiniMapView setNeedsPageImageUpdate](self, "setNeedsPageImageUpdate");
    -[_SSSPDFPageMiniMapView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setShouldUpdate:(BOOL)a3
{
  if (self->_shouldUpdate != a3)
  {
    self->_shouldUpdate = a3;
    -[_SSSPDFPageMiniMapView _setupPDFNotificationsIfPossible](self, "_setupPDFNotificationsIfPossible");
    -[_SSSPDFPageMiniMapView setNeedsPageImageUpdate](self, "setNeedsPageImageUpdate");
    -[_SSSPDFPageMiniMapView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setupPDFNotificationsIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[_SSSPDFPageMiniMapView _removePDFNotifications](self, "_removePDFNotifications");
  if (self->_pdfView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView documentScrollView](self->_pdfView, "documentScrollView"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "visibleRegionRectDidChange", CFSTR("PDFScrollViewPageMayHaveChangedNotification"), v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "annotationsDidChange", PDFViewAnnotationsDidChangeNotification, self->_pdfView);

    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = PDFPageChangedBoundsForBoxNotification;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pdfPage](self, "pdfPage"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "setNeedsPageImageUpdate", v6, v7);

  }
}

- (void)_removePDFNotifications
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PDFScrollViewPageMayHaveChangedNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, PDFViewAnnotationsDidChangeNotification, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, PDFPageChangedBoundsForBoxNotification, 0);

}

- (void)setPageIndex:(int64_t)a3
{
  if (self->_pageIndex != a3)
  {
    self->_pageIndex = a3;
    -[_SSSPDFPageMiniMapView setNeedsPageImageUpdate](self, "setNeedsPageImageUpdate");
    -[_SSSPDFPageMiniMapView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setScrollViewVisibleRectInPDFView:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_scrollViewVisibleRectInPDFView;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_scrollViewVisibleRectInPDFView = &self->_scrollViewVisibleRectInPDFView;
  if (!CGRectEqualToRect(self->_scrollViewVisibleRectInPDFView, a3))
  {
    p_scrollViewVisibleRectInPDFView->origin.x = x;
    p_scrollViewVisibleRectInPDFView->origin.y = y;
    p_scrollViewVisibleRectInPDFView->size.width = width;
    p_scrollViewVisibleRectInPDFView->size.height = height;
    -[_SSSPDFPageMiniMapView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNeedsPageImageUpdate
{
  UIImage *lastPageImage;

  lastPageImage = self->_lastPageImage;
  self->_lastPageImage = 0;

  -[_SSSPDFPageMiniMapView setNeedsLayout](self, "setNeedsLayout");
}

- (id)pdfPage
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView document](self->_pdfView, "document"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pageAtIndex:", self->_pageIndex));

  return v4;
}

- (id)pageView
{
  PDFView *pdfView;
  void *v3;
  void *v4;

  pdfView = self->_pdfView;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pdfPage](self, "pdfPage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView viewForPage:](pdfView, "viewForPage:", v3));

  return v4;
}

- (id)pageImageForSize:(CGSize)a3
{
  double height;
  double width;
  UIImage *v6;
  double v7;
  UIImage *lastPageImage;
  BOOL v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  UIImage *v19;
  UIImage *v20;
  CGAffineTransform v22;

  height = a3.height;
  width = a3.width;
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pdfPage](self, "pdfPage"));
  if (v6)
  {
    v7 = CGSizeZero.height;

    if (width == CGSizeZero.width && height == v7)
    {
      v6 = 0;
    }
    else
    {
      lastPageImage = self->_lastPageImage;
      if (!lastPageImage
        || (width == self->_lastRequestedImageSize.width
          ? (v10 = height == self->_lastRequestedImageSize.height)
          : (v10 = 0),
            !v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v11, "scale");
        v13 = v12;

        CGAffineTransformMakeScale(&v22, v13, v13);
        v14 = height * v22.c + v22.a * width;
        v15 = height * v22.d + v22.b * width;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pdfPage](self, "pdfPage"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "thumbnailOfSize:forBox:", 1, v14, v15));

        v18 = objc_retainAutorelease(v17);
        v19 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v18, "CGImage"), objc_msgSend(v18, "imageOrientation"), v13));
        v20 = self->_lastPageImage;
        self->_lastPageImage = v19;

        self->_lastRequestedImageSize.width = width;
        self->_lastRequestedImageSize.height = height;

        lastPageImage = self->_lastPageImage;
      }
      v6 = lastPageImage;
    }
  }
  return v6;
}

- (void)visibleRegionRectDidChange
{
  if (!-[_SSSPDFPageMiniMapView isDraggingVisibleRect](self, "isDraggingVisibleRect"))
    -[_SSSPDFPageMiniMapView setNeedsLayout](self, "setNeedsLayout");
}

- (void)annotationsDidChange
{
  id updatePageImageBlock;
  id v4;
  dispatch_block_t v5;
  id v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  id location;

  updatePageImageBlock = self->_updatePageImageBlock;
  if (updatePageImageBlock)
  {
    dispatch_block_cancel(updatePageImageBlock);
    v4 = self->_updatePageImageBlock;
    self->_updatePageImageBlock = 0;

  }
  if (self->_lastPageImage)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100029CA0;
    v8[3] = &unk_100091AD0;
    objc_copyWeak(&v9, &location);
    v5 = dispatch_block_create((dispatch_block_flags_t)0, v8);
    v6 = self->_updatePageImageBlock;
    self->_updatePageImageBlock = v5;

    v7 = dispatch_time(0, 500000000);
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, self->_updatePageImageBlock);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    -[_SSSPDFPageMiniMapView setNeedsPageImageUpdate](self, "setNeedsPageImageUpdate");
  }
}

- (void)updateVisibleRegionViewFromPDFView
{
  void *v3;
  void *v4;
  void *v5;
  double x;
  double y;
  double width;
  double height;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
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
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _SSSScrollViewLayoutRects *v34;
  void *v35;
  void *v36;
  _SSSScrollViewLayoutRects *v37;
  _SSSScrollViewLayoutRects *scaledScrollViewLayoutRectsInSelf;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  UIView *scaledScrollViewVisibleRectView;
  _OWORD v52[3];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView documentScrollView](self->_pdfView, "documentScrollView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForZoomingInScrollView:", v3));

  x = self->_scrollViewVisibleRectInPDFView.origin.x;
  y = self->_scrollViewVisibleRectInPDFView.origin.y;
  width = self->_scrollViewVisibleRectInPDFView.size.width;
  height = self->_scrollViewVisibleRectInPDFView.size.height;
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  if (CGRectIsEmpty(v56))
  {
    objc_msgSend(v3, "bounds");
    objc_msgSend(v3, "convertRect:toView:", self->_pdfView);
    x = v11;
    y = v12;
    width = v13;
    height = v14;
  }
  v54 = 0u;
  v55 = 0u;
  v53 = 0u;
  *(_QWORD *)&v15 = objc_opt_class(self, v10).n128_u64[0];
  v17 = v16;
  -[UIImageView bounds](self->_pageImageView, "bounds", v15);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v5, "bounds");
  if (v17)
  {
    objc_msgSend(v17, "_transformToConvertToRect:fromRect:", v19, v21, v23, v25, v26, v27, v28, v29);
  }
  else
  {
    v54 = 0u;
    v55 = 0u;
    v53 = 0u;
  }
  -[PDFView convertRect:toView:](self->_pdfView, "convertRect:toView:", v3, x, y, width, height);
  v34 = -[_SSSScrollViewLayoutRects initWithScrollView:visibleRectInScrollView:]([_SSSScrollViewLayoutRects alloc], "initWithScrollView:visibleRectInScrollView:", v3, v30, v31, v32, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScrollViewLayoutRects layoutRectsByConvertingFromView:toView:](v34, "layoutRectsByConvertingFromView:toView:", v3, v5));
  v52[0] = v53;
  v52[1] = v54;
  v52[2] = v55;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "layoutRectsByApplyingTransform:", v52));
  v37 = (_SSSScrollViewLayoutRects *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layoutRectsByConvertingFromView:toView:", self->_pageImageView, self));
  scaledScrollViewLayoutRectsInSelf = self->_scaledScrollViewLayoutRectsInSelf;
  self->_scaledScrollViewLayoutRectsInSelf = v37;

  -[_SSSScrollViewLayoutRects visibleRect](self->_scaledScrollViewLayoutRectsInSelf, "visibleRect");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[_SSSPDFPageMiniMapVisibleRegionView frame](self->_visibleRegionView, "frame");
  v59.origin.x = v47;
  v59.origin.y = v48;
  v59.size.width = v49;
  v59.size.height = v50;
  v57.origin.x = v40;
  v57.origin.y = v42;
  v57.size.width = v44;
  v57.size.height = v46;
  v58 = CGRectIntersection(v57, v59);
  -[_SSSPDFPageMiniMapView convertRect:toView:](self, "convertRect:toView:", self->_visibleRegionView, v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
  -[_SSSPDFPageMiniMapVisibleRegionView setVisibleRect:](self->_visibleRegionView, "setVisibleRect:");
  scaledScrollViewVisibleRectView = self->_scaledScrollViewVisibleRectView;
  -[_SSSScrollViewLayoutRects visibleRect](self->_scaledScrollViewLayoutRectsInSelf, "visibleRect");
  -[UIView setFrame:](scaledScrollViewVisibleRectView, "setFrame:");

}

- (void)updatePDFViewFromVisibleRegionView
{
  void *v3;
  void *v4;
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
  double v22;
  id v23;

  +[UIAnimator disableAnimation](UIAnimator, "disableAnimation");
  v23 = (id)objc_claimAutoreleasedReturnValue(-[PDFView documentScrollView](self->_pdfView, "documentScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForZoomingInScrollView:", v23));

  -[_SSSScrollViewLayoutRects scrollViewRect](self->_inFlightScaledScrollViewLayoutRectsInSelf, "scrollViewRect");
  -[_SSSPDFPageMiniMapView convertRect:toView:](self, "convertRect:toView:", self->_visibleRegionView);
  -[_SSSPDFPageMiniMapView convertRectToPageViewSpace:fromView:](self, "convertRectToPageViewSpace:fromView:", self->_visibleRegionView);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pageView](self, "pageView"));
  objc_msgSend(v4, "convertRect:fromView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  objc_msgSend(v23, "zoomScale");
  objc_msgSend(v23, "setZoomScale:", v22 + 0.00000011920929);
  objc_msgSend(v23, "zoomToRect:animated:", 0, v15, v17, v19, v21);
  +[UIAnimator enableAnimation](UIAnimator, "enableAnimation");

}

- (BOOL)isDraggingVisibleRect
{
  return (uint64_t)-[UIPanGestureRecognizer state](self->_panGestureRecognizer, "state") >= 1
      && (uint64_t)-[UIPanGestureRecognizer state](self->_panGestureRecognizer, "state") < 3;
}

+ (double)adjustedTranslationForProposedRect:(CGFloat)a3 originalRect:(CGFloat)a4 scaledContentViewBounds:(double)a5
{
  double Width;
  double v21;
  double MinX;
  double v23;
  double MaxX;
  double v25;
  double Height;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  Width = CGRectGetWidth(*(CGRect *)&a1);
  v30.origin.x = a9;
  v30.origin.y = a10;
  v30.size.width = a11;
  v30.size.height = a12;
  v21 = a5;
  if (Width < CGRectGetWidth(v30))
  {
    v31.origin.x = a1;
    v31.origin.y = a2;
    v31.size.width = a3;
    v31.size.height = a4;
    MinX = CGRectGetMinX(v31);
    v32.origin.x = a9;
    v32.origin.y = a10;
    v32.size.width = a11;
    v32.size.height = a12;
    v23 = CGRectGetMinX(v32);
    if (MinX < v23)
      MinX = v23;
    v33.origin.x = a9;
    v33.origin.y = a10;
    v33.size.width = a11;
    v33.size.height = a12;
    MaxX = CGRectGetMaxX(v33);
    v34.origin.x = a1;
    v34.origin.y = a2;
    v34.size.width = a3;
    v34.size.height = a4;
    v25 = MaxX - CGRectGetWidth(v34);
    if (MinX >= v25)
      v21 = v25;
    else
      v21 = MinX;
  }
  v35.origin.x = a1;
  v35.origin.y = a2;
  v35.size.width = a3;
  v35.size.height = a4;
  Height = CGRectGetHeight(v35);
  v36.origin.x = a9;
  v36.origin.y = a10;
  v36.size.width = a11;
  v36.size.height = a12;
  if (Height < CGRectGetHeight(v36))
  {
    v37.origin.x = a1;
    v37.origin.y = a2;
    v37.size.width = a3;
    v37.size.height = a4;
    CGRectGetMinY(v37);
    v38.origin.x = a9;
    v38.origin.y = a10;
    v38.size.width = a11;
    v38.size.height = a12;
    CGRectGetMinY(v38);
    v39.origin.x = a9;
    v39.origin.y = a10;
    v39.size.width = a11;
    v39.size.height = a12;
    CGRectGetMaxY(v39);
    v40.origin.x = a1;
    v40.origin.y = a2;
    v40.size.width = a3;
    v40.size.height = a4;
    CGRectGetHeight(v40);
  }
  return v21 - a5;
}

- (void)userDidPanSelectionRect:(id)a3
{
  id v4;
  id v5;
  _SSSScrollViewLayoutRects *scaledScrollViewLayoutRectsInSelf;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
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
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _SSSScrollViewLayoutRects *v34;
  CGFloat v35;
  CGFloat v36;
  _SSSScrollViewLayoutRects *v37;
  _SSSScrollViewLayoutRects *inFlightScaledScrollViewLayoutRectsInSelf;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  UIView *scaledScrollViewVisibleRectView;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if (v5 == (id)3)
  {
    objc_storeStrong((id *)&self->_scaledScrollViewLayoutRectsInSelf, self->_inFlightScaledScrollViewLayoutRectsInSelf);
  }
  else if (v5 == (id)2)
  {
    objc_msgSend(v4, "translationInView:", self);
    scaledScrollViewLayoutRectsInSelf = self->_scaledScrollViewLayoutRectsInSelf;
    CGAffineTransformMakeTranslation(&v53, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScrollViewLayoutRects layoutRectsByApplyingTransform:](scaledScrollViewLayoutRectsInSelf, "layoutRectsByApplyingTransform:", &v53));
    *(_QWORD *)&v11 = objc_opt_class(self, v10).n128_u64[0];
    v13 = v12;
    objc_msgSend(v9, "contentInsetRect", v11);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[_SSSScrollViewLayoutRects contentInsetRect](self->_scaledScrollViewLayoutRectsInSelf, "contentInsetRect");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    -[_SSSPDFPageMiniMapVisibleRegionView frame](self->_visibleRegionView, "frame");
    objc_msgSend(v13, "adjustedTranslationForProposedRect:originalRect:scaledContentViewBounds:", v15, v17, v19, v21, v23, v25, v27, v29, v30, v31, v32, v33);
    v34 = self->_scaledScrollViewLayoutRectsInSelf;
    CGAffineTransformMakeTranslation(&v52, v35, v36);
    v37 = (_SSSScrollViewLayoutRects *)objc_claimAutoreleasedReturnValue(-[_SSSScrollViewLayoutRects layoutRectsByApplyingTransform:](v34, "layoutRectsByApplyingTransform:", &v52));
    inFlightScaledScrollViewLayoutRectsInSelf = self->_inFlightScaledScrollViewLayoutRectsInSelf;
    self->_inFlightScaledScrollViewLayoutRectsInSelf = v37;

    -[_SSSScrollViewLayoutRects visibleRect](self->_inFlightScaledScrollViewLayoutRectsInSelf, "visibleRect");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    -[_SSSPDFPageMiniMapVisibleRegionView frame](self->_visibleRegionView, "frame");
    v56.origin.x = v47;
    v56.origin.y = v48;
    v56.size.width = v49;
    v56.size.height = v50;
    v54.origin.x = v40;
    v54.origin.y = v42;
    v54.size.width = v44;
    v54.size.height = v46;
    v55 = CGRectIntersection(v54, v56);
    -[_SSSPDFPageMiniMapView convertRect:toView:](self, "convertRect:toView:", self->_visibleRegionView, v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
    -[_SSSPDFPageMiniMapVisibleRegionView setVisibleRect:](self->_visibleRegionView, "setVisibleRect:");
    scaledScrollViewVisibleRectView = self->_scaledScrollViewVisibleRectView;
    -[_SSSScrollViewLayoutRects visibleRect](self->_inFlightScaledScrollViewLayoutRectsInSelf, "visibleRect");
    -[UIView setFrame:](scaledScrollViewVisibleRectView, "setFrame:");
    -[_SSSPDFPageMiniMapView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (CGRect)visibleRectInPageViewSpace
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;
  CGRect v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pageView](self, "pageView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pageView](self, "pageView"));
    -[PDFView bounds](self->_pdfView, "bounds");
    objc_msgSend(v4, "convertRect:fromView:", self->_pdfView);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pageView](self, "pageView"));
    objc_msgSend(v13, "bounds");
    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    v23 = CGRectIntersection(v22, v25);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)convertRectFromPageViewSpace:(CGRect)a3 toView:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
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
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pageView](self, "pageView"));

  if (v9 && v10)
  {
    memset(&v37, 0, sizeof(v37));
    *(_QWORD *)&v12 = objc_opt_class(self, v11).n128_u64[0];
    v14 = v13;
    objc_msgSend(v9, "bounds", v12);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pageView](self, "pageView"));
    objc_msgSend(v23, "bounds");
    if (v14)
      objc_msgSend(v14, "_transformToConvertToRect:fromRect:", v16, v18, v20, v22, v24, v25, v26, v27);
    else
      memset(&v37, 0, sizeof(v37));

    v36 = v37;
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v39 = CGRectApplyAffineTransform(v38, &v36);
    v28 = v39.origin.x;
    v29 = v39.origin.y;
    v30 = v39.size.width;
    v31 = v39.size.height;
  }
  else
  {
    v28 = CGRectZero.origin.x;
    v29 = CGRectZero.origin.y;
    v30 = CGRectZero.size.width;
    v31 = CGRectZero.size.height;
  }

  v32 = v28;
  v33 = v29;
  v34 = v30;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGRect)convertRectToPageViewSpace:(CGRect)a3 fromView:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
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
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pageView](self, "pageView"));

  if (v9 && v10)
  {
    memset(&v37, 0, sizeof(v37));
    *(_QWORD *)&v12 = objc_opt_class(self, v11).n128_u64[0];
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSPDFPageMiniMapView pageView](self, "pageView", v12));
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v9, "bounds");
    if (v14)
      objc_msgSend(v14, "_transformToConvertToRect:fromRect:", v17, v19, v21, v23, v24, v25, v26, v27);
    else
      memset(&v37, 0, sizeof(v37));

    v36 = v37;
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v39 = CGRectApplyAffineTransform(v38, &v36);
    v28 = v39.origin.x;
    v29 = v39.origin.y;
    v30 = v39.size.width;
    v31 = v39.size.height;
  }
  else
  {
    v28 = CGRectZero.origin.x;
    v29 = CGRectZero.origin.y;
    v30 = CGRectZero.size.width;
    v31 = CGRectZero.size.height;
  }

  v32 = v28;
  v33 = v29;
  v34 = v30;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

+ (CGAffineTransform)_transformToConvertToRect:(SEL)a3 fromRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGAffineTransform *result;
  __int128 v15;
  double v16;
  double MinY;
  CGFloat v18;
  double MinX;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  result = (CGAffineTransform *)CGRectIsEmpty(a4);
  if ((result & 1) != 0)
    goto LABEL_5;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  result = (CGAffineTransform *)CGRectIsEmpty(v26);
  if ((result & 1) != 0)
    goto LABEL_5;
  v27.origin.x = v12;
  v27.origin.y = v11;
  v27.size.width = v10;
  v27.size.height = v9;
  result = (CGAffineTransform *)CGRectIsInfinite(v27);
  if ((result & 1) != 0
    || (v28.origin.x = x,
        v28.origin.y = y,
        v28.size.width = width,
        v28.size.height = height,
        result = (CGAffineTransform *)CGRectIsInfinite(v28),
        (_DWORD)result))
  {
LABEL_5:
    v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    v29.origin.x = v12;
    v29.origin.y = v11;
    v29.size.width = v10;
    v29.size.height = v9;
    v24 = CGRectGetWidth(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v25 = v24 / CGRectGetWidth(v30);
    v31.origin.x = v12;
    v31.origin.y = v11;
    v31.size.width = v10;
    v31.size.height = v9;
    v22 = CGRectGetHeight(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v23 = v22 / CGRectGetHeight(v32);
    v33.origin.x = v12;
    v33.origin.y = v11;
    v33.size.width = v10;
    v33.size.height = v9;
    v20 = CGRectGetWidth(v33);
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    MinX = CGRectGetMinX(v34);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v21 = CGRectGetMinX(v35) + v20 * MinX;
    v36.origin.x = v12;
    v36.origin.y = v11;
    v36.size.width = v10;
    v36.size.height = v9;
    v16 = CGRectGetHeight(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    MinY = CGRectGetMinY(v37);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v18 = CGRectGetMinY(v38);
    retstr->a = v25;
    retstr->b = 0.0;
    retstr->c = 0.0;
    retstr->d = v23;
    retstr->tx = v21;
    retstr->ty = v18 + v16 * MinY;
  }
  return result;
}

- (PDFView)pdfView
{
  return self->_pdfView;
}

- (int64_t)pageIndex
{
  return self->_pageIndex;
}

- (CGRect)scrollViewVisibleRectInPDFView
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scrollViewVisibleRectInPDFView.origin.x;
  y = self->_scrollViewVisibleRectInPDFView.origin.y;
  width = self->_scrollViewVisibleRectInPDFView.size.width;
  height = self->_scrollViewVisibleRectInPDFView.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)shouldUpdate
{
  return self->_shouldUpdate;
}

- (_SSSPDFPageMiniMapVisibleRegionView)visibleRegionView
{
  return self->_visibleRegionView;
}

- (void)setVisibleRegionView:(id)a3
{
  objc_storeStrong((id *)&self->_visibleRegionView, a3);
}

- (UIImageView)pageImageView
{
  return self->_pageImageView;
}

- (void)setPageImageView:(id)a3
{
  objc_storeStrong((id *)&self->_pageImageView, a3);
}

- (CGSize)lastRequestedImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastRequestedImageSize.width;
  height = self->_lastRequestedImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastRequestedImageSize:(CGSize)a3
{
  self->_lastRequestedImageSize = a3;
}

- (UIImage)lastPageImage
{
  return self->_lastPageImage;
}

- (void)setLastPageImage:(id)a3
{
  objc_storeStrong((id *)&self->_lastPageImage, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (_SSSScrollViewLayoutRects)scaledScrollViewLayoutRectsInSelf
{
  return self->_scaledScrollViewLayoutRectsInSelf;
}

- (void)setScaledScrollViewLayoutRectsInSelf:(id)a3
{
  objc_storeStrong((id *)&self->_scaledScrollViewLayoutRectsInSelf, a3);
}

- (_SSSScrollViewLayoutRects)inFlightScaledScrollViewLayoutRectsInSelf
{
  return self->_inFlightScaledScrollViewLayoutRectsInSelf;
}

- (void)setInFlightScaledScrollViewLayoutRectsInSelf:(id)a3
{
  objc_storeStrong((id *)&self->_inFlightScaledScrollViewLayoutRectsInSelf, a3);
}

- (UIView)scaledScrollViewVisibleRectView
{
  return self->_scaledScrollViewVisibleRectView;
}

- (void)setScaledScrollViewVisibleRectView:(id)a3
{
  objc_storeStrong((id *)&self->_scaledScrollViewVisibleRectView, a3);
}

- (CGRect)_lastSetScrollViewRectInContentViewSpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__lastSetScrollViewRectInContentViewSpace.origin.x;
  y = self->__lastSetScrollViewRectInContentViewSpace.origin.y;
  width = self->__lastSetScrollViewRectInContentViewSpace.size.width;
  height = self->__lastSetScrollViewRectInContentViewSpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)set_lastSetScrollViewRectInContentViewSpace:(CGRect)a3
{
  self->__lastSetScrollViewRectInContentViewSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaledScrollViewVisibleRectView, 0);
  objc_storeStrong((id *)&self->_inFlightScaledScrollViewLayoutRectsInSelf, 0);
  objc_storeStrong((id *)&self->_scaledScrollViewLayoutRectsInSelf, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_lastPageImage, 0);
  objc_storeStrong((id *)&self->_pageImageView, 0);
  objc_storeStrong((id *)&self->_visibleRegionView, 0);
  objc_storeStrong((id *)&self->_pdfView, 0);
  objc_storeStrong(&self->_updatePageImageBlock, 0);
}

@end
