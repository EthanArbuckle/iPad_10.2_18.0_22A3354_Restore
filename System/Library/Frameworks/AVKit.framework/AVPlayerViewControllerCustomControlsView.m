@implementation AVPlayerViewControllerCustomControlsView

- (AVPlayerViewControllerCustomControlsView)initWithFrame:(CGRect)a3
{
  AVPlayerViewControllerCustomControlsView *v3;
  AVPlayerViewControllerCustomControlsView *v4;
  AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIView *transportControlsAreaLayoutGuideProvidingView;
  uint64_t v12;
  UILayoutGuide *transportControlsAreaLayoutGuide;
  AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *v14;
  UIView *displayModeControlsAreaLayoutGuideProvidingView;
  uint64_t v16;
  UILayoutGuide *displayModeControlsAreaLayoutGuide;
  AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *v18;
  UIView *volumeControlsAreaLayoutGuideProvidingView;
  uint64_t v20;
  UILayoutGuide *volumeControlsAreaLayoutGuide;
  AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *v22;
  UIView *unobscuredCenterAreaLayoutGuideProvidingView;
  uint64_t v24;
  UILayoutGuide *unobscuredCenterAreaLayoutGuide;
  AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *v26;
  UIView *animatedUnobscuredCenterAreaLayoutGuideProvidingView;
  uint64_t v28;
  UILayoutGuide *animatedUnobscuredCenterAreaLayoutGuide;
  AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *v30;
  UIView *unobscuredTopAreaLayoutGuideProvidingView;
  uint64_t v32;
  UILayoutGuide *unobscuredTopAreaLayoutGuide;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)AVPlayerViewControllerCustomControlsView;
  v3 = -[AVPlayerViewControllerCustomControlsView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_needsInitialConstraints = 1;
    v5 = [AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    transportControlsAreaLayoutGuideProvidingView = v4->_transportControlsAreaLayoutGuideProvidingView;
    v4->_transportControlsAreaLayoutGuideProvidingView = (UIView *)v10;

    -[UIView layoutMarginsGuide](v4->_transportControlsAreaLayoutGuideProvidingView, "layoutMarginsGuide");
    v12 = objc_claimAutoreleasedReturnValue();
    transportControlsAreaLayoutGuide = v4->_transportControlsAreaLayoutGuide;
    v4->_transportControlsAreaLayoutGuide = (UILayoutGuide *)v12;

    -[AVPlayerViewControllerCustomControlsView addSubview:](v4, "addSubview:", v4->_transportControlsAreaLayoutGuideProvidingView);
    v14 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:]([AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc], "initWithFrame:", v6, v7, v8, v9);
    displayModeControlsAreaLayoutGuideProvidingView = v4->_displayModeControlsAreaLayoutGuideProvidingView;
    v4->_displayModeControlsAreaLayoutGuideProvidingView = &v14->super;

    -[UIView layoutMarginsGuide](v4->_displayModeControlsAreaLayoutGuideProvidingView, "layoutMarginsGuide");
    v16 = objc_claimAutoreleasedReturnValue();
    displayModeControlsAreaLayoutGuide = v4->_displayModeControlsAreaLayoutGuide;
    v4->_displayModeControlsAreaLayoutGuide = (UILayoutGuide *)v16;

    -[AVPlayerViewControllerCustomControlsView addSubview:](v4, "addSubview:", v4->_displayModeControlsAreaLayoutGuideProvidingView);
    v18 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:]([AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc], "initWithFrame:", v6, v7, v8, v9);
    volumeControlsAreaLayoutGuideProvidingView = v4->_volumeControlsAreaLayoutGuideProvidingView;
    v4->_volumeControlsAreaLayoutGuideProvidingView = &v18->super;

    -[UIView layoutMarginsGuide](v4->_volumeControlsAreaLayoutGuideProvidingView, "layoutMarginsGuide");
    v20 = objc_claimAutoreleasedReturnValue();
    volumeControlsAreaLayoutGuide = v4->_volumeControlsAreaLayoutGuide;
    v4->_volumeControlsAreaLayoutGuide = (UILayoutGuide *)v20;

    -[AVPlayerViewControllerCustomControlsView addSubview:](v4, "addSubview:", v4->_volumeControlsAreaLayoutGuideProvidingView);
    v22 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:]([AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc], "initWithFrame:", v6, v7, v8, v9);
    unobscuredCenterAreaLayoutGuideProvidingView = v4->_unobscuredCenterAreaLayoutGuideProvidingView;
    v4->_unobscuredCenterAreaLayoutGuideProvidingView = &v22->super;

    -[UIView layoutMarginsGuide](v4->_unobscuredCenterAreaLayoutGuideProvidingView, "layoutMarginsGuide");
    v24 = objc_claimAutoreleasedReturnValue();
    unobscuredCenterAreaLayoutGuide = v4->_unobscuredCenterAreaLayoutGuide;
    v4->_unobscuredCenterAreaLayoutGuide = (UILayoutGuide *)v24;

    -[AVPlayerViewControllerCustomControlsView addSubview:](v4, "addSubview:", v4->_unobscuredCenterAreaLayoutGuideProvidingView);
    v26 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:]([AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc], "initWithFrame:", v6, v7, v8, v9);
    animatedUnobscuredCenterAreaLayoutGuideProvidingView = v4->_animatedUnobscuredCenterAreaLayoutGuideProvidingView;
    v4->_animatedUnobscuredCenterAreaLayoutGuideProvidingView = &v26->super;

    -[UIView layoutMarginsGuide](v4->_animatedUnobscuredCenterAreaLayoutGuideProvidingView, "layoutMarginsGuide");
    v28 = objc_claimAutoreleasedReturnValue();
    animatedUnobscuredCenterAreaLayoutGuide = v4->_animatedUnobscuredCenterAreaLayoutGuide;
    v4->_animatedUnobscuredCenterAreaLayoutGuide = (UILayoutGuide *)v28;

    -[AVPlayerViewControllerCustomControlsView addSubview:](v4, "addSubview:", v4->_animatedUnobscuredCenterAreaLayoutGuideProvidingView);
    v30 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:]([AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView alloc], "initWithFrame:", v6, v7, v8, v9);
    unobscuredTopAreaLayoutGuideProvidingView = v4->_unobscuredTopAreaLayoutGuideProvidingView;
    v4->_unobscuredTopAreaLayoutGuideProvidingView = &v30->super;

    -[UIView layoutMarginsGuide](v4->_unobscuredTopAreaLayoutGuideProvidingView, "layoutMarginsGuide");
    v32 = objc_claimAutoreleasedReturnValue();
    unobscuredTopAreaLayoutGuide = v4->_unobscuredTopAreaLayoutGuide;
    v4->_unobscuredTopAreaLayoutGuide = (UILayoutGuide *)v32;

    -[AVPlayerViewControllerCustomControlsView addSubview:](v4, "addSubview:", v4->_unobscuredTopAreaLayoutGuideProvidingView);
  }
  return v4;
}

- (void)setAreVolumeControlsVisible:(BOOL)a3
{
  if (self->_areVolumeControlsVisible != a3)
  {
    self->_areVolumeControlsVisible = a3;
    -[AVPlayerViewControllerCustomControlsView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setAreTransportControlsVisible:(BOOL)a3
{
  if (self->_areTransportControlsVisible != a3)
  {
    self->_areTransportControlsVisible = a3;
    -[AVPlayerViewControllerCustomControlsView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  AVPlayerViewControllerCustomControlsView *v5;
  AVPlayerViewControllerCustomControlsView *v6;
  AVPlayerViewControllerCustomControlsView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVPlayerViewControllerCustomControlsView;
  -[AVPlayerViewControllerCustomControlsView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (AVPlayerViewControllerCustomControlsView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
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
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
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
  NSLayoutConstraint *v70;
  NSLayoutConstraint *volumeControlsHiddenConstraint;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSLayoutConstraint *v76;
  NSLayoutConstraint *volumeControlsVisibleConstraint;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSLayoutConstraint *v82;
  NSLayoutConstraint *transportControlsHiddenConstraint;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSLayoutConstraint *v88;
  NSLayoutConstraint *transportControlsVisibleConstraint;
  objc_super v90;

  if (self->_needsInitialConstraints)
  {
    self->_needsInitialConstraints = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView unobscuredTopAreaLayoutGuideProvidingView](self, "unobscuredTopAreaLayoutGuideProvidingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView displayModeControlsAreaLayoutGuideProvidingView](self, "displayModeControlsAreaLayoutGuideProvidingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, 6.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

    -[AVPlayerViewControllerCustomControlsView unobscuredTopAreaLayoutGuideProvidingView](self, "unobscuredTopAreaLayoutGuideProvidingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView volumeControlsAreaLayoutGuideProvidingView](self, "volumeControlsAreaLayoutGuideProvidingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, -6.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

    -[AVPlayerViewControllerCustomControlsView unobscuredTopAreaLayoutGuideProvidingView](self, "unobscuredTopAreaLayoutGuideProvidingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView volumeControlsAreaLayoutGuideProvidingView](self, "volumeControlsAreaLayoutGuideProvidingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

    -[AVPlayerViewControllerCustomControlsView unobscuredTopAreaLayoutGuideProvidingView](self, "unobscuredTopAreaLayoutGuideProvidingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView volumeControlsAreaLayoutGuideProvidingView](self, "volumeControlsAreaLayoutGuideProvidingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

    -[AVPlayerViewControllerCustomControlsView unobscuredCenterAreaLayoutGuideProvidingView](self, "unobscuredCenterAreaLayoutGuideProvidingView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView displayModeControlsAreaLayoutGuideProvidingView](self, "displayModeControlsAreaLayoutGuideProvidingView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 1148846080;
    objc_msgSend(v25, "avkit_constraintGreaterThanOrEqualToAnchor:constant:priority:", v27, 0.0, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

    -[AVPlayerViewControllerCustomControlsView unobscuredCenterAreaLayoutGuideProvidingView](self, "unobscuredCenterAreaLayoutGuideProvidingView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView volumeControlsAreaLayoutGuideProvidingView](self, "volumeControlsAreaLayoutGuideProvidingView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = 1148846080;
    objc_msgSend(v31, "avkit_constraintLessThanOrEqualToAnchor:constant:priority:", v33, 0.0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v35);

    -[AVPlayerViewControllerCustomControlsView unobscuredCenterAreaLayoutGuideProvidingView](self, "unobscuredCenterAreaLayoutGuideProvidingView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:constant:", v39, 0.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v40);

    -[AVPlayerViewControllerCustomControlsView unobscuredCenterAreaLayoutGuideProvidingView](self, "unobscuredCenterAreaLayoutGuideProvidingView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:constant:", v44, 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v45);

    -[AVPlayerViewControllerCustomControlsView unobscuredCenterAreaLayoutGuideProvidingView](self, "unobscuredCenterAreaLayoutGuideProvidingView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView volumeControlsAreaLayoutGuideProvidingView](self, "volumeControlsAreaLayoutGuideProvidingView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, 6.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v50);

    -[AVPlayerViewControllerCustomControlsView unobscuredCenterAreaLayoutGuideProvidingView](self, "unobscuredCenterAreaLayoutGuideProvidingView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView transportControlsAreaLayoutGuideProvidingView](self, "transportControlsAreaLayoutGuideProvidingView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v54, -6.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v55);

    -[AVPlayerViewControllerCustomControlsView animatedUnobscuredCenterAreaLayoutGuideProvidingView](self, "animatedUnobscuredCenterAreaLayoutGuideProvidingView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView unobscuredCenterAreaLayoutGuideProvidingView](self, "unobscuredCenterAreaLayoutGuideProvidingView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", v59, 0.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v60);

    -[AVPlayerViewControllerCustomControlsView animatedUnobscuredCenterAreaLayoutGuideProvidingView](self, "animatedUnobscuredCenterAreaLayoutGuideProvidingView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView unobscuredCenterAreaLayoutGuideProvidingView](self, "unobscuredCenterAreaLayoutGuideProvidingView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v64, 0.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v65);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
    -[AVPlayerViewControllerCustomControlsView animatedUnobscuredCenterAreaLayoutGuideProvidingView](self, "animatedUnobscuredCenterAreaLayoutGuideProvidingView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView volumeControlsAreaLayoutGuideProvidingView](self, "volumeControlsAreaLayoutGuideProvidingView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69, 0.0);
    v70 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    volumeControlsHiddenConstraint = self->_volumeControlsHiddenConstraint;
    self->_volumeControlsHiddenConstraint = v70;

    -[AVPlayerViewControllerCustomControlsView animatedUnobscuredCenterAreaLayoutGuideProvidingView](self, "animatedUnobscuredCenterAreaLayoutGuideProvidingView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView volumeControlsAreaLayoutGuideProvidingView](self, "volumeControlsAreaLayoutGuideProvidingView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v75, 6.0);
    v76 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    volumeControlsVisibleConstraint = self->_volumeControlsVisibleConstraint;
    self->_volumeControlsVisibleConstraint = v76;

    -[AVPlayerViewControllerCustomControlsView animatedUnobscuredCenterAreaLayoutGuideProvidingView](self, "animatedUnobscuredCenterAreaLayoutGuideProvidingView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "bottomAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView transportControlsAreaLayoutGuideProvidingView](self, "transportControlsAreaLayoutGuideProvidingView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "bottomAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v81);
    v82 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    transportControlsHiddenConstraint = self->_transportControlsHiddenConstraint;
    self->_transportControlsHiddenConstraint = v82;

    -[AVPlayerViewControllerCustomControlsView animatedUnobscuredCenterAreaLayoutGuideProvidingView](self, "animatedUnobscuredCenterAreaLayoutGuideProvidingView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewControllerCustomControlsView transportControlsAreaLayoutGuideProvidingView](self, "transportControlsAreaLayoutGuideProvidingView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "topAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v87, -6.0);
    v88 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    transportControlsVisibleConstraint = self->_transportControlsVisibleConstraint;
    self->_transportControlsVisibleConstraint = v88;

  }
  -[NSLayoutConstraint setActive:](self->_volumeControlsHiddenConstraint, "setActive:", -[AVPlayerViewControllerCustomControlsView areVolumeControlsVisible](self, "areVolumeControlsVisible") ^ 1);
  -[NSLayoutConstraint setActive:](self->_volumeControlsVisibleConstraint, "setActive:", -[AVPlayerViewControllerCustomControlsView areVolumeControlsVisible](self, "areVolumeControlsVisible"));
  -[NSLayoutConstraint setActive:](self->_transportControlsHiddenConstraint, "setActive:", -[AVPlayerViewControllerCustomControlsView areTransportControlsVisible](self, "areTransportControlsVisible") ^ 1);
  -[NSLayoutConstraint setActive:](self->_transportControlsVisibleConstraint, "setActive:", -[AVPlayerViewControllerCustomControlsView areTransportControlsVisible](self, "areTransportControlsVisible"));
  v90.receiver = self;
  v90.super_class = (Class)AVPlayerViewControllerCustomControlsView;
  -[AVPlayerViewControllerCustomControlsView updateConstraints](&v90, sel_updateConstraints);
}

- (UILayoutGuide)transportControlsAreaLayoutGuide
{
  return self->_transportControlsAreaLayoutGuide;
}

- (UILayoutGuide)displayModeControlsAreaLayoutGuide
{
  return self->_displayModeControlsAreaLayoutGuide;
}

- (UILayoutGuide)volumeControlsAreaLayoutGuide
{
  return self->_volumeControlsAreaLayoutGuide;
}

- (UILayoutGuide)unobscuredCenterAreaLayoutGuide
{
  return self->_unobscuredCenterAreaLayoutGuide;
}

- (UILayoutGuide)animatedUnobscuredCenterAreaLayoutGuide
{
  return self->_animatedUnobscuredCenterAreaLayoutGuide;
}

- (UILayoutGuide)unobscuredTopAreaLayoutGuide
{
  return self->_unobscuredTopAreaLayoutGuide;
}

- (UIView)transportControlsAreaLayoutGuideProvidingView
{
  return self->_transportControlsAreaLayoutGuideProvidingView;
}

- (UIView)displayModeControlsAreaLayoutGuideProvidingView
{
  return self->_displayModeControlsAreaLayoutGuideProvidingView;
}

- (UIView)volumeControlsAreaLayoutGuideProvidingView
{
  return self->_volumeControlsAreaLayoutGuideProvidingView;
}

- (UIView)unobscuredTopAreaLayoutGuideProvidingView
{
  return self->_unobscuredTopAreaLayoutGuideProvidingView;
}

- (UIView)unobscuredCenterAreaLayoutGuideProvidingView
{
  return self->_unobscuredCenterAreaLayoutGuideProvidingView;
}

- (UIView)animatedUnobscuredCenterAreaLayoutGuideProvidingView
{
  return self->_animatedUnobscuredCenterAreaLayoutGuideProvidingView;
}

- (BOOL)areTransportControlsVisible
{
  return self->_areTransportControlsVisible;
}

- (BOOL)areVolumeControlsVisible
{
  return self->_areVolumeControlsVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedUnobscuredCenterAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_unobscuredCenterAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_unobscuredTopAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_volumeControlsAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_displayModeControlsAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_transportControlsAreaLayoutGuideProvidingView, 0);
  objc_storeStrong((id *)&self->_unobscuredTopAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_animatedUnobscuredCenterAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_unobscuredCenterAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_volumeControlsAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_displayModeControlsAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_transportControlsAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_volumeControlsHiddenConstraint, 0);
  objc_storeStrong((id *)&self->_volumeControlsVisibleConstraint, 0);
  objc_storeStrong((id *)&self->_transportControlsHiddenConstraint, 0);
  objc_storeStrong((id *)&self->_transportControlsVisibleConstraint, 0);
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end
