@implementation AXUISettingsLeftRightSliderCell

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (AXUISettingsLeftRightSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AXUISettingsLeftRightSliderCell *v5;
  UILabel *v6;
  UILabel *leftLabel;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *rightLabel;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UILabel *v19;
  UILabel *valueLabel;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  uint64_t v40;
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
  id *p_isa;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  objc_super v75;
  _QWORD v76[8];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)AXUISettingsLeftRightSliderCell;
  v5 = -[PSSliderTableCell initWithStyle:reuseIdentifier:specifier:](&v75, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    leftLabel = v5->_leftLabel;
    v5->_leftLabel = v6;

    v8 = *MEMORY[0x1E0DC4B10];
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_leftLabel, "setFont:", v9);

    AXUILocalizedStringForKey(CFSTR("LeftStereoBalanceIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5->_leftLabel, "setText:", v10);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_leftLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[AXUISettingsLeftRightSliderCell labelColor](v5, "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_leftLabel, "setTextColor:", v11);

    -[AXUISettingsLeftRightSliderCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v5->_leftLabel);

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    rightLabel = v5->_rightLabel;
    v5->_rightLabel = v13;

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_rightLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_rightLabel, "setFont:", v15);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_rightLabel, "setAdjustsFontForContentSizeCategory:", 1);
    AXUILocalizedStringForKey(CFSTR("RightStereoBalanceIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5->_rightLabel, "setText:", v16);

    -[AXUISettingsLeftRightSliderCell labelColor](v5, "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_rightLabel, "setTextColor:", v17);

    -[AXUISettingsLeftRightSliderCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v5->_rightLabel);

    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    valueLabel = v5->_valueLabel;
    v5->_valueLabel = v19;

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_valueLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_valueLabel, "setFont:", v21);

    -[AXUISettingsLeftRightSliderCell labelColor](v5, "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_valueLabel, "setTextColor:", v22);

    -[AXUISettingsLeftRightSliderCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v5->_valueLabel);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_leftLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_rightLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v24 = (int)*MEMORY[0x1E0D80568];
    objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AXUISettingsLeftRightSliderCell contentView](v5, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraints");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    p_isa = (id *)&v5->super.super.super.super.super.super.super.isa;
    if (!v29)
      goto LABEL_15;
    v30 = v29;
    v31 = *(_QWORD *)v72;
    while (1)
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v72 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v32);
        objc_msgSend(v33, "firstAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24), "topAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34 != v35)
        {

LABEL_9:
          goto LABEL_11;
        }
        objc_msgSend(v33, "secondAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXUISettingsLeftRightSliderCell contentView](v5, "contentView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "topAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = v36 == v38;
        v5 = (AXUISettingsLeftRightSliderCell *)p_isa;
        if (v39)
        {
          objc_msgSend(p_isa, "contentView");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "removeConstraint:", v33);
          goto LABEL_9;
        }
LABEL_11:
        ++v32;
      }
      while (v30 != v32);
      v40 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      v30 = v40;
      if (!v40)
      {
LABEL_15:
        v61 = v28;

        objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24), "bottomAnchor");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXUISettingsLeftRightSliderCell contentView](v5, "contentView");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "bottomAnchor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, -10.0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = v65;
        -[UILabel bottomAnchor](v5->_leftLabel, "bottomAnchor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24), "topAnchor");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, -10.0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v76[1] = v62;
        -[UILabel bottomAnchor](v5->_rightLabel, "bottomAnchor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24), "topAnchor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, -10.0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v76[2] = v58;
        -[UILabel bottomAnchor](v5->_valueLabel, "bottomAnchor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24), "topAnchor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, -10.0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v76[3] = v55;
        -[UILabel leftAnchor](v5->_leftLabel, "leftAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24), "leftAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 5.0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v76[4] = v52;
        -[UILabel rightAnchor](v5->_rightLabel, "rightAnchor");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24), "rightAnchor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "constraintEqualToAnchor:constant:", -5.0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v76[5] = v42;
        -[UILabel centerXAnchor](v5->_valueLabel, "centerXAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.super.super.isa + v24), "centerXAnchor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, 0.0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v76[6] = v45;
        objc_msgSend(p_isa, "contentView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "topAnchor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa[152], "topAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, -10.0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v76[7] = v49;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 8);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = (AXUISettingsLeftRightSliderCell *)p_isa;
        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v50);

        return v5;
      }
    }
  }
  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsLeftRightSliderCell;
  -[PSTableCell layoutSubviews](&v3, sel_layoutSubviews);
  -[AXUISettingsLeftRightSliderCell updateValue](self, "updateValue");
}

- (void)setDisplayValue:(double)a3
{
  self->_displayValue = a3;
  -[AXUISettingsLeftRightSliderCell updateValue](self, "updateValue");
}

- (void)updateValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXUISettingsLeftRightSliderCell displayValue](self, "displayValue");
  objc_msgSend(v3, "localizedStringWithFormat:", CFSTR("%.2f"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_valueLabel, "setText:", v5);

  v6 = (int)*MEMORY[0x1E0D80568];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v6);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__AXUISettingsLeftRightSliderCell_updateValue__block_invoke;
    v8[3] = &unk_1E76AB8E0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "_setAccessibilityValueBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

id __46__AXUISettingsLeftRightSliderCell_updateValue__block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  float v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "displayValue");
  v3 = v2;

  if (v3 > 0.0)
  {
    AXFormatFloatWithPercentage();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("LEFT_RIGHT_BALANCE_VALUE_FORMAT_RIGHT");
LABEL_6:
    AXUILocalizedStringForKey(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if (v3 < 0.0)
  {
    AXFormatFloatWithPercentage();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("LEFT_RIGHT_BALANCE_VALUE_FORMAT_LEFT");
    goto LABEL_6;
  }
  AXFormatFloatWithPercentage();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)accessibilityIncrement
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80568]), "accessibilityIncrement");
}

- (void)accessibilityDecrement
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80568]), "accessibilityDecrement");
}

- (void)setAccessibilityLabel:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXUISettingsLeftRightSliderCell;
  v4 = a3;
  -[AXUISettingsLeftRightSliderCell setAccessibilityLabel:](&v5, sel_setAccessibilityLabel_, v4);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80568]), "setAccessibilityLabel:", v4, v5.receiver, v5.super_class);

}

- (id)labelColor
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesDarkTheme");

  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newControl
{
  AXUISettingsTickMarkSlider *v2;
  AXUISettingsTickMarkSlider *v3;

  v2 = [AXUISettingsTickMarkSlider alloc];
  v3 = -[AXUISettingsTickMarkSlider initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AXUISettingsTickMarkSlider setTicks:](v3, "setTicks:", &unk_1E76C23E8);
  return v3;
}

- (double)displayValue
{
  return self->_displayValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);
}

@end
