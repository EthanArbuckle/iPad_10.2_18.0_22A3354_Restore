@implementation SFQuickLookDocumentInfoView

- (SFQuickLookDocumentInfoView)initWithFrame:(CGRect)a3
{
  SFQuickLookDocumentInfoView *v3;
  UIStackView *v4;
  UIStackView *stackView;
  UIImageView *v6;
  UIImageView *iconImageView;
  UIView *v8;
  UIView *spacingView;
  UILabel *v10;
  UILabel *fileNameLabel;
  void *v12;
  UILabel *v13;
  UILabel *fileSizeLabel;
  void *v15;
  void *v16;
  uint64_t v17;
  NSLayoutConstraint *iconHeightConstraint;
  void *v19;
  uint64_t v20;
  NSLayoutConstraint *iconWidthConstraint;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *lineHeightBetweenIconAndFileNameLabelConstraint;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  SFQuickLookDocumentInfoView *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;
  uint64_t v47;
  _QWORD v48[9];

  v48[7] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)SFQuickLookDocumentInfoView;
  v3 = -[SFQuickLookDocumentInfoView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    stackView = v3->_stackView;
    v3->_stackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 1);
    -[UIStackView setSpacing:](v3->_stackView, "setSpacing:", 3.0);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](v3->_stackView, "setSpacing:", 24.0);
    -[UIStackView setBaselineRelativeArrangement:](v3->_stackView, "setBaselineRelativeArrangement:", 1);
    -[UIStackView setDistribution:](v3->_stackView, "setDistribution:", 0);
    -[SFQuickLookDocumentInfoView addSubview:](v3, "addSubview:", v3->_stackView);
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v6;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v3->_iconImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v3->_iconImageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_iconImageView);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    spacingView = v3->_spacingView;
    v3->_spacingView = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_spacingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_spacingView);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    fileNameLabel = v3->_fileNameLabel;
    v3->_fileNameLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_fileNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setLineBreakMode:](v3->_fileNameLabel, "setLineBreakMode:", 5);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_fileNameLabel, "setTextColor:", v12);

    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_fileNameLabel);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    fileSizeLabel = v3->_fileSizeLabel;
    v3->_fileSizeLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_fileSizeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_fileSizeLabel, "setTextColor:", v15);

    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_fileSizeLabel);
    -[UIImageView heightAnchor](v3->_iconImageView, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", 0.0);
    v17 = objc_claimAutoreleasedReturnValue();
    iconHeightConstraint = v3->_iconHeightConstraint;
    v3->_iconHeightConstraint = (NSLayoutConstraint *)v17;

    -[UIImageView widthAnchor](v3->_iconImageView, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 0.0);
    v20 = objc_claimAutoreleasedReturnValue();
    iconWidthConstraint = v3->_iconWidthConstraint;
    v3->_iconWidthConstraint = (NSLayoutConstraint *)v20;

    -[UIView heightAnchor](v3->_spacingView, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", 0.0);
    v23 = objc_claimAutoreleasedReturnValue();
    lineHeightBetweenIconAndFileNameLabelConstraint = v3->_lineHeightBetweenIconAndFileNameLabelConstraint;
    v3->_lineHeightBetweenIconAndFileNameLabelConstraint = (NSLayoutConstraint *)v23;

    v40 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView widthAnchor](v3->_stackView, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocumentInfoView widthAnchor](v3, "widthAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v43;
    -[UIStackView heightAnchor](v3->_stackView, "heightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocumentInfoView heightAnchor](v3, "heightAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v25;
    -[UIStackView centerXAnchor](v3->_stackView, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocumentInfoView centerXAnchor](v3, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v28;
    -[UIStackView centerYAnchor](v3->_stackView, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocumentInfoView centerYAnchor](v3, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v31;
    v48[4] = v3->_iconHeightConstraint;
    v48[5] = v3->_iconWidthConstraint;
    v48[6] = v3->_lineHeightBetweenIconAndFileNameLabelConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 7);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v32);

    -[SFQuickLookDocumentInfoView _updateOrientationBasedConstraints](v3, "_updateOrientationBasedConstraints");
    LODWORD(v33) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_fileNameLabel, "setContentCompressionResistancePriority:forAxis:", 0, v33);
    LODWORD(v34) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_fileNameLabel, "setContentHuggingPriority:forAxis:", 0, v34);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v3, sel__updatePropertiesDefinedByContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[SFQuickLookDocumentInfoView _updatePropertiesDefinedByContentSizeCategory](v3, "_updatePropertiesDefinedByContentSizeCategory");
    v47 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)-[SFQuickLookDocumentInfoView registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v36, v3, sel__updateOrientationBasedConstraints);

    v38 = v3;
  }

  return v3;
}

- (void)_updateOrientationBasedConstraints
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;

  -[SFQuickLookDocumentInfoView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalSizeClass");

  if (v4 == 1)
    v5 = 96.0;
  else
    v5 = 128.0;
  if (v4 == 1)
    v6 = 16.0;
  else
    v6 = 56.0;
  -[NSLayoutConstraint setConstant:](self->_iconHeightConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_iconWidthConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_lineHeightBetweenIconAndFileNameLabelConstraint, "setConstant:", v6);
}

- (void)_updatePropertiesDefinedByContentSizeCategory
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_fileNameLabel, "setFont:", v3);

  -[UILabel setFont:](self->_fileSizeLabel, "setFont:", v4);
  objc_msgSend(v4, "_scaledValueForValue:", 24.0);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:");

}

- (void)_updateDocumentSizeLabel
{
  NSString *fileType;
  NSString *fileSize;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  fileType = self->_fileType;
  fileSize = self->_fileSize;
  if (fileType && fileSize)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, self->_fileType, self->_fileSize);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();

    v7 = v8;
  }
  else
  {
    if (fileSize)
      fileType = self->_fileSize;
    v7 = fileType;
  }
  v9 = v7;
  -[UILabel setText:](self->_fileSizeLabel, "setText:", v7);

}

- (void)setFileName:(id)a3
{
  NSString **p_fileName;
  id v6;

  p_fileName = &self->_fileName;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", *p_fileName) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fileName, a3);
    -[UILabel setText:](self->_fileNameLabel, "setText:", *p_fileName);
  }

}

- (void)setFileSize:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_fileSize) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fileSize, a3);
    -[SFQuickLookDocumentInfoView _updateDocumentSizeLabel](self, "_updateDocumentSizeLabel");
  }

}

- (void)setFileType:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_fileType) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fileType, a3);
    -[SFQuickLookDocumentInfoView _updateDocumentSizeLabel](self, "_updateDocumentSizeLabel");
  }

}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSString)fileSize
{
  return self->_fileSize;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_lineHeightBetweenIconAndFileNameLabelConstraint, 0);
  objc_storeStrong((id *)&self->_iconWidthConstraint, 0);
  objc_storeStrong((id *)&self->_iconHeightConstraint, 0);
  objc_storeStrong((id *)&self->_spacingView, 0);
  objc_storeStrong((id *)&self->_fileSizeLabel, 0);
  objc_storeStrong((id *)&self->_fileNameLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
