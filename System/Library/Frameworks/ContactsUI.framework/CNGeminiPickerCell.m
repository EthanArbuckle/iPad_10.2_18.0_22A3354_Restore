@implementation CNGeminiPickerCell

- (CNGeminiPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNGeminiPickerCell *v4;
  uint64_t v5;
  CNGeminiBadge *badgeView;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  UILabel *labelLabel;
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
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  UILabel *v49;
  UILabel *valueLabel;
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
  uint64_t v70;
  CNGeminiBadge *centeredBadgeView;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  UILabel *v80;
  UILabel *centeredNameLabel;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  objc_super v101;
  _QWORD v102[3];
  _QWORD v103[4];

  v103[3] = *MEMORY[0x1E0C80C00];
  v101.receiver = self;
  v101.super_class = (Class)CNGeminiPickerCell;
  v4 = -[CNGeminiPickerCell initWithStyle:reuseIdentifier:](&v101, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    +[CNGeminiBadge geminiBadgeWithText:](CNGeminiBadge, "geminiBadgeWithText:", CFSTR("-"));
    v5 = objc_claimAutoreleasedReturnValue();
    badgeView = v4->_badgeView;
    v4->_badgeView = (CNGeminiBadge *)v5;

    objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 20.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scaledFontForFont:", v8);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    +[CNUIColorRepository monogrammerBackTextWhiteColor](CNUIColorRepository, "monogrammerBackTextWhiteColor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIColorRepository contactCardStaticIdentityBadgeGlyphColor](CNUIColorRepository, "contactCardStaticIdentityBadgeGlyphColor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DC1140];
    v102[0] = *MEMORY[0x1E0DC1138];
    v102[1] = v9;
    v103[0] = v100;
    v103[1] = v99;
    v102[2] = *MEMORY[0x1E0DC1100];
    v103[2] = v98;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 3);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiBadge setViewAttributes:](v4->_badgeView, "setViewAttributes:", v97);
    -[CNGeminiPickerCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerCell badgeView](v4, "badgeView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[CNGeminiPickerCell badgeView](v4, "badgeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutMarginsGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    labelLabel = v4->_labelLabel;
    v4->_labelLabel = v18;

    v96 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_labelLabel, "setFont:", v20);

    -[UILabel setNumberOfLines:](v4->_labelLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_labelLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNGeminiPickerCell contentView](v4, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v4->_labelLabel);

    -[UILabel firstBaselineAnchor](v4->_labelLabel, "firstBaselineAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v24, 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    -[UILabel leadingAnchor](v4->_labelLabel, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerCell badgeView](v4, "badgeView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "scaledValueForValue:", 4.0);
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    -[CNGeminiPickerCell badgeView](v4, "badgeView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v4->_labelLabel, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[CNGeminiPickerCell badgeView](v4, "badgeView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "frame");
    v37 = v36;
    -[CNGeminiPickerCell badgeView](v4, "badgeView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "frame");
    v40 = v39;
    -[CNGeminiPickerCell badgeView](v4, "badgeView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "intrinsicContentSize");
    v43 = v42;
    -[CNGeminiPickerCell labelLabel](v4, "labelLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "font");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "capHeight");
    v47 = v46;
    -[CNGeminiPickerCell badgeView](v4, "badgeView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFrame:", v37, v40, v43, v47);

    v49 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    valueLabel = v4->_valueLabel;
    v4->_valueLabel = v49;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_valueLabel, "setFont:", v51);

    -[UILabel setNumberOfLines:](v4->_valueLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_valueLabel, "setTextColor:", v52);

    -[CNGeminiPickerCell contentView](v4, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addSubview:", v4->_valueLabel);

    -[UILabel firstBaselineAnchor](v4->_valueLabel, "firstBaselineAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v4->_labelLabel, "lastBaselineAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v55, 1.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setActive:", 1);

    -[UILabel leadingAnchor](v4->_valueLabel, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerCell badgeView](v4, "badgeView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setActive:", 1);

    -[UILabel trailingAnchor](v4->_valueLabel, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerCell contentView](v4, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "layoutMarginsGuide");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintLessThanOrEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setActive:", 1);

    -[CNGeminiPickerCell contentView](v4, "contentView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v4->_valueLabel, "lastBaselineAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v68, 1.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setActive:", 1);

    +[CNGeminiBadge geminiBadgeWithText:](CNGeminiBadge, "geminiBadgeWithText:", CFSTR("-"));
    v70 = objc_claimAutoreleasedReturnValue();
    centeredBadgeView = v4->_centeredBadgeView;
    v4->_centeredBadgeView = (CNGeminiBadge *)v70;

    -[CNGeminiBadge setViewAttributes:](v4->_centeredBadgeView, "setViewAttributes:", v97);
    -[CNGeminiPickerCell contentView](v4, "contentView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerCell centeredBadgeView](v4, "centeredBadgeView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addSubview:", v73);

    -[CNGeminiPickerCell centeredBadgeView](v4, "centeredBadgeView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "leadingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerCell contentView](v4, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "layoutMarginsGuide");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setActive:", 1);

    v80 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    centeredNameLabel = v4->_centeredNameLabel;
    v4->_centeredNameLabel = v80;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v96);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_centeredNameLabel, "setFont:", v82);

    -[UILabel setNumberOfLines:](v4->_centeredNameLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_centeredNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNGeminiPickerCell contentView](v4, "contentView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "addSubview:", v4->_centeredNameLabel);

    -[UILabel centerYAnchor](v4->_centeredNameLabel, "centerYAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerCell contentView](v4, "contentView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "centerYAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setActive:", 1);

    -[UILabel leadingAnchor](v4->_centeredNameLabel, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiBadge trailingAnchor](v4->_centeredBadgeView, "trailingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "scaledValueForValue:", 4.0);
    objc_msgSend(v88, "constraintEqualToAnchor:constant:", v89);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setActive:", 1);

    -[CNGeminiBadge centerYAnchor](v4->_centeredBadgeView, "centerYAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v4->_centeredNameLabel, "centerYAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setActive:", 1);

  }
  return v4;
}

- (void)setText:(id)a3 detailText:(id)a4 badgeText:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;

  v28 = (__CFString *)a4;
  v8 = a5;
  v9 = a3;
  -[CNGeminiPickerCell badgeView](self, "badgeView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v8);

  -[CNGeminiPickerCell labelLabel](self, "labelLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v9);

  -[CNGeminiPickerCell centeredBadgeView](self, "centeredBadgeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v8);

  -[CNGeminiPickerCell centeredNameLabel](self, "centeredNameLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v9);

  v14 = -[__CFString length](v28, "length");
  -[CNGeminiPickerCell badgeView](self, "badgeView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    objc_msgSend(v15, "setHidden:", 0);

    -[CNGeminiPickerCell labelLabel](self, "labelLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", 0);

    -[CNGeminiPickerCell valueLabel](self, "valueLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 0);

    -[CNGeminiPickerCell centeredBadgeView](self, "centeredBadgeView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);

    -[CNGeminiPickerCell centeredNameLabel](self, "centeredNameLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", 1);

    -[CNGeminiPickerCell valueLabel](self, "valueLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v28;
  }
  else
  {
    objc_msgSend(v15, "setHidden:", 1);

    -[CNGeminiPickerCell labelLabel](self, "labelLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 1);

    -[CNGeminiPickerCell valueLabel](self, "valueLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", 1);

    -[CNGeminiPickerCell centeredBadgeView](self, "centeredBadgeView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidden:", 0);

    -[CNGeminiPickerCell centeredNameLabel](self, "centeredNameLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHidden:", 0);

    -[CNGeminiPickerCell valueLabel](self, "valueLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = CFSTR("+1 (123) 456-7890");
  }
  objc_msgSend(v21, "setText:", v23);

}

- (CNGeminiBadge)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (void)setLabelLabel:(id)a3
{
  objc_storeStrong((id *)&self->_labelLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (CNGeminiBadge)centeredBadgeView
{
  return self->_centeredBadgeView;
}

- (void)setCenteredBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_centeredBadgeView, a3);
}

- (UILabel)centeredNameLabel
{
  return self->_centeredNameLabel;
}

- (void)setCenteredNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_centeredNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredNameLabel, 0);
  objc_storeStrong((id *)&self->_centeredBadgeView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
