@implementation WDMedicalRecordTimelinePanelTitleCell

- (WDMedicalRecordTimelinePanelTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDMedicalRecordTimelinePanelTitleCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WDMedicalRecordTimelinePanelTitleCell;
  v4 = -[WDMedicalRecordGroupableCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordGroupableCell setPillBackgroundColor:](v4, "setPillBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordTimelinePanelTitleCell setBackgroundColor:](v4, "setBackgroundColor:", v6);

  }
  return v4;
}

- (void)setupSubviews
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
  id v12;
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
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)WDMedicalRecordTimelinePanelTitleCell;
  -[WDMedicalRecordGroupableCell setupSubviews](&v56, sel_setupSubviews);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordTimelinePanelTitleCell setTitleLabel:](self, "setTitleLabel:", v3);

  -[WDMedicalRecordTimelinePanelTitleCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 1);

  -[WDMedicalRecordTimelinePanelTitleCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelinePanelTitleCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[WDMedicalRecordTimelinePanelTitleCell titleFont](self, "titleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelinePanelTitleCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[WDMedicalRecordTimelinePanelTitleCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelinePanelTitleCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordTimelinePanelTitleCell setSubtitleLabel:](self, "setSubtitleLabel:", v12);

  -[WDMedicalRecordTimelinePanelTitleCell subtitleLabel](self, "subtitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 0);

  -[WDMedicalRecordTimelinePanelTitleCell subtitleLabel](self, "subtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelinePanelTitleCell subtitleLabel](self, "subtitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v15);

  -[WDMedicalRecordTimelinePanelTitleCell subtitleFont](self, "subtitleFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelinePanelTitleCell subtitleLabel](self, "subtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  -[WDMedicalRecordTimelinePanelTitleCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelinePanelTitleCell subtitleLabel](self, "subtitleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  -[WDMedicalRecordTimelinePanelTitleCell titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[WDMedicalRecordTimelinePanelTitleCell titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[WDMedicalRecordTimelinePanelTitleCell titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 8.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[WDMedicalRecordTimelinePanelTitleCell subtitleLabel](self, "subtitleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  -[WDMedicalRecordTimelinePanelTitleCell subtitleLabel](self, "subtitleLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  -[WDMedicalRecordTimelinePanelTitleCell subtitleLabel](self, "subtitleLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelinePanelTitleCell titleLabel](self, "titleLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setActive:", 1);

  -[WDMedicalRecordTimelinePanelTitleCell subtitleLabel](self, "subtitleLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

  -[WDMedicalRecordGroupableCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4AB8], 1280);
}

- (id)subtitleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    title = self->_title;
    self->_title = v4;

    -[NSString localizedUppercaseString](self->_title, "localizedUppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordTimelinePanelTitleCell titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_subtitle, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    subtitle = self->_subtitle;
    self->_subtitle = v4;

    v6 = self->_subtitle;
    -[WDMedicalRecordTimelinePanelTitleCell subtitleLabel](self, "subtitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
