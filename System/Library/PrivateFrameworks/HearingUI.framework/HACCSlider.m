@implementation HACCSlider

- (HACCSlider)initWithModule:(unint64_t)a3 andDelegate:(id)a4
{
  id v6;
  HACCSlider *v7;
  HACCSlider *v8;
  HUITitleDarkStepSliderView *v9;
  void *v10;
  uint64_t v11;
  HUITitleDarkStepSliderView *sliderView;
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
  NSNumberFormatter *v29;
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  objc_super v41;
  _QWORD v42[5];

  v42[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v41.receiver = self;
  v41.super_class = (Class)HACCSlider;
  v7 = -[HACCSlider initWithFrame:](&v41, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v8 = v7;
  if (v7)
  {
    -[HACCSlider setModule:](v7, "setModule:", a3);
    -[HACCSlider setDelegate:](v8, "setDelegate:", v6);
    v9 = [HUITitleDarkStepSliderView alloc];
    -[HACCSlider _sliderConfig](v8, "_sliderConfig");
    v40 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HUITitleDarkStepSliderView initWithConfig:](v9, "initWithConfig:", v10);
    sliderView = v8->_sliderView;
    v8->_sliderView = (HUITitleDarkStepSliderView *)v11;

    -[HUITitleDarkStepSliderView slider](v8->_sliderView, "slider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSupportsVibrancy:", 1);

    -[HUITitleDarkStepSliderView slider](v8->_sliderView, "slider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDrawsEndTicks:", 0);

    -[HUITitleDarkStepSliderView slider](v8->_sliderView, "slider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMinimumTrackTintColor:", v16);

    -[HUITitleDarkStepSliderView slider](v8->_sliderView, "slider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTickColor:", v18);

    -[HUITitleDarkStepSliderView setTranslatesAutoresizingMaskIntoConstraints:](v8->_sliderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUITitleDarkStepSliderView slider](v8->_sliderView, "slider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTarget:action:forControlEvents:", v8, sel_sliderDidChange_, 4096);

    -[HACCSlider addSubview:](v8, "addSubview:", v8->_sliderView);
    v35 = (void *)MEMORY[0x24BDD1628];
    -[HUITitleDarkStepSliderView leadingAnchor](v8->_sliderView, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCSlider leadingAnchor](v8, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v37;
    -[HUITitleDarkStepSliderView trailingAnchor](v8->_sliderView, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCSlider trailingAnchor](v8, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v21;
    -[HUITitleDarkStepSliderView topAnchor](v8->_sliderView, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCSlider topAnchor](v8, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v24;
    -[HUITitleDarkStepSliderView bottomAnchor](v8->_sliderView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCSlider bottomAnchor](v8, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v28);

    v29 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    numberFormatter = v8->_numberFormatter;
    v8->_numberFormatter = v29;

    -[NSNumberFormatter setNumberStyle:](v8->_numberFormatter, "setNumberStyle:", 3);
    -[NSNumberFormatter setPercentSymbol:](v8->_numberFormatter, "setPercentSymbol:", &stru_24DD62430);
    -[NSNumberFormatter setMaximumFractionDigits:](v8->_numberFormatter, "setMaximumFractionDigits:", 0);
    v31 = v8->_numberFormatter;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](v31, "stringFromNumber:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setNotANumberSymbol:](v31, "setNotANumberSymbol:", v33);

    v6 = v40;
    -[HACCSlider updateValue](v8, "updateValue");
  }

  return v8;
}

- (void)layoutSubviews
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HACCSlider;
  -[HACCSlider layoutSubviews](&v14, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BE19B38], "controlCenterModuleBackgroundMaterial");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "visualStylingProviderForCategory:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_visualStylingForStyle:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HACCSlider module](self, "module") == 11 || -[HACCSlider module](self, "module") == 10)
    {
      -[HUITitleDarkStepSliderView slider](self->_sliderView, "slider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "color");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMinimumTrackTintColor:", v7);

      -[HUITitleDarkStepSliderView slider](self->_sliderView, "slider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_minTrackView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mt_replaceVisualStyling:", v5);

    }
    -[HUITitleDarkStepSliderView slider](self->_sliderView, "slider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMaximumTrackTintColor:", v11);

    -[HUITitleDarkStepSliderView slider](self->_sliderView, "slider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_maxTrackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mt_replaceVisualStyling:", v5);

  }
}

- (BOOL)providesOwnSeparator
{
  unint64_t v2;

  v2 = -[HACCSlider module](self, "module");
  return (v2 < 0xE) & (0x2924u >> v2);
}

- (BOOL)_isSubModule
{
  _BOOL4 v3;
  unint64_t v4;
  void *v5;

  v3 = -[HACCSlider providesOwnSeparator](self, "providesOwnSeparator");
  if (v3)
  {
    v4 = -[HACCSlider module](self, "module") - 1;
    -[HACCSlider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v5, "shouldDisplayControlForModule:", v4);

    LOBYTE(v3) = v4;
  }
  return v3;
}

- (id)_sliderConfig
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HUISliderConfig *v19;
  _QWORD v21[4];
  id v22;
  id location;

  HUICCMenuTextLabel();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HUICCMenuTextLabel();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HACCSlider _isSubModule](self, "_isSubModule");
  switch(-[HACCSlider module](self, "module"))
  {
    case 1uLL:
    case 2uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
    case 12uLL:
    case 13uLL:
      hearingLocString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setText:", v14);

      v11 = 0;
      v12 = 0;
      v9 = 0;
      v13 = 3;
      break;
    case 3uLL:
    case 6uLL:
    case 14uLL:
    case 25uLL:
    case 26uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("speaker.fill"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageWithTintColor:renderingMode:", v6, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v8;
      objc_initWeak(&location, self);
      v10 = (void *)MEMORY[0x24BEBD388];
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __27__HACCSlider__sliderConfig__block_invoke;
      v21[3] = &unk_24DD616B0;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v10, "actionWithHandler:", v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);

      v3 = 0;
      v12 = 0;
      v13 = 2;
      break;
    case 9uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("circle.fill"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 1;
      objc_msgSend(v16, "imageWithTintColor:renderingMode:", v15, 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("sun.max"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageWithTintColor:renderingMode:", v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = 0;
      v3 = 0;
      v11 = 0;
      break;
    case 10uLL:
    case 11uLL:
      hearingLocString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setText:", v18);

      v11 = 0;
      v12 = 0;
      v9 = 0;
      v13 = 4;
      break;
    default:

      v4 = 0;
      v3 = 0;
      v11 = 0;
      v12 = 0;
      v9 = 0;
      v13 = 0;
      break;
  }
  v19 = objc_alloc_init(HUISliderConfig);
  -[HUISliderConfig setStyle:](v19, "setStyle:", v13);
  -[HUISliderConfig setMinImage:](v19, "setMinImage:", v9);
  -[HUISliderConfig setMaxImage:](v19, "setMaxImage:", v12);
  -[HUISliderConfig setMinTextLabel:](v19, "setMinTextLabel:", v3);
  -[HUISliderConfig setMinImageAction:](v19, "setMinImageAction:", v11);
  -[HUISliderConfig setValueLabel:](v19, "setValueLabel:", v4);
  -[HUISliderConfig setProvidesOwnSeparator:](v19, "setProvidesOwnSeparator:", -[HACCSlider providesOwnSeparator](self, "providesOwnSeparator"));
  -[HUISliderConfig setIsSubmenuSlider:](v19, "setIsSubmenuSlider:", v5);
  -[HUISliderConfig setIsLargeText:](v19, "setIsLargeText:", HUICCLargeTextEnabled());

  return v19;
}

void __27__HACCSlider__sliderConfig__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sliderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setValue:", v5);

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "sliderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "slider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendActionsForControlEvents:", 4096);

}

- (void)setNumberOfSteps:(unint64_t)a3
{
  void *v5;

  -[HUITitleDarkStepSliderView slider](self->_sliderView, "slider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSegmentCount:", a3);

  -[HUITitleDarkStepSliderView setNeedsLayout](self->_sliderView, "setNeedsLayout");
}

- (unint64_t)numberOfSteps
{
  void *v2;
  unint64_t v3;

  -[HUITitleDarkStepSliderView slider](self->_sliderView, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "segmentCount");

  return v3;
}

- (void)sliderDidChange:(id)a3
{
  float v4;

  objc_msgSend(a3, "value");
  -[HACCSlider setValue:andNotify:](self, "setValue:andNotify:", 1, v4);
}

- (void)setValue:(double)a3 andNotify:(BOOL)a4
{
  double v5;
  double v6;
  _BOOL4 v7;
  unint64_t numberOfSteps;
  double v10;
  float v11;
  void *v12;

  if (a3 < 0.0)
    a3 = 0.0;
  if (a3 >= 1.0)
    v5 = 100.0;
  else
    v5 = a3 * 100.0;
  v6 = (double)(int)llround(v5) / 100.0;
  if (self->_value != v6)
  {
    v7 = a4;
    numberOfSteps = self->_numberOfSteps;
    if (v6 != 1.0 && numberOfSteps >= 2)
    {
      v10 = 1.0 / (double)numberOfSteps;
      v11 = v6 / v10;
      v6 = v10 * (double)(int)llroundf(v11);
    }
    self->_value = v6;
    -[HACCSlider setNeedsLayout](self, "setNeedsLayout");
    -[HACCSlider layoutIfNeeded](self, "layoutIfNeeded");
    if (v7)
    {
      -[HACCSlider delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "controlDidActivate:", self);

    }
  }
  -[HACCSlider updateValueString](self, "updateValueString");
}

- (void)updateValueString
{
  unint64_t v3;
  float v4;
  double value;
  void *v6;
  NSNumberFormatter *numberFormatter;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[HACCSlider module](self, "module");
  v4 = 0.0;
  if (v3 <= 0x1A)
  {
    if (((1 << v3) & 0x60073FE) != 0)
    {
      value = self->_value;
    }
    else
    {
      if (((1 << v3) & 0xC00) == 0)
        goto LABEL_5;
      value = self->_value + -0.5 + self->_value + -0.5;
    }
    v4 = value;
  }
LABEL_5:
  -[HACCSlider sliderView](self, "sliderView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  numberFormatter = self->_numberFormatter;
  *(float *)&v8 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v10);

}

- (void)updateValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  uint64_t v8;
  double v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  int v14;
  int v15;
  double v16;
  double v17;
  int v18;
  int v19;
  double v20;
  int v21;
  double v22;
  double v23;
  int v24;
  double v25;
  int v26;
  double v27;
  double v28;
  int v29;
  int v30;
  int v31;
  void *v32;
  uint64_t v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;

  v3 = (void *)MEMORY[0x22074CD38](self, a2);
  -[HACCSlider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentHearingDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  v7 = 0.0;
  v8 = 0;
  switch(-[HACCSlider module](self, "module"))
  {
    case 1uLL:
      objc_msgSend(v5, "leftMixedVolume");
      v7 = v9;
      v10 = objc_msgSend(v5, "leftMixedVolumeSteps");
      goto LABEL_11;
    case 2uLL:
      objc_msgSend(v5, "rightMixedVolume");
      v7 = v16;
      v10 = objc_msgSend(v5, "rightMixedVolumeSteps");
LABEL_11:
      v8 = v10;
      goto LABEL_28;
    case 3uLL:
      objc_msgSend(v5, "combinedVolumeForProperty:", 0x4000000000);
      v7 = v17;
      v18 = objc_msgSend(v5, "leftMixedVolumeSteps");
      v19 = objc_msgSend(v5, "rightMixedVolumeSteps");
      goto LABEL_17;
    case 4uLL:
      objc_msgSend(v5, "leftMicrophoneVolume");
      v7 = v20;
      v21 = objc_msgSend(v5, "leftMicrophoneVolumeSteps");
      goto LABEL_15;
    case 5uLL:
      objc_msgSend(v5, "rightMicrophoneVolume");
      v7 = v22;
      v21 = objc_msgSend(v5, "rightMicrophoneVolumeSteps");
LABEL_15:
      v8 = v21;
      goto LABEL_28;
    case 6uLL:
      objc_msgSend(v5, "combinedVolumeForProperty:", 64);
      v7 = v23;
      v18 = objc_msgSend(v5, "leftMicrophoneVolumeSteps");
      v19 = objc_msgSend(v5, "rightMicrophoneVolumeSteps");
LABEL_17:
      if (v18 <= v19)
        v24 = v19;
      else
        v24 = v18;
      v8 = v24;
      goto LABEL_28;
    case 7uLL:
      objc_msgSend(v5, "leftSensitivity");
      v7 = v25;
      v26 = objc_msgSend(v5, "leftSensitivitySteps");
      goto LABEL_23;
    case 8uLL:
      objc_msgSend(v5, "rightSensitivity");
      v7 = v27;
      v26 = objc_msgSend(v5, "rightSensitivitySteps");
LABEL_23:
      v8 = v26;
      goto LABEL_28;
    case 9uLL:
      objc_msgSend(v5, "combinedVolumeForProperty:", 0x80000000);
      v7 = v28;
      v29 = objc_msgSend(v5, "leftSensitivitySteps");
      v30 = objc_msgSend(v5, "rightSensitivitySteps");
      if (v29 <= v30)
        v31 = v30;
      else
        v31 = v29;
      v8 = v31;
LABEL_28:
      hearingLocString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10uLL:
      v32 = v5;
      v33 = 0x2000000000;
      goto LABEL_31;
    case 11uLL:
      v32 = v5;
      v33 = 0x1000000000;
LABEL_31:
      objc_msgSend(v32, "combinedVolumeForProperty:", v33);
      v7 = v34;
      -[HUITitleDarkStepSliderView slider](self->_sliderView, "slider");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setRestrictsValuesToTicks:", 0);

      hearingLocString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 2;
      break;
    case 12uLL:
      v61 = 0;
      v62 = &v61;
      v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__0;
      v65 = __Block_byref_object_dispose__0;
      objc_msgSend(v5, "leftSelectedStreamingProgram");
      v66 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend((id)v62[5], "isStream") & 1) == 0)
      {
        objc_msgSend(v5, "leftPrograms");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x24BDAC760];
        v60[1] = 3221225472;
        v60[2] = __25__HACCSlider_updateValue__block_invoke;
        v60[3] = &unk_24DD616D8;
        v60[4] = &v61;
        objc_msgSend(v36, "enumerateObjectsUsingBlock:", v60);

      }
      objc_msgSend(v5, "leftStreamVolume");
      v38 = v37;
      LODWORD(v8) = objc_msgSend(v5, "leftStreamVolumeSteps");
      v39 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v62[5], "isStream"))
        objc_msgSend((id)v62[5], "name");
      else
        hearingLocString();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", v40, v50);
      v51 = objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    case 13uLL:
      v61 = 0;
      v62 = &v61;
      v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__0;
      v65 = __Block_byref_object_dispose__0;
      objc_msgSend(v5, "rightSelectedStreamingProgram");
      v66 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend((id)v62[5], "isStream") & 1) == 0)
      {
        objc_msgSend(v5, "rightPrograms");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = MEMORY[0x24BDAC760];
        v59[1] = 3221225472;
        v59[2] = __25__HACCSlider_updateValue__block_invoke_2;
        v59[3] = &unk_24DD616D8;
        v59[4] = &v61;
        objc_msgSend(v41, "enumerateObjectsUsingBlock:", v59);

      }
      objc_msgSend(v5, "rightStreamVolume");
      v38 = v42;
      LODWORD(v8) = objc_msgSend(v5, "rightStreamVolumeSteps");
      v43 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v62[5], "isStream"))
        objc_msgSend((id)v62[5], "name");
      else
        hearingLocString();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringWithFormat:", v40, v50);
      v51 = objc_claimAutoreleasedReturnValue();
LABEL_50:
      v6 = (void *)v51;
      v7 = v38;
      v8 = (int)v8;

      goto LABEL_51;
    case 14uLL:
      v61 = 0;
      v62 = &v61;
      v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__0;
      v65 = __Block_byref_object_dispose__0;
      objc_msgSend(v5, "rightSelectedStreamingProgram");
      v66 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend((id)v62[5], "isStream") & 1) == 0)
      {
        objc_msgSend(v5, "programs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = MEMORY[0x24BDAC760];
        v58[1] = 3221225472;
        v58[2] = __25__HACCSlider_updateValue__block_invoke_3;
        v58[3] = &unk_24DD616D8;
        v58[4] = &v61;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", v58);

      }
      objc_msgSend(v5, "combinedVolumeForProperty:", 128);
      v13 = v12;
      v14 = objc_msgSend(v5, "leftStreamVolumeSteps");
      v15 = objc_msgSend(v5, "rightStreamVolumeSteps");
      if (v14 <= v15)
        LODWORD(v8) = v15;
      else
        LODWORD(v8) = v14;
      if (objc_msgSend((id)v62[5], "isStream"))
        objc_msgSend((id)v62[5], "name");
      else
        hearingLocString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v13;
      v8 = (int)v8;
LABEL_51:
      _Block_object_dispose(&v61, 8);

      break;
    case 15uLL:
    case 16uLL:
    case 17uLL:
    case 18uLL:
    case 19uLL:
    case 20uLL:
    case 21uLL:
    case 22uLL:
    case 23uLL:
    case 24uLL:
      break;
    case 25uLL:
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "relativeVolume");
      v7 = v45;

      -[HUITitleDarkStepSliderView slider](self->_sliderView, "slider");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setRestrictsValuesToTicks:", 0);

      goto LABEL_42;
    case 26uLL:
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "mediaVolume");
      v7 = v48;

      -[HUITitleDarkStepSliderView slider](self->_sliderView, "slider");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setRestrictsValuesToTicks:", 0);

LABEL_42:
      hearingLocString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      break;
    default:
      v8 = 0;
      break;
  }
  -[HACCSlider updateValueString](self, "updateValueString");
  -[HACCSlider sliderView](self, "sliderView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "titleLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setText:", v6);

  -[HACCSlider sliderView](self, "sliderView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "slider");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v56 = v7;
  objc_msgSend(v55, "setValue:", v56);

  -[HACCSlider sliderView](self, "sliderView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setIsSubmenu:", -[HACCSlider _isSubModule](self, "_isSubModule"));

  -[HACCSlider setNumberOfSteps:](self, "setNumberOfSteps:", v8);
  -[HACCSlider setValue:andNotify:](self, "setValue:andNotify:", 0, v7);

  objc_autoreleasePoolPop(v3);
}

void __25__HACCSlider_updateValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isSelected") && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __25__HACCSlider_updateValue__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isSelected") && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __25__HACCSlider_updateValue__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isSelected") && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)contentValue
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[HACCSlider value](self, "value");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (BOOL)enabled
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  unint64_t v5;
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
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  -[HACCSlider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentHearingDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[HACCSlider module](self, "module");
  v6 = 0;
  switch(v5)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0x1AuLL:
      hearingLocString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xCuLL:
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__0;
      v29 = __Block_byref_object_dispose__0;
      objc_msgSend(v4, "leftSelectedStreamingProgram");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend((id)v26[5], "isStream") & 1) == 0)
      {
        objc_msgSend(v4, "leftPrograms");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __32__HACCSlider_accessibilityLabel__block_invoke;
        v24[3] = &unk_24DD616D8;
        v24[4] = &v25;
        objc_msgSend(v7, "enumerateObjectsUsingBlock:", v24);

      }
      v8 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v26[5], "isStream"))
        objc_msgSend((id)v26[5], "name");
      else
        hearingLocString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 0xDuLL:
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__0;
      v29 = __Block_byref_object_dispose__0;
      objc_msgSend(v4, "rightSelectedStreamingProgram");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend((id)v26[5], "isStream") & 1) == 0)
      {
        objc_msgSend(v4, "rightPrograms");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __32__HACCSlider_accessibilityLabel__block_invoke_2;
        v23[3] = &unk_24DD616D8;
        v23[4] = &v25;
        objc_msgSend(v10, "enumerateObjectsUsingBlock:", v23);

      }
      v11 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v26[5], "isStream"))
        objc_msgSend((id)v26[5], "name");
      else
        hearingLocString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v9, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 0xEuLL:
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__0;
      v29 = __Block_byref_object_dispose__0;
      objc_msgSend(v4, "rightSelectedStreamingProgram");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend((id)v26[5], "isStream") & 1) == 0)
      {
        objc_msgSend(v4, "programs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __32__HACCSlider_accessibilityLabel__block_invoke_3;
        v22[3] = &unk_24DD616D8;
        v22[4] = &v25;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v22);

      }
      v13 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v26[5], "isStream"))
        objc_msgSend((id)v26[5], "name");
      else
        hearingLocString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v9, v20);
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v6 = (void *)v21;

      _Block_object_dispose(&v25, 8);
      break;
    case 0x19uLL:
      v14 = (void *)MEMORY[0x24BDD17C8];
      hearingLocString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "selectedComfortSound");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v15, v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }

  return v6;
}

void __32__HACCSlider_accessibilityLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isSelected") && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __32__HACCSlider_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isSelected") && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __32__HACCSlider_accessibilityLabel__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isSelected") && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[HACCSlider sliderView](self, "sliderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDEF0];
}

- (void)accessibilityDecrement
{
  -[HUITitleDarkStepSliderView accessibilityDecrement](self->_sliderView, "accessibilityDecrement");
  -[HACCSlider updateValueString](self, "updateValueString");
}

- (void)accessibilityIncrement
{
  -[HUITitleDarkStepSliderView accessibilityIncrement](self->_sliderView, "accessibilityIncrement");
  -[HACCSlider updateValueString](self, "updateValueString");
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

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (HUITitleDarkStepSliderView)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
  objc_storeStrong((id *)&self->_sliderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
