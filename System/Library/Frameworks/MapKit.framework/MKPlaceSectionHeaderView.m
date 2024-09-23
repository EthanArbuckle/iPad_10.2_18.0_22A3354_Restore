@implementation MKPlaceSectionHeaderView

- (MKPlaceSectionHeaderView)initWithFrame:(CGRect)a3
{
  MKPlaceSectionHeaderView *v3;
  MKPlaceSectionHeaderView *v4;
  MKVibrantLabel *v5;
  MKVibrantLabel *sectionHeaderLabel;
  void *v7;
  void *v8;
  _MKRightImageButton *v9;
  uint64_t v10;
  _MKRightImageButton *seeMoreButton;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MKPlaceSectionHeaderView;
  v3 = -[MKPlaceSectionItemView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MKPlaceSectionHeaderView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    v5 = -[MKVibrantLabel initWithStyle:]([MKVibrantLabel alloc], "initWithStyle:", 1);
    sectionHeaderLabel = v4->_sectionHeaderLabel;
    v4->_sectionHeaderLabel = v5;

    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionHeaderFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel setFont:](v4->_sectionHeaderLabel, "setFont:", v8);

    -[MKVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_sectionHeaderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKVibrantLabel setNumberOfLines:](v4->_sectionHeaderLabel, "setNumberOfLines:", 3);
    -[MKPlaceSectionHeaderView addSubview:](v4, "addSubview:", v4->_sectionHeaderLabel);
    v9 = [_MKRightImageButton alloc];
    v10 = -[_MKRightImageButton initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    seeMoreButton = v4->_seeMoreButton;
    v4->_seeMoreButton = (_MKRightImageButton *)v10;

    -[_MKRightImageButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_seeMoreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKPlaceSectionHeaderView seeMoreButtonText](v4, "seeMoreButtonText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKRightImageButton setTitle:](v4->_seeMoreButton, "setTitle:", v12);

    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sectionHeaderButtonFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKRightImageButton titleLabel](v4->_seeMoreButton, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v14);

    -[_MKRightImageButton setHidden:](v4->_seeMoreButton, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v4, sel_contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

    -[MKViewWithHairline setTopHairlineHidden:](v4, "setTopHairlineHidden:", 1);
    -[MKViewWithHairline setBottomHairlineHidden:](v4, "setBottomHairlineHidden:", 0);
    v4->_contentChanged = 1;
  }
  return v4;
}

- (void)contentSizeDidChange
{
  self->_contentChanged = 1;
}

- (void)_updateConstraints
{
  void *v3;
  double height;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "smallAttributionFont");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "_mapkit_scaledValueForValue:", self->_iconDisplaySize.height);
  -[NSLayoutConstraint setConstant:](self->_iconHeightConstraint, "setConstant:");
  objc_msgSend(v20, "_mapkit_scaledValueForValue:", self->_iconDisplaySize.width);
  -[NSLayoutConstraint setConstant:](self->_iconWidthConstraint, "setConstant:");
  height = self->_iconDisplaySize.height;
  if (self->_iconDisplaySize.width != *MEMORY[0x1E0C9D820] || height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[NSLayoutConstraint constant](self->_iconWidthConstraint, "constant", self->_iconDisplaySize.width, height);
    v7 = v6;
    -[NSLayoutConstraint constant](self->_iconHeightConstraint, "constant");
    v9 = v8;
    -[_MKRightImageButton imageView](self->_seeMoreButton, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrame:", 0.0, 0.0, v7, v9);

  }
  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionHeaderFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKVibrantLabel setFont:](self->_sectionHeaderLabel, "setFont:", v12);

  -[MKPlaceSectionHeaderView seeMoreButtonFont](self, "seeMoreButtonFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionHeaderButtonFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_MKRightImageButton titleLabel](self->_seeMoreButton, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  if (!v13)
  {

  }
  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributionFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "_mapkit_scaledValueForValue:", 22.0);
  -[NSLayoutConstraint setConstant:](self->_baselineToTopConstraint, "setConstant:");
  -[MKPlaceSectionHeaderView seeMoreButtonText](self, "seeMoreButtonText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    objc_msgSend(v17, "_mapkit_scaledValueForValue:", 22.0);
    -[NSLayoutConstraint setConstant:](self->_baselineToBaselineConstraint, "setConstant:");
  }
  objc_msgSend(v17, "_mapkit_scaledValueForValue:", 14.0);
  -[NSLayoutConstraint setConstant:](self->_baselineToBottomConstraint, "setConstant:");

}

- (BOOL)shouldStack
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double width;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (-[MKPlaceSectionHeaderView seeMoreButtonAlwaysOnNewLine](self, "seeMoreButtonAlwaysOnNewLine"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[MKPlaceSectionHeaderView showSeeMoreButton](self, "showSeeMoreButton");
    if (!v3)
      return v3;
    -[MKPlaceSectionHeaderView seeMoreButtonText](self, "seeMoreButtonText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {

    }
    else
    {
      -[MKPlaceSectionHeaderView icon](self, "icon");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        LOBYTE(v3) = 0;
        return v3;
      }
    }
    -[MKPlaceSectionHeaderView frame](self, "frame");
    v7 = v6;
    -[MKPlaceSectionHeaderView layoutMargins](self, "layoutMargins");
    v10 = v7 - (v8 + v9);
    -[MKVibrantLabel text](self->_sectionHeaderLabel, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CEA098];
    v29 = *MEMORY[0x1E0CEA098];
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sectionHeaderFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeWithAttributes:", v15);
    v17 = v16;

    -[MKPlaceSectionHeaderView icon](self, "icon");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      width = self->_iconDisplaySize.width;
    }
    else
    {
      -[_MKRightImageButton titleLabel](self->_seeMoreButton, "titleLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "text");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v12;
      +[MKFontManager sharedManager](MKFontManager, "sharedManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sectionHeaderFont");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sizeWithAttributes:", v24);
      width = v25;

    }
    LOBYTE(v3) = v10 < v17 + width;
  }
  return v3;
}

- (void)createConstraints
{
  MKVibrantLabel **p_sectionHeaderLabel;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *baselineToTopConstraint;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _MKRightImageButton *seeMoreButton;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *baselineToBottomConstraint;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  void *v31;
  NSArray *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _MKRightImageButton **p_seeMoreButton;
  void *v37;
  void *v38;
  id *v39;
  void *v40;
  void *v41;
  id *v42;
  uint64_t v43;
  void *v44;
  NSLayoutConstraint *v45;
  NSLayoutConstraint *v46;
  void *v47;
  NSLayoutConstraint *v48;
  NSLayoutConstraint *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSLayoutConstraint *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  _MKRightImageButton *v60;
  void *v61;
  NSLayoutConstraint *v62;
  NSLayoutConstraint *v63;
  void *v64;
  NSLayoutConstraint *v65;
  NSLayoutConstraint *baselineToBaselineConstraint;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSLayoutConstraint *v73;
  NSLayoutConstraint *v74;
  void *v75;
  NSArray *constraints;
  NSArray *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
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
  NSArray *v95;
  _QWORD v96[4];
  _QWORD v97[5];
  _QWORD v98[9];

  v98[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  v95 = (NSArray *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  p_sectionHeaderLabel = &self->_sectionHeaderLabel;
  -[MKVibrantLabel firstBaselineAnchor](self->_sectionHeaderLabel, "firstBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceSectionHeaderView topAnchor](self, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  baselineToTopConstraint = self->_baselineToTopConstraint;
  self->_baselineToTopConstraint = v6;

  if (!-[MKPlaceSectionHeaderView showSeeMoreButton](self, "showSeeMoreButton"))
    goto LABEL_8;
  -[MKPlaceSectionHeaderView seeMoreButtonText](self, "seeMoreButtonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {

    goto LABEL_5;
  }
  -[MKPlaceSectionHeaderView icon](self, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_8:
    -[MKPlaceSectionHeaderView bottomAnchor](self, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel lastBaselineAnchor](*p_sectionHeaderLabel, "lastBaselineAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    baselineToBottomConstraint = self->_baselineToBottomConstraint;
    self->_baselineToBottomConstraint = v21;

    -[MKVibrantLabel leadingAnchor](*p_sectionHeaderLabel, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = v25;
    -[MKVibrantLabel trailingAnchor](*p_sectionHeaderLabel, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = self->_baselineToTopConstraint;
    v96[1] = v29;
    v96[2] = v30;
    v96[3] = self->_baselineToBottomConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v95;
    -[NSArray addObjectsFromArray:](v95, "addObjectsFromArray:", v31);

    v33 = v26;
    v34 = v92;
    goto LABEL_24;
  }
LABEL_5:
  if (-[MKPlaceSectionHeaderView shouldStack](self, "shouldStack"))
  {
    -[_MKRightImageButton titleLabel](self->_seeMoreButton, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextAlignment:", 4);

    -[MKPlaceSectionHeaderView seeMoreButtonText](self, "seeMoreButtonText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    -[MKPlaceSectionHeaderView bottomAnchor](self, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    seeMoreButton = self->_seeMoreButton;
    if (v12)
    {
      -[_MKRightImageButton lastBaselineAnchor](seeMoreButton, "lastBaselineAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v15);
      v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v17 = self->_baselineToBottomConstraint;
      self->_baselineToBottomConstraint = v16;

      -[_MKRightImageButton firstBaselineAnchor](self->_seeMoreButton, "firstBaselineAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKVibrantLabel lastBaselineAnchor](*p_sectionHeaderLabel, "lastBaselineAnchor");
    }
    else
    {
      -[_MKRightImageButton bottomAnchor](seeMoreButton, "bottomAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v61);
      v62 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v63 = self->_baselineToBottomConstraint;
      self->_baselineToBottomConstraint = v62;

      -[_MKRightImageButton topAnchor](self->_seeMoreButton, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKVibrantLabel bottomAnchor](*p_sectionHeaderLabel, "bottomAnchor");
    }
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v64);
    v65 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    baselineToBaselineConstraint = self->_baselineToBaselineConstraint;
    self->_baselineToBaselineConstraint = v65;

    -[MKVibrantLabel leadingAnchor](*p_sectionHeaderLabel, "leadingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "leadingAnchor");
    v68 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:", v68);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v25;
    -[MKVibrantLabel trailingAnchor](*p_sectionHeaderLabel, "trailingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "trailingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v88);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v86;
    -[_MKRightImageButton leadingAnchor](self->_seeMoreButton, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v79);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v78;
    -[_MKRightImageButton trailingAnchor](self->_seeMoreButton, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintLessThanOrEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = self->_baselineToTopConstraint;
    v98[3] = v72;
    v98[4] = v73;
    v74 = self->_baselineToBottomConstraint;
    v98[5] = self->_baselineToBaselineConstraint;
    v98[6] = v74;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 7);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v95, "addObjectsFromArray:", v75);

    v32 = v95;
    v24 = (void *)v68;
    v23 = v67;
    v34 = v94;

    v33 = v84;
  }
  else
  {
    if (MKApplicationLayoutDirectionIsRightToLeft())
      v35 = 0;
    else
      v35 = 2;
    p_seeMoreButton = &self->_seeMoreButton;
    -[_MKRightImageButton titleLabel](self->_seeMoreButton, "titleLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTextAlignment:", v35);

    -[MKVibrantLabel text](*p_sectionHeaderLabel, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "length"))
      v39 = (id *)&self->_sectionHeaderLabel;
    else
      v39 = (id *)&self->_seeMoreButton;
    objc_msgSend(*v39, "firstBaselineAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKVibrantLabel text](*p_sectionHeaderLabel, "text");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "length"))
      v42 = (id *)&self->_sectionHeaderLabel;
    else
      v42 = (id *)&self->_seeMoreButton;
    objc_msgSend(*v42, "lastBaselineAnchor");
    v43 = objc_claimAutoreleasedReturnValue();

    -[MKPlaceSectionHeaderView topAnchor](self, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v40;
    objc_msgSend(v40, "constraintEqualToAnchor:", v44);
    v45 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v46 = self->_baselineToTopConstraint;
    self->_baselineToTopConstraint = v45;

    -[MKPlaceSectionHeaderView bottomAnchor](self, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)v43;
    objc_msgSend(v47, "constraintEqualToAnchor:", v43);
    v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v49 = self->_baselineToBottomConstraint;
    self->_baselineToBottomConstraint = v48;

    -[MKVibrantLabel leadingAnchor](*p_sectionHeaderLabel, "leadingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v85);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v82;
    -[_MKRightImageButton leadingAnchor](*p_seeMoreButton, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel trailingAnchor](*p_sectionHeaderLabel, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintGreaterThanOrEqualToAnchor:constant:", v50, 4.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = v51;
    -[_MKRightImageButton trailingAnchor](*p_seeMoreButton, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = self->_baselineToTopConstraint;
    v97[2] = v55;
    v97[3] = v56;
    v97[4] = self->_baselineToBottomConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 5);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v95;
    -[NSArray addObjectsFromArray:](v95, "addObjectsFromArray:", v57);

    -[MKPlaceSectionHeaderView seeMoreButtonText](self, "seeMoreButtonText");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "length");

    v60 = self->_seeMoreButton;
    if (v59)
    {
      -[_MKRightImageButton firstBaselineAnchor](v60, "firstBaselineAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKVibrantLabel firstBaselineAnchor](*p_sectionHeaderLabel, "firstBaselineAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    }
    else
    {
      -[_MKRightImageButton centerYAnchor](v60, "centerYAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKVibrantLabel centerYAnchor](*p_sectionHeaderLabel, "centerYAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 1.0);
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v95, "addObject:", v33);
    v23 = v91;
    v34 = v93;
  }
LABEL_24:

  constraints = self->_constraints;
  self->_constraints = v32;
  v77 = v32;

  -[MKPlaceSectionHeaderView _updateConstraints](self, "_updateConstraints");
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);

}

- (void)updateContent
{
  double Width;
  CGRect v4;

  -[MKPlaceSectionHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v4);
  if (fabs(Width) > 2.22044605e-16 && self->_width != Width || self->_contentChanged)
  {
    -[MKPlaceSectionHeaderView createConstraints](self, "createConstraints");
    self->_contentChanged = 0;
  }
}

- (void)updateConstraints
{
  objc_super v3;

  -[MKPlaceSectionHeaderView updateContent](self, "updateContent");
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceSectionHeaderView;
  -[MKPlaceSectionHeaderView updateConstraints](&v3, sel_updateConstraints);
}

- (NSString)seeMoreButtonText
{
  NSString *seeMoreButtonText;

  seeMoreButtonText = self->_seeMoreButtonText;
  if (seeMoreButtonText)
    return seeMoreButtonText;
  _MKLocalizedStringFromThisBundle(CFSTR("See More"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSeeMoreButtonText:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  if (self->_seeMoreButtonText != v9)
  {
    objc_storeStrong((id *)&self->_seeMoreButtonText, a3);
    -[MKPlaceSectionHeaderView seeMoreButtonText](self, "seeMoreButtonText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKRightImageButton setTitle:](self->_seeMoreButton, "setTitle:", v5);

    -[MKPlaceSectionHeaderView seeMoreButtonText](self, "seeMoreButtonText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKRightImageButton setAccessibilityLabel:](self->_seeMoreButton, "setAccessibilityLabel:", v6);

    -[MKPlaceSectionHeaderView seeMoreButtonText](self, "seeMoreButtonText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKRightImageButton titleLabel](self->_seeMoreButton, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v7);

    self->_contentChanged = 1;
  }
  -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");

}

- (void)setIcon:(id)a3
{
  id v4;
  NSString *seeMoreButtonText;
  id v6;

  v6 = a3;
  -[MKPlaceSectionHeaderView icon](self, "icon");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_MKRightImageButton setImage:](self->_seeMoreButton, "setImage:", v6);
    seeMoreButtonText = self->_seeMoreButtonText;
    self->_seeMoreButtonText = (NSString *)&stru_1E20DFC00;

    self->_contentChanged = 1;
  }
  -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");

}

- (UIImage)icon
{
  return -[_MKRightImageButton image](self->_seeMoreButton, "image");
}

- (void)setIconDisplaySize:(CGSize)a3
{
  CGSize *p_iconDisplaySize;
  NSLayoutConstraint *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *iconWidthConstraint;
  NSLayoutConstraint *v11;
  double height;
  NSLayoutConstraint *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *iconHeightConstraint;
  NSLayoutConstraint *v18;

  p_iconDisplaySize = &self->_iconDisplaySize;
  if (a3.width != self->_iconDisplaySize.width || a3.height != self->_iconDisplaySize.height)
  {
    p_iconDisplaySize->width = a3.width;
    self->_iconDisplaySize.height = a3.height;
    if (a3.width <= 0.0)
    {
      iconWidthConstraint = self->_iconWidthConstraint;
      if (iconWidthConstraint)
      {
        -[NSLayoutConstraint setActive:](iconWidthConstraint, "setActive:", 0);
        v11 = self->_iconWidthConstraint;
        self->_iconWidthConstraint = 0;

      }
    }
    else
    {
      v6 = self->_iconWidthConstraint;
      if (!v6)
      {
        -[_MKRightImageButton widthAnchor](self->_seeMoreButton, "widthAnchor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "constraintEqualToConstant:", 0.0);
        v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        v9 = self->_iconWidthConstraint;
        self->_iconWidthConstraint = v8;

        a3.width = p_iconDisplaySize->width;
        v6 = self->_iconWidthConstraint;
      }
      -[NSLayoutConstraint setConstant:](v6, "setConstant:", a3.width);
    }
    height = p_iconDisplaySize->height;
    if (height <= 0.0)
    {
      iconHeightConstraint = self->_iconHeightConstraint;
      if (iconHeightConstraint)
      {
        -[NSLayoutConstraint setActive:](iconHeightConstraint, "setActive:", 0);
        v18 = self->_iconHeightConstraint;
        self->_iconHeightConstraint = 0;

      }
    }
    else
    {
      v13 = self->_iconHeightConstraint;
      if (!v13)
      {
        -[_MKRightImageButton heightAnchor](self->_seeMoreButton, "heightAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "constraintEqualToConstant:", 0.0);
        v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        v16 = self->_iconHeightConstraint;
        self->_iconHeightConstraint = v15;

        height = p_iconDisplaySize->height;
        v13 = self->_iconHeightConstraint;
      }
      -[NSLayoutConstraint setConstant:](v13, "setConstant:", height);
    }
    -[NSLayoutConstraint setActive:](self->_iconWidthConstraint, "setActive:", 1);
    -[NSLayoutConstraint setActive:](self->_iconHeightConstraint, "setActive:", 1);
  }
}

- (void)setShowSeeMoreButton:(BOOL)a3
{
  BOOL v4;

  if (self->_showSeeMoreButton != a3)
  {
    self->_showSeeMoreButton = a3;
    v4 = !a3;
    -[_MKRightImageButton setHidden:](self->_seeMoreButton, "setHidden:", !a3);
    if (v4)
      -[_MKRightImageButton removeFromSuperview](self->_seeMoreButton, "removeFromSuperview");
    else
      -[MKPlaceSectionHeaderView addSubview:](self, "addSubview:", self->_seeMoreButton);
  }
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  id v6;

  v6 = a3;
  -[MKPlaceSectionHeaderView setTarget:](self, "setTarget:", v6);
  -[MKPlaceSectionHeaderView setAction:](self, "setAction:", a4);
  -[_MKRightImageButton setTarget:action:](self->_seeMoreButton, "setTarget:action:", v6, a4);

}

- (void)setTitle:(id)a3
{
  -[MKVibrantLabel setText:](self->_sectionHeaderLabel, "setText:", a3);
}

- (NSString)title
{
  return -[MKVibrantLabel text](self->_sectionHeaderLabel, "text");
}

- (void)setProviderName:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_providerName, a3);
  if (-[NSString length](self->_providerName, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    _MKLocalizedStringFromThisBundle(CFSTR("PlaceCardSectionHeader"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, self->_providerName, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionHeaderView setSeeMoreButtonText:](self, "setSeeMoreButtonText:", v7);

  }
  else
  {
    _MKLocalizedStringFromThisBundle(CFSTR("PlaceCardSectionHeaderNoProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionHeaderView setSeeMoreButtonText:](self, "setSeeMoreButtonText:", v6);
  }

}

- (void)setSeeMoreButtonFont:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_seeMoreButtonFont, a3);
  v5 = a3;
  -[_MKRightImageButton titleLabel](self->_seeMoreButton, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

}

- (UIFont)seeMoreButtonFont
{
  return self->_seeMoreButtonFont;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (CGSize)iconDisplaySize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconDisplaySize.width;
  height = self->_iconDisplaySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)showSeeMoreButton
{
  return self->_showSeeMoreButton;
}

- (BOOL)seeMoreButtonAlwaysOnNewLine
{
  return self->_seeMoreButtonAlwaysOnNewLine;
}

- (void)setSeeMoreButtonAlwaysOnNewLine:(BOOL)a3
{
  self->_seeMoreButtonAlwaysOnNewLine = a3;
}

- (MKVibrantLabel)sectionHeaderLabel
{
  return self->_sectionHeaderLabel;
}

- (void)setSectionHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderLabel, a3);
}

- (_MKRightImageButton)seeMoreButton
{
  return self->_seeMoreButton;
}

- (void)setSeeMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_seeMoreButton, a3);
}

- (NSArray)seeMoreButtonConstraints
{
  return self->_seeMoreButtonConstraints;
}

- (void)setSeeMoreButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_seeMoreButtonConstraints, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_seeMoreButtonConstraints, 0);
  objc_storeStrong((id *)&self->_seeMoreButton, 0);
  objc_storeStrong((id *)&self->_sectionHeaderLabel, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_seeMoreButtonFont, 0);
  objc_storeStrong((id *)&self->_seeMoreButtonText, 0);
  objc_storeStrong((id *)&self->_iconWidthConstraint, 0);
  objc_storeStrong((id *)&self->_iconHeightConstraint, 0);
  objc_storeStrong((id *)&self->_baselineToBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_baselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_baselineToTopConstraint, 0);
}

@end
