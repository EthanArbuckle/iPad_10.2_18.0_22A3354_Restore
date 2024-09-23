@implementation HUTitleDescriptionContentView

- (HUTitleDescriptionContentView)initWithFrame:(CGRect)a3
{
  HUTitleDescriptionContentView *v3;
  HUTitleDescriptionContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUTitleDescriptionContentView;
  v3 = -[HUTitleDescriptionContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUTitleDescriptionContentView _setupStackView](v3, "_setupStackView");
    -[HUTitleDescriptionContentView _setupTitleLabel](v4, "_setupTitleLabel");
    -[HUTitleDescriptionContentView _setupDescriptionLabel](v4, "_setupDescriptionLabel");
  }
  return v4;
}

- (void)setTitleText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_titleText, a3);
  v5 = a3;
  -[HUTitleDescriptionContentView titleLabel](self, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView _updateLabel:withContent:](self, "_updateLabel:withContent:", v6, v5);

}

- (void)setTitleTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUTitleDescriptionContentView titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)setDescriptionText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_descriptionText, a3);
  v5 = a3;
  -[HUTitleDescriptionContentView descriptionLabel](self, "descriptionLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView _updateLabel:withContent:](self, "_updateLabel:withContent:", v6, v5);

}

- (void)setDescriptionTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUTitleDescriptionContentView descriptionLabel](self, "descriptionLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)setDisabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    if (a3)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleDescriptionContentView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

    -[HUTitleDescriptionContentView titleLabel](self, "titleLabel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HUTitleDescriptionContentView titleText](self, "titleText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleDescriptionContentView _updateLabel:withContent:](self, "_updateLabel:withContent:", v7, v6);

  }
}

- (UIFont)titleFont
{
  void *v2;
  void *v3;

  -[HUTitleDescriptionContentView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setTitleFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUTitleDescriptionContentView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[HUTitleDescriptionContentView titleLabel](self, "titleLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView titleText](self, "titleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView _updateLabel:withContent:](self, "_updateLabel:withContent:", v7, v6);

}

- (UIFont)descriptionFont
{
  void *v2;
  void *v3;

  -[HUTitleDescriptionContentView descriptionLabel](self, "descriptionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setDescriptionFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUTitleDescriptionContentView descriptionLabel](self, "descriptionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[HUTitleDescriptionContentView descriptionLabel](self, "descriptionLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView descriptionText](self, "descriptionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView _updateLabel:withContent:](self, "_updateLabel:withContent:", v7, v6);

}

- (void)_setupStackView
{
  UIStackView *v3;
  UIStackView *stackView;
  double v5;
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
  _QWORD v30[7];

  v30[5] = *MEMORY[0x1E0C80C00];
  if (self->_stackView)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTitleDescriptionContentView.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_stackView"));

  }
  v3 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0CEA9E0]);
  stackView = self->_stackView;
  self->_stackView = v3;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 1);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 2.0);
  -[HUTitleDescriptionContentView addSubview:](self, "addSubview:", self->_stackView);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v5) = 1148846080;
  -[UIStackView setContentHuggingPriority:forAxis:](self->_stackView, "setContentHuggingPriority:forAxis:", 1, v5);
  v20 = (void *)MEMORY[0x1E0CB3718];
  -[HUTitleDescriptionContentView stackView](self, "stackView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView leadingAnchor](self, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  -[HUTitleDescriptionContentView stackView](self, "stackView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView trailingAnchor](self, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v22;
  -[HUTitleDescriptionContentView stackView](self, "stackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView topAnchor](self, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v6;
  -[HUTitleDescriptionContentView stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView bottomAnchor](self, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v10;
  -[HUTitleDescriptionContentView stackView](self, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView centerYAnchor](self, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v15);

}

- (void)_setupTitleLabel
{
  id v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  double v7;
  double v8;
  void *v9;
  UILabel *v10;
  void *v12;
  id v13;

  if (self->_titleLabel)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTitleDescriptionContentView.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_titleLabel"));

  }
  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
  LODWORD(v7) = 1144766464;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  LODWORD(v8) = 1132134400;
  -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v8);
  -[HUTitleDescriptionContentView stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertArrangedSubview:atIndex:", self->_titleLabel, 0);

  v10 = self->_titleLabel;
  -[HUTitleDescriptionContentView titleText](self, "titleText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView _updateLabel:withContent:](self, "_updateLabel:withContent:", v10, v13);

}

- (void)_setupDescriptionLabel
{
  id v3;
  UILabel *v4;
  UILabel *descriptionLabel;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  UILabel *v10;
  void *v12;
  id v13;

  if (self->_descriptionLabel)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTitleDescriptionContentView.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_descriptionLabel"));

  }
  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v4;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_descriptionLabel, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_descriptionLabel, "setTextColor:", v7);

  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 0);
  LODWORD(v8) = 1144766464;
  -[UILabel setContentHuggingPriority:forAxis:](self->_descriptionLabel, "setContentHuggingPriority:forAxis:", 1, v8);
  -[HUTitleDescriptionContentView stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addArrangedSubview:", self->_descriptionLabel);

  v10 = self->_descriptionLabel;
  -[HUTitleDescriptionContentView descriptionText](self, "descriptionText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTitleDescriptionContentView _updateLabel:withContent:](self, "_updateLabel:withContent:", v10, v13);

}

- (void)_updateLabel:(id)a3 withContent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14[0] = *MEMORY[0x1E0CEA098];
  objc_msgSend(v5, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v14[1] = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(v5, "textColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "prefersDynamicString"))
  {
    objc_msgSend(v5, "bounds");
    objc_msgSend(v6, "dynamicStringForSize:attributes:", v9, v10, v11);
  }
  else
  {
    objc_msgSend(v6, "stringWithAttributes:", v9);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v12);

  objc_msgSend(v5, "attributedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", objc_msgSend(v13, "length") == 0);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (HFStringGenerator)titleText
{
  return self->_titleText;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (HFStringGenerator)descriptionText
{
  return self->_descriptionText;
}

- (UIColor)descriptionTextColor
{
  return self->_descriptionTextColor;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (NSArray)verticalLabelConstraints
{
  return self->_verticalLabelConstraints;
}

- (void)setVerticalLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_verticalLabelConstraints, a3);
}

- (NSArray)horizontalLabelConstraints
{
  return self->_horizontalLabelConstraints;
}

- (void)setHorizontalLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalLabelConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalLabelConstraints, 0);
  objc_storeStrong((id *)&self->_verticalLabelConstraints, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_descriptionTextColor, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
