@implementation NTKDigitalTimeLabel

- (NTKDigitalTimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKDigitalTimeLabel;
  return -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:](&v5, sel_initWithTimeLabelOptions_forDevice_, a3, a4);
}

- (void)setFrameUsingCurrentStyle
{
  void *v3;
  void *v4;
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

  -[CLKUITimeLabel style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel bounds](self, "bounds");
  objc_msgSend(v4, "calculateLayoutFrameForBoundsSize:", v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[UIView ntk_setBoundsAndPositionFromFrame:](self, "ntk_setBoundsAndPositionFromFrame:", v8, v10, v12, v14);
}

- (void)setStyle:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[CLKUITimeLabel style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)NTKDigitalTimeLabel;
  -[CLKUITimeLabel setStyle:](&v6, sel_setStyle_, v4);
  objc_msgSend(v4, "isEqual:", v5);

}

- (id)_newUnderlyingLabel:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;

  v3 = a3;
  v5 = objc_alloc((Class)off_1E6BCA6E0);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:options:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NTKDigitalTimeLabel color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v7);

  objc_msgSend(v6, "setShadowBlur:", 10.0);
  v8 = v3 && self->_usesLegibility;
  objc_msgSend(v6, "setUsesLegibility:", v8);
  -[CLKUITimeLabel style](self, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tracking");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v6, "setTracking:");
  }

  return v6;
}

- (void)setShadowColor:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  objc_storeStrong((id *)&self->_shadowColor, a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__NTKDigitalTimeLabel_setShadowColor___block_invoke;
  v7[3] = &unk_1E6BD62B0;
  v8 = v5;
  v6 = v5;
  -[CLKUITimeLabel _enumerateUnderlyingLabelsWithBlock:](self, "_enumerateUnderlyingLabelsWithBlock:", v7);

}

uint64_t __38__NTKDigitalTimeLabel_setShadowColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShadowColor:", *(_QWORD *)(a1 + 32));
}

- (void)applyFaceColorPalette:(id)a3 device:(id)a4
{
  double v4;

  LODWORD(v4) = 1.0;
  -[NTKDigitalTimeLabel applyFaceFromColorPalette:toColorPalette:fraction:device:](self, "applyFaceFromColorPalette:toColorPalette:fraction:device:", a3, a3, a4, v4);
}

- (void)applyFaceFromColorPalette:(id)a3 toColorPalette:(id)a4 fraction:(float)a5 device:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v9 = a6;
  v10 = a4;
  -[NTKDigitalTimeLabel _labelColorFromFaceColorPalette:device:](self, "_labelColorFromFaceColorPalette:device:", a3, v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel _labelColorFromFaceColorPalette:device:](self, "_labelColorFromFaceColorPalette:device:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  NTKInterpolateBetweenColors(v13, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel setColor:](self, "setColor:", v12);

}

- (id)_labelColorFromFaceColorPalette:(id)a3 device:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (objc_msgSend(v5, "isMulticolor"))
    -[NTKDigitalTimeLabel overrideColor](self, "overrideColor");
  else
    objc_msgSend(v5, "primaryColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setTextColor:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKDigitalTimeLabel;
  -[CLKUITimeLabel setTextColor:](&v8, sel_setTextColor_, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__NTKDigitalTimeLabel_setTextColor___block_invoke;
  v6[3] = &unk_1E6BD62B0;
  v7 = v4;
  v5 = v4;
  -[CLKUITimeLabel _enumerateUnderlyingLabelsWithBlock:](self, "_enumerateUnderlyingLabelsWithBlock:", v6);

}

uint64_t __36__NTKDigitalTimeLabel_setTextColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColor:", *(_QWORD *)(a1 + 32));
}

- (UIColor)contentColor
{
  return 0;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setUsesLegibility:(BOOL)a3
{
  _QWORD v3[5];

  self->_usesLegibility = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__NTKDigitalTimeLabel_setUsesLegibility___block_invoke;
  v3[3] = &unk_1E6BD62B0;
  v3[4] = self;
  -[CLKUITimeLabel _enumerateUnderlyingLabelsWithBlock:](self, "_enumerateUnderlyingLabelsWithBlock:", v3);
}

uint64_t __41__NTKDigitalTimeLabel_setUsesLegibility___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUsesLegibility:");
}

- (void)setForcedNumberSystem:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKDigitalTimeLabel;
  -[CLKUITimeLabel setForcedNumberSystem:](&v3, sel_setForcedNumberSystem_, a3);
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[CLKUITimeLabel timeFormatter](self, "timeFormatter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverrideDate:", v5);

}

- (void)setTimeOffset:(double)a3
{
  id v4;

  -[CLKUITimeLabel timeFormatter](self, "timeFormatter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeOffset:", a3);

}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
  -[CLKUITimeLabel setPaused:](self, "setPaused:");
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKDigitalTimeLabel;
  -[CLKUITimeLabel layoutSubviews](&v2, sel_layoutSubviews);
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
}

@end
