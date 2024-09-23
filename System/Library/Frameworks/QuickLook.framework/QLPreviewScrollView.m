@implementation QLPreviewScrollView

- (QLPreviewScrollView)init
{
  QLPreviewScrollView *v2;
  QLPreviewScrollView *v3;
  void *v4;
  QLPreviewScrollView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLPreviewScrollView;
  v2 = -[QLPreviewScrollView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v3 = v2;
  if (v2)
  {
    -[QLPreviewScrollView setDelegate:](v2, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewScrollView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[QLPreviewScrollView setBouncesZoom:](v3, "setBouncesZoom:", 1);
    -[QLPreviewScrollView setShowsVerticalScrollIndicator:](v3, "setShowsVerticalScrollIndicator:", 0);
    -[QLPreviewScrollView setShowsHorizontalScrollIndicator:](v3, "setShowsHorizontalScrollIndicator:", 0);
    -[QLPreviewScrollView setPreservesCenterDuringRotation:](v3, "setPreservesCenterDuringRotation:", 1);
    -[QLPreviewScrollView setDecelerationRate:](v3, "setDecelerationRate:", *MEMORY[0x24BEBE728]);
    -[QLPreviewScrollView setAlwaysBounceVertical:](v3, "setAlwaysBounceVertical:", 1);
    v3->_lastUpdatedSize = (CGSize)*MEMORY[0x24BDBF148];
    v3->_preventZoomUpdate = 0;
    v5 = v3;
  }

  return v3;
}

- (void)setContentViewSize:(CGSize)a3
{
  if (self->_contentViewSize.width != a3.width || self->_contentViewSize.height != a3.height)
  {
    self->_contentViewSize = a3;
    -[QLPreviewScrollView setContentSize:](self, "setContentSize:");
    -[QLPreviewScrollView _updateScrollViewZooming](self, "_updateScrollViewZooming");
  }
}

- (void)setNeedsZoomUpdate:(BOOL)a3
{
  self->_needsZoomUpdate = a3;
  if (a3)
    -[QLPreviewScrollView _updateScrollViewZooming](self, "_updateScrollViewZooming");
}

- (void)layoutSubviews
{
  double v3;
  double width;
  double height;
  double v6;
  BOOL v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLPreviewScrollView;
  -[QLPreviewScrollView layoutSubviews](&v8, sel_layoutSubviews);
  if (!-[QLPreviewScrollView preventZoomUpdate](self, "preventZoomUpdate"))
  {
    -[QLPreviewScrollView extent](self, "extent");
    width = self->_lastUpdatedSize.width;
    height = self->_lastUpdatedSize.height;
    v7 = width == v6 && height == v3;
    if (!v7 || -[QLPreviewScrollView needsZoomUpdate](self, "needsZoomUpdate", width, height))
      -[QLPreviewScrollView _updateScrollViewZooming](self, "_updateScrollViewZooming", width, height);
  }
}

- (void)_updateScrollViewZooming
{
  double v3;
  double v4;
  double v5;

  -[QLPreviewScrollView extent](self, "extent");
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (*MEMORY[0x24BDBF148] != v5 || v4 != v3)
  {
    -[QLPreviewScrollView updateZoomScales](self, "updateZoomScales", *MEMORY[0x24BDBF148], v4);
    -[QLPreviewScrollView resetZoomScale](self, "resetZoomScale");
    -[QLPreviewScrollView setNeedsZoomUpdate:](self, "setNeedsZoomUpdate:", 0);
  }
}

- (double)_maxZoomScaleForContentSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;

  height = a3.height;
  width = a3.width;
  v5 = 3.0;
  if (_UIAccessibilityZoomTouchEnabled())
  {
    v6 = height * 0.0165999997;
    if (width * 0.0165999997 >= height * 0.0165999997)
      v6 = width * 0.0165999997;
    if (v6 >= 3.0)
      return v6;
    else
      return 3.0;
  }
  return v5;
}

- (void)updateZoomScales
{
  double v3;
  double v4;

  -[QLPreviewScrollView extent](self, "extent");
  -[QLPreviewScrollView updateZoomScalesWithSize:](self, "updateZoomScalesWithSize:", v3, v4);
}

- (void)updateZoomScalesWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  char v16;
  void *v17;
  double v18;
  int *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
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
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;

  if (self->_preventZoomUpdate)
    return;
  height = a3.height;
  width = a3.width;
  self->_lastUpdatedSize = a3;
  -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "previewScrollViewShouldResizeContentBasedOnPeripheryInsets:", self);

    if (v8)
    {
      -[QLPreviewScrollView window](self, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "_windowInterfaceOrientation") == 1)
      {

      }
      else
      {
        -[QLPreviewScrollView window](self, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "_windowInterfaceOrientation");

        if (v11 != 2)
        {
          width = width - self->_peripheryInsetsLandscape.left - self->_peripheryInsetsLandscape.right;
          goto LABEL_10;
        }
      }
      height = height - self->_peripheryInsetsPortrait.bottom - self->_peripheryInsetsPortrait.top;
    }
  }
  else
  {

  }
LABEL_10:
  -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
  -[QLPreviewScrollView _maxZoomScaleForContentSize:](self, "_maxZoomScaleForContentSize:");
  v13 = v12;
  self->_contentIsSmallerThanView = 0.0;
  -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
  if (v14 == 0.0
    || (-[QLPreviewScrollView contentViewSize](self, "contentViewSize"), v20 == 0.0)
    || width == 0.0
    || height == 0.0)
  {
    self->_pinchMaxZoomScale = 1.0;
    self->_maxZoomScale = 1.0;
    self->_minZoomScale = 1.0;
    self->_fillZoomScale = 1.0;
  }
  else
  {
    self->_maxZoomScale = 3.0;
    self->_pinchMaxZoomScale = v13;
    -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
    v22 = width / v21;
    -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
    v24 = height / v23;
    -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
    if (QLImageWithSizeShouldNotBeScaled())
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "scale");
      self->_minZoomScale = 1.0 / v26;

      if (v22 <= v24)
        v27 = v22;
      else
        v27 = v24;
      self->_pinchMaxZoomScale = v27;
      self->_maxZoomScale = v27;
      self->_fillZoomScale = v27;
      self->_contentIsSmallerThanView = 1.0;
      goto LABEL_12;
    }
    -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
    if (v28 < width)
    {
      -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
      if (v29 < height)
      {
        if (-[QLPreviewScrollView shouldFit](self, "shouldFit"))
        {
          if (v22 <= v24)
            v30 = v24;
          else
            v30 = v22;
          if (v22 <= v24)
            v31 = v22;
          else
            v31 = v24;
          self->_pinchMaxZoomScale = v30;
          self->_maxZoomScale = v30;
          self->_minZoomScale = v31;
          self->_fillZoomScale = self->_maxZoomScale;
          self->_contentIsSmallerThanView = 0.0;
        }
        else
        {
          if (v22 <= v24)
            v41 = v22;
          else
            v41 = v24;
          self->_pinchMaxZoomScale = v41;
          self->_maxZoomScale = v41;
          self->_fillZoomScale = v41;
          self->_contentIsSmallerThanView = 1.0;
          -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
          if (v42 >= width * 0.75
            || (-[QLPreviewScrollView contentViewSize](self, "contentViewSize"), v43 >= height * 0.75))
          {
            self->_minZoomScale = 1.0;
          }
          else
          {
            -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
            QLAdaptSizeToRect();
            v45 = v44;
            v47 = v46;
            -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
            if (v22 <= v24)
              v50 = v47 / v49;
            else
              v50 = v45 / v48;
            self->_minZoomScale = v50;
          }
        }
        goto LABEL_12;
      }
    }
    -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
    if (v32 <= width || (-[QLPreviewScrollView contentViewSize](self, "contentViewSize"), v33 >= height))
    {
      -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
      if (v37 >= width || (-[QLPreviewScrollView contentViewSize](self, "contentViewSize"), v38 <= height))
      {
        if (v22 <= v24)
        {
          self->_minZoomScale = v22;
          self->_fillZoomScale = v24;
        }
        else
        {
          self->_minZoomScale = v24;
          self->_fillZoomScale = v22;
        }
        goto LABEL_12;
      }
      -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
      self->_minZoomScale = height / v39;
      -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
      v36 = width / v40;
    }
    else
    {
      -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
      self->_minZoomScale = width / v34;
      -[QLPreviewScrollView contentViewSize](self, "contentViewSize");
      v36 = height / v35;
    }
    self->_fillZoomScale = v36;
  }
LABEL_12:
  -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "previewScrollView:extraMinimumZoomForMinimumZoomScale:maximumZoomScale:", self, self->_minZoomScale, fmin(self->_pinchMaxZoomScale, 3.0));
    self->_minZoomScale = v18 + self->_minZoomScale;

  }
  v19 = &OBJC_IVAR___QLPreviewScrollView__minZoomScale;
  if (self->_contentIsSmallerThanView != 0.0)
    v19 = &OBJC_IVAR___QLPreviewScrollView__maxZoomScale;
  *(_QWORD *)&self->_fitZoomScale = *(Class *)((char *)&self->super.super.super.super.isa + *v19);
  -[QLPreviewScrollView setMinimumZoomScale:](self, "setMinimumZoomScale:", self->_minZoomScale);
  -[QLPreviewScrollView setMaximumZoomScale:](self, "setMaximumZoomScale:", self->_pinchMaxZoomScale);
}

- (void)resetZoomScale
{
  if (!self->_inSizeChange)
  {
    -[QLPreviewScrollView setScrollEnabled:](self, "setScrollEnabled:", 0);
    -[QLPreviewScrollView setZoomScale:](self, "setZoomScale:", self->_minZoomScale);
  }
}

- (CGRect)zoomRectForScale:(double)a3 withCenter:(CGPoint)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  y = a4.y;
  x = a4.x;
  -[QLPreviewScrollView frame](self, "frame");
  v9 = v8 / a3;
  -[QLPreviewScrollView frame](self, "frame");
  v11 = v10 / a3;
  v12 = x - v11 * 0.5;
  v13 = y - v9 * 0.5;
  v14 = v9;
  result.size.height = v14;
  result.size.width = v11;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  void *v5;
  char v6;
  id v7;

  self->_inSizeChange = 1;
  -[QLPreviewScrollView setScrollEnabled:](self, "setScrollEnabled:", 1, a4);
  -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previewScrollViewWillBeginZooming:", self);

  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  _BOOL8 v7;
  void *v8;
  char v9;
  id v10;

  v7 = 0;
  self->_inSizeChange = 0;
  if (self->_contentIsSmallerThanView == 0.0)
    v7 = self->_minZoomScale < a5;
  -[QLPreviewScrollView setScrollEnabled:](self, "setScrollEnabled:", v7, a4);
  -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "previewScrollView:didEndZoomingAtScale:", self, a5);

  }
}

- (void)scrollViewDidZoom:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewScrollViewDidZoom:", self);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[QLPreviewScrollView zoomDelegate](self, "zoomDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewScrollViewDidScroll:", self);

  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  void *v3;
  void *v4;

  -[QLPreviewScrollView subviews](self, "subviews", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)needsZoomUpdate
{
  return self->_needsZoomUpdate;
}

- (CGSize)contentViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentViewSize.width;
  height = self->_contentViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)minZoomScale
{
  return self->_minZoomScale;
}

- (double)maxZoomScale
{
  return self->_maxZoomScale;
}

- (double)pinchMaxZoomScale
{
  return self->_pinchMaxZoomScale;
}

- (double)fillZoomScale
{
  return self->_fillZoomScale;
}

- (double)fitZoomScale
{
  return self->_fitZoomScale;
}

- (double)contentIsSmallerThanView
{
  return self->_contentIsSmallerThanView;
}

- (QLPreviewScrollViewZoomDelegate)zoomDelegate
{
  return (QLPreviewScrollViewZoomDelegate *)objc_loadWeakRetained((id *)&self->_zoomDelegate);
}

- (void)setZoomDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_zoomDelegate, a3);
}

- (BOOL)preventZoomUpdate
{
  return self->_preventZoomUpdate;
}

- (void)setPreventZoomUpdate:(BOOL)a3
{
  self->_preventZoomUpdate = a3;
}

- (BOOL)shouldFit
{
  return self->_shouldFit;
}

- (void)setShouldFit:(BOOL)a3
{
  self->_shouldFit = a3;
}

- (UIEdgeInsets)peripheryInsetsLandscape
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  UIEdgeInsets result;

  objc_copyStruct(v6, &self->_peripheryInsetsLandscape, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setPeripheryInsetsLandscape:(UIEdgeInsets)a3
{
  UIEdgeInsets v3;

  v3 = a3;
  objc_copyStruct(&self->_peripheryInsetsLandscape, &v3, 32, 1, 0);
}

- (UIEdgeInsets)peripheryInsetsPortrait
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  UIEdgeInsets result;

  objc_copyStruct(v6, &self->_peripheryInsetsPortrait, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setPeripheryInsetsPortrait:(UIEdgeInsets)a3
{
  UIEdgeInsets v3;

  v3 = a3;
  objc_copyStruct(&self->_peripheryInsetsPortrait, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_zoomDelegate);
}

@end
