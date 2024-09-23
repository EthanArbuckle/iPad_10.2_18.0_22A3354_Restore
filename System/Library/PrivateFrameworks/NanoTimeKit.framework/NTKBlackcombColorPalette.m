@implementation NTKBlackcombColorPalette

- (NTKBlackcombColorPalette)init
{
  uint64_t v3;
  objc_super v5;

  v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)NTKBlackcombColorPalette;
  return -[NTKFaceColorPalette initWithFaceClass:](&v5, sel_initWithFaceClass_, v3);
}

- (id)identifier
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)NTKBlackcombColorPalette;
  -[NTKFaceColorPalette identifier](&v7, sel_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%lu"), v4, self->_dialColorStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKBlackcombColorPalette;
  v4 = -[NTKFaceColorPalette copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[11] = -[NTKBlackcombColorPalette dialColorStyle](self, "dialColorStyle");
  return v4;
}

- (id)transitionalPaletteFromDialColor:(unint64_t)a3 toDialColor:(unint64_t)a4
{
  NTKInterpolatedColorPalette *dialColorTransitionalPalette;
  NTKInterpolatedColorPalette *v8;
  NTKInterpolatedColorPalette *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NTKInterpolatedColorPalette *v16;

  dialColorTransitionalPalette = self->_dialColorTransitionalPalette;
  if (!dialColorTransitionalPalette)
  {
    v8 = -[NTKInterpolatedColorPalette initWithColorPalette:]([NTKInterpolatedColorPalette alloc], "initWithColorPalette:", self);
    v9 = self->_dialColorTransitionalPalette;
    self->_dialColorTransitionalPalette = v8;

    dialColorTransitionalPalette = self->_dialColorTransitionalPalette;
  }
  -[NTKInterpolatedColorPalette fromPalette](dialColorTransitionalPalette, "fromPalette");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKInterpolatedColorPalette toPalette](self->_dialColorTransitionalPalette, "toPalette");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceColorPalette configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v10, "setConfiguration:", v13);

  -[NTKFaceColorPalette configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v11, "setConfiguration:", v15);

  objc_msgSend(v10, "setDialColorStyle:", a3);
  objc_msgSend(v11, "setDialColorStyle:", a4);
  v16 = self->_dialColorTransitionalPalette;

  return v16;
}

- (id)_background
{
  void *v3;

  v3 = -[NTKBlackcombColorPalette dialColorStyle](self, "dialColorStyle");
  if (v3 == (void *)1)
  {
    -[NTKBlackcombColorPalette lightBackground](self, "lightBackground");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v3)
  {
    -[NTKBlackcombColorPalette darkBackground](self, "darkBackground");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_hourMarker
{
  void *v3;

  v3 = -[NTKBlackcombColorPalette dialColorStyle](self, "dialColorStyle");
  if (v3 == (void *)1)
  {
    -[NTKBlackcombColorPalette darkHourMarker](self, "darkHourMarker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v3)
  {
    -[NTKBlackcombColorPalette lightHourMarker](self, "lightHourMarker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_smallTick
{
  void *v2;
  void *v3;

  -[NTKBlackcombColorPalette hourMarker](self, "hourMarker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_largeTick
{
  void *v2;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;

  v4 = -[NTKBlackcombColorPalette dialColorStyle](self, "dialColorStyle");
  if (v4 == 1)
  {
    -[NTKBlackcombColorPalette hourMarker](self, "hourMarker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0.6;
    goto LABEL_5;
  }
  if (!v4)
  {
    -[NTKBlackcombColorPalette hourMarker](self, "hourMarker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0.7;
LABEL_5:
    objc_msgSend(v5, "colorWithAlphaComponent:", v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_secondHand
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

- (int64_t)richComplicationViewTheme
{
  return -[NTKBlackcombColorPalette dialColorStyle](self, "dialColorStyle") == 0;
}

- (id)tritiumPalette
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKBlackcombColorPalette;
  -[NTKFaceColorPalette tritiumPalette](&v4, sel_tritiumPalette);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDialColorStyle:", 0);
  return v2;
}

- (unint64_t)dialColorStyle
{
  return self->_dialColorStyle;
}

- (void)setDialColorStyle:(unint64_t)a3
{
  self->_dialColorStyle = a3;
}

- (NTKInterpolatedColorPalette)dialColorTransitionalPalette
{
  return self->_dialColorTransitionalPalette;
}

- (void)setDialColorTransitionalPalette:(id)a3
{
  objc_storeStrong((id *)&self->_dialColorTransitionalPalette, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialColorTransitionalPalette, 0);
}

@end
