@implementation NTKCaliforniaColorPalette

- (NTKCaliforniaColorPalette)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCaliforniaColorPalette;
  return -[NTKFaceColorPalette initWithDomainName:inBundle:](&v3, sel_initWithDomainName_inBundle_, CFSTR("california"), 0);
}

- (id)colorForHourMarker:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;

  -[NTKCaliforniaColorPalette _colorForCircularTicksForMinute:](self, "_colorForCircularTicksForMinute:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKFaceColorPalette isNotFoundColor:](self, "isNotFoundColor:", v5))
  {
    -[NTKCaliforniaColorPalette digit](self, "digit");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = a3 - 2;
    if (a3 <= 0xB)
      v7 = a3;
    -[NTKCaliforniaColorPalette _colorForCircularTicksForMinute:](self, "_colorForCircularTicksForMinute:", 5 * ((v7 + 1) % 0xC));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  return v8;
}

- (id)digitColorAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_digit);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKFaceColorPalette valueForKey:](self, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)colorForCircularTicksForMinute:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[NTKFaceColorPalette isRainbowColor](self, "isRainbowColor"))
  {
    -[NTKCaliforniaColorPalette _colorForCircularTicksForMinute:](self, "_colorForCircularTicksForMinute:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKCaliforniaColorPalette circularDialSubtickColor](self, "circularDialSubtickColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)colorForCircularTicksForHour:(unint64_t)a3
{
  if (-[NTKFaceColorPalette isRainbowColor](self, "isRainbowColor"))
    -[NTKCaliforniaColorPalette _colorForCircularTicksForMinute:](self, "_colorForCircularTicksForMinute:", 5 * a3);
  else
    -[NTKCaliforniaColorPalette circularDialTickColor](self, "circularDialTickColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_colorForCircularTicksForMinute:(unint64_t)a3
{
  unint64_t v3;

  v3 = 59;
  if (a3 < 0x3B)
    v3 = a3;
  return NTKCaliforniaMulticolorColor(self, (double)v3 / 60.0);
}

- (id)circularDialSubtickColor
{
  void *v2;
  void *v3;

  -[NTKCaliforniaColorPalette bezelComplication](self, "bezelComplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)circularDialFillColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

- (id)_background
{
  void *v3;

  if (-[NTKFaceColorPalette isEvergreenCollection](self, "isEvergreenCollection"))
  {
    -[NTKCaliforniaColorPalette primaryColor](self, "primaryColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_circularBackground
{
  void *v3;

  if (-[NTKFaceColorPalette isEvergreenCollection](self, "isEvergreenCollection"))
  {
    -[NTKCaliforniaColorPalette primaryColor](self, "primaryColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[NTKFaceColorPalette isRainbowColor](self, "isRainbowColor"))
  {
    -[NTKCaliforniaColorPalette background](self, "background");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_smallTick
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  v3 = -[NTKFaceColorPalette isEvergreenCollection](self, "isEvergreenCollection");
  -[NTKCaliforniaColorPalette digit](self, "digit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0.4;
  if (v3)
    v6 = 0.2;
  objc_msgSend(v4, "colorWithAlphaComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_largeTick
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  v3 = -[NTKFaceColorPalette isEvergreenCollection](self, "isEvergreenCollection");
  -[NTKCaliforniaColorPalette digit](self, "digit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0.9;
  if (v3)
    v6 = 0.7;
  objc_msgSend(v4, "colorWithAlphaComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_clockHands
{
  if (-[NTKFaceColorPalette isEvergreenCollection](self, "isEvergreenCollection"))
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_clockHandsInlay
{
  void *v3;
  void *v4;

  if (-[NTKFaceColorPalette isEvergreenCollection](self, "isEvergreenCollection"))
  {
    -[NTKCaliforniaColorPalette primaryColor](self, "primaryColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NTKColorByApplyingWhiteOverlay(v3, 0.3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_simpleTextComplication
{
  if (-[NTKFaceColorPalette isEvergreenCollection](self, "isEvergreenCollection"))
    -[NTKCaliforniaColorPalette digit](self, "digit");
  else
    -[NTKCaliforniaColorPalette simpleTextComplicationColorValue](self, "simpleTextComplicationColorValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)richComplicationViewTheme
{
  return 1;
}

- (BOOL)isBlackBackground
{
  char v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  if (-[NTKFaceColorPalette isEvergreenCollection](self, "isEvergreenCollection"))
    return 0;
  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("seasons.fall2021"));

  if (!v6)
    return 1;
  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fullname");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("seasons.fall2021.purple1")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v8, "isEqualToString:", CFSTR("seasons.fall2021.purple2"));

  return v3;
}

@end
