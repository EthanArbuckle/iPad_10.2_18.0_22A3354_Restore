@implementation HPSListeningModeControl

- (HPSListeningModeControl)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HPSListeningModeControl *v4;
  HPSListeningModeControl *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HPSListeningModeControl;
  v4 = -[HPSListeningModeControl initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, 0);
  v5 = v4;
  if (v4)
    -[HPSListeningModeControl initCommon](v4, "initCommon");
  return v5;
}

- (void)initCommon
{
  NSMutableArray *v3;
  NSMutableArray *modeControlLabelXPositionConstraints;
  void *v5;
  void *v6;
  id v7;

  self->_autoANCSupported = 0;
  self->_modeOffSupported = 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  modeControlLabelXPositionConstraints = self->_modeControlLabelXPositionConstraints;
  self->_modeControlLabelXPositionConstraints = v3;

  -[HPSListeningModeControl contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToBounds:", 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_settingsChangedHandler_, *MEMORY[0x1E0D03388], 0);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BluetoothDeviceProtocol *v7;
  BluetoothDeviceProtocol *device;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HPSListeningModeControl;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v10, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HPSDevice deviceKey](HPSDevice, "deviceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (BluetoothDeviceProtocol *)objc_claimAutoreleasedReturnValue();
  device = self->_device;
  self->_device = v7;

  if (self->_device)
  {
    -[HPSListeningModeControl startObservingOffModeChanges:](self, "startObservingOffModeChanges:");
    self->_autoANCSupported = -[BluetoothDeviceProtocol getAutoANCSupport](self->_device, "getAutoANCSupport");
    self->_modeOffSupported = -[HPSListeningModeControl updateModeOffSupported:](self, "updateModeOffSupported:", self->_device);
    -[BluetoothDeviceProtocol name](self->_device, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Listening Mode: refreshCellContentsWithSpecifier device: %@, AutoANC: %d modeOff: %d"), v9, self->_autoANCSupported, self->_modeOffSupported);

  }
  else
  {
    NSLog(CFSTR("Listening Mode: refreshCellContentsWithSpecifier Invalid Device"));
  }
  -[HPSListeningModeControl addModeOptions](self, "addModeOptions");
  -[HPSListeningModeControl addModeLabels](self, "addModeLabels");
  -[HPSListeningModeControl refreshListeningMode](self, "refreshListeningMode");
  -[HPSListeningModeControl setupConstraints](self, "setupConstraints");
  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, sel_segmentControlValueChanged_, 4096);
}

- (void)addModeOptions
{
  UISegmentedControl *v3;
  UISegmentedControl *segmentedControl;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (!self->_segmentedControl)
  {
    v3 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E0DC3C58]);
    segmentedControl = self->_segmentedControl;
    self->_segmentedControl = v3;

    -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HPSListeningModeControl contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_segmentedControl);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 25.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0x1E0DC3000uLL;
    if (self->_modeOffSupported)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("person.closed.fill"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0DC3888];
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v10;
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configurationWithPaletteColors:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageByApplyingSymbolConfiguration:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageByApplyingSymbolConfiguration:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 0x1E0DC3000;
      -[UISegmentedControl insertSegmentWithImage:atIndex:animated:](self->_segmentedControl, "insertSegmentWithImage:atIndex:animated:", v15, 0, 0);

      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(*(id *)(v7 + 2160), "_systemImageNamed:", CFSTR("person.open.fill"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageByApplyingSymbolConfiguration:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v16 + 1;
    -[UISegmentedControl insertSegmentWithImage:atIndex:animated:](self->_segmentedControl, "insertSegmentWithImage:atIndex:animated:", v18, v16, 0);
    if (self->_autoANCSupported)
    {
      objc_msgSend(*(id *)(v7 + 2160), "_systemImageNamed:", CFSTR("person.and.sparkles.fill"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "imageByApplyingSymbolConfiguration:", v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[UISegmentedControl insertSegmentWithImage:atIndex:animated:](self->_segmentedControl, "insertSegmentWithImage:atIndex:animated:", v21, v16 + 1, 0);
      NSLog(CFSTR("Listening Mode: addModeOptions: AutoANC Button Added"));

      v19 = v16 | 2;
    }
    objc_msgSend(*(id *)(v7 + 2160), "_systemImageNamed:", CFSTR("person.closed.fill"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageByApplyingSymbolConfiguration:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISegmentedControl insertSegmentWithImage:atIndex:animated:](self->_segmentedControl, "insertSegmentWithImage:atIndex:animated:", v23, v19, 0);
    NSLog(CFSTR("Listening Mode: addModeOptions: Regular Buttons Added"));

  }
}

- (void)addModeLabels
{
  HPSListeningModeLabel *v3;
  void *v4;
  void *v5;
  UILabel *v6;
  UILabel *labelTransparency;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  HPSListeningModeLabel *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *labelOff;
  void *v18;
  HPSListeningModeLabel *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  UILabel *labelNoiseCancellation;
  HPSListeningModeLabel *v24;
  UILabel *labelUnableToSetListeningMode;
  void *v26;
  void *v27;
  void *v28;
  HPSListeningModeLabel *v29;
  void *v30;
  void *v31;
  UILabel *v32;
  UILabel *labelAutoANC;
  void *v34;

  if (!self->_labelTransparency)
  {
    v3 = [HPSListeningModeLabel alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ACTIVE_PASS_THROUGH"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HPSListeningModeLabel initWithText:](v3, "initWithText:", v5);
    labelTransparency = self->_labelTransparency;
    self->_labelTransparency = v6;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("en"));

    if (v11)
    {
      LODWORD(v12) = 0.5;
      -[UILabel _setHyphenationFactor:](self->_labelTransparency, "_setHyphenationFactor:", v12);
    }
    -[UILabel sizeToFit](self->_labelTransparency, "sizeToFit");
    if (self->_modeOffSupported)
    {
      v13 = [HPSListeningModeLabel alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("BYPASS"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HPSListeningModeLabel initWithText:](v13, "initWithText:", v15);
      labelOff = self->_labelOff;
      self->_labelOff = v16;

      -[UILabel sizeToFit](self->_labelOff, "sizeToFit");
      -[HPSListeningModeControl contentView](self, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", self->_labelOff);

    }
    v19 = [HPSListeningModeLabel alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ACTIVE_NOISE_CANCELLATION"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HPSListeningModeLabel initWithText:](v19, "initWithText:", v21);
    labelNoiseCancellation = self->_labelNoiseCancellation;
    self->_labelNoiseCancellation = v22;

    -[UILabel setNumberOfLines:](self->_labelNoiseCancellation, "setNumberOfLines:", 0);
    -[UILabel sizeToFit](self->_labelNoiseCancellation, "sizeToFit");
    v24 = -[HPSListeningModeLabel initWithText:]([HPSListeningModeLabel alloc], "initWithText:", CFSTR("Place AirPods Max On Your Head To Use Noise Cancellation."));
    labelUnableToSetListeningMode = self->_labelUnableToSetListeningMode;
    self->_labelUnableToSetListeningMode = &v24->super;

    -[UILabel setNumberOfLines:](self->_labelUnableToSetListeningMode, "setNumberOfLines:", 0);
    -[UILabel sizeToFit](self->_labelUnableToSetListeningMode, "sizeToFit");
    -[UILabel setAlpha:](self->_labelUnableToSetListeningMode, "setAlpha:", 0.01);
    -[HPSListeningModeControl contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", self->_labelTransparency);

    -[HPSListeningModeControl contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", self->_labelNoiseCancellation);

    -[HPSListeningModeControl contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", self->_labelUnableToSetListeningMode);

    NSLog(CFSTR("Listening Mode: addModeLabels: Regular Labels Added"));
    if (self->_autoANCSupported)
    {
      v29 = [HPSListeningModeLabel alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("AUTO_ANC"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[HPSListeningModeLabel initWithText:](v29, "initWithText:", v31);
      labelAutoANC = self->_labelAutoANC;
      self->_labelAutoANC = v32;

      -[UILabel sizeToFit](self->_labelAutoANC, "sizeToFit");
      -[HPSListeningModeControl contentView](self, "contentView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addSubview:", self->_labelAutoANC);

      NSLog(CFSTR("Listening Mode: addModeLabels: AutoANC Label Added"));
    }
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  NSLog(CFSTR("Listening Mode: layoutSubviews"), a2);
  v5.receiver = self;
  v5.super_class = (Class)HPSListeningModeControl;
  -[PSTableCell layoutSubviews](&v5, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSListeningModeControl setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[HPSListeningModeControl _updateLabelLayoutForBounds](self, "_updateLabelLayoutForBounds");
  -[HPSListeningModeControl layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMasksToBounds:", 0);

}

- (void)setupConstraints
{
  void *v3;
  uint64_t v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
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
  void *v45;
  double v46;
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
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  _QWORD v105[3];
  _QWORD v106[3];
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[3];
  _QWORD v110[6];

  v110[4] = *MEMORY[0x1E0C80C00];
  -[HPSListeningModeControl modeControlLabelXPositionConstraints](self, "modeControlLabelXPositionConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    NSLog(CFSTR("Listening Mode: setupConstraints"));
    v83 = (void *)MEMORY[0x1E0CB3718];
    -[UISegmentedControl topAnchor](self->_segmentedControl, "topAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSListeningModeControl contentView](self, "contentView");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v89);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = v86;
    -[UISegmentedControl heightAnchor](self->_segmentedControl, "heightAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToConstant:", 50.0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v110[1] = v84;
    -[UISegmentedControl leadingAnchor](self->_segmentedControl, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSListeningModeControl contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v110[2] = v8;
    -[UISegmentedControl trailingAnchor](self->_segmentedControl, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSListeningModeControl contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v110[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "activateConstraints:", v13);

    -[HPSListeningModeControl contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    -[HPSListeningModeControl _validSegmentCount](self, "_validSegmentCount");
    v18 = v16 / v17;

    v19 = v18 * 0.5;
    if (self->_modeOffSupported)
    {
      v90 = (void *)MEMORY[0x1E0CB3718];
      -[UILabel topAnchor](self->_labelOff, "topAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegmentedControl bottomAnchor](self->_segmentedControl, "bottomAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "constraintEqualToAnchor:constant:", v96, 5.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v109[0] = v20;
      -[UILabel widthAnchor](self->_labelOff, "widthAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToConstant:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v109[1] = v22;
      -[UILabel bottomAnchor](self->_labelOff, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSListeningModeControl contentView](self, "contentView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v109[2] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "activateConstraints:", v27);

      -[HPSListeningModeControl modeControlLabelXPositionConstraints](self, "modeControlLabelXPositionConstraints");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel centerXAnchor](self->_labelOff, "centerXAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSListeningModeControl contentView](self, "contentView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, v18 * 0.5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v32);

      v19 = v18 + v19;
    }
    v91 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](self->_labelTransparency, "topAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl bottomAnchor](self->_segmentedControl, "bottomAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:constant:", v97, 5.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = v33;
    -[UILabel widthAnchor](self->_labelTransparency, "widthAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", v18);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v108[1] = v35;
    -[UILabel bottomAnchor](self->_labelTransparency, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSListeningModeControl contentView](self, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v108[2] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "activateConstraints:", v40);

    -[HPSListeningModeControl modeControlLabelXPositionConstraints](self, "modeControlLabelXPositionConstraints");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerXAnchor](self->_labelTransparency, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSListeningModeControl contentView](self, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, v19);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v45);

    v46 = v18 + v19;
    if (self->_autoANCSupported)
    {
      v92 = (void *)MEMORY[0x1E0CB3718];
      -[UILabel topAnchor](self->_labelAutoANC, "topAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegmentedControl bottomAnchor](self->_segmentedControl, "bottomAnchor");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "constraintEqualToAnchor:constant:", v98, 5.0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v107[0] = v47;
      -[UILabel widthAnchor](self->_labelAutoANC, "widthAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToConstant:", v18);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v107[1] = v49;
      -[UILabel bottomAnchor](self->_labelAutoANC, "bottomAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSListeningModeControl contentView](self, "contentView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "bottomAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintLessThanOrEqualToAnchor:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v107[2] = v53;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 3);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "activateConstraints:", v54);

      -[HPSListeningModeControl modeControlLabelXPositionConstraints](self, "modeControlLabelXPositionConstraints");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel centerXAnchor](self->_labelAutoANC, "centerXAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSListeningModeControl contentView](self, "contentView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "leadingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, v46);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObject:", v59);

      v46 = v18 + v46;
    }
    v87 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](self->_labelNoiseCancellation, "topAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl bottomAnchor](self->_segmentedControl, "bottomAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:constant:", v93, 5.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v60;
    -[UILabel widthAnchor](self->_labelNoiseCancellation, "widthAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToConstant:", v18);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v106[1] = v62;
    -[UILabel bottomAnchor](self->_labelNoiseCancellation, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSListeningModeControl contentView](self, "contentView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintLessThanOrEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v106[2] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 3);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "activateConstraints:", v67);

    v88 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](self->_labelUnableToSetListeningMode, "topAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl bottomAnchor](self->_segmentedControl, "bottomAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:constant:", v94, 5.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = v68;
    -[UILabel leadingAnchor](self->_labelUnableToSetListeningMode, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl leadingAnchor](self->_segmentedControl, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v105[1] = v71;
    -[UILabel trailingAnchor](self->_labelUnableToSetListeningMode, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl trailingAnchor](self->_segmentedControl, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v105[2] = v74;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 3);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "activateConstraints:", v75);

    -[HPSListeningModeControl modeControlLabelXPositionConstraints](self, "modeControlLabelXPositionConstraints");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerXAnchor](self->_labelNoiseCancellation, "centerXAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSListeningModeControl contentView](self, "contentView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, v46);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObject:", v80);

    v81 = (void *)MEMORY[0x1E0CB3718];
    -[HPSListeningModeControl modeControlLabelXPositionConstraints](self, "modeControlLabelXPositionConstraints");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "activateConstraints:", v82);

  }
}

- (int)getListeningModeFromIndex:(int64_t)a3
{
  uint64_t v5;
  int v6;
  void *v7;

  v5 = -[HPSListeningModeControl _modeForIndex:](self, "_modeForIndex:");
  v6 = v5;
  -[HPSListeningModeControl getListeningModeString:](self, "getListeningModeString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Listening Mode: getListeningModeFromIndex Index: %ld -> Mode: %@"), a3, v7);

  return v6;
}

- (int64_t)getIndexFromListeningMode:(int)a3
{
  uint64_t v3;
  int64_t v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v5 = -[HPSListeningModeControl _indexForMode:](self, "_indexForMode:");
  -[HPSListeningModeControl getListeningModeString:](self, "getListeningModeString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Listening Mode: getIndexFromListeningMode Mode: %@ -> Index: %ld"), v6, v5);

  return v5;
}

- (id)getListeningModeString:(int)a3
{
  if ((a3 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1EA29AD58[a3 - 1];
}

- (void)settingsChangedHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  NSLog(CFSTR("Listening Mode: settingsChanged"));
  objc_msgSend(v4, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDeviceProtocol address](self->_device, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    -[HPSListeningModeControl refreshListeningMode](self, "refreshListeningMode");

}

- (void)refreshListeningMode
{
  uint64_t v3;
  void *v4;
  _BOOL4 autoANCSupported;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v3 = -[BluetoothDeviceProtocol listeningMode](self->_device, "listeningMode");
  -[HPSListeningModeControl getListeningModeString:](self, "getListeningModeString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Listening Mode: refreshListeningMode Current Mode: %@"), v4);

  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", -[HPSListeningModeControl getIndexFromListeningMode:](self, "getIndexFromListeningMode:", v3));
  autoANCSupported = self->_autoANCSupported;
  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (autoANCSupported)
  {
    v11 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, CFSTR("ListeningModesV2ValueOnly"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("HPSSetListeningModeUpdated");
  }
  else
  {
    v11 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, CFSTR("ListeningModesValueOnly"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("BTAccessorySetListeningModeUpdated");
  }
  objc_msgSend(v8, "postNotificationName:object:userInfo:", v10, 0, v11);

}

- (void)segmentControlValueChanged:(id)a3
{
  NSInteger v4;
  uint64_t v5;
  _BOOL4 autoANCSupported;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v4 = -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex", a3);
  v5 = -[HPSListeningModeControl getListeningModeFromIndex:](self, "getListeningModeFromIndex:", v4);
  NSLog(CFSTR("Listening Mode: segmentControlValueChanged Index: %ld, Mode: %d"), v4, v5);
  if ((-[BluetoothDeviceProtocol setListeningMode:](self->_device, "setListeningMode:", v5) & 1) == 0)
    -[HPSListeningModeControl _handleListeningModeSetFailure:index:](self, "_handleListeningModeSetFailure:index:", v5, v4);
  autoANCSupported = self->_autoANCSupported;
  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (autoANCSupported)
  {
    v12 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, CFSTR("ListeningModesV2"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("HPSSetListeningModeUpdated");
  }
  else
  {
    v12 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, CFSTR("ListeningModes"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("BTAccessorySetListeningModeUpdated");
  }
  objc_msgSend(v9, "postNotificationName:object:userInfo:", v11, 0, v12);

}

- (void)resetUI
{
  UISegmentedControl *segmentedControl;
  UILabel *labelTransparency;
  NSMutableArray *v5;
  NSMutableArray *modeControlLabelXPositionConstraints;

  -[HPSListeningModeControl setAlpha:](self, "setAlpha:", 0.0);
  -[UISegmentedControl removeFromSuperview](self->_segmentedControl, "removeFromSuperview");
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = 0;

  -[UILabel removeFromSuperview](self->_labelTransparency, "removeFromSuperview");
  labelTransparency = self->_labelTransparency;
  self->_labelTransparency = 0;

  -[UILabel removeFromSuperview](self->_labelOff, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_labelNoiseCancellation, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_labelUnableToSetListeningMode, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_labelAutoANC, "removeFromSuperview");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  modeControlLabelXPositionConstraints = self->_modeControlLabelXPositionConstraints;
  self->_modeControlLabelXPositionConstraints = v5;

  self->_modeOffSupported = -[HPSListeningModeControl updateModeOffSupported:](self, "updateModeOffSupported:", self->_device);
  -[HPSListeningModeControl addModeOptions](self, "addModeOptions");
  -[HPSListeningModeControl addModeLabels](self, "addModeLabels");
  -[HPSListeningModeControl refreshListeningMode](self, "refreshListeningMode");
  -[HPSListeningModeControl setupConstraints](self, "setupConstraints");
  -[HPSListeningModeControl layoutIfNeeded](self, "layoutIfNeeded");
  -[HPSListeningModeControl setAlpha:](self, "setAlpha:", 1.0);
}

- (void)_updateLabelLayoutForBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HPSListeningModeControl contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[HPSListeningModeControl _validSegmentCount](self, "_validSegmentCount");
  v7 = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HPSListeningModeControl modeControlLabelXPositionConstraints](self, "modeControlLabelXPositionConstraints", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = v5 / v7;
    v12 = v11 * 0.5;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14), "setConstant:", v12);
        v12 = v11 + v12;
        ++v14;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)_handleListeningModeSetFailure:(int)a3 index:(int64_t)a4
{
  uint64_t v5;
  uint64_t v7;
  void *v8;
  int v9;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  v5 = *(_QWORD *)&a3;
  -[HPSListeningModeControl setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  v7 = -[BluetoothDeviceProtocol listeningMode](self->_device, "listeningMode");
  -[HPSListeningModeControl _locKeyForFailedToSelectIndex:](self, "_locKeyForFailedToSelectIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BluetoothDeviceProtocol productId](self->_device, "productId");
  if (v9 == 8224 || v9 == 8219)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("DeviceConfig-B768");
  }
  else
  {
    if (v9 != 8206)
    {
      +[HPSProductUtils getProductSpecificString:descriptionKey:](HPSProductUtils, "getProductSpecificString:descriptionKey:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("DeviceConfig");
  }
  objc_msgSend(v11, "localizedStringForKey:value:table:", v8, &stru_1EA29D890, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  -[UILabel setText:](self->_labelUnableToSetListeningMode, "setText:", v14);
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", -[HPSListeningModeControl getIndexFromListeningMode:](self, "getIndexFromListeningMode:", v7));
  -[HPSListeningModeControl getListeningModeString:](self, "getListeningModeString:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSListeningModeControl getListeningModeString:](self, "getListeningModeString:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Listening Mode: New listening mode(%@) set failed, listening mode unchanged.\nRestoring to Current Mode(%@) index(%li)"), v15, v16, -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex"));

  v17[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke;
  v18[3] = &unk_1EA29A770;
  v18[4] = self;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_2;
  v17[3] = &unk_1EA29AD38;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v18, v17, 1.0);

}

uint64_t __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1240), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

uint64_t __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_3;
  v3[3] = &unk_1EA29A770;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_4;
  v2[3] = &unk_1EA29AD38;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v3, v2, 1.0, 1.0);
}

uint64_t __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1240), "setAlpha:", 0.01);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

uint64_t __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
}

- (double)_validSegmentCount
{
  double result;

  if (!self->_autoANCSupported)
  {
    if (!self->_modeOffSupported)
      return 2.0;
    return 3.0;
  }
  result = 4.0;
  if (!self->_modeOffSupported)
    return 3.0;
  return result;
}

- (id)_locKeyForFailedToSelectIndex:(int64_t)a3
{
  _BOOL4 autoANCSupported;
  __CFString *v5;
  BOOL v6;
  uint64_t v7;
  __CFString *v8;

  autoANCSupported = self->_autoANCSupported;
  v5 = CFSTR("NOISE_CONTROL_MODE_REQUIRES_BOTH_BUDS_IN_EAR");
  if (autoANCSupported)
  {
    v6 = !self->_modeOffSupported;
    v7 = 1;
    if (!v6)
      v7 = 2;
    if (v7 == a3)
      v8 = CFSTR("NOISE_CONTROL_MODE_REQUIRES_BOTH_BUDS_IN_EAR_ADAPTIVE");
    else
      v8 = CFSTR("NOISE_CONTROL_MODE_REQUIRES_BOTH_BUDS_IN_EAR");
    v5 = v8;
  }
  return v5;
}

- (BOOL)autoANCSupported
{
  return self->_autoANCSupported;
}

- (void)setAutoANCSupported:(BOOL)a3
{
  self->_autoANCSupported = a3;
}

- (BOOL)modeOffSupported
{
  return self->_modeOffSupported;
}

- (void)setModeOffSupported:(BOOL)a3
{
  self->_modeOffSupported = a3;
}

- (BluetoothDeviceProtocol)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSMutableArray)modeControlLabelXPositionConstraints
{
  return self->_modeControlLabelXPositionConstraints;
}

- (void)setModeControlLabelXPositionConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_modeControlLabelXPositionConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeControlLabelXPositionConstraints, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_labelUnableToSetListeningMode, 0);
  objc_storeStrong((id *)&self->_labelNoiseCancellation, 0);
  objc_storeStrong((id *)&self->_labelOff, 0);
  objc_storeStrong((id *)&self->_labelTransparency, 0);
  objc_storeStrong((id *)&self->_labelAutoANC, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

- (int)_modeForIndex:(int64_t)a3
{
  HPSListeningModeControl *v4;

  v4 = self;
  LODWORD(a3) = sub_1DB3A4C68(a3);

  return a3;
}

- (int64_t)_indexForMode:(int)a3
{
  HPSListeningModeControl *v4;
  int64_t v5;

  v4 = self;
  v5 = sub_1DB3A5094(a3);

  return v5;
}

- (void)startObservingOffModeChanges:(id)a3
{
  HPSListeningModeControl *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1DB3A51F8(a3);
  swift_unknownObjectRelease();

}

- (BOOL)updateModeOffSupported:(id)a3
{
  return 1;
}

@end
