@implementation AMUIBatteryChargingRingView

- (AMUIBatteryChargingRingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  AMUIBatteryChargingRingView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[AMUIBatteryChargingUIConfiguration defaultConfiguration](AMUIBatteryChargingUIConfiguration, "defaultConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMUIBatteryChargingRingView initWithFrame:configuration:](self, "initWithFrame:configuration:", v8, x, y, width, height);

  return v9;
}

- (AMUIBatteryChargingRingView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  AMUIBatteryChargingRingView *v11;
  AMUIBatteryChargingRingView *v12;
  id *p_configuration;
  uint64_t v14;
  UIView *chargingContainerView;
  void *v16;
  uint64_t v17;
  CALayer *magSafeLayer;
  double v19;
  CALayer *v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CALayer *chargeRingLayer;
  double v26;
  CALayer *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  CALayer *ringContainerLayer;
  double v33;
  CALayer *v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  CALayer *ringLayer;
  double v40;
  CALayer *v41;
  double v42;
  double v43;
  double v44;
  _BOOL4 v45;
  id *v46;
  id v47;
  uint64_t v48;
  AMUIRingLayer *trackFillRingLayer;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  CALayer *chargingBoltGlyph;
  CALayer *v56;
  CALayer *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  AMUIRingLayer *batteryLevelRing;
  const CGPath *v62;
  id v63;
  uint64_t v64;
  UILabel *chargePercentLabel;
  void *v66;
  uint64_t v67;
  PLPlatterView *platterView;
  PLPlatterView *v69;
  double v70;
  uint64_t v71;
  PLPlatterView *grabberView;
  void *v73;
  CALayer *v74;
  void *v75;
  CALayer *v76;
  void *v77;
  void *v79;
  id v80;
  id v81;
  objc_super v82;
  _QWORD v83[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v83[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v82.receiver = self;
  v82.super_class = (Class)AMUIBatteryChargingRingView;
  v11 = -[AMUIBatteryChargingView initWithFrame:](&v82, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    p_configuration = (id *)&v11->_configuration;
    objc_storeStrong((id *)&v11->_configuration, a4);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", x, y, width, height);
    chargingContainerView = v12->_chargingContainerView;
    v12->_chargingContainerView = (UIView *)v14;

    -[UIView layer](v12->_chargingContainerView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsGroupBlending:", 0);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v17 = objc_claimAutoreleasedReturnValue();
    magSafeLayer = v12->_magSafeLayer;
    v12->_magSafeLayer = (CALayer *)v17;

    -[CALayer setAllowsEdgeAntialiasing:](v12->_magSafeLayer, "setAllowsEdgeAntialiasing:", 1);
    -[CALayer setDoubleSided:](v12->_magSafeLayer, "setDoubleSided:", 1);
    -[CALayer setSortsSublayers:](v12->_magSafeLayer, "setSortsSublayers:", 1);
    LODWORD(v19) = 0;
    -[CALayer setOpacity:](v12->_magSafeLayer, "setOpacity:", v19);
    v20 = v12->_magSafeLayer;
    objc_msgSend(*p_configuration, "ringDiameter");
    v22 = v21;
    objc_msgSend(*p_configuration, "ringDiameter");
    -[CALayer setBounds:](v20, "setBounds:", 0.0, 0.0, v22, v23);
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v24 = objc_claimAutoreleasedReturnValue();
    chargeRingLayer = v12->_chargeRingLayer;
    v12->_chargeRingLayer = (CALayer *)v24;

    -[CALayer setAllowsEdgeAntialiasing:](v12->_chargeRingLayer, "setAllowsEdgeAntialiasing:", 1);
    -[CALayer setDoubleSided:](v12->_chargeRingLayer, "setDoubleSided:", 1);
    -[CALayer setSortsSublayers:](v12->_chargeRingLayer, "setSortsSublayers:", 1);
    LODWORD(v26) = 1.0;
    -[CALayer setOpacity:](v12->_chargeRingLayer, "setOpacity:", v26);
    v27 = v12->_chargeRingLayer;
    objc_msgSend(*p_configuration, "ringDiameter");
    v29 = v28;
    objc_msgSend(*p_configuration, "ringDiameter");
    -[CALayer setBounds:](v27, "setBounds:", 0.0, 0.0, v29, v30);
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v31 = objc_claimAutoreleasedReturnValue();
    ringContainerLayer = v12->_ringContainerLayer;
    v12->_ringContainerLayer = (CALayer *)v31;

    -[CALayer setAllowsEdgeAntialiasing:](v12->_ringContainerLayer, "setAllowsEdgeAntialiasing:", 1);
    -[CALayer setDoubleSided:](v12->_ringContainerLayer, "setDoubleSided:", 1);
    -[CALayer setSortsSublayers:](v12->_ringContainerLayer, "setSortsSublayers:", 1);
    LODWORD(v33) = 1.0;
    -[CALayer setOpacity:](v12->_ringContainerLayer, "setOpacity:", v33);
    v34 = v12->_ringContainerLayer;
    objc_msgSend(*p_configuration, "ringDiameter");
    v36 = v35;
    objc_msgSend(*p_configuration, "ringDiameter");
    -[CALayer setBounds:](v34, "setBounds:", 0.0, 0.0, v36, v37);
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v38 = objc_claimAutoreleasedReturnValue();
    ringLayer = v12->_ringLayer;
    v12->_ringLayer = (CALayer *)v38;

    -[CALayer setAllowsEdgeAntialiasing:](v12->_ringLayer, "setAllowsEdgeAntialiasing:", 1);
    -[CALayer setDoubleSided:](v12->_ringLayer, "setDoubleSided:", 1);
    -[CALayer setSortsSublayers:](v12->_ringLayer, "setSortsSublayers:", 1);
    LODWORD(v40) = 1.0;
    -[CALayer setOpacity:](v12->_ringLayer, "setOpacity:", v40);
    v41 = v12->_ringLayer;
    objc_msgSend(*p_configuration, "ringDiameter");
    v43 = v42;
    objc_msgSend(*p_configuration, "ringDiameter");
    -[CALayer setBounds:](v41, "setBounds:", 0.0, 0.0, v43, v44);
    v45 = -[AMUIBatteryChargingRingView _isDarkerSystemColorsEnabled](v12, "_isDarkerSystemColorsEnabled");
    v46 = (id *)MEMORY[0x24BDE5BB8];
    if (!v45)
      v46 = (id *)MEMORY[0x24BDE5BD8];
    v47 = *v46;
    -[AMUIBatteryChargingRingView _trackRingForRingConfiguration:withBlendMode:](v12, "_trackRingForRingConfiguration:withBlendMode:", v10, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    trackFillRingLayer = v12->_trackFillRingLayer;
    v12->_trackFillRingLayer = (AMUIRingLayer *)v48;

    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("bolt.fill"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v81 = v10;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "_flatImageWithColor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "imageWithRenderingMode:", 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v54 = objc_claimAutoreleasedReturnValue();
    chargingBoltGlyph = v12->_chargingBoltGlyph;
    v12->_chargingBoltGlyph = (CALayer *)v54;

    v56 = v12->_chargingBoltGlyph;
    v80 = objc_retainAutorelease(v53);
    -[CALayer setContents:](v56, "setContents:", objc_msgSend(v80, "CGImage"));
    v57 = v12->_chargingBoltGlyph;
    objc_msgSend(MEMORY[0x24BDE56B0], "brightnessFilterWithAmount:", 0.1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v58;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setFilters:](v57, "setFilters:", v59);

    -[AMUIBatteryChargingRingView _ringLayerForRingConfiguration:](v12, "_ringLayerForRingConfiguration:", v81);
    v60 = objc_claimAutoreleasedReturnValue();

    batteryLevelRing = v12->_batteryLevelRing;
    v12->_batteryLevelRing = (AMUIRingLayer *)v60;

    v62 = -[AMUIBatteryChargingRingView _pathForRingConfiguration:](v12, "_pathForRingConfiguration:", *p_configuration);
    -[AMUIRingLayer setPath:](v12->_batteryLevelRing, "setPath:", v62);
    CGPathRelease(v62);
    v63 = objc_alloc(MEMORY[0x24BDF6B68]);
    v64 = objc_msgSend(v63, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    chargePercentLabel = v12->_chargePercentLabel;
    v12->_chargePercentLabel = (UILabel *)v64;

    v66 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(*p_configuration, "chargingTextFontSize");
    objc_msgSend(v66, "boldSystemFontOfSize:");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12->_chargePercentLabel, "setFont:", v79);
    v67 = objc_msgSend(objc_alloc(MEMORY[0x24BE72FA0]), "initWithRecipe:", 6);
    platterView = v12->_platterView;
    v12->_platterView = (PLPlatterView *)v67;

    -[PLPlatterView setUsesBackgroundView:](v12->_platterView, "setUsesBackgroundView:", 1);
    -[PLPlatterView setMaterialGroupNameBase:](v12->_platterView, "setMaterialGroupNameBase:", CFSTR("AMUIChargingViewMaterialGroup"));
    v69 = v12->_platterView;
    objc_msgSend(*p_configuration, "ringDiameter");
    -[PLPlatterView _setContinuousCornerRadius:](v69, "_setContinuousCornerRadius:", v70 * 0.5);
    v71 = objc_msgSend(objc_alloc(MEMORY[0x24BE72FA0]), "initWithRecipe:", 19);
    grabberView = v12->_grabberView;
    v12->_grabberView = (PLPlatterView *)v71;

    -[PLPlatterView setRecipeDynamic:](v12->_grabberView, "setRecipeDynamic:", 0);
    -[UIView layer](v12->_chargingContainerView, "layer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addSublayer:", v12->_magSafeLayer);

    -[CALayer addSublayer:](v12->_magSafeLayer, "addSublayer:", v12->_chargeRingLayer);
    -[CALayer addSublayer:](v12->_magSafeLayer, "addSublayer:", v12->_chargingBoltGlyph);
    -[CALayer addSublayer:](v12->_chargeRingLayer, "addSublayer:", v12->_ringContainerLayer);
    v74 = v12->_chargeRingLayer;
    -[UILabel layer](v12->_chargePercentLabel, "layer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer addSublayer:](v74, "addSublayer:", v75);

    -[CALayer addSublayer:](v12->_ringContainerLayer, "addSublayer:", v12->_ringLayer);
    v76 = v12->_ringLayer;
    -[PLPlatterView layer](v12->_platterView, "layer");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer addSublayer:](v76, "addSublayer:", v77);

    v10 = v81;
    -[CALayer addSublayer:](v12->_ringLayer, "addSublayer:", v12->_trackFillRingLayer);
    -[CALayer addSublayer:](v12->_ringLayer, "addSublayer:", v12->_batteryLevelRing);
    -[AMUIBatteryChargingRingView addSubview:](v12, "addSubview:", v12->_chargingContainerView);
    -[AMUIBatteryChargingRingView addSubview:](v12, "addSubview:", v12->_grabberView);

  }
  return v12;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CALayer *chargingBoltGlyph;
  UILabel *chargePercentLabel;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  PLPlatterView *grabberView;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  objc_super v35;
  CGRect v36;

  v35.receiver = self;
  v35.super_class = (Class)AMUIBatteryChargingRingView;
  -[AMUIBatteryChargingRingView layoutSubviews](&v35, sel_layoutSubviews);
  -[AMUIBatteryChargingRingView frame](self, "frame");
  -[UIView setFrame:](self->_chargingContainerView, "setFrame:");
  -[AMUIBatteryChargingUIConfiguration ringDiameter](self->_configuration, "ringDiameter");
  v4 = v3;
  -[AMUIBatteryChargingUIConfiguration ringDiameter](self->_configuration, "ringDiameter");
  v6 = v5;
  -[AMUIBatteryChargingRingView _ringOrigin](self, "_ringOrigin");
  v8 = v7;
  v10 = v9;
  -[CALayer setFrame:](self->_magSafeLayer, "setFrame:");
  -[CALayer setBounds:](self->_magSafeLayer, "setBounds:", v8, v10, v4, v6);
  -[CALayer setFrame:](self->_chargeRingLayer, "setFrame:", v8, v10, v4, v6);
  -[CALayer setBounds:](self->_chargeRingLayer, "setBounds:", v8, v10, v4, v6);
  -[CALayer setFrame:](self->_ringContainerLayer, "setFrame:", v8, v10, v4, v6);
  -[CALayer setBounds:](self->_ringContainerLayer, "setBounds:", v8, v10, v4, v6);
  -[CALayer setFrame:](self->_ringLayer, "setFrame:", v8, v10, v4, v6);
  -[CALayer setBounds:](self->_ringLayer, "setBounds:", v8, v10, v4, v6);
  -[AMUIRingLayer setFrame:](self->_trackFillRingLayer, "setFrame:", v8, v10, v4, v6);
  -[AMUIRingLayer setFrame:](self->_batteryLevelRing, "setFrame:", v8, v10, v4, v6);
  -[AMUIBatteryChargingUIConfiguration boltSize](self->_configuration, "boltSize");
  v12 = v11;
  v14 = v13;
  -[AMUIBatteryChargingRingView _ringOrigin](self, "_ringOrigin");
  v16 = v15 - v12 * 0.5;
  -[AMUIBatteryChargingRingView _ringOrigin](self, "_ringOrigin");
  -[CALayer setFrame:](self->_chargingBoltGlyph, "setFrame:", v16, v17 - v14 * 0.5, v12, v14);
  chargingBoltGlyph = self->_chargingBoltGlyph;
  -[AMUIBatteryChargingRingView _initialRingCenterPosition](self, "_initialRingCenterPosition");
  -[CALayer setPosition:](chargingBoltGlyph, "setPosition:");
  -[UILabel sizeToFit](self->_chargePercentLabel, "sizeToFit");
  chargePercentLabel = self->_chargePercentLabel;
  -[AMUIBatteryChargingRingView _initialRingCenterPosition](self, "_initialRingCenterPosition");
  -[UILabel setCenter:](chargePercentLabel, "setCenter:");
  -[UILabel layer](self->_chargePercentLabel, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 0;
  objc_msgSend(v20, "setOpacity:", v21);

  -[PLPlatterView setFrame:](self->_platterView, "setFrame:", v8, v10, v4, v6);
  -[PLPlatterView setBounds:](self->_platterView, "setBounds:", v8, v10, v4, v6);
  LODWORD(v20) = -[AMUIBatteryChargingRingView _isRTL](self, "_isRTL");
  -[AMUIBatteryChargingRingView _initialRingCenterPosition](self, "_initialRingCenterPosition");
  v23 = 0.0;
  if (!(_DWORD)v20)
    v23 = v4;
  v24 = v22 - v23;
  -[AMUIBatteryChargingRingView _initialRingCenterPosition](self, "_initialRingCenterPosition");
  -[PLPlatterView setFrame:](self->_grabberView, "setFrame:", v24);
  grabberView = self->_grabberView;
  -[PLPlatterView frame](grabberView, "frame");
  -[PLPlatterView _setContinuousCornerRadius:](grabberView, "_setContinuousCornerRadius:", CGRectGetHeight(v36) * 0.5);
  LODWORD(v26) = 1036831949;
  -[AMUIRingLayer setOpacity:](self->_trackFillRingLayer, "setOpacity:", v26);
  LODWORD(v27) = 0;
  -[CALayer setOpacity:](self->_chargingBoltGlyph, "setOpacity:", v27);
  LODWORD(v28) = 1.0;
  -[AMUIRingLayer setOpacity:](self->_batteryLevelRing, "setOpacity:", v28);
  -[UILabel layer](self->_chargePercentLabel, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = 0;
  objc_msgSend(v29, "setOpacity:", v30);

  -[PLPlatterView layer](self->_platterView, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = 1.0;
  objc_msgSend(v31, "setOpacity:", v32);

  -[PLPlatterView layer](self->_grabberView, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = 0;
  objc_msgSend(v33, "setOpacity:", v34);

}

- (void)updateWithBattery:(id)a3
{
  AMUIPowerStatus *v5;
  AMUIPowerStatus *internalStatus;
  id v7;

  objc_storeStrong((id *)&self->_internalBattery, a3);
  v7 = a3;
  -[AMUIBatteryChargingRingView _powerStatusForBattery:](self, "_powerStatusForBattery:", v7);
  v5 = (AMUIPowerStatus *)objc_claimAutoreleasedReturnValue();
  internalStatus = self->_internalStatus;
  self->_internalStatus = v5;

  -[AMUIBatteryChargingRingView _updateForPowerStatus:](self, "_updateForPowerStatus:", self->_internalStatus);
}

- (void)presentChargingViewWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  AMUIBatteryChargingRingView *v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v5 = (void *)MEMORY[0x24BDE57D8];
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __72__AMUIBatteryChargingRingView_presentChargingViewWithCompletionHandler___block_invoke;
  v10 = &unk_250763F90;
  v11 = self;
  v12 = v4;
  v6 = v4;
  objc_msgSend(v5, "setCompletionBlock:", &v7);
  -[AMUIBatteryChargingRingView _runBatteryLevelAnimation](self, "_runBatteryLevelAnimation", v7, v8, v9, v10, v11);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

uint64_t __72__AMUIBatteryChargingRingView_presentChargingViewWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_removeAllAnimations");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateForPowerStatus:(id)a3
{
  id v4;
  void *v5;
  CALayer *chargingBoltGlyph;
  id v7;
  AMUIRingLayer *batteryLevelRing;
  id v9;
  AMUIRingLayer *v10;
  AMUIRingLayer *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  AMUIRingColorForPowerStatus(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  chargingBoltGlyph = self->_chargingBoltGlyph;
  v7 = objc_retainAutorelease(v5);
  -[CALayer setContentsMultiplyColor:](chargingBoltGlyph, "setContentsMultiplyColor:", objc_msgSend(v7, "CGColor"));
  batteryLevelRing = self->_batteryLevelRing;
  v9 = objc_retainAutorelease(v7);
  -[AMUIRingLayer setContentsMultiplyColor:](batteryLevelRing, "setContentsMultiplyColor:", objc_msgSend(v9, "CGColor"));
  v10 = self->_batteryLevelRing;
  v19 = objc_retainAutorelease(v9);
  -[AMUIRingLayer setStrokeColor:](v10, "setStrokeColor:", objc_msgSend(v19, "CGColor"));
  v11 = self->_batteryLevelRing;
  objc_msgSend(v4, "powerPercent");
  -[AMUIRingLayer setStrokeEnd:](v11, "setStrokeEnd:", v12 / 100.0);
  v13 = (void *)MEMORY[0x24BDD16F0];
  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "powerPercent");
  v16 = v15;

  objc_msgSend(v14, "numberWithDouble:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringFromNumber:numberStyle:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_chargePercentLabel, "setText:", v18);
  -[UILabel setTextColor:](self->_chargePercentLabel, "setTextColor:", v19);
  -[AMUIBatteryChargingRingView setNeedsLayout](self, "setNeedsLayout");

}

- (id)_powerStatusForBattery:(id)a3
{
  id v4;
  AMUIPowerStatus *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_alloc_init(AMUIPowerStatus);
  -[AMUIPowerStatus setPowerPercent:](v5, "setPowerPercent:", (double)objc_msgSend(v4, "percentCharge"));
  if (objc_msgSend(v4, "isLowPowerModeActive"))
    v6 = 4;
  else
    v6 = 0;
  objc_msgSend(v4, "percentCharge");
  objc_msgSend(MEMORY[0x24BDF6DD8], "lowBatteryLevel");
  if (BSFloatLessThanOrEqualToFloat())
    v6 |= 2uLL;
  -[AMUIPowerStatus setPowerStatus:](v5, "setPowerStatus:", v6 | objc_msgSend(v4, "isCharging"));
  if (objc_msgSend(v4, "isCharging"))
  {
    if (objc_msgSend(v4, "powerSourceState") == 2)
      v7 = 4;
    else
      v7 = 3;
  }
  else if ((objc_msgSend(v4, "isInternal") & 1) != 0
         || (objc_msgSend(v4, "isCharging") & 1) != 0
         || !-[BCBatteryDevice isCharging](self->_internalBattery, "isCharging")
         || -[BCBatteryDevice powerSourceState](self->_internalBattery, "powerSourceState") != 2)
  {
    v7 = 0;
  }
  else if (-[BCBatteryDevice isWirelesslyCharging](self->_internalBattery, "isWirelesslyCharging"))
  {
    v7 = 0;
  }
  else
  {
    v7 = 2;
  }
  -[AMUIPowerStatus setChargeState:](v5, "setChargeState:", v7);

  return v5;
}

- (BOOL)_isRTL
{
  return -[AMUIBatteryChargingRingView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
}

- (CGPoint)_ringOrigin
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[AMUIBatteryChargingUIConfiguration ringDiameter](self->_configuration, "ringDiameter");
  -[AMUIBatteryChargingRingView frame](self, "frame");
  -[AMUIBatteryChargingRingView _isRTL](self, "_isRTL");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  BSFloatRoundForScale();
  v5 = v4;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  BSFloatRoundForScale();
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)_initialRingCenterPosition
{
  double v3;
  double v4;
  CGPoint result;

  -[AMUIBatteryChargingUIConfiguration ringDiameter](self->_configuration, "ringDiameter");
  -[AMUIBatteryChargingRingView _ringOrigin](self, "_ringOrigin");
  UIRectGetCenter();
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_removeAllAnimations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AMUIBatteryChargingRingView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[CALayer removeAllAnimations](self->_magSafeLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_ringContainerLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_ringLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_chargingBoltGlyph, "removeAllAnimations");
  -[AMUIRingLayer removeAllAnimations](self->_trackFillRingLayer, "removeAllAnimations");
  -[AMUIRingLayer removeAllAnimations](self->_batteryLevelRing, "removeAllAnimations");
  -[AMUIRingLayer removeAllAnimations](self->_trackFillRingLayer, "removeAllAnimations");
  -[UILabel layer](self->_chargePercentLabel, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[PLPlatterView layer](self->_platterView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[PLPlatterView layer](self->_grabberView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

}

- (BOOL)_layerHasGaussianBlurFilter:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "filters", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = *MEMORY[0x24BDE5A78];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v7);

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)_addGaussianBlurToLayerIfNeeded:(id)a3 inputRadius:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!-[AMUIBatteryChargingRingView _layerHasGaussianBlurFilter:](self, "_layerHasGaussianBlurFilter:", v6))
  {
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v7, "setValue:forKey:", CFSTR("default"), CFSTR("inputQuality"));
    objc_msgSend(v7, "setValue:forKey:", CFSTR("default"), CFSTR("inputIntermediateBitDepth"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("inputRadius"));

    v9 = MEMORY[0x24BDBD1C0];
    objc_msgSend(v7, "setValue:forKey:", MEMORY[0x24BDBD1C0], CFSTR("inputNormalizeEdges"));
    objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("inputHardEdges"));
    objc_msgSend(v6, "filters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "addObject:", v7);
    v13[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v12);

  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v4;
  void *v5;
  AMUIRingLayer *trackFillRingLayer;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMUIBatteryChargingRingView;
  v4 = a3;
  -[AMUIBatteryChargingView setLegibilitySettings:](&v8, sel_setLegibilitySettings_, v4);
  objc_msgSend(v4, "primaryColor", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  trackFillRingLayer = self->_trackFillRingLayer;
  v7 = objc_retainAutorelease(v5);
  -[AMUIRingLayer setStrokeColor:](trackFillRingLayer, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

}

- (void)_runBatteryLevelAnimation
{
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
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
  void *v46;
  void *v47;

  -[AMUIRingLayer setStrokeEnd:](self->_batteryLevelRing, "setStrokeEnd:", 0.0);
  -[AMUIPowerStatus powerPercent](self->_internalStatus, "powerPercent");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3 / 100.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDE5978];
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("strokeEnd"), &unk_250778B78, v4, *MEMORY[0x24BDE5978], 2.1, 0.1236, 300.0, 2.0, 50.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("transform.scale.xy"), &unk_250778B88, &unk_250778B98, v5, 1.1993, 0.25, 200.0, 2.0, 25.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("opacity"), &unk_250778B78, &unk_250778B98, v5, 0.8, 0.25, 300.0, 2.0, 50.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("transform.scale.xy"), &unk_250778B78, &unk_250778BA8, v5, 1.1993, 0.0, 200.0, 2.0, 25.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("opacity"), &unk_250778B78, &unk_250778B98, v5, 0.8, 0.25, 300.0, 2.0, 50.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("filters.gaussianBlur.inputRadius"), &unk_250778BB8, &unk_250778B78, v5, 0.8, 0.0, 300.0, 2.0, 50.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("filters.gaussianBlur.inputRadius"), &unk_250778B78, &unk_250778BC8, v5, 0.8, 3.0, 300.0, 2.0, 50.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("transform.scale.xy"), &unk_250778BA8, &unk_250778B78, v5, 1.1993, 3.0, 200.0, 2.0, 25.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("opacity"), &unk_250778B98, &unk_250778B78, v5, 0.907, 3.0, 120.0, 1.0, 17.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("transform.scale.xy"), &unk_250778B98, &unk_250778BD8, v5, 1.1877, 3.28, 100.0, 0.8, 10.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("transform.scale.xy"), &unk_250778B98, &unk_250778B88, v5, 1.1877, 3.0, 100.0, 0.8, 10.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("opacity"), &unk_250778B78, &unk_250778B98, v5, 1.0, 3.1, 200.0, 2.0, 100.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("filters.gaussianBlur.inputRadius"), &unk_250778BE8, &unk_250778B78, v5, 0.8, 3.1, 300.0, 2.0, 50.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("transform.scale.xy"), &unk_250778B88, &unk_250778B98, v5, 1.1993, 3.1, 200.0, 2.0, 25.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _initialRingCenterPosition](self, "_initialRingCenterPosition");
  v7 = v6;
  -[PLPlatterView layer](self->_grabberView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKeyPath:", CFSTR("position.y"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v28 = v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 + -200.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("position.y"), v11, v12, v5, 1.277, 6.33, 300.0, 3.0, 35.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("shadownOpacity"), &unk_250778BF8, &unk_250778B78, v5, 0.8, 6.2, 300.0, 2.0, 50.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("filters.gaussianBlur.inputRadius"), &unk_250778B78, &unk_250778BB8, v5, 1.277, 6.3035, 300.0, 3.0, 35.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("transform.scale.xy"), &unk_250778B98, &unk_250778BF8, v5, 0.9392, 6.23778, 300.0, 3.0, 50.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("transform.scale.xy"), &unk_250778B98, &unk_250778B78, v5, 0.9392, 6.2, 300.0, 3.0, 50.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("position.y"), v13, &unk_250778C08, v5, 2.2328, 6.33, 100.0, 3.0, 20.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("opacity"), &unk_250778B78, &unk_250778B98, v5, 1.0, 6.4023, 200.0, 2.0, 100.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:](self, "_springAnimationForKeyPath:duration:delay:fromValue:toValue:fillMode:stiffness:mass:damping:", CFSTR("opacity"), &unk_250778B98, &unk_250778B78, v5, 1.6, 8.2, 300.0, 8.0, 100.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _addGaussianBlurToLayerIfNeeded:inputRadius:](self, "_addGaussianBlurToLayerIfNeeded:inputRadius:", self->_magSafeLayer, 0.0);
  -[AMUIBatteryChargingRingView _addGaussianBlurToLayerIfNeeded:inputRadius:](self, "_addGaussianBlurToLayerIfNeeded:inputRadius:", self->_chargingBoltGlyph, 50.0);
  -[AMUIBatteryChargingRingView _addGaussianBlurToLayerIfNeeded:inputRadius:](self, "_addGaussianBlurToLayerIfNeeded:inputRadius:", self->_batteryLevelRing, 0.0);
  -[UILabel layer](self->_chargePercentLabel, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingRingView _addGaussianBlurToLayerIfNeeded:inputRadius:](self, "_addGaussianBlurToLayerIfNeeded:inputRadius:", v15, 40.0);

  -[CALayer setValue:forKey:](self->_magSafeLayer, "setValue:forKey:", &unk_250778B88, CFSTR("transform.scale.xy"));
  -[UILabel layer](self->_chargePercentLabel, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKey:", &unk_250778B78, CFSTR("transform.scale.xy"));

  -[PLPlatterView layer](self->_grabberView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 0;
  objc_msgSend(v17, "setOpacity:", v18);

  -[CALayer addAnimation:forKey:](self->_magSafeLayer, "addAnimation:forKey:", v45, CFSTR("magSafeFadeInAnimation"));
  -[CALayer addAnimation:forKey:](self->_magSafeLayer, "addAnimation:forKey:", v46, CFSTR("magSafeScaleAnimation"));
  -[CALayer addAnimation:forKey:](self->_magSafeLayer, "addAnimation:forKey:", v37, CFSTR("magSafeMoveUpAnimation"));
  -[CALayer addAnimation:forKey:](self->_magSafeLayer, "addAnimation:forKey:", v35, CFSTR("dissappearBlurAnimation"));
  -[CALayer addAnimation:forKey:](self->_magSafeLayer, "addAnimation:forKey:", v26, CFSTR("dissappearScaleOutAnimation"));
  -[CALayer addAnimation:forKey:](self->_magSafeLayer, "addAnimation:forKey:", v36, CFSTR("shadowFadeOutAnimation"));
  -[CALayer addAnimation:forKey:](self->_ringContainerLayer, "addAnimation:forKey:", v42, CFSTR("containerRingScaleInAnimation"));
  -[CALayer addAnimation:forKey:](self->_ringLayer, "addAnimation:forKey:", v41, CFSTR("ringScaleOutAnimation"));
  -[CALayer addAnimation:forKey:](self->_chargingBoltGlyph, "addAnimation:forKey:", v44, CFSTR("chargingBoltScaleAnimation"));
  -[CALayer addAnimation:forKey:](self->_chargingBoltGlyph, "addAnimation:forKey:", v43, CFSTR("chargingBoltFadeInAnimation"));
  -[CALayer addAnimation:forKey:](self->_chargingBoltGlyph, "addAnimation:forKey:", v40, CFSTR("chargingBoltBlurInAnimation"));
  -[CALayer addAnimation:forKey:](self->_chargingBoltGlyph, "addAnimation:forKey:", v39, CFSTR("chargingBoltBlurOutAnimation"));
  -[CALayer addAnimation:forKey:](self->_chargingBoltGlyph, "addAnimation:forKey:", v38, CFSTR("chargingBoltScaleOutAnimation"));
  -[CALayer addAnimation:forKey:](self->_chargingBoltGlyph, "addAnimation:forKey:", v34, CFSTR("chargingBoltFadeOutAnimation"));
  -[AMUIRingLayer setValue:forKey:](self->_batteryLevelRing, "setValue:forKey:", &unk_250778B78, CFSTR("strokeEnd"));
  -[AMUIRingLayer addAnimation:forKey:](self->_batteryLevelRing, "addAnimation:forKey:", v47, CFSTR("levelRingStrokeEndAnimation"));
  -[UILabel layer](self->_chargePercentLabel, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v31, CFSTR("chargingLabelFadeInAnimation"));

  -[UILabel layer](self->_chargePercentLabel, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAnimation:forKey:", v32, CFSTR("chargingLabelBlurInAnimation"));

  -[UILabel layer](self->_chargePercentLabel, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAnimation:forKey:", v33, CFSTR("chargingLabelScaleInAnimation"));

  -[UILabel layer](self->_chargePercentLabel, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAnimation:forKey:", v30, CFSTR("chargingLabelDissappearScaleOutAnimation"));

  -[PLPlatterView layer](self->_grabberView, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAnimation:forKey:", v29, CFSTR("grabberMoveUpAnimation"));

  -[PLPlatterView layer](self->_grabberView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAnimation:forKey:", v14, CFSTR("grabberFadeInAnimation"));

  -[PLPlatterView layer](self->_grabberView, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addAnimation:forKey:", v27, CFSTR("grabberFadeOutAnimation"));

}

- (id)_ringLayerForRingConfiguration:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  const CGPath *Mutable;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "ringDiameter");
    v6 = v5;
    objc_msgSend(v4, "lineWidth");
    v8 = v7;

    +[AMUIRingLayer ringWithDiameter:lineWidth:](AMUIRingLayer, "ringWithDiameter:lineWidth:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStrokeStart:", 0.0);
    objc_msgSend(v9, "setStrokeEnd:", 0.0);
    objc_msgSend(v9, "setLineCap:", *MEMORY[0x24BDE5CE8]);
    if (-[AMUIBatteryChargingRingView _isReduceMotionEnabled](self, "_isReduceMotionEnabled"))
    {
      LODWORD(v10) = 0;
      objc_msgSend(v9, "setOpacity:", v10);
    }
    else
    {
      LODWORD(v10) = 1.0;
      objc_msgSend(v9, "setOpacity:", v10);
      Mutable = CGPathCreateMutable();
      objc_msgSend(v9, "setPath:", Mutable);
      CGPathRelease(Mutable);
    }
    objc_msgSend(MEMORY[0x24BDE56B0], "brightnessFilterWithAmount:", 0.1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v13);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (CGPath)_pathForRingConfiguration:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "ringDiameter");
  v5 = v4;
  objc_msgSend(v3, "lineWidth");
  v7 = v6;

  return +[AMUIRingLayer newPathForDiameter:lineWidth:](AMUIRingLayer, "newPathForDiameter:lineWidth:", v5, v7);
}

- (id)_trackRingForRingConfiguration:(id)a3 withBlendMode:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "ringDiameter");
  v8 = v7;
  objc_msgSend(v6, "lineWidth");
  v10 = v9;

  +[AMUIRingLayer ringLayerWithBlendMode:diameter:lineWidth:brightnessAmount:saturationAmount:](AMUIRingLayer, "ringLayerWithBlendMode:diameter:lineWidth:brightnessAmount:saturationAmount:", v5, v8, v10, 0.2, 1.25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_springAnimationForKeyPath:(id)a3 duration:(double)a4 delay:(double)a5 fromValue:(id)a6 toValue:(id)a7 fillMode:(id)a8 stiffness:(double)a9 mass:(double)a10 damping:(double)a11
{
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  double v25;

  v19 = (void *)MEMORY[0x24BDE5760];
  v20 = a8;
  v21 = a7;
  v22 = a6;
  objc_msgSend(v19, "animationWithKeyPath:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = CACurrentMediaTime();
  v25 = -0.0;
  if (a5 != 0.0)
    v25 = a5;
  objc_msgSend(v23, "setBeginTime:", v24 + v25);
  objc_msgSend(v23, "setFillMode:", v20);

  objc_msgSend(v23, "setRemovedOnCompletion:", 0);
  objc_msgSend(v23, "setFromValue:", v22);

  objc_msgSend(v23, "setToValue:", v21);
  objc_msgSend(v23, "setMass:", a10);
  objc_msgSend(v23, "setStiffness:", a9);
  objc_msgSend(v23, "setDamping:", a11);
  objc_msgSend(v23, "setDuration:", a4);
  return v23;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  AMUIRingLayer *v6;
  AMUIRingLayer *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AMUIBatteryChargingRingView;
  -[AMUIBatteryChargingView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (AMUIRingLayer *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 == (AMUIRingLayer *)self->_chargingBoltGlyph
    || v6 == self->_batteryLevelRing
    || v6 == self->_trackFillRingLayer)
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AMUIBatteryChargingUIConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (CALayer)chargingBoltGlyph
{
  return self->_chargingBoltGlyph;
}

- (void)setChargingBoltGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_chargingBoltGlyph, a3);
}

- (UILabel)chargePercentLabel
{
  return self->_chargePercentLabel;
}

- (void)setChargePercentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_chargePercentLabel, a3);
}

- (AMUIRingLayer)batteryLevelRing
{
  return self->_batteryLevelRing;
}

- (void)setBatteryLevelRing:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelRing, a3);
}

- (AMUIRingLayer)trackFillRingLayer
{
  return self->_trackFillRingLayer;
}

- (void)setTrackFillRingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_trackFillRingLayer, a3);
}

- (CALayer)magSafeLayer
{
  return self->_magSafeLayer;
}

- (void)setMagSafeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_magSafeLayer, a3);
}

- (CALayer)chargeRingLayer
{
  return self->_chargeRingLayer;
}

- (void)setChargeRingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_chargeRingLayer, a3);
}

- (CALayer)ringContainerLayer
{
  return self->_ringContainerLayer;
}

- (void)setRingContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_ringContainerLayer, a3);
}

- (CALayer)ringLayer
{
  return self->_ringLayer;
}

- (void)setRingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_ringLayer, a3);
}

- (UIView)chargingContainerView
{
  return self->_chargingContainerView;
}

- (void)setChargingContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_chargingContainerView, a3);
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (PLPlatterView)grabberView
{
  return self->_grabberView;
}

- (void)setGrabberView:(id)a3
{
  objc_storeStrong((id *)&self->_grabberView, a3);
}

- (BCBatteryDevice)internalBattery
{
  return self->_internalBattery;
}

- (void)setInternalBattery:(id)a3
{
  objc_storeStrong((id *)&self->_internalBattery, a3);
}

- (AMUIPowerStatus)internalStatus
{
  return self->_internalStatus;
}

- (void)setInternalStatus:(id)a3
{
  objc_storeStrong((id *)&self->_internalStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalStatus, 0);
  objc_storeStrong((id *)&self->_internalBattery, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_chargingContainerView, 0);
  objc_storeStrong((id *)&self->_ringLayer, 0);
  objc_storeStrong((id *)&self->_ringContainerLayer, 0);
  objc_storeStrong((id *)&self->_chargeRingLayer, 0);
  objc_storeStrong((id *)&self->_magSafeLayer, 0);
  objc_storeStrong((id *)&self->_trackFillRingLayer, 0);
  objc_storeStrong((id *)&self->_batteryLevelRing, 0);
  objc_storeStrong((id *)&self->_chargePercentLabel, 0);
  objc_storeStrong((id *)&self->_chargingBoltGlyph, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
