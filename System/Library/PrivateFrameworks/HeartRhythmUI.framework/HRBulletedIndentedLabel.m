@implementation HRBulletedIndentedLabel

- (HRBulletedIndentedLabel)initWithText:(id)a3
{
  id v5;
  HRBulletedIndentedLabel *v6;
  HRBulletedIndentedLabel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRBulletedIndentedLabel;
  v6 = -[HRBulletedIndentedLabel initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_text, a3);
    -[HRBulletedIndentedLabel _setUpUI](v7, "_setUpUI");
    -[HRBulletedIndentedLabel _setUpConstraints](v7, "_setUpConstraints");
  }

  return v7;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
  -[HRBulletedIndentedLabel _updateLeadingDetailAttributedTextSize](self, "_updateLeadingDetailAttributedTextSize");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
    goto LABEL_3;
  objc_msgSend(v9, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRBulletedIndentedLabel traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  v8 = v9;
  if ((v7 & 1) == 0)
  {
LABEL_3:
    -[HRBulletedIndentedLabel _updateLeadingDetailAttributedTextSize](self, "_updateLeadingDetailAttributedTextSize");
    -[HRBulletedIndentedLabel setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v8 = v9;
  }

}

- (void)_setUpUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HRBulletedIndentedLabel setLabel:](self, "setLabel:", v3);

  -[HRBulletedIndentedLabel label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", 1);

  -[HRBulletedIndentedLabel label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRBulletedIndentedLabel label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  -[HRBulletedIndentedLabel label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRBulletedIndentedLabel addSubview:](self, "addSubview:", v7);

  -[HRBulletedIndentedLabel _updateLeadingDetailAttributedTextSize](self, "_updateLeadingDetailAttributedTextSize");
}

- (void)_setUpConstraints
{
  id v3;

  -[HRBulletedIndentedLabel label](self, "label");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignConstraintsWithView:", self);

}

- (void)_updateLeadingDetailAttributedTextSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend((id)objc_opt_class(), "_bodyFontTextStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRBulletedIndentedLabel label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)MEMORY[0x24BDD1688];
  -[HRBulletedIndentedLabel text](self, "text");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_bodyFontTextStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hrui_bulletedString:textStyle:", v11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRBulletedIndentedLabel label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v9);

}

- (id)firstBaselineAnchor
{
  void *v2;
  void *v3;

  -[HRBulletedIndentedLabel label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBaselineAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastBaselineAnchor
{
  void *v2;
  void *v3;

  -[HRBulletedIndentedLabel label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastBaselineAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

+ (id)_bodyFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend((id)objc_opt_class(), "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
