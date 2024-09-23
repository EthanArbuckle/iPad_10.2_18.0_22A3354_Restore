@implementation PKTextInputDebugViewTableCell

- (PKTextInputDebugViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKTextInputDebugViewTableCell *v4;
  PKTextInputDebugViewTableCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTextInputDebugViewTableCell;
  v4 = -[PKTextInputDebugViewTableCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 1, a4);
  v5 = v4;
  if (v4)
  {
    -[PKTextInputDebugViewTableCell setOpaque:](v4, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewTableCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[PKTextInputDebugViewTableCell setIndentationLevel:](v5, "setIndentationLevel:", 1);
  }
  return v5;
}

- (void)setValueAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *valueAttributedText;

  if (self->_valueAttributedText != a3)
  {
    v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
    valueAttributedText = self->_valueAttributedText;
    self->_valueAttributedText = v4;

    -[PKTextInputDebugViewTableCell _updateLabels](self, "_updateLabels");
  }
}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  NSString *titleText;

  if (self->_titleText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    titleText = self->_titleText;
    self->_titleText = v4;

    -[PKTextInputDebugViewTableCell _updateLabels](self, "_updateLabels");
  }
}

- (void)setShowDetailsButton:(BOOL)a3
{
  if (self->_showDetailsButton != a3)
  {
    self->_showDetailsButton = a3;
    -[PKTextInputDebugViewTableCell _updateLabels](self, "_updateLabels");
  }
}

- (void)_setupContentViewsIfNeeded
{
  void *v3;
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
  _QWORD v62[2];
  _QWORD v63[4];
  _QWORD v64[6];

  v64[4] = *MEMORY[0x1E0C80C00];
  -[PKTextInputDebugViewTableCell _titleLabel](self, "_titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PKTextInputDebugViewTableCell set_titleLabel:](self, "set_titleLabel:", v5);
    objc_msgSend(v5, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 15.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v7);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v8);

    -[PKTextInputDebugViewTableCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v5);

    objc_msgSend(v5, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewTableCell contentView](self, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v54, 10.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v52;
    objc_msgSend(v5, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewTableCell contentView](self, "contentView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v46, 8.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v10;
    objc_msgSend(v5, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewTableCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -8.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v14;
    objc_msgSend(v5, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintGreaterThanOrEqualToConstant:", 22.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v17);
  }
  -[PKTextInputDebugViewTableCell _valueLabel](self, "_valueLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = objc_alloc(MEMORY[0x1E0DC3990]);
    v20 = (void *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PKTextInputDebugViewTableCell set_valueLabel:](self, "set_valueLabel:", v20);
    objc_msgSend(v20, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v21);

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v22);

    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKTextInputDebugViewTableCell contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v20);

    objc_msgSend(v20, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewTableCell _titleLabel](self, "_titleLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", v55, 6.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v53;
    objc_msgSend(v20, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewTableCell contentView](self, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v47);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v45;
    objc_msgSend(v20, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewTableCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v25, 14.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2] = v26;
    objc_msgSend(v20, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewTableCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, -14.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v63[3] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v31);
  }
  -[PKTextInputDebugViewTableCell _detailsButton](self, "_detailsButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 13.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("info.circle"), v61);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "systemButtonWithImage:target:action:", v58, self, sel__handleDetailsButton_);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewTableCell set_detailsButton:](self, "set_detailsButton:", v33);
    objc_msgSend(v33, "_setTouchInsets:", -5.0, -5.0, -5.0, -5.0);
    objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKTextInputDebugViewTableCell contentView](self, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", v33);

    objc_msgSend(v33, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewTableCell _titleLabel](self, "_titleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v38;
    objc_msgSend(v33, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewTableCell _titleLabel](self, "_titleLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41, -10.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v43);
  }
}

- (void)_updateLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[PKTextInputDebugViewTableCell _setupContentViewsIfNeeded](self, "_setupContentViewsIfNeeded");
  -[PKTextInputDebugViewTableCell titleText](self, "titleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugViewTableCell _titleLabel](self, "_titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[PKTextInputDebugViewTableCell valueAttributedText](self, "valueAttributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugViewTableCell _valueLabel](self, "_valueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v5);

  v7 = -[PKTextInputDebugViewTableCell showDetailsButton](self, "showDetailsButton") ^ 1;
  -[PKTextInputDebugViewTableCell _detailsButton](self, "_detailsButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

}

- (void)_handleDetailsButton:(id)a3
{
  id v4;

  -[PKTextInputDebugViewTableCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugViewTableCellDidTapDetailsButton:", self);

}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSAttributedString)valueAttributedText
{
  return self->_valueAttributedText;
}

- (BOOL)showDetailsButton
{
  return self->_showDetailsButton;
}

- (NSString)statusKey
{
  return self->_statusKey;
}

- (void)setStatusKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (PKTextInputDebugViewTableCellDelegate)delegate
{
  return (PKTextInputDebugViewTableCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void)set_titleLabel:(id)a3
{
  objc_storeStrong((id *)&self->__titleLabel, a3);
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (void)set_valueLabel:(id)a3
{
  objc_storeStrong((id *)&self->__valueLabel, a3);
}

- (UIButton)_detailsButton
{
  return self->__detailsButton;
}

- (void)set_detailsButton:(id)a3
{
  objc_storeStrong((id *)&self->__detailsButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__detailsButton, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusKey, 0);
  objc_storeStrong((id *)&self->_valueAttributedText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
