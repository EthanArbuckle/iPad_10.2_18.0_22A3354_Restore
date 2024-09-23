@implementation UIColor(PKAccessibility)

- (double)pkaxHue
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v2, 0, 0, 0);
  return v2;
}

- (double)pkaxSaturation
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", 0, &v2, 0, 0);
  return v2;
}

- (double)pkaxLuma
{
  double result;
  double v2;
  double v3;
  double v4;
  double v5;

  v5 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v2 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  result = fmax(v2 * (v4 * 0.715200007 + v5 * 0.212599993 + v3 * 0.0722000003), 0.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

- (id)pkaxApproximateColorDescription
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;

  objc_msgSend(a1, "_pkaxCachedApproximateColorDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v18 = 0.0;
    v19 = 0.0;
    objc_msgSend(a1, "pkaxLuma", 0, 0);
    v4 = v3;
    objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v19, &v18, &v17, &v16);
    if (v4 > 0.99000001)
    {
      _PencilKitBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("white");
LABEL_6:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v7, CFSTR("Localizable"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      objc_msgSend(a1, "_pkaxSetCachedApproximateColorDescription:", v2);
      return v2;
    }
    if (v4 < 0.00999999978)
    {
      _PencilKitBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("black");
      goto LABEL_6;
    }
    if (v18 >= 0.0500000007)
    {
      v13 = v19;
      if (v19 > 0.0560000017 && v19 < 0.111000001)
      {
        v13 = 0.430000007;
        if (v4 < 0.430000007)
        {
          _PencilKitBundle();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("brown"), CFSTR("brown"), CFSTR("Localizable"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "pkaxSaturationModifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "pkaxLightnessModifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_pkaxColorDescriptionForHue:saturation:lightness:", v8, v9, v14);
          v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
          goto LABEL_16;
        }
      }
      objc_msgSend(a1, "pkaxHueName", v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "pkaxSaturationModifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "pkaxLightnessModifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = a1;
      v11 = v6;
      v12 = v8;
    }
    else
    {
      _PencilKitBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("gray"), CFSTR("gray"), CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "pkaxLightnessModifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = a1;
      v11 = v8;
      v12 = 0;
    }
    objc_msgSend(v10, "_pkaxColorDescriptionForHue:saturation:lightness:", v11, v12, v9);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  return v2;
}

- (uint64_t)pkaxHueName
{
  void *v2;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "pkaxHue");
  return objc_msgSend(v2, "pkaxHueNameForValue:");
}

- (__CFString)pkaxLightnessModifier
{
  double v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  __CFString *v6;

  objc_msgSend(a1, "pkaxLuma");
  if (v1 >= 0.349999994)
  {
    if (v1 <= 0.850000024)
    {
      v6 = &stru_1E777DEE8;
      return v6;
    }
    _PencilKitBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("light shade");
    v5 = CFSTR("light");
  }
  else
  {
    _PencilKitBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("dark shade");
    v5 = CFSTR("dark");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, v5, CFSTR("Localizable"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (__CFString)pkaxSaturationModifier
{
  double v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  double v6;
  __CFString *v7;

  objc_msgSend(a1, "pkaxSaturation");
  if (v2 >= 0.200000003)
  {
    if (v2 <= 0.899999976 || (objc_msgSend(a1, "pkaxLuma"), v6 <= 0.699999988))
    {
      v7 = &stru_1E777DEE8;
      return v7;
    }
    _PencilKitBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("vibrant");
  }
  else
  {
    _PencilKitBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("grayish");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v5, CFSTR("Localizable"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)pkaxHueNameForValue:()PKAccessibility
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;

  if (a1 < 0.0 || a1 > 1.0)
  {
    v2 = 0;
  }
  else
  {
    if (a1 >= 0.0280000009)
    {
      if (a1 >= 0.0560000017)
      {
        if (a1 >= 0.111000001)
        {
          if (a1 >= 0.128999993)
          {
            if (a1 >= 0.166999996)
            {
              if (a1 >= 0.222000003)
              {
                if (a1 >= 0.388999999)
                {
                  if (a1 >= 0.469000012)
                  {
                    if (a1 >= 0.540000021)
                    {
                      if (a1 >= 0.611000001)
                      {
                        if (a1 >= 0.666999996)
                        {
                          if (a1 >= 0.800000012)
                          {
                            if (a1 >= 0.888999999)
                            {
                              if (a1 >= 0.916999996)
                              {
                                if (a1 >= 0.958000004)
                                {
                                  _PencilKitBundle();
                                  v3 = (void *)objc_claimAutoreleasedReturnValue();
                                  v4 = v3;
                                  if (a1 >= 0.986000001)
                                  {
                                    v5 = CFSTR("red hue");
                                    v6 = CFSTR("red");
                                  }
                                  else
                                  {
                                    v5 = CFSTR("pink red hue");
                                    v6 = CFSTR("pink red");
                                  }
                                }
                                else
                                {
                                  _PencilKitBundle();
                                  v3 = (void *)objc_claimAutoreleasedReturnValue();
                                  v4 = v3;
                                  v5 = CFSTR("pink hue");
                                  v6 = CFSTR("pink");
                                }
                              }
                              else
                              {
                                _PencilKitBundle();
                                v3 = (void *)objc_claimAutoreleasedReturnValue();
                                v4 = v3;
                                v5 = CFSTR("magenta pink hue");
                                v6 = CFSTR("magenta pink");
                              }
                            }
                            else
                            {
                              _PencilKitBundle();
                              v3 = (void *)objc_claimAutoreleasedReturnValue();
                              v4 = v3;
                              v5 = CFSTR("magenta hue");
                              v6 = CFSTR("magenta");
                            }
                          }
                          else
                          {
                            _PencilKitBundle();
                            v3 = (void *)objc_claimAutoreleasedReturnValue();
                            v4 = v3;
                            v5 = CFSTR("purple hue");
                            v6 = CFSTR("purple");
                          }
                        }
                        else
                        {
                          _PencilKitBundle();
                          v3 = (void *)objc_claimAutoreleasedReturnValue();
                          v4 = v3;
                          v5 = CFSTR("blue hue");
                          v6 = CFSTR("blue");
                        }
                      }
                      else
                      {
                        _PencilKitBundle();
                        v3 = (void *)objc_claimAutoreleasedReturnValue();
                        v4 = v3;
                        v5 = CFSTR("cyan blue hue");
                        v6 = CFSTR("cyan blue");
                      }
                    }
                    else
                    {
                      _PencilKitBundle();
                      v3 = (void *)objc_claimAutoreleasedReturnValue();
                      v4 = v3;
                      v5 = CFSTR("cyan hue");
                      v6 = CFSTR("cyan");
                    }
                  }
                  else
                  {
                    _PencilKitBundle();
                    v3 = (void *)objc_claimAutoreleasedReturnValue();
                    v4 = v3;
                    v5 = CFSTR("blue green hue");
                    v6 = CFSTR("blue green");
                  }
                }
                else
                {
                  _PencilKitBundle();
                  v3 = (void *)objc_claimAutoreleasedReturnValue();
                  v4 = v3;
                  v5 = CFSTR("green hue");
                  v6 = CFSTR("green");
                }
              }
              else
              {
                _PencilKitBundle();
                v3 = (void *)objc_claimAutoreleasedReturnValue();
                v4 = v3;
                v5 = CFSTR("yellow green hue");
                v6 = CFSTR("yellow green");
              }
            }
            else
            {
              _PencilKitBundle();
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              v4 = v3;
              v5 = CFSTR("yellow hue");
              v6 = CFSTR("yellow");
            }
          }
          else
          {
            _PencilKitBundle();
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v3;
            v5 = CFSTR("yellow orange hue");
            v6 = CFSTR("yellow orange");
          }
        }
        else
        {
          _PencilKitBundle();
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v3;
          v5 = CFSTR("orange hue");
          v6 = CFSTR("orange");
        }
      }
      else
      {
        _PencilKitBundle();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        v5 = CFSTR("red orange hue");
        v6 = CFSTR("red orange");
      }
    }
    else
    {
      _PencilKitBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("red hue");
      v6 = CFSTR("red");
    }
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v6, CFSTR("Localizable"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)pkaxDescriptionWithLuma
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "pkaxLuma");
  v3 = vcvtad_u64_f64(v2 * 100.0);
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "pkaxApproximateColorDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKAccessibilityLocalizedUnsignedInteger(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_pkaxColorDescriptionForHue:()PKAccessibility saturation:lightness:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  id v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "length");
  v12 = objc_msgSend(v9, "length");
  if (!v11)
  {
    if (!v12)
    {
      v15 = v8;
      goto LABEL_9;
    }
    objc_msgSend(a1, "_pkaxSaturationHueFormatString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    v17 = v9;
    v18 = v8;
    goto LABEL_7;
  }
  if (!v12)
  {
    objc_msgSend(a1, "_pkaxLightnessHueFormatString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    v17 = v10;
    v18 = v8;
LABEL_7:
    objc_msgSend(v14, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@%@"), 0, v17, v18, v19);
    goto LABEL_8;
  }
  objc_msgSend(a1, "_pkaxLightnessSaturationHueFormatString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@%@%@"), 0, v10, v9, v8);
LABEL_8:
  v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v15;
}

- (id)_pkaxLightnessHueFormatString
{
  void *v0;
  void *v1;

  _PencilKitBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("ax.color.format.lightness.hue"), CFSTR("%1$@ %2$@"), CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)_pkaxSaturationHueFormatString
{
  void *v0;
  void *v1;

  _PencilKitBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("ax.color.format.saturation.hue"), CFSTR("%1$@ %2$@"), CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)_pkaxLightnessSaturationHueFormatString
{
  void *v0;
  void *v1;

  _PencilKitBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("ax.color.format.lightness.saturation.hue"), CFSTR("%1$@ %2$@ %3$@"), CFSTR("Localizable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
