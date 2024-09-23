@implementation PKPalettePencilInteractionFeedbackHostView

- (PKPalettePencilInteractionFeedbackHostView)initWithDelegate:(id)a3
{
  id v4;
  PKPalettePencilInteractionFeedbackHostView *v5;
  PKPalettePencilInteractionFeedbackHostView *v6;
  UILayoutGuide *v7;
  UILayoutGuide *pencilInteractionFeedbackViewLayoutGuide;
  void *v9;
  void *v10;
  uint64_t v11;
  NSLayoutConstraint *layoutGuideWidthConstraint;
  void *v13;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *layoutGuideHeightConstraint;
  void *v17;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *layoutGuideCenterXConstraint;
  void *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *layoutGuideCenterYConstraint;
  void *v25;
  void *v26;
  UIViewFloatAnimatableProperty *v27;
  UIViewFloatAnimatableProperty *feedbackViewVisibilityAnimatableProperty;
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKPalettePencilInteractionFeedbackHostView;
  v5 = -[PKPalettePencilInteractionFeedbackHostView initWithFrame:](&v30, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    pencilInteractionFeedbackViewLayoutGuide = v6->_pencilInteractionFeedbackViewLayoutGuide;
    v6->_pencilInteractionFeedbackViewLayoutGuide = v7;

    -[PKPalettePencilInteractionFeedbackHostView addLayoutGuide:](v6, "addLayoutGuide:", v6->_pencilInteractionFeedbackViewLayoutGuide);
    -[UILayoutGuide widthAnchor](v6->_pencilInteractionFeedbackViewLayoutGuide, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView widthAnchor](v6, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    layoutGuideWidthConstraint = v6->_layoutGuideWidthConstraint;
    v6->_layoutGuideWidthConstraint = (NSLayoutConstraint *)v11;

    -[UILayoutGuide heightAnchor](v6->_pencilInteractionFeedbackViewLayoutGuide, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView heightAnchor](v6, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    layoutGuideHeightConstraint = v6->_layoutGuideHeightConstraint;
    v6->_layoutGuideHeightConstraint = (NSLayoutConstraint *)v15;

    -[UILayoutGuide centerXAnchor](v6->_pencilInteractionFeedbackViewLayoutGuide, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView centerXAnchor](v6, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    layoutGuideCenterXConstraint = v6->_layoutGuideCenterXConstraint;
    v6->_layoutGuideCenterXConstraint = (NSLayoutConstraint *)v19;

    -[UILayoutGuide centerYAnchor](v6->_pencilInteractionFeedbackViewLayoutGuide, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView centerYAnchor](v6, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    layoutGuideCenterYConstraint = v6->_layoutGuideCenterYConstraint;
    v6->_layoutGuideCenterYConstraint = (NSLayoutConstraint *)v23;

    v25 = (void *)MEMORY[0x1E0CB3718];
    v31[0] = v6->_layoutGuideWidthConstraint;
    v31[1] = v6->_layoutGuideHeightConstraint;
    v31[2] = v6->_layoutGuideCenterXConstraint;
    v31[3] = v6->_layoutGuideCenterYConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v26);

    v27 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0DC3F30]);
    feedbackViewVisibilityAnimatableProperty = v6->_feedbackViewVisibilityAnimatableProperty;
    v6->_feedbackViewVisibilityAnimatableProperty = v27;

    -[UIViewFloatAnimatableProperty setValue:](v6->_feedbackViewVisibilityAnimatableProperty, "setValue:", 0.0);
  }

  return v6;
}

- (CGSize)minimizedPaletteSize
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[PKPalettePencilInteractionFeedbackHostView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPalettePencilInteractionFeedbackHostView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paletteView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minimizedPaletteSize");
  v10 = v9;
  v12 = v11;

  if (v6)
  {
    v10 = v10 * 0.8;
    v12 = v12 * 0.8;
  }
  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)minimizedPaletteScaleFactor
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;

  -[PKPalettePencilInteractionFeedbackHostView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPalettePencilInteractionFeedbackHostView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paletteView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "paletteScaleFactorPolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paletteView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "adjustedWindowSceneBounds");
    objc_msgSend(v10, "scaleFactorForWindowBounds:");
    v14 = v13;

  }
  else
  {
    objc_msgSend(v8, "paletteScaleFactor");
    v14 = v15;
  }

  return v14 * 0.8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PKPalettePencilInteractionFeedbackHostView *v5;
  PKPalettePencilInteractionFeedbackHostView *v6;
  PKPalettePencilInteractionFeedbackHostView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPalettePencilInteractionFeedbackHostView;
  -[PKPalettePencilInteractionFeedbackHostView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PKPalettePencilInteractionFeedbackHostView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PKPalettePencilInteractionFeedbackHostView;
  -[PKPalettePencilInteractionFeedbackHostView layoutSubviews](&v39, sel_layoutSubviews);
  -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPalettePencilInteractionFeedbackHostView minimizedPaletteSize](self, "minimizedPaletteSize");
    v5 = v4 * 0.5;
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setCornerRadius:", v5);

    -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paletteShadowColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowColor:", v9);

    -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paletteShadowOpacity");
    *(float *)&v5 = v13;
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = LODWORD(v5);
    objc_msgSend(v15, "setShadowOpacity:", v16);

    -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "paletteShadowOffset");
    v19 = v18;
    v21 = v20;
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShadowOffset:", v19, v21);

    -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "paletteShadowRadius");
    v26 = v25;
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setShadowRadius:", v26);

    -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "paletteBorderColor");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = objc_msgSend(v30, "CGColor");
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBorderColor:", v31);

    -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "paletteBorderWidth");
    v36 = v35;
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setBorderWidth:", v36);

  }
}

- (BOOL)_isPencilInteractionFeedbackViewAlmostOffScreen
{
  void *v2;
  double v3;
  BOOL v4;

  -[PKPalettePencilInteractionFeedbackHostView feedbackViewVisibilityAnimatableProperty](self, "feedbackViewVisibilityAnimatableProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  v4 = v3 < 0.5;

  return v4;
}

- (void)showFeedbackForCurrentlySelectedToolInPaletteView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKPalettePencilInteractionFeedbackView *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  id location;
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[6];
  _QWORD v92[4];

  v92[2] = *MEMORY[0x1E0C80C00];
  -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewAutodismissTimer](self, "pencilInteractionFeedbackViewAutodismissTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PKPalettePencilInteractionFeedbackHostView setPencilInteractionFeedbackViewAutodismissTimer:](self, "setPencilInteractionFeedbackViewAutodismissTimer:", 0);
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0C99E88];
  v80[1] = 3221225472;
  v80[2] = __95__PKPalettePencilInteractionFeedbackHostView_showFeedbackForCurrentlySelectedToolInPaletteView__block_invoke;
  v80[3] = &unk_1E777BA38;
  v80[0] = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v81, &location);
  objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v80, 0.9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPalettePencilInteractionFeedbackHostView setPencilInteractionFeedbackViewAutodismissTimer:](self, "setPencilInteractionFeedbackViewAutodismissTimer:", v5);

  -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = v6 == 0;

  if ((_DWORD)v3)
  {
    v7 = objc_alloc_init(PKPalettePencilInteractionFeedbackView);
    -[PKPalettePencilInteractionFeedbackHostView setPencilInteractionFeedbackView:](self, "setPencilInteractionFeedbackView:", v7);

    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView addSubview:](self, "addSubview:", v9);

    -[PKPalettePencilInteractionFeedbackHostView minimizedPaletteSize](self, "minimizedPaletteSize");
    v11 = v10;
    v13 = v12;
    v14 = (void *)MEMORY[0x1E0CB3718];
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v17;
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activateConstraints:", v21);

    -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "paletteEdgeSpacingForMinimized");
    v24 = v23;

    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewLayoutGuide](self, "pencilInteractionFeedbackViewLayoutGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, -v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView setPencilInteractionFeedbackViewBottomConstraint:](self, "setPencilInteractionFeedbackViewBottomConstraint:", v29);

    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "leftAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewLayoutGuide](self, "pencilInteractionFeedbackViewLayoutGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leftAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, v24);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView setPencilInteractionFeedbackViewLeftConstraint:](self, "setPencilInteractionFeedbackViewLeftConstraint:", v34);

    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewLayoutGuide](self, "pencilInteractionFeedbackViewLayoutGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, v24);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView setPencilInteractionFeedbackViewTopConstraint:](self, "setPencilInteractionFeedbackViewTopConstraint:", v39);

    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "rightAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewLayoutGuide](self, "pencilInteractionFeedbackViewLayoutGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "rightAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43, -v24);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView setPencilInteractionFeedbackViewRightConstraint:](self, "setPencilInteractionFeedbackViewRightConstraint:", v44);

    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "centerXAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewLayoutGuide](self, "pencilInteractionFeedbackViewLayoutGuide");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "centerXAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView setPencilInteractionFeedbackViewCenterXConstraint:](self, "setPencilInteractionFeedbackViewCenterXConstraint:", v49);

    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "centerYAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewLayoutGuide](self, "pencilInteractionFeedbackViewLayoutGuide");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPalettePencilInteractionFeedbackHostView setPencilInteractionFeedbackViewCenterYConstraint:](self, "setPencilInteractionFeedbackViewCenterYConstraint:", v54);

  }
  if (!-[PKPalettePencilInteractionFeedbackHostView isPencilInteractionFeedbackViewVisible](self, "isPencilInteractionFeedbackViewVisible"))
  {
    v55 = (void *)MEMORY[0x1E0CB3718];
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewBottomConstraint](self, "pencilInteractionFeedbackViewBottomConstraint");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v56;
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewLeftConstraint](self, "pencilInteractionFeedbackViewLeftConstraint");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v57;
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewTopConstraint](self, "pencilInteractionFeedbackViewTopConstraint");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v58;
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewRightConstraint](self, "pencilInteractionFeedbackViewRightConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v91[3] = v59;
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewCenterXConstraint](self, "pencilInteractionFeedbackViewCenterXConstraint");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v91[4] = v60;
    -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewCenterYConstraint](self, "pencilInteractionFeedbackViewCenterYConstraint");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v91[5] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 6);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "deactivateConstraints:", v62);

    switch(-[PKPalettePencilInteractionFeedbackHostView _palettePosition](self, "_palettePosition"))
    {
      case 1:
        v63 = (void *)MEMORY[0x1E0CB3718];
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewTopConstraint](self, "pencilInteractionFeedbackViewTopConstraint");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = v64;
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewCenterXConstraint](self, "pencilInteractionFeedbackViewCenterXConstraint");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v89[1] = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "activateConstraints:", v66);
        goto LABEL_13;
      case 2:
        v67 = (void *)MEMORY[0x1E0CB3718];
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewRightConstraint](self, "pencilInteractionFeedbackViewRightConstraint");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = v64;
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewCenterYConstraint](self, "pencilInteractionFeedbackViewCenterYConstraint");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v87[1] = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "activateConstraints:", v66);
        goto LABEL_13;
      case 3:
        v68 = (void *)MEMORY[0x1E0CB3718];
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewBottomConstraint](self, "pencilInteractionFeedbackViewBottomConstraint");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v90[0] = v64;
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewCenterXConstraint](self, "pencilInteractionFeedbackViewCenterXConstraint");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v90[1] = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "activateConstraints:", v66);
        goto LABEL_13;
      case 4:
        v69 = (void *)MEMORY[0x1E0CB3718];
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewLeftConstraint](self, "pencilInteractionFeedbackViewLeftConstraint");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = v64;
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewCenterYConstraint](self, "pencilInteractionFeedbackViewCenterYConstraint");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v88[1] = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "activateConstraints:", v66);
        goto LABEL_13;
      case 5:
        v70 = (void *)MEMORY[0x1E0CB3718];
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewTopConstraint](self, "pencilInteractionFeedbackViewTopConstraint");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v86[0] = v64;
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewLeftConstraint](self, "pencilInteractionFeedbackViewLeftConstraint");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v86[1] = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "activateConstraints:", v66);
        goto LABEL_13;
      case 6:
        v71 = (void *)MEMORY[0x1E0CB3718];
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewTopConstraint](self, "pencilInteractionFeedbackViewTopConstraint");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v85[0] = v64;
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewRightConstraint](self, "pencilInteractionFeedbackViewRightConstraint");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v85[1] = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "activateConstraints:", v66);
        goto LABEL_13;
      case 7:
        v72 = (void *)MEMORY[0x1E0CB3718];
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewBottomConstraint](self, "pencilInteractionFeedbackViewBottomConstraint");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v83[0] = v64;
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewRightConstraint](self, "pencilInteractionFeedbackViewRightConstraint");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v83[1] = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "activateConstraints:", v66);
        goto LABEL_13;
      case 8:
        v73 = (void *)MEMORY[0x1E0CB3718];
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewBottomConstraint](self, "pencilInteractionFeedbackViewBottomConstraint");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v84[0] = v64;
        -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackViewLeftConstraint](self, "pencilInteractionFeedbackViewLeftConstraint");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v84[1] = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "activateConstraints:", v66);
LABEL_13:

        break;
      default:
        break;
    }
    -[PKPalettePencilInteractionFeedbackHostView _updateLayoutGuideConstraints](self, "_updateLayoutGuideConstraints");
  }
  v74 = -[PKPalettePencilInteractionFeedbackHostView _isPencilInteractionFeedbackViewAlmostOffScreen](self, "_isPencilInteractionFeedbackViewAlmostOffScreen");
  -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "paletteView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "selectedToolView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "tool");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPalettePencilInteractionFeedbackHostView pencilInteractionFeedbackView](self, "pencilInteractionFeedbackView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPalettePencilInteractionFeedbackHostView minimizedPaletteScaleFactor](self, "minimizedPaletteScaleFactor");
  objc_msgSend(v79, "showPreviewForTool:scalingFactor:animated:", v78, !v74);

  -[PKPalettePencilInteractionFeedbackHostView _animatePencilInteractionFeedbackViewToVisible:animated:completion:](self, "_animatePencilInteractionFeedbackViewToVisible:animated:completion:", 1, 1, 0);
  objc_destroyWeak(&v81);
  objc_destroyWeak(&location);
}

void __95__PKPalettePencilInteractionFeedbackHostView_showFeedbackForCurrentlySelectedToolInPaletteView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_animatePencilInteractionFeedbackViewToVisible:animated:completion:", 0, 1, 0);

}

- (int64_t)_palettePosition
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "palettePosition");

  return v4;
}

- (void)hideFeedbackView
{
  -[PKPalettePencilInteractionFeedbackHostView _animatePencilInteractionFeedbackViewToVisible:animated:completion:](self, "_animatePencilInteractionFeedbackViewToVisible:animated:completion:", 0, 0, 0);
}

- (void)_animatePencilInteractionFeedbackViewToVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  _QWORD v19[5];
  void (**v20)(_QWORD);
  _QWORD v21[5];
  id v22;
  _QWORD aBlock[5];
  BOOL v24;

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(_QWORD))a5;
  if (-[PKPalettePencilInteractionFeedbackHostView isPencilInteractionFeedbackViewVisible](self, "isPencilInteractionFeedbackViewVisible") != v6)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke;
    aBlock[3] = &unk_1E777A028;
    aBlock[4] = self;
    v24 = v6;
    v10 = _Block_copy(aBlock);
    v11 = v10;
    if (v5)
    {
      -[PKPalettePencilInteractionFeedbackHostView layoutIfNeeded](self, "layoutIfNeeded");
      v12 = (void *)MEMORY[0x1E0DC3F10];
      -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "paletteSpringAnimationDampingRatio");
      v15 = v14;
      -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "paletteSpringAnimationResponse");
      v18 = v17;
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke_2;
      v21[3] = &unk_1E7778858;
      v21[4] = self;
      v22 = v11;
      v19[0] = v9;
      v19[1] = 3221225472;
      v19[2] = __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke_3;
      v19[3] = &unk_1E777C5B8;
      v19[4] = self;
      v20 = v8;
      objc_msgSend(v12, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v21, v19, v15, v18, 0.0, 0.0, 0.0, 0.0);

    }
    else
    {
      (*((void (**)(void *))v10 + 2))(v10);
      if (v8)
        v8[2](v8);
    }

  }
}

uint64_t __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  double v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setPencilInteractionFeedbackViewVisible:", *(unsigned __int8 *)(a1 + 40));
  LOBYTE(v2) = *(_BYTE *)(a1 + 40);
  v3 = (double)v2;
  objc_msgSend(*(id *)(a1 + 32), "feedbackViewVisibilityAnimatableProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutGuideConstraints");
}

uint64_t __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "isPencilInteractionFeedbackViewVisible") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "pencilInteractionFeedbackView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "setPencilInteractionFeedbackView:", 0);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateLayoutGuideConstraints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  id v26;

  -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paletteView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paletteSizeForEdge:", 4);
  v6 = v5;

  -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paletteEdgeSpacing");
  v9 = v8;

  v10 = v6 + v9;
  switch(-[PKPalettePencilInteractionFeedbackHostView _palettePosition](self, "_palettePosition"))
  {
    case 1:
      goto LABEL_6;
    case 2:
      goto LABEL_10;
    case 3:
      goto LABEL_15;
    case 4:
      goto LABEL_19;
    case 5:
      -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "paletteView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "edgeLocationToDockFromCorner:", 1);

      if (v13 == 2)
        goto LABEL_19;
      goto LABEL_5;
    case 6:
      -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "paletteView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "edgeLocationToDockFromCorner:", 2);

      if (v13 == 8)
        goto LABEL_10;
LABEL_5:
      if (v13 != 1)
        return;
LABEL_6:
      -[PKPalettePencilInteractionFeedbackHostView layoutGuideCenterXConstraint](self, "layoutGuideCenterXConstraint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setConstant:", 0.0);

      if (-[PKPalettePencilInteractionFeedbackHostView isPencilInteractionFeedbackViewVisible](self, "isPencilInteractionFeedbackViewVisible"))
      {
        v10 = 0.0;
      }
      else
      {
        v10 = -v10;
      }
      goto LABEL_17;
    case 7:
      -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "paletteView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "edgeLocationToDockFromCorner:", 8);

      if (v19 != 8)
        goto LABEL_14;
LABEL_10:
      if (-[PKPalettePencilInteractionFeedbackHostView isPencilInteractionFeedbackViewVisible](self, "isPencilInteractionFeedbackViewVisible"))
      {
        v10 = 0.0;
      }
      goto LABEL_22;
    case 8:
      -[PKPalettePencilInteractionFeedbackHostView delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "paletteView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v21, "edgeLocationToDockFromCorner:", 4);

      if (v19 == 2)
      {
LABEL_19:
        if (-[PKPalettePencilInteractionFeedbackHostView isPencilInteractionFeedbackViewVisible](self, "isPencilInteractionFeedbackViewVisible"))
        {
          v10 = 0.0;
        }
        else
        {
          v10 = -v10;
        }
LABEL_22:
        -[PKPalettePencilInteractionFeedbackHostView layoutGuideCenterXConstraint](self, "layoutGuideCenterXConstraint");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setConstant:", v10);

        -[PKPalettePencilInteractionFeedbackHostView layoutGuideCenterYConstraint](self, "layoutGuideCenterYConstraint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0.0;
        v26 = v23;
      }
      else
      {
LABEL_14:
        if (v19 != 4)
          return;
LABEL_15:
        -[PKPalettePencilInteractionFeedbackHostView layoutGuideCenterXConstraint](self, "layoutGuideCenterXConstraint");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setConstant:", 0.0);

        if (-[PKPalettePencilInteractionFeedbackHostView isPencilInteractionFeedbackViewVisible](self, "isPencilInteractionFeedbackViewVisible"))
        {
          v10 = 0.0;
        }
LABEL_17:
        -[PKPalettePencilInteractionFeedbackHostView layoutGuideCenterYConstraint](self, "layoutGuideCenterYConstraint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v23;
        v24 = v10;
      }
      objc_msgSend(v23, "setConstant:", v24);

      return;
    default:
      return;
  }
}

- (PKPalettePencilInteractionFeedbackHostViewDelegate)delegate
{
  return (PKPalettePencilInteractionFeedbackHostViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPalettePencilInteractionFeedbackView)pencilInteractionFeedbackView
{
  return self->_pencilInteractionFeedbackView;
}

- (void)setPencilInteractionFeedbackView:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackView, a3);
}

- (NSTimer)pencilInteractionFeedbackViewAutodismissTimer
{
  return self->_pencilInteractionFeedbackViewAutodismissTimer;
}

- (void)setPencilInteractionFeedbackViewAutodismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewAutodismissTimer, a3);
}

- (UILayoutGuide)pencilInteractionFeedbackViewLayoutGuide
{
  return self->_pencilInteractionFeedbackViewLayoutGuide;
}

- (void)setPencilInteractionFeedbackViewLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewLayoutGuide, a3);
}

- (NSLayoutConstraint)layoutGuideWidthConstraint
{
  return self->_layoutGuideWidthConstraint;
}

- (void)setLayoutGuideWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuideWidthConstraint, a3);
}

- (NSLayoutConstraint)layoutGuideHeightConstraint
{
  return self->_layoutGuideHeightConstraint;
}

- (void)setLayoutGuideHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuideHeightConstraint, a3);
}

- (NSLayoutConstraint)layoutGuideCenterXConstraint
{
  return self->_layoutGuideCenterXConstraint;
}

- (void)setLayoutGuideCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuideCenterXConstraint, a3);
}

- (NSLayoutConstraint)layoutGuideCenterYConstraint
{
  return self->_layoutGuideCenterYConstraint;
}

- (void)setLayoutGuideCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuideCenterYConstraint, a3);
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewBottomConstraint
{
  return self->_pencilInteractionFeedbackViewBottomConstraint;
}

- (void)setPencilInteractionFeedbackViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewBottomConstraint, a3);
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewLeftConstraint
{
  return self->_pencilInteractionFeedbackViewLeftConstraint;
}

- (void)setPencilInteractionFeedbackViewLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewLeftConstraint, a3);
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewTopConstraint
{
  return self->_pencilInteractionFeedbackViewTopConstraint;
}

- (void)setPencilInteractionFeedbackViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewTopConstraint, a3);
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewRightConstraint
{
  return self->_pencilInteractionFeedbackViewRightConstraint;
}

- (void)setPencilInteractionFeedbackViewRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewRightConstraint, a3);
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewCenterXConstraint
{
  return self->_pencilInteractionFeedbackViewCenterXConstraint;
}

- (void)setPencilInteractionFeedbackViewCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewCenterXConstraint, a3);
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewCenterYConstraint
{
  return self->_pencilInteractionFeedbackViewCenterYConstraint;
}

- (void)setPencilInteractionFeedbackViewCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewCenterYConstraint, a3);
}

- (BOOL)isPencilInteractionFeedbackViewVisible
{
  return self->_pencilInteractionFeedbackViewVisible;
}

- (void)setPencilInteractionFeedbackViewVisible:(BOOL)a3
{
  self->_pencilInteractionFeedbackViewVisible = a3;
}

- (UIViewFloatAnimatableProperty)feedbackViewVisibilityAnimatableProperty
{
  return self->_feedbackViewVisibilityAnimatableProperty;
}

- (void)setFeedbackViewVisibilityAnimatableProperty:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackViewVisibilityAnimatableProperty, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackViewVisibilityAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewAutodismissTimer, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
