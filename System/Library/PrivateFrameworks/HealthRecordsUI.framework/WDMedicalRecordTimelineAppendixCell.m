@implementation WDMedicalRecordTimelineAppendixCell

- (void)setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)WDMedicalRecordTimelineAppendixCell;
  -[WDMedicalRecordGroupableCell setupSubviews](&v46, sel_setupSubviews);
  objc_msgSend(MEMORY[0x1E0DC3F10], "makeChevron");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineAppendixCell setChevronView:](self, "setChevronView:", v3);

  -[WDMedicalRecordTimelineAppendixCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineAppendixCell chevronView](self, "chevronView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordTimelineAppendixCell setTitleLabel:](self, "setTitleLabel:", v6);

  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 2);

  -[WDMedicalRecordTimelineAppendixCell _titleLabelFont](self, "_titleLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[WDMedicalRecordTimelineAppendixCell tintColor](self, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextAlignment:", 4);

  -[WDMedicalRecordTimelineAppendixCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[WDMedicalRecordTimelineAppendixCell chevronView](self, "chevronView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, -16.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[WDMedicalRecordTimelineAppendixCell chevronView](self, "chevronView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, 16.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineAppendixCell chevronView](self, "chevronView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, -16.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, 16.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, -16.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

}

- (void)setTitle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (id)_titleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4A88], 256);
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDMedicalRecordTimelineAppendixCell;
  -[WDMedicalRecordTimelineAppendixCell tintColorDidChange](&v5, sel_tintColorDidChange);
  -[WDMedicalRecordTimelineAppendixCell tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordTimelineAppendixCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

}

- (NSString)title
{
  return self->_title;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)chevronView
{
  return self->_chevronView;
}

- (void)setChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
