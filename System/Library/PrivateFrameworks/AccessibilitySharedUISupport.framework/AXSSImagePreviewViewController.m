@implementation AXSSImagePreviewViewController

- (AXSSImagePreviewViewController)initWithContentSnapshot:(id)a3
{
  id v4;
  AXSSImagePreviewViewController *v5;
  AXSSImagePreviewViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXSSImagePreviewViewController;
  v5 = -[AXSSImagePreviewViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[AXSSImagePreviewViewController setContentSnapshot:](v5, "setContentSnapshot:", v4);

  return v6;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double Height;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)AXSSImagePreviewViewController;
  -[AXSSImagePreviewViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  -[AXSSImagePreviewViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v9);

  if (Height <= 1.0)
  {
    -[AXSSImagePreviewViewController contentSnapshot](self, "contentSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

  }
  else
  {
    if (!-[AXSSImagePreviewViewController _isSnapshotViewAttached](self, "_isSnapshotViewAttached"))
    {
      -[AXSSImagePreviewViewController scrollView](self, "scrollView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSImagePreviewViewController contentSnapshot](self, "contentSnapshot");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", v6);

    }
    -[AXSSImagePreviewViewController _fitImageIfNeeded:](self, "_fitImageIfNeeded:", 0);
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXSSImagePreviewViewController;
  -[AXSSImagePreviewViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AXSSImagePreviewViewController _imagePreviewViewControllerSetupUI](self, "_imagePreviewViewControllerSetupUI");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSSImagePreviewViewController;
  -[AXSSImagePreviewViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AXSSImagePreviewViewController _addGestureRecognizers](self, "_addGestureRecognizers");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSSImagePreviewViewController;
  -[AXSSImagePreviewViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[AXSSImagePreviewViewController _removeGestureRecognizers](self, "_removeGestureRecognizers");
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v7;
  void *v12;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self->_edgeInsets.top;
  if (self->_edgeInsets.left != a3.left
    || v7 != top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets.top = top;
    self->_edgeInsets.left = a3.left;
    self->_edgeInsets.bottom = a3.bottom;
    self->_edgeInsets.right = a3.right;
    -[AXSSImagePreviewViewController scrollView](self, "scrollView", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setScrollIndicatorInsets:", top, left, bottom, right);

    -[AXSSImagePreviewViewController _centerImageIfNeeded](self, "_centerImageIfNeeded");
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  void *v7;

  v4 = a3;
  -[AXSSImagePreviewViewController scrollView](self, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {

LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = -[AXSSImagePreviewViewController _isSnapshotViewAttached](self, "_isSnapshotViewAttached");

  if (!v6)
    goto LABEL_5;
  -[AXSSImagePreviewViewController contentSnapshot](self, "contentSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSSImagePreviewViewController scrollView](self, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    if (-[AXSSImagePreviewViewController isManualZoomActive](self, "isManualZoomActive"))
      -[AXSSImagePreviewViewController _viewShouldExpand](self, "_viewShouldExpand");
    -[AXSSImagePreviewViewController _centerImageIfNeeded](self, "_centerImageIfNeeded");
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSSImagePreviewViewController scrollView](self, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[AXSSImagePreviewViewController _centerImageIfNeeded](self, "_centerImageIfNeeded");
}

- (void)_doubleTapGestureRecognized:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[AXSSImagePreviewViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v6)
  {

  }
  else
  {
    v5 = objc_msgSend(v6, "state");

    if (v5 != 3)
      goto LABEL_6;
  }
  -[AXSSImagePreviewViewController _toggleManualZoomMode](self, "_toggleManualZoomMode");
LABEL_6:

}

- (void)_pinchGestureRecognized:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[AXSSImagePreviewViewController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v6)
  {

  }
  else
  {
    v5 = objc_msgSend(v6, "state");

    if (v5 != 1)
      goto LABEL_7;
  }
  if (!-[AXSSImagePreviewViewController isManualZoomActive](self, "isManualZoomActive"))
    -[AXSSImagePreviewViewController _toggleManualZoomMode](self, "_toggleManualZoomMode");
LABEL_7:

}

- (void)_swipeGestureRecognized:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[AXSSImagePreviewViewController swipeGestureRecognizer](self, "swipeGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v6)
  {

  }
  else
  {
    v5 = objc_msgSend(v6, "state");

    if (v5 != 3)
      goto LABEL_6;
  }
  -[AXSSImagePreviewViewController _viewShouldExpand](self, "_viewShouldExpand");
LABEL_6:

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isSnapshotViewAttached
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AXSSImagePreviewViewController contentSnapshot](self, "contentSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_toggleManualZoomMode
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BEBD940]);
  objc_msgSend(v3, "prepare");
  -[AXSSImagePreviewViewController _stopScrollViewAnimations](self, "_stopScrollViewAnimations");
  if (-[AXSSImagePreviewViewController isManualZoomActive](self, "isManualZoomActive"))
  {
    -[AXSSImagePreviewViewController setIsManualZoomActive:](self, "setIsManualZoomActive:", 0);
    -[AXSSImagePreviewViewController _fitImageIfNeeded:](self, "_fitImageIfNeeded:", 1);
  }
  else
  {
    -[AXSSImagePreviewViewController setIsManualZoomActive:](self, "setIsManualZoomActive:", 1);
    -[AXSSImagePreviewViewController _viewShouldExpand](self, "_viewShouldExpand");
    -[AXSSImagePreviewViewController _zoomImageToBestScaleIfNeeded:](self, "_zoomImageToBestScaleIfNeeded:", 1);
  }
  objc_msgSend(v3, "selectionChanged");

}

- (CGSize)_scrollViewClippedSize
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
  CGSize result;

  -[AXSSImagePreviewViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[AXSSImagePreviewViewController edgeInsets](self, "edgeInsets");
  v10 = v5 - (v8 + v9);
  v13 = v7 - (v11 + v12);
  v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)_fitImageIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;

  v3 = a3;
  if (!-[AXSSImagePreviewViewController isManualZoomActive](self, "isManualZoomActive")
    && -[AXSSImagePreviewViewController _isSnapshotViewAttached](self, "_isSnapshotViewAttached"))
  {
    -[AXSSImagePreviewViewController _scrollViewClippedSize](self, "_scrollViewClippedSize");
    v6 = v5;
    v8 = v7;
    -[AXSSImagePreviewViewController contentSnapshot](self, "contentSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

    v14 = floor(v8) < 1.0 || v13 < 1.0;
    if (!v14 && v11 >= 1.0)
    {
      -[AXSSImagePreviewViewController edgeInsets](self, "edgeInsets");
      v18 = -v17;
      v19 = v13 * (v6 / v11);
      if (v19 <= v8)
        v20 = (v19 - v8) * 0.5;
      else
        v20 = v19 - v8;
      v21 = (v11 - v6) * 0.5;
      v22 = (v13 - v8) * 0.5;
      if (v13 > v8)
        v22 = v13 - v8;
      v23 = v11 > v6;
      if (v11 <= v6)
        v24 = 1.0;
      else
        v24 = v6 / v11;
      if (v23)
      {
        v25 = v20;
      }
      else
      {
        v18 = v21;
        v25 = v22;
      }
      v26 = ceil(v18);
      v27 = floor(v25 - v16);
      -[AXSSImagePreviewViewController scrollView](self, "scrollView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setMinimumZoomScale:", v24);

      -[AXSSImagePreviewViewController scrollView](self, "scrollView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setMaximumZoomScale:", v24);

      -[AXSSImagePreviewViewController _zoomImage:withContentOffset:animated:](self, "_zoomImage:withContentOffset:animated:", v3, v24, v26, v27);
    }
  }
}

- (void)_zoomImageToBestScaleIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  _BOOL4 v16;
  _BOOL4 v17;
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
  void *v28;
  void *v29;

  v3 = a3;
  if (-[AXSSImagePreviewViewController isManualZoomActive](self, "isManualZoomActive")
    && -[AXSSImagePreviewViewController _isSnapshotViewAttached](self, "_isSnapshotViewAttached"))
  {
    -[AXSSImagePreviewViewController contentSnapshot](self, "contentSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;

    -[AXSSImagePreviewViewController _scrollViewClippedSize](self, "_scrollViewClippedSize");
    v12 = v10;
    v13 = v11;
    v14 = floor(v11) < 1.0 || v9 < 1.0;
    if (!v14 && v7 >= 1.0)
    {
      v16 = v7 > v10;
      v17 = v9 > v11;
      v18 = v10 / v7;
      if (v10 / v7 >= v13 / v9)
        v19 = v10 / v7;
      else
        v19 = v13 / v9;
      if (v10 / v7 >= v13 / v9)
        v18 = v13 / v9;
      v20 = 2.5;
      if (v19 <= 2.5)
        v20 = v19;
      if (v16 && v17)
        v21 = 1.0;
      else
        v21 = v20;
      if (v16 && v17)
        v22 = v18;
      else
        v22 = 1.0;
      -[AXSSImagePreviewViewController edgeInsets](self, "edgeInsets");
      v25 = -(v13 - v21 * v9) * 0.5 - v24;
      v26 = ceil(-(v12 - v21 * v7) * 0.5 - v23);
      v27 = floor(v25);
      -[AXSSImagePreviewViewController scrollView](self, "scrollView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setMinimumZoomScale:", v22);

      -[AXSSImagePreviewViewController scrollView](self, "scrollView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setMaximumZoomScale:", 2.5);

      -[AXSSImagePreviewViewController _zoomImage:withContentOffset:animated:](self, "_zoomImage:withContentOffset:animated:", v3, v21, v26, v27);
    }
  }
}

- (void)_centerImageIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
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
  id v22;

  if (-[AXSSImagePreviewViewController _isSnapshotViewAttached](self, "_isSnapshotViewAttached"))
  {
    -[AXSSImagePreviewViewController _scrollViewClippedSize](self, "_scrollViewClippedSize");
    v4 = v3;
    v6 = v5;
    -[AXSSImagePreviewViewController scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentSize");
    v9 = v8;
    v11 = v10;

    -[AXSSImagePreviewViewController edgeInsets](self, "edgeInsets");
    v16 = (v4 - v9) * 0.5;
    if (v9 >= v4)
      v16 = -0.0;
    v17 = v15 + v16;
    v18 = v13 + v16;
    v19 = (v6 - v11) * 0.5;
    if (v11 >= v6)
      v19 = -0.0;
    v20 = v12 + v19;
    v21 = v14 + v19;
    -[AXSSImagePreviewViewController scrollView](self, "scrollView");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentInset:", v20, v18, v21, v17);

  }
}

- (void)_zoomImage:(double)a3 withContentOffset:(CGPoint)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  double v17;
  double v18;
  double v19;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  -[AXSSImagePreviewViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoomScale");
  if (v10 != a3 || ((objc_msgSend(v9, "contentOffset"), v12 == x) ? (v13 = v11 == y) : (v13 = 0), !v13))
  {
    if (v5)
    {
      v14 = (void *)MEMORY[0x24BEBDB00];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __72__AXSSImagePreviewViewController__zoomImage_withContentOffset_animated___block_invoke;
      v15[3] = &unk_24E0773B0;
      v16 = v9;
      v17 = a3;
      v18 = x;
      v19 = y;
      objc_msgSend(v14, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x20000, v15, 0, 0.5, 0.0, 0.800000012, 5.0);

    }
    else
    {
      objc_msgSend(v9, "setZoomScale:animated:", 0, a3);
      objc_msgSend(v9, "setContentOffset:animated:", 0, x, y);
    }
  }

}

uint64_t __72__AXSSImagePreviewViewController__zoomImage_withContentOffset_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setZoomScale:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_stopScrollViewAnimations
{
  id v2;

  -[AXSSImagePreviewViewController scrollView](self, "scrollView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomScale");
  objc_msgSend(v2, "setZoomScale:animated:", 0);
  objc_msgSend(v2, "contentOffset");
  objc_msgSend(v2, "setContentOffset:animated:", 0);

}

- (void)_imagePreviewViewControllerSetupUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  -[AXSSImagePreviewViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD918]);
    -[AXSSImagePreviewViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = (id)objc_msgSend(v4, "initWithFrame:");

    objc_msgSend(v7, "setAutoresizingMask:", 18);
    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v7, "setAlwaysBounceVertical:", 1);
    objc_msgSend(v7, "setAlwaysBounceHorizontal:", 1);
    -[AXSSImagePreviewViewController edgeInsets](self, "edgeInsets");
    objc_msgSend(v7, "setScrollIndicatorInsets:");
    -[AXSSImagePreviewViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[AXSSImagePreviewViewController setScrollView:](self, "setScrollView:", v7);
  }
}

- (void)_addGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[AXSSImagePreviewViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__doubleTapGestureRecognized_);
    objc_msgSend(v4, "setNumberOfTapsRequired:", 2);
    objc_msgSend(v4, "setNumberOfTouchesRequired:", 1);
    objc_msgSend(v4, "setDelegate:", self);
    -[AXSSImagePreviewViewController scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", v4);

    -[AXSSImagePreviewViewController setDoubleTapGestureRecognizer:](self, "setDoubleTapGestureRecognizer:", v4);
  }
  -[AXSSImagePreviewViewController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD808]), "initWithTarget:action:", self, sel__pinchGestureRecognized_);
    objc_msgSend(v7, "setDelegate:", self);
    -[AXSSImagePreviewViewController scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addGestureRecognizer:", v7);

    -[AXSSImagePreviewViewController setPinchGestureRecognizer:](self, "setPinchGestureRecognizer:", v7);
  }
  -[AXSSImagePreviewViewController swipeGestureRecognizer](self, "swipeGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9B0]), "initWithTarget:action:", self, sel__swipeGestureRecognized_);
    objc_msgSend(v11, "setDelegate:", self);
    objc_msgSend(v11, "setDirection:", 8);
    -[AXSSImagePreviewViewController scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", v11);

    -[AXSSImagePreviewViewController setSwipeGestureRecognizer:](self, "setSwipeGestureRecognizer:", v11);
  }
}

- (void)_removeGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AXSSImagePreviewViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AXSSImagePreviewViewController scrollView](self, "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeGestureRecognizer:", v8);

    -[AXSSImagePreviewViewController setDoubleTapGestureRecognizer:](self, "setDoubleTapGestureRecognizer:", 0);
  }
  -[AXSSImagePreviewViewController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AXSSImagePreviewViewController scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", v4);

    -[AXSSImagePreviewViewController setPinchGestureRecognizer:](self, "setPinchGestureRecognizer:", 0);
  }
  -[AXSSImagePreviewViewController swipeGestureRecognizer](self, "swipeGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[AXSSImagePreviewViewController scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", v6);

    -[AXSSImagePreviewViewController setSwipeGestureRecognizer:](self, "setSwipeGestureRecognizer:", 0);
  }

}

- (void)_viewShouldExpand
{
  id v3;

  -[AXSSImagePreviewViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "imagePreviewShouldExpand:", self);

}

- (AXSSImagePreviewViewControllerDelegate)delegate
{
  return (AXSSImagePreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (UIView)contentSnapshot
{
  return self->_contentSnapshot;
}

- (void)setContentSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_contentSnapshot, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, a3);
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, a3);
}

- (UISwipeGestureRecognizer)swipeGestureRecognizer
{
  return self->_swipeGestureRecognizer;
}

- (void)setSwipeGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_swipeGestureRecognizer, a3);
}

- (BOOL)isManualZoomActive
{
  return self->_isManualZoomActive;
}

- (void)setIsManualZoomActive:(BOOL)a3
{
  self->_isManualZoomActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
