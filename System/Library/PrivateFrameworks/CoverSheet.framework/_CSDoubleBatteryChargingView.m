@implementation _CSDoubleBatteryChargingView

- (_CSDoubleBatteryChargingView)initWithFrame:(CGRect)a3
{
  _CSDoubleBatteryChargingView *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CSBatteryFillView *v14;
  uint64_t v15;
  CSBatteryFillView *internalBatteryFillView;
  CSBatteryFillView *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _UIBackdropView *internalBatteryBlurView;
  void *v22;
  uint64_t v23;
  UIView *internalBatteryContainerView;
  UIView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CSBatteryFillView *v30;
  CSBatteryFillView *externalBatteryFillView;
  CSBatteryFillView *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _UIBackdropView *externalBatteryBlurView;
  void *v37;
  uint64_t v38;
  UIView *externalBatteryContainerView;
  UIView *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  UIImageView *internalChargingIndicator;
  uint64_t v46;
  UIImageView *externalChargingIndicator;
  double v48;
  uint64_t v49;
  UIView *batteryContainerView;
  UIView *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)_CSDoubleBatteryChargingView;
  v3 = -[CSBatteryChargingView initWithFrame:](&v58, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSBatteryChargingView maskImageNameForInternalChargingBattery](CSBatteryChargingView, "maskImageNameForInternalChargingBattery");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSBatteryChargingView maskImageNameForExternalChargingBattery](CSBatteryChargingView, "maskImageNameForExternalChargingBattery");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", v56, v57);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", v55, v57);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v5, "size");
    v11 = v10;
    v13 = v12;
    v14 = [CSBatteryFillView alloc];
    v15 = -[CSBatteryFillView initWithFrame:isInternalBattery:lowBatteryLevel:](v14, "initWithFrame:isInternalBattery:lowBatteryLevel:", 1, objc_msgSend(MEMORY[0x1E0CEA9E8], "lowBatteryLevel"), 0.0, 0.0, v7, v9);
    internalBatteryFillView = v3->_internalBatteryFillView;
    v3->_internalBatteryFillView = (CSBatteryFillView *)v15;

    v17 = v3->_internalBatteryFillView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBatteryFillView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", 2020);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRenderingHint:", 1);
    objc_msgSend(v19, "setGrayscaleTintMaskImage:", v4);
    objc_msgSend(v19, "setColorTintMaskImage:", v4);
    objc_msgSend(v19, "setFilterMaskImage:", v4);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithFrame:settings:", v19, 0.0, 0.0, v7, v9);
    internalBatteryBlurView = v3->_internalBatteryBlurView;
    v3->_internalBatteryBlurView = (_UIBackdropView *)v20;

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v4);
    objc_msgSend(v22, "setFrame:", 0.0, 0.0, v7, v9);
    -[CSBatteryFillView setMaskView:](v3->_internalBatteryFillView, "setMaskView:", v22);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, v7, v9);
    internalBatteryContainerView = v3->_internalBatteryContainerView;
    v3->_internalBatteryContainerView = (UIView *)v23;

    v25 = v3->_internalBatteryContainerView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    -[UIView setAutoresizingMask:](v3->_internalBatteryContainerView, "setAutoresizingMask:", 18);
    -[UIView setClipsToBounds:](v3->_internalBatteryContainerView, "setClipsToBounds:", 1);
    -[UIView addSubview:](v3->_internalBatteryContainerView, "addSubview:", v3->_internalBatteryBlurView);
    -[UIView addSubview:](v3->_internalBatteryContainerView, "addSubview:", v3->_internalBatteryFillView);
    -[_UIBackdropView inputSettings](v3->_internalBatteryBlurView, "inputSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setGrayscaleTintMaskImage:", v4);

    -[_UIBackdropView inputSettings](v3->_internalBatteryBlurView, "inputSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setColorTintMaskImage:", v4);

    -[_UIBackdropView inputSettings](v3->_internalBatteryBlurView, "inputSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFilterMaskImage:", v4);

    v30 = -[CSBatteryFillView initWithFrame:isInternalBattery:lowBatteryLevel:]([CSBatteryFillView alloc], "initWithFrame:isInternalBattery:lowBatteryLevel:", 0, 20, 0.0, 0.0, v11, v13);
    externalBatteryFillView = v3->_externalBatteryFillView;
    v3->_externalBatteryFillView = v30;

    v32 = v3->_externalBatteryFillView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBatteryFillView setBackgroundColor:](v32, "setBackgroundColor:", v33);

    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", 2020);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setRenderingHint:", 1);
    objc_msgSend(v34, "setGrayscaleTintMaskImage:", v5);
    objc_msgSend(v34, "setColorTintMaskImage:", v5);
    v54 = v5;
    objc_msgSend(v34, "setFilterMaskImage:", v5);
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithFrame:settings:", v34, 0.0, 0.0, v11, v13);
    externalBatteryBlurView = v3->_externalBatteryBlurView;
    v3->_externalBatteryBlurView = (_UIBackdropView *)v35;

    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v5);
    objc_msgSend(v37, "setFrame:", 0.0, 0.0, v11, v13);
    -[CSBatteryFillView setMaskView:](v3->_externalBatteryFillView, "setMaskView:", v37);
    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, v11, v13);
    externalBatteryContainerView = v3->_externalBatteryContainerView;
    v3->_externalBatteryContainerView = (UIView *)v38;

    v40 = v3->_externalBatteryContainerView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v40, "setBackgroundColor:", v41);

    -[UIView setAutoresizingMask:](v3->_externalBatteryContainerView, "setAutoresizingMask:", 18);
    -[UIView setClipsToBounds:](v3->_externalBatteryContainerView, "setClipsToBounds:", 1);
    -[UIView addSubview:](v3->_externalBatteryContainerView, "addSubview:", v3->_externalBatteryBlurView);
    -[UIView addSubview:](v3->_externalBatteryContainerView, "addSubview:", v3->_externalBatteryFillView);
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", CFSTR("LockScreenSmallChargingBolt"), v57);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "imageWithRenderingMode:", 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v43);
    internalChargingIndicator = v3->_internalChargingIndicator;
    v3->_internalChargingIndicator = (UIImageView *)v44;

    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v43);
    externalChargingIndicator = v3->_externalChargingIndicator;
    v3->_externalChargingIndicator = (UIImageView *)v46;

    -[_CSDoubleBatteryChargingView addSubview:](v3, "addSubview:", v3->_internalChargingIndicator);
    -[_CSDoubleBatteryChargingView addSubview:](v3, "addSubview:", v3->_externalChargingIndicator);
    -[_CSDoubleBatteryChargingView _spaceBetweenBatteryImages](v3, "_spaceBetweenBatteryImages");
    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, v7 + v11 + v48, v9);
    batteryContainerView = v3->_batteryContainerView;
    v3->_batteryContainerView = (UIView *)v49;

    v51 = v3->_batteryContainerView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v51, "setBackgroundColor:", v52);

    -[UIView addSubview:](v3->_batteryContainerView, "addSubview:", v3->_internalBatteryContainerView);
    -[UIView addSubview:](v3->_batteryContainerView, "addSubview:", v3->_externalBatteryContainerView);
    -[_CSDoubleBatteryChargingView addSubview:](v3, "addSubview:", v3->_batteryContainerView);
    -[UIView setAlpha:](v3->_batteryContainerView, "setAlpha:", 0.0);

  }
  return v3;
}

- (BOOL)batteryVisible
{
  double v2;

  -[UIView alpha](self->_batteryContainerView, "alpha");
  return v2 == 1.0;
}

- (void)setBatteryVisible:(BOOL)a3
{
  UIView *batteryContainerView;
  double v5;

  batteryContainerView = self->_batteryContainerView;
  v5 = 0.0;
  if (a3)
    v5 = 1.0;
  -[UIView setAlpha:](batteryContainerView, "setAlpha:", v5);
  -[_CSDoubleBatteryChargingView setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)batteryCount
{
  return 2;
}

- (double)desiredVisibilityDuration
{
  return 3.5;
}

- (void)setLegibilitySettings:(id)a3
{
  id v4;
  SBUILegibilityLabel *internalChargingNameLabel;
  void *v6;
  SBUILegibilityLabel *externalChargingNameLabel;
  void *v8;
  SBUILegibilityLabel *internalChargePercentLabel;
  void *v10;
  SBUILegibilityLabel *externalChargePercentLabel;
  void *v12;
  UIImageView *internalChargingIndicator;
  void *v14;
  UIImageView *externalChargingIndicator;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_CSDoubleBatteryChargingView;
  v4 = a3;
  -[CSBatteryChargingView setLegibilitySettings:](&v17, sel_setLegibilitySettings_, v4);
  internalChargingNameLabel = self->_internalChargingNameLabel;
  -[CSBatteryChargingView legibilitySettings](self, "legibilitySettings", v17.receiver, v17.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel setLegibilitySettings:](internalChargingNameLabel, "setLegibilitySettings:", v6);

  externalChargingNameLabel = self->_externalChargingNameLabel;
  -[CSBatteryChargingView legibilitySettings](self, "legibilitySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel setLegibilitySettings:](externalChargingNameLabel, "setLegibilitySettings:", v8);

  internalChargePercentLabel = self->_internalChargePercentLabel;
  -[CSBatteryChargingView legibilitySettings](self, "legibilitySettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel setLegibilitySettings:](internalChargePercentLabel, "setLegibilitySettings:", v10);

  externalChargePercentLabel = self->_externalChargePercentLabel;
  -[CSBatteryChargingView legibilitySettings](self, "legibilitySettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel setLegibilitySettings:](externalChargePercentLabel, "setLegibilitySettings:", v12);

  internalChargingIndicator = self->_internalChargingIndicator;
  objc_msgSend(v4, "primaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](internalChargingIndicator, "setTintColor:", v14);

  externalChargingIndicator = self->_externalChargingIndicator;
  objc_msgSend(v4, "primaryColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView setTintColor:](externalChargingIndicator, "setTintColor:", v16);
}

- (void)setPrimaryBatteryText:(id)a3 forBattery:(id)a4
{
  SBUILegibilityLabel *v6;
  SBUILegibilityLabel *internalChargePercentLabel;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SBUILegibilityLabel *v17;
  SBUILegibilityLabel *internalChargingNameLabel;
  UIImageView *internalChargingIndicator;
  int v20;
  double v21;
  id v22;

  v22 = a4;
  -[CSBatteryChargingView _updateChargeString:oldLabel:](self, "_updateChargeString:oldLabel:", a3, self->_internalChargePercentLabel);
  v6 = (SBUILegibilityLabel *)objc_claimAutoreleasedReturnValue();
  internalChargePercentLabel = self->_internalChargePercentLabel;
  self->_internalChargePercentLabel = v6;

  -[CSBatteryFillView setChargePercentage:](self->_internalBatteryFillView, "setChargePercentage:", objc_msgSend(v22, "percentCharge"));
  if (!self->_internalChargingNameLabel)
  {
    objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBatteryChargingView legibilitySettings](self, "legibilitySettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateStrengthForStyle:", objc_msgSend(v9, "style"));
    v11 = v10;

    v12 = objc_alloc(MEMORY[0x1E0DAC5D8]);
    -[CSBatteryChargingView legibilitySettings](self, "legibilitySettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSDoubleBatteryChargingView _chargePercentFont](self, "_chargePercentFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (SBUILegibilityLabel *)objc_msgSend(v12, "initWithSettings:strength:string:font:", v13, v15, v16, v11);
    internalChargingNameLabel = self->_internalChargingNameLabel;
    self->_internalChargingNameLabel = v17;

    -[_CSDoubleBatteryChargingView addSubview:](self, "addSubview:", self->_internalChargingNameLabel);
  }
  internalChargingIndicator = self->_internalChargingIndicator;
  v20 = objc_msgSend(v22, "isCharging");
  v21 = 0.0;
  if (v20)
    v21 = 1.0;
  -[UIImageView setAlpha:](internalChargingIndicator, "setAlpha:", v21);
  -[_CSDoubleBatteryChargingView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setSecondaryBatteryText:(id)a3 forBattery:(id)a4
{
  SBUILegibilityLabel *externalChargePercentLabel;
  id v7;
  SBUILegibilityLabel *v8;
  SBUILegibilityLabel *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  SBUILegibilityLabel *v18;
  SBUILegibilityLabel *externalChargingNameLabel;
  UIImageView *externalChargingIndicator;
  double v21;

  externalChargePercentLabel = self->_externalChargePercentLabel;
  v7 = a4;
  -[CSBatteryChargingView _updateChargeString:oldLabel:](self, "_updateChargeString:oldLabel:", a3, externalChargePercentLabel);
  v8 = (SBUILegibilityLabel *)objc_claimAutoreleasedReturnValue();
  v9 = self->_externalChargePercentLabel;
  self->_externalChargePercentLabel = v8;

  -[CSBatteryFillView setChargePercentage:](self->_externalBatteryFillView, "setChargePercentage:", objc_msgSend(v7, "percentCharge"));
  -[SBUILegibilityLabel removeFromSuperview](self->_externalChargingNameLabel, "removeFromSuperview");
  objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSBatteryChargingView legibilitySettings](self, "legibilitySettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateStrengthForStyle:", objc_msgSend(v11, "style"));
  v13 = v12;

  v14 = objc_alloc(MEMORY[0x1E0DAC5D8]);
  -[CSBatteryChargingView legibilitySettings](self, "legibilitySettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSDoubleBatteryChargingView _chargePercentFont](self, "_chargePercentFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (SBUILegibilityLabel *)objc_msgSend(v14, "initWithSettings:strength:string:font:", v15, v16, v17, v13);
  externalChargingNameLabel = self->_externalChargingNameLabel;
  self->_externalChargingNameLabel = v18;

  -[_CSDoubleBatteryChargingView addSubview:](self, "addSubview:", self->_externalChargingNameLabel);
  externalChargingIndicator = self->_externalChargingIndicator;
  LODWORD(v15) = objc_msgSend(v7, "isCharging");

  v21 = 0.0;
  if ((_DWORD)v15)
    v21 = 1.0;
  -[UIImageView setAlpha:](externalChargingIndicator, "setAlpha:", v21);
  -[_CSDoubleBatteryChargingView setNeedsLayout](self, "setNeedsLayout");
}

- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  void **v11;
  int *v12;
  void *v13;
  id v14;
  int *v15;
  id v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MaxX;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  CGFloat MidX;
  float v55;
  CGFloat v56;
  double MaxY;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  float v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  float v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  float v85;
  CGFloat v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  float v99;
  double v100;
  double v101;
  double v102;
  double v103;
  CGFloat v104;
  float v105;
  double v106;
  double v107;
  CGFloat v108;
  CGFloat v109;
  double v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat rect;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  objc_super v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;

  v119.receiver = self;
  v119.super_class = (Class)_CSDoubleBatteryChargingView;
  -[_CSDoubleBatteryChargingView layoutSubviews](&v119, sel_layoutSubviews);
  -[_CSDoubleBatteryChargingView bounds](self, "bounds");
  v4 = v3;
  -[UIView frame](self->_batteryContainerView, "frame");
  v6 = v5;
  v8 = v7;
  v111 = v5;
  v112 = v7;
  v9 = (v4 - v5) * 0.5;
  v110 = floorf(v9);
  -[_CSDoubleBatteryChargingView _batteryTopPadding](self, "_batteryTopPadding");
  v109 = v10;
  -[UIView setFrame:](self->_batteryContainerView, "setFrame:", v110, v10, v6, v8);
  v11 = (void **)MEMORY[0x1E0CEB258];
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v12 = &OBJC_IVAR____CSDoubleBatteryChargingView__internalBatteryContainerView;
  else
    v12 = &OBJC_IVAR____CSDoubleBatteryChargingView__externalBatteryContainerView;
  v13 = *v11;
  v14 = *(id *)((char *)&self->super.super.super.super.super.super.isa + *v12);
  if (objc_msgSend(v13, "userInterfaceLayoutDirection") == 1)
    v15 = &OBJC_IVAR____CSDoubleBatteryChargingView__externalBatteryContainerView;
  else
    v15 = &OBJC_IVAR____CSDoubleBatteryChargingView__internalBatteryContainerView;
  v16 = *(id *)((char *)&self->super.super.super.super.super.super.isa + *v15);
  objc_msgSend(v14, "frame");
  v18 = v17;
  v20 = v19;
  v21 = *MEMORY[0x1E0C9D538];
  v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v14, "setFrame:", *MEMORY[0x1E0C9D538], v22);
  objc_msgSend(v16, "frame");
  v24 = v23;
  v26 = v25;
  v120.origin.x = v21;
  v120.origin.y = v22;
  v120.size.width = v18;
  v120.size.height = v20;
  MaxX = CGRectGetMaxX(v120);
  -[_CSDoubleBatteryChargingView _spaceBetweenBatteryImages](self, "_spaceBetweenBatteryImages");
  objc_msgSend(v16, "setFrame:", MaxX + v28, 0.0, v24, v26);
  -[_CSDoubleBatteryChargingView _chargePercentFont](self, "_chargePercentFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self->_externalBatteryContainerView, "frame");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  -[UIView frame](self->_internalBatteryContainerView, "frame");
  -[_CSDoubleBatteryChargingView convertRect:fromView:](self, "convertRect:fromView:", self->_batteryContainerView);
  v39 = v38;
  v108 = v38;
  v41 = v40;
  v117 = v42;
  v118 = v40;
  v43 = v42;
  v45 = v44;
  -[_CSDoubleBatteryChargingView convertRect:fromView:](self, "convertRect:fromView:", self->_batteryContainerView, v31, v33, v35, v37);
  v114 = v47;
  v115 = v46;
  rect = v48;
  v50 = v49;
  v116 = v49;
  -[UIImageView frame](self->_internalChargingIndicator, "frame");
  v52 = v51;
  v106 = v53;
  v121.origin.x = v39;
  v121.origin.y = v41;
  v121.size.width = v43;
  v121.size.height = v45;
  MidX = CGRectGetMidX(v121);
  v55 = v52 * 0.5;
  v56 = MidX - floorf(v55);
  v122.origin.x = v110;
  v122.origin.y = v109;
  v122.size.width = v111;
  v122.size.height = v112;
  MaxY = CGRectGetMaxY(v122);
  -[_CSDoubleBatteryChargingView _chargingBoltTopOffset](self, "_chargingBoltTopOffset");
  -[UIImageView setFrame:](self->_internalChargingIndicator, "setFrame:", v56, MaxY + v58, v52, v106);
  -[UIImageView frame](self->_externalChargingIndicator, "frame");
  v60 = v59;
  v107 = v61;
  v123.origin.y = v114;
  v123.origin.x = v115;
  v123.size.width = rect;
  v123.size.height = v50;
  v62 = CGRectGetMidX(v123);
  v63 = v60 * 0.5;
  v64 = v62 - floorf(v63);
  v124.origin.x = v110;
  v124.origin.y = v109;
  v124.size.width = v111;
  v124.size.height = v112;
  v65 = CGRectGetMaxY(v124);
  -[_CSDoubleBatteryChargingView _chargingBoltTopOffset](self, "_chargingBoltTopOffset");
  -[UIImageView setFrame:](self->_externalChargingIndicator, "setFrame:", v64, v65 + v66, v60, v107);
  v125.origin.x = v110;
  v125.origin.y = v109;
  v125.size.width = v111;
  v125.size.height = v112;
  v67 = CGRectGetMaxY(v125);
  -[_CSDoubleBatteryChargingView _deviceNameBaselineOffset](self, "_deviceNameBaselineOffset");
  v69 = v67 + v68;
  objc_msgSend(v29, "descender");
  v71 = v69 - ceil(v70);
  objc_msgSend(v29, "_bodyLeading");
  v73 = round(v71 - v72);
  -[SBUILegibilityLabel sizeToFit](self->_internalChargingNameLabel, "sizeToFit");
  -[SBUILegibilityLabel frame](self->_internalChargingNameLabel, "frame");
  v75 = v74;
  v77 = v76;
  v126.origin.x = v108;
  v126.size.width = v117;
  v126.origin.y = v118;
  v126.size.height = v45;
  v78 = CGRectGetMidX(v126);
  v79 = v75 * 0.5;
  -[SBUILegibilityLabel setFrame:](self->_internalChargingNameLabel, "setFrame:", v78 - floorf(v79), v73, v75, v77);
  -[SBUILegibilityLabel sizeToFit](self->_externalChargingNameLabel, "sizeToFit");
  -[SBUILegibilityLabel frame](self->_externalChargingNameLabel, "frame");
  v81 = v80;
  v83 = v82;
  v127.origin.x = v115;
  v127.origin.y = v114;
  v127.size.width = rect;
  v127.size.height = v116;
  v84 = CGRectGetMidX(v127);
  v85 = v81 * 0.5;
  v86 = v84 - floorf(v85);
  -[SBUILegibilityLabel setFrame:](self->_externalChargingNameLabel, "setFrame:", v86, v73, v81, v83);
  v128.origin.x = v86;
  v128.origin.y = v73;
  v128.size.width = v81;
  v128.size.height = v83;
  v87 = CGRectGetMaxY(v128);
  -[_CSDoubleBatteryChargingView _deviceChargeBaselineOffset](self, "_deviceChargeBaselineOffset");
  v89 = v87 + v88;
  objc_msgSend(v29, "descender");
  v91 = v89 - ceil(v90);
  objc_msgSend(v29, "_bodyLeading");
  v93 = round(v91 - v92);
  -[SBUILegibilityLabel sizeToFit](self->_internalChargePercentLabel, "sizeToFit");
  -[SBUILegibilityLabel frame](self->_internalChargePercentLabel, "frame");
  v95 = v94;
  v97 = v96;
  v129.origin.x = v108;
  v129.size.width = v117;
  v129.origin.y = v118;
  v129.size.height = v45;
  v98 = CGRectGetMidX(v129);
  v99 = v95 * 0.5;
  -[SBUILegibilityLabel setFrame:](self->_internalChargePercentLabel, "setFrame:", v98 - floorf(v99), v93, v95, v97);
  -[SBUILegibilityLabel sizeToFit](self->_externalChargePercentLabel, "sizeToFit");
  -[SBUILegibilityLabel frame](self->_externalChargePercentLabel, "frame");
  v101 = v100;
  v103 = v102;
  v130.origin.x = v115;
  v130.origin.y = v114;
  v130.size.width = rect;
  v130.size.height = v116;
  v104 = CGRectGetMidX(v130);
  v105 = v101 * 0.5;
  -[SBUILegibilityLabel setFrame:](self->_externalChargePercentLabel, "setFrame:", v104 - floorf(v105), v93, v101, v103);

}

- (double)_spaceBetweenBatteryImages
{
  _BOOL4 v2;
  void *v3;
  double result;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  }
  result = 15.0;
  if (v2)
    return 20.0;
  return result;
}

- (double)_batteryTopPadding
{
  double v3;
  double v4;
  double v5;

  -[CSBatteryChargingView _batteryCenter](self, "_batteryCenter");
  v4 = v3;
  -[CSBatteryChargingView _batteryHeight](self, "_batteryHeight");
  return v4 + v5 * -0.5;
}

- (double)_chargingBoltTopOffset
{
  _BOOL4 v2;
  void *v3;
  double result;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  }
  result = 5.0;
  if (v2)
    return 10.0;
  return result;
}

- (double)_deviceNameBaselineOffset
{
  _BOOL4 v2;
  void *v3;
  double result;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  }
  result = 33.0;
  if (v2)
    return 60.0;
  return result;
}

- (double)_deviceChargeBaselineOffset
{
  return 20.0;
}

- (id)_chargePercentFont
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0D1BCB0], "fontSizeForElementType:isLandscapeVariant:", 2, 0);
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0D1BCB0], "fontWeightForElementType:", 2);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", v5, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalChargingIndicator, 0);
  objc_storeStrong((id *)&self->_internalChargingIndicator, 0);
  objc_storeStrong((id *)&self->_externalChargingNameLabel, 0);
  objc_storeStrong((id *)&self->_internalChargingNameLabel, 0);
  objc_storeStrong((id *)&self->_externalChargePercentLabel, 0);
  objc_storeStrong((id *)&self->_internalChargePercentLabel, 0);
  objc_storeStrong((id *)&self->_externalBatteryFillView, 0);
  objc_storeStrong((id *)&self->_internalBatteryFillView, 0);
  objc_storeStrong((id *)&self->_externalBatteryBlurView, 0);
  objc_storeStrong((id *)&self->_internalBatteryBlurView, 0);
  objc_storeStrong((id *)&self->_externalBatteryContainerView, 0);
  objc_storeStrong((id *)&self->_internalBatteryContainerView, 0);
  objc_storeStrong((id *)&self->_batteryContainerView, 0);
}

@end
