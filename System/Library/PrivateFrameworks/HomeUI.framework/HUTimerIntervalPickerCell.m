@implementation HUTimerIntervalPickerCell

- (UILabel)textLabel
{
  UILabel *textLabel;
  id v4;
  void *v5;
  double v6;
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
  id v18;
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  textLabel = self->_textLabel;
  if (!textLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HUTimerIntervalPickerCell setTextLabel:](self, "setTextLabel:", v5);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v6) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_textLabel, "setContentHuggingPriority:forAxis:", 0, v6);
    LODWORD(v7) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_textLabel, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    -[HUTimerIntervalPickerCell addSubview:](self, "addSubview:", self->_textLabel);
    if (-[HUTimerIntervalPickerCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)v8 = 4.0;
    else
      v8 = 10.0;
    -[UILabel centerYAnchor](self->_textLabel, "centerYAnchor", MEMORY[0x1E0CB3718]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerIntervalPickerCell centerYAnchor](self, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    -[UILabel heightAnchor](self->_textLabel, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToConstant:", 32.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    -[UILabel leadingAnchor](self->_textLabel, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerIntervalPickerCell leadingAnchor](self, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v16);

    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (NSLayoutConstraint)textLabelLeadingConstraint
{
  return self->_textLabelLeadingConstraint;
}

- (void)setTextLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textLabelLeadingConstraint, a3);
}

- (NSLayoutConstraint)textLabelTrailingConstraint
{
  return self->_textLabelTrailingConstraint;
}

- (void)setTextLabelTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textLabelTrailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
