@implementation CNUINavigationListViewCell

- (double)minimumContentHeight
{
  double v3;
  double v4;
  double v5;

  -[CNUINavigationListViewCell titleLabelFirstBaselineAnchorConstraintConstant](self, "titleLabelFirstBaselineAnchorConstraintConstant");
  v4 = v3;
  -[CNUINavigationListViewCell contentViewBottomAnchorConstraintConstant](self, "contentViewBottomAnchorConstraintConstant");
  return ceil(v4 + v5);
}

- (double)contentViewBottomAnchorConstraintConstant
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_opt_class();
  -[CNUINavigationListViewCell navigationListStyle](self, "navigationListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentViewBottomAnchorConstraintConstantForNavigationListStyle:", v4);
  v6 = v5;

  return v6;
}

- (double)subtitleLabelFirstBaselineAnchorConstraintConstant
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_opt_class();
  -[CNUINavigationListViewCell subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUINavigationListViewCell navigationListStyle](self, "navigationListStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitleLabelFirstBaselineAnchorConstraintConstantForSubtitle:navigationListStyle:", v5, v6);
  v8 = v7;

  return v8;
}

- (double)titleLabelFirstBaselineAnchorConstraintConstant
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_opt_class();
  -[CNUINavigationListViewCell navigationListStyle](self, "navigationListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:", v4);
  v6 = v5;

  return v6;
}

- (CNUINavigationListViewCell)initWithCoder:(id)a3
{
  -[CNUINavigationListViewCell doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CNUINavigationListViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNUINavigationListViewCell *v4;
  CNUINavigationListViewCell *v5;
  CNUINavigationListViewCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNUINavigationListViewCell;
  v4 = -[CNUINavigationListViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_contentViewConstraintsLoaded = 0;
    v4->_showSeparator = 1;
    -[CNUINavigationListViewCell loadContentView](v4, "loadContentView");
    -[CNUINavigationListViewCell loadContentViewConstraints](v5, "loadContentViewConstraints");
    -[UILabel addObserver:forKeyPath:options:context:](v5->_subtitleLabel, "addObserver:forKeyPath:options:context:", v5, CFSTR("text"), 0, 0);
    -[UILabel addObserver:forKeyPath:options:context:](v5->_subtitleLabel, "addObserver:forKeyPath:options:context:", v5, CFSTR("attributedText"), 0, 0);
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UILabel removeObserver:forKeyPath:](self->_subtitleLabel, "removeObserver:forKeyPath:", self, CFSTR("text"));
  -[UILabel removeObserver:forKeyPath:](self->_subtitleLabel, "removeObserver:forKeyPath:", self, CFSTR("attributedText"));
  v3.receiver = self;
  v3.super_class = (Class)CNUINavigationListViewCell;
  -[CNUINavigationListViewCell dealloc](&v3, sel_dealloc);
}

- (void)setNavigationListStyle:(id)a3
{
  objc_storeStrong((id *)&self->_navigationListStyle, a3);
  -[CNUINavigationListViewCell styleUpdated](self, "styleUpdated");
}

- (void)styleUpdated
{
  CNUINavigationListStyleApplier *v3;
  void *v4;
  CNUINavigationListStyleApplier *v5;

  v3 = [CNUINavigationListStyleApplier alloc];
  -[CNUINavigationListViewCell navigationListStyle](self, "navigationListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNUINavigationListStyleApplier initWithNavigationListStyle:](v3, "initWithNavigationListStyle:", v4);
  -[CNUINavigationListViewCell setStyleApplier:](self, "setStyleApplier:", v5);

  -[CNUINavigationListViewCell applyStyle](self, "applyStyle");
}

- (void)applyStyle
{
  id v3;

  -[CNUINavigationListViewCell styleApplier](self, "styleApplier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyNavigationListStyleToCell:", self);

}

- (void)loadContentView
{
  void *v3;
  void *v4;
  void *v5;
  UILayoutGuide *v6;
  UILayoutGuide *titleImageViewLayoutGuide;
  UIImageView *v8;
  UIImageView *titleImageView;
  void *v10;
  UILabel *v11;
  UILabel *titleLabel;
  UILabel *v13;
  UILabel *subtitleLabel;
  id v15;

  -[CNUINavigationListViewCell contentView](self, "contentView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v4);
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v15, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v15, "addSubview:", v5);
  v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  titleImageViewLayoutGuide = self->_titleImageViewLayoutGuide;
  self->_titleImageViewLayoutGuide = v6;

  objc_msgSend(v15, "addLayoutGuide:", self->_titleImageViewLayoutGuide);
  v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  titleImageView = self->_titleImageView;
  self->_titleImageView = v8;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_titleImageView);

  v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v15, "addSubview:", self->_titleLabel);
  v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v13;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v15, "addSubview:", self->_subtitleLabel);
  -[CNUINavigationListViewCell applyStyle](self, "applyStyle");
  -[CNUINavigationListViewCell setupAccessoryImageViewInView:](self, "setupAccessoryImageViewInView:", v15);

}

- (void)setupAccessoryImageViewInView:(id)a3
{
  objc_class *v4;
  UILayoutGuide *v5;
  UILayoutGuide *accessoryImageViewLayoutGuide;
  UIImageView *v7;
  UIImageView *accessoryImageView;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0DC39A0];
  v12 = a3;
  v5 = (UILayoutGuide *)objc_alloc_init(v4);
  accessoryImageViewLayoutGuide = self->_accessoryImageViewLayoutGuide;
  self->_accessoryImageViewLayoutGuide = v5;

  objc_msgSend(v12, "addLayoutGuide:", self->_accessoryImageViewLayoutGuide);
  v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  accessoryImageView = self->_accessoryImageView;
  self->_accessoryImageView = v7;

  objc_msgSend((id)objc_opt_class(), "disclosureImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_accessoryImageView, "setImage:", v9);

  -[UIImageView setHidden:](self->_accessoryImageView, "setHidden:", 1);
  objc_msgSend((id)objc_opt_class(), "highlightedDisclosureImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setHighlightedImage:](self->_accessoryImageView, "setHighlightedImage:", v10);

  objc_msgSend((id)objc_opt_class(), "accessoryImageViewAccessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setAccessibilityLabel:](self->_accessoryImageView, "setAccessibilityLabel:", v11);

  -[UIImageView setIsAccessibilityElement:](self->_accessoryImageView, "setIsAccessibilityElement:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v12, "addSubview:", self->_accessoryImageView);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNUINavigationListViewCell;
  -[CNUINavigationListViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CNUINavigationListViewCell setAccessoryControlExpanded:](self, "setAccessoryControlExpanded:", 0);
  -[CNUINavigationListViewCell setHighlighted:](self, "setHighlighted:", 0);
  -[CNUINavigationListViewCell updateVisualStateAnimated:](self, "updateVisualStateAnimated:", 0);
}

- (void)setAccessoryControlExpanded:(BOOL)a3
{
  void *v5;
  char v6;

  if (self->_accessoryControlExpanded != a3)
  {
    -[CNUINavigationListViewCell accessoryImageView](self, "accessoryImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHidden");

    if ((v6 & 1) == 0)
      self->_accessoryControlExpanded = a3;
  }
}

- (void)setAccessoryControlExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL4 v7;

  v4 = a4;
  v5 = a3;
  v7 = -[CNUINavigationListViewCell isAccessoryControlExpanded](self, "isAccessoryControlExpanded");
  -[CNUINavigationListViewCell setAccessoryControlExpanded:](self, "setAccessoryControlExpanded:", v5);
  if (v7 != -[CNUINavigationListViewCell isAccessoryControlExpanded](self, "isAccessoryControlExpanded"))
    -[CNUINavigationListViewCell updateVisualStateAnimated:](self, "updateVisualStateAnimated:", v4);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNUINavigationListViewCell;
  if (-[CNUINavigationListViewCell isHighlighted](&v8, sel_isHighlighted) != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)CNUINavigationListViewCell;
    -[CNUINavigationListViewCell setHighlighted:animated:](&v7, sel_setHighlighted_animated_, v5, v4);
    -[CNUINavigationListViewCell updateVisualStateAnimated:](self, "updateVisualStateAnimated:", v4);
  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNUINavigationListViewCell;
  -[CNUINavigationListViewCell setSeparatorStyle:](&v3, sel_setSeparatorStyle_, -[CNUINavigationListViewCell showSeparator](self, "showSeparator", a3));
}

- (void)setSubtitleLabelFirstBaselineAnchorConstraint:(id)a3
{
  NSLayoutConstraint *v5;
  NSLayoutConstraint **p_subtitleLabelFirstBaselineAnchorConstraint;
  NSLayoutConstraint *v7;

  v5 = (NSLayoutConstraint *)a3;
  p_subtitleLabelFirstBaselineAnchorConstraint = &self->_subtitleLabelFirstBaselineAnchorConstraint;
  if (*p_subtitleLabelFirstBaselineAnchorConstraint != v5)
  {
    v7 = v5;
    -[NSLayoutConstraint setActive:](*p_subtitleLabelFirstBaselineAnchorConstraint, "setActive:", 0);
    objc_storeStrong((id *)p_subtitleLabelFirstBaselineAnchorConstraint, a3);
    v5 = v7;
  }

}

- (void)setSubtitleLabelLeadingAnchorConstraint:(id)a3
{
  NSLayoutConstraint *v5;
  NSLayoutConstraint **p_subtitleLabelLeadingAnchorConstraint;
  NSLayoutConstraint *v7;

  v5 = (NSLayoutConstraint *)a3;
  p_subtitleLabelLeadingAnchorConstraint = &self->_subtitleLabelLeadingAnchorConstraint;
  if (*p_subtitleLabelLeadingAnchorConstraint != v5)
  {
    v7 = v5;
    -[NSLayoutConstraint setActive:](*p_subtitleLabelLeadingAnchorConstraint, "setActive:", 0);
    objc_storeStrong((id *)p_subtitleLabelLeadingAnchorConstraint, a3);
    v5 = v7;
  }

}

- (void)setSubtitleLabelTrailingAnchorConstraint:(id)a3
{
  NSLayoutConstraint *v5;
  NSLayoutConstraint **p_subtitleLabelTrailingAnchorConstraint;
  NSLayoutConstraint *v7;

  v5 = (NSLayoutConstraint *)a3;
  p_subtitleLabelTrailingAnchorConstraint = &self->_subtitleLabelTrailingAnchorConstraint;
  if (*p_subtitleLabelTrailingAnchorConstraint != v5)
  {
    v7 = v5;
    -[NSLayoutConstraint setActive:](*p_subtitleLabelTrailingAnchorConstraint, "setActive:", 0);
    objc_storeStrong((id *)p_subtitleLabelTrailingAnchorConstraint, a3);
    v5 = v7;
  }

}

- (void)setTitleLabelFirstBaselineAnchorConstraint:(id)a3
{
  NSLayoutConstraint *v5;
  NSLayoutConstraint **p_titleLabelFirstBaselineAnchorConstraint;
  NSLayoutConstraint *v7;

  v5 = (NSLayoutConstraint *)a3;
  p_titleLabelFirstBaselineAnchorConstraint = &self->_titleLabelFirstBaselineAnchorConstraint;
  if (*p_titleLabelFirstBaselineAnchorConstraint != v5)
  {
    v7 = v5;
    -[NSLayoutConstraint setActive:](*p_titleLabelFirstBaselineAnchorConstraint, "setActive:", 0);
    objc_storeStrong((id *)p_titleLabelFirstBaselineAnchorConstraint, a3);
    v5 = v7;
  }

}

- (void)setTitleLabelLeadingAnchorConstraint:(id)a3
{
  NSLayoutConstraint *v5;
  NSLayoutConstraint **p_titleLabelLeadingAnchorConstraint;
  NSLayoutConstraint *v7;

  v5 = (NSLayoutConstraint *)a3;
  p_titleLabelLeadingAnchorConstraint = &self->_titleLabelLeadingAnchorConstraint;
  if (*p_titleLabelLeadingAnchorConstraint != v5)
  {
    v7 = v5;
    -[NSLayoutConstraint setActive:](*p_titleLabelLeadingAnchorConstraint, "setActive:", 0);
    objc_storeStrong((id *)p_titleLabelLeadingAnchorConstraint, a3);
    v5 = v7;
  }

}

- (void)setTitleLabelTrailingAnchorConstraint:(id)a3
{
  NSLayoutConstraint *v5;
  NSLayoutConstraint **p_titleLabelTrailingAnchorConstraint;
  NSLayoutConstraint *v7;

  v5 = (NSLayoutConstraint *)a3;
  p_titleLabelTrailingAnchorConstraint = &self->_titleLabelTrailingAnchorConstraint;
  if (*p_titleLabelTrailingAnchorConstraint != v5)
  {
    v7 = v5;
    -[NSLayoutConstraint setActive:](*p_titleLabelTrailingAnchorConstraint, "setActive:", 0);
    objc_storeStrong((id *)p_titleLabelTrailingAnchorConstraint, a3);
    v5 = v7;
  }

}

- (void)loadContentViewConstraints
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
  NSLayoutConstraint *v16;
  NSLayoutConstraint *titleLabelLeadingAnchorConstraint;
  void *v18;
  void *v19;
  void *v20;
  void **p_titleLabelTrailingAnchorConstraint;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *titleLabelFirstBaselineAnchorConstraint;
  NSLayoutConstraint *titleLabelTrailingAnchorConstraint;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint **p_subtitleLabelLeadingAnchorConstraint;
  void *v31;
  void *v32;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *subtitleLabelFirstBaselineAnchorConstraint;
  NSLayoutConstraint *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *subtitleLabelTrailingAnchorConstraint;
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
  NSLayoutConstraint *v52;
  NSLayoutConstraint *contentViewBottomAnchorConstraint;
  double v54;
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
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _QWORD v85[9];
  _QWORD v86[2];
  _QWORD v87[3];
  _QWORD v88[8];

  v88[6] = *MEMORY[0x1E0C80C00];
  if (!self->_contentViewConstraintsLoaded)
  {
    -[CNUINavigationListViewCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    -[UILayoutGuide leadingAnchor](self->_titleImageViewLayoutGuide, "leadingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v80);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v78;
    -[UILayoutGuide trailingAnchor](self->_titleImageViewLayoutGuide, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v72);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v70;
    -[UILayoutGuide topAnchor](self->_titleImageViewLayoutGuide, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v3;
    objc_msgSend(v3, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v66);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v88[2] = v64;
    -[UILayoutGuide bottomAnchor](self->_titleImageViewLayoutGuide, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v60);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v88[3] = v58;
    -[UIImageView imageContentGuide](self->_titleImageView, "imageContentGuide");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerXAnchor](self->_titleImageViewLayoutGuide, "centerXAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v88[4] = v7;
    -[UIImageView firstBaselineAnchor](self->_titleImageView, "firstBaselineAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v88[5] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "addObjectsFromArray:", v11);

    v12 = v83;
    -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell navigationListStyle](self, "navigationListStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cellUserActionLeftMargin");
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14);
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleLabelLeadingAnchorConstraint = self->_titleLabelLeadingAnchorConstraint;
    self->_titleLabelLeadingAnchorConstraint = v16;

    if (v76)
    {
      -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "trailingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:constant:", v19, 5.0);
    }
    else
    {
      -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 8.0);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    p_titleLabelTrailingAnchorConstraint = (void **)&self->_titleLabelTrailingAnchorConstraint;
    objc_storeStrong((id *)&self->_titleLabelTrailingAnchorConstraint, v20);

    -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell titleLabelFirstBaselineAnchorConstraintConstant](self, "titleLabelFirstBaselineAnchorConstraintConstant");
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23);
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleLabelFirstBaselineAnchorConstraint = self->_titleLabelFirstBaselineAnchorConstraint;
    self->_titleLabelFirstBaselineAnchorConstraint = v24;

    titleLabelTrailingAnchorConstraint = self->_titleLabelTrailingAnchorConstraint;
    v87[0] = self->_titleLabelLeadingAnchorConstraint;
    v87[1] = titleLabelTrailingAnchorConstraint;
    v87[2] = self->_titleLabelFirstBaselineAnchorConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v84;
    objc_msgSend(v84, "addObjectsFromArray:", v27);

    if (v76)
    {
      -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
      p_titleLabelTrailingAnchorConstraint = (void **)objc_claimAutoreleasedReturnValue();
      -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_titleLabelTrailingAnchorConstraint, "constraintEqualToAnchor:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = *p_titleLabelTrailingAnchorConstraint;
    }
    p_subtitleLabelLeadingAnchorConstraint = &self->_subtitleLabelLeadingAnchorConstraint;
    objc_storeStrong((id *)&self->_subtitleLabelLeadingAnchorConstraint, v29);
    if (v76)
    {

    }
    -[UILabel firstBaselineAnchor](self->_subtitleLabel, "firstBaselineAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell subtitleLabelFirstBaselineAnchorConstraintConstant](self, "subtitleLabelFirstBaselineAnchorConstraintConstant");
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32);
    v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    subtitleLabelFirstBaselineAnchorConstraint = self->_subtitleLabelFirstBaselineAnchorConstraint;
    self->_subtitleLabelFirstBaselineAnchorConstraint = v33;

    v35 = self->_subtitleLabelFirstBaselineAnchorConstraint;
    v86[0] = *p_subtitleLabelLeadingAnchorConstraint;
    v86[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "addObjectsFromArray:", v36);

    if (self->_accessoryImageView)
    {
      -[UILayoutGuide leadingAnchor](self->_accessoryImageViewLayoutGuide, "leadingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v76)
        -[CNUINavigationListViewCell titleLabel](self, "titleLabel");
      else
        -[CNUINavigationListViewCell subtitleLabel](self, "subtitleLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "trailingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:constant:", v39, 0.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_subtitleLabelTrailingAnchorConstraint, v40);

      subtitleLabelTrailingAnchorConstraint = self->_subtitleLabelTrailingAnchorConstraint;
      v85[0] = *p_subtitleLabelLeadingAnchorConstraint;
      v85[1] = subtitleLabelTrailingAnchorConstraint;
      -[UILayoutGuide trailingAnchor](self->_accessoryImageViewLayoutGuide, "trailingAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "trailingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "constraintEqualToAnchor:constant:", v79, -22.0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v85[2] = v77;
      -[UILayoutGuide topAnchor](self->_accessoryImageViewLayoutGuide, "topAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "topAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "constraintEqualToAnchor:", v73);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v85[3] = v71;
      -[UILayoutGuide bottomAnchor](self->_accessoryImageViewLayoutGuide, "bottomAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "bottomAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:", v67);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v85[4] = v65;
      -[UIImageView centerXAnchor](self->_accessoryImageView, "centerXAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide centerXAnchor](self->_accessoryImageViewLayoutGuide, "centerXAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "constraintEqualToAnchor:", v61);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v85[5] = v59;
      -[UIImageView widthAnchor](self->_accessoryImageView, "widthAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide widthAnchor](self->_accessoryImageViewLayoutGuide, "widthAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintLessThanOrEqualToAnchor:", v56);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v85[6] = v55;
      -[UIImageView firstBaselineAnchor](self->_accessoryImageView, "firstBaselineAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUINavigationListViewCell titleLabel](self, "titleLabel");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "firstBaselineAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v85[7] = v45;
      -[UIImageView heightAnchor](self->_accessoryImageView, "heightAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide heightAnchor](self->_accessoryImageViewLayoutGuide, "heightAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintLessThanOrEqualToAnchor:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v85[8] = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 9);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v84;
      objc_msgSend(v84, "addObjectsFromArray:", v49);

      v12 = v83;
    }
    objc_msgSend(v12, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](self->_subtitleLabel, "firstBaselineAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell contentViewBottomAnchorConstraintConstant](self, "contentViewBottomAnchorConstraintConstant");
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51);
    v52 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    contentViewBottomAnchorConstraint = self->_contentViewBottomAnchorConstraint;
    self->_contentViewBottomAnchorConstraint = v52;

    LODWORD(v54) = 1148829696;
    -[NSLayoutConstraint setPriority:](self->_contentViewBottomAnchorConstraint, "setPriority:", v54);
    objc_msgSend(v28, "addObject:", self->_contentViewBottomAnchorConstraint);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v28);
    self->_contentViewConstraintsLoaded = 1;

  }
}

- (void)updateConstraints
{
  objc_super v3;

  if (!-[CNUINavigationListViewCell isContentViewConstraintsLoaded](self, "isContentViewConstraintsLoaded"))
    -[CNUINavigationListViewCell loadContentViewConstraints](self, "loadContentViewConstraints");
  v3.receiver = self;
  v3.super_class = (Class)CNUINavigationListViewCell;
  -[CNUINavigationListViewCell updateConstraints](&v3, sel_updateConstraints);
  -[CNUINavigationListViewCell updateConstraintsConstants](self, "updateConstraintsConstants");
}

- (void)updateConstraintsConstants
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  -[CNUINavigationListViewCell contentViewBottomAnchorConstraintConstant](self, "contentViewBottomAnchorConstraintConstant");
  v4 = v3;
  -[CNUINavigationListViewCell contentViewBottomAnchorConstraint](self, "contentViewBottomAnchorConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[CNUINavigationListViewCell subtitleLabelFirstBaselineAnchorConstraintConstant](self, "subtitleLabelFirstBaselineAnchorConstraintConstant");
  v7 = v6;
  -[CNUINavigationListViewCell subtitleLabelFirstBaselineAnchorConstraint](self, "subtitleLabelFirstBaselineAnchorConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

  -[CNUINavigationListViewCell titleLabelFirstBaselineAnchorConstraintConstant](self, "titleLabelFirstBaselineAnchorConstraintConstant");
  v10 = v9;
  -[CNUINavigationListViewCell titleLabelFirstBaselineAnchorConstraint](self, "titleLabelFirstBaselineAnchorConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v10);

  -[CNUINavigationListViewCell navigationListStyle](self, "navigationListStyle");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cellUserActionLeftMargin");
  v13 = v12;
  -[CNUINavigationListViewCell titleLabelLeadingAnchorConstraint](self, "titleLabelLeadingAnchorConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v13);

}

- (void)updateVisualStateAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.2;
  if (!a3)
    v3 = 0.0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__CNUINavigationListViewCell_updateVisualStateAnimated___block_invoke;
  v4[3] = &unk_1E204F648;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, v3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[CNUINavigationListViewCell subtitleLabel](self, "subtitleLabel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v11)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("text")) & 1) != 0)
    {

    }
    else
    {
      v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("attributedText"));

      if ((v14 & 1) == 0)
        goto LABEL_3;
    }
    -[CNUINavigationListViewCell updateConstraintsConstants](self, "updateConstraintsConstants");
    goto LABEL_8;
  }

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)CNUINavigationListViewCell;
  -[CNUINavigationListViewCell observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_8:

}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIImageView)titleImageView
{
  return self->_titleImageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (CNUINavigationListStyle)navigationListStyle
{
  return self->_navigationListStyle;
}

- (CNUINavigationListStyleApplier)styleApplier
{
  return self->_styleApplier;
}

- (void)setStyleApplier:(id)a3
{
  objc_storeStrong((id *)&self->_styleApplier, a3);
}

- (BOOL)isAccessoryControlExpanded
{
  return self->_accessoryControlExpanded;
}

- (BOOL)isContentViewConstraintsLoaded
{
  return self->_contentViewConstraintsLoaded;
}

- (void)setContentViewConstraintsLoaded:(BOOL)a3
{
  self->_contentViewConstraintsLoaded = a3;
}

- (NSLayoutConstraint)contentViewBottomAnchorConstraint
{
  return self->_contentViewBottomAnchorConstraint;
}

- (void)setContentViewBottomAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewBottomAnchorConstraint, a3);
}

- (NSLayoutConstraint)subtitleLabelFirstBaselineAnchorConstraint
{
  return self->_subtitleLabelFirstBaselineAnchorConstraint;
}

- (NSLayoutConstraint)subtitleLabelLeadingAnchorConstraint
{
  return self->_subtitleLabelLeadingAnchorConstraint;
}

- (NSLayoutConstraint)subtitleLabelTrailingAnchorConstraint
{
  return self->_subtitleLabelTrailingAnchorConstraint;
}

- (NSLayoutConstraint)titleLabelFirstBaselineAnchorConstraint
{
  return self->_titleLabelFirstBaselineAnchorConstraint;
}

- (NSLayoutConstraint)titleLabelLeadingAnchorConstraint
{
  return self->_titleLabelLeadingAnchorConstraint;
}

- (NSLayoutConstraint)titleLabelTrailingAnchorConstraint
{
  return self->_titleLabelTrailingAnchorConstraint;
}

- (UILayoutGuide)accessoryImageViewLayoutGuide
{
  return self->_accessoryImageViewLayoutGuide;
}

- (UILayoutGuide)titleImageViewLayoutGuide
{
  return self->_titleImageViewLayoutGuide;
}

- (BOOL)showSeparator
{
  return self->_showSeparator;
}

- (void)setShowSeparator:(BOOL)a3
{
  self->_showSeparator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleImageViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_accessoryImageViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabelTrailingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabelLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabelFirstBaselineAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_styleApplier, 0);
  objc_storeStrong((id *)&self->_navigationListStyle, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
}

void __56__CNUINavigationListViewCell_updateVisualStateAnimated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  void *v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isAccessoryControlExpanded");
  objc_msgSend(*(id *)(a1 + 32), "styleApplier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "applyExpandedBackgroundNavigationListStyleToCell:", v5);
  else
    objc_msgSend(v3, "applyCollapsedBackgroundNavigationListStyleToCell:", v5);

  v6 = objc_msgSend(*(id *)(a1 + 32), "isHighlighted");
  objc_msgSend(*(id *)(a1 + 32), "navigationListStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "actionIconFillHighlightedColor");
  else
    objc_msgSend(v7, "actionIconFillColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v9);

  v11 = objc_msgSend(*(id *)(a1 + 32), "isAccessoryControlExpanded");
  v12 = (void *)objc_opt_class();
  if (v11)
    objc_msgSend(v12, "expandedAccessoryImageViewAccessibilityLabel");
  else
    objc_msgSend(v12, "accessoryImageViewAccessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityLabel:", v13);

  if (objc_msgSend(*(id *)(a1 + 32), "isAccessoryControlExpanded"))
  {
    CGAffineTransformMakeRotation(&v18, 3.14159265);
  }
  else
  {
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v18.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v18.c = v15;
    *(_OWORD *)&v18.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  objc_msgSend(*(id *)(a1 + 32), "accessoryImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v18;
  objc_msgSend(v16, "setTransform:", &v17);

}

+ (double)titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  objc_msgSend(v3, "cellTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellTitleLabelFirstBaselineAnchorConstraintConstant");
  v6 = v5;

  objc_msgSend(v4, "_scaledValueForValue:", v6);
  v8 = ceil(v7);

  return v8;
}

+ (double)contentViewBottomAnchorConstraintConstantForNavigationListStyle:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  objc_msgSend(v3, "cellSubtitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellContentViewBottomAnchorConstraintConstant");
  v6 = v5;

  objc_msgSend(v4, "_scaledValueForValue:", v6);
  v8 = ceil(v7);

  return v8;
}

+ (double)subtitleLabelFirstBaselineAnchorConstraintConstantForSubtitle:(id)a3 navigationListStyle:(id)a4
{
  id v5;
  id v6;
  double v7;
  void *v8;
  double v9;

  v5 = a3;
  v6 = a4;
  v7 = 0.0;
  if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory")
    && ((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    objc_msgSend(v6, "cellSubtitleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellSubtitleLabelFirstBaselineAnchorConstraintConstant");
    objc_msgSend(v8, "_scaledValueForValue:");
    v7 = ceil(v9);

  }
  return v7;
}

+ (CGSize)desiredContentSizeForTitle:(id)a3 subTitle:(id)a4 navigationListStyle:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];
  CGSize result;

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "cellUserActionLeftMargin");
  v12 = v11 + 22.0 + 8.0 + 5.0;
  objc_msgSend(v10, "cellTitleFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cellSubtitleFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:", v10);
  v16 = v15;
  objc_msgSend(a1, "contentViewBottomAnchorConstraintConstantForNavigationListStyle:", v10);
  v18 = v17;
  objc_msgSend(a1, "subtitleLabelFirstBaselineAnchorConstraintConstantForSubtitle:navigationListStyle:", v9, v10);
  v20 = v19;

  v21 = *MEMORY[0x1E0D13848];
  if (((*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v8) & 1) == 0)
  {
    if (v13)
    {
      v33 = *MEMORY[0x1E0DC1138];
      v34[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v8, "sizeWithAttributes:", v22);
    v12 = v12 + ceil(v23);

  }
  if (((*(uint64_t (**)(uint64_t, id))(v21 + 16))(v21, v9) & 1) == 0)
  {
    if (v14)
    {
      v31 = *MEMORY[0x1E0DC1138];
      v32 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v9, "sizeWithAttributes:", v24);
    v12 = v12 + ceil(v25);

  }
  objc_msgSend(a1, "disclosureImage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "size");
  v28 = v27;

  v29 = ceil(v16 + v18 + v20);
  v30 = v12 + v28;
  result.height = v29;
  result.width = v30;
  return result;
}

+ (id)reuseIdentifier
{
  return CFSTR("CNUINavigationListViewCellReuseIdentifier");
}

+ (id)disclosureImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "cnui_symbolImageForNavigationListChevron");
}

+ (id)highlightedDisclosureImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  +[CNUIColorRepository navigationListDisclosureImageHighlightedColor](CNUIColorRepository, "navigationListDisclosureImageHighlightedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", CFSTR("chevron.down"), 1, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)accessoryImageViewAccessibilityLabel
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EXPAND_DISAMBIGUATION_CATEGORY"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)expandedAccessoryImageViewAccessibilityLabel
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CLOSE_DISAMBIGUATION_CATEGORY"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
