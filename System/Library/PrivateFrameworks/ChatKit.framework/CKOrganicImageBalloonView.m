@implementation CKOrganicImageBalloonView

- (CKOrganicImageBalloonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKOrganicImageBalloonView *v7;
  CKBalloonImageView *v8;
  void *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CKOrganicImageBalloonView;
  v7 = -[CKImageBalloonView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[CKBalloonImageView initWithFrame:]([CKBalloonImageView alloc], "initWithFrame:", x, y, width, height);
    -[CKOrganicImageBalloonView setImageView:](v7, "setImageView:", v8);

    -[CKOrganicImageBalloonView imageView](v7, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKOrganicImageBalloonView addSubview:](v7, "addSubview:", v9);

  }
  return v7;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  void *v39;
  double v40;
  double v41;
  __int128 v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  double v54;
  double v55;
  double v56;
  double v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)CKOrganicImageBalloonView;
  -[CKImageBalloonView prepareForDisplay](&v58, sel_prepareForDisplay);
  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForDisplay");

  -[CKOrganicImageBalloonView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);

  -[CKOrganicImageBalloonView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 20.0);

  -[CKOrganicImageBalloonView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v9, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  -[CKOrganicImageBalloonView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMasksToBounds:", 1);

  -[CKOrganicImageBalloonView dashedBorder](self, "dashedBorder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeFromSuperlayer");

  if (-[CKImageBalloonView isScheduled](self, "isScheduled"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isDashedBalloonsEnabled");

    if (v15)
    {
      -[CKOrganicImageBalloonView dashedBorder](self, "dashedBorder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CD2840], "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKOrganicImageBalloonView setDashedBorder:](self, "setDashedBorder:", v17);

        v18 = (void *)MEMORY[0x1E0CEA478];
        -[CKOrganicImageBalloonView balloonDescriptor](self, "balloonDescriptor");
        objc_msgSend(v18, "ck_colorWithCKColor:", v54, v55, v56, v57);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "cgColor");
        -[CKOrganicImageBalloonView dashedBorder](self, "dashedBorder");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setStrokeColor:", v20);

        -[CKOrganicImageBalloonView dashedBorder](self, "dashedBorder");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFillColor:", 0);

        -[CKOrganicImageBalloonView dashedBorder](self, "dashedBorder");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setLineDashPattern:", &unk_1E286F3D0);

        -[CKOrganicImageBalloonView dashedBorder](self, "dashedBorder");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setLineWidth:", 2.0);

        -[CKOrganicImageBalloonView dashedBorder](self, "dashedBorder");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setCornerRadius:", 20.0);

        -[CKOrganicImageBalloonView dashedBorder](self, "dashedBorder");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setCornerCurve:", v10);

        -[CKOrganicImageBalloonView dashedBorder](self, "dashedBorder");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAllowsEdgeAntialiasing:", 1);

      }
      -[CKOrganicImageBalloonView layer](self, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKOrganicImageBalloonView dashedBorder](self, "dashedBorder");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addSublayer:", v29);

    }
    -[CKOrganicImageBalloonView layer](self, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCornerRadius:", 20.0);

    -[CKOrganicImageBalloonView layer](self, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCornerCurve:", v10);

    -[CKOrganicImageBalloonView layer](self, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMasksToBounds:", 1);

    -[CKOrganicImageBalloonView imageView](self, "imageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAlpha:", 0.5);

  }
  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "effectView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCornerRadius:", 20.0);

  objc_msgSend(v35, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setCornerCurve:", v10);

  objc_msgSend(v35, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setMasksToBounds:", 1);

  -[CKOrganicImageBalloonView layoutRecipe](self, "layoutRecipe");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rotation");
  v41 = v40;

  memset(&v53, 0, sizeof(v53));
  v42 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v52.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v52.c = v42;
  *(_OWORD *)&v52.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformRotate(&v53, &v52, v41 * 3.14159265 / 180.0);
  v51 = v53;
  -[CKOrganicImageBalloonView setTransform:](self, "setTransform:", &v51);
  -[CKOrganicImageBalloonView layoutRecipe](self, "layoutRecipe");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = objc_msgSend(v43, "wantsShadow");

  if ((_DWORD)v37)
  {
    -[CKOrganicImageBalloonView layer](self, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setShadowOffset:", 0.0, 7.0);

    -[CKOrganicImageBalloonView layer](self, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v46) = 1045220557;
    objc_msgSend(v45, "setShadowOpacity:", v46);

    -[CKOrganicImageBalloonView layer](self, "layer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setShadowRadius:", 27.0);

    -[CKOrganicImageBalloonView layer](self, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setShadowPathIsBounds:", 1);

  }
  -[CKOrganicImageBalloonView imageView](self, "imageView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setAllowsEdgeAntialiasing:", 1);

}

- (void)setMonoskiBadgeView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKOrganicImageBalloonView;
  v3 = a3;
  -[CKImageBalloonView setMonoskiBadgeView:](&v7, sel_setMonoskiBadgeView_, v3);
  objc_msgSend(v3, "layer", v7.receiver, v7.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 20.0);

  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMasksToBounds:", 1);
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
  uint64_t v13;
  void *v14;
  int v15;
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
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)CKOrganicImageBalloonView;
  -[CKImageBalloonView layoutSubviews](&v47, sel_layoutSubviews);
  -[CKImageBalloonView monoskiBadgeView](self, "monoskiBadgeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKOrganicImageBalloonView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[CKImageBalloonView monoskiBadgeView](self, "monoskiBadgeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  }
  -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = -[CKBalloonView orientation](self, "orientation");

    if (!v15)
    {
      -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "balloonMaskTailWidth");
      v27 = v18 - v26;

      -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFrame:", v27, v20, v22, v24);

    }
  }
  v29 = (void *)MEMORY[0x1E0CEA390];
  -[CKOrganicImageBalloonView layer](self, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  -[CKOrganicImageBalloonView layer](self, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "cornerRadius");
  objc_msgSend(v29, "bezierPathWithRoundedRect:cornerRadius:", v32, v34, v36, v38, v40);
  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v42 = objc_msgSend(v41, "CGPath");
  -[CKOrganicImageBalloonView dashedBorder](self, "dashedBorder");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setPath:", v42);

  -[CKOrganicImageBalloonView imageView](self, "imageView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKImageBalloonView imageInsets](self, "imageInsets");
  objc_msgSend(v45, "setCornerRadius:", 20.0 - v46);

}

- (id)tailMask
{
  return 0;
}

- (BOOL)suppressMask
{
  return 1;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  __int128 v12;
  void *v13;
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
  double v25;
  void *v26;
  void *v27;
  double v28;
  _OWORD v29[3];
  objc_super v30;
  _OWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGRect v35;
  CGRect v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKOrganicImageBalloonView frame](self, "frame");
  v36.origin.x = v8;
  v36.origin.y = v9;
  v36.size.width = v10;
  v36.size.height = v11;
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  if (!CGRectEqualToRect(v35, v36))
  {
    v33 = 0u;
    v34 = 0u;
    v32 = 0u;
    -[CKOrganicImageBalloonView transform](self, "transform");
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v31[0] = *MEMORY[0x1E0C9BAA8];
    v31[1] = v12;
    v31[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[CKOrganicImageBalloonView setTransform:](self, "setTransform:", v31);
    v30.receiver = self;
    v30.super_class = (Class)CKOrganicImageBalloonView;
    -[CKBalloonView setFrame:](&v30, sel_setFrame_, x, y, width, height);
    -[CKOrganicImageBalloonView imageView](self, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKOrganicImageBalloonView bounds](self, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[CKImageBalloonView imageInsets](self, "imageInsets");
    objc_msgSend(v13, "setFrame:", v15 + v25, v17 + v22, v19 - (v25 + v23), v21 - (v22 + v24));

    -[CKOrganicImageBalloonView imageView](self, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonView imageInsets](self, "imageInsets");
    objc_msgSend(v27, "setCornerRadius:", 20.0 - v28);

    v29[0] = v32;
    v29[1] = v33;
    v29[2] = v34;
    -[CKOrganicImageBalloonView setTransform:](self, "setTransform:", v29);
  }
}

- (id)createOverlayImageView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 20.0);

  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMasksToBounds:", 1);

  -[CKImageBalloonView overlayColor](self, "overlayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v8);

  objc_msgSend(v4, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsEdgeAntialiasing:", 1);

  return v4;
}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v4 = a3;
  objc_msgSend(v4, "balloonBackdropFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "Cannot have two backdrop filter layers", v19, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _CKAssert(v8 == 0);

    }
    -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperlayer");

      -[CKBalloonView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", 0);
    }
    -[CKImageBalloonView setSuppressMask:](self, "setSuppressMask:", 1);
    -[CKOrganicImageBalloonView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    v12 = objc_alloc_init(MEMORY[0x1E0CD2708]);
    -[CKOrganicImageBalloonView bounds](self, "bounds");
    objc_msgSend(v12, "setFrame:");
    objc_msgSend(v12, "setGroupName:", CFSTR("FSMBackdropGroup"));
    objc_msgSend(v4, "balloonBackdropFilters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", v13);

    objc_msgSend(v12, "setScale:", 0.25);
    objc_msgSend(v12, "setCornerRadius:", 20.0);
    objc_msgSend(v12, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v12, "setMasksToBounds:", 1);
    -[CKOrganicImageBalloonView bounds](self, "bounds");
    objc_msgSend(v12, "setFrame:");
    -[CKBalloonView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", v12);
    -[CKOrganicImageBalloonView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v12);

    -[CKBalloonView setInvisibleInkEffectEnabled:](self, "setInvisibleInkEffectEnabled:", 0);
  }
  -[CKOrganicImageBalloonView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonFilters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFilters:", v16);

  -[CKOrganicImageBalloonView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonCompositingFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCompositingFilter:", v18);

}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKOrganicImageBalloonView;
  v4 = a3;
  -[CKImageBalloonView setImage:](&v7, sel_setImage_, 0);
  -[CKOrganicImageBalloonView layer](self, "layer", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContents:", 0);

  -[CKOrganicImageBalloonView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v4);

}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKOrganicImageBalloonView imageView](self, "imageView", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "size");
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (width < v9 || height < v11)
  {
    v13 = width / v9;
    v14 = 0.0;
    if (v9 == 0.0)
      v13 = 0.0;
    if (v11 != 0.0)
      v14 = height / v11;
    v15 = fmin(v13, v14);
    v9 = ceil(v9 * v15);
    v11 = ceil(v11 * v15);
  }

  v16 = v9;
  v17 = v11;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)image
{
  return 0;
}

- (void)setInvisibleInkEffectImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKOrganicImageBalloonView imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvisibleInkEffectImage:", v4);

}

- (id)invisibleInkEffectImage
{
  void *v2;
  void *v3;

  -[CKOrganicImageBalloonView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invisibleInkEffectImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canUseOpaqueMask
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  CKBalloonDescriptor_t *result;
  objc_super v5;

  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v5.receiver = self;
  v5.super_class = (Class)CKOrganicImageBalloonView;
  result = (CKBalloonDescriptor_t *)-[CKBalloonDescriptor_t balloonDescriptor](&v5, sel_balloonDescriptor);
  retstr->var4 = -1;
  retstr->var1 = 0;
  return result;
}

- (void)attachInvisibleInkEffectView
{
  void *v3;
  void *v4;
  id v5;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CKOrganicImageBalloonView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKOrganicImageBalloonView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5, v4);

}

- (void)detachInvisibleInkEffectView
{
  void *v2;
  id v3;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectView");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeFromSuperview");
}

- (void)prepareForReuse
{
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v7[3];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKOrganicImageBalloonView;
  -[CKImageBalloonView prepareForReuse](&v8, sel_prepareForReuse);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[CKOrganicImageBalloonView setTransform:](self, "setTransform:", v7);
  -[CKOrganicImageBalloonView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[CKOrganicImageBalloonView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", 0);

  -[CKOrganicImageBalloonView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", 0.0);

}

- (CKOrganicImageLayoutRecipe)layoutRecipe
{
  return self->_layoutRecipe;
}

- (void)setLayoutRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_layoutRecipe, a3);
}

- (CKBalloonImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (CAShapeLayer)dashedBorder
{
  return self->_dashedBorder;
}

- (void)setDashedBorder:(id)a3
{
  objc_storeStrong((id *)&self->_dashedBorder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashedBorder, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_layoutRecipe, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKOrganicImageBalloonView;
  v4 = a3;
  -[CKImageBalloonView configureForMessagePart:](&v6, sel_configureForMessagePart_, v4);
  objc_msgSend(v4, "layoutRecipe", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKOrganicImageBalloonView setLayoutRecipe:](self, "setLayoutRecipe:", v5);
}

@end
