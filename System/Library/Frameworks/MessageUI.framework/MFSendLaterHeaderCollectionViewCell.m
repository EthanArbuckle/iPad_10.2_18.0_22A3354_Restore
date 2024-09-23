@implementation MFSendLaterHeaderCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MFSendLaterHeaderCollectionViewCellIdentifier");
}

- (MFSendLaterHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  double width;
  MFSendLaterHeaderCollectionViewCell *v4;
  MFSendLaterHeaderCollectionViewHelper *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  MFSendLaterHeaderCollectionViewHelper *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  id v46;
  void *v47;
  objc_super v48;
  _QWORD v49[4];
  _QWORD v50[4];

  width = a3.size.width;
  v50[2] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)MFSendLaterHeaderCollectionViewCell;
  v4 = -[MFSendLaterHeaderCollectionViewCell initWithFrame:](&v48, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = [MFSendLaterHeaderCollectionViewHelper alloc];
    -[MFSendLaterHeaderCollectionViewCell layoutMargins](v4, "layoutMargins");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[MFSendLaterHeaderCollectionViewCell window](v4, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "screen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    v17 = -[MFSendLaterHeaderCollectionViewHelper initWithWidth:layoutMargins:viewScale:](v5, "initWithWidth:layoutMargins:viewScale:", width, v7, v9, v11, v13, v16);
    -[MFSendLaterHeaderCollectionViewCell setViewHelper:](v4, "setViewHelper:", v17);

    v18 = objc_alloc(MEMORY[0x1E0DC3990]);
    v47 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    _EFLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setText:", v19);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFont:", v20);

    objc_msgSend(v47, "setAdjustsFontForContentSizeCategory:", 1);
    v46 = objc_alloc_init(MEMORY[0x1E0DC36F0]);
    objc_msgSend(v46, "_setCompactStyleDelegate:", v4);
    objc_msgSend(v46, "setPreferredDatePickerStyle:", 2);
    objc_msgSend(v46, "setDatePickerMode:", 2);
    -[MFSendLaterHeaderCollectionViewCell setCurrentVisibleComponent:](v4, "setCurrentVisibleComponent:", 1);
    objc_msgSend(v46, "_compactStyleSetActiveComponent:", -[MFSendLaterHeaderCollectionViewCell currentVisibleComponent](v4, "currentVisibleComponent"));
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSendLaterHeaderCollectionViewCell setBackgroundColor:](v4, "setBackgroundColor:", v21);

    v22 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v50[0] = v47;
    v50[1] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithArrangedSubviews:", v23);

    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v24, "setCustomSpacing:afterView:", v47, 8.0);
    -[MFSendLaterHeaderCollectionViewCell addSubview:](v4, "addSubview:", v24);
    v25 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v24, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSendLaterHeaderCollectionViewCell layoutMarginsGuide](v4, "layoutMarginsGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v40;
    objc_msgSend(v24, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSendLaterHeaderCollectionViewCell layoutMarginsGuide](v4, "layoutMarginsGuide");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", 7.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v37;
    objc_msgSend(v24, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSendLaterHeaderCollectionViewCell layoutMarginsGuide](v4, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v26, -7.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v27;
    objc_msgSend(v24, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSendLaterHeaderCollectionViewCell layoutMarginsGuide](v4, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v32);

    -[MFSendLaterHeaderCollectionViewCell setDatePicker:](v4, "setDatePicker:", v46);
    -[MFSendLaterHeaderCollectionViewCell setStackView:](v4, "setStackView:", v24);
    -[MFSendLaterHeaderCollectionViewCell viewHelper](v4, "viewHelper");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "precalculateWidthsWithDescription:", v34);

    -[MFSendLaterHeaderCollectionViewCell _updateLabelAndDatePickerOrientation](v4);
  }
  return v4;
}

- (void)_updateLabelAndDatePickerOrientation
{
  void *v2;
  int v3;
  uint64_t v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "stackView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "viewHelper");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "willContentTruncate");

    if (v3)
    {
      v4 = 1;
      objc_msgSend(v5, "setAxis:", 1);
    }
    else
    {
      objc_msgSend(v5, "setAxis:", 0);
      v4 = 3;
    }
    objc_msgSend(v5, "setAlignment:", v4);
    objc_msgSend(v5, "layoutIfNeeded");

  }
}

- (void)updateActiveComponent:(int64_t)a3
{
  uint64_t v4;
  id v5;

  if (!a3)
  {
    v4 = 1;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = 2;
LABEL_5:
    -[MFSendLaterHeaderCollectionViewCell setCurrentVisibleComponent:](self, "setCurrentVisibleComponent:", v4);
  }
  -[MFSendLaterHeaderCollectionViewCell datePicker](self, "datePicker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setCompactStyleDelegate:", self);
  objc_msgSend(v5, "_compactStyleSetActiveComponent:", -[MFSendLaterHeaderCollectionViewCell currentVisibleComponent](self, "currentVisibleComponent"));

}

- (void)updateWithDate:(id)a3 timeZone:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MFSendLaterHeaderCollectionViewCell datePicker](self, "datePicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v6);
  objc_msgSend(v7, "_setCompactStyleDelegate:", self);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setDisplaysTimeZone:", objc_msgSend(v6, "isEqual:", v8) ^ 1);

  objc_msgSend(v7, "setDate:", v9);
}

- (void)_datePicker:(id)a3 didSelectComponent:(int64_t)a4
{
  void *v6;
  id v7;

  -[MFSendLaterHeaderCollectionViewCell delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    if (a4 == 2)
    {
      -[MFSendLaterHeaderCollectionViewCell setCurrentVisibleComponent:](self, "setCurrentVisibleComponent:", 2);
      objc_msgSend(v7, "sendLaterHeaderCollectionViewCellTimeTapped:", self);
    }
    else if (a4 == 1)
    {
      -[MFSendLaterHeaderCollectionViewCell setCurrentVisibleComponent:](self, "setCurrentVisibleComponent:", 1);
      objc_msgSend(v7, "sendLaterHeaderCollectionViewCellDateTapped:", self);
    }
  }
  else
  {
    -[MFSendLaterHeaderCollectionViewCell datePicker](self, "datePicker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setCompactStyleDelegate:", self);
    objc_msgSend(v6, "_compactStyleSetActiveComponent:", -[MFSendLaterHeaderCollectionViewCell currentVisibleComponent](self, "currentVisibleComponent"));

  }
}

- (void)layoutMarginsDidChange
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFSendLaterHeaderCollectionViewCell;
  -[MFSendLaterHeaderCollectionViewCell layoutMarginsDidChange](&v5, sel_layoutMarginsDidChange);
  -[MFSendLaterHeaderCollectionViewCell viewHelper](self, "viewHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSendLaterHeaderCollectionViewCell layoutMargins](self, "layoutMargins");
  v4 = objc_msgSend(v3, "updateLayoutMarginsIfNeeded:");

  if (v4)
    -[MFSendLaterHeaderCollectionViewCell _updateLabelAndDatePickerOrientation](self);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)MFSendLaterHeaderCollectionViewCell;
  -[MFSendLaterHeaderCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v8, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSendLaterHeaderCollectionViewCell viewHelper](self, "viewHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = objc_msgSend(v5, "updateWidthIfNeeded:", CGRectGetWidth(v9));

  if (v6)
    -[MFSendLaterHeaderCollectionViewCell _updateLabelAndDatePickerOrientation](self);
  return v4;
}

- (MFSendLaterHeaderCollectionViewCellDelegate)delegate
{
  return (MFSendLaterHeaderCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MFSendLaterHeaderCollectionViewHelper)viewHelper
{
  return self->_viewHelper;
}

- (void)setViewHelper:(id)a3
{
  objc_storeStrong((id *)&self->_viewHelper, a3);
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void)setDatePicker:(id)a3
{
  objc_storeStrong((id *)&self->_datePicker, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (int64_t)currentVisibleComponent
{
  return self->_currentVisibleComponent;
}

- (void)setCurrentVisibleComponent:(int64_t)a3
{
  self->_currentVisibleComponent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_viewHelper, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
