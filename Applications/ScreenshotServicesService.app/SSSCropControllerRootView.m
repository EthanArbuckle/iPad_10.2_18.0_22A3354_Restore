@implementation SSSCropControllerRootView

- (SSSCropControllerRootView)initWithFrame:(CGRect)a3
{
  char *v3;
  SSSPassthroughView *v4;
  void *v5;
  SSSPassthroughView *v6;
  void *v7;
  SSSScrollView *v8;
  void *v9;
  CGSize size;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SSSCropControllerRootView;
  v3 = -[SSSCropControllerRootView initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v3, "setAutoresizesSubviews:", 0);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("Screenshots-Crop-Root-View"));
  *((_QWORD *)v3 + 37) = 0x3FF0000000000000;
  *((_QWORD *)v3 + 38) = 0x3FF0000000000000;
  *((_QWORD *)v3 + 39) = 0x3FF0000000000000;
  v4 = objc_alloc_init(SSSPassthroughView);
  v5 = (void *)*((_QWORD *)v3 + 7);
  *((_QWORD *)v3 + 7) = v4;

  objc_msgSend(*((id *)v3 + 7), "setClipsToBounds:", 1);
  objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 7));
  v6 = objc_alloc_init(SSSPassthroughView);
  v7 = (void *)*((_QWORD *)v3 + 8);
  *((_QWORD *)v3 + 8) = v6;

  objc_msgSend(*((id *)v3 + 8), "setClipsToBounds:", 1);
  v8 = objc_alloc_init(SSSScrollView);
  v9 = (void *)*((_QWORD *)v3 + 23);
  *((_QWORD *)v3 + 23) = v8;

  objc_msgSend(*((id *)v3 + 23), "_setZoomFeedbackGenerator:", 0);
  objc_msgSend(*((id *)v3 + 23), "setAutoresizesSubviews:", 0);
  objc_msgSend(*((id *)v3 + 23), "setBouncesZoom:", 0);
  objc_msgSend(*((id *)v3 + 23), "setBounces:", 0);
  objc_msgSend(*((id *)v3 + 23), "setScrollsToTop:", 0);
  objc_msgSend(*((id *)v3 + 23), "setAlwaysBounceVertical:", 0);
  objc_msgSend(*((id *)v3 + 23), "setAlwaysBounceHorizontal:", 0);
  objc_msgSend(*((id *)v3 + 23), "_setAutoScrollEnabled:", 0);
  objc_msgSend(*((id *)v3 + 23), "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(*((id *)v3 + 23), "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(*((id *)v3 + 23), "setDelegate:", v3);
  objc_msgSend(*((id *)v3 + 7), "addSubview:", *((_QWORD *)v3 + 23));
  *((_QWORD *)v3 + 2) = 0;
  *((_QWORD *)v3 + 3) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v3 + 2) = _Q0;
  *((_QWORD *)v3 + 43) = 0;
  *((_QWORD *)v3 + 44) = 0;
  *(_OWORD *)(v3 + 360) = _Q0;
  v3[273] = 0;
  size = CGRectNull.size;
  *((_OWORD *)v3 + 12) = CGRectNull.origin;
  *((CGSize *)v3 + 13) = size;
  return (SSSCropControllerRootView *)v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SSSScreenshotContainerView removeFromSuperview](self->_viewToCrop, "removeFromSuperview");
  -[SSSScrollView removeFromSuperview](self->_scrollView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)SSSCropControllerRootView;
  -[SSSCropControllerRootView dealloc](&v3, "dealloc");
}

- (void)prepareForFullscreenExperience:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];

  v3 = a3;
  if (-[SSSCropControllerRootView cropEnabled](self, "cropEnabled") || v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000CB48;
    v5[3] = &unk_100091920;
    v5[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
  }
}

- (void)_aboutToChangeSize
{
  CGRect *p_cropRectWhenViewSizeChangeBegan;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  p_cropRectWhenViewSizeChangeBegan = &self->_cropRectWhenViewSizeChangeBegan;
  -[SSSCropControllerRootView cropRect](self, "cropRect");
  p_cropRectWhenViewSizeChangeBegan->origin.x = v3;
  p_cropRectWhenViewSizeChangeBegan->origin.y = v4;
  p_cropRectWhenViewSizeChangeBegan->size.width = v5;
  p_cropRectWhenViewSizeChangeBegan->size.height = v6;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SSSCropControllerRootView frame](self, "frame");
  if (v9 == width && v8 == height)
  {
    v11.receiver = self;
    v11.super_class = (Class)SSSCropControllerRootView;
    -[SSSCropControllerRootView setFrame:](&v11, "setFrame:", x, y, width, height);
  }
  else
  {
    -[SSSCropControllerRootView _aboutToChangeSize](self, "_aboutToChangeSize");
    v12.receiver = self;
    v12.super_class = (Class)SSSCropControllerRootView;
    -[SSSCropControllerRootView setFrame:](&v12, "setFrame:", x, y, width, height);
    -[SSSCropControllerRootView _didChangeSize](self, "_didChangeSize");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SSSCropControllerRootView bounds](self, "bounds");
  if (v9 == width && v8 == height)
  {
    v11.receiver = self;
    v11.super_class = (Class)SSSCropControllerRootView;
    -[SSSCropControllerRootView setBounds:](&v11, "setBounds:", x, y, width, height);
  }
  else
  {
    -[SSSCropControllerRootView _aboutToChangeSize](self, "_aboutToChangeSize");
    v12.receiver = self;
    v12.super_class = (Class)SSSCropControllerRootView;
    -[SSSCropControllerRootView setBounds:](&v12, "setBounds:", x, y, width, height);
    -[SSSCropControllerRootView _didChangeSize](self, "_didChangeSize");
  }
}

- (void)layoutSubviews
{
  UIView *scrollViewContainerView;
  UIView *occludingViewContainerView;
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
  SSSScrollView *scrollView;
  SSSUncroppedOccludingView *occludingView;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  CGRect v33;

  -[SSSCropControllerRootView prepareForFullscreenExperience:](self, "prepareForFullscreenExperience:", 0);
  -[SSSCropControllerRootView bounds](self, "bounds");
  if (!CGRectIsEmpty(v33))
  {
    scrollViewContainerView = self->_scrollViewContainerView;
    -[SSSCropControllerRootView bounds](self, "bounds");
    -[UIView setFrame:](scrollViewContainerView, "setFrame:");
    occludingViewContainerView = self->_occludingViewContainerView;
    -[SSSCropControllerRootView bounds](self, "bounds");
    -[UIView setFrame:](occludingViewContainerView, "setFrame:");
    -[SSSCropControllerRootView _layoutScrollView:](self, "_layoutScrollView:", self->_scrollView);
    -[SSSCropControllerRootView _layoutViewToCrop:scrollView:](self, "_layoutViewToCrop:scrollView:", self->_viewToCrop, self->_scrollView);
    -[SSSCropControllerRootView _layoutOverlayView:viewToCrop:](self, "_layoutOverlayView:viewToCrop:", self->_overlayView, self->_viewToCrop);
    -[SSSCropControllerRootView _layoutOccludingView:viewToCrop:overlayView:](self, "_layoutOccludingView:viewToCrop:overlayView:", self->_occludingView, self->_viewToCrop, self->_overlayView);
    -[SSSScrollView frame](self->_scrollView, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[SSSUncroppedOccludingView frame](self->_occludingView, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[SSSCropControllerRootView _layoutScrollViewContainerView:scrollView:overlayView:](self, "_layoutScrollViewContainerView:scrollView:overlayView:", self->_scrollViewContainerView, self->_scrollView, self->_overlayView);
    -[SSSCropControllerRootView _layoutOccludingViewContainerView:occludingView:scrollViewMaskView:](self, "_layoutOccludingViewContainerView:occludingView:scrollViewMaskView:", self->_occludingViewContainerView, self->_occludingView, self->_scrollViewContainerView);
    scrollView = self->_scrollView;
    -[SSSCropControllerRootView convertRect:toView:](self, "convertRect:toView:", self->_scrollViewContainerView, v6, v8, v10, v12);
    -[SSSScrollView setFrame:](scrollView, "setFrame:");
    occludingView = self->_occludingView;
    -[SSSCropControllerRootView convertRect:toView:](self, "convertRect:toView:", self->_occludingViewContainerView, v14, v16, v18, v20);
    -[SSSUncroppedOccludingView setFrame:](occludingView, "setFrame:");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView gestureRecognizers](self, "gestureRecognizers", 0));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v29;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v29 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v27), "setEnabled:", -[SSSCropControllerRootView cropEnabled](self, "cropEnabled"));
          v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v25);
    }

  }
}

- (BOOL)_layoutShouldShowCroppedContents
{
  return self->_overlayViewResizeGestureIsTracking
      || -[NSTimer isValid](self->_zoomInTimer, "isValid")
      || self->_editMode == 1;
}

- (void)_layoutScrollView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SSSCropControllerRootView bounds](self, "bounds");
  objc_msgSend(v4, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "panGestureRecognizer"));
  objc_msgSend(v5, "setMinimumNumberOfTouches:", -[SSSCropControllerRootView numberOfTouchesRequiredForPanningCrop](self, "numberOfTouchesRequiredForPanningCrop"));

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "panGestureRecognizer"));
  objc_msgSend(v6, "setMaximumNumberOfTouches:", -[SSSCropControllerRootView numberOfTouchesRequiredForPanningCrop](self, "numberOfTouchesRequiredForPanningCrop"));

}

- (void)_layoutViewToCrop:(id)a3 scrollView:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double x;
  double y;
  SSSScreenshotContainerView *viewToCrop;
  CGRect *p_previousScrollViewFrame;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  id v23;
  CGRect v24;
  CGRect v25;

  v23 = a3;
  v6 = a4;
  if (self->_showingPDF)
  {
    if (self->_editMode == 2)
    {
      objc_msgSend(v23, "intrinsicContentSize");
      objc_msgSend(v6, "convertSize:fromView:", v23);
      v8 = v7;
      v10 = v9;
      x = CGPointZero.x;
      y = CGPointZero.y;
      viewToCrop = self->_viewToCrop;
    }
    else
    {
      viewToCrop = self->_viewToCrop;
      -[SSSCropControllerRootView bounds](self, "bounds");
      objc_msgSend(v6, "convertRect:fromView:", self);
    }
    -[SSSScreenshotContainerView sss_setFrameUnanimatingIfChangingFromCGSizeZero:](viewToCrop, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", x, y, v8, v10);
  }
  p_previousScrollViewFrame = &self->_previousScrollViewFrame;
  if (CGRectIsEmpty(self->_previousScrollViewFrame))
    goto LABEL_8;
  -[SSSScrollView frame](self->_scrollView, "frame");
  v25.origin.x = v15;
  v25.origin.y = v16;
  v25.size.width = v17;
  v25.size.height = v18;
  v24.origin.x = p_previousScrollViewFrame->origin.x;
  v24.origin.y = self->_previousScrollViewFrame.origin.y;
  v24.size.width = self->_previousScrollViewFrame.size.width;
  v24.size.height = self->_previousScrollViewFrame.size.height;
  if (!CGRectEqualToRect(v24, v25))
  {
LABEL_8:
    -[SSSScrollView frame](self->_scrollView, "frame");
    p_previousScrollViewFrame->origin.x = v19;
    self->_previousScrollViewFrame.origin.y = v20;
    self->_previousScrollViewFrame.size.width = v21;
    self->_previousScrollViewFrame.size.height = v22;
    -[SSSCropControllerRootView _layoutUpdateScrollViewContentLayout:viewToCrop:](self, "_layoutUpdateScrollViewContentLayout:viewToCrop:", self->_scrollView, self->_viewToCrop);
  }

}

- (void)_layoutOverlayView:(id)a3 viewToCrop:(id)a4
{
  void *v5;
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
  unsigned int v18;
  double v19;
  id v20;
  CGRect v21;

  v20 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView unitRectCoordinateSpace](self, "unitRectCoordinateSpace"));
  objc_msgSend(v5, "convertRect:toCoordinateSpace:", self, self->_overlayViewUnitRect.origin.x, self->_overlayViewUnitRect.origin.y, self->_overlayViewUnitRect.size.width, self->_overlayViewUnitRect.size.height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  if (CGRectIsEmpty(v21) || self->_editMode == 1)
  {
    -[SSSCropControllerRootView bounds](self, "bounds");
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }
  objc_msgSend(v20, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", v7, v9, v11, v13);
  v18 = -[SSSCropControllerRootView cropEnabled](self, "cropEnabled");
  v19 = 0.0;
  if (v18)
    v19 = 1.0;
  objc_msgSend(v20, "setAlpha:", v19);

}

- (void)_layoutScrollViewContainerView:(id)a3 scrollView:(id)a4 overlayView:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_viewToCrop)
  {
    if (-[SSSCropControllerRootView _layoutShouldShowCroppedContents](self, "_layoutShouldShowCroppedContents"))
    {
      v11 = 1.0;
      v12 = 0.0;
      v13 = 0.0;
      v14 = 1.0;
    }
    else
    {
      -[SSSCropControllerRootView _cropRectFromOverlayView:](self, "_cropRectFromOverlayView:", v10);
      v12 = v20;
      v13 = v21;
      v11 = v22;
      v14 = v23;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView unitRectCoordinateSpace](self, "unitRectCoordinateSpace"));
    objc_msgSend(v24, "convertRect:toCoordinateSpace:", self, v12, v13, v11, v14);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    v19 = v8;
    v15 = v26;
    v16 = v28;
    v17 = v30;
    v18 = v32;
  }
  else
  {
    objc_msgSend(v9, "frame");
    v19 = v8;
  }
  objc_msgSend(v19, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", v15, v16, v17, v18);

}

- (void)_layoutOccludingView:(id)a3 viewToCrop:(id)a4 overlayView:(id)a5
{
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v18 = a3;
  v8 = a5;
  v9 = a4;
  -[SSSCropControllerRootView bounds](self, "bounds");
  objc_msgSend(v18, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:");
  objc_msgSend(v9, "bounds");
  -[SSSCropControllerRootView convertRect:fromView:](self, "convertRect:fromView:", v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[SSSCropControllerRootView bounds](self, "bounds");
  v22.origin.x = v11;
  v22.origin.y = v13;
  v22.size.width = v15;
  v22.size.height = v17;
  if (CGRectIntersectsRect(v19, v22))
  {
    -[SSSCropControllerRootView bounds](self, "bounds");
    v23.origin.x = v11;
    v23.origin.y = v13;
    v23.size.width = v15;
    v23.size.height = v17;
    v21 = CGRectIntersection(v20, v23);
    objc_msgSend(v18, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    objc_msgSend(v8, "bounds");
    objc_msgSend(v18, "convertRect:fromView:", v8);
    objc_msgSend(v18, "setUnoccludedRect:");
  }

}

- (void)_layoutOccludingViewContainerView:(id)a3 occludingView:(id)a4 scrollViewMaskView:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  objc_msgSend(a4, "frame");
  if (self->_viewToCrop)
  {
    objc_msgSend(v8, "bounds");
    -[SSSCropControllerRootView convertRect:fromView:](self, "convertRect:fromView:", v8);
  }
  objc_msgSend(v9, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:");

}

- (void)_layoutUpdateScrollViewContentLayout:(id)a3 viewToCrop:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double y;
  double width;
  double height;
  double x;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend(v17, "minimumZoomScale");
  v8 = v7;
  objc_msgSend(v6, "intrinsicContentSize");
  v10 = v9;
  v12 = v11;

  objc_msgSend(v17, "setZoomScale:animated:", 0, v8);
  objc_msgSend(v17, "setContentSize:", v8 * v10, v8 * v12);
  if (-[SSSCropControllerRootView _layoutShouldShowCroppedContents](self, "_layoutShouldShowCroppedContents"))
  {
    y = 0.0;
    width = 1.0;
    height = 1.0;
    x = 0.0;
  }
  else
  {
    x = self->_cropRect.origin.x;
    y = self->_cropRect.origin.y;
    width = self->_cropRect.size.width;
    height = self->_cropRect.size.height;
  }
  -[SSSCropControllerRootView _contentInsetForUnitRect:](self, "_contentInsetForUnitRect:", x, y, width, height);
  objc_msgSend(v17, "setContentInset:");
  -[SSSCropControllerRootView notifyScrollViewChanged:](self, "notifyScrollViewChanged:", v17);

}

- (void)setViewToCrop:(id)a3
{
  SSSScreenshotContainerView *v4;
  SSSScreenshotContainerView *viewToCrop;
  SSSScreenshotContainerView *v6;

  v4 = (SSSScreenshotContainerView *)a3;
  -[SSSCropControllerRootView layoutIfNeeded](self, "layoutIfNeeded");
  -[SSSScreenshotContainerView removeFromSuperview](self->_viewToCrop, "removeFromSuperview");
  viewToCrop = self->_viewToCrop;
  self->_viewToCrop = v4;
  v6 = v4;

  -[SSSScrollView addSubview:](self->_scrollView, "addSubview:", self->_viewToCrop);
  -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updatePDFViewForEditModeChangeIfNecessary
{
  SSSScreenshotContainerView *viewToCrop;

  if (self->_showingPDF)
  {
    -[SSSCropControllerRootView _aboutToChangeSize](self, "_aboutToChangeSize");
    viewToCrop = self->_viewToCrop;
    if (self->_editMode == 2)
    {
      -[SSSScreenshotContainerView setCrop:](viewToCrop, "setCrop:", 0.0, 0.0, 1.0, 1.0);
      -[SSSScreenshotContainerView enterCropMode](self->_viewToCrop, "enterCropMode");
    }
    else
    {
      -[SSSScreenshotContainerView setCrop:](viewToCrop, "setCrop:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
      -[SSSScreenshotContainerView enterMarkupMode](self->_viewToCrop, "enterMarkupMode");
      -[SSSCropControllerRootView _updateScrollViewZoomScaleEndpoints](self, "_updateScrollViewZoomScaleEndpoints");
    }
    -[SSSCropControllerRootView _layoutUpdateScrollViewContentLayout:viewToCrop:](self, "_layoutUpdateScrollViewContentLayout:viewToCrop:", self->_scrollView, self->_viewToCrop);
    -[SSSScreenshotContainerView setUserInteractionEnabled:](self->_viewToCrop, "setUserInteractionEnabled:", self->_editMode == 1);
    -[SSSCropControllerRootView _didChangeSize](self, "_didChangeSize");
    -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[SSSScreenshotContainerView exitMarkupMode](self->_viewToCrop, "exitMarkupMode");
  }
}

- (void)setEditMode:(int64_t)a3
{
  if (self->_editMode != a3)
  {
    self->_editMode = a3;
    self->_showingPDF = (unint64_t)(a3 - 1) < 2;
    -[SSSCropControllerRootView _updatePDFViewForEditModeChangeIfNecessary](self, "_updatePDFViewForEditModeChangeIfNecessary");
  }
}

- (void)setOverlayViewUnitRect:(CGRect)a3
{
  CGRect v4;

  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  v4.size.width = 1.0;
  v4.size.height = 1.0;
  self->_overlayViewUnitRect = CGRectIntersection(a3, v4);
  -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_handleOverlayViewResize:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize size;
  SSSCropOverlayView *overlayView;
  id v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;

  v34 = a3;
  objc_msgSend(v34, "locationInView:", self);
  if (v4 >= 0.0)
    v6 = v4;
  else
    v6 = 0.0;
  if (v5 >= 0.0)
    v7 = v5;
  else
    v7 = 0.0;
  -[SSSCropControllerRootView bounds](self, "bounds");
  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  -[SSSCropControllerRootView bounds](self, "bounds");
  if (v7 >= v10)
    v11 = v10;
  else
    v11 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView unitRectCoordinateSpace](self, "unitRectCoordinateSpace"));
  objc_msgSend(v12, "convertPoint:fromCoordinateSpace:", self, v9, v11);
  v14 = v13;
  v16 = v15;

  if (objc_msgSend(v34, "state") == (id)1)
  {
    self->_overlayViewResizeGestureIsTracking = 1;
    size = self->_overlayViewUnitRect.size;
    self->_overlayViewUnitRectWhenResizeBegan.origin = self->_overlayViewUnitRect.origin;
    self->_overlayViewUnitRectWhenResizeBegan.size = size;
    overlayView = self->_overlayView;
    -[SSSCropOverlayView convertPoint:fromView:](overlayView, "convertPoint:fromView:", self, v9, v11);
    v19 = -[SSSCropOverlayView grabPositionForLocation:](overlayView, "grabPositionForLocation:");
    v21 = v20;
    if (sub_100030128((uint64_t)v19, v20))
    {
      objc_msgSend(v34, "setEnabled:", 0);
      objc_msgSend(v34, "setEnabled:", 1);
      self->_overlayViewResizeGestureIsTracking = 0;
    }
    else
    {
      self->_grabPositionForResize.edge = (unint64_t)v19;
      self->_grabPositionForResize.corner = v21;
      self->_locationOfResizeGestureInUsWhenResizeBegan.x = v14;
      self->_locationOfResizeGestureInUsWhenResizeBegan.y = v16;
      -[SSSCropControllerRootView _cancelZoomTimer](self, "_cancelZoomTimer");
      -[SSSCropControllerRootView _emitCropRectWillBeginChangingMessage](self, "_emitCropRectWillBeginChangingMessage");
    }
    goto LABEL_25;
  }
  if (objc_msgSend(v34, "state") == (id)2)
  {
    -[SSSCropControllerRootView _minimumSizeForOverlayViewInUnitSpace](self, "_minimumSizeForOverlayViewInUnitSpace");
    v23 = v22;
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView snapRects](self, "snapRects"));
    v27 = sub_10002E504(self->_grabPositionForResize.edge, self->_grabPositionForResize.corner, v26, self->_overlayViewUnitRectWhenResizeBegan.origin.x, self->_overlayViewUnitRectWhenResizeBegan.origin.y, self->_overlayViewUnitRectWhenResizeBegan.size.width, self->_overlayViewUnitRectWhenResizeBegan.size.height, self->_locationOfResizeGestureInUsWhenResizeBegan.x, self->_locationOfResizeGestureInUsWhenResizeBegan.y, v14, v16, v23, v25);
    v29 = v28;
    v31 = v30;
    v33 = v32;

    -[SSSCropControllerRootView setOverlayViewUnitRect:](self, "setOverlayViewUnitRect:", v27, v29, v31, v33);
    goto LABEL_25;
  }
  if (objc_msgSend(v34, "state") == (id)3)
  {
    -[SSSCropControllerRootView _prolongZoomTimerStartingIfNotRunning:](self, "_prolongZoomTimerStartingIfNotRunning:", 1);
LABEL_24:
    self->_overlayViewResizeGestureIsTracking = 0;
    goto LABEL_25;
  }
  if (objc_msgSend(v34, "state") == (id)5 || objc_msgSend(v34, "state") == (id)4)
  {
    -[SSSCropControllerRootView setOverlayViewUnitRect:](self, "setOverlayViewUnitRect:", self->_overlayViewUnitRectWhenResizeBegan.origin.x, self->_overlayViewUnitRectWhenResizeBegan.origin.y, self->_overlayViewUnitRectWhenResizeBegan.size.width, self->_overlayViewUnitRectWhenResizeBegan.size.height);
    goto LABEL_24;
  }
LABEL_25:
  -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)_minimumSizeForOverlayViewInUnitSpace
{
  double v3;
  double v4;
  double v5;
  double y;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v3 = sub_10002E908();
  v5 = v4;
  y = CGRectZero.origin.y;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView unitRectCoordinateSpace](self, "unitRectCoordinateSpace"));
  objc_msgSend(v7, "convertRect:fromCoordinateSpace:", self->_viewToCrop, CGRectZero.origin.x, y, v3, v5);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_zoomTimerFired
{
  -[NSTimer invalidate](self->_zoomInTimer, "invalidate");
  self->_isZoomingIn = 1;
  -[SSSCropControllerRootView _cropRectFromOverlayView:](self, "_cropRectFromOverlayView:", self->_overlayView);
  -[SSSCropControllerRootView _moveToUnitRect:animated:](self, "_moveToUnitRect:animated:", 1);
}

- (BOOL)_zoomTimerRunning
{
  return -[NSTimer isValid](self->_zoomInTimer, "isValid");
}

- (void)_prolongZoomTimerStartingIfNotRunning:(BOOL)a3
{
  unsigned int v5;
  NSTimer *v6;
  NSTimer *zoomInTimer;

  v5 = -[SSSCropControllerRootView _zoomTimerRunning](self, "_zoomTimerRunning");
  if (a3 || v5)
  {
    -[SSSCropControllerRootView _cancelZoomTimer](self, "_cancelZoomTimer");
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_zoomTimerFired", 0, 0, 1.0));
    zoomInTimer = self->_zoomInTimer;
    self->_zoomInTimer = v6;

  }
}

- (void)_cancelZoomTimer
{
  -[NSTimer invalidate](self->_zoomInTimer, "invalidate");
}

- (UIEdgeInsets)_contentInsetForUnitRect:(CGRect)a3
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
  double bottom;
  double top;
  double right;
  double left;
  UIEdgeInsets result;

  height = a3.size.height;
  width = a3.size.width;
  -[SSSScrollView bounds](self->_scrollView, "bounds", a3.origin.x, a3.origin.y);
  v7 = v6;
  v9 = v8;
  -[SSSScreenshotContainerView intrinsicContentSize](self->_viewToCrop, "intrinsicContentSize");
  v11 = width * v10;
  v13 = height * v12;
  v14 = sub_10002E878(self->_editMode, v11, v13, v7, v9);
  if (v11 / v13 >= v7 / v9)
  {
    right = UIEdgeInsetsZero.right;
    left = UIEdgeInsetsZero.left;
    bottom = (v9 - v13 * v14) * 0.5;
    top = bottom;
  }
  else
  {
    bottom = UIEdgeInsetsZero.bottom;
    top = UIEdgeInsetsZero.top;
    right = (v7 - v11 * v14) * 0.5;
    left = right;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_moveToUnitRect:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[13];

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SSSCropControllerRootView layoutIfNeeded](self, "layoutIfNeeded");
  -[SSSCropControllerRootView setOverlayViewUnitRect:](self, "setOverlayViewUnitRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView unitRectCoordinateSpace](self, "unitRectCoordinateSpace"));
  objc_msgSend(v10, "convertRect:toCoordinateSpace:", self->_viewToCrop, x, y, width, height);
  v19 = v11;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000E1D8;
  v21[3] = &unk_100091988;
  v21[4] = self;
  *(double *)&v21[5] = x;
  *(double *)&v21[6] = y;
  *(double *)&v21[7] = width;
  *(double *)&v21[8] = height;
  v21[9] = v19;
  v21[10] = v13;
  v21[11] = v15;
  v21[12] = v17;
  v18 = objc_retainBlock(v21);
  if (v4)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000E24C;
    v20[3] = &unk_1000919B0;
    v20[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v18, v20, 0.2, 0.0);
  }
  else
  {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v18);
  }

}

- (void)setCropRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SSSCropControllerRootView _cancelZoomTimer](self, "_cancelZoomTimer");
  self->_cropRect.origin.x = x;
  self->_cropRect.origin.y = y;
  self->_cropRect.size.width = width;
  self->_cropRect.size.height = height;
  -[SSSCropControllerRootView _moveToUnitRect:animated:](self, "_moveToUnitRect:animated:", 1, x, y, width, height);
  -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPageCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SSSCropControllerRootView _cancelZoomTimer](self, "_cancelZoomTimer");
  -[SSSCropControllerRootView _aboutToChangeSize](self, "_aboutToChangeSize");
  self->_cropRect.origin.x = x;
  self->_cropRect.origin.y = y;
  self->_cropRect.size.width = width;
  self->_cropRect.size.height = height;
  -[SSSCropControllerRootView _updateScrollViewZoomScaleEndpoints](self, "_updateScrollViewZoomScaleEndpoints");
  -[SSSCropControllerRootView _layoutUpdateScrollViewContentLayout:viewToCrop:](self, "_layoutUpdateScrollViewContentLayout:viewToCrop:", self->_scrollView, self->_viewToCrop);
  -[SSSCropControllerRootView _moveToUnitRect:animated:](self, "_moveToUnitRect:animated:", 0, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
}

- (void)setUndoCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SSSCropControllerRootView _cancelZoomTimer](self, "_cancelZoomTimer");
  self->_cropRect.origin.x = x;
  self->_cropRect.origin.y = y;
  self->_cropRect.size.width = width;
  self->_cropRect.size.height = height;
  -[SSSCropControllerRootView _aboutToChangeSize](self, "_aboutToChangeSize");
  if (self->_editMode == 1)
    -[SSSScreenshotContainerView setCrop:](self->_viewToCrop, "setCrop:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
  -[SSSCropControllerRootView _layoutUpdateScrollViewContentLayout:viewToCrop:](self, "_layoutUpdateScrollViewContentLayout:viewToCrop:", self->_scrollView, self->_viewToCrop);
  -[SSSCropControllerRootView _didChangeSize](self, "_didChangeSize");
}

- (void)commitInflightEdits
{
  SSSCropOverlayView *overlayView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;

  overlayView = self->_overlayView;
  if (!overlayView
    || (-[SSSCropOverlayView bounds](overlayView, "bounds"),
        v22.origin.x = CGRectZero.origin.x,
        v22.origin.y = CGRectZero.origin.y,
        v22.size.width = CGRectZero.size.width,
        v22.size.height = CGRectZero.size.height,
        !CGRectEqualToRect(v21, v22)))
  {
    -[SSSCropControllerRootView cropRect](self, "cropRect");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = -[SSSCropControllerRootView _cropRectFromOverlayView:](self, "_cropRectFromOverlayView:", self->_overlayView);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    if ((SSRectEqualToRect(v12, v5, v7, v9, v11, v13, v15, v17, v19) & 1) == 0)
    {
      if (-[SSSCropControllerRootView cropEnabled](self, "cropEnabled"))
      {
        v5 = v14;
        v7 = v16;
        v9 = v18;
        v11 = v20;
      }
      -[NSTimer invalidate](self->_zoomInTimer, "invalidate");
      -[SSSCropControllerRootView _moveToUnitRect:animated:](self, "_moveToUnitRect:animated:", 0, v5, v7, v9, v11);
      -[SSSCropControllerRootView _emitCropRectChangeMessage](self, "_emitCropRectChangeMessage");
    }
  }
}

- (void)_updateScrollViewZoomScaleEndpoints
{
  uint64_t v3;
  void *v4;
  BOOL IsEmpty;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SSSScrollView *scrollView;
  double v14;
  double v15;
  SSSScrollView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;

  v3 = objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView viewToCrop](self, "viewToCrop"));
  if (v3)
  {
    v4 = (void *)v3;
    -[SSSCropControllerRootView bounds](self, "bounds");
    IsEmpty = CGRectIsEmpty(v21);

    if (!IsEmpty)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView viewToCrop](self, "viewToCrop"));
      objc_msgSend(v6, "intrinsicContentSize");
      v8 = v7;
      v10 = v9;

      -[SSSCropControllerRootView bounds](self, "bounds");
      -[SSSScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", sub_10002E878(self->_editMode, v8, v10, v11, v12));
      scrollView = self->_scrollView;
      -[SSSCropControllerRootView _maximumZoomScale](self, "_maximumZoomScale");
      -[SSSScrollView setMaximumZoomScale:](scrollView, "setMaximumZoomScale:");
      -[SSSScrollView zoomScale](self->_scrollView, "zoomScale");
      v15 = v14;
      -[SSSScrollView minimumZoomScale](self->_scrollView, "minimumZoomScale");
      v16 = self->_scrollView;
      if (v15 >= v17)
      {
        -[SSSScrollView zoomScale](v16, "zoomScale");
        v19 = v18;
        -[SSSScrollView maximumZoomScale](self->_scrollView, "maximumZoomScale");
        if (v19 <= v20)
          return;
        -[SSSScrollView maximumZoomScale](self->_scrollView, "maximumZoomScale");
      }
      else
      {
        -[SSSScrollView minimumZoomScale](v16, "minimumZoomScale");
      }
      -[SSSScrollView setZoomScale:](self->_scrollView, "setZoomScale:");
    }
  }
}

- (double)_maximumZoomScale
{
  double result;

  -[SSSCropControllerRootView bounds](self, "bounds");
  sub_10002E8AC();
  return result;
}

- (CGRect)_currentScrollViewCropRect
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView unitRectCoordinateSpace](self, "unitRectCoordinateSpace"));
  -[SSSCropControllerRootView bounds](self, "bounds");
  objc_msgSend(v3, "convertRect:fromCoordinateSpace:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_cropRectFromOverlayView:(id)a3
{
  id v4;
  void *v5;
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
  CGRect result;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView unitRectCoordinateSpace](self, "unitRectCoordinateSpace"));
    objc_msgSend(v4, "bounds");
    objc_msgSend(v5, "convertRect:fromCoordinateSpace:", v4);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v11 = 1.0;
    v7 = 0.0;
    v9 = 0.0;
    v13 = 1.0;
  }
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_scrollView;
}

- (id)unitRectCoordinateSpace
{
  return -[SSSUnitRectCoordinateSpace initWithView:]([SSSUnitRectCoordinateSpace alloc], "initWithView:", self->_viewToCrop);
}

- (void)_emitCropRectWillBeginChangingMessage
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView delegate](self, "delegate"));
  objc_msgSend(v3, "cropControllerRootViewWillBeginChangingCropRect:", self);

}

- (void)_emitCropRectChangeMessage
{
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  void *v11;

  -[SSSCropControllerRootView _cropRectFromOverlayView:](self, "_cropRectFromOverlayView:", self->_overlayView);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  self->_cropRect.origin.x = v3;
  self->_cropRect.origin.y = v5;
  self->_cropRect.size.width = v7;
  self->_cropRect.size.height = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView delegate](self, "delegate"));
  objc_msgSend(v11, "cropControllerRootView:changedToCropRect:", self, v4, v6, v8, v10);

  -[SSSCropControllerRootView notifyScrollViewChanged:](self, "notifyScrollViewChanged:", self->_scrollView);
}

- (void)_scrollViewTerminalUserEventOccurred
{
  if (!-[SSSCropControllerRootView _zoomTimerRunning](self, "_zoomTimerRunning"))
    -[SSSCropControllerRootView _emitCropRectChangeMessage](self, "_emitCropRectChangeMessage");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[SSSCropControllerRootView _scrollViewTerminalUserEventOccurred](self, "_scrollViewTerminalUserEventOccurred", a3);
  -[SSSCropControllerRootView _updateForScrollViewNonLiveUserEvent](self, "_updateForScrollViewNonLiveUserEvent");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[SSSCropControllerRootView _scrollViewTerminalUserEventOccurred](self, "_scrollViewTerminalUserEventOccurred", a3);
  -[UILongPressGestureRecognizer setEnabled:](self->_overlayViewResizeGesture, "setEnabled:", 1);
}

- (void)_updateLastScrollViewUnitRect
{
  CGRect *p_lastScrollViewUnitRect;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;

  p_lastScrollViewUnitRect = &self->_lastScrollViewUnitRect;
  -[SSSCropControllerRootView _currentScrollViewCropRect](self, "_currentScrollViewCropRect");
  p_lastScrollViewUnitRect->origin.x = v4;
  p_lastScrollViewUnitRect->origin.y = v5;
  p_lastScrollViewUnitRect->size.width = v6;
  p_lastScrollViewUnitRect->size.height = v7;
  -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateForScrollViewLiveUserEvent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect *p_lastScrollViewUnitRect;
  double height;
  double width;
  double y;
  double x;
  CGAffineTransform v16[2];
  CGRect overlayViewUnitRect;
  CGRect v18;

  -[SSSCropControllerRootView _currentScrollViewCropRect](self, "_currentScrollViewCropRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  p_lastScrollViewUnitRect = &self->_lastScrollViewUnitRect;
  if (CGRectIsEmpty(self->_lastScrollViewUnitRect))
  {
    p_lastScrollViewUnitRect->origin.x = v4;
    self->_lastScrollViewUnitRect.origin.y = v6;
    height = v10;
    width = v8;
    y = v6;
    x = v4;
    self->_lastScrollViewUnitRect.size.width = v8;
    self->_lastScrollViewUnitRect.size.height = v10;
  }
  else
  {
    x = p_lastScrollViewUnitRect->origin.x;
    y = self->_lastScrollViewUnitRect.origin.y;
    width = self->_lastScrollViewUnitRect.size.width;
    height = self->_lastScrollViewUnitRect.size.height;
  }
  memset(&v16[1], 0, sizeof(CGAffineTransform));
  -[SSSCropControllerRootView _transformToConvertFromRect:toRect:](self, "_transformToConvertFromRect:toRect:", x, y, width, height, v4, v6, v8, v10);
  -[SSSCropControllerRootView _updateLastScrollViewUnitRect](self, "_updateLastScrollViewUnitRect");
  overlayViewUnitRect = self->_overlayViewUnitRect;
  v16[0] = v16[1];
  v18 = CGRectApplyAffineTransform(overlayViewUnitRect, v16);
  -[SSSCropControllerRootView setOverlayViewUnitRect:](self, "setOverlayViewUnitRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  -[SSSCropControllerRootView _prolongZoomTimerStartingIfNotRunning:](self, "_prolongZoomTimerStartingIfNotRunning:", 0);
  -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");
}

- (CGAffineTransform)_transformToConvertFromRect:(SEL)a3 toRect:(CGRect)a4
{
  double y;
  double x;
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;
  CGAffineTransform v13;
  CGAffineTransform t1;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;

  y = a5.origin.y;
  x = a5.origin.x;
  height = a4.size.height;
  width = a4.size.width;
  v9 = a4.origin.y;
  v10 = a4.origin.x;
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeScale(&v16, a5.size.width / a4.size.width, a5.size.width / a4.size.width);
  v15 = v16;
  v17.origin.x = v10;
  v17.origin.y = v9;
  v17.size.width = width;
  v17.size.height = height;
  v18 = CGRectApplyAffineTransform(v17, &v15);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, x - v18.origin.x, y - v18.origin.y);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  t1 = v16;
  v13 = v15;
  return CGAffineTransformConcat(retstr, &t1, &v13);
}

- (void)_updateForScrollViewNonLiveUserEvent
{
  if (self->_isZoomingIn)
  {
    self->_isZoomingIn = 0;
    -[SSSCropControllerRootView _emitCropRectChangeMessage](self, "_emitCropRectChangeMessage");
  }
}

- (BOOL)_scrollViewIsInLiveUserEvent
{
  if ((-[SSSScrollView isTracking](self->_scrollView, "isTracking") & 1) != 0
    || (-[SSSScrollView isDecelerating](self->_scrollView, "isDecelerating") & 1) != 0
    || self->_scrollViewIsInUserInitiatedZoom)
  {
    return !-[SSSScrollView isInProgrammaticCall](self->_scrollView, "isInProgrammaticCall");
  }
  else
  {
    return 0;
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[UILongPressGestureRecognizer setEnabled:](self->_overlayViewResizeGesture, "setEnabled:", 0);
  -[SSSCropControllerRootView _emitCropRectWillBeginChangingMessage](self, "_emitCropRectWillBeginChangingMessage");
  -[SSSCropControllerRootView _updateForScrollViewLiveUserEvent](self, "_updateForScrollViewLiveUserEvent");
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SSSCropControllerRootView _scrollViewIsInLiveUserEvent](self, "_scrollViewIsInLiveUserEvent"))
  {
    -[SSSCropControllerRootView _updateForScrollViewLiveUserEvent](self, "_updateForScrollViewLiveUserEvent");
    -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");
  }
  -[SSSCropControllerRootView notifyScrollViewChanged:](self, "notifyScrollViewChanged:", v4);

}

- (void)scrollViewDidZoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  SSSScreenshotContainerView *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  if (-[SSSCropControllerRootView _scrollViewIsInLiveUserEvent](self, "_scrollViewIsInLiveUserEvent"))
    -[SSSCropControllerRootView _updateForScrollViewLiveUserEvent](self, "_updateForScrollViewLiveUserEvent");
  -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView scrollView](self, "scrollView", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(SSSScreenshotContainerView **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (v11 != self->_viewToCrop)
          -[SSSScreenshotContainerView setNeedsLayout](v11, "setNeedsLayout");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (!self->_scrollViewIsInUserInitiatedZoom)
    -[SSSCropControllerRootView notifyZoomScaleChanged:](self, "notifyZoomScaleChanged:", v4);
  -[SSSCropControllerRootView notifyScrollViewChanged:](self, "notifyScrollViewChanged:", v4);

}

- (void)notifyScrollViewChanged:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector(self->_viewToCrop, "cropControllerDidUpdateScrollView:") & 1) != 0)
    -[SSSScreenshotContainerView cropControllerDidUpdateScrollView:](self->_viewToCrop, "cropControllerDidUpdateScrollView:", v4);

}

- (void)notifyZoomScaleChanged:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector(self->_viewToCrop, "cropControllerDidZoomInScrollView:") & 1) != 0)
    -[SSSScreenshotContainerView cropControllerDidZoomInScrollView:](self->_viewToCrop, "cropControllerDidZoomInScrollView:", v4);

}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pinchGestureRecognizer"));
  self->_scrollViewIsInUserInitiatedZoom = objc_msgSend(v5, "state") == (id)1;

  if (self->_scrollViewIsInUserInitiatedZoom)
    -[SSSCropControllerRootView _updateForScrollViewLiveUserEvent](self, "_updateForScrollViewLiveUserEvent");
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v6;

  if (self->_scrollViewIsInUserInitiatedZoom)
  {
    v6 = a3;
    -[SSSCropControllerRootView _updateForScrollViewLiveUserEvent](self, "_updateForScrollViewLiveUserEvent");
    self->_scrollViewIsInUserInitiatedZoom = 0;
    -[SSSCropControllerRootView _scrollViewTerminalUserEventOccurred](self, "_scrollViewTerminalUserEventOccurred");
    -[SSSCropControllerRootView notifyZoomScaleChanged:](self, "notifyZoomScaleChanged:", v6);

  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_viewToCrop;
}

- (NSArray)gestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = v3;
  if (self->_overlayViewResizeGesture)
    objc_msgSend(v3, "addObject:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer"));
    objc_msgSend(v4, "addObject:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScrollView pinchGestureRecognizer](self->_scrollView, "pinchGestureRecognizer"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScrollView pinchGestureRecognizer](self->_scrollView, "pinchGestureRecognizer"));
    objc_msgSend(v4, "addObject:", v8);

  }
  return (NSArray *)v4;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return (UIPanGestureRecognizer *)-[SSSScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer");
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return (UIPinchGestureRecognizer *)-[SSSScrollView pinchGestureRecognizer](self->_scrollView, "pinchGestureRecognizer");
}

- (void)setNumberOfTouchesRequiredForPanningCrop:(int64_t)a3
{
  if (self->_numberOfTouchesRequiredForPanningCrop != a3)
  {
    self->_numberOfTouchesRequiredForPanningCrop = a3;
    -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCropEnabled:(BOOL)a3
{
  if (-[SSSCropControllerRootView cropEnabled](self, "cropEnabled") != a3)
  {
    self->_cropEnabled = a3;
    -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSnapRects:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSArray isEqual:](self->_snapRects, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_snapRects, a3);
    -[SSSCropControllerRootView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setCornerRadius:(double)a3
{
  -[SSSScrollView _setCornerRadius:](self->_scrollView, "_setCornerRadius:", a3);
}

- (double)cornerRadius
{
  double result;

  -[SSSScrollView _cornerRadius](self->_scrollView, "_cornerRadius");
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SSSCropOverlayView convertPoint:fromView:](self->_overlayView, "convertPoint:fromView:", self, x, y);
  v9 = v8;
  v11 = v10;
  v14.receiver = self;
  v14.super_class = (Class)SSSCropControllerRootView;
  if (-[SSSCropControllerRootView pointInside:withEvent:](&v14, "pointInside:withEvent:", v7, x, y))
    v12 = 1;
  else
    v12 = -[SSSCropOverlayView pointInside:withEvent:](self->_overlayView, "pointInside:withEvent:", v7, v9, v11);

  return v12;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)SSSCropControllerRootView;
  v7 = a4;
  v8 = -[SSSCropControllerRootView hitTest:withEvent:](&v15, "hitTest:withEvent:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[SSSCropOverlayView convertPoint:fromView:](self->_overlayView, "convertPoint:fromView:", self, x, y, v15.receiver, v15.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropOverlayView hitTest:withEvent:](self->_overlayView, "hitTest:withEvent:", v7));

  v11 = v10;
  if (v10
    || (-[SSSUncroppedOccludingView convertPoint:fromView:](self->_occludingView, "convertPoint:fromView:", self, x, y),
        v12 = -[SSSUncroppedOccludingView pointCanPassthrough:](self->_occludingView, "pointCanPassthrough:"),
        v11 = v9,
        v12))
  {
    v13 = v11;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setCornerGrabberAlpha:(double)a3
{
  self->_cornerGrabberAlpha = a3;
  -[SSSCropOverlayView setCornerGrabberAlpha:](self->_overlayView, "setCornerGrabberAlpha:");
}

- (void)setLineAlpha:(double)a3
{
  self->_lineAlpha = a3;
  -[SSSCropOverlayView setLineAlpha:](self->_overlayView, "setLineAlpha:");
}

- (void)setLineGrabberAlpha:(double)a3
{
  self->_lineGrabberAlpha = a3;
  -[SSSCropOverlayView setLineGrabberAlpha:](self->_overlayView, "setLineGrabberAlpha:");
}

- (CGRect)cropOverlayViewRectInWindow
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSCropControllerRootView window](self, "window"));
  -[SSSCropOverlayView bounds](self->_overlayView, "bounds");
  objc_msgSend(v3, "convertRect:fromView:", self->_overlayView);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (SSSScreenshotContainerView)viewToCrop
{
  return self->_viewToCrop;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)editMode
{
  return self->_editMode;
}

- (double)cornerGrabberAlpha
{
  return self->_cornerGrabberAlpha;
}

- (double)lineAlpha
{
  return self->_lineAlpha;
}

- (double)lineGrabberAlpha
{
  return self->_lineGrabberAlpha;
}

- (int64_t)numberOfTouchesRequiredForPanningCrop
{
  return self->_numberOfTouchesRequiredForPanningCrop;
}

- (BOOL)cropEnabled
{
  return self->_cropEnabled;
}

- (NSArray)snapRects
{
  return self->_snapRects;
}

- (SSSCropControllerRootViewDelegate)delegate
{
  return (SSSCropControllerRootViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showingPDF
{
  return self->_showingPDF;
}

- (void)setShowingPDF:(BOOL)a3
{
  self->_showingPDF = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapRects, 0);
  objc_storeStrong((id *)&self->_viewToCrop, 0);
  objc_storeStrong((id *)&self->_zoomInTimer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_overlayViewResizeGesture, 0);
  objc_storeStrong((id *)&self->_occludingViewContainerView, 0);
  objc_storeStrong((id *)&self->_scrollViewContainerView, 0);
  objc_storeStrong((id *)&self->_occludingView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end
