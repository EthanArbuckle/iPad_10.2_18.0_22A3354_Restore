@implementation HKEmergencyCardSOSDetailsCell

- (HKEmergencyCardSOSDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKEmergencyCardSOSDetailsCell *v4;
  HKEmergencyCardSOSDetailsCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKEmergencyCardSOSDetailsCell;
  v4 = -[HKEmergencyCardSOSDetailsCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKEmergencyCardSOSDetailsCell _setupViews](v4, "_setupViews");
    -[HKEmergencyCardSOSDetailsCell _setupConstraints](v5, "_setupConstraints");
  }
  return v5;
}

- (void)setFooterAttributedText:(id)a3
{
  objc_class *v4;
  id v5;
  NSAttributedString *v6;
  NSAttributedString *footerAttributedText;

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = (NSAttributedString *)objc_msgSend([v4 alloc], "initWithAttributedString:", v5);

  footerAttributedText = self->_footerAttributedText;
  self->_footerAttributedText = v6;

  -[HKEmergencyCardSOSDetailsCell _updateText](self, "_updateText");
}

- (void)_setupViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
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

  v3 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKEmergencyCardSOSDetailsCell setFooterTextView:](self, "setFooterTextView:", v4);

  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineFragmentPadding");
  v8 = v7;

  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextContainerInset:", 0.0, -v8, 0.0, -v8);

  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScrollEnabled:", 0);

  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserInteractionEnabled:", 1);

  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEditable:", 0);

  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setInteractiveTextSelectionDisabled:", 1);

  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDataDetectorTypes:", 2);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSDetailsCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v19);

  -[HKEmergencyCardSOSDetailsCell contentView](self, "contentView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v21);

}

- (void)_setupConstraints
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

  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSDetailsCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v6, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSDetailsCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v11, 2.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[HKEmergencyCardSOSDetailsCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v16, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[HKEmergencyCardSOSDetailsCell contentView](self, "contentView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

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

  return 0;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKEmergencyCardSOSDetailsCell;
  -[HKEmergencyCardSOSDetailsCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HKEmergencyCardSOSDetailsCell _updateText](self, "_updateText");
}

- (void)_updateText
{
  void *v3;
  id v4;

  -[HKEmergencyCardSOSDetailsCell footerAttributedText](self, "footerAttributedText");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSDetailsCell footerTextView](self, "footerTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", v4);

}

- (NSAttributedString)footerAttributedText
{
  return self->_footerAttributedText;
}

- (UITextView)footerTextView
{
  return self->_footerTextView;
}

- (void)setFooterTextView:(id)a3
{
  objc_storeStrong((id *)&self->_footerTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTextView, 0);
  objc_storeStrong((id *)&self->_footerAttributedText, 0);
}

@end
