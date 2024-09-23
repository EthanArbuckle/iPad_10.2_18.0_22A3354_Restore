@implementation HKEmergencyCardFooterCell

- (HKEmergencyCardFooterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKEmergencyCardFooterCell *v4;
  HKEmergencyCardFooterCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKEmergencyCardFooterCell;
  v4 = -[HKEmergencyCardFooterCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKEmergencyCardFooterCell setupViews](v4, "setupViews");
    -[HKEmergencyCardFooterCell setupConstraints](v5, "setupConstraints");
  }
  return v5;
}

- (void)setupViews
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
  id v23;

  v3 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKEmergencyCardFooterCell setFooterTextView:](self, "setFooterTextView:", v4);

  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollEnabled:", 0);

  -[HKEmergencyCardFooterCell footerTextViewString](self, "footerTextViewString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", v7);

  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 1);

  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEditable:", 0);

  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setInteractiveTextSelectionDisabled:", 1);

  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDataDetectorTypes:", 2);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v16);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v18);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardFooterCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBackgroundColor:", v20);

  -[HKEmergencyCardFooterCell contentView](self, "contentView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v22);

}

- (void)setupConstraints
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
  id v22;

  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardFooterCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardFooterCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v11, 2.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[HKEmergencyCardFooterCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v16, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[HKEmergencyCardFooterCell contentView](self, "contentView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

}

- (void)setFooterText:(id)a3
{
  NSAttributedString **p_footerTextViewString;
  id v6;
  NSAttributedString *v7;
  id v8;

  p_footerTextViewString = &self->_footerTextViewString;
  objc_storeStrong((id *)&self->_footerTextViewString, a3);
  v6 = a3;
  v7 = *p_footerTextViewString;
  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedText:", v7);

}

- (void)setTextViewDelegate:(id)a3
{
  void *v4;
  void *v5;
  HKEmergencyCardFooterCell *v6;
  HKEmergencyCardFooterCell *v7;

  v7 = (HKEmergencyCardFooterCell *)a3;
  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v7)
    v6 = v7;
  else
    v6 = self;
  objc_msgSend(v4, "setDelegate:", v6);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CA5878];
  v7 = a4;
  objc_msgSend(v6, "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openSensitiveURL:withOptions:", v7, 0);

  return 1;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKEmergencyCardFooterCell;
  -[HKEmergencyCardFooterCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HKEmergencyCardFooterCell _updateTextColor](self, "_updateTextColor");
}

- (void)_updateTextColor
{
  void *v3;
  id v4;

  -[HKEmergencyCardFooterCell footerTextViewString](self, "footerTextViewString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardFooterCell footerTextView](self, "footerTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", v4);

}

- (UITextView)footerTextView
{
  return self->_footerTextView;
}

- (void)setFooterTextView:(id)a3
{
  objc_storeStrong((id *)&self->_footerTextView, a3);
}

- (NSAttributedString)footerTextViewString
{
  return self->_footerTextViewString;
}

- (void)setFooterTextViewString:(id)a3
{
  objc_storeStrong((id *)&self->_footerTextViewString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTextViewString, 0);
  objc_storeStrong((id *)&self->_footerTextView, 0);
}

@end
