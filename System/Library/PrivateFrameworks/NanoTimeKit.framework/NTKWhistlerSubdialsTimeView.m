@implementation NTKWhistlerSubdialsTimeView

- (NTKWhistlerSubdialsTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 andDevice:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKWhistlerSubdialsTimeView;
  return -[NTKDualTimeView initWithFrame:style:andDevice:](&v6, sel_initWithFrame_style_andDevice_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NTKWhistlerAnalogColorPalette)palette
{
  NTKWhistlerAnalogColorPalette *palette;
  NTKWhistlerAnalogColorPalette *v4;
  void *v5;
  NTKWhistlerAnalogColorPalette *v6;
  NTKWhistlerAnalogColorPalette *v7;

  palette = self->_palette;
  if (!palette)
  {
    v4 = [NTKWhistlerAnalogColorPalette alloc];
    -[NTKDualTimeView device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKWhistlerAnalogColorPalette initWithDevice:](v4, "initWithDevice:", v5);
    v7 = self->_palette;
    self->_palette = v6;

    palette = self->_palette;
  }
  return palette;
}

- (double)_minuteTickInset
{
  void *v2;
  double v3;
  double v5[7];

  -[NTKDualTimeView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_20(v2, (uint64_t)v5);
  v3 = v5[0];

  return v3;
}

- (CGSize)_hourTickSize
{
  void *v2;
  double v3;
  double v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  CGSize result;

  v8 = 0;
  v6 = 0u;
  v7 = 0u;
  v5 = 0u;
  -[NTKDualTimeView device](self, "device", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_20(v2, (uint64_t)&v5);

  v3 = *((double *)&v5 + 1);
  v4 = *(double *)&v6;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_minuteTickSize
{
  void *v2;
  double v3;
  double v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  CGSize result;

  v8 = 0;
  v6 = 0u;
  v7 = 0u;
  -[NTKDualTimeView device](self, "device", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_20(v2, (uint64_t)&v5);

  v3 = *((double *)&v6 + 1);
  v4 = *(double *)&v7;
  result.height = v4;
  result.width = v3;
  return result;
}

- (unint64_t)_hourTickCount
{
  void *v2;
  unint64_t v3;
  _BYTE v5[40];
  unint64_t v6;

  -[NTKDualTimeView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_20(v2, (uint64_t)v5);
  v3 = v6;

  return v3;
}

- (unint64_t)_minuteTickCount
{
  void *v2;
  unint64_t v3;
  _BYTE v5[48];
  unint64_t v6;

  -[NTKDualTimeView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_20(v2, (uint64_t)v5);
  v3 = v6;

  return v3;
}

- (id)_hourMinuteHandFillColorForColorPalette:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor", a3);
}

- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3
{
  void *v3;
  int v4;

  -[NTKDualTimeView colorPalette](self, "colorPalette", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWhiteColor");

  if (v4)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_secondHandColorForColorPalette:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  char v9;
  void *v10;

  -[NTKDualTimeView colorPalette](self, "colorPalette", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isMulticolor") & 1) != 0)
    goto LABEL_4;
  -[NTKDualTimeView colorPalette](self, "colorPalette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isWhiteColor"))
  {

LABEL_4:
    goto LABEL_5;
  }
  -[NTKDualTimeView colorPalette](self, "colorPalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isBlackColor");

  if ((v9 & 1) == 0)
  {
    -[NTKDualTimeView colorPalette](self, "colorPalette");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
LABEL_5:
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)_digitalTimeLabelColorForColorPalette:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKWhistlerSubdialsTimeView palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hourTicksColorForColorPalette:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_digitalLabelFont
{
  void *v3;
  int v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v14;

  -[NTKDualTimeView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKShowIndicScriptNumerals(v3);

  if (v4)
  {
    -[NTKDualTimeView _digitalTimeLabelFontSize](self, "_digitalTimeLabelFontSize");
    v6 = v5;
    if (self->_numberSystem != -1)
    {
      -[NTKWhistlerSubdialsTimeView fontScaleFactorForNumberSystemOverrides](self, "fontScaleFactorForNumberSystemOverrides");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", self->_numberSystem);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");

      -[NTKDualTimeView device](self, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CLKRoundForDevice();
      v6 = v10;

    }
    +[NTKSFCompactFont numericFontOfSize:weight:](NTKSFCompactFont, "numericFontOfSize:weight:", v6, *MEMORY[0x1E0DC1440]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CLKFontWithAlternativePunctuation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NTKWhistlerSubdialsTimeView;
    -[NTKDualTimeView _digitalLabelFont](&v14, sel__digitalLabelFont);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (void)setForcedNumberSystemForDigitalTimeLabel:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKWhistlerSubdialsTimeView;
  -[NTKDualTimeView setForcedNumberSystemForDigitalTimeLabel:](&v5, sel_setForcedNumberSystemForDigitalTimeLabel_);
  self->_numberSystem = a3;
  -[NTKDualTimeView _refreshDigitalTimeLabel](self, "_refreshDigitalTimeLabel");
}

- (NSArray)fontScaleFactorForNumberSystemOverrides
{
  NSArray *fontScaleFactorForNumberSystemOverrides;

  fontScaleFactorForNumberSystemOverrides = self->_fontScaleFactorForNumberSystemOverrides;
  if (!fontScaleFactorForNumberSystemOverrides)
  {
    self->_fontScaleFactorForNumberSystemOverrides = (NSArray *)&unk_1E6CA9C28;

    fontScaleFactorForNumberSystemOverrides = self->_fontScaleFactorForNumberSystemOverrides;
  }
  return fontScaleFactorForNumberSystemOverrides;
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
}

- (void)setFontScaleFactorForNumberSystemOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverrides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverrides, 0);
  objc_storeStrong((id *)&self->_palette, 0);
}

@end
