@implementation SFSectionDisclosureButton

- (SFSectionDisclosureButton)initWithFrame:(CGRect)a3 expanded:(BOOL)a4 modally:(BOOL)a5
{
  SFSectionDisclosureButton *v7;
  SFSectionDisclosureButton *v8;
  uint64_t v9;
  UILabel *labelWhenExpanded;
  void *v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *labelWhenExpandedLeadingConstraint;
  uint64_t v15;
  UILabel *labelWhenCollapsed;
  void *v17;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *labelWhenCollapsedLeadingConstraint;
  uint64_t v21;
  UIImageView *imageView;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SFSectionDisclosureButton *v38;
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
  void *v74;
  objc_super v75;
  _QWORD v76[17];

  v76[15] = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)SFSectionDisclosureButton;
  v7 = -[SFSectionDisclosureButton initWithFrame:](&v75, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_expanded = a4;
    v7->_expandsModally = a5;
    makeLabel();
    v9 = objc_claimAutoreleasedReturnValue();
    labelWhenExpanded = v8->_labelWhenExpanded;
    v8->_labelWhenExpanded = (UILabel *)v9;

    -[UILabel leadingAnchor](v8->_labelWhenExpanded, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton leadingAnchor](v8, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    labelWhenExpandedLeadingConstraint = v8->_labelWhenExpandedLeadingConstraint;
    v8->_labelWhenExpandedLeadingConstraint = (NSLayoutConstraint *)v13;

    -[SFSectionDisclosureButton addSubview:](v8, "addSubview:", v8->_labelWhenExpanded);
    makeLabel();
    v15 = objc_claimAutoreleasedReturnValue();
    labelWhenCollapsed = v8->_labelWhenCollapsed;
    v8->_labelWhenCollapsed = (UILabel *)v15;

    -[UILabel leadingAnchor](v8->_labelWhenCollapsed, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton leadingAnchor](v8, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    labelWhenCollapsedLeadingConstraint = v8->_labelWhenCollapsedLeadingConstraint;
    v8->_labelWhenCollapsedLeadingConstraint = (NSLayoutConstraint *)v19;

    -[SFSectionDisclosureButton addSubview:](v8, "addSubview:", v8->_labelWhenCollapsed);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    imageView = v8->_imageView;
    v8->_imageView = (UIImageView *)v21;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A90], 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v8->_imageView, "setPreferredSymbolConfiguration:", v23);

    -[SFSectionDisclosureButton addSubview:](v8, "addSubview:", v8->_imageView);
    v57 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel centerYAnchor](v8->_labelWhenExpanded, "centerYAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton centerYAnchor](v8, "centerYAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v72;
    -[UILabel centerYAnchor](v8->_labelWhenCollapsed, "centerYAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton centerYAnchor](v8, "centerYAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v69;
    -[UIImageView centerYAnchor](v8->_imageView, "centerYAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton centerYAnchor](v8, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v76[2] = v66;
    -[UILabel heightAnchor](v8->_labelWhenExpanded, "heightAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton heightAnchor](v8, "heightAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintLessThanOrEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v76[3] = v63;
    -[UILabel heightAnchor](v8->_labelWhenCollapsed, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton heightAnchor](v8, "heightAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintLessThanOrEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v76[4] = v60;
    -[UIImageView heightAnchor](v8->_imageView, "heightAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton heightAnchor](v8, "heightAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:", v58);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v76[5] = v56;
    -[SFSectionDisclosureButton heightAnchor](v8, "heightAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToConstant:", 0.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 1132068864;
    objc_msgSend(v54, "sf_withPriority:", v24);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v76[6] = v53;
    -[UILabel leadingAnchor](v8->_labelWhenExpanded, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton leadingAnchor](v8, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 1131413504;
    objc_msgSend(v50, "sf_withPriority:", v25);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v76[7] = v49;
    v76[8] = v8->_labelWhenExpandedLeadingConstraint;
    -[UILabel leadingAnchor](v8->_labelWhenCollapsed, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton leadingAnchor](v8, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = 1131413504;
    objc_msgSend(v46, "sf_withPriority:", v26);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v76[9] = v45;
    v76[10] = v8->_labelWhenCollapsedLeadingConstraint;
    -[UIImageView leadingAnchor](v8->_imageView, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v8->_labelWhenExpanded, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v43, 0.75);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v76[11] = v42;
    -[UIImageView leadingAnchor](v8->_imageView, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v8->_labelWhenCollapsed, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v40, 0.75);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v76[12] = v27;
    -[UIImageView leadingAnchor](v8->_imageView, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton leadingAnchor](v8, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = 1132068864;
    objc_msgSend(v30, "sf_withPriority:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v76[13] = v32;
    -[UIImageView trailingAnchor](v8->_imageView, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSectionDisclosureButton trailingAnchor](v8, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v76[14] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 15);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v36);

    -[SFSectionDisclosureButton buttonShapesEnabledDidChange](v8, "buttonShapesEnabledDidChange");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v8, sel_buttonShapesEnabledDidChange, *MEMORY[0x1E0DC44E0], 0);

    -[SFSectionDisclosureButton updateExpanded](v8, "updateExpanded");
    -[SFSectionDisclosureButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", v8, sel_toggleExpanded, 0x2000);
    v38 = v8;
  }

  return v8;
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[SFSectionDisclosureButton updateExpanded](self, "updateExpanded");
  }
}

- (void)updateExpanded
{
  unint64_t v2;
  double v4;
  __int128 v5;
  CGFloat v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  LOBYTE(v2) = self->_expanded;
  -[UILabel setAlpha:](self->_labelWhenExpanded, "setAlpha:", (double)v2);
  v4 = 0.0;
  if (!self->_expanded)
    v4 = 1.0;
  -[UILabel setAlpha:](self->_labelWhenCollapsed, "setAlpha:", v4);
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v10.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v10.c = v5;
  *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (self->_expanded)
  {
    v6 = 1.57079633;
LABEL_7:
    CGAffineTransformMakeRotation(&v10, v6);
    goto LABEL_8;
  }
  if (!-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
  {
    v6 = 3.14159265;
    goto LABEL_7;
  }
LABEL_8:
  v9 = v10;
  -[SFSectionDisclosureButton chevron](self, "chevron");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v7, "setTransform:", &v8);

}

- (void)toggleExpanded
{
  _QWORD v2[5];

  if (!self->_expandsModally)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __43__SFSectionDisclosureButton_toggleExpanded__block_invoke;
    v2[3] = &unk_1E21E2050;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v2, 0);
  }
}

uint64_t __43__SFSectionDisclosureButton_toggleExpanded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setExpanded:", objc_msgSend(*(id *)(a1 + 32), "isExpanded") ^ 1);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC44E0], 0);

  v4.receiver = self;
  v4.super_class = (Class)SFSectionDisclosureButton;
  -[SFSectionDisclosureButton dealloc](&v4, sel_dealloc);
}

- (void)buttonShapesEnabledDidChange
{
  _BOOL4 v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = UIAccessibilityButtonShapesEnabled();
  if (v3)
    v4 = CFSTR("chevron.right.circle.fill");
  else
    v4 = CFSTR("chevron.right");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);

  if (v3)
  {
    v13 = *MEMORY[0x1E0DC1248];
    v14[0] = &unk_1E22455A8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v6);
  -[UILabel setAttributedText:](self->_labelWhenCollapsed, "setAttributedText:", v9);

  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v6);
  -[UILabel setAttributedText:](self->_labelWhenExpanded, "setAttributedText:", v12);

}

- (CGSize)sizeIncludingLabels
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  uint64_t v13;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGSize result;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  -[UIImageView frame](self->_imageView, "frame");
  x = v3;
  y = v4;
  width = v5;
  height = v6;
  if (self->_expanded)
  {
    memset(&v34, 0, sizeof(v34));
    MidX = CGRectGetMidX(*(CGRect *)&v3);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    MidY = CGRectGetMidY(v36);
    memset(&v33, 0, sizeof(v33));
    CGAffineTransformMakeTranslation(&v33, MidX, MidY);
    v31 = v33;
    CGAffineTransformRotate(&v32, &v31, 1.57079633);
    v33 = v32;
    CGAffineTransformTranslate(&v34, &v32, -MidX, -MidY);
    v33 = v34;
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v38 = CGRectApplyAffineTransform(v37, &v33);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
  }
  if (self->_expandsModally)
  {
    -[UILabel frame](self->_labelWhenCollapsed, "frame");
  }
  else
  {
    -[UILabel frame](self->_labelWhenExpanded, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[UILabel frame](self->_labelWhenCollapsed, "frame");
    v41.origin.x = v25;
    v41.origin.y = v26;
    v41.size.width = v27;
    v41.size.height = v28;
    v39.origin.x = v18;
    v39.origin.y = v20;
    v39.size.width = v22;
    v39.size.height = v24;
    *(CGRect *)&v13 = CGRectUnion(v39, v41);
  }
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v40 = CGRectUnion(*(CGRect *)&v13, v42);
  v29 = v40.size.width;
  v30 = v40.size.height;
  result.height = v30;
  result.width = v29;
  return result;
}

- (UIImageView)chevron
{
  return self->_imageView;
}

- (void)setLabelHidden:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  if (self->_labelHidden != a3)
  {
    v3 = a3;
    self->_labelHidden = a3;
    -[UILabel setHidden:](self->_labelWhenExpanded, "setHidden:");
    -[UILabel setHidden:](self->_labelWhenCollapsed, "setHidden:", v3);
    v5 = v3 ^ 1;
    -[NSLayoutConstraint setActive:](self->_labelWhenExpandedLeadingConstraint, "setActive:", v5);
    -[NSLayoutConstraint setActive:](self->_labelWhenCollapsedLeadingConstraint, "setActive:", v5);
  }
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isLabelHidden
{
  return self->_labelHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_labelWhenExpandedLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_labelWhenExpanded, 0);
  objc_storeStrong((id *)&self->_labelWhenCollapsedLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_labelWhenCollapsed, 0);
}

@end
