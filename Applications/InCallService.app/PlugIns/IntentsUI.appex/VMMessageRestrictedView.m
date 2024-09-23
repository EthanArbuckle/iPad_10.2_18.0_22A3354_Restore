@implementation VMMessageRestrictedView

- (void)commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMMessageRestrictedView;
  -[VMMessageRestrictedView commonInit](&v3, "commonInit");
  -[VMMessageRestrictedView loadView](self, "loadView");
}

- (void)loadView
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
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
  _QWORD v29[4];

  v3 = objc_alloc_init((Class)UILabel);
  -[VMMessageRestrictedView setTitleLabel:](self, "setTitleLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUISubheadlineShortFont](UIFont, "telephonyUISubheadlineShortFont"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setNumberOfLines:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[VMMessageRestrictedView _updateTextColor](self, "_updateTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabel](self, "titleLabel"));
  -[VMMessageRestrictedView addSubview:](self, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabel](self, "titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView topAnchor](self, "topAnchor"));
  -[VMMessageRestrictedView titleLabelBaselineAnchorLayoutConstraintConstant](self, "titleLabelBaselineAnchorLayoutConstraintConstant");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11));
  -[VMMessageRestrictedView setTitleLabelFirstBaselineAnchorLayoutConstraint:](self, "setTitleLabelFirstBaselineAnchorLayoutConstraint:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabel](self, "titleLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView bottomAnchor](self, "bottomAnchor"));
  -[VMMessageRestrictedView titleLabelBaselineAnchorLayoutConstraintConstant](self, "titleLabelBaselineAnchorLayoutConstraintConstant");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -v16));
  -[VMMessageRestrictedView setTitleLabelLastBaselineAnchorLayoutConstraint:](self, "setTitleLabelLastBaselineAnchorLayoutConstraint:", v17);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabel](self, "titleLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView leadingAnchor](self, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  v29[0] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabel](self, "titleLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView trailingAnchor](self, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v29[1] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabelFirstBaselineAnchorLayoutConstraint](self, "titleLabelFirstBaselineAnchorLayoutConstraint"));
  v29[2] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabelLastBaselineAnchorLayoutConstraint](self, "titleLabelLastBaselineAnchorLayoutConstraint"));
  v29[3] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

}

- (void)setLocalizedAttributedRestrictedAlertTitle:(id)a3
{
  void *v5;
  NSAttributedString *v6;

  v6 = (NSAttributedString *)a3;
  if (self->_localizedAttributedRestrictedAlertTitle != v6)
  {
    objc_storeStrong((id *)&self->_localizedAttributedRestrictedAlertTitle, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabel](self, "titleLabel"));
    objc_msgSend(v5, "setAttributedText:", v6);

  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMMessageRestrictedView;
  -[VMMessageRestrictedView tintColorDidChange](&v3, "tintColorDidChange");
  -[VMMessageRestrictedView _updateTextColor](self, "_updateTextColor");
}

- (void)_updateTextColor
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v5));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageRestrictedView titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setTextColor:", v3);

}

- (double)titleLabelBaselineAnchorLayoutConstraintConstant
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUISubheadlineShortFont](UIFont, "telephonyUISubheadlineShortFont"));
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = ceil(v3);

  return v4;
}

- (NSAttributedString)localizedAttributedRestrictedAlertTitle
{
  return self->_localizedAttributedRestrictedAlertTitle;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSLayoutConstraint)titleLabelFirstBaselineAnchorLayoutConstraint
{
  return self->_titleLabelFirstBaselineAnchorLayoutConstraint;
}

- (void)setTitleLabelFirstBaselineAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)titleLabelLastBaselineAnchorLayoutConstraint
{
  return self->_titleLabelLastBaselineAnchorLayoutConstraint;
}

- (void)setTitleLabelLastBaselineAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelLastBaselineAnchorLayoutConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelLastBaselineAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_localizedAttributedRestrictedAlertTitle, 0);
}

@end
