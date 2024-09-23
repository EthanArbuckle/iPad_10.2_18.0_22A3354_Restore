@implementation NTKDualTimeView

- (NTKDualTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 andDevice:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  NTKDualTimeView *v13;
  NTKDualTimeView *v14;
  void *v15;
  NTKFaceColorPalette *v16;
  void *v17;
  NTKFaceColorPalette *v18;
  NTKFaceColorPalette *blackPalette;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NTKDualTimeView;
  v13 = -[NTKDualTimeView initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_device, a5);
    v14->_style = a4;
    -[NTKDualTimeView layer](v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsGroupOpacity:", 1);

    -[NTKDualTimeView _setupDial](v14, "_setupDial");
    -[NTKDualTimeView setupTimeViews](v14, "setupTimeViews");
    -[NTKDualTimeView setStyle:](v14, "setStyle:", v14->_style);
    v16 = objc_alloc_init(NTKFaceColorPalette);
    +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", CFSTR("seasons.spring2015.white"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPalette setPigmentEditOption:](v16, "setPigmentEditOption:", v17);

    -[NTKDualTimeView setColorPalette:](v14, "setColorPalette:", v16);
    v18 = objc_alloc_init(NTKFaceColorPalette);
    blackPalette = v14->_blackPalette;
    v14->_blackPalette = v18;

    +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", CFSTR("seasons.black"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPalette setPigmentEditOption:](v14->_blackPalette, "setPigmentEditOption:", v20);

    -[NTKDualTimeView setColorPalette:](v14, "setColorPalette:", v14->_blackPalette);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKDualTimeView _stopDigitalTicksAnimation](self, "_stopDigitalTicksAnimation");
  -[NTKDualTimeView _tearDownAnalogContainerView](self, "_tearDownAnalogContainerView");
  -[NTKDualTimeView _tearDownDigitalContainerView](self, "_tearDownDigitalContainerView");
  v3.receiver = self;
  v3.super_class = (Class)NTKDualTimeView;
  -[NTKDualTimeView dealloc](&v3, sel_dealloc);
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
  -[NTKDualTimeDigitalTicksView setEditing:](self->_digitalTicksContainerView, "setEditing:");
  -[NTKDualTimeView _refreshDigitalTicks](self, "_refreshDigitalTicks");
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
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NTKDualTimeView;
  -[NTKDualTimeView layoutSubviews](&v16, sel_layoutSubviews);
  -[NTKDualTimeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_analogContainerView, "ntk_setBoundsAndPositionFromFrame:");
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_digitalContainerView, "ntk_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_dialBackgroundView, "ntk_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_dialContainerView, "ntk_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
  -[UIView layer](self->_dialContainerView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", v8 * 0.5);

  -[UIView layer](self->_dialBackgroundView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v8 * 0.5);

  v13 = MEMORY[0x1BCCA72B8](v4, v6, v8, v10);
  v15 = v14;
  -[NTKAnalogHandsView setCenter:](self->_analogHandsView, "setCenter:");
  -[CLKUIDualTimeAnalogTicksView setCenter:](self->_analogTickContainerView, "setCenter:", v13, v15);
  -[NTKDigitalTimeLabel setCenter:](self->_digitalTimeLabel, "setCenter:", v13, v15);
  -[NTKDualTimeDigitalTicksView setFrame:](self->_digitalTicksContainerView, "setFrame:", v4, v6, v8, v10);
}

- (void)traitCollectionDidChange:(id)a3
{
  NTKDigitalTimeLabel *digitalTimeLabel;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKDualTimeView;
  -[NTKDualTimeView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  digitalTimeLabel = self->_digitalTimeLabel;
  -[NTKDualTimeView _digitalStyle](self, "_digitalStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel setStyle:](digitalTimeLabel, "setStyle:", v5);

  -[NTKDualTimeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setupTimeViews
{
  -[NTKDualTimeView _setupAnalogTimeViews](self, "_setupAnalogTimeViews");
  -[NTKDualTimeView _setupDigitalTimeViews](self, "_setupDigitalTimeViews");
  -[NTKDualTimeView _didFinishTimeViewSetup](self, "_didFinishTimeViewSetup");
}

- (void)_setupDial
{
  UIView *v3;
  UIView *dialContainerView;
  UIView *v5;
  void *v6;
  double v7;
  UIView *v8;
  UIView *dialBackgroundView;
  UIView *v10;
  void *v11;
  double v12;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  dialContainerView = self->_dialContainerView;
  self->_dialContainerView = v3;

  v5 = self->_dialContainerView;
  -[NTKDualTimeView bounds](self, "bounds");
  -[UIView ntk_setBoundsAndPositionFromFrame:](v5, "ntk_setBoundsAndPositionFromFrame:");
  -[UIView layer](self->_dialContainerView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDualTimeView bounds](self, "bounds");
  objc_msgSend(v6, "setCornerRadius:", v7 * 0.5);

  -[NTKDualTimeView addSubview:](self, "addSubview:", self->_dialContainerView);
  if (-[NTKDualTimeView shouldUseCustomDialBackground](self, "shouldUseCustomDialBackground"))
  {
    -[NTKDualTimeView _customDialBackgroundView](self, "_customDialBackgroundView");
    v8 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  }
  dialBackgroundView = self->_dialBackgroundView;
  self->_dialBackgroundView = v8;

  v10 = self->_dialBackgroundView;
  -[NTKDualTimeView bounds](self, "bounds");
  -[UIView ntk_setBoundsAndPositionFromFrame:](v10, "ntk_setBoundsAndPositionFromFrame:");
  -[UIView layer](self->_dialBackgroundView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDualTimeView bounds](self, "bounds");
  objc_msgSend(v11, "setCornerRadius:", v12 * 0.5);

  -[UIView addSubview:](self->_dialContainerView, "addSubview:", self->_dialBackgroundView);
}

- (BOOL)shouldUseCustomDialBackground
{
  return 0;
}

- (id)_customDialBackgroundView
{
  return 0;
}

- (void)_setupAnalogTimeViews
{
  id v3;
  UIView *v4;
  UIView *analogContainerView;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  CLKUIDualTimeAnalogTicksView *v22;
  CLKUIDualTimeAnalogTicksView *analogTickContainerView;
  _QWORD v24[9];

  if (!self->_analogContainerView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKDualTimeView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    analogContainerView = self->_analogContainerView;
    self->_analogContainerView = v4;

    -[UIView layer](self->_analogContainerView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", 1);

    -[UIView insertSubview:aboveSubview:](self->_dialContainerView, "insertSubview:aboveSubview:", self->_analogContainerView, self->_dialBackgroundView);
    -[NTKDualTimeView _setupAnalogHandsView](self, "_setupAnalogHandsView");
    v7 = -[NTKDualTimeView _minuteTickCount](self, "_minuteTickCount");
    v8 = -[NTKDualTimeView _hourTickCount](self, "_hourTickCount");
    -[NTKDualTimeView _minuteTickSize](self, "_minuteTickSize");
    v10 = v9;
    v12 = v11;
    -[NTKDualTimeView _hourTickSize](self, "_hourTickSize");
    v14 = v13;
    v16 = v15;
    -[NTKDualTimeView _minuteTickInset](self, "_minuteTickInset");
    v18 = v17;
    -[NTKDualTimeView _hourTickInset](self, "_hourTickInset");
    v20 = v19;
    v21 = objc_alloc((Class)off_1E6BCA6F0);
    -[NTKDualTimeView bounds](self, "bounds");
    v24[0] = v7;
    v24[1] = v8;
    v24[2] = v10;
    v24[3] = v12;
    v24[4] = v14;
    v24[5] = v16;
    v24[6] = v18;
    v24[7] = v20;
    v24[8] = 0;
    v22 = (CLKUIDualTimeAnalogTicksView *)objc_msgSend(v21, "initWithFrame:configuration:", v24);
    analogTickContainerView = self->_analogTickContainerView;
    self->_analogTickContainerView = v22;

    -[UIView addSubview:](self->_analogContainerView, "addSubview:", self->_analogTickContainerView);
    -[NTKDualTimeView bringSubviewToFront:](self, "bringSubviewToFront:", self->_analogHandsView);
  }
}

- (void)_setupAnalogHandsView
{
  NTKAnalogHandsView *v3;
  NTKAnalogHandsView *analogHandsView;

  v3 = -[NTKAnalogHandsView initForDevice:]([NTKDualTimeAnalogHandsView alloc], "initForDevice:", self->_device);
  analogHandsView = self->_analogHandsView;
  self->_analogHandsView = v3;

  -[NTKDualTimeView addSubview:](self, "addSubview:", self->_analogHandsView);
}

- (void)_tearDownAnalogContainerView
{
  -[NTKAnalogHandsView removeFromSuperview](self->_analogHandsView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_analogContainerView, "removeFromSuperview");
}

- (void)_colorizeAnalogTicksWithHourColor:(id)a3 minuteColor:(id)a4
{
  -[CLKUIDualTimeAnalogTicksView setHourTickColor:minuteTickColor:](self->_analogTickContainerView, "setHourTickColor:minuteTickColor:", a3, a4);
}

- (void)_setupDigitalTimeViews
{
  id v3;
  UIView *v4;
  UIView *digitalContainerView;
  void *v6;
  NTKDigitalTimeLabel *v7;
  NTKDigitalTimeLabel *digitalTimeLabel;
  NTKDigitalTimeLabel *v9;
  void *v10;
  NTKDigitalTimeLabel *v11;

  if (!self->_digitalContainerView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKDualTimeView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    digitalContainerView = self->_digitalContainerView;
    self->_digitalContainerView = v4;

    -[UIView layer](self->_digitalContainerView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", 1);

    -[UIView insertSubview:aboveSubview:](self->_dialContainerView, "insertSubview:aboveSubview:", self->_digitalContainerView, self->_dialBackgroundView);
    v7 = -[NTKDigitalTimeLabel initWithTimeLabelOptions:forDevice:]([NTKDigitalTimeLabel alloc], "initWithTimeLabelOptions:forDevice:", 1, self->_device);
    digitalTimeLabel = self->_digitalTimeLabel;
    self->_digitalTimeLabel = v7;

    v9 = self->_digitalTimeLabel;
    -[NTKDualTimeView _digitalStyle](self, "_digitalStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDigitalTimeLabel setStyle:](v9, "setStyle:", v10);

    v11 = self->_digitalTimeLabel;
    MEMORY[0x1BCCA72B8](-[NTKDualTimeView bounds](self, "bounds"));
    -[NTKDigitalTimeLabel setCenter:](v11, "setCenter:");
    -[UIView addSubview:](self->_digitalContainerView, "addSubview:", self->_digitalTimeLabel);
    -[NTKDualTimeView _setupDigitalTicks](self, "_setupDigitalTicks");
    -[UIView bringSubviewToFront:](self->_digitalContainerView, "bringSubviewToFront:", self->_digitalTimeLabel);
    -[NTKDualTimeView _startDigitalTicksAnimation](self, "_startDigitalTicksAnimation");
  }
}

- (void)_tearDownDigitalContainerView
{
  -[NTKDualTimeView _stopDigitalTicksAnimation](self, "_stopDigitalTicksAnimation");
  -[NTKDigitalTimeLabel removeFromSuperview](self->_digitalTimeLabel, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_digitalContainerView, "removeFromSuperview");
}

- (void)_setupDigitalTicks
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NTKDualTimeDigitalTicksView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  NTKDualTimeDigitalTicksView *v23;
  NTKDualTimeDigitalTicksView *digitalTicksContainerView;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];

  -[NTKDualTimeView _secondTickSize](self, "_secondTickSize");
  v25 = v4;
  v26 = v3;
  -[NTKDualTimeView _cardinalSecondTickSize](self, "_cardinalSecondTickSize");
  v6 = v5;
  v8 = v7;
  -[NTKDualTimeView _secondTickInset](self, "_secondTickInset");
  v10 = v9;
  -[NTKDualTimeView _cardinalSecondTickInset](self, "_cardinalSecondTickInset");
  v12 = v11;
  v13 = [NTKDualTimeDigitalTicksView alloc];
  -[NTKDualTimeView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v26;
  v27[1] = v25;
  v27[2] = v6;
  v27[3] = v8;
  v27[4] = v10;
  v27[5] = v12;
  v23 = -[NTKDualTimeDigitalTicksView initWithFrame:configuration:timer:](v13, "initWithFrame:configuration:timer:", v27, v22, v15, v17, v19, v21);
  digitalTicksContainerView = self->_digitalTicksContainerView;
  self->_digitalTicksContainerView = v23;

  -[NTKDualTimeDigitalTicksView setDelegate:](self->_digitalTicksContainerView, "setDelegate:", self);
  -[UIView addSubview:](self->_digitalContainerView, "addSubview:", self->_digitalTicksContainerView);
}

- (void)_startDigitalTicksAnimation
{
  -[NTKDualTimeDigitalTicksView startAnimation](self->_digitalTicksContainerView, "startAnimation");
}

- (void)_stopDigitalTicksAnimation
{
  -[NTKDualTimeDigitalTicksView stopAnimation](self->_digitalTicksContainerView, "stopAnimation");
}

- (void)_refreshDigitalTicks
{
  -[NTKDualTimeDigitalTicksView refreshTicks](self->_digitalTicksContainerView, "refreshTicks");
}

- (void)_refreshDigitalTimeLabel
{
  NTKDigitalTimeLabel *digitalTimeLabel;
  id v3;

  digitalTimeLabel = self->_digitalTimeLabel;
  -[NTKDualTimeView _digitalStyle](self, "_digitalStyle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel setStyle:](digitalTimeLabel, "setStyle:", v3);

}

- (void)setUseMonospacedDigitalNumbers:(BOOL)a3
{
  NTKDigitalTimeLabel *digitalTimeLabel;
  id v4;

  if (self->_useMonospacedDigitalNumbers != a3)
  {
    self->_useMonospacedDigitalNumbers = a3;
    digitalTimeLabel = self->_digitalTimeLabel;
    -[NTKDualTimeView _digitalStyle](self, "_digitalStyle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKDigitalTimeLabel setStyle:](digitalTimeLabel, "setStyle:", v4);

  }
}

- (id)_digitalLabelFont
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C944D0];
  -[NTKDualTimeView _digitalTimeLabelFontSize](self, "_digitalTimeLabelFontSize");
  objc_msgSend(v3, "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CLKFontWithAlternativePunctuation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_useMonospacedDigitalNumbers)
  {
    objc_msgSend(v5, "CLKFontWithMonospacedNumbers");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (id)_digitalStyle
{
  void *v3;
  void *v4;

  -[NTKDualTimeView _digitalLabelFont](self, "_digitalLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, v3, self->_device, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), 0.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_activeTimeView
{
  int *v2;

  if (self->_style)
    v2 = &OBJC_IVAR___NTKDualTimeView__digitalTimeLabel;
  else
    v2 = &OBJC_IVAR___NTKDualTimeView__analogHandsView;
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (void)setColorPalette:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_colorPalette, a3);
  if (!-[NTKDualTimeView shouldUseCustomDialBackground](self, "shouldUseCustomDialBackground"))
  {
    -[NTKDualTimeView _dialColorForColorPalette:](self, "_dialColorForColorPalette:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_dialBackgroundView, "setBackgroundColor:", v5);
    -[CLKUIAnalogHandsView secondHandView](self->_analogHandsView, "secondHandView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHandDotColor:", v5);

  }
  -[NTKDualTimeView _applyColorToAnalogHands](self, "_applyColorToAnalogHands");
  -[NTKDualTimeView _applyColorToDigitalLabelAndTicks](self, "_applyColorToDigitalLabelAndTicks");

}

- (void)_applyColorToAnalogHands
{
  NTKAnalogHandsView *analogHandsView;
  void *v4;
  void *v5;
  NTKAnalogHandsView *v6;
  void *v7;
  void *v8;
  id v9;

  analogHandsView = self->_analogHandsView;
  -[NTKDualTimeView _hourMinuteHandStrokeColorForColorPalette:](self, "_hourMinuteHandStrokeColorForColorPalette:", self->_colorPalette);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDualTimeView _hourMinuteHandFillColorForColorPalette:](self, "_hourMinuteHandFillColorForColorPalette:", self->_colorPalette);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIAnalogHandsView applyHourMinuteHandsStrokeColor:fillColor:](analogHandsView, "applyHourMinuteHandsStrokeColor:fillColor:", v4, v5);

  v6 = self->_analogHandsView;
  -[NTKDualTimeView _secondHandColorForColorPalette:](self, "_secondHandColorForColorPalette:", self->_colorPalette);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAnalogHandsView applySecondHandColor:](v6, "applySecondHandColor:", v7);

  -[NTKDualTimeView _hourTickColorForColorPalette:](self, "_hourTickColorForColorPalette:", self->_colorPalette);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKDualTimeView _minuteTickColorForColorPalette:](self, "_minuteTickColorForColorPalette:", self->_colorPalette);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDualTimeView _colorizeAnalogTicksWithHourColor:minuteColor:](self, "_colorizeAnalogTicksWithHourColor:minuteColor:", v9, v8);

}

- (void)_applyColorToDigitalLabelAndTicks
{
  NTKDigitalTimeLabel *digitalTimeLabel;
  void *v4;

  digitalTimeLabel = self->_digitalTimeLabel;
  -[NTKDualTimeView _digitalTimeLabelColorForColorPalette:](self, "_digitalTimeLabelColorForColorPalette:", self->_colorPalette);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel setColor:](digitalTimeLabel, "setColor:", v4);

  -[NTKDualTimeView _refreshDigitalTicks](self, "_refreshDigitalTicks");
}

- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  -[NTKDualTimeView applyTransitionFraction:fromColorPalette:toColorPalette:ignoreTimeView:](self, "applyTransitionFraction:fromColorPalette:toColorPalette:ignoreTimeView:", a4, a5, 0, a3);
}

- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 ignoreTimeView:(BOOL)a6
{
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NTKAnalogHandsView *analogHandsView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  v46 = a4;
  v10 = a5;
  objc_msgSend(v46, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {
    -[NTKDualTimeView setColorPalette:](self, "setColorPalette:", v46);
  }
  else
  {
    if (!-[NTKDualTimeView shouldUseCustomDialBackground](self, "shouldUseCustomDialBackground"))
    {
      -[NTKDualTimeView _dialColorForColorPalette:](self, "_dialColorForColorPalette:", v46);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKDualTimeView _dialColorForColorPalette:](self, "_dialColorForColorPalette:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NTKInterpolateBetweenColors(v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_dialBackgroundView, "setBackgroundColor:", v16);
      -[CLKUIAnalogHandsView secondHandView](self->_analogHandsView, "secondHandView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHandDotColor:", v16);

    }
    v18 = v46;
    if (!a6)
    {
      analogHandsView = self->_analogHandsView;
      -[NTKDualTimeView _hourMinuteHandStrokeColorForColorPalette:](self, "_hourMinuteHandStrokeColorForColorPalette:", v46);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKDualTimeView _hourMinuteHandFillColorForColorPalette:](self, "_hourMinuteHandFillColorForColorPalette:", v46);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKDualTimeView _hourMinuteHandStrokeColorForColorPalette:](self, "_hourMinuteHandStrokeColorForColorPalette:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKDualTimeView _hourMinuteHandFillColorForColorPalette:](self, "_hourMinuteHandFillColorForColorPalette:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKAnalogHandsView applyHourMinuteHandsTransitionFraction:fromStrokeColor:fromFillColor:toStrokeColor:toFillColor:](analogHandsView, "applyHourMinuteHandsTransitionFraction:fromStrokeColor:fromFillColor:toStrokeColor:toFillColor:", v20, v21, v22, v23, a3);

      -[NTKDualTimeView _secondHandColorForColorPalette:](self, "_secondHandColorForColorPalette:", v46);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKDualTimeView _secondHandColorForColorPalette:](self, "_secondHandColorForColorPalette:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NTKInterpolateBetweenColors(v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKAnalogHandsView applySecondHandColor:](self->_analogHandsView, "applySecondHandColor:", v26);

      v18 = v46;
    }
    -[NTKDualTimeView _hourTickColorForColorPalette:](self, "_hourTickColorForColorPalette:", v18);
    v27 = objc_claimAutoreleasedReturnValue();
    -[NTKDualTimeView _hourTickColorForColorPalette:](self, "_hourTickColorForColorPalette:", v10);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)v27;
    NTKInterpolateBetweenColors(v27, v44);
    v28 = objc_claimAutoreleasedReturnValue();
    -[NTKDualTimeView _minuteTickColorForColorPalette:](self, "_minuteTickColorForColorPalette:", v46);
    v29 = objc_claimAutoreleasedReturnValue();
    -[NTKDualTimeView _minuteTickColorForColorPalette:](self, "_minuteTickColorForColorPalette:", v10);
    v40 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v29;
    NTKInterpolateBetweenColors(v29, v40);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)v28;
    -[NTKDualTimeView _colorizeAnalogTicksWithHourColor:minuteColor:](self, "_colorizeAnalogTicksWithHourColor:minuteColor:", v28, v30);
    if (!a6)
    {
      -[NTKDualTimeView _digitalTimeLabelColorForColorPalette:](self, "_digitalTimeLabelColorForColorPalette:", v46, v40, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKDualTimeView _digitalTimeLabelColorForColorPalette:](self, "_digitalTimeLabelColorForColorPalette:", v10);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NTKInterpolateBetweenColors(v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKDigitalTimeLabel setColor:](self->_digitalTimeLabel, "setColor:", v33);

    }
    -[NTKDualTimeView _secondTickActiveColorForColorPalette:](self, "_secondTickActiveColorForColorPalette:", v46, v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDualTimeView _secondTickActiveColorForColorPalette:](self, "_secondTickActiveColorForColorPalette:", v10);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDualTimeView _secondTickInactiveColorForColorPalette:](self, "_secondTickInactiveColorForColorPalette:", v46);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDualTimeView _secondTickInactiveColorForColorPalette:](self, "_secondTickInactiveColorForColorPalette:", v10);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDualTimeDigitalTicksView setActiveTickColor:](self->_digitalTicksContainerView, "setActiveTickColor:", v36);
    -[NTKDualTimeDigitalTicksView setInactiveTickColor:](self->_digitalTicksContainerView, "setInactiveTickColor:", v39);
    -[NTKDualTimeView _refreshDigitalTicks](self, "_refreshDigitalTicks");

  }
}

- (void)applyGossamerColorPalette:(id)a3
{
  UIView *dialBackgroundView;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NTKAnalogHandsView *analogHandsView;
  void *v10;
  void *v11;
  NTKAnalogHandsView *v12;
  void *v13;
  void *v14;
  void *v15;
  NTKDigitalTimeLabel *digitalTimeLabel;
  void *v17;
  void *v18;
  void *v19;

  dialBackgroundView = self->_dialBackgroundView;
  v5 = a3;
  objc_msgSend(v5, "dialColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](dialBackgroundView, "setBackgroundColor:", v6);

  -[CLKUIAnalogHandsView secondHandView](self->_analogHandsView, "secondHandView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dialColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHandDotColor:", v8);

  analogHandsView = self->_analogHandsView;
  objc_msgSend(v5, "hourMinuteHandStrokeColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hourMinuteHandFillColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIAnalogHandsView applyHourMinuteHandsStrokeColor:fillColor:](analogHandsView, "applyHourMinuteHandsStrokeColor:fillColor:", v10, v11);

  v12 = self->_analogHandsView;
  objc_msgSend(v5, "secondHandColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAnalogHandsView applySecondHandColor:](v12, "applySecondHandColor:", v13);

  objc_msgSend(v5, "hourTickColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minuteTickColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDualTimeView _colorizeAnalogTicksWithHourColor:minuteColor:](self, "_colorizeAnalogTicksWithHourColor:minuteColor:", v14, v15);

  digitalTimeLabel = self->_digitalTimeLabel;
  objc_msgSend(v5, "digitalTimeLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel setColor:](digitalTimeLabel, "setColor:", v17);

  objc_msgSend(v5, "secondTickActiveColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDualTimeDigitalTicksView setActiveTickColor:](self->_digitalTicksContainerView, "setActiveTickColor:", v18);

  objc_msgSend(v5, "secondTickInactiveColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKDualTimeDigitalTicksView setInactiveTickColor:](self->_digitalTicksContainerView, "setInactiveTickColor:", v19);
  -[NTKDualTimeView _refreshDigitalTicks](self, "_refreshDigitalTicks");
}

- (void)setSecondsHidden:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  _QWORD v5[5];
  BOOL v6;
  BOOL v7;

  v4 = 1.0;
  if (a3)
    v4 = 0.0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__NTKDualTimeView_setSecondsHidden_animated___block_invoke;
  v5[3] = &unk_1E6BD9A80;
  v5[4] = self;
  v6 = v4 != 0.0;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, a4, 0.1);
}

void __45__NTKDualTimeView_setSecondsHidden_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "style");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 496), "setHideActiveTicks:", *(unsigned __int8 *)(a1 + 41));
  }
  else
  {
    objc_msgSend(*(id *)(v3 + 472), "secondHandView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = 0.0;
    if (*(_BYTE *)(a1 + 40))
      v5 = 1.0;
    objc_msgSend(v4, "setAlpha:", v5);

  }
}

- (void)setStyle:(unint64_t)a3
{
  NTKAnalogHandsView *analogHandsView;
  __int128 v5;
  UIView *digitalContainerView;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  self->_style = a3;
  if (a3 == 1)
  {
    -[UIView setAlpha:](self->_analogContainerView, "setAlpha:", 0.0);
    -[NTKAnalogHandsView setAlpha:](self->_analogHandsView, "setAlpha:", 0.0);
    -[UIView setAlpha:](self->_digitalContainerView, "setAlpha:", 1.0);
    digitalContainerView = self->_digitalContainerView;
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v8 = *MEMORY[0x1E0C9BAA8];
    v9 = v7;
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIView setTransform:](digitalContainerView, "setTransform:", &v8);
    -[NTKDualTimeView _startDigitalTicksAnimation](self, "_startDigitalTicksAnimation");
  }
  else if (!a3)
  {
    -[UIView setAlpha:](self->_analogContainerView, "setAlpha:", 1.0);
    -[NTKAnalogHandsView setAlpha:](self->_analogHandsView, "setAlpha:", 1.0);
    analogHandsView = self->_analogHandsView;
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v8 = *MEMORY[0x1E0C9BAA8];
    v9 = v5;
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[NTKAnalogHandsView setTransform:](analogHandsView, "setTransform:", &v8);
    -[UIView setAlpha:](self->_digitalContainerView, "setAlpha:", 0.0);
    -[NTKDualTimeView _stopDigitalTicksAnimation](self, "_stopDigitalTicksAnimation");
  }
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  double v8;
  double v9;
  int *v10;
  int *v11;
  void *v12;
  double v13;
  id v14;
  double v15;
  UIView *v16;

  if (a4 == a5)
  {
    -[NTKDualTimeView setStyle:](self, "setStyle:", a4, a3);
  }
  else
  {
    CLKInterpolateBetweenFloatsClipped();
    v9 = v8;
    v10 = &OBJC_IVAR___NTKDualTimeView__digitalContainerView;
    if (a4)
      v11 = &OBJC_IVAR___NTKDualTimeView__digitalContainerView;
    else
      v11 = &OBJC_IVAR___NTKDualTimeView__analogContainerView;
    v12 = *(Class *)((char *)&self->super.super.super.isa + *v11);
    v13 = 1.0 - v8;
    if (!a5)
      v10 = &OBJC_IVAR___NTKDualTimeView__analogContainerView;
    v14 = *(id *)((char *)&self->super.super.super.isa + *v10);
    v16 = v12;
    -[UIView setAlpha:](v16, "setAlpha:", v13);
    objc_msgSend(v14, "setAlpha:", v9);
    if (v16 == self->_analogContainerView)
      v15 = v13;
    else
      v15 = v9;
    -[NTKAnalogHandsView setAlpha:](self->_analogHandsView, "setAlpha:", v15);

  }
}

- (id)_dialColorForColorPalette:(id)a3
{
  double v3;

  if (objc_msgSend(a3, "isWhiteColor"))
    v3 = 0.898039216;
  else
    v3 = 0.129411765;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v3, v3, v3, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)_minuteTickInset
{
  return 4.0;
}

- (CGSize)_hourTickSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[NTKDualTimeView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CLKSizeForDeviceMetrics();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)_minuteTickSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[NTKDualTimeView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CLKSizeForDeviceMetrics();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)_hourTickCount
{
  return 12;
}

- (unint64_t)_minuteTickCount
{
  return 60;
}

- (id)_hourTickColorForColorPalette:(id)a3
{
  int v3;
  double v4;

  v3 = objc_msgSend(a3, "isWhiteColor");
  v4 = 1.0;
  if (v3)
    v4 = 0.0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v4, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_minuteTickColorForColorPalette:(id)a3
{
  int v3;
  double v4;

  v3 = objc_msgSend(a3, "isWhiteColor");
  v4 = 0.4;
  if (v3)
    v4 = 0.6;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v4, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_hourMinuteHandFillColorForColorPalette:(id)a3
{
  if (objc_msgSend(a3, "isWhiteColor"))
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor", a3);
}

- (id)_secondHandColorForColorPalette:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor", a3);
}

- (double)_secondTickInset
{
  return 4.0;
}

- (CGSize)_secondTickSize
{
  double v2;
  double v3;
  CGSize result;

  CLKSizeForDeviceMetrics();
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_digitalTimeLabelFontSize
{
  double result;

  CLKValueForDeviceMetrics();
  return result;
}

- (id)_digitalTimeLabelColorForColorPalette:(id)a3
{
  if (objc_msgSend(a3, "isWhiteColor"))
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_secondTickActiveColorForColorPalette:(id)a3
{
  int v3;
  double v4;

  v3 = objc_msgSend(a3, "isWhiteColor");
  v4 = 1.0;
  if (v3)
    v4 = 0.0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v4, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_secondTickInactiveColorForColorPalette:(id)a3
{
  int v3;
  double v4;

  v3 = objc_msgSend(a3, "isWhiteColor");
  v4 = 0.4;
  if (v3)
    v4 = 0.7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v4, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  NSDate *v7;
  NSDate *v8;

  v7 = (NSDate *)a3;
  if (self->_overrideDate != v7)
  {
    v8 = v7;
    -[NTKAnalogHandsView setOverrideDate:duration:](self->_analogHandsView, "setOverrideDate:duration:", v7, a4);
    -[NTKDigitalTimeLabel setOverrideDate:duration:](self->_digitalTimeLabel, "setOverrideDate:duration:", v8, a4);
    objc_storeStrong((id *)&self->_overrideDate, a3);
    -[NTKDualTimeDigitalTicksView setOverrideDate:](self->_digitalTicksContainerView, "setOverrideDate:", v8);
    -[NTKDualTimeView _refreshDigitalTicks](self, "_refreshDigitalTicks");
    v7 = v8;
  }

}

- (void)setTimeOffset:(double)a3
{
  -[NTKAnalogHandsView setTimeOffset:](self->_analogHandsView, "setTimeOffset:");
  -[NTKDigitalTimeLabel setTimeOffset:](self->_digitalTimeLabel, "setTimeOffset:", a3);
}

- (void)setFrozen:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_frozen = a3;
  -[CLKUIAnalogHandsView setFrozen:](self->_analogHandsView, "setFrozen:");
  -[NTKDigitalTimeLabel setFrozen:](self->_digitalTimeLabel, "setFrozen:", v3);
  -[NTKDualTimeDigitalTicksView setFrozen:](self->_digitalTicksContainerView, "setFrozen:", v3);
  -[NTKDualTimeView _refreshDigitalTicks](self, "_refreshDigitalTicks");
}

- (void)setForcedNumberSystemForDigitalTimeLabel:(unint64_t)a3
{
  id v4;

  -[NTKDualTimeView digitalTimeLabel](self, "digitalTimeLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForcedNumberSystem:", a3);

}

- (id)activeColorForDualTimeDigitalTicksView:(id)a3
{
  return -[NTKDualTimeView _secondTickActiveColorForColorPalette:](self, "_secondTickActiveColorForColorPalette:", self->_colorPalette);
}

- (id)inactiveColorForDualTimeDigitalTicksView:(id)a3
{
  return -[NTKDualTimeView _secondTickInactiveColorForColorPalette:](self, "_secondTickInactiveColorForColorPalette:", self->_colorPalette);
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)useMonospacedDigitalNumbers
{
  return self->_useMonospacedDigitalNumbers;
}

- (unint64_t)style
{
  return self->_style;
}

- (NTKFaceColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (UIView)dialBackgroundView
{
  return self->_dialBackgroundView;
}

- (void)setDialBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_dialBackgroundView, a3);
}

- (NTKAnalogHandsView)analogHandsView
{
  return self->_analogHandsView;
}

- (void)setAnalogHandsView:(id)a3
{
  objc_storeStrong((id *)&self->_analogHandsView, a3);
}

- (NTKDigitalTimeLabel)digitalTimeLabel
{
  return self->_digitalTimeLabel;
}

- (UIView)digitalContainerView
{
  return self->_digitalContainerView;
}

- (NTKDualTimeDigitalTicksView)digitalTicksContainerView
{
  return self->_digitalTicksContainerView;
}

- (UIView)dialContainerView
{
  return self->_dialContainerView;
}

- (void)setDialContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_dialContainerView, a3);
}

- (UIView)analogContainerView
{
  return self->_analogContainerView;
}

- (void)setAnalogContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_analogContainerView, a3);
}

- (CLKUIDualTimeAnalogTicksView)analogTickContainerView
{
  return self->_analogTickContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analogTickContainerView, 0);
  objc_storeStrong((id *)&self->_analogContainerView, 0);
  objc_storeStrong((id *)&self->_dialContainerView, 0);
  objc_storeStrong((id *)&self->_digitalTicksContainerView, 0);
  objc_storeStrong((id *)&self->_digitalContainerView, 0);
  objc_storeStrong((id *)&self->_digitalTimeLabel, 0);
  objc_storeStrong((id *)&self->_analogHandsView, 0);
  objc_storeStrong((id *)&self->_dialBackgroundView, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_blackPalette, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
}

@end
