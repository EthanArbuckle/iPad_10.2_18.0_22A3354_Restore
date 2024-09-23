@implementation HUTemperatureUnitControlView

- (HUTemperatureUnitControlView)initWithFrame:(CGRect)a3
{
  HUTemperatureUnitControlView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  uint64_t v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *detailLabel;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUTemperatureUnitControlView;
  v3 = -[HUTemperatureUnitControlView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = *MEMORY[0x1E0CEB538];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v7);

    _HULocalizedStringWithDefaultValue(CFSTR("HUTemperatureUnitTitle"), CFSTR("HUTemperatureUnitTitle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_titleLabel, "setText:", v8);

    -[HUTemperatureUnitControlView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_detailLabel, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_detailLabel, "setTextColor:", v12);

    -[HUTemperatureUnitControlView addSubview:](v3, "addSubview:", v3->_detailLabel);
  }
  return v3;
}

- (void)updateConstraints
{
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTemperatureUnitControlView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTemperatureUnitControlView leadingAnchor](self, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[HUTemperatureUnitControlView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTemperatureUnitControlView topAnchor](self, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  -[HUTemperatureUnitControlView titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTemperatureUnitControlView bottomAnchor](self, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[HUTemperatureUnitControlView detailLabel](self, "detailLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTemperatureUnitControlView trailingAnchor](self, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  -[HUTemperatureUnitControlView detailLabel](self, "detailLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTemperatureUnitControlView topAnchor](self, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  -[HUTemperatureUnitControlView detailLabel](self, "detailLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = objc_claimAutoreleasedReturnValue();
  -[HUTemperatureUnitControlView bottomAnchor](self, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  -[HUTemperatureUnitControlView labelConstraints](self, "labelConstraints");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = objc_msgSend(v3, "isEqualToArray:", v28);

  if ((v25 & 1) == 0)
  {
    -[HUTemperatureUnitControlView labelConstraints](self, "labelConstraints");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E0CB3718];
      -[HUTemperatureUnitControlView labelConstraints](self, "labelConstraints");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "deactivateConstraints:", v31);

    }
    -[HUTemperatureUnitControlView setLabelConstraints:](self, "setLabelConstraints:", v3);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
  }
  v32.receiver = self;
  v32.super_class = (Class)HUTemperatureUnitControlView;
  -[HUTemperatureUnitControlView updateConstraints](&v32, sel_updateConstraints);

}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)value
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HUTemperatureUnitControlView currentUnit](self, "currentUnit"));
}

- (void)setValue:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    -[HUTemperatureUnitControlView setCurrentUnit:](self, "setCurrentUnit:", objc_msgSend(a3, "integerValue"));
    -[HUTemperatureUnitControlView _unitStringForCurrentUnit](self, "_unitStringForCurrentUnit");
  }
  else
  {
    HFLocalizedString();
  }
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTemperatureUnitControlView detailLabel](self, "detailLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

}

- (void)setDisabled:(BOOL)a3
{
  void *v4;
  id v5;

  self->_viewDisabled = a3;
  if (a3)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTemperatureUnitControlView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (id)_unitStringForCurrentUnit
{
  int64_t v2;
  __CFString *v3;
  void *v4;

  v2 = -[HUTemperatureUnitControlView currentUnit](self, "currentUnit");
  if (v2)
  {
    if (v2 != 1)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("HUTemperatureFahrenheitUnitTitle");
  }
  else
  {
    v3 = CFSTR("HUTemperatureCelsiusUnitTitle");
  }
  _HULocalizedStringWithDefaultValue(v3, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (HUControlViewDelegate)delegate
{
  return (HUControlViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)canBeHighlighted
{
  return self->_canBeHighlighted;
}

- (void)setCanBeHighlighted:(BOOL)a3
{
  self->_canBeHighlighted = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (int64_t)currentUnit
{
  return self->_currentUnit;
}

- (void)setCurrentUnit:(int64_t)a3
{
  self->_currentUnit = a3;
}

- (BOOL)viewDisabled
{
  return self->_viewDisabled;
}

- (void)setViewDisabled:(BOOL)a3
{
  self->_viewDisabled = a3;
}

- (NSArray)labelConstraints
{
  return self->_labelConstraints;
}

- (void)setLabelConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
