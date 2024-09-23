@implementation NTKCCenteringScrollView

- (NTKCCenteringScrollView)initWithFrame:(CGRect)a3
{
  NTKCCenteringScrollView *v3;
  NTKCCenteringScrollView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKCCenteringScrollView;
  v3 = -[NTKCCenteringScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKCCenteringScrollView setAlwaysBounceVertical:](v3, "setAlwaysBounceVertical:", 1);
    -[NTKCCenteringScrollView setAlwaysBounceHorizontal:](v4, "setAlwaysBounceHorizontal:", 1);
    -[NTKCCenteringScrollView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
    -[NTKCCenteringScrollView setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
    -[NTKCCenteringScrollView setBouncesZoom:](v4, "setBouncesZoom:", 1);
    -[NTKCCenteringScrollView setDecelerationRate:](v4, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
    -[NTKCCenteringScrollView setDelegate:](v4, "setDelegate:", v4);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCCenteringScrollView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)setCenteredView:(id)a3
{
  UIView *v5;
  UIView **p_centeredView;
  UIView *centeredView;
  UIView *v8;
  __int128 v9;
  double v10;
  double v11;
  _OWORD v12[3];

  v5 = (UIView *)a3;
  p_centeredView = &self->_centeredView;
  centeredView = self->_centeredView;
  if (centeredView != v5)
  {
    -[UIView removeFromSuperview](centeredView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_centeredView, a3);
    v8 = *p_centeredView;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v12[0] = *MEMORY[0x1E0C9BAA8];
    v12[1] = v9;
    v12[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIView setTransform:](v8, "setTransform:", v12);
    -[NTKCCenteringScrollView addSubview:](self, "addSubview:", *p_centeredView);
    -[UIView bounds](*p_centeredView, "bounds");
    -[NTKCCenteringScrollView setContentSize:](self, "setContentSize:", v10, v11);
    -[NTKCCenteringScrollView _updateZoomScales](self, "_updateZoomScales");
    -[NTKCCenteringScrollView _updateInsets](self, "_updateInsets");
    -[NTKCCenteringScrollView _centerOnCrop](self, "_centerOnCrop");
  }

}

- (void)setCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_cropRect;
  CGSize size;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_cropRect = &self->_cropRect;
  if (!CGRectEqualToRect(a3, self->_cropRect))
  {
    p_cropRect->origin.x = x;
    p_cropRect->origin.y = y;
    p_cropRect->size.width = width;
    p_cropRect->size.height = height;
    size = p_cropRect->size;
    self->_originalCrop.origin = p_cropRect->origin;
    self->_originalCrop.size = size;
    -[NTKCCenteringScrollView _centerOnCrop](self, "_centerOnCrop");
  }
}

- (void)setMinimumDisplaySize:(CGSize)a3
{
  -[NTKCCenteringScrollView setMinimumDisplaySize:withCropRectCushion:](self, "setMinimumDisplaySize:withCropRectCushion:", a3.width, a3.height, 0.0);
}

- (void)setMinimumDisplaySize:(CGSize)a3 withCropRectCushion:(double)a4
{
  self->_minimumDisplaySize = a3;
  if (a4 > 0.0 && self->_cropRectCushion != a4)
    self->_cropRectCushion = a4;
  -[NTKCCenteringScrollView _updateZoomScales](self, "_updateZoomScales");
  -[NTKCCenteringScrollView _updateInsets](self, "_updateInsets");
  -[NTKCCenteringScrollView _centerOnCrop](self, "_centerOnCrop");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCCenteringScrollView;
  -[NTKCCenteringScrollView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[NTKCCenteringScrollView _updateZoomScales](self, "_updateZoomScales");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCCenteringScrollView;
  -[NTKCCenteringScrollView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[NTKCCenteringScrollView _updateZoomScales](self, "_updateZoomScales");
}

- (void)setMaximumZoomRatio:(double)a3
{
  if (self->_maximumZoomRatio != a3)
  {
    self->_maximumZoomRatio = fmax(a3, 1.0);
    -[NTKCCenteringScrollView _updateZoomScales](self, "_updateZoomScales");
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_centeredView;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v5;

  -[NTKCCenteringScrollView ntk_delegate](self, "ntk_delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewWillBeginInteraction:", self);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  -[NTKCCenteringScrollView ntk_delegate](self, "ntk_delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollViewWillBeginInteraction:", self);

}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v6;

  -[NTKCCenteringScrollView _updateCrop](self, "_updateCrop", a3, a4, a5);
  -[NTKCCenteringScrollView ntk_delegate](self, "ntk_delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollViewDidSettleFromInteracting:", self);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (!a4)
  {
    v9 = v6;
    -[NTKCCenteringScrollView _updateCrop](self, "_updateCrop");
    v7 = objc_msgSend(v9, "isZoomBouncing");
    v6 = v9;
    if ((v7 & 1) == 0)
    {
      -[NTKCCenteringScrollView ntk_delegate](self, "ntk_delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scrollViewDidSettleFromInteracting:", self);

      v6 = v9;
    }
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  -[NTKCCenteringScrollView _updateCrop](self, "_updateCrop");
  v5 = objc_msgSend(v4, "isZoomBouncing");

  if ((v5 & 1) == 0)
  {
    -[NTKCCenteringScrollView ntk_delegate](self, "ntk_delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewDidSettleFromInteracting:", self);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[NTKCCenteringScrollView ntk_delegate](self, "ntk_delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NTKCCenteringScrollView _updateCrop](self, "_updateCrop");
    -[NTKCCenteringScrollView ntk_delegate](self, "ntk_delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewDidScroll:", self);

  }
}

- (void)_updateZoomScales
{
  double width;
  double height;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double maximumZoomRatio;

  width = self->_minimumDisplaySize.width;
  height = self->_minimumDisplaySize.height;
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (width == *MEMORY[0x1E0C9D820] && height == v6)
  {
    -[NTKCCenteringScrollView bounds](self, "bounds");
    v10 = v11;
    v9 = v12;
  }
  else
  {
    v8 = self->_cropRectCushion + 1.0;
    v9 = height * v8;
    v10 = width * v8;
  }
  -[UIView bounds](self->_centeredView, "bounds");
  if (v13 == v5 && v14 == v6)
  {
    -[NTKCCenteringScrollView setMinimumZoomScale:](self, "setMinimumZoomScale:", 1.0);
    maximumZoomRatio = self->_maximumZoomRatio;
  }
  else
  {
    if (v10 / v13 >= v9 / v14)
      v16 = v10 / v13;
    else
      v16 = v9 / v14;
    -[NTKCCenteringScrollView setMinimumZoomScale:](self, "setMinimumZoomScale:", v16);
    maximumZoomRatio = v16 * self->_maximumZoomRatio;
  }
  -[NTKCCenteringScrollView setMaximumZoomScale:](self, "setMaximumZoomScale:", maximumZoomRatio);
}

- (void)_updateInsets
{
  CGSize *p_minimumDisplaySize;
  double v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MinY;
  double v23;
  double Height;
  double v25;
  double v26;
  CGFloat v27;
  double Width;
  CGFloat MaxX;
  CGFloat v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  double MinX;
  CGFloat v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  p_minimumDisplaySize = &self->_minimumDisplaySize;
  if (self->_minimumDisplaySize.width != *MEMORY[0x1E0C9D820]
    || self->_minimumDisplaySize.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    if (self->_centeredView)
    {
      -[NTKCCenteringScrollView zoomScale](self, "zoomScale");
      v37 = v5;
      -[NTKCCenteringScrollView setZoomScale:](self, "setZoomScale:", 1.0);
      v6 = *MEMORY[0x1E0C9D538];
      v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      -[NTKCCenteringScrollView bounds](self, "bounds");
      v33 = v9;
      v34 = v8;
      UIRectCenteredIntegralRectScale();
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v30 = v14;
      v17 = v16;
      -[NTKCCenteringScrollView safeAreaInsets](self, "safeAreaInsets", 0);
      v19 = v18;
      -[NTKCCenteringScrollView safeAreaInsets](self, "safeAreaInsets");
      v21 = v19 - v20;
      v32 = v19 - v20;
      v38.origin.x = v11;
      v38.origin.y = v13;
      v38.size.width = v15;
      v38.size.height = v17;
      MinY = CGRectGetMinY(v38);
      -[NTKCCenteringScrollView _systemContentInset](self, "_systemContentInset");
      v36 = v21 + MinY - v23;
      v39.origin.x = v11;
      v31 = v17;
      v39.origin.y = v13;
      v39.size.width = v15;
      v39.size.height = v17;
      MinX = CGRectGetMinX(v39);
      v40.origin.x = v6;
      v40.origin.y = v7;
      v40.size.width = v34;
      v40.size.height = v33;
      Height = CGRectGetHeight(v40);
      v41.origin.x = v11;
      v41.origin.y = v13;
      v41.size.width = v30;
      v41.size.height = v17;
      v25 = Height - CGRectGetMaxY(v41);
      -[NTKCCenteringScrollView _systemContentInset](self, "_systemContentInset");
      v27 = v25 - v26 - v32;
      v42.origin.x = v6;
      v42.origin.y = v7;
      v42.size.width = v34;
      v42.size.height = v33;
      Width = CGRectGetWidth(v42);
      v43.origin.x = v11;
      v43.size.height = v31;
      v43.origin.y = v13;
      v43.size.width = v30;
      MaxX = CGRectGetMaxX(v43);
      self->_minimumDisplayInsets.top = v36;
      self->_minimumDisplayInsets.left = MinX;
      self->_minimumDisplayInsets.bottom = v27;
      self->_minimumDisplayInsets.right = Width - MaxX;
      -[NTKCCenteringScrollView setContentInset:](self, "setContentInset:", v36 - self->_cropRectCushion * p_minimumDisplaySize->height * 0.5, MinX - p_minimumDisplaySize->width * self->_cropRectCushion * 0.5, v27 - self->_cropRectCushion * p_minimumDisplaySize->height * 0.5, Width - MaxX - p_minimumDisplaySize->width * self->_cropRectCushion * 0.5);
      -[NTKCCenteringScrollView setZoomScale:](self, "setZoomScale:", v37);
    }
  }
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCCenteringScrollView;
  -[NTKCCenteringScrollView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[NTKCCenteringScrollView _updateInsets](self, "_updateInsets");
  -[NTKCCenteringScrollView _updateCrop](self, "_updateCrop");
  -[NTKCCenteringScrollView _centerOnCrop](self, "_centerOnCrop");
}

- (void)_centerOnCrop
{
  CGRect *p_originalCrop;
  BOOL v4;
  double width;
  CGFloat v6;
  double height;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;

  p_originalCrop = &self->_originalCrop;
  if (CGRectIsEmpty(self->_originalCrop)
    || (self->_minimumDisplaySize.width == *MEMORY[0x1E0C9D820]
      ? (v4 = self->_minimumDisplaySize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
      : (v4 = 0),
        v4 || !self->_centeredView))
  {
    -[NTKCCenteringScrollView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  }
  else
  {
    -[NTKCCenteringScrollView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    width = self->_minimumDisplaySize.width;
    v6 = CGRectGetWidth(*p_originalCrop);
    height = self->_minimumDisplaySize.height;
    v8 = width / v6;
    v9 = height / CGRectGetHeight(*p_originalCrop);
    if (v8 >= v9)
      v8 = v9;
    -[NTKCCenteringScrollView setZoomScale:](self, "setZoomScale:", v8);
    v10 = -(self->_minimumDisplayInsets.left - CGRectGetMinX(*p_originalCrop) * v8);
    v11 = -(self->_minimumDisplayInsets.top - CGRectGetMinY(*p_originalCrop) * v8);
    -[NTKCCenteringScrollView _systemContentInset](self, "_systemContentInset");
    -[NTKCCenteringScrollView setContentOffset:](self, "setContentOffset:", v10, v11 - v12);
  }
}

- (void)_updateCrop
{
  uint64_t v3;
  double top;
  double left;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGSize v11;
  uint64_t v12;

  -[NTKCCenteringScrollView zoomScale](self, "zoomScale");
  v12 = v3;
  top = self->_minimumDisplayInsets.top;
  left = self->_minimumDisplayInsets.left;
  -[NTKCCenteringScrollView contentOffset](self, "contentOffset");
  v8 = top + v7;
  v9 = (left + v6) / *(double *)&v12;
  -[NTKCCenteringScrollView _systemContentInset](self, "_systemContentInset");
  v11 = (CGSize)vdivq_f64((float64x2_t)self->_minimumDisplaySize, (float64x2_t)vdupq_lane_s64(v12, 0));
  self->_cropRect.origin.x = v9;
  self->_cropRect.origin.y = (v8 + v10) / *(double *)&v12;
  self->_cropRect.size = v11;
}

- (NTKCCenteringScrollViewDelegate)ntk_delegate
{
  return (NTKCCenteringScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_ntk_delegate);
}

- (void)setNtk_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_ntk_delegate, a3);
}

- (UIView)centeredView
{
  return self->_centeredView;
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

- (double)cropRectCushion
{
  return self->_cropRectCushion;
}

- (CGSize)minimumDisplaySize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumDisplaySize.width;
  height = self->_minimumDisplaySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)maximumZoomRatio
{
  return self->_maximumZoomRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredView, 0);
  objc_destroyWeak((id *)&self->_ntk_delegate);
}

@end
