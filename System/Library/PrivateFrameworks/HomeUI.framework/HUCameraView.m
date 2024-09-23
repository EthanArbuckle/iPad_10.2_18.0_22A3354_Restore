@implementation HUCameraView

- (void)setContentMode:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  if (-[HUCameraView contentMode](self, "contentMode") != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)HUCameraView;
    -[HUCameraView setContentMode:](&v8, sel_setContentMode_, a3);
    v5 = -[HUCameraView contentMode](self, "contentMode");
    -[HUCameraView cameraContainerView](self, "cameraContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentMode:", v5);

  }
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)HUCameraView;
  -[HUCameraView layoutSubviews](&v36, sel_layoutSubviews);
  -[HUCameraView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HUCameraView cameraContainerView](self, "cameraContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[HUCameraView cameraContainerView](self, "cameraContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[HUCameraView cameraView](self, "cameraView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    -[HUCameraView cameraContainerView](self, "cameraContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[HUCameraView demoSnapshotImageView](self, "demoSnapshotImageView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  }
  -[HUCameraView cameraContentFrame](self, "cameraContentFrame");
  if (v33 == *MEMORY[0x1E0C9D820] && v32 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[HUCameraView cameraContainerView](self, "cameraContainerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "layoutIfNeeded");

  }
  -[HUCameraView _updateMaskedCameraCorners](self, "_updateMaskedCameraCorners");
}

- (CGRect)cameraContentFrame
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[HUCameraView cameraView](self, "cameraView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HUCameraView cameraView](self, "cameraView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraView convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)updateConstraints
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_super v59;
  _QWORD v60[3];

  v60[2] = *MEMORY[0x1E0C80C00];
  -[HUCameraView staticConstraints](self, "staticConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUCameraView cameraContainerView](self, "cameraContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView centerXAnchor](self, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    -[HUCameraView cameraContainerView](self, "cameraContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView centerYAnchor](self, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    -[HUCameraView cameraContainerView](self, "cameraContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView widthAnchor](self, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    -[HUCameraView cameraContainerView](self, "cameraContainerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView heightAnchor](self, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v20);

    -[HUCameraView cameraOverlayView](self, "cameraOverlayView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView widthAnchor](self, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

    -[HUCameraView cameraOverlayView](self, "cameraOverlayView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView heightAnchor](self, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v28);

    -[HUCameraView cameraOverlayView](self, "cameraOverlayView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView centerXAnchor](self, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v32);

    -[HUCameraView cameraOverlayView](self, "cameraOverlayView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView centerYAnchor](self, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v36);

    -[HUCameraView setStaticConstraints:](self, "setStaticConstraints:", v4);
    v37 = (void *)MEMORY[0x1E0CB3718];
    -[HUCameraView staticConstraints](self, "staticConstraints");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v38);

  }
  -[HUCameraView badgeView](self, "badgeView");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[HUCameraView badgeBottomConstraint](self, "badgeBottomConstraint");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {

    }
    else
    {
      -[HUCameraView badgeTrailingConstraint](self, "badgeTrailingConstraint");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v42)
      {
        -[HUCameraView badgeView](self, "badgeView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "bottomAnchor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraView badgeBottomAnchor](self, "badgeBottomAnchor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if (!v45)
        {
          -[HUCameraView bottomAnchor](self, "bottomAnchor");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[HUCameraView badgeOffset](self, "badgeOffset");
        objc_msgSend(v44, "constraintEqualToAnchor:constant:", v46, -v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraView setBadgeBottomConstraint:](self, "setBadgeBottomConstraint:", v48);

        if (!v45)
        -[HUCameraView badgeView](self, "badgeView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "trailingAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "trailingAnchor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraView badgeOffset](self, "badgeOffset");
        objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, -v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraView setBadgeTrailingConstraint:](self, "setBadgeTrailingConstraint:", v54);

        v55 = (void *)MEMORY[0x1E0CB3718];
        -[HUCameraView badgeBottomConstraint](self, "badgeBottomConstraint");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = v56;
        -[HUCameraView badgeTrailingConstraint](self, "badgeTrailingConstraint");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v60[1] = v57;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "activateConstraints:", v58);

      }
    }
  }
  v59.receiver = self;
  v59.super_class = (Class)HUCameraView;
  -[HUCameraView updateConstraints](&v59, sel_updateConstraints);
}

- (UIView)cameraOverlayView
{
  return self->_cameraOverlayView;
}

- (HMCameraView)cameraView
{
  void *v2;
  void *v3;

  -[HUCameraView cameraContainerView](self, "cameraContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCameraView *)v3;
}

- (HURemoteContextHostingView)cameraContainerView
{
  return self->_cameraContainerView;
}

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setStaticConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_staticConstraints, a3);
}

- (HUCameraBadgeView)badgeView
{
  return self->_badgeView;
}

- (HUCameraView)initWithBadgeView:(id)a3
{
  id v5;
  HUCameraView *v6;
  id v7;
  HURemoteContextHostingView *v8;
  HURemoteContextHostingView *cameraContainerView;
  UIView *v10;
  UIView *cameraOverlayView;
  void *v12;
  char v13;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUCameraView;
  v6 = -[HUCameraView init](&v20, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CBA450]);
    objc_msgSend(v7, "setContentMode:", 1);
    v8 = -[HURemoteContextHostingView initWithContentView:]([HURemoteContextHostingView alloc], "initWithContentView:", v7);
    cameraContainerView = v6->_cameraContainerView;
    v6->_cameraContainerView = v8;

    -[HURemoteContextHostingView setClipsToBounds:](v6->_cameraContainerView, "setClipsToBounds:", 1);
    -[HURemoteContextHostingView setAlpha:](v6->_cameraContainerView, "setAlpha:", 0.0);
    -[HURemoteContextHostingView setTranslatesAutoresizingMaskIntoConstraints:](v6->_cameraContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUCameraView addSubview:](v6, "addSubview:", v6->_cameraContainerView);
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    cameraOverlayView = v6->_cameraOverlayView;
    v6->_cameraOverlayView = v10;

    -[UIView layer](v6->_cameraOverlayView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMasksToBounds:", 1);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_cameraOverlayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v6->_cameraOverlayView, "setUserInteractionEnabled:", 0);
    -[HUCameraView addSubview:](v6, "addSubview:", v6->_cameraOverlayView);
    v13 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldSuppressAllErrorsForDemo");
    if (v5 && (v13 & 1) == 0)
    {
      objc_storeStrong((id *)&v6->_badgeView, a3);
      -[HUCameraBadgeView setTranslatesAutoresizingMaskIntoConstraints:](v6->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[HUCameraView addSubview:](v6, "addSubview:", v6->_badgeView);
      __asm { FMOV            V0.2D, #16.0 }
      v6->_badgeOffset = _Q0;
      -[HUCameraView _updateBadgeView](v6, "_updateBadgeView");
    }
    -[HUCameraView setContentMode:](v6, "setContentMode:", objc_msgSend(v7, "contentMode"));

  }
  return v6;
}

- (void)setHideCameraContentWhenDisplayingErrors:(BOOL)a3
{
  self->_hideCameraContentWhenDisplayingErrors = a3;
}

- (HUCameraErrorViewable)overrideErrorView
{
  return self->_overrideErrorView;
}

- (void)setMaskedCameraCorners:(unint64_t)a3
{
  self->_maskedCameraCorners = a3;
  -[HUCameraView _updateMaskedCameraCorners](self, "_updateMaskedCameraCorners");
}

- (void)setCameraSource:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  HUCameraView *v18;
  id v19;

  v4 = a4;
  v6 = a3;
  -[HUCameraView cameraView](self, "cameraView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    -[HUCameraView cameraView](self, "cameraView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCameraSource:", v6);

    objc_msgSend(v6, "aspectRatio");
    -[HUCameraView setCameraContentMode:](self, "setCameraContentMode:", -[HUCameraView contentModeForAspectRatio:](self, "contentModeForAspectRatio:"));
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __41__HUCameraView_setCameraSource_animated___block_invoke;
    v17 = &unk_1E6F4C638;
    v18 = self;
    v19 = v6;
    v10 = _Block_copy(&v14);
    v11 = v10;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD28D0], "animation", v14, v15, v16, v17, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setType:", *MEMORY[0x1E0CD3170]);
      objc_msgSend(v12, "setDuration:", 0.5);
      -[HUCameraView cameraView](self, "cameraView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAnimation:forKey:", v12, CFSTR("cameraSourceTransition"));

      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v11, 0.5);
    }
    else
    {
      (*((void (**)(void *))v10 + 2))(v10);
    }
    -[HUCameraView _updateBadgeView](self, "_updateBadgeView", v14, v15, v16, v17, v18);
    -[HUCameraView _updateErrorAndActivityIndicatorVisibilityAnimated:](self, "_updateErrorAndActivityIndicatorVisibilityAnimated:", v4);
    -[HUCameraView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[HUCameraView setNeedsLayout](self, "setNeedsLayout");
    -[HUCameraView _updateMaskedCameraCorners](self, "_updateMaskedCameraCorners");

  }
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v8 = a3;
  -[HUCameraView backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || v4)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __35__HUCameraView_setBackgroundColor___block_invoke;
      v9[3] = &unk_1E6F4D988;
      v9[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v9);
    }
  }
  -[HUCameraView backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (HMCameraSource)cameraSource
{
  void *v2;
  void *v3;

  -[HUCameraView cameraView](self, "cameraView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCameraSource *)v3;
}

void __67__HUCameraView__updateErrorAndActivityIndicatorVisibilityAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  unint64_t v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "errorContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1.0;
  if (v2)
  {
    v3 = 0.0;
    if ((objc_msgSend(*(id *)(a1 + 32), "hideCameraContentWhenDisplayingErrors") & 1) == 0)
      v3 = (double)(objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") ^ 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "cameraContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  LOBYTE(v5) = *(_BYTE *)(a1 + 40);
  v6 = (double)v5;
  objc_msgSend(*(id *)(a1 + 32), "cameraDimmingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  objc_msgSend(*(id *)(a1 + 32), "errorContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 1.0;
  else
    v9 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "errorView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v9);

  v11 = (double)objc_msgSend(*(id *)(a1 + 32), "showActivityIndicator");
  objc_msgSend(*(id *)(a1 + 32), "activityIndicatorView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", v11);

}

- (HUCameraErrorContent)errorContent
{
  return self->_errorContent;
}

- (BOOL)hideCameraContentWhenDisplayingErrors
{
  return self->_hideCameraContentWhenDisplayingErrors;
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (void)setErrorContent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  HUCameraErrorContent *v7;
  void *v8;
  void *v9;
  HUCameraErrorView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];

  v4 = a4;
  v37[4] = *MEMORY[0x1E0C80C00];
  v7 = (HUCameraErrorContent *)a3;
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldSuppressAllErrorsForDemo") & 1) == 0 && self->_errorContent != v7)
  {
    objc_storeStrong((id *)&self->_errorContent, a3);
    if (v7)
    {
      -[HUCameraView errorView](self, "errorView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[HUCameraView overrideErrorView](self, "overrideErrorView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[HUCameraView setErrorView:](self, "setErrorView:", v9);
        }
        else
        {
          v10 = objc_alloc_init(HUCameraErrorView);
          -[HUCameraView setErrorView:](self, "setErrorView:", v10);

        }
        -[HUCameraView errorView](self, "errorView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAlpha:", 0.0);

        -[HUCameraView errorView](self, "errorView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[HUCameraView cameraOverlayView](self, "cameraOverlayView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraView errorView](self, "errorView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSubview:", v14);

        v29 = (void *)MEMORY[0x1E0CB3718];
        -[HUCameraView errorView](self, "errorView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "centerXAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraView centerXAnchor](self, "centerXAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "constraintEqualToAnchor:", v34);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v33;
        -[HUCameraView errorView](self, "errorView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "centerYAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraView centerYAnchor](self, "centerYAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "constraintEqualToAnchor:", v30);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v28;
        -[HUCameraView errorView](self, "errorView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "widthAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraView widthAnchor](self, "widthAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v16;
        -[HUCameraView errorView](self, "errorView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "heightAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraView heightAnchor](self, "heightAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v37[3] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "activateConstraints:", v21);

      }
    }
    -[HUCameraErrorContent titleText](v7, "titleText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView errorView](self, "errorView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitleText:", v22);

    -[HUCameraErrorContent descriptionText](v7, "descriptionText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView errorView](self, "errorView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDescriptionText:", v24);

    -[HUCameraView _updateErrorAndActivityIndicatorVisibilityAnimated:](self, "_updateErrorAndActivityIndicatorVisibilityAnimated:", v4);
  }

}

- (HUCameraErrorViewable)errorView
{
  return self->_errorView;
}

- (UIView)cameraDimmingView
{
  return self->_cameraDimmingView;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)_updateErrorAndActivityIndicatorVisibilityAnimated:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  char v29;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldSuppressAllErrorsForDemo") & 1) != 0)
    return;
  -[HUCameraView errorContent](self, "errorContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && !-[HUCameraView showActivityIndicator](self, "showActivityIndicator"))
  {
    v6 = 0;
    goto LABEL_8;
  }
  if (-[HUCameraView hideCameraContentWhenDisplayingErrors](self, "hideCameraContentWhenDisplayingErrors"))
  {
LABEL_8:
    LOBYTE(v3) = 0;
    goto LABEL_9;
  }
  -[HUCameraView cameraSource](self, "cameraSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");

    if (!(_DWORD)v3)
      goto LABEL_13;
  }
  -[HUCameraView cameraDimmingView](self, "cameraDimmingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    LOBYTE(v3) = 1;
    goto LABEL_13;
  }
  if (+[HUGraphicsUtilities shouldReduceVisualEffects](HUGraphicsUtilities, "shouldReduceVisualEffects")
    || objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    v11 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[HUCameraView bounds](self, "bounds");
    v12 = (void *)objc_msgSend(v11, "initWithFrame:");
    -[HUCameraView setCameraDimmingView:](self, "setCameraDimmingView:", v12);
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1102);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v13, "initWithEffect:", v12);
    -[HUCameraView setCameraDimmingView:](self, "setCameraDimmingView:", v3);

  }
  v14 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorWithAlphaComponent:", 0.5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.5);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraView cameraDimmingView](self, "cameraDimmingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  if (v14)
  {

    v15 = v3;
  }

  -[HUCameraView bounds](self, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[HUCameraView cameraDimmingView](self, "cameraDimmingView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  -[HUCameraView cameraDimmingView](self, "cameraDimmingView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAutoresizingMask:", 18);

  -[HUCameraView cameraDimmingView](self, "cameraDimmingView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAlpha:", 0.0);

  -[HUCameraView cameraOverlayView](self, "cameraOverlayView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraView cameraDimmingView](self, "cameraDimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSubview:atIndex:", v3, 0);

  LOBYTE(v3) = 1;
LABEL_9:

LABEL_13:
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __67__HUCameraView__updateErrorAndActivityIndicatorVisibilityAnimated___block_invoke;
  v28[3] = &unk_1E6F4D200;
  v28[4] = self;
  v29 = (char)v3;
  v9 = _Block_copy(v28);
  v10 = v9;
  if (v4)
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v9, 0.3);
  else
    (*((void (**)(void *))v9 + 2))(v9);

}

- (void)_updateMaskedCameraCorners
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;

  v3 = -[HUCameraView maskedCameraCorners](self, "maskedCameraCorners");
  -[HUCameraView cameraContainerView](self, "cameraContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", v3);

  v5 = -[HUCameraView maskedCameraCorners](self, "maskedCameraCorners") & 0xF;
  -[HUCameraView backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaskedCorners:", v5);

  v8 = -[HUCameraView maskedCameraCorners](self, "maskedCameraCorners") & 0xF;
  -[HUCameraView cameraOverlayView](self, "cameraOverlayView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaskedCorners:", v8);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    v11 = -[HUCameraView maskedCameraCorners](self, "maskedCameraCorners") & 0xF;
    -[HUCameraView demoSnapshotImageView](self, "demoSnapshotImageView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMaskedCorners:", v11);

  }
}

- (unint64_t)maskedCameraCorners
{
  return self->_maskedCameraCorners;
}

- (void)setErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_errorView, a3);
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)setOverrideErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_overrideErrorView, a3);
}

- (HUCameraView)init
{
  return -[HUCameraView initWithBadgeView:](self, "initWithBadgeView:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HUCameraView snapshotAgeUpdateTimer](self, "snapshotAgeUpdateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)HUCameraView;
  -[HUCameraView dealloc](&v4, sel_dealloc);
}

- (double)_continuousCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[HUCameraView cameraContainerView](self, "cameraContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_continuousCornerRadius");
  v4 = v3;

  return v4;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    -[HUCameraView demoSnapshotImageView](self, "demoSnapshotImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setContinuousCornerRadius:", a3);

  }
  -[HUCameraView cameraContainerView](self, "cameraContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setContinuousCornerRadius:", a3);

  -[HUCameraView backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContinuousCornerRadius:", a3);

  -[HUCameraView cameraOverlayView](self, "cameraOverlayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setContinuousCornerRadius:", a3);

  -[HUCameraView _updateMaskedCameraCorners](self, "_updateMaskedCameraCorners");
}

- (id)backgroundColor
{
  void *v2;
  void *v3;

  -[HUCameraView backgroundView](self, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __35__HUCameraView_setBackgroundColor___block_invoke(uint64_t a1)
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
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundView:", v2);

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAutoresizingMask:", 18);

  objc_msgSend(*(id *)(a1 + 32), "_continuousCornerRadius");
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setContinuousCornerRadius:", v14);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(v16, "backgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "insertSubview:atIndex:", v17, 0);

  return objc_msgSend(*(id *)(a1 + 32), "_updateMaskedCameraCorners");
}

- (void)setCameraContentMode:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  -[HUCameraView cameraView](self, "cameraView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contentMode");

  if (v6 != a3)
  {
    -[HUCameraView cameraView](self, "cameraView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentMode:", a3);

    -[HUCameraView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setCameraSource:(id)a3 withDemoSnapshotURL:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v5 = a5;
  v18 = a3;
  v8 = a4;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    -[HUCameraView demoSnapshotImageView](self, "demoSnapshotImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0CEA638]);
      objc_msgSend(v8, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithContentsOfFile:", v11);

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v12);
      -[HUCameraView setDemoSnapshotImageView:](self, "setDemoSnapshotImageView:", v13);
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v14);

      objc_msgSend(v13, "setClipsToBounds:", 1);
      objc_msgSend(v13, "setContentMode:", 2);
      objc_msgSend(v13, "setAutoresizingMask:", 18);
      -[HUCameraView bounds](self, "bounds");
      objc_msgSend(v13, "setFrame:");
      -[HUCameraView addSubview:](self, "addSubview:", v13);
      -[HUCameraView _continuousCornerRadius](self, "_continuousCornerRadius");
      v16 = v15;
      -[HUCameraView demoSnapshotImageView](self, "demoSnapshotImageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_setContinuousCornerRadius:", v16);

    }
  }
  -[HUCameraView setCameraSource:animated:](self, "setCameraSource:animated:", v18, v5);

}

- (void)setCameraSource:(id)a3
{
  -[HUCameraView setCameraSource:animated:](self, "setCameraSource:animated:", a3, 0);
}

- (int64_t)contentModeForAspectRatio:(double)a3
{
  if (((a3 < 1.0) & -[HUCameraView shouldRespectAspectRatio](self, "shouldRespectAspectRatio")) != 0)
    return 1;
  else
    return 2;
}

void __41__HUCameraView_setCameraSource_animated___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  double v3;
  id v4;

  v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(v1, "cameraContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)setErrorContent:(id)a3
{
  -[HUCameraView setErrorContent:animated:](self, "setErrorContent:animated:", a3, 0);
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  -[HUCameraView setShowActivityIndicator:animated:](self, "setShowActivityIndicator:animated:", a3, 0);
}

- (void)setShowActivityIndicator:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  if (self->_showActivityIndicator != a3)
  {
    v4 = a4;
    v5 = a3;
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldSuppressAllErrorsForDemo") & 1) == 0)
    {
      self->_showActivityIndicator = v5;
      -[HUCameraView activityIndicatorView](self, "activityIndicatorView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v5)
      {

        if (!v8)
        {
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 101);
          -[HUCameraView setActivityIndicatorView:](self, "setActivityIndicatorView:", v9);

          -[HUCameraView activityIndicatorView](self, "activityIndicatorView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setAlpha:", 0.0);

          -[HUCameraView activityIndicatorView](self, "activityIndicatorView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

          -[HUCameraView cameraOverlayView](self, "cameraOverlayView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUCameraView activityIndicatorView](self, "activityIndicatorView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addSubview:", v13);

          v23 = (void *)MEMORY[0x1E0CB3718];
          -[HUCameraView activityIndicatorView](self, "activityIndicatorView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "centerXAnchor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUCameraView centerXAnchor](self, "centerXAnchor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "constraintEqualToAnchor:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = v16;
          -[HUCameraView activityIndicatorView](self, "activityIndicatorView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "centerYAnchor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUCameraView centerYAnchor](self, "centerYAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "constraintEqualToAnchor:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v25[1] = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "activateConstraints:", v21);

        }
        -[HUCameraView activityIndicatorView](self, "activityIndicatorView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "startAnimating");

      }
      else
      {
        objc_msgSend(v7, "stopAnimating");

      }
      -[HUCameraView _updateErrorAndActivityIndicatorVisibilityAnimated:](self, "_updateErrorAndActivityIndicatorVisibilityAnimated:", v4);
    }
  }
}

- (void)setBadgeHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUCameraView badgeView](self, "badgeView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)isBadgeHidden
{
  void *v3;
  void *v4;
  char v5;

  -[HUCameraView badgeView](self, "badgeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HUCameraView badgeView](self, "badgeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)setBadgeOffset:(UIOffset)a3
{
  UIOffset *p_badgeOffset;
  CGFloat v6;
  void *v7;
  CGFloat v8;
  id v9;

  p_badgeOffset = &self->_badgeOffset;
  if (a3.horizontal != self->_badgeOffset.horizontal || a3.vertical != self->_badgeOffset.vertical)
  {
    p_badgeOffset->horizontal = a3.horizontal;
    self->_badgeOffset.vertical = a3.vertical;
    v6 = -a3.vertical;
    -[HUCameraView badgeBottomConstraint](self, "badgeBottomConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", v6);

    v8 = -p_badgeOffset->horizontal;
    -[HUCameraView badgeTrailingConstraint](self, "badgeTrailingConstraint");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", v8);

  }
}

- (void)setBadgeBottomAnchor:(id)a3
{
  NSLayoutYAxisAnchor *v5;
  void *v6;
  void *v7;
  NSLayoutYAxisAnchor *v8;

  v5 = (NSLayoutYAxisAnchor *)a3;
  if (self->_badgeBottomAnchor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_badgeBottomAnchor, a3);
    -[HUCameraView badgeBottomConstraint](self, "badgeBottomConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActive:", 0);

    -[HUCameraView badgeTrailingConstraint](self, "badgeTrailingConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 0);

    -[HUCameraView setBadgeBottomConstraint:](self, "setBadgeBottomConstraint:", 0);
    -[HUCameraView setBadgeTrailingConstraint:](self, "setBadgeTrailingConstraint:", 0);
    -[HUCameraView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v8;
  }

}

- (CGRect)derivedCameraContentFrame
{
  void *v3;
  void *v4;
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
  CGRect result;

  -[HUCameraView cameraView](self, "cameraView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "aspectRatio");
    v6 = v5;
    -[HUCameraView bounds](self, "bounds");
    v8 = v7 / v6;
    -[HUCameraView bounds](self, "bounds");
    v10 = (v9 - v8) * 0.5;
    -[HUCameraView bounds](self, "bounds");
    v12 = v11;
    v13 = 0.0;
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v14 = v13;
  v15 = v10;
  v16 = v12;
  v17 = v8;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)cameraContentSnapshot
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  -[HUCameraView cameraView](self, "cameraView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotViewAfterScreenUpdates:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[HUCameraView cameraView](self, "cameraView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
  objc_msgSend(v4, "setFrame:");

  return v4;
}

- (UIView)cameraOverlaySnapshot
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  -[HUCameraView errorContent](self, "errorContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUCameraView cameraOverlayView](self, "cameraOverlayView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[HUCameraView cameraOverlayView](self, "cameraOverlayView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
    objc_msgSend(v3, "setFrame:");

  }
  return (UIView *)v3;
}

- (void)_updateBadgeView
{
  -[HUCameraView _updateBadgeViewReschedulingTimerIfNecessary:](self, "_updateBadgeViewReschedulingTimerIfNecessary:", 1);
}

- (void)_updateBadgeViewReschedulingTimerIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = a3;
  -[HUCameraView badgeView](self, "badgeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_9;
  -[HUCameraView cameraView](self, "cameraView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cameraSource");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_7;
  }
  v8 = (void *)v7;
  v9 = -[HUCameraView isBadgeHidden](self, "isBadgeHidden");

  if (v9)
  {
LABEL_7:
    -[HUCameraView badgeView](self, "badgeView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);
    goto LABEL_8;
  }
  -[HUCameraView cameraView](self, "cameraView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cameraSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraLive"), CFSTR("HUCameraLive"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView badgeView](self, "badgeView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLabelText:", v13);

LABEL_8:
LABEL_9:
    -[HUCameraView snapshotAgeUpdateTimer](self, "snapshotAgeUpdateTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidate");

    -[HUCameraView setSnapshotAgeUpdateTimer:](self, "setSnapshotAgeUpdateTimer:", 0);
    return;
  }
  v16 = objc_opt_class();
  -[HUCameraView cameraView](self, "cameraView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cameraSource");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_16;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v26 = v18;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v16, objc_opt_class());

LABEL_16:
    v26 = 0;
  }

  objc_msgSend(v26, "hf_localizedAge");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraView badgeView](self, "badgeView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLabelText:", v22);

  -[HUCameraView snapshotAgeUpdateTimer](self, "snapshotAgeUpdateTimer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24 || v3)
  {
    objc_msgSend(v26, "captureDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraView _scheduleNextSnapshotAgeUpdateForCaptureDate:](self, "_scheduleNextSnapshotAgeUpdateForCaptureDate:", v25);

  }
}

- (void)_scheduleNextSnapshotAgeUpdateForCaptureDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  -[HUCameraView snapshotAgeUpdateTimer](self, "snapshotAgeUpdateTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0D519A0];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __61__HUCameraView__scheduleNextSnapshotAgeUpdateForCaptureDate___block_invoke;
  v11 = &unk_1E6F5A548;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "scheduledTimerWithReferenceDate:minimumUnit:block:", v4, 128, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraView setSnapshotAgeUpdateTimer:](self, "setSnapshotAgeUpdateTimer:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __61__HUCameraView__scheduleNextSnapshotAgeUpdateForCaptureDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateBadgeViewReschedulingTimerIfNecessary:", 0);

}

- (UIOffset)badgeOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_badgeOffset.horizontal;
  vertical = self->_badgeOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (NSLayoutYAxisAnchor)badgeBottomAnchor
{
  return self->_badgeBottomAnchor;
}

- (UIImageView)demoSnapshotImageView
{
  return self->_demoSnapshotImageView;
}

- (void)setDemoSnapshotImageView:(id)a3
{
  objc_storeStrong((id *)&self->_demoSnapshotImageView, a3);
}

- (BOOL)shouldRespectAspectRatio
{
  return self->_shouldRespectAspectRatio;
}

- (void)setShouldRespectAspectRatio:(BOOL)a3
{
  self->_shouldRespectAspectRatio = a3;
}

- (void)setCameraDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraDimmingView, a3);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (NADecayingTimer)snapshotAgeUpdateTimer
{
  return self->_snapshotAgeUpdateTimer;
}

- (void)setSnapshotAgeUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotAgeUpdateTimer, a3);
}

- (NSLayoutConstraint)cameraAspectRatioConstraint
{
  return self->_cameraAspectRatioConstraint;
}

- (void)setCameraAspectRatioConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_cameraAspectRatioConstraint, a3);
}

- (NSLayoutConstraint)badgeBottomConstraint
{
  return self->_badgeBottomConstraint;
}

- (void)setBadgeBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_badgeBottomConstraint, a3);
}

- (NSLayoutConstraint)badgeTrailingConstraint
{
  return self->_badgeTrailingConstraint;
}

- (void)setBadgeTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_badgeTrailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_badgeBottomConstraint, 0);
  objc_storeStrong((id *)&self->_cameraAspectRatioConstraint, 0);
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_snapshotAgeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_cameraDimmingView, 0);
  objc_storeStrong((id *)&self->_cameraOverlayView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_cameraContainerView, 0);
  objc_storeStrong((id *)&self->_demoSnapshotImageView, 0);
  objc_storeStrong((id *)&self->_overrideErrorView, 0);
  objc_storeStrong((id *)&self->_errorContent, 0);
  objc_storeStrong((id *)&self->_badgeBottomAnchor, 0);
}

@end
