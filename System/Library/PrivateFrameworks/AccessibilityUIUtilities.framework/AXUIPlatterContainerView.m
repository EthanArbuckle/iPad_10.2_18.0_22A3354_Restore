@implementation AXUIPlatterContainerView

- (AXUIPlatterContainerView)initWithFrame:(CGRect)a3
{
  AXUIPlatterContainerView *v3;
  UIView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  AXUIPlatterContainerView *v15;
  AXUIPlatterContainerView *v16;
  UIView *v17;
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
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
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
  UIView *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  UIView *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
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
  void *v74;
  void *v75;
  UIView *platterView;
  UIView *v77;
  UIView *contentView;
  UIView *v79;
  UIBlurEffect *platterBlurEffect;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  AXUIPlatterContainerView *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  UIView *v102;
  AXUIPlatterContainerView *v103;
  objc_super v104;
  _QWORD v105[6];
  _QWORD v106[7];

  v106[5] = *MEMORY[0x1E0C80C00];
  v104.receiver = self;
  v104.super_class = (Class)AXUIPlatterContainerView;
  v3 = -[AXUIPlatterContainerView initWithFrame:](&v104, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3)
    return v3;
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1200);
  v100 = objc_claimAutoreleasedReturnValue();
  v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v100);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)MEMORY[0x1E0DC37F8];
  -[AXUIPlatterContainerView primaryTextStyle](v3, "primaryTextStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metricsForTextStyle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v99 = v7;
  objc_msgSend(v7, "scaledValueForValue:", 14.0);
  -[UIView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  -[UIView layer](v4, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowColor:", v9);

  -[UIView layer](v4, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShadowOffset:", 0.0, 5.0);

  -[UIView layer](v4, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1045220557;
  objc_msgSend(v12, "setShadowOpacity:", v13);

  -[UIView layer](v4, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShadowRadius:", 10.0);

  -[AXUIPlatterContainerView addSubview:](v3, "addSubview:", v4);
  if (-[AXUIPlatterContainerView shouldMimicNotificationBannerTopOffset](v3, "shouldMimicNotificationBannerTopOffset"))
  {
    -[AXUIPlatterContainerView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v15 = (AXUIPlatterContainerView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v3;
  }
  v16 = v15;
  v103 = v3;
  if (-[AXUIPlatterContainerView shouldMimicNotificationBannerTopOffset](v3, "shouldMimicNotificationBannerTopOffset"))
  {
    if (MEMORY[0x1C3B76E48]())
    {
      v17 = v4;
      objc_msgSend(getAXUIDisplayManagerClass(), "sharedDisplayManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activeWindows");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "allValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        objc_msgSend(getAXUIDisplayManagerClass(), "sharedDisplayManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "passiveWindows");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "allValues");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "allValues");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lastObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v23, "safeAreaInsets");
      if (v29 == 0.0)
        v30 = 10.0;
      else
        v30 = 0.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

        v30 = 0.0;
        goto LABEL_21;
      }
      v17 = v4;
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "window");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "safeAreaInsets");
      v30 = 10.0;
      if (v35 != 0.0)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "userInterfaceIdiom");

        if (v37 == 1)
          v30 = 10.0;
        else
          v30 = 0.0;
      }

    }
    v4 = v17;
LABEL_21:

    goto LABEL_22;
  }
  v30 = 68.0;
LABEL_22:
  v102 = v4;
  -[UIView leadingAnchor](v4, "leadingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIPlatterContainerView leadingAnchor](v16, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintGreaterThanOrEqualToAnchor:constant:", v94, 32.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v92;
  -[UIView trailingAnchor](v4, "trailingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIPlatterContainerView trailingAnchor](v16, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintLessThanOrEqualToAnchor:constant:", v88, -32.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v86;
  -[UIView topAnchor](v4, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIPlatterContainerView topAnchor](v16, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, v30);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v106[2] = v40;
  -[UIView bottomAnchor](v4, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIPlatterContainerView bottomAnchor](v16, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:constant:", v42, -v30);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v106[3] = v43;
  -[UIView centerXAnchor](v4, "centerXAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v16;
  -[AXUIPlatterContainerView centerXAnchor](v16, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v106[4] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = (void *)objc_msgSend(v47, "mutableCopy");

  v48 = v102;
  v3 = v103;
  -[AXUIPlatterContainerView platterWidth](v103, "platterWidth");
  if (v49 > 0.0)
  {
    v50 = v49;
    -[UIView widthAnchor](v102, "widthAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToConstant:", v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v53) = 1144766464;
    objc_msgSend(v52, "setPriority:", v53);
    objc_msgSend(v101, "addObject:", v52);

  }
  v54 = (UIView *)objc_opt_new();
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (-[AXUIPlatterContainerView allowsScrolling](v103, "allowsScrolling"))
  {
    v55 = (void *)objc_opt_new();
    objc_msgSend(v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v55, "addSubview:", v54);
    -[UIView contentView](v102, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v55);

    objc_msgSend(v55, "heightAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v54, "heightAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v60) = 1132003328;
    v61 = v59;
    v85 = v59;
    objc_msgSend(v59, "setPriority:", v60);
    -[UIView topAnchor](v54, "topAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "topAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v95);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = v93;
    -[UIView bottomAnchor](v54, "bottomAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bottomAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v89);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v105[1] = v87;
    -[UIView leadingAnchor](v54, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v105[2] = v82;
    -[UIView trailingAnchor](v54, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v105[3] = v64;
    -[UIView widthAnchor](v54, "widthAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "widthAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v105[4] = v67;
    v105[5] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 6);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v101;
    objc_msgSend(v101, "addObjectsFromArray:", v68);

    v48 = v102;
    v3 = v103;

    v70 = (void *)MEMORY[0x1E0CB3718];
    -[UIView contentView](v102, "contentView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "ax_constraintsToMakeView:sameDimensionsAsView:", v55, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObjectsFromArray:", v72);

    v73 = v85;
  }
  else
  {
    -[UIView contentView](v102, "contentView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addSubview:", v54);

    v75 = (void *)MEMORY[0x1E0CB3718];
    -[UIView contentView](v102, "contentView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "ax_constraintsToMakeView:sameDimensionsAsView:", v54, v55);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v101;
    objc_msgSend(v101, "addObjectsFromArray:", v73);
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v69);
  platterView = v3->_platterView;
  v3->_platterView = v48;
  v77 = v48;

  contentView = v3->_contentView;
  v3->_contentView = v54;
  v79 = v54;

  platterBlurEffect = v3->_platterBlurEffect;
  v3->_platterBlurEffect = (UIBlurEffect *)v100;

  return v3;
}

- (NSString)primaryTextStyle
{
  return (NSString *)(id)*MEMORY[0x1E0DC4AD0];
}

- (double)platterWidth
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)MEMORY[0x1E0DC37F8];
  -[AXUIPlatterContainerView primaryTextStyle](self, "primaryTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricsForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scaledValueForValue:", 316.0);
  v6 = v5;

  return v6;
}

- (BOOL)shouldMimicNotificationBannerTopOffset
{
  return 0;
}

- (BOOL)allowsScrolling
{
  return 0;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIBlurEffect)platterBlurEffect
{
  return self->_platterBlurEffect;
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_platterBlurEffect, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
