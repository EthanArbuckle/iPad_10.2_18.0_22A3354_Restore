@implementation CAMImageWell

- (CAMImageWell)initWithLayoutStyle:(int64_t)a3
{
  CAMImageWell *v4;
  CAMImageWell *v5;
  CAMImageWell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMImageWell;
  v4 = -[CAMImageWell initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[CAMImageWell _commonCAMImageWellInitializationWithLayoutStyle:](v4, "_commonCAMImageWellInitializationWithLayoutStyle:", a3);
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMImageWellInitializationWithLayoutStyle:(int64_t)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *v9;
  UIView *containerView;
  void *v11;
  uint64_t v12;
  void *v13;
  UIImageView *v14;
  UIImageView *thumbnailImageView;
  NSMutableArray *v16;
  NSMutableArray *dimmingViewQueue;

  self->_layoutStyle = a3;
  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  containerView = self->__containerView;
  self->__containerView = v9;

  -[UIView setUserInteractionEnabled:](self->__containerView, "setUserInteractionEnabled:", 0);
  -[UIView layer](self->__containerView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMasksToBounds:", 1);

  v12 = *MEMORY[0x1E0CD2A68];
  -[UIView layer](self->__containerView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerCurve:", v12);

  -[CAMImageWell addSubview:](self, "addSubview:", self->__containerView);
  v14 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v5, v6, v7, v8);
  thumbnailImageView = self->__thumbnailImageView;
  self->__thumbnailImageView = v14;

  -[UIImageView setExclusiveTouch:](self->__thumbnailImageView, "setExclusiveTouch:", 1);
  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  dimmingViewQueue = self->__dimmingViewQueue;
  self->__dimmingViewQueue = v16;

  -[UIView addSubview:](self->__containerView, "addSubview:", self->__thumbnailImageView);
  -[CAMImageWell _updateForLayoutStyle](self, "_updateForLayoutStyle");
}

- (void)_updateForLayoutStyle
{
  int64_t v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[CAMImageWell layoutStyle](self, "layoutStyle");
  -[CAMImageWell _placeholderImageForLayoutStyle:](self, "_placeholderImageForLayoutStyle:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMImageWell _cornerRadiusForLayoutStyle:](self, "_cornerRadiusForLayoutStyle:", v3);
  v5 = v4;
  -[CAMImageWell _setPlaceholderImage:](self, "_setPlaceholderImage:", v8);
  -[CAMImageWell _containerView](self, "_containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v5);

}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (id)_placeholderImageForLayoutStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = 0;
  switch(a3)
  {
    case 0:
    case 2:
      v4 = (void *)MEMORY[0x1E0DC3870];
      CAMCameraUIFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("CAMImageWellPlaceholder");
      goto LABEL_5;
    case 1:
      v4 = (void *)MEMORY[0x1E0DC3870];
      CAMCameraUIFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("CAMImageWellPlaceholderPad");
      goto LABEL_5;
    case 4:
      v4 = (void *)MEMORY[0x1E0DC3870];
      CAMCameraUIFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("CAMImageWellPlaceholder-d22");
LABEL_5:
      objc_msgSend(v4, "imageNamed:inBundle:", v6, v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

- (double)_cornerRadiusForLayoutStyle:(int64_t)a3
{
  double v5;
  void *v6;
  double v7;
  double v8;

  v5 = CAMPixelWidthForView(self) + 3.0;
  if (!a3)
  {
    -[CAMImageWell traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    v8 = v7;

    if (v8 == 2.0)
      return 3.0;
  }
  return v5;
}

- (void)_setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->__placeholderImage, a3);
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CAMImageWell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCameraOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  if (self->_cameraOrientation != a3)
  {
    v4 = a4;
    self->_cameraOrientation = a3;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__CAMImageWell_setCameraOrientation_animated___block_invoke;
    aBlock[3] = &unk_1EA328868;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    v6 = v5;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v5, 0, 0.3, 0.0);
    else
      (*((void (**)(void *))v5 + 2))(v5);

  }
}

uint64_t __46__CAMImageWell_setCameraOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateThumbnailTransformFromCameraOrientation");
}

- (void)_updateThumbnailTransformFromCameraOrientation
{
  unint64_t v3;
  CGFloat v4;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v3 = self->_cameraOrientation - 2;
  v4 = 0.0;
  if (v3 <= 2)
    v4 = dbl_1DB9A5480[v3];
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeRotation(&v7, v4);
  v5 = v7;
  UIIntegralTransform();
  v7 = v6;
  -[UIImageView setTransform:](self->__thumbnailImageView, "setTransform:", &v6, *(_OWORD *)&v5.a, *(_OWORD *)&v5.c, *(_OWORD *)&v5.tx);
}

- (void)setThumbnailImage:(id)a3 uuid:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v5 = a5;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CAMImageWell _uuid](self, "_uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v9, "isEqualToString:", v10)
      && (-[CAMImageWell thumbnailImage](self, "thumbnailImage"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = v9;
        _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: not animating since UUID not changing", (uint8_t *)&v13, 0xCu);
      }

      v5 = 0;
    }
    else
    {
      v5 = 1;
    }
  }
  -[CAMImageWell _setThumbnailImage:](self, "_setThumbnailImage:", v8);
  -[CAMImageWell _setUuid:](self, "_setUuid:", v9);
  -[CAMImageWell _updateThumbnailImageAnimated:](self, "_updateThumbnailImageAnimated:", v5);

}

- (NSString)_uuid
{
  return self->__uuid;
}

- (void)_setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->__thumbnailImage, a3);
}

- (void)_setUuid:(id)a3
{
  objc_storeStrong((id *)&self->__uuid, a3);
}

- (void)_updateThumbnailImageAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  id v10;
  void (**v11)(void *, uint64_t);
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  CAMImageWell *v20;
  id v21;
  id v22;
  unint64_t v23;

  v3 = a3;
  if (-[CAMImageWell isThumbnailImageHidden](self, "isThumbnailImageHidden")
    || (-[CAMImageWell _thumbnailImage](self, "_thumbnailImage"), (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[CAMImageWell _placeholderImage](self, "_placeholderImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[CAMImageWell _removeFirstDimmingView](self, "_removeFirstDimmingView");
      v3 = 0;
    }
  }
  else
  {
    v6 = (void *)v5;
  }
  -[CAMImageWell _uuid](self, "_uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMImageWell _thumbnailUpdateID](self, "_thumbnailUpdateID") + 1;
  -[CAMImageWell _setThumbnailUpdateID:](self, "_setThumbnailUpdateID:", v8);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __46__CAMImageWell__updateThumbnailImageAnimated___block_invoke;
  v19 = &unk_1EA32B0B0;
  v23 = v8;
  v20 = self;
  v9 = v6;
  v21 = v9;
  v10 = v7;
  v22 = v10;
  v11 = (void (**)(void *, uint64_t))_Block_copy(&v16);
  if (v3)
  {
    v12 = objc_msgSend(v9, "imageOrientation", v16, v17, v18, v19, v20, v21);
    v13 = v9;
    if (objc_msgSend(v13, "imageOrientation"))
    {
      v14 = (void *)MEMORY[0x1E0DC3870];
      v15 = objc_retainAutorelease(v13);
      objc_msgSend(v14, "imageWithCGImage:", objc_msgSend(v15, "CGImage"));
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[CAMImageWell _performEmitAnimationWithImage:orientation:withCompletionBlock:](self, "_performEmitAnimationWithImage:orientation:withCompletionBlock:", v13, v12, v11);

  }
  else
  {
    -[UIImageView _removeAllAnimations:](self->__thumbnailImageView, "_removeAllAnimations:", 0, v16, v17, v18, v19, v20, v21);
    v11[2](v11, 1);
  }

}

- (BOOL)isThumbnailImageHidden
{
  return self->_thumbnailImageHidden;
}

- (UIImage)_thumbnailImage
{
  return self->__thumbnailImage;
}

uint64_t __46__CAMImageWell__updateThumbnailImageAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  result = objc_msgSend(*(id *)(a1 + 32), "_thumbnailUpdateID");
  if (v2 == result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);

    v6 = os_log_create("com.apple.camera", "Camera");
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4 == v5)
    {
      if (v7)
      {
        v12 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        v13 = 138543618;
        v14 = v11;
        v15 = 2114;
        v16 = v12;
        v10 = "ImageWell %{public}@: setImage (unchanged): %{public}@";
        goto LABEL_7;
      }
    }
    else if (v7)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v13 = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v10 = "ImageWell %{public}@: setImage: %{public}@";
LABEL_7:
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "setImage:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "setContentMode:", 2);
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CAMImageWell _placeholderImage](self, "_placeholderImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIImage)_placeholderImage
{
  return self->__placeholderImage;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tappableEdgeInsets.top;
  left = self->_tappableEdgeInsets.left;
  bottom = self->_tappableEdgeInsets.bottom;
  right = self->_tappableEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMImageWell;
  -[CAMImageWell layoutSubviews](&v12, sel_layoutSubviews);
  -[CAMImageWell bounds](self, "bounds");
  -[CAMImageWell alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMImageWell _containerView](self, "_containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CAMViewSetBoundsAndCenterForFrame(v11, v4, v6, v8, v10);
  -[UIView bounds](self->__containerView, "bounds");
  -[UIImageView setFrame:](self->__thumbnailImageView, "setFrame:");

}

- (void)prepareForThumbnailUpdateFromCapture
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  double v15;
  void *v16;
  uint8_t v17[16];

  v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "ImageWell starting blackout animation", v17, 2u);
  }

  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[UIView bounds](self->__containerView, "bounds");
  v5 = (void *)objc_msgSend(v4, "initWithFrame:");
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[UIView addSubview:](self->__containerView, "addSubview:", v5);
  LODWORD(v7) = 1041812769;
  LODWORD(v8) = 1043018044;
  LODWORD(v9) = 1044413908;
  LODWORD(v10) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFromValue:", &unk_1EA3B1860);
  UIAnimationDragCoefficient();
  objc_msgSend(v12, "setDuration:", v13 * 0.31);
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v12, "setTimingFunction:", v11);
  +[CAMAnimationHelper configurePowerSensitiveAnimation:](CAMAnimationHelper, "configurePowerSensitiveAnimation:", v12);
  objc_msgSend(v5, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 1.0;
  objc_msgSend(v14, "setOpacity:", v15);
  objc_msgSend(v5, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v12, CFSTR("opacityAnimation"));

  -[NSMutableArray addObject:](self->__dimmingViewQueue, "addObject:", v5);
}

- (void)_performEmitAnimationWithImage:(id)a3 orientation:(int64_t)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  UIImageView *thumbnailImageView;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  CAMAnimationDelegate *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  CAMImageWell *v30;
  id v31;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v34;
  CGAffineTransform buf;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMImageWell _uuid](self, "_uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.a) = 138543618;
    *(_QWORD *)((char *)&buf.a + 4) = v11;
    WORD2(buf.b) = 2114;
    *(_QWORD *)((char *)&buf.b + 6) = v8;
    _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: _performEmitAnimationWithImage: %{public}@", (uint8_t *)&buf, 0x16u);

  }
  memset(&buf, 0, sizeof(buf));
  -[CAMImageWell _affineTransformForImageOrientation:](self, "_affineTransformForImageOrientation:", a4);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
  -[UIView bounds](self->__containerView, "bounds");
  objc_msgSend(v12, "setFrame:");
  objc_msgSend(v12, "setContentMode:", 2);
  thumbnailImageView = self->__thumbnailImageView;
  if (thumbnailImageView)
    -[UIImageView transform](thumbnailImageView, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  t2 = buf;
  CGAffineTransformConcat(&v34, &t1, &t2);
  objc_msgSend(v12, "setTransform:", &v34);
  -[UIView addSubview:](self->__containerView, "addSubview:", v12);
  LODWORD(v14) = 0;
  LODWORD(v15) = 0;
  LODWORD(v16) = 0;
  LODWORD(v17) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFromValue:", v20);

  v21 = (void *)MEMORY[0x1E0CB3B18];
  -[UIView bounds](self->__containerView, "bounds");
  objc_msgSend(v21, "valueWithCGRect:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setToValue:", v22);

  UIAnimationDragCoefficient();
  objc_msgSend(v19, "setDuration:", v23 * 0.2);
  objc_msgSend(v19, "setTimingFunction:", v18);
  objc_msgSend(v19, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  +[CAMAnimationHelper configurePowerSensitiveAnimation:](CAMAnimationHelper, "configurePowerSensitiveAnimation:", v19);
  v24 = objc_alloc_init(CAMAnimationDelegate);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __79__CAMImageWell__performEmitAnimationWithImage_orientation_withCompletionBlock___block_invoke;
  v28[3] = &unk_1EA32B0D8;
  v29 = v12;
  v30 = self;
  v31 = v9;
  v25 = v9;
  v26 = v12;
  -[CAMAnimationDelegate setCompletion:](v24, "setCompletion:", v28);
  objc_msgSend(v19, "setDelegate:", v24);
  objc_msgSend(v26, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAnimation:forKey:", v19, CFSTR("emitAnimation"));

}

- (CGAffineTransform)_affineTransformForImageOrientation:(SEL)a3
{
  uint64_t v5;
  __int128 v6;
  int64_t v7;
  CGAffineTransform *result;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  v7 = a4 - 1;
  if ((unint64_t)(a4 - 1) <= 6 && ((0x77u >> v7) & 1) != 0)
    CGAffineTransformMakeRotation(retstr, dbl_1DB9A5498[v7]);
  result = (CGAffineTransform *)UIIntegralTransform();
  *(_OWORD *)&retstr->a = v9;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = v11;
  return result;
}

uint64_t __79__CAMImageWell__performEmitAnimationWithImage_orientation_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "_removeFirstDimmingView");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_removeFirstDimmingView
{
  id v3;

  -[NSMutableArray firstObject](self->__dimmingViewQueue, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");
  -[NSMutableArray removeObject:](self->__dimmingViewQueue, "removeObject:", v3);

}

- (CAMImageWell)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMImageWell initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (CAMImageWell)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMImageWell initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
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

  -[CAMImageWell intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[CAMImageWell contentEdgeInsets](self, "contentEdgeInsets");
  v10 = v9 + v5 + v8;
  v13 = v12 + v7 + v11;
  v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)setScaledForInteraction:(BOOL)a3
{
  -[CAMImageWell setScaledForInteraction:animated:](self, "setScaledForInteraction:animated:", a3, 0);
}

- (void)setScaledForInteraction:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CATransform3D v19;
  CATransform3D v20;

  if (self->_scaledForInteraction != a3)
  {
    v4 = a4;
    self->_scaledForInteraction = a3;
    if (a3)
      v5 = *(double *)&CAMImageWellInteractionScale;
    else
      v5 = 1.0;
    -[CAMImageWell _containerView](self, "_containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      UIAnimationDragCoefficient();
      v9 = v8;
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMass:", 0.8);
      objc_msgSend(v10, "setDamping:", 12.0 / v9);
      objc_msgSend(v10, "setStiffness:", 300.0 / (float)(v9 * v9));
      objc_msgSend(v10, "durationForEpsilon:", 0.01);
      objc_msgSend(v10, "setDuration:");
      LODWORD(v11) = 1041865114;
      LODWORD(v12) = 0;
      LODWORD(v13) = 0.5;
      LODWORD(v14) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v11, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTimingFunction:", v15);

      objc_msgSend(v7, "presentationLayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForKeyPath:", CFSTR("transform.scale.xy"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFromValue:", v17);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setToValue:", v18);

      objc_msgSend(v7, "addAnimation:forKey:", v10, CFSTR("highlightScaleAnimation"));
    }
    else
    {
      objc_msgSend(v7, "removeAnimationForKey:", CFSTR("highlightScaleAnimation"));
    }
    memset(&v20, 0, sizeof(v20));
    CATransform3DMakeScale(&v20, v5, v5, 1.0);
    v19 = v20;
    objc_msgSend(v7, "setTransform:", &v19);

  }
}

- (CGRect)alignmentRectForFrame:(CGRect)a3 scaledForInteraction:(BOOL)a4
{
  _BOOL4 v4;
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
  CGAffineTransform v21;
  CGRect result;

  v4 = a4;
  -[CAMImageWell alignmentRectForFrame:](self, "alignmentRectForFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (v4)
  {
    CGAffineTransformMakeScale(&v21, *(CGFloat *)&CAMImageWellInteractionScale, *(CGFloat *)&CAMImageWellInteractionScale);
    UIRectCenteredIntegralRectScale();
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = v16;
  }
  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)setCameraOrientation:(int64_t)a3
{
  -[CAMImageWell setCameraOrientation:animated:](self, "setCameraOrientation:animated:", a3, 0);
}

- (void)setThumbnailImage:(id)a3 animated:(BOOL)a4
{
  -[CAMImageWell setThumbnailImage:uuid:animated:](self, "setThumbnailImage:uuid:animated:", a3, 0, a4);
}

- (void)setThumbnailImageHidden:(BOOL)a3
{
  if (self->_thumbnailImageHidden != a3)
  {
    self->_thumbnailImageHidden = a3;
    -[CAMImageWell _updateThumbnailImageAnimated:](self, "_updateThumbnailImageAnimated:", 0);
  }
}

- (void)recoverFromFailedThumbnailUpdate
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMImageWell _uuid](self, "_uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "ImageWell %{public}@: recoverFromFailedThumbnailUpdate", (uint8_t *)&v5, 0xCu);

  }
  -[CAMImageWell _removeFirstDimmingView](self, "_removeFirstDimmingView");
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMImageWell _updateForLayoutStyle](self, "_updateForLayoutStyle");
  }
}

- (int64_t)cameraOrientation
{
  return self->_cameraOrientation;
}

- (BOOL)isScaledForInteraction
{
  return self->_scaledForInteraction;
}

- (UIImageView)_thumbnailImageView
{
  return self->__thumbnailImageView;
}

- (NSMutableArray)_dimmingViewQueue
{
  return self->__dimmingViewQueue;
}

- (unint64_t)_thumbnailUpdateID
{
  return self->__thumbnailUpdateID;
}

- (void)_setThumbnailUpdateID:(unint64_t)a3
{
  self->__thumbnailUpdateID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__uuid, 0);
  objc_storeStrong((id *)&self->__placeholderImage, 0);
  objc_storeStrong((id *)&self->__thumbnailImage, 0);
  objc_storeStrong((id *)&self->__dimmingViewQueue, 0);
  objc_storeStrong((id *)&self->__thumbnailImageView, 0);
  objc_storeStrong((id *)&self->__containerView, 0);
}

@end
