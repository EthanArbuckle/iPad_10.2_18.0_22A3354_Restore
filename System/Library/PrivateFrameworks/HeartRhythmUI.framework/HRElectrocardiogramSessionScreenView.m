@implementation HRElectrocardiogramSessionScreenView

- (HRElectrocardiogramSessionScreenView)initWithLargeDevice:(BOOL)a3
{
  double v4;
  double v5;
  HRElectrocardiogramSessionScreenView *v6;
  HRElectrocardiogramSessionScreenView *v7;
  id v8;
  void *v9;
  uint64_t v10;
  UIImageView *waveformView;
  UILabel *v12;
  UILabel *countdownValueLabel;
  UILabel *v14;
  UILabel *countdownUnitLabel;
  objc_super v17;

  if (a3)
    v4 = 181.0;
  else
    v4 = 161.0;
  if (a3)
    v5 = 224.0;
  else
    v5 = 197.0;
  v17.receiver = self;
  v17.super_class = (Class)HRElectrocardiogramSessionScreenView;
  v6 = -[HRElectrocardiogramSessionScreenView initWithFrame:](&v17, sel_initWithFrame_, 0.0, 0.0, v4, v5);
  v7 = v6;
  if (v6)
  {
    v6->_isLargeDevice = a3;
    v8 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(MEMORY[0x24BDF6AC8], "hrui_waveformImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithImage:", v9);
    waveformView = v7->_waveformView;
    v7->_waveformView = (UIImageView *)v10;

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    countdownValueLabel = v7->_countdownValueLabel;
    v7->_countdownValueLabel = v12;

    v14 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    countdownUnitLabel = v7->_countdownUnitLabel;
    v7->_countdownUnitLabel = v14;

    -[HRElectrocardiogramSessionScreenView _setUpUI](v7, "_setUpUI");
  }
  return v7;
}

- (void)_setUpUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  double v30;
  void *v31;
  uint64_t v32;
  _BOOL4 v33;
  double v34;
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
  void *v45;
  void *v46;
  void *v47;
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
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _QWORD v81[12];

  v81[10] = *MEMORY[0x24BDAC8D0];
  -[HRElectrocardiogramSessionScreenView setAutoresizingMask:](self, "setAutoresizingMask:", 0);
  -[HRElectrocardiogramSessionScreenView setLayoutMargins:](self, "setLayoutMargins:", 8.5, 8.5, 8.5, 8.5);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[HRElectrocardiogramSessionScreenView waveformView](self, "waveformView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRElectrocardiogramSessionScreenView countdownValueLabel](self, "countdownValueLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)MEMORY[0x24BDF6A70];
  v7 = -[HRElectrocardiogramSessionScreenView isLargeDevice](self, "isLargeDevice");
  v8 = 41.0;
  if (v7)
    v8 = 42.0;
  v9 = *MEMORY[0x24BDF7880];
  objc_msgSend(v6, "hk_compactRoundedFontOfSize:weight:", v8, *MEMORY[0x24BDF7880]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_monospacedFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView countdownValueLabel](self, "countdownValueLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView countdownValueLabel](self, "countdownValueLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v13);

  -[HRElectrocardiogramSessionScreenView countdownValueLabel](self, "countdownValueLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMinimumScaleFactor:", 0.85);

  -[HRElectrocardiogramSessionScreenView countdownUnitLabel](self, "countdownUnitLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v17 = (void *)MEMORY[0x24BDF6A70];
  v18 = -[HRElectrocardiogramSessionScreenView isLargeDevice](self, "isLargeDevice");
  v19 = 31.5;
  if (v18)
    v19 = 32.5;
  objc_msgSend(v17, "hk_compactRoundedFontOfSize:weight:", v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView countdownUnitLabel](self, "countdownUnitLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v20);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView countdownUnitLabel](self, "countdownUnitLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextColor:", v22);

  -[HRElectrocardiogramSessionScreenView countdownUnitLabel](self, "countdownUnitLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setMinimumScaleFactor:", 0.85);

  -[HRElectrocardiogramSessionScreenView waveformView](self, "waveformView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView addSubview:](self, "addSubview:", v25);

  -[HRElectrocardiogramSessionScreenView countdownValueLabel](self, "countdownValueLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView addSubview:](self, "addSubview:", v26);

  -[HRElectrocardiogramSessionScreenView countdownUnitLabel](self, "countdownUnitLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView addSubview:](self, "addSubview:", v27);

  v63 = (void *)MEMORY[0x24BDD1628];
  -[HRElectrocardiogramSessionScreenView waveformView](self, "waveformView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView leadingAnchor](self, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v77;
  -[HRElectrocardiogramSessionScreenView trailingAnchor](self, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView waveformView](self, "waveformView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v74);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v73;
  -[HRElectrocardiogramSessionScreenView waveformView](self, "waveformView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView topAnchor](self, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, 29.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v69;
  -[HRElectrocardiogramSessionScreenView waveformView](self, "waveformView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v28;
  v29 = -[HRElectrocardiogramSessionScreenView isLargeDevice](self, "isLargeDevice");
  v30 = 52.0;
  if (v29)
    v30 = 62.0;
  objc_msgSend(v28, "constraintEqualToConstant:", v30);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v81[3] = v66;
  -[HRElectrocardiogramSessionScreenView countdownValueLabel](self, "countdownValueLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView layoutMarginsGuide](self, "layoutMarginsGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v81[4] = v60;
  -[HRElectrocardiogramSessionScreenView countdownValueLabel](self, "countdownValueLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "firstBaselineAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v31;
  -[HRElectrocardiogramSessionScreenView waveformView](self, "waveformView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bottomAnchor");
  v32 = objc_claimAutoreleasedReturnValue();
  v56 = (void *)v32;
  v33 = -[HRElectrocardiogramSessionScreenView isLargeDevice](self, "isLargeDevice");
  v34 = 48.0;
  if (v33)
    v34 = 58.0;
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v34);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v81[5] = v55;
  -[HRElectrocardiogramSessionScreenView bottomAnchor](self, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView countdownValueLabel](self, "countdownValueLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "firstBaselineAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintGreaterThanOrEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v81[6] = v51;
  -[HRElectrocardiogramSessionScreenView countdownUnitLabel](self, "countdownUnitLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView countdownValueLabel](self, "countdownValueLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 2.5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v81[7] = v46;
  -[HRElectrocardiogramSessionScreenView layoutMarginsGuide](self, "layoutMarginsGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView countdownUnitLabel](self, "countdownUnitLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v81[8] = v38;
  -[HRElectrocardiogramSessionScreenView countdownUnitLabel](self, "countdownUnitLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "firstBaselineAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramSessionScreenView countdownValueLabel](self, "countdownValueLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "firstBaselineAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v81[9] = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 10);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "activateConstraints:", v44);

}

- (BOOL)isLargeDevice
{
  return self->_isLargeDevice;
}

- (UIImageView)waveformView
{
  return self->_waveformView;
}

- (UILabel)countdownValueLabel
{
  return self->_countdownValueLabel;
}

- (UILabel)countdownUnitLabel
{
  return self->_countdownUnitLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countdownUnitLabel, 0);
  objc_storeStrong((id *)&self->_countdownValueLabel, 0);
  objc_storeStrong((id *)&self->_waveformView, 0);
}

@end
