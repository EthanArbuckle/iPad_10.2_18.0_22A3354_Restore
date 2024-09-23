@implementation HUWaveformView

- (HUWaveformView)initWithFrame:(CGRect)a3 waveformColor:(id)a4 backgroundColor:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  HUWaveformView *v14;
  uint64_t v15;
  NSMutableArray *waveformSlices;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  uint64_t v21;
  SUICFlamesView *flamesView;
  objc_super v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HUWaveformView;
  v14 = -[HUWaveformView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v14)
  {
    v15 = objc_opt_new();
    waveformSlices = v14->_waveformSlices;
    v14->_waveformSlices = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v14->_waveformColor, a4);
    objc_storeStrong((id *)&v14->_backgroundColor, a5);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v17 = (void *)_MergedGlobals_1_0;
    v29 = _MergedGlobals_1_0;
    if (!_MergedGlobals_1_0)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __getSUICFlamesViewClass_block_invoke;
      v25[3] = &unk_1E6F4C868;
      v25[4] = &v26;
      __getSUICFlamesViewClass_block_invoke((uint64_t)v25);
      v17 = (void *)v27[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v26, 8);
    v19 = [v18 alloc];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithFrame:screen:fidelity:", v20, 2, x, y, width, height);
    flamesView = v14->_flamesView;
    v14->_flamesView = (SUICFlamesView *)v21;

    -[SUICFlamesView setDelegate:](v14->_flamesView, "setDelegate:", v14);
    -[SUICFlamesView setMode:](v14->_flamesView, "setMode:", 1);
    -[SUICFlamesView setState:](v14->_flamesView, "setState:", 1);
    -[SUICFlamesView setDictationColor:](v14->_flamesView, "setDictationColor:", v12);
    -[HUWaveformView addSubview:](v14, "addSubview:", v14->_flamesView);
  }

  return v14;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUWaveformView;
  -[HUWaveformView layoutSubviews](&v6, sel_layoutSubviews);
  -[HUWaveformView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 1);

  -[HUWaveformView flamesView](self, "flamesView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWaveformView bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");

  -[HUWaveformView flamesView](self, "flamesView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)setWaveformColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_waveformColor, a3);
  v5 = a3;
  -[SUICFlamesView setDictationColor:](self->_flamesView, "setDictationColor:", v5);

}

- (void)appendPowerLevel:(double)a3
{
  void *v5;
  id v6;

  -[HUWaveformView audioPowerLevels](self, "audioPowerLevels");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUWaveformView setAudioPowerLevels:](self, "setAudioPowerLevels:");
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

}

- (void)clearPowerLevels
{
  void *v3;

  -[HUWaveformView setAudioPowerLevels:](self, "setAudioPowerLevels:", 0);
  -[HUWaveformView waveformSlices](self, "waveformSlices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[HUWaveformView setNeedsLayout](self, "setNeedsLayout");
}

- (NSArray)powerLevels
{
  void *v2;
  void *v3;

  -[HUWaveformView audioPowerLevels](self, "audioPowerLevels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (float)audioLevelForFlamesView:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  float v6;

  -[HUWaveformView audioPowerLevels](self, "audioPowerLevels", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (UIColor)waveformColor
{
  return self->_waveformColor;
}

- (NSMutableArray)audioPowerLevels
{
  return self->_audioPowerLevels;
}

- (void)setAudioPowerLevels:(id)a3
{
  objc_storeStrong((id *)&self->_audioPowerLevels, a3);
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (double)minTimeLabelWidth
{
  return self->_minTimeLabelWidth;
}

- (void)setMinTimeLabelWidth:(double)a3
{
  self->_minTimeLabelWidth = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (NSMutableArray)waveformSlices
{
  return self->_waveformSlices;
}

- (void)setWaveformSlices:(id)a3
{
  objc_storeStrong((id *)&self->_waveformSlices, a3);
}

- (SUICFlamesView)flamesView
{
  return self->_flamesView;
}

- (void)setFlamesView:(id)a3
{
  objc_storeStrong((id *)&self->_flamesView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flamesView, 0);
  objc_storeStrong((id *)&self->_waveformSlices, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_audioPowerLevels, 0);
  objc_storeStrong((id *)&self->_waveformColor, 0);
}

@end
