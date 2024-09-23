@implementation AVPlaybackContentZoomingView

- (AVPlaybackContentZoomingView)initWithFrame:(CGRect)a3 activeContentView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  AVPlaybackContentZoomingView *v11;
  AVPlaybackContentZoomingView *v12;
  uint64_t v13;
  AVCacheLargestInscribedRectInBoundingPath *cacheLargestInscribedRect;
  double v15;
  void *v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AVPlaybackContentZoomingView;
  v11 = -[AVPlaybackContentZoomingView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    -[AVPlaybackContentZoomingView setContentInsetAdjustmentBehavior:](v11, "setContentInsetAdjustmentBehavior:", 2);
    v13 = objc_opt_new();
    cacheLargestInscribedRect = v12->_cacheLargestInscribedRect;
    v12->_cacheLargestInscribedRect = (AVCacheLargestInscribedRectInBoundingPath *)v13;

    objc_storeStrong((id *)&v12->_activeContentView, a4);
    v12->_contentAspectRatio = (CGSize)xmmword_1AC5F8230;
    -[AVPlaybackContentZoomingView setBouncesZoom:](v12, "setBouncesZoom:", 1);
    -[AVPlaybackContentZoomingView setShowsVerticalScrollIndicator:](v12, "setShowsVerticalScrollIndicator:", 0);
    -[AVPlaybackContentZoomingView setShowsHorizontalScrollIndicator:](v12, "setShowsHorizontalScrollIndicator:", 0);
    -[AVPlaybackContentZoomingView _updateMinMaxZoomScales](v12, "_updateMinMaxZoomScales");
    -[AVPlaybackContentZoomingView _contentRectForScale:](v12, "_contentRectForScale:", 1.0);
    objc_msgSend(v10, "setFrame:");
    -[AVPlaybackContentZoomingView addSubview:](v12, "addSubview:", v10);
    -[AVPlaybackContentZoomingView setDelegate:](v12, "setDelegate:", v12);
    -[AVPlaybackContentZoomingView setDecelerationRate:](v12, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
    -[AVPlaybackContentZoomingView zoomScale](v12, "zoomScale");
    -[AVPlaybackContentZoomingView setScrollEnabled:](v12, "setScrollEnabled:", v15 != 1.0);
    objc_msgSend(v10, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackContentZoomingView setBackgroundColor:](v12, "setBackgroundColor:", v16);

  }
  return v12;
}

- (void)setLastKnownWindow:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;
  _QWORD v7[5];

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lastKnownWindow);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_lastKnownWindow, obj);
    v5 = obj;
    if (obj)
    {
      -[AVPlaybackContentZoomingView setNeedsLayout](self, "setNeedsLayout");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51__AVPlaybackContentZoomingView_setLastKnownWindow___block_invoke;
      v7[3] = &unk_1E5BB4CA0;
      v7[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
      v5 = obj;
    }
  }

}

- (BOOL)canShowStatusBarBackgroundGradientWhenStatusBarVisible
{
  void *v2;
  char v3;

  -[AVPlaybackContentZoomingView activeContentView](self, "activeContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowStatusBarBackgroundGradientWhenStatusBarVisible");

  return v3;
}

- (void)setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AVPlaybackContentZoomingView activeContentView](self, "activeContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:", v3);

}

- (void)setVideoGravity:(int64_t)a3 removingAllSublayerTransformAnimations:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AVPlaybackContentZoomingView activeContentView](self, "activeContentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVideoGravity:removingAllSublayerTransformAnimations:", a3, v4);

}

- (void)setContentAspectRatio:(CGSize)a3
{
  if (a3.width != self->_contentAspectRatio.width || a3.height != self->_contentAspectRatio.height)
  {
    self->_contentAspectRatio = a3;
    -[AVPlaybackContentZoomingView _updateMinMaxZoomScales](self, "_updateMinMaxZoomScales");
    -[AVPlaybackContentZoomingView zoomScale](self, "zoomScale");
    -[AVPlaybackContentZoomingView _contentSizeForScale:](self, "_contentSizeForScale:");
    -[AVPlaybackContentZoomingView setContentSize:](self, "setContentSize:");
    -[AVPlaybackContentZoomingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setZoomingEnabled:(BOOL)a3
{
  if (self->_zoomingEnabled != a3)
  {
    self->_zoomingEnabled = a3;
    -[AVPlaybackContentZoomingView _updateMinMaxZoomScales](self, "_updateMinMaxZoomScales");
  }
}

- (void)zoomToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
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
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double width;
  double height;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGAffineTransform v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  y = a3.y;
  x = a3.x;
  -[AVPlaybackContentZoomingView zoomScale](self, "zoomScale");
  if (v6 == 1.0)
  {
    -[AVPlaybackContentZoomingView activeContentView](self, "activeContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[AVPlaybackContentZoomingView activeContentView](self, "activeContentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "convertPoint:fromView:", self, x, y);
    v18 = v17;
    v40 = v19;
    v41 = v17;
    v20 = v19;

    v43.origin.x = v9;
    v43.origin.y = v11;
    v43.size.width = v13;
    v43.size.height = v15;
    v39 = fmin(fmax((v18 - v9) / CGRectGetWidth(v43), 0.0), 1.0);
    v44.origin.x = v9;
    v44.origin.y = v11;
    v44.size.width = v13;
    v44.size.height = v15;
    v38 = fmin(fmax((v20 - v11) / CGRectGetHeight(v44), 0.0), 1.0);
    -[AVPlaybackContentZoomingView maximumZoomScale](self, "maximumZoomScale");
    v22 = v21;
    -[AVPlaybackContentZoomingView minimumZoomScale](self, "minimumZoomScale");
    v24 = (v22 - v23) * 0.5;
    -[AVPlaybackContentZoomingView bounds](self, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    if (v24 <= 0.0)
      v33 = 1.0;
    else
      v33 = 1.0 / (v24 + 1.0);
    CGAffineTransformMakeScale(&v42, v33, v33);
    v45.origin.x = v26;
    v45.origin.y = v28;
    v45.size.width = v30;
    v45.size.height = v32;
    v46 = CGRectApplyAffineTransform(v45, &v42);
    v34 = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
    v47.origin.x = v41 - CGRectGetWidth(v46) * v39;
    v47.origin.y = v34;
    v47.size.width = width;
    v47.size.height = height;
    -[AVPlaybackContentZoomingView zoomToRect:animated:](self, "zoomToRect:animated:", 0, v47.origin.x, v40 - CGRectGetHeight(v47) * v38, width, height);
  }
  else
  {
    -[AVPlaybackContentZoomingView setZoomScale:](self, "setZoomScale:", 1.0);
  }
  -[AVPlaybackContentZoomingView setNeedsLayout](self, "setNeedsLayout");
  -[AVPlaybackContentZoomingView layoutIfNeeded](self, "layoutIfNeeded");
  -[AVPlaybackContentZoomingView activeContentView](self, "activeContentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "removeAllSublayerTransformAnimations");

}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  -[AVPlaybackContentZoomingView setAlwaysBounceVertical:](self, "setAlwaysBounceVertical:", 1, a4);
  -[AVPlaybackContentZoomingView setAlwaysBounceHorizontal:](self, "setAlwaysBounceHorizontal:", 1);
  -[AVPlaybackContentZoomingView setBouncesHorizontally:](self, "setBouncesHorizontally:", 1);
  -[AVPlaybackContentZoomingView setBouncesVertically:](self, "setBouncesVertically:", 1);
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v6;

  -[AVPlaybackContentZoomingView setScrollEnabled:](self, "setScrollEnabled:", a5 != 1.0, a4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("AVPlayerViewControllerContentViewUpdateContentIntersectionNotification"), self);

}

- (void)scrollViewDidZoom:(id)a3
{
  double v4;
  id v5;

  objc_msgSend(a3, "zoomScale");
  -[AVPlaybackContentZoomingView setScrollEnabled:](self, "setScrollEnabled:", v4 != 1.0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("AVPlayerViewControllerContentViewUpdateContentIntersectionNotification"), self);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AVPlaybackContentZoomingView;
  if (!-[AVPlaybackContentZoomingView gestureRecognizerShouldBegin:](&v14, sel_gestureRecognizerShouldBegin_, v4))
    goto LABEL_10;
  if (!-[AVPlaybackContentZoomingView isFullScreen](self, "isFullScreen"))
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "velocity");
      if (v9 < 0.0)
      {
        -[AVPlaybackContentZoomingView zoomScale](self, "zoomScale");
        v11 = v10;
        -[AVPlaybackContentZoomingView minimumZoomScale](self, "minimumZoomScale");
        if (v11 == v12)
          goto LABEL_10;
      }
    }
LABEL_11:
    v8 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v4, "translationInView:", 0);
  if (v5 <= 0.0)
    goto LABEL_11;
  -[AVPlaybackContentZoomingView contentInset](self, "contentInset");
  if (v6 != 0.0)
  {
LABEL_10:
    v8 = 0;
    goto LABEL_12;
  }
  -[AVPlaybackContentZoomingView contentOffset](self, "contentOffset");
  v8 = v7 != 0.0;
LABEL_12:

  return v8;
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  -[AVCacheLargestInscribedRectInBoundingPath clearCache](self->_cacheLargestInscribedRect, "clearCache", a3, a4);
  -[AVPlaybackContentZoomingView _updateZoomScaling](self);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  uint64_t v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVPlaybackContentZoomingView frame](self, "frame");
  v10 = v8;
  v11 = v9;
  v12 = v8 < width;
  if (v9 <= height)
    v12 = 0;
  v14 = v8 > width && v9 < height || v12;
  v16.receiver = self;
  v16.super_class = (Class)AVPlaybackContentZoomingView;
  -[AVPlaybackContentZoomingView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  if (v10 != width || v11 != height)
    -[AVPlaybackContentZoomingView _updateMinMaxZoomScales:](self, "_updateMinMaxZoomScales:", v14);
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AVPlaybackContentZoomingView;
  -[AVPlaybackContentZoomingView willMoveToWindow:](&v7, sel_willMoveToWindow_, v4);
  -[AVPlaybackContentZoomingView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "_removeBoundingPathChangeObserver:", self);
  if (v4)
    -[AVPlaybackContentZoomingView setLastKnownWindow:](self, "setLastKnownWindow:", v4);

}

- (void)didMoveToWindow
{
  void *v3;
  id v4;

  -[AVPlaybackContentZoomingView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "_addBoundingPathChangeObserver:", self);
    v3 = v4;
  }

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AVPlaybackContentZoomingView;
  -[AVPlaybackContentZoomingView layoutSubviews](&v18, sel_layoutSubviews);
  -[AVPlaybackContentZoomingView activeContentView](self, "activeContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackContentZoomingView zoomScale](self, "zoomScale");
  -[AVPlaybackContentZoomingView _contentRectForScale:](self, "_contentRectForScale:");
  objc_msgSend(v3, "setFrame:");

  -[AVPlaybackContentZoomingView activeContentView](self, "activeContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackContentZoomingView activeContentView](self, "activeContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setVideoContentFrame:");

  -[AVPlaybackContentZoomingView _contentInsets](self, "_contentInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[AVPlaybackContentZoomingView contentInset](self, "contentInset");
  if (v9 != v17 || v7 != v14 || v13 != v16 || v11 != v15)
  {
    -[AVPlaybackContentZoomingView _contentInsets](self, "_contentInsets");
    -[AVPlaybackContentZoomingView setContentInset:](self, "setContentInset:");
  }
}

- (CGSize)_contentSizeForScale:(double)a3
{
  double *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BOOL4 v16;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  AVCacheLargestInscribedRectInBoundingPath *cacheLargestInscribedRect;
  void *v29;
  double v30;
  CGFloat x;
  double v32;
  CGFloat y;
  double v34;
  double width;
  double v36;
  double v37;
  _BOOL4 v38;
  double height;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  AVPlaybackContentZoomingView *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGAffineTransform v61;
  CGSize v62;
  CGSize result;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v5 = (double *)MEMORY[0x1E0C9D820];
  v6 = -[UIView avkit_hasFullScreenLayoutClass](self, "avkit_hasFullScreenLayoutClass");
  -[AVPlaybackContentZoomingView lastKnownWindow](self, "lastKnownWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || !v6)
  {

LABEL_29:
    -[AVPlaybackContentZoomingView contentAspectRatio](self, "contentAspectRatio");
    v41 = v40;
    v43 = v42;
    -[AVPlaybackContentZoomingView bounds](self, "bounds");
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v62.width = v41;
    v62.height = v43;
    v67.origin.x = v45;
    v67.origin.y = v47;
    v67.size.width = v49;
    v67.size.height = v51;
    v64 = AVMakeRectWithAspectRatioInsideRect(v62, v67);
    x = v64.origin.x;
    y = v64.origin.y;
    width = v64.size.width;
    height = v64.size.height;
    goto LABEL_30;
  }
  -[AVPlaybackContentZoomingView contentAspectRatio](self, "contentAspectRatio");
  v11 = v10;
  v12 = v10 - 1;
  v13 = ((v10 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;
  v16 = ((v9 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v9 >= 0
     || (unint64_t)(v9 - 1) < 0xFFFFFFFFFFFFFLL;

  v18 = (v11 < 0 || v13 > 0x3FE) && v12 > 0xFFFFFFFFFFFFELL;
  if (v18 || !v16)
    goto LABEL_29;
  -[AVPlaybackContentZoomingView contentAspectRatio](self, "contentAspectRatio");
  v20 = v19;
  -[AVPlaybackContentZoomingView contentAspectRatio](self, "contentAspectRatio");
  v22 = v20 / v21;
  if (-[UIView avkit_isCounterRotatedForTransition](self, "avkit_isCounterRotatedForTransition"))
    v22 = 1.0 / v22;
  -[AVPlaybackContentZoomingView lastKnownWindow](self, "lastKnownWindow");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  UIRectGetCenter();
  v25 = v24;
  v27 = v26;

  cacheLargestInscribedRect = self->_cacheLargestInscribedRect;
  -[AVPlaybackContentZoomingView lastKnownWindow](self, "lastKnownWindow");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVCacheLargestInscribedRectInBoundingPath getLargestInscribableRectForView:withCenter:aspectRatio:](cacheLargestInscribedRect, "getLargestInscribableRectForView:withCenter:aspectRatio:", v29, v25, v27, v22);
  x = v30;
  y = v32;
  width = v34;
  v37 = v36;

  v38 = -[UIView avkit_isCounterRotatedForTransition](self, "avkit_isCounterRotatedForTransition");
  if (v38)
    height = width;
  else
    height = v37;
  if (v38)
    width = v37;
LABEL_30:
  v52 = *v5;
  v53 = v5[1];
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  if (!CGRectIsInfinite(v65))
  {
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    if (!CGRectIsNull(v66))
    {
      v54 = self;
      UIPointRoundToViewScale();
      UISizeRoundToViewScale();
      v56 = v55;
      v58 = v57;

      CGAffineTransformMakeScale(&v61, a3, a3);
      v52 = v58 * v61.c + v61.a * v56;
      v53 = v58 * v61.d + v61.b * v56;
    }
  }
  v59 = v52;
  v60 = v53;
  result.height = v60;
  result.width = v59;
  return result;
}

- (CGRect)_contentRectForScale:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[AVPlaybackContentZoomingView _contentSizeForScale:](self, "_contentSizeForScale:", a3);
  v6 = v5;
  v8 = v7;
  v9 = v3;
  v10 = v4;
  result.size.height = v8;
  result.size.width = v6;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)_updateMinMaxZoomScales
{
  -[AVPlaybackContentZoomingView _updateMinMaxZoomScales:](self, "_updateMinMaxZoomScales:", 0);
}

- (void)_updateMinMaxZoomScales:(BOOL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat Width;
  CGFloat Height;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  -[AVPlaybackContentZoomingView _contentSizeForScale:](self, "_contentSizeForScale:", 1.0);
  v6 = v5;
  v8 = v7;
  v9 = 1.0;
  if (-[AVPlaybackContentZoomingView isZoomingEnabled](self, "isZoomingEnabled") && v6 > 0.0 && v8 > 0.0)
  {
    -[AVPlaybackContentZoomingView bounds](self, "bounds");
    Width = CGRectGetWidth(v22);
    v9 = (Width + Width) / v6;
    -[AVPlaybackContentZoomingView bounds](self, "bounds");
    Height = CGRectGetHeight(v23);
    v12 = (Height + Height) / v8;
    if (v9 < v12)
      v9 = v12;
    -[AVPlaybackContentZoomingView bounds](self, "bounds");
    v13 = CGRectGetWidth(v24);
    v14 = (v13 + v13) / v8;
    -[AVPlaybackContentZoomingView bounds](self, "bounds");
    v15 = CGRectGetHeight(v25);
    v16 = (v15 + v15) / v6;
    if (v14 >= v16)
      v16 = v14;
    if (v9 < v16)
      v9 = v16;
  }
  -[AVPlaybackContentZoomingView minimumZoomScale](self, "minimumZoomScale");
  if (v17 != 1.0)
    -[AVPlaybackContentZoomingView setMinimumZoomScale:](self, "setMinimumZoomScale:", 1.0);
  -[AVPlaybackContentZoomingView maximumZoomScale](self, "maximumZoomScale");
  if (v18 != v9)
  {
    -[AVPlaybackContentZoomingView zoomScale](self, "zoomScale");
    if (a3 || (v20 = v19, -[UIView avkit_isBeingDismissed](self, "avkit_isBeingDismissed")))
      v20 = 1.0;
    -[AVPlaybackContentZoomingView setMaximumZoomScale:](self, "setMaximumZoomScale:", v9);
    -[AVPlaybackContentZoomingView zoomScale](self, "zoomScale");
    if (v20 != v21)
      -[AVPlaybackContentZoomingView setZoomScale:](self, "setZoomScale:", v20);
  }
}

- (UIEdgeInsets)_contentInsets
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
  UIEdgeInsets result;

  -[AVPlaybackContentZoomingView zoomScale](self, "zoomScale");
  -[AVPlaybackContentZoomingView _contentSizeForScale:](self, "_contentSizeForScale:");
  v4 = v3;
  v6 = v5;
  -[AVPlaybackContentZoomingView bounds](self, "bounds");
  v8 = *MEMORY[0x1E0DC49E8];
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v11 = v10 - v4;
  if (v11 > 0.0)
    v9 = v11 * 0.5;
  v12 = v7 - v6;
  v13 = (v7 - v6) * 0.5;
  if (v12 > 0.0)
    v8 = v13;
  v14 = v8;
  v15 = v9;
  result.right = v15;
  result.bottom = v14;
  result.left = v9;
  result.top = v8;
  return result;
}

- (AVPlaybackContentContainerView)activeContentView
{
  return self->_activeContentView;
}

- (BOOL)isPlayingOnSecondScreen
{
  return self->_playingOnSecondScreen;
}

- (void)setPlayingOnSecondScreen:(BOOL)a3
{
  self->_playingOnSecondScreen = a3;
}

- (CGRect)videoContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_videoContentFrame.origin.x;
  y = self->_videoContentFrame.origin.y;
  width = self->_videoContentFrame.size.width;
  height = self->_videoContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVideoContentFrame:(CGRect)a3
{
  self->_videoContentFrame = a3;
}

- (BOOL)isZoomingEnabled
{
  return self->_zoomingEnabled;
}

- (CGSize)contentAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_contentAspectRatio.width;
  height = self->_contentAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (CGRect)previousBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousBounds.origin.x;
  y = self->_previousBounds.origin.y;
  width = self->_previousBounds.size.width;
  height = self->_previousBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousBounds:(CGRect)a3
{
  self->_previousBounds = a3;
}

- (UIWindow)lastKnownWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_lastKnownWindow);
}

- (AVCacheLargestInscribedRectInBoundingPath)cacheLargestInscribedRect
{
  return self->_cacheLargestInscribedRect;
}

- (void)setCacheLargestInscribedRect:(id)a3
{
  objc_storeStrong((id *)&self->_cacheLargestInscribedRect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheLargestInscribedRect, 0);
  objc_destroyWeak((id *)&self->_lastKnownWindow);
  objc_storeStrong((id *)&self->_activeContentView, 0);
}

- (void)_updateZoomScaling
{
  void *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "_updateMinMaxZoomScales");
    objc_msgSend(v1, "zoomScale");
    objc_msgSend(v1, "_contentSizeForScale:");
    objc_msgSend(v1, "setContentSize:");
    return (void *)objc_msgSend(v1, "setNeedsLayout");
  }
  return result;
}

uint64_t __51__AVPlaybackContentZoomingView_setLastKnownWindow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

@end
