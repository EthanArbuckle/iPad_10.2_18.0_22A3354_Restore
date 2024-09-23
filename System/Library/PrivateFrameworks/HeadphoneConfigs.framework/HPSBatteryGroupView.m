@implementation HPSBatteryGroupView

- (HPSBatteryGroupView)initWithFrame:(CGRect)a3 batteryPercent:(unsigned __int8)a4 isCharging:(BOOL)a5 glyph:(id)a6 batteryLevelDescription:(id)a7
{
  _BOOL8 v9;
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  HPSBatteryGroupView *v18;
  HPSBatteryGroupView *v19;
  objc_super v21;

  v9 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HPSBatteryGroupView;
  v18 = -[HPSBatteryGroupView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v19 = v18;
  if (v18)
  {
    v18->batteryPercentNumber = a4;
    objc_storeStrong((id *)&v18->batteryGlyphView, a6);
    objc_storeStrong((id *)&v19->batteryLevelDescription, a7);
    -[HPSBatteryGroupView createBatteryGroupView:](v19, "createBatteryGroupView:", v9);
  }

  return v19;
}

- (void)createBatteryGroupView:(BOOL)a3
{
  _BOOL8 v3;
  HPSBatteryIconView *v5;
  UILabel *v6;
  UILabel *batteryPercentLabel;
  UIImageView *batteryGlyphView;
  id v9;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v3 = a3;
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(HPSBatteryIconView);
  objc_storeStrong((id *)&self->_batteryIconView, v5);
  -[HPSBatteryIconView setIsCharging:](v5, "setIsCharging:", v3);
  -[HPSBatteryIconView setContentMode:](v5, "setContentMode:", 1);
  -[HPSBatteryIconView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  batteryPercentLabel = self->batteryPercentLabel;
  self->batteryPercentLabel = v6;

  -[UILabel setContentMode:](self->batteryPercentLabel, "setContentMode:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->batteryPercentLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->batteryPercentLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[HPSBatteryGroupView setChargePercent:](self, "setChargePercent:", self->batteryPercentNumber);
  -[HPSBatteryGroupView addSubview:](self, "addSubview:", v5);
  batteryGlyphView = self->batteryGlyphView;
  if (batteryGlyphView)
  {
    -[UIImageView setContentMode:](batteryGlyphView, "setContentMode:", 1);
    v9 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v9, "setAxis:", 0);
    objc_msgSend(v9, "setAlignment:", 3);
    objc_msgSend(v9, "setDistribution:", 2);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setSemanticContentAttribute:", 3);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->batteryGlyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addArrangedSubview:", self->batteryGlyphView);
    objc_msgSend(v9, "addArrangedSubview:", self->batteryPercentLabel);
    -[HPSBatteryGroupView addSubview:](self, "addSubview:", v9);
    objc_msgSend(v9, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 20.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v11);

    -[UIImageView heightAnchor](self->batteryGlyphView, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel heightAnchor](self->batteryPercentLabel, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v14);

    objc_msgSend(v9, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel heightAnchor](self->batteryPercentLabel, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v17);

    -[HPSBatteryIconView topAnchor](v5, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryGroupView topAnchor](self, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v20);

    -[HPSBatteryIconView centerXAnchor](v5, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryGroupView centerXAnchor](self, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v23);

    objc_msgSend(v9, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryIconView centerXAnchor](v5, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v26);

    objc_msgSend(v9, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryIconView bottomAnchor](v5, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 5.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v29);

    objc_msgSend(v9, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryGroupView bottomAnchor](self, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v32);

  }
  else
  {
    -[HPSBatteryGroupView addSubview:](self, "addSubview:", self->batteryPercentLabel);
    -[HPSBatteryIconView topAnchor](v5, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryGroupView topAnchor](self, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v35);

    -[HPSBatteryIconView centerXAnchor](v5, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryGroupView centerXAnchor](self, "centerXAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v38);

    -[UILabel centerXAnchor](self->batteryPercentLabel, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryIconView centerXAnchor](v5, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v41);

    -[UILabel topAnchor](self->batteryPercentLabel, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryIconView bottomAnchor](v5, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 5.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v44);

    -[UILabel bottomAnchor](self->batteryPercentLabel, "bottomAnchor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryGroupView bottomAnchor](self, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v31);
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v45);
}

- (void)setChargePercent:(unsigned __int8)a3
{
  uint64_t v3;
  double v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = 0.0;
  if (a3)
    v5 = 1.0;
  -[HPSBatteryGroupView setAlpha:](self, "setAlpha:", v5);
  -[_UIBatteryView setChargePercent:](self->_batteryIconView, "setChargePercent:", (double)v3 / 100.0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u%%"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->batteryPercentLabel, "setText:", v6);

  if (self->batteryLevelDescription)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u%%"), self->batteryLevelDescription, v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->batteryPercentLabel, "setText:", v7);

  }
}

- (HPSBatteryIconView)batteryIconView
{
  return self->_batteryIconView;
}

- (void)setBatteryIconView:(id)a3
{
  objc_storeStrong((id *)&self->_batteryIconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryIconView, 0);
  objc_storeStrong((id *)&self->batteryPercentLabel, 0);
  objc_storeStrong((id *)&self->batteryLevelDescription, 0);
  objc_storeStrong((id *)&self->batteryGlyphView, 0);
}

@end
