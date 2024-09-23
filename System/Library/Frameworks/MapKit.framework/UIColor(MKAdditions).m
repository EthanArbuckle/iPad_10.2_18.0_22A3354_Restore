@implementation UIColor(MKAdditions)

+ (id)_mapkit_colorNamed:()MKAdditions compatibleWithTraitCollection:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "_mapkitBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorNamed:inBundle:compatibleWithTraitCollection:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)_mapkit_colorNamed:()MKAdditions
{
  return objc_msgSend(a1, "_mapkit_colorNamed:compatibleWithTraitCollection:", a3, 0);
}

- (id)_mapkit_blendedColorWithFraction:()MKAdditions ofColor:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v6 = a4;
  v7 = v6;
  if (a2 >= 1.0)
  {
    v9 = v6;
LABEL_8:
    v8 = v9;
    goto LABEL_9;
  }
  if (a2 <= 0.0)
  {
    v9 = a1;
    goto LABEL_8;
  }
  v17 = 0.0;
  v18 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  v8 = 0;
  if (objc_msgSend(v6, "_mapkit_getRed:green:blue:alpha:", &v18, &v17, &v16, &v15))
  {
    if (!objc_msgSend(a1, "_mapkit_getRed:green:blue:alpha:", &v14, &v13, &v12, &v11))
    {
      v8 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (1.0 - a2) * v14 + v18 * a2, (1.0 - a2) * v13 + v17 * a2, (1.0 - a2) * v12 + v16 * a2, (1.0 - a2) * v11 + v15 * a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (double)_mapkit_getRed:()MKAdditions green:blue:alpha:
{
  double result;
  double v12;

  if ((objc_msgSend(a1, "getRed:green:blue:alpha:") & 1) == 0)
  {
    v12 = 0.0;
    if (objc_msgSend(a1, "getWhite:alpha:", &v12, a6))
    {
      if (a3)
      {
        result = v12;
        *a3 = v12;
      }
      if (a4)
      {
        result = v12;
        *a4 = v12;
      }
      if (a5)
      {
        result = v12;
        *a5 = v12;
      }
    }
  }
  return result;
}

- (uint64_t)_mapkit_isWhite
{
  double v2;
  unsigned int v4;
  unsigned int v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;

  v8 = 0;
  v9 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (objc_msgSend(a1, "getWhite:alpha:", &v9, 0))
  {
    v2 = v9;
    if (v9 >= 1.0)
      return 1;
  }
  v4 = objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v8, &v7, &v6, 0, v2);
  if (v7 <= 0.0)
    v5 = v4;
  else
    v5 = 0;
  if (v6 >= 1.0)
    return v5;
  else
    return 0;
}

+ (id)_mapkit_userLocationAccuracyRingStrokeColor
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)_mapkit_userLocationAccuracyRingStrokeColor__userLocationAccuracyRingStrokeColor;
  if (!_mapkit_userLocationAccuracyRingStrokeColor__userLocationAccuracyRingStrokeColor)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.341176471, 0.815686275, 0.5);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_mapkit_userLocationAccuracyRingStrokeColor__userLocationAccuracyRingStrokeColor;
    _mapkit_userLocationAccuracyRingStrokeColor__userLocationAccuracyRingStrokeColor = v1;

    v0 = (void *)_mapkit_userLocationAccuracyRingStrokeColor__userLocationAccuracyRingStrokeColor;
  }
  return v0;
}

+ (id)_mapkit_userLocationAccuracyRingStrokeColorSatellite
{
  if (_MergedGlobals_128 != -1)
    dispatch_once(&_MergedGlobals_128, &__block_literal_global_6);
  return (id)qword_1ECE2D890;
}

+ (id)_mapkit_userLocationAccuracyRingFillColor
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)_mapkit_userLocationAccuracyRingFillColor__userLocationAccuracyRingFillColor;
  if (!_mapkit_userLocationAccuracyRingFillColor__userLocationAccuracyRingFillColor)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.101960784, 0.454901961, 0.988235294, 0.100000001);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_mapkit_userLocationAccuracyRingFillColor__userLocationAccuracyRingFillColor;
    _mapkit_userLocationAccuracyRingFillColor__userLocationAccuracyRingFillColor = v1;

    v0 = (void *)_mapkit_userLocationAccuracyRingFillColor__userLocationAccuracyRingFillColor;
  }
  return v0;
}

@end
