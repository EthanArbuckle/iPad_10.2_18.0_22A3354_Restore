@implementation MCProfileTitlePageOrganizationCell

- (MCProfileTitlePageOrganizationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCProfileTitlePageOrganizationCell *v4;
  MCProfileTitlePageOrganizationCell *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UILabel *organizationLabel;
  void *v10;
  uint64_t v11;
  UILabel *appleIDLabel;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  UILabel *organizationValueLabel;
  uint64_t v17;
  UILabel *appleIDValueLabel;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIStackView *v24;
  UIStackView *labelStackView;
  UIStackView *v26;
  void *v27;
  objc_super v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)MCProfileTitlePageOrganizationCell;
  v4 = -[MCProfileTitlePageOrganizationCell initWithStyle:reuseIdentifier:](&v29, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MCProfileTitlePageOrganizationCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[MCProfileTitlePageOrganizationCell contentView](v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClipsToBounds:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageOrganizationCell setBackgroundColor:](v5, "setBackgroundColor:", v7);

    -[MCProfileTitlePageOrganizationCell _createLabelLabel](v5, "_createLabelLabel");
    v8 = objc_claimAutoreleasedReturnValue();
    organizationLabel = v5->_organizationLabel;
    v5->_organizationLabel = (UILabel *)v8;

    MCUILocalizedString(CFSTR("ORGANIZATION_LABEL_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5->_organizationLabel, "setText:", v10);

    -[MCProfileTitlePageOrganizationCell _createLabelLabel](v5, "_createLabelLabel");
    v11 = objc_claimAutoreleasedReturnValue();
    appleIDLabel = v5->_appleIDLabel;
    v5->_appleIDLabel = (UILabel *)v11;

    if (_os_feature_enabled_impl())
      v13 = CFSTR("APPLE_ACCOUNT_LABEL_TITLE");
    else
      v13 = CFSTR("APPLE_ID_LABEL_TITLE");
    MCUILocalizedString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5->_appleIDLabel, "setText:", v14);

    -[MCProfileTitlePageOrganizationCell _createValueLabel](v5, "_createValueLabel");
    v15 = objc_claimAutoreleasedReturnValue();
    organizationValueLabel = v5->_organizationValueLabel;
    v5->_organizationValueLabel = (UILabel *)v15;

    -[MCProfileTitlePageOrganizationCell _createValueLabel](v5, "_createValueLabel");
    v17 = objc_claimAutoreleasedReturnValue();
    appleIDValueLabel = v5->_appleIDValueLabel;
    v5->_appleIDValueLabel = (UILabel *)v17;

    v32[0] = v5->_organizationLabel;
    v32[1] = v5->_organizationValueLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageOrganizationCell _createHorizontalStackWithViews:](v5, "_createHorizontalStackWithViews:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = v5->_appleIDLabel;
    v31[1] = v5->_appleIDValueLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageOrganizationCell _createHorizontalStackWithViews:](v5, "_createHorizontalStackWithViews:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = v20;
    v30[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageOrganizationCell _createVerticalStackWithViews:](v5, "_createVerticalStackWithViews:", v23);
    v24 = (UIStackView *)objc_claimAutoreleasedReturnValue();

    labelStackView = v5->_labelStackView;
    v5->_labelStackView = v24;
    v26 = v24;

    -[MCProfileTitlePageOrganizationCell contentView](v5, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v26);

    -[MCProfileTitlePageOrganizationCell _updateConstraintWithStack:](v5, "_updateConstraintWithStack:", v26);
  }
  return v5;
}

- (void)_updateConstraintWithStack:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("stack");
  v14[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("|-%f-[stack]-%f-|"), 0x4034000000000000, 0x4034000000000000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", v8, 0, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[stack]-0-|"), 0, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCProfileTitlePageOrganizationCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConstraints:", v9);

  -[MCProfileTitlePageOrganizationCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConstraints:", v10);

}

- (id)_createLabelLabel
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 17.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v4);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (id)_createValueLabel
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 17.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  LODWORD(v4) = 1132068864;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 0, v4);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (id)_createHorizontalStackWithViews:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  double v6;

  v3 = (objc_class *)MEMORY[0x1E0CEA9E0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArrangedSubviews:", v4);

  objc_msgSend(v5, "setSpacing:", 5.0);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setAxis:", 0);
  objc_msgSend(v5, "setAlignment:", 3);
  objc_msgSend(v5, "setDistribution:", 4);
  LODWORD(v6) = 1132068864;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  return v5;
}

- (id)_createVerticalStackWithViews:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CEA9E0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArrangedSubviews:", v4);

  objc_msgSend(v5, "setAxis:", 1);
  objc_msgSend(v5, "setAlignment:", 3);
  objc_msgSend(v5, "setDistribution:", 1);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setSpacing:", 10.0);
  return v5;
}

- (void)setOrganizationName:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_organizationName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_organizationName, a3);
    -[MCProfileTitlePageOrganizationCell organizationValueLabel](self, "organizationValueLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (void)setAppleID:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_appleID, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_appleID, a3);
    -[MCProfileTitlePageOrganizationCell appleIDValueLabel](self, "appleIDValueLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (void)updateProgressWithTranslationDistance:(double)a3 referenceDistance:(double)a4 isScrolling:(BOOL)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[MCProfileTitlePageOrganizationCell bounds](self, "bounds", a5, a3, a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13 + a3;
  -[MCProfileTitlePageOrganizationCell contentView](self, "contentView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v14, v10, v12);

}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (UILabel)organizationLabel
{
  return self->_organizationLabel;
}

- (void)setOrganizationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_organizationLabel, a3);
}

- (UILabel)appleIDLabel
{
  return self->_appleIDLabel;
}

- (void)setAppleIDLabel:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDLabel, a3);
}

- (UILabel)organizationValueLabel
{
  return self->_organizationValueLabel;
}

- (void)setOrganizationValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_organizationValueLabel, a3);
}

- (UILabel)appleIDValueLabel
{
  return self->_appleIDValueLabel;
}

- (void)setAppleIDValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDValueLabel, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_appleIDValueLabel, 0);
  objc_storeStrong((id *)&self->_organizationValueLabel, 0);
  objc_storeStrong((id *)&self->_appleIDLabel, 0);
  objc_storeStrong((id *)&self->_organizationLabel, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
}

@end
