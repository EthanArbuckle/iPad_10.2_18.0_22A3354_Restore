@implementation HACCPSESettings

- (HACCPSESettings)initWithFrame:(CGRect)a3
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  int v12;
  NSNumberFormatter *v13;
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v15;
  void *v16;
  void *v17;
  HACCStackView *v18;
  HACCStackView *stackView;
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
  HUISliderConfig *v30;
  void *v31;
  void *v32;
  void *v33;
  HUITitleDarkStepSliderView *v34;
  HUITitleDarkStepSliderView *amplificationSlider;
  void *v36;
  HUITitleDarkStepSliderView *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HUISliderConfig *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  HUITitleDarkStepSliderView *v49;
  HUITitleDarkStepSliderView *balanceSlider;
  void *v51;
  HUITitleDarkStepSliderView *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  HUISliderConfig *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  HUITitleDarkStepSliderView *v64;
  HUITitleDarkStepSliderView *toneSlider;
  void *v66;
  HUITitleDarkStepSliderView *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  HUISliderConfig *v74;
  void *v75;
  void *v76;
  void *v77;
  HUITitleDarkStepSliderView *v78;
  HUITitleDarkStepSliderView *noiseSupressorSlider;
  void *v80;
  HUITitleDarkStepSliderView *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  unsigned int v94;
  void *v95;
  HACCPSESettings *val;
  _QWORD v97[4];
  id v98;
  objc_super v99;
  _QWORD v100[4];
  uint8_t buf[4];
  uint64_t v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v99.receiver = self;
  v99.super_class = (Class)HACCPSESettings;
  val = -[HACCPSESettings initWithFrame:](&v99, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (val)
  {
    paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "getAACPCapabilityInteger:", 6);

    PAInitializeLogging();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Found PSE device with version %lu"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HACCPSESettings initWithFrame:]", 57, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x24BE4BDA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BDA8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v6);
      v9 = v7;
      v10 = objc_msgSend(v8, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v102 = v10;
      _os_log_impl(&dword_21A95E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v11 = _os_feature_enabled_impl();
    if (v4 > 1)
      v12 = v11;
    else
      v12 = 0;
    v89 = v12;
    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    numberFormatter = val->_numberFormatter;
    val->_numberFormatter = v13;

    -[NSNumberFormatter setNumberStyle:](val->_numberFormatter, "setNumberStyle:", 3);
    -[NSNumberFormatter setPercentSymbol:](val->_numberFormatter, "setPercentSymbol:", &stru_24DD62430);
    -[NSNumberFormatter setMaximumFractionDigits:](val->_numberFormatter, "setMaximumFractionDigits:", 0);
    v15 = val->_numberFormatter;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](v15, "stringFromNumber:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setNotANumberSymbol:](v15, "setNotANumberSymbol:", v17);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = HUICCLargeTextEnabled();
    v18 = objc_alloc_init(HACCStackView);
    stackView = val->_stackView;
    val->_stackView = v18;

    -[HACCStackView setAxis:](val->_stackView, "setAxis:", 1);
    -[HACCStackView setAlignment:](val->_stackView, "setAlignment:", 0);
    -[HACCStackView setTranslatesAutoresizingMaskIntoConstraints:](val->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HACCPSESettings addSubview:](val, "addSubview:", val->_stackView);
    v90 = (void *)MEMORY[0x24BDD1628];
    -[HACCStackView leadingAnchor](val->_stackView, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCPSESettings leadingAnchor](val, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = v91;
    -[HACCStackView trailingAnchor](val->_stackView, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCPSESettings trailingAnchor](val, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v100[1] = v22;
    -[HACCStackView topAnchor](val->_stackView, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCPSESettings topAnchor](val, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v100[2] = v25;
    -[HACCStackView bottomAnchor](val->_stackView, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCPSESettings bottomAnchor](val, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v100[3] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "activateConstraints:", v29);

    v30 = objc_alloc_init(HUISliderConfig);
    -[HUISliderConfig setStyle:](v30, "setStyle:", 2);
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("speaker.fill"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "imageWithTintColor:renderingMode:", v95, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUISliderConfig setMinImage:](v30, "setMinImage:", v32);

    HUICCMenuTextLabel();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUISliderConfig setValueLabel:](v30, "setValueLabel:", v33);

    -[HUISliderConfig setIsLargeText:](v30, "setIsLargeText:", v94);
    v34 = -[HUITitleDarkStepSliderView initWithConfig:]([HUITitleDarkStepSliderView alloc], "initWithConfig:", v30);
    amplificationSlider = val->_amplificationSlider;
    val->_amplificationSlider = v34;

    -[HUITitleDarkStepSliderView setTranslatesAutoresizingMaskIntoConstraints:](val->_amplificationSlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUITitleDarkStepSliderView slider](val->_amplificationSlider, "slider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addTarget:action:forControlEvents:", val, sel_amplificationSliderDidChange_, 4096);

    v37 = val->_amplificationSlider;
    hearingLocString();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUITitleDarkStepSliderView setAccessibilityLabel:](v37, "setAccessibilityLabel:", v38);

    -[HUITitleDarkStepSliderView titleLabel](val->_amplificationSlider, "titleLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    hearingLocString();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", v40);

    -[HUITitleDarkStepSliderView slider](val->_amplificationSlider, "slider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setDrawsEndTicks:", 0);

    -[HACCStackView addArrangedSubview:withSeparator:](val->_stackView, "addArrangedSubview:withSeparator:", val->_amplificationSlider, 0);
    v42 = objc_alloc_init(HUISliderConfig);
    -[HUISliderConfig setStyle:](v42, "setStyle:", 3);
    HUICCMenuTextLabel();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUISliderConfig setMinTextLabel:](v42, "setMinTextLabel:", v43);

    -[HUISliderConfig minTextLabel](v42, "minTextLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    hearingLocString();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setText:", v45);

    HUICCMenuTextLabel();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUISliderConfig setValueLabel:](v42, "setValueLabel:", v46);

    -[HUISliderConfig valueLabel](v42, "valueLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    hearingLocString();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setText:", v48);

    -[HUISliderConfig setIsLargeText:](v42, "setIsLargeText:", v94);
    v49 = -[HUITitleDarkStepSliderView initWithConfig:]([HUITitleDarkStepSliderView alloc], "initWithConfig:", v42);
    balanceSlider = val->_balanceSlider;
    val->_balanceSlider = v49;

    -[HUITitleDarkStepSliderView setTranslatesAutoresizingMaskIntoConstraints:](val->_balanceSlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUITitleDarkStepSliderView slider](val->_balanceSlider, "slider");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addTarget:action:forControlEvents:", val, sel_balanceSliderDidChange_, 4096);

    v52 = val->_balanceSlider;
    hearingLocString();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUITitleDarkStepSliderView setAccessibilityLabel:](v52, "setAccessibilityLabel:", v53);

    -[HUITitleDarkStepSliderView titleLabel](val->_balanceSlider, "titleLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    hearingLocString();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setText:", v55);

    -[HUITitleDarkStepSliderView slider](val->_balanceSlider, "slider");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setDrawsEndTicks:", 0);

    -[HUITitleDarkStepSliderView slider](val->_balanceSlider, "slider");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setSegmentCount:", 2);

    -[HUITitleDarkStepSliderView slider](val->_balanceSlider, "slider");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setRestrictsValuesToTicks:", 0);

    -[HACCStackView addArrangedSubview:withSeparator:](val->_stackView, "addArrangedSubview:withSeparator:", val->_balanceSlider, 1);
    v59 = objc_alloc_init(HUISliderConfig);
    -[HUISliderConfig setStyle:](v59, "setStyle:", 1);
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("circlebadge.fill"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "imageWithTintColor:renderingMode:", v95, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUISliderConfig setMinImage:](v59, "setMinImage:", v61);

    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("sun.max.fill"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "imageWithTintColor:renderingMode:", v95, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUISliderConfig setMaxImage:](v59, "setMaxImage:", v63);

    -[HUISliderConfig setIsLargeText:](v59, "setIsLargeText:", v94);
    v64 = -[HUITitleDarkStepSliderView initWithConfig:]([HUITitleDarkStepSliderView alloc], "initWithConfig:", v59);
    toneSlider = val->_toneSlider;
    val->_toneSlider = v64;

    -[HUITitleDarkStepSliderView setTranslatesAutoresizingMaskIntoConstraints:](val->_toneSlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUITitleDarkStepSliderView slider](val->_toneSlider, "slider");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addTarget:action:forControlEvents:", val, sel_toneSliderDidChange_, 4096);

    v67 = val->_toneSlider;
    hearingLocString();
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUITitleDarkStepSliderView setAccessibilityLabel:](v67, "setAccessibilityLabel:", v68);

    -[HUITitleDarkStepSliderView titleLabel](val->_toneSlider, "titleLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    hearingLocString();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setText:", v70);

    -[HUITitleDarkStepSliderView slider](val->_toneSlider, "slider");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setDrawsEndTicks:", 0);

    -[HUITitleDarkStepSliderView slider](val->_toneSlider, "slider");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setSegmentCount:", 2);

    -[HUITitleDarkStepSliderView slider](val->_toneSlider, "slider");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setRestrictsValuesToTicks:", 0);

    -[HACCStackView addArrangedSubview:withSeparator:](val->_stackView, "addArrangedSubview:withSeparator:", val->_toneSlider, 1);
    if (v89)
    {
      v74 = objc_alloc_init(HUISliderConfig);
      -[HUISliderConfig setStyle:](v74, "setStyle:", 2);
      objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("speaker.fill"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "imageWithTintColor:renderingMode:", v95, 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUISliderConfig setMinImage:](v74, "setMinImage:", v76);

      HUICCMenuTextLabel();
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUISliderConfig setValueLabel:](v74, "setValueLabel:", v77);

      -[HUISliderConfig setIsLargeText:](v74, "setIsLargeText:", v94);
      v78 = -[HUITitleDarkStepSliderView initWithConfig:]([HUITitleDarkStepSliderView alloc], "initWithConfig:", v74);
      noiseSupressorSlider = val->_noiseSupressorSlider;
      val->_noiseSupressorSlider = v78;

      -[HUITitleDarkStepSliderView setTranslatesAutoresizingMaskIntoConstraints:](val->_noiseSupressorSlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[HUITitleDarkStepSliderView slider](val->_noiseSupressorSlider, "slider");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "addTarget:action:forControlEvents:", val, sel_noiseSliderDidChange_, 4096);

      v81 = val->_noiseSupressorSlider;
      paLocString();
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUITitleDarkStepSliderView setAccessibilityLabel:](v81, "setAccessibilityLabel:", v82);

      -[HUITitleDarkStepSliderView titleLabel](val->_noiseSupressorSlider, "titleLabel");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      paLocString();
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setText:", v84);

      -[HUITitleDarkStepSliderView slider](val->_noiseSupressorSlider, "slider");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setDrawsEndTicks:", 0);

      -[HACCStackView addArrangedSubview:withSeparator:](val->_stackView, "addArrangedSubview:withSeparator:", val->_noiseSupressorSlider, 1);
    }
    HUICCBackgroundVisualStylingProviderForCategory(2);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCPSESettings setVisualStylingProvider:forCategory:](val, "setVisualStylingProvider:forCategory:", v86, 2);

    -[HACCPSESettings updateValue](val, "updateValue");
    objc_initWeak((id *)buf, val);
    objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = MEMORY[0x24BDAC760];
    v97[1] = 3221225472;
    v97[2] = __33__HACCPSESettings_initWithFrame___block_invoke;
    v97[3] = &unk_24DD60E18;
    objc_copyWeak(&v98, (id *)buf);
    objc_msgSend(v87, "registerUpdateBlock:forRetrieveSelector:withListener:", v97, sel_personalMediaEnabled, val);

    objc_destroyWeak(&v98);
    objc_destroyWeak((id *)buf);

  }
  return val;
}

void __33__HACCPSESettings_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateValue");

}

- (double)currentBalance
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transparencyBalanceForAddress:", v3);
  v6 = v5;

  return v6;
}

- (void)setCurrentBalance:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransparencyBalance:forAddress:", v6, a3);

}

- (double)currentTone
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transparencyToneForAddress:", v3);
  v6 = v5;

  return v6;
}

- (void)setCurrentTone:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransparencyTone:forAddress:", v6, a3);

}

- (double)currentAmplification
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transparencyAmplificationForAddress:", v3);
  v6 = v5;

  return v6;
}

- (void)setCurrentAmplification:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransparencyAmplification:forAddress:", v6, a3);

}

- (double)currentNoiseSupressor
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transparencyNoiseSupressorForAddress:", v3);
  v6 = v5;

  return v6;
}

- (void)setCurrentNoiseSupressor:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransparencyNoiseSupressor:forAddress:", v6, a3);

}

- (void)updateAccessibilityBalanceValue
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  NSNumberFormatter *numberFormatter;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  -[HACCPSESettings currentBalance](self, "currentBalance");
  v4 = v3;
  paLocString();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 > 0.5)
  {
    paLocString();
    v5 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v5;
  }
  v6 = v4 + -0.5;
  paLocString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != 0.0)
  {
    v8 = fabs(v6);
    v9 = (void *)MEMORY[0x24BDD17C8];
    numberFormatter = self->_numberFormatter;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8 + v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v14, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
  }
  -[HUITitleDarkStepSliderView setAccessibilityValue:](self->_balanceSlider, "setAccessibilityValue:", v7);

}

- (void)updateAccessibilityToneValue
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  NSNumberFormatter *numberFormatter;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  -[HACCPSESettings currentTone](self, "currentTone");
  v4 = v3;
  paLocString();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 > 0.5)
  {
    paLocString();
    v5 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v5;
  }
  v6 = v4 + -0.5;
  paLocString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != 0.0)
  {
    v8 = fabs(v6);
    v9 = (void *)MEMORY[0x24BDD17C8];
    numberFormatter = self->_numberFormatter;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8 + v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v14, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
  }
  -[HUITitleDarkStepSliderView setAccessibilityValue:](self->_toneSlider, "setAccessibilityValue:", v7);

}

- (void)amplificationSliderDidChange:(id)a3
{
  float v4;
  double v5;
  NSNumberFormatter *numberFormatter;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "value");
  v5 = v4;
  numberFormatter = self->_numberFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HUITitleDarkStepSliderView valueLabel](self->_amplificationSlider, "valueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  -[HUITitleDarkStepSliderView setAccessibilityValue:](self->_amplificationSlider, "setAccessibilityValue:", v9);
  -[HACCPSESettings setCurrentAmplification:](self, "setCurrentAmplification:", v5);

}

- (void)balanceSliderDidChange:(id)a3
{
  float v4;

  objc_msgSend(a3, "value");
  -[HACCPSESettings setCurrentBalance:](self, "setCurrentBalance:", v4);
  -[HACCPSESettings updateAccessibilityBalanceValue](self, "updateAccessibilityBalanceValue");
}

- (void)toneSliderDidChange:(id)a3
{
  float v4;

  objc_msgSend(a3, "value");
  -[HACCPSESettings setCurrentTone:](self, "setCurrentTone:", v4);
  -[HACCPSESettings updateAccessibilityToneValue](self, "updateAccessibilityToneValue");
}

- (void)noiseSliderDidChange:(id)a3
{
  float v4;
  double v5;
  NSNumberFormatter *numberFormatter;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "value");
  v5 = v4;
  numberFormatter = self->_numberFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HUITitleDarkStepSliderView valueLabel](self->_noiseSupressorSlider, "valueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  -[HUITitleDarkStepSliderView setAccessibilityValue:](self->_noiseSupressorSlider, "setAccessibilityValue:", v9);
  -[HACCPSESettings setCurrentNoiseSupressor:](self, "setCurrentNoiseSupressor:", v5);

}

- (void)updateValue
{
  double v3;
  double v4;
  void *v5;
  NSNumberFormatter *numberFormatter;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  NSNumberFormatter *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  NSNumberFormatter *v24;
  void *v25;
  void *v26;
  HUITitleDarkStepSliderView *amplificationSlider;
  void *v28;
  void *v29;
  HUITitleDarkStepSliderView *noiseSupressorSlider;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;

  -[HACCPSESettings currentAmplification](self, "currentAmplification");
  v4 = v3;
  -[HUITitleDarkStepSliderView valueLabel](self->_amplificationSlider, "valueLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  numberFormatter = self->_numberFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v8);

  -[HUITitleDarkStepSliderView slider](self->_amplificationSlider, "slider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = v4;
  objc_msgSend(v9, "setValue:", v10);

  -[HUITitleDarkStepSliderView slider](self->_balanceSlider, "slider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCPSESettings currentBalance](self, "currentBalance");
  *(float *)&v12 = v12;
  objc_msgSend(v11, "setValue:", v12);

  -[HUITitleDarkStepSliderView slider](self->_toneSlider, "slider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCPSESettings currentTone](self, "currentTone");
  *(float *)&v14 = v14;
  objc_msgSend(v13, "setValue:", v14);

  -[HACCPSESettings currentNoiseSupressor](self, "currentNoiseSupressor");
  v16 = v15;
  -[HUITitleDarkStepSliderView valueLabel](self->_noiseSupressorSlider, "valueLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_numberFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](v18, "stringFromNumber:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v20);

  -[HUITitleDarkStepSliderView slider](self->_noiseSupressorSlider, "slider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v22 = v16;
  objc_msgSend(v21, "setValue:", v22);

  -[HACCPSESettings updateAccessibilityBalanceValue](self, "updateAccessibilityBalanceValue");
  -[HACCPSESettings updateAccessibilityToneValue](self, "updateAccessibilityToneValue");
  -[HUITitleDarkStepSliderView valueLabel](self->_amplificationSlider, "valueLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self->_numberFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](v24, "stringFromNumber:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v26);

  amplificationSlider = self->_amplificationSlider;
  -[HUITitleDarkStepSliderView valueLabel](amplificationSlider, "valueLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "text");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUITitleDarkStepSliderView setAccessibilityValue:](amplificationSlider, "setAccessibilityValue:", v29);

  noiseSupressorSlider = self->_noiseSupressorSlider;
  -[HUITitleDarkStepSliderView valueLabel](noiseSupressorSlider, "valueLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "text");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUITitleDarkStepSliderView setAccessibilityValue:](noiseSupressorSlider, "setAccessibilityValue:", v32);

  v33 = HUICCLargeTextEnabled();
  -[HUITitleDarkStepSliderView setIsLargeText:](self->_amplificationSlider, "setIsLargeText:", v33);
  -[HUITitleDarkStepSliderView setIsLargeText:](self->_balanceSlider, "setIsLargeText:", v33);
  -[HUITitleDarkStepSliderView setIsLargeText:](self->_toneSlider, "setIsLargeText:", v33);
  -[HUITitleDarkStepSliderView setIsLargeText:](self->_noiseSupressorSlider, "setIsLargeText:", v33);
  HUICCBackgroundVisualStylingProviderForCategory(2);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[HACCPSESettings setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v34, 2);

}

- (BOOL)enabled
{
  return 1;
}

- (id)contentValue
{
  return (id)MEMORY[0x24BDBD1C8];
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_24DD6B2C0;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v10[4];
  id v11;
  HACCPSESettings *v12;

  v6 = a3;
  -[HACCPSESettings requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__HACCPSESettings_setVisualStylingProvider_forCategory___block_invoke;
    v10[3] = &unk_24DD61050;
    v11 = v6;
    v12 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

  }
}

void __56__HACCPSESettings_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1)
{
  void *v2;
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
  void *v25;
  id v26;

  objc_msgSend(*(id *)(a1 + 32), "_visualStylingForStyle:", 1);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "amplificationSlider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaximumTrackTintColor:", v4);

  objc_msgSend(*(id *)(a1 + 40), "amplificationSlider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_maxTrackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mt_replaceVisualStyling:", v26);

  objc_msgSend(*(id *)(a1 + 40), "balanceSlider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "slider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_minTrackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mt_replaceVisualStyling:", v26);

  objc_msgSend(*(id *)(a1 + 40), "balanceSlider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "slider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_maxTrackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mt_replaceVisualStyling:", v26);

  objc_msgSend(*(id *)(a1 + 40), "toneSlider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "slider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_minTrackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mt_replaceVisualStyling:", v26);

  objc_msgSend(*(id *)(a1 + 40), "toneSlider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "slider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_maxTrackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mt_replaceVisualStyling:", v26);

  objc_msgSend(*(id *)(a1 + 40), "noiseSupressorSlider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "slider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "color");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMaximumTrackTintColor:", v22);

  objc_msgSend(*(id *)(a1 + 40), "noiseSupressorSlider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "slider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_maxTrackView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mt_replaceVisualStyling:", v26);

}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (HACCContentModuleDelegate)delegate
{
  return (HACCContentModuleDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (HACCStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (HUITitleDarkStepSliderView)amplificationSlider
{
  return self->_amplificationSlider;
}

- (void)setAmplificationSlider:(id)a3
{
  objc_storeStrong((id *)&self->_amplificationSlider, a3);
}

- (HUITitleDarkStepSliderView)balanceSlider
{
  return self->_balanceSlider;
}

- (void)setBalanceSlider:(id)a3
{
  objc_storeStrong((id *)&self->_balanceSlider, a3);
}

- (HUITitleDarkStepSliderView)toneSlider
{
  return self->_toneSlider;
}

- (void)setToneSlider:(id)a3
{
  objc_storeStrong((id *)&self->_toneSlider, a3);
}

- (HUITitleDarkStepSliderView)noiseSupressorSlider
{
  return self->_noiseSupressorSlider;
}

- (void)setNoiseSupressorSlider:(id)a3
{
  objc_storeStrong((id *)&self->_noiseSupressorSlider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noiseSupressorSlider, 0);
  objc_storeStrong((id *)&self->_toneSlider, 0);
  objc_storeStrong((id *)&self->_balanceSlider, 0);
  objc_storeStrong((id *)&self->_amplificationSlider, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
