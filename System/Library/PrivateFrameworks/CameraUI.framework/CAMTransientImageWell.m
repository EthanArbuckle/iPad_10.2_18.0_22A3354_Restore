@implementation CAMTransientImageWell

- (CAMTransientImageWell)initWithFrame:(CGRect)a3
{
  CAMTransientImageWell *v3;
  CAMTransientImageWell *v4;
  uint64_t v5;
  UITapGestureRecognizer *tapGestureRecognizer;
  uint64_t v7;
  UISwipeGestureRecognizer *unstashGestureRecognizer;
  uint64_t v9;
  UISwipeGestureRecognizer *stashGestureRecognizer;
  CAMTransientImageWell *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMTransientImageWell;
  v3 = -[CAMTransientImageWell initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_autoStashesImages = 1;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel__handleTap_);
    tapGestureRecognizer = v4->__tapGestureRecognizer;
    v4->__tapGestureRecognizer = (UITapGestureRecognizer *)v5;

    -[UITapGestureRecognizer setDelegate:](v4->__tapGestureRecognizer, "setDelegate:", v4);
    -[CAMTransientImageWell addGestureRecognizer:](v4, "addGestureRecognizer:", v4->__tapGestureRecognizer);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", v4, sel__handleUnstashSwipe_);
    unstashGestureRecognizer = v4->__unstashGestureRecognizer;
    v4->__unstashGestureRecognizer = (UISwipeGestureRecognizer *)v7;

    -[UISwipeGestureRecognizer setDelegate:](v4->__unstashGestureRecognizer, "setDelegate:", v4);
    -[UISwipeGestureRecognizer setDirection:](v4->__unstashGestureRecognizer, "setDirection:", 1);
    -[CAMTransientImageWell addGestureRecognizer:](v4, "addGestureRecognizer:", v4->__unstashGestureRecognizer);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", v4, sel__handleStashSwipe_);
    stashGestureRecognizer = v4->__stashGestureRecognizer;
    v4->__stashGestureRecognizer = (UISwipeGestureRecognizer *)v9;

    -[UISwipeGestureRecognizer setDelegate:](v4->__stashGestureRecognizer, "setDelegate:", v4);
    -[UISwipeGestureRecognizer setDirection:](v4->__stashGestureRecognizer, "setDirection:", 2);
    -[CAMTransientImageWell addGestureRecognizer:](v4, "addGestureRecognizer:", v4->__stashGestureRecognizer);
    v11 = v4;
  }

  return v4;
}

- (void)_setStashed:(BOOL)a3
{
  -[CAMTransientImageWell _setStashed:animated:](self, "_setStashed:animated:", a3, 0);
}

- (void)_setStashed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  if (self->__stashed != a3)
  {
    v4 = a4;
    self->__stashed = a3;
    -[CAMTransientImageWell setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __46__CAMTransientImageWell__setStashed_animated___block_invoke;
      v6[3] = &unk_1EA328868;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, 0.3, 0.0);
    }
  }
}

uint64_t __46__CAMTransientImageWell__setStashed_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  objc_super v13;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CAMTransientImageWell _imageView](self, "_imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (-[CAMTransientImageWell _imageView](self, "_imageView"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "frame"),
        v14.x = x,
        v14.y = y,
        v10 = CGRectContainsPoint(v15, v14),
        v9,
        v10))
  {
    v13.receiver = self;
    v13.super_class = (Class)CAMTransientImageWell;
    -[CAMTransientImageWell hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)layoutSubviews
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
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CAMTransientImageWell;
  -[CAMTransientImageWell layoutSubviews](&v14, sel_layoutSubviews);
  -[CAMTransientImageWell _imageView](self, "_imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientImageWell _unorientedFrameForImageView:](self, "_unorientedFrameForImageView:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CAMTransientImageWell _imageView](self, "_imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CAMViewSetBoundsAndCenterForFrame(v12, v5, v7, v9, v11);

  -[CAMTransientImageWell _imageView](self, "_imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v13, -[CAMTransientImageWell orientation](self, "orientation"), 0);

}

- (CGRect)_unorientedFrameForImageView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v4 = a3;
  -[CAMTransientImageWell _imageViewMaxSize](self, "_imageViewMaxSize");
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "size");
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  -[CAMTransientImageWell _imageViewSpawnPoint](self, "_imageViewSpawnPoint");
  if (-[CAMTransientImageWell _isStashed](self, "_isStashed"))
  {
    -[CAMTransientImageWell orientation](self, "orientation");
    -[CAMTransientImageWell _imageViewStashPoint](self, "_imageViewStashPoint", 0, 0, 0, 0, 0, 0);
  }
  UIRectCenteredAboutPoint();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)_handleTap:(id)a3
{
  void *v4;
  id v5;

  if (-[CAMTransientImageWell _isStashed](self, "_isStashed", a3))
  {
    -[CAMTransientImageWell _setStashed:animated:](self, "_setStashed:animated:", 0, 1);
    -[CAMTransientImageWell delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transientImageWellDidGestureToUnstash:", self);

    if (-[CAMTransientImageWell autoStashesImages](self, "autoStashesImages"))
      -[CAMTransientImageWell _restartAutoStashTimerWithDuration:](self, "_restartAutoStashTimerWithDuration:", 2.3);
  }
  else
  {
    -[CAMTransientImageWell delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transientImageWellDidGestureToPresentCameraRoll:", self);

  }
}

- (void)_handleUnstashSwipe:(id)a3
{
  void *v4;

  if (-[CAMTransientImageWell _isStashed](self, "_isStashed", a3))
  {
    -[CAMTransientImageWell _setStashed:animated:](self, "_setStashed:animated:", 0, 1);
    -[CAMTransientImageWell delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transientImageWellDidGestureToUnstash:", self);

    if (-[CAMTransientImageWell autoStashesImages](self, "autoStashesImages"))
      -[CAMTransientImageWell _restartAutoStashTimerWithDuration:](self, "_restartAutoStashTimerWithDuration:", 2.3);
  }
}

- (void)_handleStashSwipe:(id)a3
{
  id v4;

  if (!-[CAMTransientImageWell _isStashed](self, "_isStashed", a3))
  {
    -[CAMTransientImageWell _setStashed:animated:](self, "_setStashed:animated:", 1, 1);
    -[CAMTransientImageWell delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transientImageWellDidGestureToStash:", self);

  }
}

- (CGSize)_imageViewMaxSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[CAMTransientImageWell bounds](self, "bounds");
  v4 = v3;
  -[CAMTransientImageWell bounds](self, "bounds");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)_imageViewSizeForContentSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CAMTransientImageWell _imageViewMaxSize](self, "_imageViewMaxSize");
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  v5 = height * 0.0 + 0.0 * width;
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGPoint)_imageViewSpawnPoint
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
  CGPoint result;

  -[CAMTransientImageWell bounds](self, "bounds");
  v4 = v3;
  -[CAMTransientImageWell bounds](self, "bounds");
  v6 = v4 - v5;
  -[CAMTransientImageWell bounds](self, "bounds");
  v9 = v6 + v8 + v7 * 0.5;
  -[CAMTransientImageWell bounds](self, "bounds");
  v12 = v11 + v10 * 0.5;
  v13 = v9;
  result.y = v12;
  result.x = v13;
  return result;
}

- (CGPoint)_imageViewStashPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[CAMTransientImageWell _imageViewSpawnPoint](self, "_imageViewSpawnPoint");
  v4 = v3;
  -[CAMTransientImageWell bounds](self, "bounds");
  v6 = -(v5 * 0.5 + -10.0);
  v7 = v4;
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)_restartAutoStashTimer
{
  -[CAMTransientImageWell _restartAutoStashTimerWithDuration:](self, "_restartAutoStashTimerWithDuration:", 2.0);
}

- (void)_restartAutoStashTimerWithDuration:(double)a3
{
  id v5;

  -[CAMTransientImageWell _cancelAutoStashTimer](self, "_cancelAutoStashTimer");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleAutoStashTimerFired_, 0, 0, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMTransientImageWell set_autoStashTimer:](self, "set_autoStashTimer:", v5);

}

- (void)_handleAutoStashTimerFired:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[CAMTransientImageWell _autoStashTimer](self, "_autoStashTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CAMTransientImageWell _imageView](self, "_imageView");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[CAMTransientImageWell _isStashed](self, "_isStashed");

      if (!v8)
        -[CAMTransientImageWell _setStashed:animated:](self, "_setStashed:animated:", 1, 1);
    }
  }
}

- (void)_cancelAutoStashTimer
{
  void *v3;
  void *v4;

  -[CAMTransientImageWell _autoStashTimer](self, "_autoStashTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CAMTransientImageWell _autoStashTimer](self, "_autoStashTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[CAMTransientImageWell set_autoStashTimer:](self, "set_autoStashTimer:", 0);
  }
}

- (void)_dismissImageAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[CAMTransientImageWell _imageView](self, "_imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMTransientImageWell _imageView](self, "_imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMTransientImageWell _dismissImageView:animated:](self, "_dismissImageView:animated:", v6, v3);

  }
  -[CAMTransientImageWell _setImageView:](self, "_setImageView:", 0);
  -[CAMTransientImageWell _setStashed:animated:](self, "_setStashed:animated:", 0, v3);
}

- (void)_dismissImageView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[CAMTransientImageWell _imageViewSpawnPoint](self, "_imageViewSpawnPoint");
    if (v4)
    {
      v9 = v7;
      v10 = v8;
      v11 = (void *)MEMORY[0x1E0DC3F10];
      v12 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __52__CAMTransientImageWell__dismissImageView_animated___block_invoke;
      v15[3] = &unk_1EA32B498;
      v16 = v6;
      v17 = v9;
      v18 = v10;
      v13[0] = v12;
      v13[1] = 3221225472;
      v13[2] = __52__CAMTransientImageWell__dismissImageView_animated___block_invoke_2;
      v13[3] = &unk_1EA328A68;
      v14 = v16;
      objc_msgSend(v11, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v15, v13, 0.4, 0.0, 0.9, 0.0);

    }
    else
    {
      objc_msgSend(v6, "removeFromSuperview");
    }
  }

}

uint64_t __52__CAMTransientImageWell__dismissImageView_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", -*(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __52__CAMTransientImageWell__dismissImageView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMTransientImageWell setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMTransientImageWell setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __49__CAMTransientImageWell_setOrientation_animated___block_invoke;
      v6[3] = &unk_1EA328868;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, 0.3, 0.0);
    }
  }
}

uint64_t __49__CAMTransientImageWell_setOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setAutoStashesImages:(BOOL)a3
{
  if (self->_autoStashesImages != a3)
  {
    self->_autoStashesImages = a3;
    if (a3)
      -[CAMTransientImageWell _restartAutoStashTimer](self, "_restartAutoStashTimer");
    else
      -[CAMTransientImageWell _cancelAutoStashTimer](self, "_cancelAutoStashTimer");
  }
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[CAMTransientImageWell _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  -[CAMTransientImageWell setImage:animated:](self, "setImage:animated:", a3, 0);
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  _QWORD v20[5];
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  v4 = a4;
  v6 = a3;
  -[CAMTransientImageWell _dismissImageAnimated:](self, "_dismissImageAnimated:", 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);

  -[CAMTransientImageWell _setImageView:](self, "_setImageView:", v7);
  -[CAMTransientImageWell _imageView](self, "_imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientImageWell addSubview:](self, "addSubview:", v8);

  -[CAMTransientImageWell layoutIfNeeded](self, "layoutIfNeeded");
  v9 = *MEMORY[0x1E0CD2A68];
  -[CAMTransientImageWell _imageView](self, "_imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerCurve:", v9);

  -[CAMTransientImageWell _imageView](self, "_imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", 4.0);

  -[CAMTransientImageWell _imageView](self, "_imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMasksToBounds:", 1);

  if (v4)
  {
    memset(&v25, 0, sizeof(v25));
    -[CAMTransientImageWell _imageView](self, "_imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "transform");
    else
      memset(&v25, 0, sizeof(v25));

    v23 = v25;
    CGAffineTransformScale(&v24, &v23, 0.0, 0.0);
    -[CAMTransientImageWell _imageView](self, "_imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v24;
    objc_msgSend(v18, "setTransform:", &v22);

    -[CAMTransientImageWell _imageView](self, "_imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlpha:", 0.0);

    v20[1] = 3221225472;
    v21 = v25;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[2] = __43__CAMTransientImageWell_setImage_animated___block_invoke;
    v20[3] = &unk_1EA32AA78;
    v20[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v20, 0, 0.25, 0.0, 0.9, 0.5);
    if (-[CAMTransientImageWell autoStashesImages](self, "autoStashesImages"))
      -[CAMTransientImageWell _restartAutoStashTimerWithDuration:](self, "_restartAutoStashTimerWithDuration:", 2.25);
  }
  else if (-[CAMTransientImageWell autoStashesImages](self, "autoStashesImages"))
  {
    -[CAMTransientImageWell _restartAutoStashTimer](self, "_restartAutoStashTimer");
  }
}

void __43__CAMTransientImageWell_setImage_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "_imageView", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransform:", &v4);

  objc_msgSend(*(id *)(a1 + 32), "_imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (CGRect)imageFrame
{
  void *v2;
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
  CGRect result;

  -[CAMTransientImageWell _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)currentImageHidden
{
  void *v2;
  char v3;

  -[CAMTransientImageWell _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setCurrentImageHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMTransientImageWell _imageView](self, "_imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (CAMTransientImageWellDelegate)delegate
{
  return (CAMTransientImageWellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)autoStashesImages
{
  return self->_autoStashesImages;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void)_setImageView:(id)a3
{
  objc_storeStrong((id *)&self->__imageView, a3);
}

- (NSTimer)_autoStashTimer
{
  return self->__autoStashTimer;
}

- (void)set_autoStashTimer:(id)a3
{
  objc_storeStrong((id *)&self->__autoStashTimer, a3);
}

- (BOOL)_isStashed
{
  return self->__stashed;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (UISwipeGestureRecognizer)_unstashGestureRecognizer
{
  return self->__unstashGestureRecognizer;
}

- (UISwipeGestureRecognizer)_stashGestureRecognizer
{
  return self->__stashGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__stashGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__unstashGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__autoStashTimer, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
