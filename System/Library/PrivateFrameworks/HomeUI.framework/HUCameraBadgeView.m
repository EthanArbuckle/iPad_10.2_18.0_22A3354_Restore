@implementation HUCameraBadgeView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUCameraBadgeView)initWithSize:(unint64_t)a3
{
  HUCameraBadgeView *v4;
  HUCameraBadgeView *v5;
  uint64_t v6;
  _UILegibilitySettings *legibilitySettings;
  HULegibilityLabel *v8;
  _UILegibilitySettings *v9;
  double v10;
  void *v11;
  uint64_t v12;
  HULegibilityLabel *label;
  void *v14;
  double v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HUCameraBadgeView;
  v4 = -[HUCameraBadgeView init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_size = a3;
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    legibilitySettings = v5->_legibilitySettings;
    v5->_legibilitySettings = (_UILegibilitySettings *)v6;

    v8 = [HULegibilityLabel alloc];
    v9 = v5->_legibilitySettings;
    v10 = *MEMORY[0x1E0CEC0C0];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 6.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HULegibilityLabel initWithSettings:strength:text:font:options:](v8, "initWithSettings:strength:text:font:options:", v9, &stru_1E6F60E80, v11, *MEMORY[0x1E0CEC0E0], v10);
    label = v5->_label;
    v5->_label = (HULegibilityLabel *)v12;

    -[HULegibilityLabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULegibilityLabel setTextColor:](v5->_label, "setTextColor:", v14);

    v15 = 15.0;
    if (!v5->_size)
      v15 = 13.0;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULegibilityLabel setFont:](v5->_label, "setFont:", v16);

    -[HUCameraBadgeView addSubview:](v5, "addSubview:", v5->_label);
  }
  return v5;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  objc_super v32;
  _QWORD v33[4];
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  -[HUCameraBadgeView staticConstraints](self, "staticConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HUCameraBadgeView heightAnchor](self, "heightAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 27.0;
    if (!self->_size)
      v6 = 24.0;
    objc_msgSend(v4, "constraintGreaterThanOrEqualToConstant:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraBadgeView setStaticConstraints:](self, "setStaticConstraints:", v8);

    v9 = (void *)MEMORY[0x1E0CB3718];
    -[HUCameraBadgeView staticConstraints](self, "staticConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v10);

  }
  -[HUCameraBadgeView labelConstraints](self, "labelConstraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (self->_size)
      v12 = 11.0;
    else
      v12 = 8.0;
    -[HUCameraBadgeView label](self, "label");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraBadgeView leadingAnchor](self, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v28;
    -[HUCameraBadgeView label](self, "label");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraBadgeView trailingAnchor](self, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, -v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v24;
    -[HUCameraBadgeView label](self, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraBadgeView centerYAnchor](self, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v16;
    -[HUCameraBadgeView label](self, "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraBadgeView heightAnchor](self, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraBadgeView setLabelConstraints:](self, "setLabelConstraints:", v21);

    v22 = (void *)MEMORY[0x1E0CB3718];
    -[HUCameraBadgeView labelConstraints](self, "labelConstraints");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v23);

  }
  v32.receiver = self;
  v32.super_class = (Class)HUCameraBadgeView;
  -[HUCameraBadgeView updateConstraints](&v32, sel_updateConstraints);
}

- (void)setLabelText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUCameraBadgeView label](self, "label");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)labelText
{
  void *v2;
  void *v3;

  -[HUCameraBadgeView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)size
{
  return self->_size;
}

- (HULegibilityLabel)label
{
  return self->_label;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (UIVisualEffectView)vibrancyEffectView
{
  return self->_vibrancyEffectView;
}

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setStaticConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_staticConstraints, a3);
}

- (NSArray)labelConstraints
{
  return self->_labelConstraints;
}

- (void)setLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_labelConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
