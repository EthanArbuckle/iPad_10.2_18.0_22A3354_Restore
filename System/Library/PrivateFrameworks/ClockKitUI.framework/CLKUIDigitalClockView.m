@implementation CLKUIDigitalClockView

- (CLKUIDigitalClockView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v6;
  id v7;
  CLKUIDigitalClockView *v8;
  CLKUITimeLabel *v9;
  CLKUITimeLabel *timeLabel;
  CLKUITimeLabel *v11;
  CLKUITimeLabel *inactiveTimeLabel;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLKUIDigitalClockView;
  v8 = -[CLKUITimeView initWithDevice:clockTimer:](&v14, sel_initWithDevice_clockTimer_, v6, v7);
  if (v8)
  {
    v9 = -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:clockTimer:]([CLKUITimeLabel alloc], "initWithTimeLabelOptions:forDevice:clockTimer:", 1, v6, v7);
    timeLabel = v8->_timeLabel;
    v8->_timeLabel = v9;

    v11 = -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:clockTimer:]([CLKUITimeLabel alloc], "initWithTimeLabelOptions:forDevice:clockTimer:", 1, v6, v7);
    inactiveTimeLabel = v8->_inactiveTimeLabel;
    v8->_inactiveTimeLabel = v11;

    -[CLKUITimeLabel setAlpha:](v8->_inactiveTimeLabel, "setAlpha:", 0.0);
    -[CLKUIDigitalClockView addSubview:](v8, "addSubview:", v8->_timeLabel);
    -[CLKUIDigitalClockView addSubview:](v8, "addSubview:", v8->_inactiveTimeLabel);
  }

  return v8;
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
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)CLKUIDigitalClockView;
  -[CLKUIDigitalClockView layoutSubviews](&v29, sel_layoutSubviews);
  MEMORY[0x1D17A167C](-[CLKUIDigitalClockView bounds](self, "bounds"));
  v4 = v3;
  -[CLKUITimeLabel setCenter:](self->_timeLabel, "setCenter:");
  -[CLKUITimeLabel frame](self->_timeLabel, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CLKUITimeLabel _lastLineBaseline](self->_timeLabel, "_lastLineBaseline");
  v12 = v4 - v11;
  -[CLKUITimeLabel _lastLineBaseline](self->_timeLabel, "_lastLineBaseline");
  v14 = v13;
  -[CLKUITimeLabel _capOffsetFromBoundsTop](self->_timeLabel, "_capOffsetFromBoundsTop");
  v16 = v12 + (v14 - v15) * 0.5;
  -[CLKUITimeLabel setFrame:](self->_timeLabel, "setFrame:", v6, v16, v8, v10);
  -[CLKUITimeLabel setFrame:](self->_inactiveTimeLabel, "setFrame:", v6, v16, v8, v10);
  if (self->_ticksView)
  {
    -[CLKUIDigitalClockView bounds](self, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[CLKUITimeView dialInset](self, "dialInset");
    v26 = v25;
    -[CLKUITimeView dialInset](self, "dialInset");
    v28 = v27;
    v30.origin.x = v18;
    v30.origin.y = v20;
    v30.size.width = v22;
    v30.size.height = v24;
    v31 = CGRectInset(v30, v26, v28);
    -[CLKUIDualTimeDigitalTicksView setFrame:](self->_ticksView, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  }
}

- (void)setConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CLKUIDualTimeDigitalTicksView *ticksView;
  CLKUIDualTimeDigitalTicksView *v13;
  void *v14;
  CLKUIDualTimeDigitalTicksView *v15;
  CLKUIDualTimeDigitalTicksView *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[6];
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CLKUIDigitalClockView;
  -[CLKUITimeView setConfiguration:](&v33, sel_setConfiguration_, v4);
  -[CLKUITimeView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_0(v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;

  ticksView = self->_ticksView;
  if (ticksView)
  {
    -[CLKUIDualTimeDigitalTicksView setFrozen:](ticksView, "setFrozen:", 0);
    -[CLKUIDualTimeDigitalTicksView startAnimation](self->_ticksView, "startAnimation");
    -[CLKUIDualTimeDigitalTicksView setHidden:](self->_ticksView, "setHidden:", 0);
  }
  else
  {
    v13 = [CLKUIDualTimeDigitalTicksView alloc];
    -[CLKUITimeView clockTimer](self, "clockTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v7;
    v32[1] = v9;
    v32[2] = v7;
    v32[3] = v9;
    v32[4] = v11;
    v32[5] = v11;
    v15 = -[CLKUIDualTimeDigitalTicksView initWithConfiguration:timer:](v13, "initWithConfiguration:timer:", v32, v14);
    v16 = self->_ticksView;
    self->_ticksView = v15;

    -[CLKUIDualTimeDigitalTicksView startAnimation](self->_ticksView, "startAnimation");
    -[CLKUIDigitalClockView addSubview:](self, "addSubview:", self->_ticksView);
  }
  objc_msgSend(v4, "activeTickColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    -[CLKUITimeView timeColor](self, "timeColor");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  -[CLKUIDualTimeDigitalTicksView setActiveTickColor:](self->_ticksView, "setActiveTickColor:", v20);
  objc_msgSend(v20, "colorWithAlphaComponent:", 0.5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIDualTimeDigitalTicksView setInactiveTickColor:](self->_ticksView, "setInactiveTickColor:", v21);

  -[CLKUIDualTimeDigitalTicksView refreshTicks](self->_ticksView, "refreshTicks");
  objc_msgSend(v4, "forcedNumberSystem");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  v24 = &unk_1E86EEEE8;
  if (v22)
    v24 = (void *)v22;
  v25 = v24;

  v26 = objc_msgSend(v25, "unsignedIntegerValue");
  -[CLKUITimeLabel setForcedNumberSystem:](self->_timeLabel, "setForcedNumberSystem:", v26);
  -[CLKUITimeLabel setForcedNumberSystem:](self->_inactiveTimeLabel, "setForcedNumberSystem:", v26);
  -[CLKUIDigitalClockView _fontForConfiguration:](self, "_fontForConfiguration:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUITimeLabel setFont:](self->_timeLabel, "setFont:", v27);
  -[CLKUITimeLabel setFont:](self->_inactiveTimeLabel, "setFont:", v27);
  objc_msgSend(v4, "timeLabelColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[CLKUITimeLabel setTextColor:](self->_timeLabel, "setTextColor:", v28);
  }
  else
  {
    -[CLKUITimeView timeColor](self, "timeColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabel setTextColor:](self->_timeLabel, "setTextColor:", v29);

  }
  objc_msgSend(v4, "timeLabelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[CLKUITimeLabel setTextColor:](self->_inactiveTimeLabel, "setTextColor:", v30);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabel setTextColor:](self->_inactiveTimeLabel, "setTextColor:", v31);

  }
}

- (id)_fontForConfiguration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;

  v4 = a3;
  -[CLKUITimeView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _LayoutConstants_0(v5);

  objc_msgSend(v4, "forcedNumberSystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "forcedNumberSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if (v9 != -1)
    {
      -[CLKUIDigitalClockView fontScaleFactorForNumberSystemOverridesWithTicks](self, "fontScaleFactorForNumberSystemOverridesWithTicks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v9 < v11)
      {
        -[CLKUIDigitalClockView fontScaleFactorForNumberSystemOverridesWithTicks](self, "fontScaleFactorForNumberSystemOverridesWithTicks");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");

        -[CLKUITimeView device](self, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        CLKRoundForDevice();
        v6 = v15;

      }
    }
  }
  objc_msgSend(v4, "timeLabelFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fontWithSize:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0CA8428], v6, *MEMORY[0x1E0DC4B88]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void)setState:(unint64_t)a3
{
  CLKUIDualTimeDigitalTicksView *v5;
  CLKUIDualTimeDigitalTicksView *ticksView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKUIDigitalClockView;
  -[CLKUITimeView setState:](&v7, sel_setState_);
  if (a3 == 1)
  {
    -[CLKUITimeLabel setPaused:](self->_timeLabel, "setPaused:", 1);
    -[CLKUITimeLabel setPaused:](self->_inactiveTimeLabel, "setPaused:", 1);
    ticksView = self->_ticksView;
    if (ticksView)
    {
      -[CLKUIDualTimeDigitalTicksView setFrozen:](ticksView, "setFrozen:", 1);
      -[CLKUIDualTimeDigitalTicksView stopAnimation](self->_ticksView, "stopAnimation");
    }
  }
  else if (!a3)
  {
    -[CLKUITimeLabel setPaused:](self->_timeLabel, "setPaused:", 0);
    -[CLKUITimeLabel setPaused:](self->_inactiveTimeLabel, "setPaused:", 0);
    v5 = self->_ticksView;
    if (v5)
    {
      -[CLKUIDualTimeDigitalTicksView setFrozen:](v5, "setFrozen:", 0);
      -[CLKUIDualTimeDigitalTicksView startAnimation](self->_ticksView, "startAnimation");
    }
  }
}

- (void)setOverrideDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKUIDigitalClockView;
  v4 = a3;
  -[CLKUITimeView setOverrideDate:](&v7, sel_setOverrideDate_, v4);
  -[CLKUITimeLabel timeFormatter](self->_timeLabel, "timeFormatter", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverrideDate:", v4);

  -[CLKUITimeLabel timeFormatter](self->_inactiveTimeLabel, "timeFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverrideDate:", v4);

}

- (void)setAodTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  _OWORD v7[3];
  _OWORD v8[3];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLKUIDigitalClockView;
  v5 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&a3->tx;
  -[CLKUITimeView setAodTransform:](&v9, sel_setAodTransform_, v8);
  v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  -[CLKUIDigitalClockView setTransform:](self, "setTransform:", v7);
}

- (NSArray)fontScaleFactorForNumberSystemOverridesWithTicks
{
  NSArray *fontScaleFactorForNumberSystemOverridesWithTicks;

  fontScaleFactorForNumberSystemOverridesWithTicks = self->_fontScaleFactorForNumberSystemOverridesWithTicks;
  if (!fontScaleFactorForNumberSystemOverridesWithTicks)
  {
    self->_fontScaleFactorForNumberSystemOverridesWithTicks = (NSArray *)&unk_1E86EF798;

    fontScaleFactorForNumberSystemOverridesWithTicks = self->_fontScaleFactorForNumberSystemOverridesWithTicks;
  }
  return fontScaleFactorForNumberSystemOverridesWithTicks;
}

- (NSArray)fontScaleFactorForNumberSystemOverridesWithoutTicks
{
  NSArray *fontScaleFactorForNumberSystemOverridesWithoutTicks;

  fontScaleFactorForNumberSystemOverridesWithoutTicks = self->_fontScaleFactorForNumberSystemOverridesWithoutTicks;
  if (!fontScaleFactorForNumberSystemOverridesWithoutTicks)
  {
    self->_fontScaleFactorForNumberSystemOverridesWithoutTicks = (NSArray *)&unk_1E86EF7B0;

    fontScaleFactorForNumberSystemOverridesWithoutTicks = self->_fontScaleFactorForNumberSystemOverridesWithoutTicks;
  }
  return fontScaleFactorForNumberSystemOverridesWithoutTicks;
}

- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  CLKUIDualTimeDigitalTicksView *ticksView;

  v5 = a4;
  -[CLKUIDigitalClockView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "activeAppearance");
  v8 = objc_msgSend(v5, "activeAppearance");

  if (v7 != v8)
  {
    -[CLKUIDigitalClockView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "activeAppearance"))
      v10 = 1.0;
    else
      v10 = 0.0;

    -[CLKUITimeLabel setAlpha:](self->_timeLabel, "setAlpha:", v10);
    -[CLKUITimeLabel setAlpha:](self->_inactiveTimeLabel, "setAlpha:", 1.0 - v10);
    ticksView = self->_ticksView;
    if (ticksView)
      -[CLKUIDualTimeDigitalTicksView setAlpha:](ticksView, "setAlpha:", v10);
  }
}

- (void)setFontScaleFactorForNumberSystemOverridesWithTicks:(id)a3
{
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverridesWithTicks, a3);
}

- (void)setFontScaleFactorForNumberSystemOverridesWithoutTicks:(id)a3
{
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverridesWithoutTicks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverridesWithoutTicks, 0);
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverridesWithTicks, 0);
  objc_storeStrong((id *)&self->_ticksView, 0);
  objc_storeStrong((id *)&self->_inactiveTimeLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end
