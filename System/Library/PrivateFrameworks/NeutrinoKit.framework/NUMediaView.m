@implementation NUMediaView

- (CGRect)imageFrame
{
  void *v3;
  NUMediaViewRenderer *renderer;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[NUMediaView _geometry](self, "_geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");

  renderer = self->_renderer;
  NUPixelSizeToCGRect();
  -[NUMediaViewRenderer convertRect:fromImageToView:](renderer, "convertRect:fromImageToView:", self);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)_geometry
{
  return -[NURenderView geometry](self->_renderView, "geometry");
}

- (id)_renderView
{
  return self->_renderView;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  if (!-[NUMediaView loopsVideoPlayback](self, "loopsVideoPlayback", a3)
    && !-[NUMediaView isVideoPlayerVisible](self, "isVideoPlayerVisible")
    && !self->_scrollUpdatesSuppressed)
  {
    -[NUMediaView _updateRenderContent](self, "_updateRenderContent");
  }
  -[NUMediaView _updateScreenSpaceOverlay](self, "_updateScreenSpaceOverlay");
  -[NUMediaView _updateVisibleImageOverlayView](self, "_updateVisibleImageOverlayView");
  if (self->_delegateFlags.hasDidScroll)
  {
    -[NUMediaView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaViewDidScroll:", self);

  }
}

- (BOOL)loopsVideoPlayback
{
  void *v2;
  uint64_t v3;

  -[NUMediaView player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playbackMode");

  return v3 == 1;
}

- (NUMediaPlayer)player
{
  return (NUMediaPlayer *)self->_renderer;
}

- (void)_updateRenderContent
{
  void *v3;
  void *v4;
  NUMediaViewRenderer *renderer;
  id v6;

  if (!self->_transitionCount)
  {
    -[NUMediaView composition](self, "composition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[NUMediaView window](self, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {

LABEL_7:
        renderer = self->_renderer;
        -[NUMediaView composition](self, "composition");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        -[NUMediaViewRenderer updateComposition:](renderer, "updateComposition:", v6);

        return;
      }
      if (-[NUMediaView loopsVideoPlayback](self, "loopsVideoPlayback"))
        goto LABEL_7;
    }
  }
}

- (NUComposition)composition
{
  return -[NUMediaViewRenderer composition](self->_renderer, "composition");
}

- (BOOL)isVideoPlayerVisible
{
  return self->_videoPlayerVisible;
}

- (id)_scrollView
{
  return self->_scrollView;
}

- (void)_rendererDidFinishWithStatistics:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD *v9;
  os_log_t *v10;
  void *v11;
  os_log_t v12;
  double v13;
  double v14;
  CGSize *v15;
  BOOL v16;
  double v17;
  BOOL v18;
  double v19;
  void *v21;
  void *v22;
  id renderingCompletionBlock;
  void (**v24)(void);
  id v25;
  NSObject *v26;
  void *v27;
  CGFloat width;
  CGFloat height;
  NSObject *v30;
  void *v31;
  int v32;
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  CGSize v37;
  CGSize v38;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NURenderView frame](self->_renderView, "frame");
  v6 = v5;
  v8 = v7;
  v9 = (_QWORD *)MEMORY[0x24BE6C478];
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
  v10 = (os_log_t *)MEMORY[0x24BE6C488];
  v11 = (void *)*MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    v26 = v11;
    v37.width = v6;
    v37.height = v8;
    NSStringFromCGSize(v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 136315394;
    v33 = "-[NUMediaView _rendererDidFinishWithStatistics:]";
    v34 = 2112;
    v35 = v27;
    _os_log_debug_impl(&dword_20D1BC000, v26, OS_LOG_TYPE_DEBUG, "%s - setting scroll view content size: %@", (uint8_t *)&v32, 0x16u);

    if (*v9 != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
  }
  v12 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
  {
    width = self->_transitionTargetSize.width;
    height = self->_transitionTargetSize.height;
    v30 = v12;
    v38.width = width;
    v38.height = height;
    NSStringFromCGSize(v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 136315394;
    v33 = "-[NUMediaView _rendererDidFinishWithStatistics:]";
    v34 = 2112;
    v35 = v31;
    _os_log_debug_impl(&dword_20D1BC000, v30, OS_LOG_TYPE_DEBUG, "%s - transitionTargetSize:%@", (uint8_t *)&v32, 0x16u);

  }
  v13 = self->_transitionTargetSize.width;
  v14 = self->_transitionTargetSize.height;
  v15 = (CGSize *)MEMORY[0x24BDBF148];
  v16 = v13 == *MEMORY[0x24BDBF148] && v14 == *(double *)(MEMORY[0x24BDBF148] + 8);
  v17 = vabdd_f64(v6, v13);
  v18 = v16 || v17 > 2.0;
  v19 = vabdd_f64(v8, v14);
  if (!v18 && v19 <= 2.0)
  {
    -[NURenderView renderFrameReachedTargetSize](self->_renderView, "renderFrameReachedTargetSize", v19);
    self->_transitionTargetSize = *v15;
  }
  -[NUScrollView setContentSize:](self->_scrollView, "setContentSize:", v6, v8);
  -[NUMediaView _updateContentInsets](self, "_updateContentInsets");
  -[NUMediaView delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (self->_delegateFlags.hasDidFinishRenderingWithStatistics)
  {
    objc_msgSend(v21, "mediaViewDidFinishRendering:withStatistics:", self, v4);
  }
  else if (self->_delegateFlags.hasDidFinishRendering)
  {
    objc_msgSend(v21, "mediaViewDidFinishRendering:", self);
  }
  renderingCompletionBlock = self->_renderingCompletionBlock;
  if (renderingCompletionBlock)
  {
    v24 = (void (**)(void))objc_msgSend(renderingCompletionBlock, "copy");
    v24[2]();
    v25 = self->_renderingCompletionBlock;
    self->_renderingCompletionBlock = 0;

  }
  -[NUMediaView _updateScreenSpaceOverlay](self, "_updateScreenSpaceOverlay");
  -[NUMediaView _updateVisibleImageOverlayView](self, "_updateVisibleImageOverlayView");

}

- (void)_updateContentInsets
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
  BOOL v17;
  void *v19;
  NUScrollView *scrollView;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 centerContent;
  int v26;
  NUScrollView *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;
  CGSize v37;
  UIEdgeInsets v38;

  v36 = *MEMORY[0x24BDAC8D0];
  -[NUScrollView frame](self->_scrollView, "frame");
  -[NUScrollView contentSize](self->_scrollView, "contentSize");
  -[NUMediaView _edgeInsetsForContentSize:inFrame:](self, "_edgeInsetsForContentSize:inFrame:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NUScrollView contentInset](self->_scrollView, "contentInset");
  v17 = v14 == v6 && v11 == v4 && v13 == v10 && v12 == v8;
  if (!v17
    && !self->_transitionCount
    && self->_transitionTargetSize.width == *MEMORY[0x24BDBF148]
    && self->_transitionTargetSize.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
    v19 = (void *)*MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
    {
      scrollView = self->_scrollView;
      v21 = v19;
      v38.top = v4;
      v38.left = v6;
      v38.bottom = v8;
      v38.right = v10;
      NSStringFromUIEdgeInsets(v38);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUScrollView contentSize](self->_scrollView, "contentSize");
      NSStringFromCGSize(v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromUIEdgeInsets(self->_edgeInsets);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      centerContent = self->_centerContent;
      v26 = 134219010;
      v27 = scrollView;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      v34 = 1024;
      v35 = centerContent;
      _os_log_debug_impl(&dword_20D1BC000, v21, OS_LOG_TYPE_DEBUG, "-[NUMediaView _updateContentInsets] on scrollview %p %@, content size = %@; internal edge insets: %@; center content: %d",
        (uint8_t *)&v26,
        0x30u);

    }
    -[NUScrollView setContentInset:](self->_scrollView, "setContentInset:", v4, v6, v8, v10);
  }
}

- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 inFrame:(CGRect)a4 alwaysCenterContent:(BOOL)a5
{
  _BOOL8 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  v5 = a5 || self->_centerContent;
  objc_msgSend((id)objc_opt_class(), "_proposedInsetsForInsets:contentSize:inFrame:centerContent:", v5, self->_edgeInsets.top, self->_edgeInsets.left, self->_edgeInsets.bottom, self->_edgeInsets.right, a3.width, a3.height, *(_QWORD *)&a4.origin.x, *(_QWORD *)&a4.origin.y, *(_QWORD *)&a4.size.width, *(_QWORD *)&a4.size.height);
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

+ (UIEdgeInsets)_proposedInsetsForInsets:(UIEdgeInsets)a3 contentSize:(CGSize)a4 inFrame:(CGRect)a5 centerContent:(BOOL)a6
{
  CGFloat right;
  double bottom;
  double left;
  double top;
  double MinX;
  double MinY;
  CGFloat Height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;
  UIEdgeInsets v48;
  UIEdgeInsets v49;
  UIEdgeInsets v50;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v47 = *MEMORY[0x24BDAC8D0];
  if (CGRectIsEmpty(a5))
  {
    top = *MEMORY[0x24BDF7718];
    left = *(double *)(MEMORY[0x24BDF7718] + 8);
    bottom = *(double *)(MEMORY[0x24BDF7718] + 16);
    right = *(double *)(MEMORY[0x24BDF7718] + 24);
    goto LABEL_28;
  }
  if (a6)
  {
    v36 = right;
    MinX = CGRectGetMinX(a5);
    v34 = MinX + (CGRectGetWidth(a5) - a4.width) * 0.5;
    MinY = CGRectGetMinY(a5);
    Height = CGRectGetHeight(a5);
    v14 = fmax(v34, 0.0);
    v15 = fmax(MinY + (Height - a4.height) * 0.5, 0.0);
    v16 = v15 + v15 - bottom;
    if (bottom > v15)
      v17 = bottom;
    else
      v17 = v15;
    if (bottom <= v15)
      v16 = v15;
    if (top > v15)
      v18 = v15 + v15 - top;
    else
      v18 = v17;
    if (top > v15)
      v19 = top;
    else
      v19 = v16;
    v33 = v18;
    v35 = v19;
    if (left <= v14)
    {
      v20 = v36;
      if (v36 <= v14)
      {
        v32 = v14;
      }
      else
      {
        v32 = v14 + v14 - v36;
        v14 = v36;
      }
    }
    else
    {
      v14 = v14 + v14 - left;
      v32 = left;
      v20 = v36;
    }
    v37 = v14;
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
    v24 = (void *)*MEMORY[0x24BE6C488];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
    {
      top = v35;
      right = v37;
      left = v32;
      bottom = v33;
      goto LABEL_28;
    }
    v22 = v24;
    v49.top = top;
    v49.left = left;
    v49.bottom = bottom;
    v49.right = v20;
    NSStringFromUIEdgeInsets(v49);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCGSize(a4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCGRect(a5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    bottom = v33;
    top = v35;
    v50.top = v35;
    left = v32;
    v50.left = v32;
    v50.bottom = v33;
    right = v37;
    v50.right = v37;
    NSStringFromUIEdgeInsets(v50);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v40 = v23;
    v41 = 2112;
    v42 = v29;
    v43 = 2112;
    v44 = v30;
    v45 = 2112;
    v46 = v31;
    _os_log_debug_impl(&dword_20D1BC000, v22, OS_LOG_TYPE_DEBUG, "+[NUMediaView _proposedInsetsForInsets:contentSize:inFrame:centerContent:] - content is centered. input insets: %@  content size: %@ inFrame: %@ result insets: %@", buf, 0x2Au);

LABEL_30:
    goto LABEL_28;
  }
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
  v21 = (void *)*MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    v22 = v21;
    v48.top = top;
    v48.left = left;
    v48.bottom = bottom;
    v48.right = right;
    NSStringFromUIEdgeInsets(v48);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v23;
    _os_log_debug_impl(&dword_20D1BC000, v22, OS_LOG_TYPE_DEBUG, "+[NUMediaView _proposedInsetsForInsets:contentSize:inFrame:centerContent:] - content is not centered, so returning input insets: %@", buf, 0xCu);
    goto LABEL_30;
  }
LABEL_28:
  v25 = top;
  v26 = left;
  v27 = bottom;
  v28 = right;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (id)_livePhotoView
{
  UIView *v3;
  UIView *livePhotoView;
  void *v5;
  id v6;
  void *v7;

  if (!self->_livePhotoView && (objc_msgSend(MEMORY[0x24BE6C3A0], "mediaViewDisableLivePhoto") & 1) == 0)
  {
    v3 = (UIView *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("PHLivePhotoView"))), "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    livePhotoView = self->_livePhotoView;
    self->_livePhotoView = v3;

    if (objc_msgSend(MEMORY[0x24BE6C3A0], "isViewDebugEnabled"))
    {
      -[UIView layer](self->_livePhotoView, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "redColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

      -[UIView layer](self->_livePhotoView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBorderWidth:", 8.0);

    }
  }
  return self->_livePhotoView;
}

- (void)setScrollUpdatesSuppressed:(BOOL)a3
{
  self->_scrollUpdatesSuppressed = a3;
}

- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 inFrame:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[NUMediaView _edgeInsetsForContentSize:inFrame:alwaysCenterContent:](self, "_edgeInsetsForContentSize:inFrame:alwaysCenterContent:", 0, a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (NUMediaViewDelegate)delegate
{
  return (NUMediaViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setComposition:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "mediaType") == 2)
  {
    -[NUMediaViewRenderer composition](self->_renderer, "composition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }
  -[NUMediaViewRenderer setComposition:](self->_renderer, "setComposition:", v7);
  -[NUMediaView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v5)
      -[PFCoalescer update](self->_renderCoalescer, "update");
    else
      -[NUMediaView _updateRenderContent](self, "_updateRenderContent");
  }

}

- (void)_stopVideoPlayback
{
  id v2;

  -[NUMediaView player](self, "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)NUMediaView;
  -[NUMediaView layoutSubviews](&v3, sel_layoutSubviews);
  -[NUMediaView frame](self, "frame");
  if (!CGRectIsEmpty(v4))
    -[NUMediaView _updateContentInsets](self, "_updateContentInsets");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  NUMediaViewRenderer *renderer;
  void *v7;
  void *v8;
  void *v9;
  NUMediaViewRenderer *v10;
  void *v11;
  NUMediaViewRenderer *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NUMediaView;
  -[NUMediaView didMoveToWindow](&v14, sel_didMoveToWindow);
  -[NUMediaView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NUMediaView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    renderer = self->_renderer;
    objc_msgSend(v5, "scale");
    -[NUMediaViewRenderer setBackingScale:](renderer, "setBackingScale:");
    objc_msgSend(MEMORY[0x24BE6C3E0], "currentPlatform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_displayID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = self->_renderer;
    objc_msgSend(v9, "pixelFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUMediaViewRenderer setPixelFormat:](v10, "setPixelFormat:", v11);

    v12 = self->_renderer;
    objc_msgSend(v9, "colorSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUMediaViewRenderer setColorSpace:](v12, "setColorSpace:", v13);

    if (-[NUMediaView isHDREnabled](self, "isHDREnabled"))
    {
      +[NUMediaView maximumEDRHeadroomForScreen:](NUMediaView, "maximumEDRHeadroomForScreen:", v5);
      -[NUMediaViewRenderer setDisplayMaximumEDRHeadroom:](self->_renderer, "setDisplayMaximumEDRHeadroom:");
      +[NUMediaView currentEDRHeadroomForScreen:](NUMediaView, "currentEDRHeadroomForScreen:", v5);
      -[NUMediaViewRenderer setDisplayCurrentEDRHeadroom:](self->_renderer, "setDisplayCurrentEDRHeadroom:");
      -[NUMediaView _scheduleDisplayEDRHeadroomMonitor](self, "_scheduleDisplayEDRHeadroomMonitor");
    }
    -[NUMediaView _updateRenderContent](self, "_updateRenderContent");

  }
}

- (void)_beginTransition
{
  ++self->_transitionCount;
}

- (NUMediaView)initWithFrame:(CGRect)a3
{
  NUMediaView *v3;
  NUMediaView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUMediaView;
  v3 = -[NUMediaView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NUMediaView _setupViews](v3, "_setupViews");
  return v4;
}

- (void)_setupViews
{
  NURenderView *v3;
  NURenderView *renderView;
  NUScrollView *v5;
  NUScrollView *scrollView;
  NUMediaViewRenderer *v7;
  NUMediaViewRenderer *renderer;
  NUScrollView *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _NUMediaScreenSpaceOverlayView *v16;
  _NUMediaScreenSpaceOverlayView *screenSpaceOverlayView;
  NSLayoutYAxisAnchor *v18;
  NSLayoutYAxisAnchor *imageTopAnchor;
  NSLayoutYAxisAnchor *v20;
  NSLayoutYAxisAnchor *imageBottomAnchor;
  NSLayoutXAxisAnchor *v22;
  NSLayoutXAxisAnchor *imageLeftAnchor;
  NSLayoutXAxisAnchor *v24;
  NSLayoutXAxisAnchor *imageRightAnchor;
  _NUMediaVisibleImageOverlayView *v26;
  _NUMediaVisibleImageOverlayView *visibleImageOverlayView;
  PFCoalescer *v28;
  PFCoalescer *renderCoalescer;

  objc_msgSend(MEMORY[0x24BE6C3A0], "isViewDebugEnabled");
  v3 = (NURenderView *)objc_opt_new();
  renderView = self->_renderView;
  self->_renderView = v3;

  v5 = (NUScrollView *)objc_opt_new();
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  self->_centerContent = 1;
  self->_alwaysBounceScrollView = 1;
  v7 = -[NUMediaViewRenderer initWithMediaView:]([NUMediaViewRenderer alloc], "initWithMediaView:", self);
  renderer = self->_renderer;
  self->_renderer = v7;

  -[NUScrollView setAutoresizingMask:](self->_scrollView, "setAutoresizingMask:", 18);
  -[NUScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[NUScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 1);
  -[NUScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[NUScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[NUScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", self->_alwaysBounceScrollView);
  -[NUScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", self->_alwaysBounceScrollView);
  -[NUScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 0);
  -[NUScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
  v9 = self->_scrollView;
  -[NUMediaView bounds](self, "bounds");
  -[NUScrollView setFrame:](v9, "setFrame:");
  -[NUScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", 1.0);
  -[NUScrollView setZoomScale:](self->_scrollView, "setZoomScale:", 1.0);
  if (objc_msgSend(MEMORY[0x24BE6C3A0], "isViewDebugEnabled"))
  {
    -[NUScrollView layer](self->_scrollView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderWidth:", 4.0);

    -[NUScrollView layer](self->_scrollView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "setBorderColor:", objc_msgSend(v12, "CGColor"));

    -[NUMediaView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBorderWidth:", 1.0);

    -[NUMediaView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

  }
  -[NUMediaView addSubview:](self, "addSubview:", self->_scrollView);
  -[NUMediaView setNeedsLayout](self, "setNeedsLayout");
  -[NURenderView setUserInteractionEnabled:](self->_renderView, "setUserInteractionEnabled:", 1);
  -[NUScrollView addSubview:](self->_scrollView, "addSubview:", self->_renderView);
  v16 = (_NUMediaScreenSpaceOverlayView *)objc_opt_new();
  screenSpaceOverlayView = self->_screenSpaceOverlayView;
  self->_screenSpaceOverlayView = v16;

  -[NUMediaView addSubview:](self, "addSubview:", self->_screenSpaceOverlayView);
  -[_NUMediaScreenSpaceOverlayView setUserInteractionEnabled:](self->_screenSpaceOverlayView, "setUserInteractionEnabled:", 0);
  -[_NUMediaScreenSpaceOverlayView topAnchor](self->_screenSpaceOverlayView, "topAnchor");
  v18 = (NSLayoutYAxisAnchor *)objc_claimAutoreleasedReturnValue();
  imageTopAnchor = self->_imageTopAnchor;
  self->_imageTopAnchor = v18;

  -[_NUMediaScreenSpaceOverlayView bottomAnchor](self->_screenSpaceOverlayView, "bottomAnchor");
  v20 = (NSLayoutYAxisAnchor *)objc_claimAutoreleasedReturnValue();
  imageBottomAnchor = self->_imageBottomAnchor;
  self->_imageBottomAnchor = v20;

  -[_NUMediaScreenSpaceOverlayView leftAnchor](self->_screenSpaceOverlayView, "leftAnchor");
  v22 = (NSLayoutXAxisAnchor *)objc_claimAutoreleasedReturnValue();
  imageLeftAnchor = self->_imageLeftAnchor;
  self->_imageLeftAnchor = v22;

  -[_NUMediaScreenSpaceOverlayView rightAnchor](self->_screenSpaceOverlayView, "rightAnchor");
  v24 = (NSLayoutXAxisAnchor *)objc_claimAutoreleasedReturnValue();
  imageRightAnchor = self->_imageRightAnchor;
  self->_imageRightAnchor = v24;

  v26 = (_NUMediaVisibleImageOverlayView *)objc_opt_new();
  visibleImageOverlayView = self->_visibleImageOverlayView;
  self->_visibleImageOverlayView = v26;

  -[NUMediaView addSubview:](self, "addSubview:", self->_visibleImageOverlayView);
  -[_NUMediaVisibleImageOverlayView setUserInteractionEnabled:](self->_visibleImageOverlayView, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x24BE71B88], "coalescerWithLabel:target:queue:action:", CFSTR("NUMediaViewRenderer._renderCoalescer"), self, MEMORY[0x24BDAC9B8], &__block_literal_global_77);
  v28 = (PFCoalescer *)objc_claimAutoreleasedReturnValue();
  renderCoalescer = self->_renderCoalescer;
  self->_renderCoalescer = v28;

}

- (NUMediaView)initWithCoder:(id)a3
{
  NUMediaView *v3;
  NUMediaView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUMediaView;
  v3 = -[NUMediaView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[NUMediaView _setupViews](v3, "_setupViews");
  return v4;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $78B3FAAEA73F7C8B40E5703343F09BD2 *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->hasDidFinishRendering = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidFinishRenderingWithStatistics = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidZoom = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasWillBeginZooming = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidEndZooming = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasWillBeginDragging = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidEndDragging = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidEndDecelerating = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidScroll = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidUpdateLivePhoto = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasIsReadyForVideoPlayback = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidStartPreparingVideo = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidFinishPreparingVideo = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidPlayToEnd = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasFailedToPlayToEnd = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasWillBeginLivePhotoPlayback = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->hasDidEndLivePhotoPlayback = objc_opt_respondsToSelector() & 1;
  }

}

- (void)_scheduleDisplayEDRHeadroomMonitor
{
  CADisplayLink *v3;
  CADisplayLink *displayEDRMonitorLink;
  CADisplayLink *v5;
  id v6;
  CAFrameRateRange v7;

  if (!self->_displayEDRMonitorLink)
  {
    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel__monitorDisplayEDRHeadroom_);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayEDRMonitorLink = self->_displayEDRMonitorLink;
    self->_displayEDRMonitorLink = v3;

    v7 = CAFrameRateRangeMake(1.0, 60.0, 10.0);
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayEDRMonitorLink, "setPreferredFrameRateRange:", *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);
    v5 = self->_displayEDRMonitorLink;
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x24BDBCB80]);

  }
}

- (void)_monitorDisplayEDRHeadroom:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[NUMediaView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[NUMediaView currentEDRHeadroomForScreen:](NUMediaView, "currentEDRHeadroomForScreen:", v5);
  v7 = v6;
  -[NUMediaViewRenderer displayCurrentEDRHeadroom](self->_renderer, "displayCurrentEDRHeadroom");
  v9 = v8;
  if (vabdd_f64(v7, v8) > 0.01)
  {
    if (-[NUMediaViewRenderer canUpdateDisplayHeadroom](self->_renderer, "canUpdateDisplayHeadroom"))
    {
      if (*MEMORY[0x24BE6C478] != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
      v10 = *MEMORY[0x24BE6C488];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134218240;
        v13 = v9;
        v14 = 2048;
        v15 = v7;
        _os_log_impl(&dword_20D1BC000, v10, OS_LOG_TYPE_DEFAULT, "EDR headroom change %0.3f -> %0.3f", (uint8_t *)&v12, 0x16u);
      }
      -[NUMediaViewRenderer setDisplayCurrentEDRHeadroom:](self->_renderer, "setDisplayCurrentEDRHeadroom:", v7);
      -[NUMediaView _updateRenderContent](self, "_updateRenderContent");
    }
    else
    {
      if (*MEMORY[0x24BE6C478] != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
      v11 = *MEMORY[0x24BE6C488];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134218240;
        v13 = v9;
        v14 = 2048;
        v15 = v7;
        _os_log_impl(&dword_20D1BC000, v11, OS_LOG_TYPE_DEFAULT, "EDR headroom change %0.3f -> %0.3f - scrubbing in progress, so not changing the headroom yet", (uint8_t *)&v12, 0x16u);
      }
    }
  }

}

- (void)_invalidateDisplayEDRHeadroomMonitor
{
  CADisplayLink *displayEDRMonitorLink;
  CADisplayLink *v4;

  displayEDRMonitorLink = self->_displayEDRMonitorLink;
  if (displayEDRMonitorLink)
  {
    -[CADisplayLink invalidate](displayEDRMonitorLink, "invalidate");
    v4 = self->_displayEDRMonitorLink;
    self->_displayEDRMonitorLink = 0;

  }
}

- (void)willMoveToWindow:(id)a3
{
  NSTimer *displayEDRMonitorTimer;
  NSTimer *v5;
  CADisplayLink *displayEDRMonitorLink;
  CADisplayLink *v7;
  id v8;

  v8 = a3;
  displayEDRMonitorTimer = self->_displayEDRMonitorTimer;
  if (displayEDRMonitorTimer)
  {
    -[NSTimer invalidate](displayEDRMonitorTimer, "invalidate");
    v5 = self->_displayEDRMonitorTimer;
    self->_displayEDRMonitorTimer = 0;

  }
  displayEDRMonitorLink = self->_displayEDRMonitorLink;
  if (displayEDRMonitorLink)
  {
    -[CADisplayLink invalidate](displayEDRMonitorLink, "invalidate");
    v7 = self->_displayEDRMonitorLink;
    self->_displayEDRMonitorLink = 0;

  }
}

- (void)setZoomScale:(double)a3
{
  -[NUScrollView setZoomScale:](self->_scrollView, "setZoomScale:", a3);
  -[NUMediaView _updateRenderContent](self, "_updateRenderContent");
}

- (void)setZoomScaleToFit
{
  void *v3;
  char v4;

  -[NUMediaView _renderer](self, "_renderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isZoomedToFit");

  if ((v4 & 1) == 0)
  {
    -[NUMediaView minimumZoomScale](self, "minimumZoomScale");
    -[NUMediaView setZoomScale:](self, "setZoomScale:");
  }
}

- (double)zoomScale
{
  double result;

  -[NUScrollView zoomScale](self->_scrollView, "zoomScale");
  return result;
}

- (void)setMaximumZoomScale:(double)a3
{
  -[NUMediaViewRenderer setMaximumZoomScale:](self->_renderer, "setMaximumZoomScale:", a3);
  -[NUMediaView _updateRenderContent](self, "_updateRenderContent");
}

- (double)maximumZoomScale
{
  double result;

  -[NUScrollView maximumZoomScale](self->_scrollView, "maximumZoomScale");
  return result;
}

- (void)setMinimumZoomScale:(double)a3
{
  -[NUScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", a3);
  -[NUMediaView _updateRenderContent](self, "_updateRenderContent");
}

- (double)minimumZoomScale
{
  double result;

  -[NUScrollView minimumZoomScale](self->_scrollView, "minimumZoomScale");
  return result;
}

- (void)setZoomScale:(double)a3 animated:(BOOL)a4
{
  -[NUScrollView setZoomScale:animated:](self->_scrollView, "setZoomScale:animated:", a4, a3);
}

- (void)zoomToRect:(CGRect)a3 animated:(BOOL)a4
{
  -[NUScrollView zoomToRect:animated:](self->_scrollView, "zoomToRect:animated:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setAlwaysBounceScrollView:(BOOL)a3
{
  self->_alwaysBounceScrollView = a3;
  -[NUScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:");
  -[NUScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", self->_alwaysBounceScrollView);
}

- (void)setScrollEnabled:(BOOL)a3
{
  -[NUScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", a3);
}

- (BOOL)scrollEnabled
{
  return -[NUScrollView isScrollEnabled](self->_scrollView, "isScrollEnabled");
}

- (BOOL)isReady
{
  return -[NUMediaViewRenderer isReady](self->_renderer, "isReady");
}

- (id)_imageLayer
{
  return -[NURenderView _backfillLayer](self->_renderView, "_backfillLayer");
}

- (void)setAngle:(double)a3
{
  void *v4;
  CATransform3D v5;
  CATransform3D v6;

  memset(&v6, 0, sizeof(v6));
  CATransform3DMakeRotation(&v6, a3, 0.0, 0.0, 1.0);
  -[NURenderView _containerLayer](self->_renderView, "_containerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  objc_msgSend(v4, "setTransform:", &v5);

}

- (CGSize)_imageSize
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  CGSize v15;
  CGSize result;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NURenderView _containerLayer](self->_renderView, "_containerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
  v7 = (void *)*MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    v10 = v7;
    v15.width = v4;
    v15.height = v6;
    NSStringFromCGSize(v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_debug_impl(&dword_20D1BC000, v10, OS_LOG_TYPE_DEBUG, "-[NUMediaView _imageSize]: %@", (uint8_t *)&v12, 0xCu);

  }
  v8 = v4;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGPoint)convertPointToImage:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[NUMediaViewRenderer convertPoint:toImageFromView:](self->_renderer, "convertPoint:toImageFromView:", self, a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)convertPointFromImage:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[NUMediaViewRenderer convertPoint:fromImageToView:](self->_renderer, "convertPoint:fromImageToView:", self, a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)convertRectToImage:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[NUMediaViewRenderer convertRect:toImageFromView:](self->_renderer, "convertRect:toImageFromView:", self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)convertRectFromImage:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[NUMediaViewRenderer convertRect:fromImageToView:](self->_renderer, "convertRect:fromImageToView:", self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4 toSpace:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  double v21;
  double v22;
  uint64_t *v23;
  os_log_t *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  os_log_t v30;
  void *specific;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  os_log_t v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  const void **v45;
  void *v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  NUMediaView *v56;
  SEL v57;
  id v58;
  id v59;
  CGPoint v60;
  id v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;
  CGPoint v68;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v67 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  -[NUMediaView _geometry](self, "_geometry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v23 = (uint64_t *)MEMORY[0x24BE6C478];
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_392);
    v24 = (os_log_t *)MEMORY[0x24BE6C468];
    v25 = (void *)*MEMORY[0x24BE6C468];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C468], OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)MEMORY[0x24BDD17C8];
      v27 = v25;
      objc_msgSend(v26, "stringWithFormat:", CFSTR("Converting point before geometry is valid"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v28;
      _os_log_impl(&dword_20D1BC000, v27, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v29 = *v23;
      if (dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
      {
        if (v29 != -1)
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_392);
LABEL_13:
        v30 = *v24;
        if (os_log_type_enabled(*v24, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
          v32 = (void *)MEMORY[0x24BDD17F0];
          v33 = specific;
          v34 = v30;
          objc_msgSend(v32, "callStackSymbols");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v64 = specific;
          v65 = 2114;
          v66 = v36;
          _os_log_error_impl(&dword_20D1BC000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_21:
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (v29 != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_392);
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
    {
      goto LABEL_13;
    }
    v37 = *v24;
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_ERROR))
    {
      v40 = (void *)MEMORY[0x24BDD17F0];
      v34 = v37;
      objc_msgSend(v40, "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v42;
      _os_log_error_impl(&dword_20D1BC000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_21;
    }
LABEL_18:
    _NUAssertContinueHandler();
    goto LABEL_19;
  }
  -[NUMediaView convertPoint:fromView:](self, "convertPoint:fromView:", v9, x, y);
  -[NUMediaView convertPointToImage:](self, "convertPointToImage:");
  v13 = v12;
  v15 = v14;
  -[NUMediaView _imageSize](self, "_imageSize");
  v17 = v16;
  v62 = 0;
  objc_msgSend(v11, "transformWithSourceSpace:destinationSpace:error:", CFSTR("/Image"), v10, &v62);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v62;
  if (v18
    || objc_msgSend(v10, "isEqualToString:", CFSTR("/masterSpace"))
    && (v61 = 0,
        objc_msgSend(v11, "transformWithSourceSpace:destinationSpace:error:", CFSTR("/Image"), CFSTR("/Master/Source"), &v61), v18 = (void *)objc_claimAutoreleasedReturnValue(), v20 = v61, v19, v19 = v20, v18))
  {
    objc_msgSend(v18, "transformPoint:", v13, v17 - v15);
    x = v21;
    y = v22;

LABEL_19:
    v38 = x;
    v39 = y;
    goto LABEL_30;
  }
  NUAssertLogger();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot establish a mapping from space %@ to space %@: %@"), CFSTR("/Image"), v10, v19);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v64 = v44;
    _os_log_error_impl(&dword_20D1BC000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v45 = (const void **)MEMORY[0x24BE6C280];
  v46 = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
  NUAssertLogger();
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
  if (v46)
  {
    if (v48)
    {
      v51 = dispatch_get_specific(*v45);
      v52 = (void *)MEMORY[0x24BDD17F0];
      v53 = v51;
      objc_msgSend(v52, "callStackSymbols");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v51;
      v65 = 2114;
      v66 = v55;
      _os_log_error_impl(&dword_20D1BC000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else if (v48)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v64 = v50;
    _os_log_error_impl(&dword_20D1BC000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  v56 = (NUMediaView *)_NUAssertFailHandler();
  v60 = -[NUMediaView convertPoint:fromSpace:toView:](v56, v57, v68, v58, v59);
  v39 = v60.y;
  v38 = v60.x;
LABEL_30:
  result.y = v39;
  result.x = v38;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromSpace:(id)a4 toView:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t *v23;
  os_log_t *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  os_log_t v30;
  void *specific;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  os_log_t v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  const void **v45;
  void *v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  NUMediaView *v56;
  SEL v57;
  id v58;
  CGPoint v59;
  id v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;
  CGPoint v67;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v66 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  -[NUMediaView _geometry](self, "_geometry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v23 = (uint64_t *)MEMORY[0x24BE6C478];
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_392);
    v24 = (os_log_t *)MEMORY[0x24BE6C468];
    v25 = (void *)*MEMORY[0x24BE6C468];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C468], OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)MEMORY[0x24BDD17C8];
      v27 = v25;
      objc_msgSend(v26, "stringWithFormat:", CFSTR("Converting point before geometry is valid"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v28;
      _os_log_impl(&dword_20D1BC000, v27, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v29 = *v23;
      if (dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
      {
        if (v29 != -1)
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_392);
LABEL_13:
        v30 = *v24;
        if (os_log_type_enabled(*v24, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
          v32 = (void *)MEMORY[0x24BDD17F0];
          v33 = specific;
          v34 = v30;
          objc_msgSend(v32, "callStackSymbols");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v63 = specific;
          v64 = 2114;
          v65 = v36;
          _os_log_error_impl(&dword_20D1BC000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_21:
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (v29 != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_392);
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
    {
      goto LABEL_13;
    }
    v37 = *v24;
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_ERROR))
    {
      v40 = (void *)MEMORY[0x24BDD17F0];
      v34 = v37;
      objc_msgSend(v40, "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v42;
      _os_log_error_impl(&dword_20D1BC000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_21;
    }
LABEL_18:
    _NUAssertContinueHandler();
    goto LABEL_19;
  }
  v61 = 0;
  objc_msgSend(v11, "transformWithSourceSpace:destinationSpace:error:", v9, CFSTR("/Image"), &v61);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v61;
  if (v13
    || objc_msgSend(v9, "isEqualToString:", CFSTR("/masterSpace"))
    && (v60 = 0,
        objc_msgSend(v12, "transformWithSourceSpace:destinationSpace:error:", CFSTR("/Master/Source"), CFSTR("/Image"), &v60), v13 = (void *)objc_claimAutoreleasedReturnValue(), v15 = v60, v14, v14 = v15, v13))
  {
    objc_msgSend(v13, "transformPoint:", x, y);
    v17 = v16;
    v19 = v18;
    -[NUMediaView _imageSize](self, "_imageSize");
    -[NUMediaView convertPointFromImage:](self, "convertPointFromImage:", v17, v20 - v19);
    objc_msgSend(v10, "convertPoint:fromView:", self);
    x = v21;
    y = v22;

LABEL_19:
    v38 = x;
    v39 = y;
    goto LABEL_30;
  }
  NUAssertLogger();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot establish a mapping from space %@ to space %@: %@"), v9, CFSTR("/Image"), v14);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v63 = v44;
    _os_log_error_impl(&dword_20D1BC000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v45 = (const void **)MEMORY[0x24BE6C280];
  v46 = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
  NUAssertLogger();
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
  if (v46)
  {
    if (v48)
    {
      v51 = dispatch_get_specific(*v45);
      v52 = (void *)MEMORY[0x24BDD17F0];
      v53 = v51;
      objc_msgSend(v52, "callStackSymbols");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v51;
      v64 = 2114;
      v65 = v55;
      _os_log_error_impl(&dword_20D1BC000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else if (v48)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v63 = v50;
    _os_log_error_impl(&dword_20D1BC000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  v56 = (NUMediaView *)_NUAssertFailHandler();
  v59 = -[NUMediaView convertPoint:toNormalizedYDownSourceSpaceFromView:](v56, v57, v67, v58);
  v39 = v59.y;
  v38 = v59.x;
LABEL_30:
  result.y = v39;
  result.x = v38;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toNormalizedYDownSourceSpaceFromView:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t *v14;
  os_log_t *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  os_log_t v21;
  void *specific;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  os_log_t v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[NUMediaView _masterSizeWithoutGeometry](self, "_masterSizeWithoutGeometry");
  if (v8 <= 0.0 || (v10 = v9, v9 <= 0.0))
  {
    v14 = (uint64_t *)MEMORY[0x24BE6C478];
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_392);
    v15 = (os_log_t *)MEMORY[0x24BE6C468];
    v16 = (void *)*MEMORY[0x24BE6C468];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C468], OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      v18 = v16;
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Invalid masterSize"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v19;
      _os_log_impl(&dword_20D1BC000, v18, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&v34, 0xCu);

      v20 = *v14;
      if (dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
      {
        if (v20 != -1)
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_392);
LABEL_11:
        v21 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
          v23 = (void *)MEMORY[0x24BDD17F0];
          v24 = specific;
          v25 = v21;
          objc_msgSend(v23, "callStackSymbols");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = specific;
          v36 = 2114;
          v37 = v27;
          _os_log_error_impl(&dword_20D1BC000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v34, 0x16u);

LABEL_19:
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v20 != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_392);
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
    {
      goto LABEL_11;
    }
    v28 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)MEMORY[0x24BDD17F0];
      v25 = v28;
      objc_msgSend(v31, "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v33;
      _os_log_error_impl(&dword_20D1BC000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v34, 0xCu);

      goto LABEL_19;
    }
LABEL_16:
    _NUAssertContinueHandler();
    goto LABEL_17;
  }
  v11 = v8;
  -[NUMediaView convertPoint:fromView:toSpace:](self, "convertPoint:fromView:toSpace:", v7, CFSTR("/masterSpace"), x, y);
  x = v12 / v11;
  y = 1.0 - v13 / v10;
LABEL_17:

  v29 = x;
  v30 = y;
  result.y = v30;
  result.x = v29;
  return result;
}

- (CGRect)convertNormalizedViewRect:(CGRect)a3 fromSpace:(id)a4
{
  id v5;
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

  v5 = a4;
  -[NUMediaView _masterSizeWithoutGeometry](self, "_masterSizeWithoutGeometry");
  NURectDenormalize();
  -[NUMediaView convertViewRect:fromSpace:](self, "convertViewRect:fromSpace:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

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

- (CGRect)convertViewRect:(CGRect)a3 fromSpace:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  double MaxY;
  double MaxX;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
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
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  NSObject *v60;
  void *v61;
  const void **v62;
  void *specific;
  NSObject *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  double v73;
  double MinY;
  double MinX;
  id v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect result;
  CGRect v93;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v81 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  -[NUMediaView _geometry](self, "_geometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v82.origin.x = x;
    v82.origin.y = y;
    v82.size.width = width;
    v82.size.height = height;
    MinX = CGRectGetMinX(v82);
    v83.origin.x = x;
    v83.origin.y = y;
    v83.size.width = width;
    v83.size.height = height;
    MinY = CGRectGetMinY(v83);
    v84.origin.x = x;
    v84.origin.y = y;
    v84.size.width = width;
    v84.size.height = height;
    v73 = CGRectGetMinX(v84);
    v85.origin.x = x;
    v85.origin.y = y;
    v85.size.width = width;
    v85.size.height = height;
    MaxY = CGRectGetMaxY(v85);
    v86.origin.x = x;
    v86.origin.y = y;
    v86.size.width = width;
    v86.size.height = height;
    MaxX = CGRectGetMaxX(v86);
    v87.origin.x = x;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    v13 = CGRectGetMinY(v87);
    v88.origin.x = x;
    v88.origin.y = y;
    v88.size.width = width;
    v88.size.height = height;
    v14 = CGRectGetMaxX(v88);
    v89.origin.x = x;
    v89.origin.y = y;
    v89.size.width = width;
    v89.size.height = height;
    v15 = CGRectGetMaxY(v89);
    v76 = 0;
    objc_msgSend(v10, "transformWithSourceSpace:destinationSpace:error:", v9, CFSTR("/Image"), &v76);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v76;
    if (!v16)
    {
      NUAssertLogger();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot establish a mapping from space %@ to space %@: %@"), v9, CFSTR("/Image"), v17);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v78 = v61;
        _os_log_error_impl(&dword_20D1BC000, v60, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v62 = (const void **)MEMORY[0x24BE6C280];
      specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
      NUAssertLogger();
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v65)
        {
          v68 = dispatch_get_specific(*v62);
          v69 = (void *)MEMORY[0x24BDD17F0];
          v70 = v68;
          objc_msgSend(v69, "callStackSymbols");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "componentsJoinedByString:", CFSTR("\n"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v78 = v68;
          v79 = 2114;
          v80 = v72;
          _os_log_error_impl(&dword_20D1BC000, v64, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v65)
      {
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "componentsJoinedByString:", CFSTR("\n"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v78 = v67;
        _os_log_error_impl(&dword_20D1BC000, v64, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler();
    }
    objc_msgSend(v16, "transformPoint:", MinX, MinY);
    v19 = v18;
    v21 = v20;
    objc_msgSend(v16, "transformPoint:", v73, MaxY);
    v23 = v22;
    v25 = v24;
    objc_msgSend(v16, "transformPoint:", MaxX, v13);
    v27 = v26;
    v29 = v28;
    objc_msgSend(v16, "transformPoint:", v14, v15);
    if (v29 >= v31)
      v32 = v31;
    else
      v32 = v29;
    if (v29 >= v31)
      v31 = v29;
    if (v21 >= v25)
      v33 = v25;
    else
      v33 = v21;
    if (v21 >= v25)
      v34 = v21;
    else
      v34 = v25;
    if (v27 >= v30)
      v35 = v30;
    else
      v35 = v27;
    if (v27 >= v30)
      v30 = v27;
    if (v19 >= v23)
      v36 = v23;
    else
      v36 = v19;
    if (v19 >= v23)
      v37 = v19;
    else
      v37 = v23;
    if (v36 >= v35)
      v38 = v35;
    else
      v38 = v36;
    if (v33 >= v32)
      v39 = v32;
    else
      v39 = v33;
    if (v37 >= v30)
      v30 = v37;
    if (v34 >= v31)
      v31 = v34;
    v40 = v30 - v38;
    v41 = v31 - v39;
    -[NUMediaView _geometry](self, "_geometry");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
      objc_msgSend(v42, "extent");
    NUPixelRectToCGRect();
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;

    v90.origin.x = v38;
    v90.origin.y = v39;
    v90.size.width = v40;
    v90.size.height = v41;
    v93.origin.x = v49;
    v93.origin.y = v51;
    v93.size.width = v53;
    v93.size.height = v55;
    CGRectIntersection(v90, v93);
    NURectFlipYOrigin();
    v44 = v91.origin.x;
    v45 = v91.origin.y;
    v46 = v91.size.width;
    v47 = v91.size.height;
    if (CGRectIsNull(v91))
    {
      v44 = *MEMORY[0x24BDBF090];
      v45 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v46 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v47 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }

  }
  else
  {
    v44 = *MEMORY[0x24BDBF090];
    v45 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v46 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v47 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v56 = v44;
  v57 = v45;
  v58 = v46;
  v59 = v47;
  result.size.height = v59;
  result.size.width = v58;
  result.origin.y = v57;
  result.origin.x = v56;
  return result;
}

- (void)installRenderingCompletionBlock:(id)a3
{
  void *v4;
  id renderingCompletionBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  renderingCompletionBlock = self->_renderingCompletionBlock;
  self->_renderingCompletionBlock = v4;

}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_edgeInsets;
  BOOL v10;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  UIEdgeInsets v18;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v17 = *MEMORY[0x24BDAC8D0];
  p_edgeInsets = &self->_edgeInsets;
  v10 = self->_edgeInsets.left == a3.left
     && self->_edgeInsets.top == a3.top
     && self->_edgeInsets.right == a3.right
     && self->_edgeInsets.bottom == a3.bottom;
  if (!v10 && !self->_transitionCount)
  {
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
    v12 = (void *)*MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
    {
      v13 = v12;
      v18.top = top;
      v18.left = left;
      v18.bottom = bottom;
      v18.right = right;
      NSStringFromUIEdgeInsets(v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_debug_impl(&dword_20D1BC000, v13, OS_LOG_TYPE_DEBUG, "-[NUMediaView setEdgeInsets:] - insets: %@", (uint8_t *)&v15, 0xCu);

    }
    p_edgeInsets->top = top;
    p_edgeInsets->left = left;
    p_edgeInsets->bottom = bottom;
    p_edgeInsets->right = right;
    -[NUMediaView _updateContentInsets](self, "_updateContentInsets");
  }
}

- (void)setCenterContent:(BOOL)a3
{
  if (self->_centerContent != a3)
    self->_centerContent = a3;
}

- (id)_visibleImageRectOverlayView
{
  return self->_visibleImageOverlayView;
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_renderView;
}

- (void)scrollViewDidZoom:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NUMediaView _updateContentInsets](self, "_updateContentInsets");
  -[NUMediaView _updateScreenSpaceOverlay](self, "_updateScreenSpaceOverlay");
  -[NUMediaView _updateVisibleImageOverlayView](self, "_updateVisibleImageOverlayView");
  if (self->_delegateFlags.hasDidZoom)
  {
    -[NUMediaView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoomScale");
    objc_msgSend(v4, "mediaView:didZoom:", self);

  }
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v5;

  if (!-[NUMediaView loopsVideoPlayback](self, "loopsVideoPlayback", a3, a4)
    && !-[NUMediaView isVideoPlayerVisible](self, "isVideoPlayerVisible"))
  {
    -[NUMediaViewRenderer beginZooming](self->_renderer, "beginZooming");
  }
  if (self->_delegateFlags.hasWillBeginZooming)
  {
    -[NUMediaView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaViewWillBeginZooming:", self);

  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v6;

  if (!-[NUMediaView loopsVideoPlayback](self, "loopsVideoPlayback", a3, a4, a5)
    && !-[NUMediaView isVideoPlayerVisible](self, "isVideoPlayerVisible"))
  {
    -[NUMediaViewRenderer endZooming](self->_renderer, "endZooming");
    if (!self->_scrollUpdatesSuppressed)
      -[NUMediaView _updateRenderContent](self, "_updateRenderContent");
  }
  if (self->_delegateFlags.hasDidEndZooming)
  {
    -[NUMediaView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaViewDidEndZooming:", self);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  -[NUMediaViewRenderer beginPanning](self->_renderer, "beginPanning", a3);
  if (self->_delegateFlags.hasWillBeginDragging)
  {
    -[NUMediaView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaViewWillBeginDragging:", self);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  if (!-[NUMediaView loopsVideoPlayback](self, "loopsVideoPlayback", a3)
    && !-[NUMediaView isVideoPlayerVisible](self, "isVideoPlayerVisible")
    && !v4)
  {
    -[NUMediaViewRenderer endPanning](self->_renderer, "endPanning");
    if (!self->_scrollUpdatesSuppressed)
      -[NUMediaView _updateRenderContent](self, "_updateRenderContent");
  }
  if (self->_delegateFlags.hasDidEndDragging)
  {
    -[NUMediaView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaViewDidEndDragging:willDecelerate:", self, v4);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;

  if (!-[NUMediaView loopsVideoPlayback](self, "loopsVideoPlayback", a3)
    && !-[NUMediaView isVideoPlayerVisible](self, "isVideoPlayerVisible"))
  {
    -[NUMediaViewRenderer endPanning](self->_renderer, "endPanning");
    if (!self->_scrollUpdatesSuppressed)
      -[NUMediaView _updateRenderContent](self, "_updateRenderContent");
  }
  if (self->_delegateFlags.hasDidEndDecelerating)
  {
    -[NUMediaView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaViewDidEndDecelerating:", self);

  }
}

- (void)waitForRender
{
  -[NUMediaViewRenderer wait](self->_renderer, "wait");
}

- (void)_endTransition
{
  --self->_transitionCount;
}

- (void)_transitionToInsets:(UIEdgeInsets)a3 duration:(double)a4 animationCurve:(int64_t)a5 updateRenderContent:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat right;
  CGFloat bottom;
  double left;
  double top;
  _QWORD *v14;
  os_log_t *v15;
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
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double width;
  double height;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  double MidY;
  double v59;
  double v60;
  double v61;
  double v62;
  os_log_t v63;
  NURenderView *renderView;
  void *v65;
  NSObject *v66;
  void *v67;
  const __CFString *v68;
  CGFloat v69;
  CGFloat v70;
  NSObject *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  double v78;
  double MidX;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  _QWORD v87[9];
  BOOL v88;
  CGAffineTransform v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  double v93;
  __int16 v94;
  int v95;
  __int16 v96;
  const __CFString *v97;
  uint64_t v98;
  CGSize v99;
  CGPoint v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  UIEdgeInsets v107;

  v6 = a6;
  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v98 = *MEMORY[0x24BDAC8D0];
  if (a6)
    -[NUMediaViewRenderer cancelPendingRenders](self->_renderer, "cancelPendingRenders");
  -[NUMediaView _beginTransition](self, "_beginTransition");
  self->_scrollUpdatesSuppressed = 1;
  v14 = (_QWORD *)MEMORY[0x24BE6C478];
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
  v15 = (os_log_t *)MEMORY[0x24BE6C488];
  v16 = (void *)*MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    v66 = v16;
    v107.top = top;
    v107.left = left;
    v107.bottom = bottom;
    v107.right = right;
    NSStringFromUIEdgeInsets(v107);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v92 = 2048;
    v91 = v67;
    if (v6)
      v68 = CFSTR("YES");
    v93 = a4;
    v94 = 1024;
    v95 = a5;
    v96 = 2112;
    v97 = v68;
    _os_log_debug_impl(&dword_20D1BC000, v66, OS_LOG_TYPE_DEBUG, "-[NUMediaView _transitionToInsets:duration:animationCurve:updateRenderContent:] - insets: %@, duration: %f, animationCurve: %d, updateRenderContent: %@", buf, 0x26u);

  }
  if (-[NUMediaViewRenderer isZoomedToFit](self->_renderer, "isZoomedToFit"))
  {
    v84 = a4;
    -[NUMediaView frame](self, "frame");
    v18 = v17;
    v80 = v19;
    v82 = v17;
    v20 = v19;
    v21 = bottom;
    v85 = bottom;
    v86 = right;
    v22 = right;
    v24 = v23;
    v77 = v25;
    v78 = v23;
    v26 = v25;
    -[NURenderView frame](self->_renderView, "frame");
    -[NUMediaView convertRect:fromView:](self, "convertRect:fromView:", self->_scrollView);
    v31 = v24 - (v22 + left);
    v32 = v26 - (top + v21);
    v33 = v31 * 0.5;
    if (v31 > 0.0)
      v33 = -0.0;
    v34 = v18 + left + v33;
    if (v31 <= 0.0)
      v35 = 0.0;
    else
      v35 = v24 - (v22 + left);
    v36 = v32 * 0.5;
    if (v32 > 0.0)
      v36 = -0.0;
    v37 = v20 + top + v36;
    if (v32 <= 0.0)
      v38 = 0.0;
    else
      v38 = v26 - (top + v21);
    v39 = v27;
    v40 = v28;
    v41 = v29;
    v76 = v29;
    v42 = v30;
    NUFitScaleForImageRectInRect(v27, v28, v29, v30, v34, v37, v35, v38);
    CGAffineTransformMakeScale(&v89, v43, v43);
    v101.origin.x = v39;
    v101.origin.y = v40;
    v101.size.width = v41;
    v101.size.height = v42;
    v44 = v42;
    v102 = CGRectApplyAffineTransform(v101, &v89);
    width = v102.size.width;
    height = v102.size.height;
    v47 = (void *)objc_opt_class();
    v75 = v80;
    v74 = v82;
    v81 = top;
    v83 = left;
    v48 = top;
    v49 = height;
    v50 = left;
    v51 = width;
    objc_msgSend(v47, "_proposedInsetsForInsets:contentSize:inFrame:centerContent:", self->_centerContent, v48, v50, v85, v86, width, height, *(_QWORD *)&v74, *(_QWORD *)&v75, *(_QWORD *)&v78, *(_QWORD *)&v77);
    v53 = v52;
    v55 = v54;
    v103.origin.x = v39;
    v103.origin.y = v40;
    v103.size.width = v76;
    v103.size.height = v44;
    MidX = CGRectGetMidX(v103);
    v104.origin.x = v39;
    v104.origin.y = v40;
    v104.size.width = v76;
    v56 = v53;
    v104.size.height = v44;
    v57 = v55;
    MidY = CGRectGetMidY(v104);
    v105.origin.x = v55;
    v105.origin.y = v56;
    v105.size.width = v51;
    v105.size.height = height;
    v59 = CGRectGetMidX(v105);
    v106.origin.x = v55;
    v106.origin.y = v56;
    v106.size.width = v51;
    v106.size.height = v49;
    v60 = CGRectGetMidY(v106);
    self->_transitionTargetSize.width = v51;
    self->_transitionTargetSize.height = v49;
    if (*v14 != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
    v61 = v59 - MidX;
    v62 = v60 - MidY;
    v63 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
    {
      v69 = self->_transitionTargetSize.width;
      v70 = self->_transitionTargetSize.height;
      v71 = v63;
      v99.width = v69;
      v99.height = v70;
      NSStringFromCGSize(v99);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v100.x = v61;
      v100.y = v62;
      NSStringFromCGPoint(v100);
      v73 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412546;
      v91 = v72;
      v92 = 2112;
      v93 = v73;
      _os_log_debug_impl(&dword_20D1BC000, v71, OS_LOG_TYPE_DEBUG, "-[NUMediaView _transitionToInsets:duration:animationCurve:updateRenderContent:] - size: %@, offset: %@", buf, 0x16u);

    }
    renderView = self->_renderView;
    NUMediaTimingFunctionForUIAnimationCurve(a5);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = MEMORY[0x24BDAC760];
    v87[1] = 3221225472;
    v87[2] = __79__NUMediaView__transitionToInsets_duration_animationCurve_updateRenderContent___block_invoke;
    v87[3] = &unk_24C625588;
    v87[4] = self;
    *(double *)&v87[5] = v81;
    *(double *)&v87[6] = v83;
    *(double *)&v87[7] = v85;
    *(double *)&v87[8] = v86;
    v88 = v6;
    -[NURenderView transitionToSize:offset:duration:animationCurve:completion:](renderView, "transitionToSize:offset:duration:animationCurve:completion:", v65, v87, v51, v49, v61, v62, v84);

    -[_NUMediaScreenSpaceOverlayView setFrame:](self->_screenSpaceOverlayView, "setFrame:", v57, v56, v51, v49);
    self->_scrollUpdatesSuppressed = 0;
  }
  else
  {
    -[NUMediaView _endTransition](self, "_endTransition");
    self->_edgeInsets.top = top;
    self->_edgeInsets.left = left;
    self->_edgeInsets.bottom = bottom;
    self->_edgeInsets.right = right;
    self->_scrollUpdatesSuppressed = 0;
    if (v6)
      -[NUMediaView _updateRenderContent](self, "_updateRenderContent");
  }
}

- (id)_videoPlayerView
{
  NUAVPlayerView *playerView;
  NUAVPlayerView *v4;
  NUAVPlayerView *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;

  playerView = self->_playerView;
  if (!playerView)
  {
    v4 = (NUAVPlayerView *)objc_opt_new();
    v5 = self->_playerView;
    self->_playerView = v4;

    -[NUAVPlayerView setAlpha:](self->_playerView, "setAlpha:", 0.0);
    -[NUAVPlayerView setDelegate:](self->_playerView, "setDelegate:", self);
    v6 = objc_msgSend(MEMORY[0x24BE6C3A0], "isViewDebugEnabled");
    playerView = self->_playerView;
    if (v6)
    {
      -[NUAVPlayerView layer](playerView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "cyanColor");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

      -[NUAVPlayerView layer](self->_playerView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBorderWidth:", 8.0);

      playerView = self->_playerView;
    }
  }
  return playerView;
}

- (id)_videoPlayerController
{
  void *v2;
  void *v3;

  -[NUMediaView _renderer](self, "_renderer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nuAVPlayerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_rendererDidCreateAVPlayerController:(id)a3
{
  id v4;
  void *v5;
  NUAVPlayerView *playerView;
  void *v7;
  NUAVPlayerView *v8;
  NUAVPlayerView *v9;
  void *v10;
  uint64_t v11;
  NUAVPlayerView *v12;
  _QWORD v13[4];
  NUAVPlayerView *v14;
  _QWORD v15[4];
  NUAVPlayerView *v16;

  v4 = a3;
  v5 = v4;
  playerView = self->_playerView;
  if (v4)
  {
    objc_msgSend(v4, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUAVPlayerView setPlayer:](playerView, "setPlayer:", v7);

    objc_msgSend(v5, "setDelegate:", self);
  }
  else
  {
    v8 = playerView;
    v9 = self->_playerView;
    self->_playerView = 0;

    v10 = (void *)MEMORY[0x24BDF6F90];
    v11 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__NUMediaView__rendererDidCreateAVPlayerController___block_invoke;
    v15[3] = &unk_24C625740;
    v16 = v8;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __52__NUMediaView__rendererDidCreateAVPlayerController___block_invoke_2;
    v13[3] = &unk_24C6255B0;
    v14 = v16;
    v12 = v16;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v15, v13, 0.2);

  }
}

- (void)_updateScreenSpaceOverlay
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  _NUMediaScreenSpaceOverlayView *screenSpaceOverlayView;
  CGRect v16;
  CGRect v17;

  -[NUMediaView imageFrame](self, "imageFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_NUMediaScreenSpaceOverlayView frame](self->_screenSpaceOverlayView, "frame");
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  if (!CGRectEqualToRect(v16, v17))
  {
    screenSpaceOverlayView = self->_screenSpaceOverlayView;
    -[NUMediaView imageFrame](self, "imageFrame");
    -[_NUMediaScreenSpaceOverlayView setFrame:](screenSpaceOverlayView, "setFrame:");
  }
}

- (void)_updateVisibleImageOverlayView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[NUMediaView imageFrame](self, "imageFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NUMediaView frame](self, "frame");
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  v16 = CGRectIntersection(v15, v17);
  -[_NUMediaVisibleImageOverlayView setFrame:](self->_visibleImageOverlayView, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
}

- (void)_rendererDidUpdateLivePhoto
{
  id v3;

  if (self->_delegateFlags.hasDidUpdateLivePhoto)
  {
    -[NUMediaView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaViewDidUpdateLivePhoto:", self);

  }
}

- (void)_rendererDidStartPreparingVideo
{
  id v3;

  if (self->_delegateFlags.hasDidStartPreparingVideo)
  {
    -[NUMediaView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaViewDidStartPreparingVideo:", self);

  }
}

- (void)_rendererDidFinishPreparingVideo
{
  id v3;

  if (self->_delegateFlags.hasDidFinishPreparingVideo)
  {
    -[NUMediaView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaViewDidFinishPreparingVideo:", self);

  }
}

- (void)_livephotoPlaybackWillBegin
{
  id v3;

  if (self->_delegateFlags.hasWillBeginLivePhotoPlayback)
  {
    -[NUMediaView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaViewWillBeginLivePhotoPlayback:", self);

  }
}

- (void)_livephotoPlaybackDidEnd
{
  id v3;

  if (self->_delegateFlags.hasDidEndLivePhotoPlayback)
  {
    -[NUMediaView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaViewDidEndLivePhotoPlayback:", self);

  }
}

- (void)setLoopsVideoPlayback:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NUMediaView player](self, "player");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaybackMode:", v3);

}

- (BOOL)isMuted
{
  void *v2;
  char v3;

  -[NUMediaView player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMuted");

  return v3;
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NUMediaView player](self, "player");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMuted:", v3);

}

- (void)_startVideoPlayback
{
  id v2;

  -[NUMediaView player](self, "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "play");

}

- (void)setVideoPlayerVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_videoPlayerVisible != a3)
  {
    self->_videoPlayerVisible = a3;
    self->_lastVideoPlayerVisibilityChangeWasAnimated = a4;
    -[NUMediaView _updateVideoPlayerAlpha:](self, "_updateVideoPlayerAlpha:", a4);
  }
}

- (id)_renderer
{
  return self->_renderer;
}

- (void)_setLayerFilters:(id)a3
{
  NURenderView *renderView;
  id v5;
  void *v6;
  id v7;

  renderView = self->_renderView;
  v5 = a3;
  -[NURenderView _backfillLayer](renderView, "_backfillLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilters:", v5);

  -[NURenderView _roiLayer](self->_renderView, "_roiLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilters:", v5);

}

- (void)setPipelineFilters:(id)a3
{
  -[NUMediaView _setPipelineFilters:shouldUpdateContent:](self, "_setPipelineFilters:shouldUpdateContent:", a3, 1);
}

- (NSArray)pipelineFilters
{
  return -[NUMediaViewRenderer pipelineFilters](self->_renderer, "pipelineFilters");
}

- (void)_setPipelineFilters:(id)a3 shouldUpdateContent:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[NUMediaViewRenderer setPipelineFilters:](self->_renderer, "setPipelineFilters:", a3);
  if (v4)
    -[NUMediaView _updateRenderContent](self, "_updateRenderContent");
}

- (void)_withComposition:(id)a3 visitRenderClient:(id)a4
{
  -[NUMediaViewRenderer _withComposition:visitRenderClient:](self->_renderer, "_withComposition:visitRenderClient:", a3, a4);
}

- (void)setVideoEnabled:(BOOL)a3 animated:(BOOL)a4
{
  -[NUMediaViewRenderer setVideoEnabled:animated:](self->_renderer, "setVideoEnabled:animated:", a3, a4);
}

- (BOOL)isVideoEnabled
{
  return -[NUMediaViewRenderer isVideoEnabled](self->_renderer, "isVideoEnabled");
}

- (void)_updateVideoPlayerAlpha:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  double v6;
  double v7;
  _QWORD v8[6];
  _QWORD v9[6];

  v3 = a3;
  v5 = -[NUMediaView isVideoPlayerVisible](self, "isVideoPlayerVisible");
  if ((v5 & -[NUAVPlayerView isReadyForDisplay](self->_playerView, "isReadyForDisplay")) != 0)
    v6 = 1.0;
  else
    v6 = 0.0;
  -[NUAVPlayerView alpha](self->_playerView, "alpha");
  if (v6 != v7)
  {
    if (v3)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __39__NUMediaView__updateVideoPlayerAlpha___block_invoke;
      v9[3] = &unk_24C6255D8;
      v9[4] = self;
      *(double *)&v9[5] = v6;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v9, 0.5);
    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __39__NUMediaView__updateVideoPlayerAlpha___block_invoke_2;
      v8[3] = &unk_24C6255D8;
      v8[4] = self;
      *(double *)&v8[5] = v6;
      objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v8);
    }
  }
}

- (id)_layerRecursiveDescription
{
  void *v2;
  void *v3;

  -[NUMediaView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nu_layerRecursiveDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)snapshotImage
{
  void *v2;
  void *v3;

  -[NURenderView _backfillLayer](self->_renderView, "_backfillLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_releaseAVObjects
{
  -[NUMediaViewRenderer _releaseAVObjects](self->_renderer, "_releaseAVObjects");
}

- (BOOL)_didReleaseAVObjects
{
  return -[NUMediaViewRenderer _didReleaseAVObjects](self->_renderer, "_didReleaseAVObjects");
}

- (void)playerViewReadyForDisplayDidChange:(id)a3
{
  -[NUMediaView _updateVideoPlayerAlpha:](self, "_updateVideoPlayerAlpha:", self->_lastVideoPlayerVisibilityChangeWasAnimated);
}

- (void)playerControllerDidFinishPlaying:(id)a3 duration:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_delegateFlags.hasDidPlayToEnd)
  {
    -[NUMediaView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaViewDidPlayToEnd:", self);

  }
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
  v8 = *MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    v9 = 134218240;
    v10 = v6;
    v11 = 2048;
    v12 = a4;
    _os_log_debug_impl(&dword_20D1BC000, v8, OS_LOG_TYPE_DEBUG, "<controller: %p> %g", (uint8_t *)&v9, 0x16u);
  }

}

- (void)playerController:(id)a3 didUpdateElapsedTime:(double)a4 duration:(double)a5
{
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
  v8 = *MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    v9 = 134218496;
    v10 = v7;
    v11 = 2048;
    v12 = a4;
    v13 = 2048;
    v14 = a5;
    _os_log_debug_impl(&dword_20D1BC000, v8, OS_LOG_TYPE_DEBUG, "<controller: %p> %g %g", (uint8_t *)&v9, 0x20u);
  }

}

- (void)playerControllerFailedToPlayToEnd:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_delegateFlags.hasFailedToPlayToEnd)
  {
    -[NUMediaView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaViewFailedToPlayToEnd:error:", self, v7);

  }
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
  v9 = *MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    v10 = 134218242;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_20D1BC000, v9, OS_LOG_TYPE_DEBUG, "<controller: %p> failed to play to end: %@", (uint8_t *)&v10, 0x16u);
  }

}

- (void)playerControllerIsReadyForPlayback:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_delegateFlags.hasIsReadyForVideoPlayback)
  {
    -[NUMediaView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaViewIsReadyForVideoPlayback:", self);

  }
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
  v6 = *MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    v7 = 134217984;
    v8 = v4;
    _os_log_debug_impl(&dword_20D1BC000, v6, OS_LOG_TYPE_DEBUG, "<controller: %p> ", (uint8_t *)&v7, 0xCu);
  }

}

- (BOOL)alwaysBounceScrollView
{
  return self->_alwaysBounceScrollView;
}

- (BOOL)isScrollEnabled
{
  return self->_scrollEnabled;
}

- (NSLayoutYAxisAnchor)imageTopAnchor
{
  return self->_imageTopAnchor;
}

- (NSLayoutYAxisAnchor)imageBottomAnchor
{
  return self->_imageBottomAnchor;
}

- (NSLayoutXAxisAnchor)imageLeftAnchor
{
  return self->_imageLeftAnchor;
}

- (NSLayoutXAxisAnchor)imageRightAnchor
{
  return self->_imageRightAnchor;
}

- (CGSize)_masterSizeWithoutGeometry
{
  double width;
  double height;
  CGSize result;

  width = self->__masterSizeWithoutGeometry.width;
  height = self->__masterSizeWithoutGeometry.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_masterSizeWithoutGeometry:(CGSize)a3
{
  self->__masterSizeWithoutGeometry = a3;
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

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (double)angle
{
  return self->_angle;
}

- (BOOL)centerContent
{
  return self->_centerContent;
}

- (BOOL)isDebugEnabled
{
  return self->_debugEnabled;
}

- (void)setDebugEnabled:(BOOL)a3
{
  self->_debugEnabled = a3;
}

- (BOOL)isHDREnabled
{
  return self->_hdrEnabled;
}

- (void)setHdrEnabled:(BOOL)a3
{
  self->_hdrEnabled = a3;
}

- (BOOL)scrollUpdatesSuppressed
{
  return self->_scrollUpdatesSuppressed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRightAnchor, 0);
  objc_storeStrong((id *)&self->_imageLeftAnchor, 0);
  objc_storeStrong((id *)&self->_imageBottomAnchor, 0);
  objc_storeStrong((id *)&self->_imageTopAnchor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayEDRMonitorLink, 0);
  objc_storeStrong((id *)&self->_displayEDRMonitorTimer, 0);
  objc_storeStrong(&self->_renderingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_renderCoalescer, 0);
  objc_storeStrong((id *)&self->_visibleImageOverlayView, 0);
  objc_storeStrong((id *)&self->_screenSpaceOverlayView, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_nuAVPlayerController, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_renderView, 0);
}

uint64_t __39__NUMediaView__updateVideoPlayerAlpha___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __39__NUMediaView__updateVideoPlayerAlpha___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __52__NUMediaView__rendererDidCreateAVPlayerController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __52__NUMediaView__rendererDidCreateAVPlayerController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __79__NUMediaView__transitionToInsets_duration_animationCurve_updateRenderContent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  _OWORD *v4;
  __int128 v5;
  void *v6;
  NSObject *v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  CGSize v14;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_391);
  v2 = (void *)*MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
    v7 = v2;
    objc_msgSend(v6, "frame");
    v14.width = v8;
    v14.height = v9;
    NSStringFromCGSize(v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_debug_impl(&dword_20D1BC000, v7, OS_LOG_TYPE_DEBUG, "-[NUMediaView _transitionToInsets:duration:animationCurve:updateRenderContent:] - render view content size: %@", (uint8_t *)&v11, 0xCu);

  }
  result = objc_msgSend(*(id *)(a1 + 32), "_endTransition");
  v4 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 440);
  v5 = *(_OWORD *)(a1 + 56);
  *v4 = *(_OWORD *)(a1 + 40);
  v4[1] = v5;
  if (*(_BYTE *)(a1 + 72))
    return objc_msgSend(*(id *)(a1 + 32), "_updateRenderContent");
  return result;
}

void __26__NUMediaView__setupViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BE6C3A0];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "mediaViewRenderCoalescingInterval");
  objc_msgSend(v5, "delayNextInvocationByTimeInterval:");

  objc_msgSend(v6, "_updateRenderContent");
}

+ (double)maximumEDRHeadroomForScreen:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "potentialEDRHeadroom");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BE6C3A0], "overrideDisplayHeadroom");
  if (v5 >= 1.0)
    v4 = v5;
  objc_msgSend(MEMORY[0x24BE6C3A0], "thresholdDisplayHeadroom");
  if (v4 <= v6)
    return 1.0;
  else
    return v4;
}

+ (double)currentEDRHeadroomForScreen:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "currentEDRHeadroom");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BE6C3A0], "overrideDisplayHeadroom");
  if (v5 >= 1.0)
    v4 = v5;
  objc_msgSend(MEMORY[0x24BE6C3A0], "thresholdDisplayHeadroom");
  if (v4 <= v6)
    return 1.0;
  else
    return v4;
}

@end
