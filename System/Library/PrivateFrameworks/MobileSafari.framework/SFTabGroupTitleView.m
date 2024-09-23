@implementation SFTabGroupTitleView

- (SFTabGroupTitleView)initWithFrame:(CGRect)a3
{
  SFTabGroupTitleView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  UILabel *v7;
  UILabel *subtitleLabel;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SFTabGroupTitleView *v22;
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
  objc_super v38;
  _QWORD v39[9];

  v39[7] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)SFTabGroupTitleView;
  v3 = -[SFTabGroupTitleView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v6);

    -[SFTabGroupTitleView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_subtitleLabel, "setFont:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v10);

    LODWORD(v11) = 1132593152;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_subtitleLabel, "setContentHuggingPriority:forAxis:", 1, v11);
    LODWORD(v12) = 1144913920;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    -[SFTabGroupTitleView addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    v28 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabGroupTitleView leadingAnchor](v3, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v35;
    -[UILabel widthAnchor](v3->_titleLabel, "widthAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabGroupTitleView widthAnchor](v3, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v32;
    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabGroupTitleView topAnchor](v3, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v29;
    -[UILabel topAnchor](v3->_subtitleLabel, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v25;
    -[UILabel leadingAnchor](v3->_subtitleLabel, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabGroupTitleView leadingAnchor](v3, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v14;
    -[UILabel widthAnchor](v3->_subtitleLabel, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabGroupTitleView widthAnchor](v3, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[5] = v17;
    -[UILabel bottomAnchor](v3->_subtitleLabel, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTabGroupTitleView bottomAnchor](v3, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[6] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v21);

    v22 = v3;
  }

  return v3;
}

- (void)setTabGroup:(id)a3
{
  WBTabGroup *v5;
  WBTabGroup *v6;

  v5 = (WBTabGroup *)a3;
  if (self->_tabGroup != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_tabGroup, a3);
    -[SFTabGroupTitleView updateTitle](self, "updateTitle");
    v5 = v6;
  }

}

- (void)updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E21FE780);
  if (-[WBTabGroup isShared](self->_tabGroup, "isShared"))
  {
    -[SFTabGroupTitleView _attributedStringWithImageNamed:textStyle:additionalSymbolicTraits:color:baselineOffset:](self, "_attributedStringWithImageNamed:textStyle:additionalSymbolicTraits:color:baselineOffset:", CFSTR("person.2.fill"), *MEMORY[0x1E0DC4B10], 0, 0, 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendAttributedString:", v4);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v3, "appendAttributedString:", v5);

  }
  v6 = objc_alloc(MEMORY[0x1E0CB3498]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[WBTabGroup displayTitle](self->_tabGroup, "displayTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ "), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithString:", v9);
  objc_msgSend(v3, "appendAttributedString:", v10);

  v11 = *MEMORY[0x1E0DC4A98];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFTabGroupTitleView _attributedStringWithImageNamed:textStyle:additionalSymbolicTraits:color:baselineOffset:](self, "_attributedStringWithImageNamed:textStyle:additionalSymbolicTraits:color:baselineOffset:", CFSTR("chevron.forward"), v11, 2, v12, 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendAttributedString:", v13);

  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v3);
  if (objc_msgSend(0, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v14, "symbolicTraits") | 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pointSize");
    objc_msgSend(v15, "fontWithDescriptor:size:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0CB3778]);
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithString:", v19);

    v21 = *MEMORY[0x1E0DC1138];
    v35[0] = v17;
    v22 = *MEMORY[0x1E0DC1140];
    v34[0] = v21;
    v34[1] = v22;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "string");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "rangeOfString:", CFSTR("%@"));
    objc_msgSend(v20, "setAttributes:range:", v24, v26, v27);

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithFormat:options:locale:", v20, 0, 0, 0);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v28, "appendAttributedString:", v29);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "attributedStringWithAttachment:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "appendAttributedString:", v33);
    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v28);

  }
  else
  {
    -[UILabel setText:](self->_subtitleLabel, "setText:", &stru_1E21FE780);
  }

}

- (id)_attributedStringWithImageNamed:(id)a3 textStyle:(id)a4 additionalSymbolicTraits:(unsigned int)a5 color:(id)a6 baselineOffset:(double)a7
{
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v11 = a6;
  v12 = (void *)MEMORY[0x1E0DC3870];
  v13 = a4;
  objc_msgSend(v12, "systemImageNamed:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributedStringWithAttachment:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v19, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v19, "symbolicTraits") | a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pointSize");
  objc_msgSend(v20, "fontWithDescriptor:size:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v22, 0, 1);
  if (v11)
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v11, 0, 1);
  if (a7 != 0.0)
  {
    v23 = *MEMORY[0x1E0DC1108];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAttribute:value:range:", v23, v24, 0, 1);

  }
  return v18;
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
