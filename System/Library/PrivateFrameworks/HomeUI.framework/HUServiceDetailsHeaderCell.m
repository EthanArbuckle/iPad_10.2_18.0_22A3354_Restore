@implementation HUServiceDetailsHeaderCell

- (HUServiceDetailsHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUServiceDetailsHeaderCell *v4;
  void *v5;
  uint64_t v6;
  UITextView *messageTextView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *titleLabel;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  UIStackView *titleSpinnerStackView;
  void *v25;
  uint64_t v26;
  UIButton *actionButton;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  UIActivityIndicatorView *checkingForUpdateSpinner;
  objc_super v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)HUServiceDetailsHeaderCell;
  v4 = -[HUServiceDetailsHeaderCell initWithStyle:reuseIdentifier:](&v43, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsHeaderCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_opt_new();
    messageTextView = v4->_messageTextView;
    v4->_messageTextView = (UITextView *)v6;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4->_messageTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setEditable:](v4->_messageTextView, "setEditable:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](v4->_messageTextView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setScrollEnabled:](v4->_messageTextView, "setScrollEnabled:", 0);
    -[UITextView textContainer](v4->_messageTextView, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineFragmentPadding:", 0.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_messageTextView, "setBackgroundColor:", v9);

    -[UITextView setHidden:](v4->_messageTextView, "setHidden:", 1);
    -[HUServiceDetailsHeaderCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsHeaderCell messageTextView](v4, "messageTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v12;

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 2* (-[HUServiceDetailsHeaderCell effectiveUserInterfaceLayoutDirection](v4, "effectiveUserInterfaceLayoutDirection") == 0));
    v14 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v15);

    v16 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v16, "setBackgroundColor:", v17);

    v18 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v18, "setTextColor:", v19);

    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0);
    HFLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4->_titleLabel, "setText:", v20);

    -[UILabel sizeToFit](v4->_titleLabel, "sizeToFit");
    v21 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    v44[0] = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithArrangedSubviews:", v22);
    titleSpinnerStackView = v4->_titleSpinnerStackView;
    v4->_titleSpinnerStackView = (UIStackView *)v23;

    -[UIStackView setAxis:](v4->_titleSpinnerStackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v4->_titleSpinnerStackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](v4->_titleSpinnerStackView, "setSpacing:", 8.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleSpinnerStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUServiceDetailsHeaderCell contentView](v4, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v4->_titleSpinnerStackView);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v26 = objc_claimAutoreleasedReturnValue();
    actionButton = v4->_actionButton;
    v4->_actionButton = (UIButton *)v26;

    -[UIButton titleEdgeInsets](v4->_actionButton, "titleEdgeInsets");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[HUServiceDetailsHeaderCell defaultContentConfiguration](v4, "defaultContentConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "directionalLayoutMargins");
    v36 = v35;

    -[UIButton setTitleEdgeInsets:](v4->_actionButton, "setTitleEdgeInsets:", v29, v36, v31, v33);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v4->_actionButton, "setBackgroundColor:", v37);

    -[UIButton setContentHorizontalAlignment:](v4->_actionButton, "setContentHorizontalAlignment:", 1);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v4->_actionButton, "setTitleColor:forState:", v38, 0);
    -[HUServiceDetailsHeaderCell contentView](v4, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSubview:", v4->_actionButton);

    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    checkingForUpdateSpinner = v4->_checkingForUpdateSpinner;
    v4->_checkingForUpdateSpinner = (UIActivityIndicatorView *)v40;

    -[UIActivityIndicatorView startAnimating](v4->_checkingForUpdateSpinner, "startAnimating");
    -[UIStackView addArrangedSubview:](v4->_titleSpinnerStackView, "addArrangedSubview:", v4->_titleLabel);

  }
  return v4;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUServiceDetailsHeaderCell;
  -[HUServiceDetailsHeaderCell _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[UIButton _setContinuousCornerRadius:](self->_actionButton, "_setContinuousCornerRadius:", a3);
}

- (void)_setCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUServiceDetailsHeaderCell;
  -[HUServiceDetailsHeaderCell _setCornerRadius:](&v5, sel__setCornerRadius_);
  -[UIButton _setCornerRadius:](self->_actionButton, "_setCornerRadius:", a3);
}

- (void)setItem:(id)a3
{
  HFItem *v5;
  HFItem *v6;

  v5 = (HFItem *)a3;
  if (self->_item != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_item, a3);
    -[HUServiceDetailsHeaderCell _configureConstraints](self, "_configureConstraints");
    v5 = v6;
  }

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
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
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id (*v46)(uint64_t);
  void *v47;
  id v48;
  id v49;
  _QWORD v50[5];

  -[HUServiceDetailsHeaderCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v42 = (id)objc_claimAutoreleasedReturnValue();

  -[HUServiceDetailsHeaderCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke;
  v50[3] = &unk_1E6F4E4C8;
  v50[4] = self;
  __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke((uint64_t)v50);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell item](self, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C30]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C48]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell item](self, "item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EB0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    -[UILabel text](self->_titleLabel, "text");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  if (v7)
    v20 = v7;
  else
    v20 = v12;
  v21 = v20;
  v22 = *MEMORY[0x1E0D30C50];
  objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C50]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v42, "objectForKeyedSubscript:", v22);
    v24 = objc_claimAutoreleasedReturnValue();

    v21 = (id)v24;
  }
  v44 = v8;
  v45 = 3221225472;
  v46 = __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke_2;
  v47 = &unk_1E6F506E0;
  v25 = v9;
  v48 = v25;
  v26 = v21;
  v49 = v26;
  __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke_2((uint64_t)&v44);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAttributedText:", v27);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTextColor:", v29);

  -[HUServiceDetailsHeaderCell actionButton](self, "actionButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTitle:forState:", v13, 0);

  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setHidden:", v27 == 0);

  -[HUServiceDetailsHeaderCell actionButton](self, "actionButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setHidden:", v13 == 0);

  objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA8]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v33) = objc_msgSend(v34, "BOOLValue");

  -[HUServiceDetailsHeaderCell titleLabel](self, "titleLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if ((_DWORD)v33)
  {
    objc_msgSend(v35, "setHidden:", 0);

    -[HUServiceDetailsHeaderCell titleLabel](self, "titleLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setText:", v19);

    -[HUServiceDetailsHeaderCell checkingForUpdateSpinner](self, "checkingForUpdateSpinner");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setHidden:", 0);

    -[HUServiceDetailsHeaderCell actionButton](self, "actionButton");
  }
  else
  {
    objc_msgSend(v35, "setHidden:", 1);

    -[HUServiceDetailsHeaderCell checkingForUpdateSpinner](self, "checkingForUpdateSpinner");
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setHidden:", 1, v42, v44, v45, v46, v47);

  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sizeToFit");

  -[HUServiceDetailsHeaderCell titleLabel](self, "titleLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sizeToFit");

  -[HUServiceDetailsHeaderCell _updateErrorLabelConstraints](self, "_updateErrorLabelConstraints");
}

id __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C28]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "latestResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C18]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  v17 = 0;
  if (v6 && v11 && v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "hf_attributedStringForString:withAppendedString:asURL:withAttributes:", v16, v11, v6, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

id __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", *(_QWORD *)(a1 + 32));
    HUPriorityMessageDefaultAttributedStringAttributes();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addAttributes:range:", v3, 0, objc_msgSend(v2, "length"));
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
    {
      v2 = 0;
      return v2;
    }
    v4 = objc_alloc(MEMORY[0x1E0CB3498]);
    v5 = *(_QWORD *)(a1 + 40);
    HUPriorityMessageDefaultAttributedStringAttributes();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v4, "initWithString:attributes:", v5, v3);
  }

  return v2;
}

- (void)_configureConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUServiceDetailsHeaderCell constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[HUServiceDetailsHeaderCell _hiddenMessageTextViewConstraints](self, "_hiddenMessageTextViewConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell setHiddenMessageTextViewConstraints:](self, "setHiddenMessageTextViewConstraints:", v5);

  -[HUServiceDetailsHeaderCell _visibleMessageTextViewConstraints](self, "_visibleMessageTextViewConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell setVisibleMessageTextViewConstraints:](self, "setVisibleMessageTextViewConstraints:", v6);

  -[HUServiceDetailsHeaderCell _updateErrorLabelConstraints](self, "_updateErrorLabelConstraints");
}

- (void)_updateErrorLabelConstraints
{
  void *v3;
  int v4;
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
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;

  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  v5 = (void *)MEMORY[0x1E0CB3718];
  if (v4)
  {
    -[HUServiceDetailsHeaderCell visibleMessageTextViewConstraints](self, "visibleMessageTextViewConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

    v7 = (void *)MEMORY[0x1E0CB3718];
    -[HUServiceDetailsHeaderCell hiddenMessageTextViewConstraints](self, "hiddenMessageTextViewConstraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateConstraints:", v8);

    -[HUServiceDetailsHeaderCell messageBottomConstraint](self, "messageBottomConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

    -[HUServiceDetailsHeaderCell spinnerBottomConstraint](self, "spinnerBottomConstraint");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 0);

  }
  else
  {
    -[HUServiceDetailsHeaderCell hiddenMessageTextViewConstraints](self, "hiddenMessageTextViewConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v10);

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[HUServiceDetailsHeaderCell visibleMessageTextViewConstraints](self, "visibleMessageTextViewConstraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v12);

    -[HUServiceDetailsHeaderCell item](self, "item");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "latestResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      -[HUServiceDetailsHeaderCell messageBottomConstraint](self, "messageBottomConstraint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setActive:", 0);

      -[HUServiceDetailsHeaderCell spinnerBottomConstraint](self, "spinnerBottomConstraint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActive:", 1);

      -[UIStackView addArrangedSubview:](self->_titleSpinnerStackView, "addArrangedSubview:", self->_checkingForUpdateSpinner);
    }
    else
    {
      -[HUServiceDetailsHeaderCell actionButton](self, "actionButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isHidden");

      -[HUServiceDetailsHeaderCell messageBottomConstraint](self, "messageBottomConstraint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20)
      {
        objc_msgSend(v21, "setActive:", 1);

        -[HUServiceDetailsHeaderCell actionBottomConstraint](self, "actionBottomConstraint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = 0;
      }
      else
      {
        objc_msgSend(v21, "setActive:", 0);

        -[HUServiceDetailsHeaderCell actionBottomConstraint](self, "actionBottomConstraint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = 1;
      }
      objc_msgSend(v23, "setActive:", v25);

      -[HUServiceDetailsHeaderCell spinnerBottomConstraint](self, "spinnerBottomConstraint");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setActive:", 0);

      -[UIStackView removeArrangedSubview:](self->_titleSpinnerStackView, "removeArrangedSubview:", self->_checkingForUpdateSpinner);
    }
  }
}

- (id)_hiddenMessageTextViewConstraints
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[HUServiceDetailsHeaderCell heightAnchor](self, "heightAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToConstant:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_visibleMessageTextViewConstraints
{
  id v3;
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
  void *v74;
  void *v75;
  void *v76;
  void *v77;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readableContentGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "readableContentGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[HUServiceDetailsHeaderCell actionButton](self, "actionButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  -[HUServiceDetailsHeaderCell actionButton](self, "actionButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v25);

  -[HUServiceDetailsHeaderCell actionButton](self, "actionButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "lastBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, 35.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  -[HUServiceDetailsHeaderCell actionButton](self, "actionButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v35);

  -[HUServiceDetailsHeaderCell actionButton](self, "actionButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "heightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintGreaterThanOrEqualToConstant:", 44.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v38);

  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v43);

  -[HUServiceDetailsHeaderCell titleSpinnerStackView](self, "titleSpinnerStackView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "lastBaselineAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47, 35.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v48);

  -[HUServiceDetailsHeaderCell titleSpinnerStackView](self, "titleSpinnerStackView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "centerXAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "centerXAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v53);

  -[HUServiceDetailsHeaderCell messageTextView](self, "messageTextView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell contentView](self, "contentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, -35.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell setMessageBottomConstraint:](self, "setMessageBottomConstraint:", v58);

  -[HUServiceDetailsHeaderCell contentView](self, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell messageBottomConstraint](self, "messageBottomConstraint");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addConstraint:", v60);

  -[HUServiceDetailsHeaderCell messageBottomConstraint](self, "messageBottomConstraint");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setActive:", 1);

  -[HUServiceDetailsHeaderCell actionButton](self, "actionButton");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell contentView](self, "contentView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "bottomAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v65, -35.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell setActionBottomConstraint:](self, "setActionBottomConstraint:", v66);

  -[HUServiceDetailsHeaderCell contentView](self, "contentView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell actionBottomConstraint](self, "actionBottomConstraint");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addConstraint:", v68);

  -[HUServiceDetailsHeaderCell actionBottomConstraint](self, "actionBottomConstraint");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setActive:", 0);

  -[HUServiceDetailsHeaderCell titleSpinnerStackView](self, "titleSpinnerStackView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell contentView](self, "contentView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v73, -35.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell setSpinnerBottomConstraint:](self, "setSpinnerBottomConstraint:", v74);

  -[HUServiceDetailsHeaderCell contentView](self, "contentView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsHeaderCell spinnerBottomConstraint](self, "spinnerBottomConstraint");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addConstraint:", v76);

  -[HUServiceDetailsHeaderCell spinnerBottomConstraint](self, "spinnerBottomConstraint");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setActive:", 0);

  return v3;
}

- (HFItem)item
{
  return self->_item;
}

- (HUResizableCellDelegate)resizingDelegate
{
  return (HUResizableCellDelegate *)objc_loadWeakRetained((id *)&self->_resizingDelegate);
}

- (void)setResizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resizingDelegate, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (UITextView)messageTextView
{
  return self->_messageTextView;
}

- (void)setMessageTextView:(id)a3
{
  objc_storeStrong((id *)&self->_messageTextView, a3);
}

- (NSArray)hiddenMessageTextViewConstraints
{
  return self->_hiddenMessageTextViewConstraints;
}

- (void)setHiddenMessageTextViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenMessageTextViewConstraints, a3);
}

- (NSArray)visibleMessageTextViewConstraints
{
  return self->_visibleMessageTextViewConstraints;
}

- (void)setVisibleMessageTextViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_visibleMessageTextViewConstraints, a3);
}

- (UIStackView)titleSpinnerStackView
{
  return self->_titleSpinnerStackView;
}

- (void)setTitleSpinnerStackView:(id)a3
{
  objc_storeStrong((id *)&self->_titleSpinnerStackView, a3);
}

- (UIActivityIndicatorView)checkingForUpdateSpinner
{
  return self->_checkingForUpdateSpinner;
}

- (void)setCheckingForUpdateSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_checkingForUpdateSpinner, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSLayoutConstraint)spinnerBottomConstraint
{
  return self->_spinnerBottomConstraint;
}

- (void)setSpinnerBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerBottomConstraint, a3);
}

- (NSLayoutConstraint)messageBottomConstraint
{
  return self->_messageBottomConstraint;
}

- (void)setMessageBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_messageBottomConstraint, a3);
}

- (NSLayoutConstraint)actionBottomConstraint
{
  return self->_actionBottomConstraint;
}

- (void)setActionBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_actionBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBottomConstraint, 0);
  objc_storeStrong((id *)&self->_messageBottomConstraint, 0);
  objc_storeStrong((id *)&self->_spinnerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_checkingForUpdateSpinner, 0);
  objc_storeStrong((id *)&self->_titleSpinnerStackView, 0);
  objc_storeStrong((id *)&self->_visibleMessageTextViewConstraints, 0);
  objc_storeStrong((id *)&self->_hiddenMessageTextViewConstraints, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_destroyWeak((id *)&self->_resizingDelegate);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
