@implementation CAMViewfinderReticleView

- (CAMViewfinderReticleView)initWithFrame:(CGRect)a3
{
  CAMViewfinderReticleView *v3;
  CAMViewfinderReticleView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIView *topMaskingView;
  uint64_t v12;
  UIView *bottomMaskingView;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  uint64_t v20;
  UIImageView **p_viewportBorderView;
  UIImageView *viewportBorderView;
  uint64_t v23;
  UIImageView *topLeftCornerView;
  uint64_t v25;
  UIImageView *topRightCornerView;
  uint64_t v27;
  UIImageView *bottomLeftCornerView;
  uint64_t v29;
  UIImageView *bottomRightCornerView;
  UIImageView *v31;
  UIImageView *v32;
  UIImageView *v33;
  UIImageView *v34;
  void *v35;
  void *v36;
  void *v37;
  CAMViewfinderReticleView *v38;
  _OWORD v40[3];
  CGAffineTransform v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[3];
  CGAffineTransform v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[3];
  CGAffineTransform v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _OWORD v55[3];
  CGAffineTransform v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)CAMViewfinderReticleView;
  v3 = -[CAMViewfinderReticleView initWithFrame:](&v60, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_cornersVisible = 1;
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    topMaskingView = v4->__topMaskingView;
    v4->__topMaskingView = (UIView *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
    bottomMaskingView = v4->__bottomMaskingView;
    v4->__bottomMaskingView = (UIView *)v12;

    -[CAMViewfinderReticleView addSubview:](v4, "addSubview:", v4->__topMaskingView);
    -[CAMViewfinderReticleView addSubview:](v4, "addSubview:", v4->__bottomMaskingView);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "cam_initialLayoutStyle");

    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "useReticleStroke");

    if (v17)
    {
      v18 = -[CAMViewfinderReticleView _newViewportTemplateImage](v4, "_newViewportTemplateImage");
      objc_msgSend(v18, "resizableImageWithCapInsets:resizingMode:", 1, 24.0, 24.0, 24.0, 24.0);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v19);
      p_viewportBorderView = &v4->__viewportBorderView;
      viewportBorderView = v4->__viewportBorderView;
      v4->__viewportBorderView = (UIImageView *)v20;

    }
    else
    {
      if (v15 != 4)
      {
LABEL_7:
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMViewfinderReticleView _topMaskingView](v4, "_topMaskingView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setBackgroundColor:", v35);

        -[CAMViewfinderReticleView _bottomMaskingView](v4, "_bottomMaskingView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setBackgroundColor:", v35);

        -[CAMViewfinderReticleView _updateMaterialOpacityWithDuration:](v4, "_updateMaterialOpacityWithDuration:", 0.0);
        v38 = v4;

        goto LABEL_8;
      }
      v19 = -[CAMViewfinderReticleView _newViewportCornerImage](v4, "_newViewportCornerImage");
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v19);
      topLeftCornerView = v4->__topLeftCornerView;
      v4->__topLeftCornerView = (UIImageView *)v23;

      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v19);
      topRightCornerView = v4->__topRightCornerView;
      v4->__topRightCornerView = (UIImageView *)v25;

      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v19);
      bottomLeftCornerView = v4->__bottomLeftCornerView;
      v4->__bottomLeftCornerView = (UIImageView *)v27;

      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v19);
      p_viewportBorderView = &v4->__bottomRightCornerView;
      bottomRightCornerView = v4->__bottomRightCornerView;
      v4->__bottomRightCornerView = (UIImageView *)v29;

      CGAffineTransformMakeRotation(&v56, 0.0);
      UIIntegralTransform();
      v31 = v4->__topLeftCornerView;
      v55[0] = v57;
      v55[1] = v58;
      v55[2] = v59;
      -[UIImageView setTransform:](v31, "setTransform:", v55);
      CGAffineTransformMakeRotation(&v51, 1.57079633);
      UIIntegralTransform();
      v32 = v4->__topRightCornerView;
      v50[0] = v52;
      v50[1] = v53;
      v50[2] = v54;
      -[UIImageView setTransform:](v32, "setTransform:", v50);
      CGAffineTransformMakeRotation(&v46, -1.57079633);
      UIIntegralTransform();
      v33 = v4->__bottomLeftCornerView;
      v45[0] = v47;
      v45[1] = v48;
      v45[2] = v49;
      -[UIImageView setTransform:](v33, "setTransform:", v45);
      CGAffineTransformMakeRotation(&v41, 3.14159265);
      UIIntegralTransform();
      v34 = v4->__bottomRightCornerView;
      v40[0] = v42;
      v40[1] = v43;
      v40[2] = v44;
      -[UIImageView setTransform:](v34, "setTransform:", v40);
      -[CAMViewfinderReticleView addSubview:](v4, "addSubview:", v4->__topLeftCornerView);
      -[CAMViewfinderReticleView addSubview:](v4, "addSubview:", v4->__topRightCornerView);
      -[CAMViewfinderReticleView addSubview:](v4, "addSubview:", v4->__bottomLeftCornerView);
    }
    -[CAMViewfinderReticleView addSubview:](v4, "addSubview:", *p_viewportBorderView);

    goto LABEL_7;
  }
LABEL_8:

  return v4;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  -[CAMViewfinderReticleView _topMaskingView](self, "_topMaskingView");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderReticleView _bottomMaskingView](self, "_bottomMaskingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderReticleView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  -[CAMViewfinderReticleView viewportTopInset](self, "viewportTopInset");
  objc_msgSend(v44, "setFrame:", 0.0, 0.0, v5, v8);
  -[CAMViewfinderReticleView viewportBottomInset](self, "viewportBottomInset");
  v10 = v7 - v9;
  -[CAMViewfinderReticleView viewportBottomInset](self, "viewportBottomInset");
  objc_msgSend(v3, "setFrame:", 0.0, v10, v5, v11);
  -[CAMViewfinderReticleView viewportBottomInset](self, "viewportBottomInset");
  v13 = v7 - v12;
  -[CAMViewfinderReticleView viewportTopInset](self, "viewportTopInset");
  v15 = v13 - v14;
  -[CAMViewfinderReticleView viewportTopInset](self, "viewportTopInset");
  v17 = v16;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "useReticleStroke");

  if (v19)
  {
    -[CAMViewfinderReticleView _viewportBorderView](self, "_viewportBorderView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", 0.0, v17, v5, v15);
  }
  else
  {
    v45.origin.x = 0.0;
    v45.origin.y = v17;
    v45.size.width = v5;
    v45.size.height = v15;
    v46 = CGRectInset(v45, 12.0, 12.0);
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
    CGRectGetMinX(v46);
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    CGRectGetMinY(v47);
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    v26 = v25;
    v28 = v27;
    -[CAMViewfinderReticleView _topLeftCornerView](self, "_topLeftCornerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCenter:", v26, v28);

    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    CGRectGetMaxX(v48);
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    CGRectGetMinY(v49);
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    v31 = v30;
    v33 = v32;
    -[CAMViewfinderReticleView _topRightCornerView](self, "_topRightCornerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCenter:", v31, v33);

    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    CGRectGetMinX(v50);
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    CGRectGetMaxY(v51);
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    v36 = v35;
    v38 = v37;
    -[CAMViewfinderReticleView _bottomLeftCornerView](self, "_bottomLeftCornerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setCenter:", v36, v38);

    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    CGRectGetMaxX(v52);
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    CGRectGetMaxY(v53);
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    v41 = v40;
    v43 = v42;
    -[CAMViewfinderReticleView _bottomRightCornerView](self, "_bottomRightCornerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCenter:", v41, v43);
  }

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  uint64_t v7;
  BOOL v8;
  void *v9;
  CGPoint v11;
  CGPoint v12;
  CGRect v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  -[CAMViewfinderReticleView _topMaskingView](self, "_topMaskingView", a4);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "frame");
  v11.x = x;
  v11.y = y;
  v8 = CGRectContainsPoint(v13, v11);

  -[CAMViewfinderReticleView _bottomMaskingView](self, "_bottomMaskingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v12.x = x;
  v12.y = y;
  LOBYTE(v7) = CGRectContainsPoint(v14, v12);

  return v8 | v7;
}

- (void)setMaterial:(int64_t)a3
{
  -[CAMViewfinderReticleView setMaterial:withDuration:](self, "setMaterial:withDuration:", a3, 0.0);
}

- (void)setMaterial:(int64_t)a3 withDuration:(double)a4
{
  if (self->_material != a3)
  {
    self->_material = a3;
    -[CAMViewfinderReticleView _updateMaterialOpacityWithDuration:](self, "_updateMaterialOpacityWithDuration:", a4);
  }
}

- (void)_updateMaterialOpacityWithDuration:(double)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[6];

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if ((objc_msgSend(v5, "featureDevelopmentHidePreviewOverlayBars") & 1) == 0)
  {
    v7 = -[CAMViewfinderReticleView material](self, "material");
    if (v7 <= 4)
      v6 = qword_1DB9A7098[v7];
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CAMViewfinderReticleView__updateMaterialOpacityWithDuration___block_invoke;
  v8[3] = &unk_1EA328B18;
  v8[4] = self;
  v8[5] = v6;
  +[CAMView animateIfNeededWithDuration:options:animations:completion:](CAMView, "animateIfNeededWithDuration:options:animations:completion:", 4, v8, 0, a3);
}

void __63__CAMViewfinderReticleView__updateMaterialOpacityWithDuration___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  id v5;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_topMaskingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  v4 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_bottomMaskingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

- (id)_newViewportCornerImage
{
  CGContext *CurrentContext;
  void *v3;
  void *v4;
  CGSize v6;
  CGRect v7;

  v6.width = 24.0;
  v6.height = 24.0;
  UIGraphicsBeginImageContextWithOptions(v6, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.51);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStroke");
  v7.origin.x = 0.5;
  v7.origin.y = 0.5;
  v7.size.width = 24.0;
  v7.size.height = 24.0;
  CGContextStrokeRectWithWidth(CurrentContext, v7, 1.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v4;
}

- (id)_newViewportTemplateImage
{
  void *v2;
  CGContext *CurrentContext;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;
  CGSize v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v35 = *MEMORY[0x1E0C80C00];
  v36.width = 49.0;
  v36.height = 49.0;
  UIGraphicsBeginImageContextWithOptions(v36, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.51);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStroke");
  CurrentContext = UIGraphicsGetCurrentContext();
  v37.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v37.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v37.size.width = 49.0;
  v37.size.height = 49.0;
  v38 = CGRectInset(v37, 0.5, 0.5);
  CGContextStrokeRectWithWidth(CurrentContext, v38, 1.0);
  v4 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 24.0, 0.0, 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 24.0, 1.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 24.0, 48.0, 1.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 48.0, 24.0, 1.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, 0);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v14), "CGRectValue");
        CGContextClearRect(CurrentContext, v39);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "useReticleStroke");

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFill");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = v10;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "CGRectValue");
          CGContextFillRect(CurrentContext, v40);
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v20);
    }

  }
  UIGraphicsGetImageFromCurrentImageContext();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v23;
}

- (void)setViewportTopInset:(double)a3 bottomInset:(double)a4 animated:(BOOL)a5
{
  _QWORD v8[5];

  if (self->_viewportTopInset != a3 || self->_viewportBottomInset != a4)
  {
    if (a5)
    {
      -[CAMViewfinderReticleView layoutIfNeeded](self, "layoutIfNeeded");
      self->_viewportTopInset = a3;
      self->_viewportBottomInset = a4;
      -[CAMViewfinderReticleView setNeedsLayout](self, "setNeedsLayout");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __69__CAMViewfinderReticleView_setViewportTopInset_bottomInset_animated___block_invoke;
      v8[3] = &unk_1EA328868;
      v8[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v8, 0, 0.5, 0.0, 1.0, 1.0);
    }
    else
    {
      self->_viewportTopInset = a3;
      self->_viewportBottomInset = a4;
      -[CAMViewfinderReticleView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __69__CAMViewfinderReticleView_setViewportTopInset_bottomInset_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setCornersVisible:(BOOL)a3
{
  -[CAMViewfinderReticleView setCornersVisible:animated:](self, "setCornersVisible:animated:", a3, 0);
}

- (void)setCornersVisible:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  double v5;
  _QWORD v6[6];

  if (self->_cornersVisible != a3)
  {
    self->_cornersVisible = a3;
    v4 = 0.0;
    v5 = 1.0;
    if (!a3)
      v5 = 0.0;
    if (a4)
      v4 = 0.25;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__CAMViewfinderReticleView_setCornersVisible_animated___block_invoke;
    v6[3] = &unk_1EA328B18;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v6, v4);
  }
}

void __55__CAMViewfinderReticleView_setCornersVisible_animated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_topLeftCornerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  v4 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_topRightCornerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  v6 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_bottomLeftCornerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  v8 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_bottomRightCornerView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

}

- (double)viewportTopInset
{
  return self->_viewportTopInset;
}

- (double)viewportBottomInset
{
  return self->_viewportBottomInset;
}

- (int64_t)material
{
  return self->_material;
}

- (BOOL)cornersVisible
{
  return self->_cornersVisible;
}

- (UIView)_topMaskingView
{
  return self->__topMaskingView;
}

- (UIView)_bottomMaskingView
{
  return self->__bottomMaskingView;
}

- (UIImageView)_viewportBorderView
{
  return self->__viewportBorderView;
}

- (UIImageView)_topLeftCornerView
{
  return self->__topLeftCornerView;
}

- (UIImageView)_topRightCornerView
{
  return self->__topRightCornerView;
}

- (UIImageView)_bottomLeftCornerView
{
  return self->__bottomLeftCornerView;
}

- (UIImageView)_bottomRightCornerView
{
  return self->__bottomRightCornerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__bottomRightCornerView, 0);
  objc_storeStrong((id *)&self->__bottomLeftCornerView, 0);
  objc_storeStrong((id *)&self->__topRightCornerView, 0);
  objc_storeStrong((id *)&self->__topLeftCornerView, 0);
  objc_storeStrong((id *)&self->__viewportBorderView, 0);
  objc_storeStrong((id *)&self->__bottomMaskingView, 0);
  objc_storeStrong((id *)&self->__topMaskingView, 0);
}

@end
