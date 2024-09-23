@implementation HACCBatteryView

- (HACCBatteryView)initWithFrame:(CGRect)a3
{
  HACCBatteryView *v3;
  UILabel *v4;
  UILabel *sideLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  UILabel *valueLabel;
  UILabel *v20;
  void *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _UIBatteryView *batteryView;
  _UIBatteryView *v30;
  void *v31;
  _UIBatteryView *v32;
  void *v33;
  _UIBatteryView *v34;
  void *v35;
  NSNumberFormatter *v36;
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v46.receiver = self;
  v46.super_class = (Class)HACCBatteryView;
  v3 = -[HACCBatteryView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    sideLabel = v3->_sideLabel;
    v3->_sideLabel = v4;

    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE1F0], 32770, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *MEMORY[0x24BEBB620];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB5E8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v3->_sideLabel;
    v11 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v9, "pointSize");
    objc_msgSend(v11, "fontWithDescriptor:size:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v12);

    v13 = v3->_sideLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setTextAlignment:](v3->_sideLabel, "setTextAlignment:", 2);
    -[UILabel setClipsToBounds:](v3->_sideLabel, "setClipsToBounds:", 0);
    -[HACCBatteryView addSubview:](v3, "addSubview:", v3->_sideLabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_sideLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_sideLabel"), v3->_sideLabel, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_sideLabel]|"), 0, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCBatteryView addConstraints:](v3, "addConstraints:", v17);

    v18 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = v18;

    v20 = v3->_valueLabel;
    v21 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v9, "pointSize");
    objc_msgSend(v21, "fontWithDescriptor:size:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v22);

    v23 = v3->_valueLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v23, "setTextColor:", v24);

    -[UILabel setTextAlignment:](v3->_valueLabel, "setTextAlignment:", 0);
    -[UILabel setClipsToBounds:](v3->_valueLabel, "setClipsToBounds:", 0);
    -[HACCBatteryView addSubview:](v3, "addSubview:", v3->_valueLabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_valueLabel"), v3->_valueLabel, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_valueLabel]|"), 0, 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCBatteryView addConstraints:](v3, "addConstraints:", v27);

    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB88]), "initWithSizeCategory:", 0);
    batteryView = v3->_batteryView;
    v3->_batteryView = (_UIBatteryView *)v28;

    v30 = v3->_batteryView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBatteryView setFillColor:](v30, "setFillColor:", v31);

    v32 = v3->_batteryView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBatteryView setBodyColor:](v32, "setBodyColor:", v33);

    v34 = v3->_batteryView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBatteryView setPinColor:](v34, "setPinColor:", v35);

    -[_UIBatteryView setChargePercent:](v3->_batteryView, "setChargePercent:", 1.0);
    -[HACCBatteryView addSubview:](v3, "addSubview:", v3->_batteryView);
    -[_UIBatteryView setTranslatesAutoresizingMaskIntoConstraints:](v3->_batteryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v36 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    numberFormatter = v3->_numberFormatter;
    v3->_numberFormatter = v36;

    -[NSNumberFormatter setNumberStyle:](v3->_numberFormatter, "setNumberStyle:", 3);
    -[NSNumberFormatter setMaximumFractionDigits:](v3->_numberFormatter, "setMaximumFractionDigits:", 0);
    v38 = v3->_numberFormatter;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](v38, "stringFromNumber:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setNotANumberSymbol:](v38, "setNotANumberSymbol:", v40);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_batteryView, 10, 0, v3->_valueLabel, 10, 1.0, 0.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCBatteryView addConstraint:](v3, "addConstraint:", v41);

    v42 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_sideLabel, _valueLabel, _batteryView"), v3->_sideLabel, v3->_valueLabel, v3->_batteryView, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_sideLabel]-(>=6.0)-[_valueLabel]-(6.0)-[_batteryView]|"), 0, 0, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCBatteryView addConstraints:](v3, "addConstraints:", v44);

  }
  return v3;
}

- (void)setValue:(double)a3 forEar:(int)a4
{
  UILabel *sideLabel;
  void *v7;
  UILabel *valueLabel;
  NSNumberFormatter *numberFormatter;
  void *v10;
  void *v11;

  switch(a4)
  {
    case 0:
    case 6:
      -[UILabel setText:](self->_sideLabel, "setText:", &stru_24DD62430);
      break;
    case 2:
      sideLabel = self->_sideLabel;
      goto LABEL_5;
    case 4:
      sideLabel = self->_sideLabel;
LABEL_5:
      hearingLocString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](sideLabel, "setText:", v7);

      break;
    default:
      break;
  }
  valueLabel = self->_valueLabel;
  numberFormatter = self->_numberFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](valueLabel, "setText:", v11);

  -[_UIBatteryView setChargePercent:](self->_batteryView, "setChargePercent:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_sideLabel, 0);
}

@end
