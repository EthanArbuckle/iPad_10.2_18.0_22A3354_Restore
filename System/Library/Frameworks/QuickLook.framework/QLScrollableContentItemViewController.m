@implementation QLScrollableContentItemViewController

- (QLScrollableContentItemViewController)init
{
  objc_super v4;

  -[QLScrollableContentItemViewController setShouldFit:](self, "setShouldFit:", 0);
  v4.receiver = self;
  v4.super_class = (Class)QLScrollableContentItemViewController;
  return -[QLItemViewController init](&v4, sel_init);
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)loadView
{
  QLPreviewScrollView *v3;
  QLPreviewScrollView *scrollView;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *doubleTapGesture;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (!self->_scrollView)
  {
    v3 = objc_alloc_init(QLPreviewScrollView);
    scrollView = self->_scrollView;
    self->_scrollView = v3;

    -[QLPreviewScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 0);
    -[QLPreviewScrollView setZoomDelegate:](self->_scrollView, "setZoomDelegate:", self);
    -[QLPreviewScrollView setShouldFit:](self->_scrollView, "setShouldFit:", -[QLScrollableContentItemViewController shouldFit](self, "shouldFit"));
    -[QLPreviewScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
    v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__doubleTapRecognized_);
    doubleTapGesture = self->_doubleTapGesture;
    self->_doubleTapGesture = v5;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_doubleTapGesture, "setNumberOfTapsRequired:", 2);
    -[QLItemViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITapGestureRecognizer setDelegate:](self->_doubleTapGesture, "setDelegate:", v7);

    v20 = (id)objc_opt_new();
    objc_msgSend(v20, "addSubview:", self->_scrollView);
    -[QLPreviewScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[QLPreviewScrollView leftAnchor](self->_scrollView, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    -[QLPreviewScrollView rightAnchor](self->_scrollView, "rightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "rightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[QLPreviewScrollView topAnchor](self->_scrollView, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[QLPreviewScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[QLScrollableContentItemViewController setView:](self, "setView:", v20);
  }
}

- (void)setContentView:(id)a3
{
  UIView **p_contentView;
  UIView *contentView;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;

  v11 = (UIView *)a3;
  -[QLScrollableContentItemViewController loadView](self, "loadView");
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v11)
  {
    if (contentView)
    {
      -[UIView removeFromSuperview](contentView, "removeFromSuperview");
      -[UIView removeGestureRecognizer:](*p_contentView, "removeGestureRecognizer:", self->_doubleTapGesture);
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    -[QLScrollableContentItemViewController imageSize](self, "imageSize");
    v8 = v7;
    v10 = v9;
    -[UIView setFrame:](*p_contentView, "setFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v7, v9);
    -[UIView addGestureRecognizer:](*p_contentView, "addGestureRecognizer:", self->_doubleTapGesture);
    -[QLPreviewScrollView addSubview:](self->_scrollView, "addSubview:", *p_contentView);
    -[QLPreviewScrollView setContentViewSize:](self->_scrollView, "setContentViewSize:", v8, v10);
  }

}

- (void)setShouldFit:(BOOL)a3
{
  self->_shouldFit = a3;
  -[QLPreviewScrollView setShouldFit:](self->_scrollView, "setShouldFit:");
}

- (void)_doubleTapRecognized:(id)a3
{
  QLPreviewScrollView *scrollView;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  QLPreviewScrollView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  QLPreviewScrollView *v19;
  void *v20;
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
  id v33;

  scrollView = self->_scrollView;
  v5 = a3;
  -[QLPreviewScrollView zoomScale](scrollView, "zoomScale");
  v7 = v6;
  -[QLPreviewScrollView contentIsSmallerThanView](self->_scrollView, "contentIsSmallerThanView");
  v9 = v8;
  -[QLPreviewScrollView minZoomScale](self->_scrollView, "minZoomScale");
  v11 = v10;
  v12 = self->_scrollView;
  if (v9 != 0.0)
  {
    if (v7 != v10)
    {
      -[QLPreviewScrollView minZoomScale](v12, "minZoomScale");
LABEL_10:
      v15 = v13;
      goto LABEL_11;
    }
LABEL_9:
    -[QLPreviewScrollView maxZoomScale](v12, "maxZoomScale");
    goto LABEL_10;
  }
  -[QLPreviewScrollView minZoomScale](v12, "minZoomScale");
  v15 = v14;
  if (v7 == v11)
  {
    v15 = v14 * 2.5;
    -[QLPreviewScrollView fillZoomScale](self->_scrollView, "fillZoomScale");
    if (v15 < v16)
    {
      -[QLPreviewScrollView fillZoomScale](self->_scrollView, "fillZoomScale");
      v15 = v17;
    }
    -[QLPreviewScrollView maxZoomScale](self->_scrollView, "maxZoomScale");
    if (v15 > v18)
    {
      v12 = self->_scrollView;
      goto LABEL_9;
    }
  }
LABEL_11:
  v19 = self->_scrollView;
  objc_msgSend(v5, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v20);
  v22 = v21;
  v24 = v23;

  -[QLPreviewScrollView zoomRectForScale:withCenter:](v19, "zoomRectForScale:withCenter:", v15, v22, v24);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  -[QLPreviewScrollView zoomToRect:animated:](self->_scrollView, "zoomToRect:animated:", 1, v26, v28, v30, v32);
  -[QLItemViewController delegate](self, "delegate");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "previewItemViewController:wantsFullScreen:", self, 1);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;
  _QWORD v15[7];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[QLScrollableContentItemViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;

  if (width != v10 || height != v12)
  {
    -[QLPreviewScrollView setPreventZoomUpdate:](self->_scrollView, "setPreventZoomUpdate:", 1);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __92__QLScrollableContentItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_24C726338;
    v15[4] = self;
    *(double *)&v15[5] = width;
    *(double *)&v15[6] = height;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v15, 0);
  }
  v14.receiver = self;
  v14.super_class = (Class)QLScrollableContentItemViewController;
  -[QLScrollableContentItemViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __92__QLScrollableContentItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewZoomUpdate:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v7[5];
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)QLScrollableContentItemViewController;
  -[QLItemViewController transitionWillFinish:didComplete:](&v8, sel_transitionWillFinish_didComplete_);
  if (v4 && !a3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __74__QLScrollableContentItemViewController_transitionWillFinish_didComplete___block_invoke;
    v7[3] = &unk_24C724B00;
    v7[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v7, 0.1);
  }
}

uint64_t __74__QLScrollableContentItemViewController_transitionWillFinish_didComplete___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 1104);
  objc_msgSend(v1, "minZoomScale");
  return objc_msgSend(v1, "setZoomScale:");
}

- (void)previewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!self->_isVisible)
    -[QLPreviewScrollView setNeedsZoomUpdate:](self->_scrollView, "setNeedsZoomUpdate:", 1);
  -[QLPreviewScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 0);
  v5.receiver = self;
  v5.super_class = (Class)QLScrollableContentItemViewController;
  -[QLItemViewController previewWillAppear:](&v5, sel_previewWillAppear_, v3);
}

- (void)previewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLScrollableContentItemViewController;
  -[QLItemViewController previewDidAppear:](&v4, sel_previewDidAppear_, a3);
  self->_isVisible = 1;
}

- (void)previewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLScrollableContentItemViewController;
  -[QLItemViewController previewDidDisappear:](&v4, sel_previewDidDisappear_, a3);
  -[QLPreviewScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 1);
  self->_isVisible = 0;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  QLPreviewScrollView *scrollView;
  void *v13;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  -[QLItemViewController appearance](self, "appearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "presentationMode");

  v14.receiver = self;
  v14.super_class = (Class)QLScrollableContentItemViewController;
  -[QLItemViewController setAppearance:animated:](&v14, sel_setAppearance_animated_, v6, v4);
  if (v8 == 4)
    -[QLPreviewScrollView setNeedsZoomUpdate:](self->_scrollView, "setNeedsZoomUpdate:", 1);
  -[QLScrollableContentItemViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_windowInterfaceOrientation");

  objc_msgSend(v6, "peripheryInsets");
  scrollView = self->_scrollView;
  if (v11 == 1)
    -[QLPreviewScrollView setPeripheryInsetsPortrait:](scrollView, "setPeripheryInsetsPortrait:");
  else
    -[QLPreviewScrollView setPeripheryInsetsLandscape:](scrollView, "setPeripheryInsetsLandscape:");
  -[QLScrollableContentItemViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  -[QLScrollableContentItemViewController _updateScrollViewZoomUpdate:](self, "_updateScrollViewZoomUpdate:");

}

- (BOOL)canPinchToDismiss
{
  double v3;
  double v4;
  double v5;

  -[QLPreviewScrollView zoomScale](self->_scrollView, "zoomScale");
  v4 = v3;
  -[QLPreviewScrollView minZoomScale](self->_scrollView, "minZoomScale");
  return v4 == v5;
}

- (BOOL)supportsScrollingUpAndDownUsingKeyCommands
{
  return 0;
}

- (id)scrollView
{
  return self->_scrollView;
}

- (void)_updateScrollViewZoomUpdate:(CGSize)a3
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
  QLPreviewScrollView *scrollView;
  double v15;
  QLPreviewScrollView *v16;
  double v17;

  height = a3.height;
  width = a3.width;
  -[QLPreviewScrollView setPreventZoomUpdate:](self->_scrollView, "setPreventZoomUpdate:", 0);
  -[QLPreviewScrollView zoomScale](self->_scrollView, "zoomScale");
  v7 = v6;
  -[QLPreviewScrollView fitZoomScale](self->_scrollView, "fitZoomScale");
  v9 = v8;
  -[QLPreviewScrollView minZoomScale](self->_scrollView, "minZoomScale");
  v11 = v10;
  -[QLPreviewScrollView maxZoomScale](self->_scrollView, "maxZoomScale");
  v13 = v12;
  -[QLPreviewScrollView updateZoomScalesWithSize:](self->_scrollView, "updateZoomScalesWithSize:", width, height);
  if (v7 == v9)
  {
    -[QLPreviewScrollView fitZoomScale](self->_scrollView, "fitZoomScale");
  }
  else
  {
    scrollView = self->_scrollView;
    if (v7 != v11)
    {
      -[QLPreviewScrollView maxZoomScale](scrollView, "maxZoomScale");
      if (v7 == v13)
        goto LABEL_10;
      v16 = self->_scrollView;
      if (v7 > v15)
      {
        -[QLPreviewScrollView maxZoomScale](v16, "maxZoomScale");
        goto LABEL_10;
      }
      -[QLPreviewScrollView minZoomScale](v16, "minZoomScale");
      if (v7 >= v17)
        goto LABEL_10;
      scrollView = self->_scrollView;
    }
    -[QLPreviewScrollView minZoomScale](scrollView, "minZoomScale");
  }
LABEL_10:
  -[QLPreviewScrollView setZoomScale:](self->_scrollView, "setZoomScale:");
}

- (BOOL)shouldLayoutContentBasedOnPeripheryInsets
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;

  -[QLItemViewController appearance](self, "appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationMode");

  -[QLScrollableContentItemViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v10 = *MEMORY[0x24BDBF148];
  v11 = *(double *)(MEMORY[0x24BDBF148] + 8);

  if (v7 == v10 && v9 == v11)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
  }
  else
  {
    -[QLScrollableContentItemViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
  }
  v16 = v14;
  v17 = v15;

  -[QLScrollableContentItemViewController imageSize](self, "imageSize");
  v20 = !QLSizeAspectRatioEqualToSizeAspectRatioWithTolerance(v18, v19, v16, v17);
  return v4 != 4 && v20;
}

- (void)previewScrollViewDidScroll:(id)a3
{
  id v4;

  -[QLScrollableContentItemViewController didScroll:](self, "didScroll:", a3);
  -[QLScrollableContentItemViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self->_contentView, "frame");
  objc_msgSend(v4, "convertRect:fromView:", self->_scrollView);
  -[QLItemViewController setContentFrame:](self, "setContentFrame:");

}

- (void)previewScrollViewDidZoom:(id)a3
{
  id v4;

  -[QLScrollableContentItemViewController didZoom:](self, "didZoom:", a3);
  -[QLScrollableContentItemViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self->_contentView, "frame");
  objc_msgSend(v4, "convertRect:fromView:", self->_scrollView);
  -[QLItemViewController setContentFrame:](self, "setContentFrame:");

}

- (double)previewScrollView:(id)a3 extraMinimumZoomForMinimumZoomScale:(double)a4 maximumZoomScale:(double)a5
{
  void *v7;
  double v8;

  -[QLItemViewController appearance](self, "appearance", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "presentationMode") == 4)
    v8 = (a5 - a4) * 0.002;
  else
    v8 = 0.0;

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)supportsChromeless
{
  return 1;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)shouldFit
{
  return self->_shouldFit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapGesture, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
