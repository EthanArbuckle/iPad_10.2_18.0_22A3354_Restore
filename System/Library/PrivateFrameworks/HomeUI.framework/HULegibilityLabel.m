@implementation HULegibilityLabel

- (HULegibilityLabel)initWithFrame:(CGRect)a3
{
  void *v4;
  HULegibilityLabel *v5;

  objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HULegibilityLabel initWithSettings:strength:](self, "initWithSettings:strength:", v4, *MEMORY[0x1E0CEC0C0]);

  return v5;
}

- (HULegibilityLabel)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULegibilityLabel.m"), 54, CFSTR("Not supported"));

  return -[HULegibilityLabel initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (HULegibilityLabel)initWithSettings:(id)a3 strength:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  HULegibilityLabel *v9;

  v6 = (void *)MEMORY[0x1E0CEA5E8];
  v7 = a3;
  objc_msgSend(v6, "systemFontSize");
  objc_msgSend(v6, "systemFontOfSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HULegibilityLabel initWithSettings:strength:text:font:](self, "initWithSettings:strength:text:font:", v7, 0, v8, a4);

  return v9;
}

- (HULegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6
{
  return -[HULegibilityLabel initWithSettings:strength:text:font:options:](self, "initWithSettings:strength:text:font:options:", a3, a5, a6, 0, a4);
}

- (HULegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6 options:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  HULegibilityLabel *v20;
  HULegibilityLabel *v21;
  uint64_t v22;
  NSString *text;
  uint64_t v24;
  UILabel *lookasideLabel;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UILayoutGuide *v34;
  UILayoutGuide *firstBaselineLayoutGuide;
  UILayoutGuide *v36;
  UILayoutGuide *lastBaselineLayoutGuide;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  id v69;
  id v70;
  id v71;
  objc_super v72;
  _QWORD v73[8];
  _QWORD v74[6];

  v74[4] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v72.receiver = self;
  v72.super_class = (Class)HULegibilityLabel;
  v16 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v20 = -[HULegibilityLabel initWithFrame:](&v72, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v17, v18, v19);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_legibilitySettings, a3);
    v21->_strength = a4;
    v22 = objc_msgSend(v14, "copy");
    text = v21->_text;
    v21->_text = (NSString *)v22;

    objc_storeStrong((id *)&v21->_font, a6);
    v21->_options = a7;
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v16, v17, v18, v19);
    v71 = v13;
    lookasideLabel = v21->_lookasideLabel;
    v21->_lookasideLabel = (UILabel *)v24;

    -[UILabel setTextAlignment:](v21->_lookasideLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v21->_lookasideLabel, "setLineBreakMode:", 5);
    -[UILabel setClipsToBounds:](v21->_lookasideLabel, "setClipsToBounds:", 0);
    -[UILabel setHidden:](v21->_lookasideLabel, "setHidden:", 1);
    -[UILabel setText:](v21->_lookasideLabel, "setText:", v21->_text);
    -[UILabel setFont:](v21->_lookasideLabel, "setFont:", v21->_font);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v21->_lookasideLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HULegibilityLabel addSubview:](v21, "addSubview:", v21->_lookasideLabel);
    v57 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v21->_lookasideLabel, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULegibilityLabel topAnchor](v21, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v65);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v63;
    -[UILabel leadingAnchor](v21->_lookasideLabel, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULegibilityLabel leadingAnchor](v21, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v59);
    v69 = v15;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v26;
    -[UILabel trailingAnchor](v21->_lookasideLabel, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULegibilityLabel trailingAnchor](v21, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v70 = v14;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v29;
    -[UILabel heightAnchor](v21->_lookasideLabel, "heightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULegibilityLabel heightAnchor](v21, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v33);

    v34 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    firstBaselineLayoutGuide = v21->_firstBaselineLayoutGuide;
    v21->_firstBaselineLayoutGuide = v34;

    -[HULegibilityLabel addLayoutGuide:](v21, "addLayoutGuide:", v21->_firstBaselineLayoutGuide);
    v36 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    lastBaselineLayoutGuide = v21->_lastBaselineLayoutGuide;
    v21->_lastBaselineLayoutGuide = v36;

    -[HULegibilityLabel addLayoutGuide:](v21, "addLayoutGuide:", v21->_lastBaselineLayoutGuide);
    v54 = (void *)MEMORY[0x1E0CB3718];
    -[UILayoutGuide topAnchor](v21->_firstBaselineLayoutGuide, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v21->_lookasideLabel, "firstBaselineAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v66);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v64;
    -[UILayoutGuide heightAnchor](v21->_firstBaselineLayoutGuide, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToConstant:", 0.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v60;
    -[UILayoutGuide leadingAnchor](v21->_firstBaselineLayoutGuide, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULegibilityLabel leadingAnchor](v21, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v55;
    -[UILayoutGuide trailingAnchor](v21->_firstBaselineLayoutGuide, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULegibilityLabel trailingAnchor](v21, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v73[3] = v51;
    -[UILayoutGuide topAnchor](v21->_lastBaselineLayoutGuide, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v21->_lookasideLabel, "lastBaselineAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v73[4] = v48;
    -[UILayoutGuide heightAnchor](v21->_lastBaselineLayoutGuide, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToConstant:", 0.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v73[5] = v39;
    -[UILayoutGuide leadingAnchor](v21->_lastBaselineLayoutGuide, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULegibilityLabel leadingAnchor](v21, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v73[6] = v42;
    -[UILayoutGuide trailingAnchor](v21->_lastBaselineLayoutGuide, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULegibilityLabel trailingAnchor](v21, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v73[7] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "activateConstraints:", v46);

    v15 = v69;
    v14 = v70;

    v13 = v71;
    -[HULegibilityLabel _markOurselfDirty](v21, "_markOurselfDirty");
  }

  return v21;
}

- (void)setAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedText;
  BOOL v6;
  NSAttributedString *v7;
  NSAttributedString *v8;
  NSAttributedString *v9;

  v4 = (NSAttributedString *)a3;
  attributedText = self->_attributedText;
  if (attributedText != v4)
  {
    v9 = v4;
    v6 = -[NSAttributedString isEqualToAttributedString:](attributedText, "isEqualToAttributedString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSAttributedString *)-[NSAttributedString copy](v9, "copy");
      v8 = self->_attributedText;
      self->_attributedText = v7;

      -[UILabel setAttributedText:](self->_lookasideLabel, "setAttributedText:", self->_attributedText);
      -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
      v4 = v9;
    }
  }

}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    text = self->_text;
    self->_text = v4;

    -[UILabel setText:](self->_lookasideLabel, "setText:", self->_text);
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }

}

- (UIColor)textColor
{
  UIColor *textColorOverride;

  textColorOverride = self->_textColorOverride;
  if (textColorOverride)
    return textColorOverride;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTextColor:(id)a3
{
  UIColor **p_textColorOverride;
  id v6;

  p_textColorOverride = &self->_textColorOverride;
  v6 = a3;
  if ((-[UIColor isEqual:](*p_textColorOverride, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColorOverride, a3);
    -[UILabel setTextColor:](self->_lookasideLabel, "setTextColor:", *p_textColorOverride);
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }

}

- (void)setFont:(id)a3
{
  UIFont *v5;

  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[UILabel setFont:](self->_lookasideLabel, "setFont:", v5);
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }

}

- (int64_t)textAlignment
{
  return -[UILabel textAlignment](self->_lookasideLabel, "textAlignment");
}

- (void)setTextAlignment:(int64_t)a3
{
  if (-[UILabel textAlignment](self->_lookasideLabel, "textAlignment") != a3)
  {
    -[UILabel setTextAlignment:](self->_lookasideLabel, "setTextAlignment:", a3);
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (int64_t)lineBreakMode
{
  return -[UILabel lineBreakMode](self->_lookasideLabel, "lineBreakMode");
}

- (void)setLineBreakMode:(int64_t)a3
{
  if (-[UILabel lineBreakMode](self->_lookasideLabel, "lineBreakMode") != a3)
  {
    -[UILabel setLineBreakMode:](self->_lookasideLabel, "setLineBreakMode:", a3);
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return -[UILabel adjustsFontForContentSizeCategory](self->_lookasideLabel, "adjustsFontForContentSizeCategory");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UILabel adjustsFontForContentSizeCategory](self->_lookasideLabel, "adjustsFontForContentSizeCategory") != a3)
  {
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_lookasideLabel, "setAdjustsFontForContentSizeCategory:", v3);
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (int64_t)numberOfLines
{
  return -[UILabel numberOfLines](self->_lookasideLabel, "numberOfLines");
}

- (void)setNumberOfLines:(int64_t)a3
{
  if (-[UILabel numberOfLines](self->_lookasideLabel, "numberOfLines") != a3)
  {
    -[UILabel setNumberOfLines:](self->_lookasideLabel, "setNumberOfLines:", a3);
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return -[UILabel adjustsFontSizeToFitWidth](self->_lookasideLabel, "adjustsFontSizeToFitWidth");
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UILabel adjustsFontSizeToFitWidth](self->_lookasideLabel, "adjustsFontSizeToFitWidth") != a3)
  {
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_lookasideLabel, "setAdjustsFontSizeToFitWidth:", v3);
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (double)minimumScaleFactor
{
  double result;

  -[UILabel minimumScaleFactor](self->_lookasideLabel, "minimumScaleFactor");
  return result;
}

- (void)setMinimumScaleFactor:(double)a3
{
  double v5;

  -[UILabel minimumScaleFactor](self->_lookasideLabel, "minimumScaleFactor");
  if (v5 != a3)
  {
    -[UILabel setMinimumScaleFactor:](self->_lookasideLabel, "setMinimumScaleFactor:", a3);
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (void)setOptions:(int64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    -[_UILegibilityView setOptions:](self->_legibilityView, "setOptions:");
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (double)firstBaselineOffsetFromBottom
{
  double Height;
  double v4;
  CGRect v6;

  -[HULegibilityLabel bounds](self, "bounds");
  Height = CGRectGetHeight(v6);
  -[UILabel effectiveFirstBaselineOffsetFromTop](self->_lookasideLabel, "effectiveFirstBaselineOffsetFromTop");
  return Height - v4;
}

- (double)lastBaselineOffsetFromBottom
{
  double result;

  -[UILabel effectiveBaselineOffsetFromBottom](self->_lookasideLabel, "effectiveBaselineOffsetFromBottom");
  return result;
}

- (UIEdgeInsets)characterOverflowInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UILabel _contentInsetsFromFonts](self->_lookasideLabel, "_contentInsetsFromFonts");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  return self->_lookasideLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_lookasideLabel;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HULegibilityLabel frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)HULegibilityLabel;
  -[HULegibilityLabel setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[UILabel setNeedsLayout](self->_lookasideLabel, "setNeedsLayout");
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HULegibilityLabel bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)HULegibilityLabel;
  -[HULegibilityLabel setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[UILabel setNeedsLayout](self->_lookasideLabel, "setNeedsLayout");
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_lookasideLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HULegibilityLabel;
  -[HULegibilityLabel layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_isDirty)
  {
    -[HULegibilityLabel _updateLegibilityView](self, "_updateLegibilityView");
    self->_isDirty = 0;
  }
}

- (void)setStrength:(double)a3
{
  if ((NACGFloatEqualToFloat() & 1) == 0)
  {
    self->_strength = a3;
    -[_UILegibilityView setStrength:](self->_legibilityView, "setStrength:", a3);
    -[HULegibilityLabel _markOurselfDirty](self, "_markOurselfDirty");
  }
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  id v6;

  p_legibilitySettings = &self->_legibilitySettings;
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  v6 = a3;
  -[_UILegibilityView updateForChangedSettings:](self->_legibilityView, "updateForChangedSettings:", *p_legibilitySettings);

}

- (void)_markOurselfDirty
{
  self->_isDirty = 1;
  -[HULegibilityLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateLabelForLegibilitySettings
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[UILabel attributedText](self->_lookasideLabel, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "mutableCopy");

  v4 = objc_msgSend(v7, "length");
  -[HULegibilityLabel textColor](self, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CEA0A0];
  if (v5)
    objc_msgSend(v7, "addAttribute:value:range:", v6, v5, 0, v4);
  else
    objc_msgSend(v7, "removeAttribute:range:", v6, 0, v4);
  -[UILabel setAttributedText:](self->_lookasideLabel, "setAttributedText:", v7);

}

- (void)_updateLegibilityView
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  double MinX;
  CGFloat v36;
  CGFloat v37;
  double MinY;
  CGFloat v39;
  double v40;
  double v41;
  double MaxY;
  double v43;
  void *v44;
  void *v45;
  NSArray *legibilityConstraints;
  _UILegibilityView *legibilityView;
  _UILegibilityView *v48;
  _UILegibilityView *v49;
  double MaxX;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  id v60[9];
  id location;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  -[HULegibilityLabel _updateLabelForLegibilitySettings](self, "_updateLabelForLegibilitySettings");
  -[HULegibilityLabel bounds](self, "bounds");
  x = v62.origin.x;
  y = v62.origin.y;
  width = v62.size.width;
  height = v62.size.height;
  CGRectGetWidth(v62);
  if ((NACGFloatIsZero() & 1) == 0)
  {
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    CGRectGetHeight(v63);
    if ((NACGFloatIsZero() & 1) == 0)
    {
      v58 = y;
      v56 = x;
      -[HULegibilityLabel traitCollection](self, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayScale");
      v54 = v8;

      -[HULegibilityLabel characterOverflowInsets](self, "characterOverflowInsets");
      v52 = v9;
      v53 = v10;
      v59 = v11;
      v57 = v12;
      -[UILabel bounds](self->_lookasideLabel, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_lookasideLabel, "textRectForBounds:limitedToNumberOfLines:", -[UILabel numberOfLines](self->_lookasideLabel, "numberOfLines"), v13, v15, v17, v19);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v64.origin.x = v14;
      v64.origin.y = v16;
      v64.size.width = v18;
      v29 = v22;
      v64.size.height = v20;
      v30 = v28;
      v31 = CGRectGetHeight(v64);
      v55 = v29;
      v65.origin.x = v29;
      v65.origin.y = v24;
      v65.size.width = v26;
      v65.size.height = v30;
      v32 = (v31 - CGRectGetHeight(v65)) * 0.5;
      if (-[UILabel adjustsFontSizeToFitWidth](self->_lookasideLabel, "adjustsFontSizeToFitWidth"))
      {
        v33 = v56;
        v34 = v58;
      }
      else
      {
        v66.origin.x = v29;
        v66.origin.y = v32;
        v66.size.width = v26;
        v66.size.height = v30;
        MinX = CGRectGetMinX(v66);
        v67.origin.x = v56;
        v67.origin.y = v58;
        v67.size.width = width;
        v67.size.height = height;
        v59 = v59 + MinX - CGRectGetMinX(v67);
        v68.origin.x = v29;
        v68.origin.y = v32;
        v68.size.width = v26;
        v68.size.height = v30;
        MaxX = CGRectGetMaxX(v68);
        v33 = v56;
        v69.origin.x = v56;
        v34 = v58;
        v69.origin.y = v58;
        v69.size.width = width;
        v69.size.height = height;
        v57 = v57 - (MaxX - CGRectGetMaxX(v69));
      }
      v51 = v30;
      v70.origin.x = v55;
      v70.origin.y = v32;
      v70.size.width = v26;
      v70.size.height = v30;
      v36 = v26;
      v37 = v32;
      MinY = CGRectGetMinY(v70);
      v71.origin.x = v33;
      v71.origin.y = v34;
      v71.size.width = width;
      v71.size.height = height;
      v39 = CGRectGetMinY(v71);
      v72.size.height = v51;
      v40 = v52 + MinY - v39;
      v72.origin.x = v55;
      v72.origin.y = v37;
      v72.size.width = v36;
      v41 = v40;
      MaxY = CGRectGetMaxY(v72);
      v73.origin.x = v33;
      v73.origin.y = v34;
      v73.size.width = width;
      v73.size.height = height;
      v43 = v53 - (MaxY - CGRectGetMaxY(v73));
      HUSizeRoundForScale(width - (v57 + v59), height - (v41 + v43), v54);
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "scale");
      objc_copyWeak(v60, &location);
      v60[1] = *(id *)&v41;
      v60[2] = *(id *)&v59;
      v60[3] = *(id *)&v43;
      v60[4] = *(id *)&v57;
      v60[5] = *(id *)&v56;
      v60[6] = *(id *)&v58;
      v60[7] = *(id *)&width;
      v60[8] = *(id *)&height;
      _UIGraphicsDrawIntoImageContextWithOptions();
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      legibilityConstraints = self->_legibilityConstraints;
      self->_legibilityConstraints = 0;

      -[_UILegibilityView removeFromSuperview](self->_legibilityView, "removeFromSuperview");
      legibilityView = self->_legibilityView;
      self->_legibilityView = 0;

      v48 = (_UILegibilityView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADF8]), "initWithSettings:strength:image:shadowImage:options:", self->_legibilitySettings, v45, 0, self->_options, self->_strength);
      v49 = self->_legibilityView;
      self->_legibilityView = v48;

      -[_UILegibilityView setFrame:](self->_legibilityView, "setFrame:", v56 + v59, v58 + v41, width - (v57 + v59), height - (v41 + v43));
      -[HULegibilityLabel addSubview:](self, "addSubview:", self->_legibilityView);

      objc_destroyWeak(v60);
      objc_destroyWeak(&location);
    }
  }
}

void __42__HULegibilityLabel__updateLegibilityView__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  CGContext *CurrentContext;
  CGAffineTransform v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, -*(double *)(a1 + 48), -*(double *)(a1 + 40));
  CGContextGetCTM(&v4, CurrentContext);
  CGContextSetBaseCTM();
  objc_msgSend(WeakRetained[52], "drawRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));

}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_textColorOverride, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_firstBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_legibilityConstraints, 0);
  objc_storeStrong((id *)&self->_legibilityView, 0);
  objc_storeStrong((id *)&self->_lookasideLabel, 0);
}

@end
