@implementation HKCDADocumentTableViewCell

- (HKCDADocumentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKCDADocumentTableViewCell *v4;
  HKCDADocumentTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKCDADocumentTableViewCell;
  v4 = -[HKCDADocumentTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_showsCheckbox = 0;
    objc_storeWeak((id *)&v4->_delegate, 0);
    -[HKCDADocumentTableViewCell _setupCellStructure](v5, "_setupCellStructure");
  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MinX;
  double Width;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14.receiver = self;
  v14.super_class = (Class)HKCDADocumentTableViewCell;
  -[HKCDADocumentTableViewCell layoutSubviews](&v14, sel_layoutSubviews);
  -[HKCDADocumentTableViewCell viewWithTag:](self, "viewWithTag:", 101);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[HKCDADocumentTableViewCell convertRect:fromView:](self, "convertRect:fromView:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[UIView hk_isLeftToRight](self, "hk_isLeftToRight"))
  {
    v15.origin.x = v5;
    v15.origin.y = v7;
    v15.size.width = v9;
    v15.size.height = v11;
    MinX = CGRectGetMinX(v15);
  }
  else
  {
    -[HKCDADocumentTableViewCell bounds](self, "bounds");
    Width = CGRectGetWidth(v16);
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    MinX = Width - CGRectGetMaxX(v17);
  }
  -[HKCDADocumentTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, MinX, 0.0, 0.0);

}

- (void)setShowsCheckbox:(BOOL)a3
{
  self->_showsCheckbox = a3;
  -[HKAdjustableTapTargetButton setHidden:](self->_checkboxButton, "setHidden:", !a3);
  -[HKCDADocumentTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setChecked:(BOOL)a3
{
  -[HKAdjustableTapTargetButton setSelected:](self->_checkboxButton, "setSelected:", a3);
}

- (void)setCellValuesForDocumentSample:(id)a3
{
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
  id v19;

  v4 = a3;
  objc_msgSend(v4, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[HKCDADocumentTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCDADocumentTableViewCell _setDocumentLabelWithTag:text:view:](self, "_setDocumentLabelWithTag:text:view:", 101, v19, v6);

  objc_msgSend(v4, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "patientName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKCDADocumentTableViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCDADocumentTableViewCell _setDocumentLabelWithTag:text:view:](self, "_setDocumentLabelWithTag:text:view:", 105, v8, v9);

  objc_msgSend(v4, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v10, 35);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCDADocumentTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCDADocumentTableViewCell _setDocumentLabelWithTag:text:view:](self, "_setDocumentLabelWithTag:text:view:", 102, v11, v12);

  objc_msgSend(v4, "document");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "custodianName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKCDADocumentTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCDADocumentTableViewCell _setDocumentLabelWithTag:text:view:](self, "_setDocumentLabelWithTag:text:view:", 103, v14, v15);

  objc_msgSend(v4, "document");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "authorName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKCDADocumentTableViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCDADocumentTableViewCell _setDocumentLabelWithTag:text:view:](self, "_setDocumentLabelWithTag:text:view:", 104, v17, v18);

}

- (BOOL)isChecked
{
  return -[HKAdjustableTapTargetButton isSelected](self->_checkboxButton, "isSelected");
}

- (void)_setupCellStructure
{
  id v3;
  uint64_t v4;
  void *v5;
  HKAdjustableTapTargetButton *v6;
  HKAdjustableTapTargetButton *checkboxButton;
  void *v8;
  void *v9;
  HKAdjustableTapTargetButton *v10;
  void *v11;
  void *v12;
  HKAdjustableTapTargetButton *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  UIStackView *v18;
  _HKDocumentImageView *v19;
  double v20;
  double v21;
  void *v22;
  UILabel *v23;
  UILabel *titleLabel;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray *v30;
  NSArray *cellLabels;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
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
  _HKDocumentImageView *documentImageView;
  _HKDocumentImageView *v53;
  UIStackView *imageLabelStack;
  _HKDocumentImageView *v55;
  void *v56;
  void *v57;
  UIStackView *v58;
  void *v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _QWORD v67[6];

  v67[4] = *MEMORY[0x1E0C80C00];
  -[HKCDADocumentTableViewCell contentView](self, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v4 = MEMORY[0x1E0C9AA60];
  v5 = (void *)objc_msgSend(v3, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v5, "setAxis:", 0);
  objc_msgSend(v5, "setDistribution:", 0);
  +[HKAdjustableTapTargetButton buttonWithType:](HKAdjustableTapTargetButton, "buttonWithType:", 0);
  v6 = (HKAdjustableTapTargetButton *)objc_claimAutoreleasedReturnValue();
  checkboxButton = self->_checkboxButton;
  self->_checkboxButton = v6;

  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UITintedCircularButtonCheckmark"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UIRemoveControlMultiNotCheckedImage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_checkboxButton;
  HKHealthKeyColor();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v8;
  objc_msgSend(v8, "_flatImageWithColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAdjustableTapTargetButton setImage:forState:](v10, "setImage:forState:", v12, 4);

  v13 = self->_checkboxButton;
  HKHealthKeyColor();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v9;
  objc_msgSend(v9, "_flatImageWithColor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAdjustableTapTargetButton setImage:forState:](v13, "setImage:forState:", v15, 0);

  -[HKAdjustableTapTargetButton setHitTargetInsets:](self->_checkboxButton, "setHitTargetInsets:", 0.0, -16.0, 0.0, -50.0);
  -[HKAdjustableTapTargetButton addTarget:action:forControlEvents:](self->_checkboxButton, "addTarget:action:forControlEvents:", self, sel__selectedCheckbox_, 64);
  -[HKAdjustableTapTargetButton setTranslatesAutoresizingMaskIntoConstraints:](self->_checkboxButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKAdjustableTapTargetButton setHidden:](self->_checkboxButton, "setHidden:", 1);
  LODWORD(v16) = 1148846080;
  -[HKAdjustableTapTargetButton setContentCompressionResistancePriority:forAxis:](self->_checkboxButton, "setContentCompressionResistancePriority:forAxis:", 0, v16);
  LODWORD(v17) = 1148846080;
  -[HKAdjustableTapTargetButton setContentHuggingPriority:forAxis:](self->_checkboxButton, "setContentHuggingPriority:forAxis:", 0, v17);
  -[HKAdjustableTapTargetButton setContentEdgeInsets:](self->_checkboxButton, "setContentEdgeInsets:", 0.0, 0.0, 0.0, 16.0);
  objc_msgSend(v5, "addArrangedSubview:", self->_checkboxButton);
  v18 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  -[UIStackView setAxis:](v18, "setAxis:", 0);
  -[UIStackView setDistribution:](v18, "setDistribution:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("cda_doc"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_HKDocumentImageView initWithImage:]([_HKDocumentImageView alloc], "initWithImage:", v56);
  v58 = v18;
  -[UIStackView addArrangedSubview:](v18, "addArrangedSubview:", v19);
  LODWORD(v20) = 1148846080;
  -[_HKDocumentImageView setContentCompressionResistancePriority:forAxis:](v19, "setContentCompressionResistancePriority:forAxis:", 0, v20);
  v55 = v19;
  LODWORD(v21) = 1148846080;
  -[_HKDocumentImageView setContentHuggingPriority:forAxis:](v19, "setContentHuggingPriority:forAxis:", 0, v21);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v4);
  objc_msgSend(v22, "setAxis:", 1);
  objc_msgSend(v22, "setDistribution:", 0);
  -[HKCDADocumentTableViewCell _createDocumentCellLabelWithTag:fontSizePts:flexibleHeight:](self, "_createDocumentCellLabelWithTag:fontSizePts:flexibleHeight:", 101, 1, 18.0);
  v23 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v23;

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("UIA.Health.CDA.ReportTitle"));
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v25);

  -[HKCDADocumentTableViewCell _createDocumentCellLabelWithTag:fontSizePts:flexibleHeight:](self, "_createDocumentCellLabelWithTag:fontSizePts:flexibleHeight:", 105, 0, 14.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v26;
  -[HKCDADocumentTableViewCell _createDocumentCellLabelWithTag:fontSizePts:flexibleHeight:](self, "_createDocumentCellLabelWithTag:fontSizePts:flexibleHeight:", 102, 0, 14.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v27;
  -[HKCDADocumentTableViewCell _createDocumentCellLabelWithTag:fontSizePts:flexibleHeight:](self, "_createDocumentCellLabelWithTag:fontSizePts:flexibleHeight:", 103, 0, 14.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v28;
  -[HKCDADocumentTableViewCell _createDocumentCellLabelWithTag:fontSizePts:flexibleHeight:](self, "_createDocumentCellLabelWithTag:fontSizePts:flexibleHeight:", 104, 0, 14.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4);
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cellLabels = self->_cellLabels;
  self->_cellLabels = v30;

  objc_msgSend(v22, "addArrangedSubview:", self->_titleLabel);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v32 = self->_cellLabels;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v63;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v63 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v36);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setTextColor:", v38);

        objc_msgSend(v22, "addArrangedSubview:", v37);
        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    }
    while (v34);
  }

  -[UIStackView addArrangedSubview:](v58, "addArrangedSubview:", v22);
  LODWORD(v39) = 1132068864;
  objc_msgSend(v22, "setContentHuggingPriority:forAxis:", 0, v39);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addArrangedSubview:", v58);
  objc_msgSend(v61, "addSubview:", v5);
  objc_msgSend(v5, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, 16.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  objc_msgSend(v5, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  objc_msgSend(v5, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, 11.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  objc_msgSend(v5, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, -11.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  -[HKCDADocumentTableViewCell setAccessoryType:](self, "setAccessoryType:", 1);
  documentImageView = self->_documentImageView;
  self->_documentImageView = v55;
  v53 = v55;

  imageLabelStack = self->_imageLabelStack;
  self->_imageLabelStack = v58;

  -[HKCDADocumentTableViewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (void)_updateForCurrentSizeCategory
{
  _BOOL4 IsUsingAccessibilityContentSizeCategory;
  _BOOL8 v4;
  double v5;
  _BOOL8 v6;
  UILabel *titleLabel;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  v4 = IsUsingAccessibilityContentSizeCategory;
  if (IsUsingAccessibilityContentSizeCategory)
    v5 = 0.0;
  else
    v5 = 10.0;
  v6 = !IsUsingAccessibilityContentSizeCategory;
  -[UIStackView setAxis:](self->_imageLabelStack, "setAxis:", IsUsingAccessibilityContentSizeCategory);
  -[UIStackView setAlignment:](self->_imageLabelStack, "setAlignment:", v4);
  -[_HKDocumentImageView setMargins:](self->_documentImageView, "setMargins:", 0.0, -4.0, 0.0, v5);
  titleLabel = self->_titleLabel;
  v8 = (void *)MEMORY[0x1E0DC1350];
  v9 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_scaledValueForValue:", 18.0);
  objc_msgSend(v8, "systemFontOfSize:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v11);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v6);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = self->_cellLabels;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1E0DC1350];
        objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v9, (_QWORD)v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_scaledValueForValue:", 14.0);
        objc_msgSend(v18, "systemFontOfSize:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setFont:", v20);

        objc_msgSend(v17, "setNumberOfLines:", v6);
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

}

- (id)_createDocumentCellLabelWithTag:(int64_t)a3 fontSizePts:(double)a4 flexibleHeight:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  double v9;
  void *v10;
  double v11;

  v5 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(v8, "setTag:", a3);
  objc_msgSend(v8, "setNumberOfLines:", 1);
  LODWORD(v9) = 1055286886;
  objc_msgSend(v8, "_setHyphenationFactor:", v9);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v10);

  LODWORD(v11) = 1144750080;
  if (v5)
    *(float *)&v11 = 250.0;
  objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 1, v11);
  return v8;
}

- (void)_setDocumentLabelWithTag:(int64_t)a3 text:(id)a4 view:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  objc_msgSend(a5, "viewWithTag:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

}

- (void)_selectedCheckbox:(id)a3
{
  id WeakRetained;
  id v5;

  if (self->_checkboxButton == a3)
  {
    -[HKAdjustableTapTargetButton setSelected:](self->_checkboxButton, "setSelected:", objc_msgSend(a3, "isSelected") ^ 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v5 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v5, "cdaDocumentTableViewCellDidChangeValue:", self);

    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKCDADocumentTableViewCell;
  -[HKCDADocumentTableViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKCDADocumentTableViewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKCDADocumentTableViewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (BOOL)showsCheckbox
{
  return self->_showsCheckbox;
}

- (HKCDADocumentTableViewCellDelegate)delegate
{
  return (HKCDADocumentTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKAdjustableTapTargetButton)checkboxButton
{
  return self->_checkboxButton;
}

- (void)setCheckboxButton:(id)a3
{
  objc_storeStrong((id *)&self->_checkboxButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkboxButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageLabelStack, 0);
  objc_storeStrong((id *)&self->_cellLabels, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_documentImageView, 0);
}

@end
