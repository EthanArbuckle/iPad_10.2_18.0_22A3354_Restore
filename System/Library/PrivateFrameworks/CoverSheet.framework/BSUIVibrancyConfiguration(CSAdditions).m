@implementation BSUIVibrancyConfiguration(CSAdditions)

- (id)cs_adjustedForReducedBacklight
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  double v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;

  v1 = a1;
  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vibrancySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "boostEnabled") & 1) != 0)
  {
    objc_msgSend(v1, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "backgroundType") == 1)
    {
      v5 = objc_msgSend(v1, "copyWithWithBackgroundType:", 0);

      v1 = (id)v5;
    }
    if (objc_msgSend(v1, "effectType"))
    {
      if (objc_msgSend(v1, "effectType") == 1)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v1, "backgroundType");
        v8 = 0.2;
        if (v7)
          v8 = 0.0;
        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", v8, 1.0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "effectValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "transformColor:withVibrantMask:", v9, v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "_luminanceDifferenceFromColor:", v9);
        v13 = v12;
        objc_msgSend(v3, "minimumLuminanceDifference");
        if (v13 < v14)
        {
          v15 = v14;
          objc_msgSend(v4, "colorWithAlphaComponent:", 0.0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v1, "copyWithEffectType:color:", 1, v16);

          objc_msgSend(v17, "effectValues");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "transformColor:withVibrantMask:", v9, v6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "_luminanceDifferenceFromColor:", v9);
          if (v20 <= v15)
          {
            objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.5);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v1;
            v26 = 2;
          }
          else
          {
            BSUIVibrancyMapBias();
            objc_msgSend(v4, "alphaComponent");
            objc_msgSend(v17, "color");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "alphaComponent");
            BSFloatByLinearlyInterpolatingFloats();
            v23 = v22;

            objc_msgSend(v4, "colorWithAlphaComponent:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v1;
            v26 = 1;
          }
          v31 = objc_msgSend(v25, "copyWithEffectType:color:", v26, v24);

          v1 = (id)v31;
        }

        goto LABEL_21;
      }
      if (objc_msgSend(v1, "effectType") != 3
        || !objc_msgSend(MEMORY[0x1E0D01968], "instancesRespondToSelector:", sel_copyWithLuminanceReduced_))
      {
        goto LABEL_23;
      }
      objc_msgSend(v1, "alternativeVibrancyEffectLUT");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v30, "copyWithLuminanceReduced:", 1);

      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_22:

LABEL_23:
        v27 = v1;

        goto LABEL_24;
      }
      v29 = objc_msgSend(v1, "copyWithAlternativeVibrancyEffectLUT:", v6);
    }
    else
    {
      objc_msgSend(v3, "naturalEffectTypeStrength");
      objc_msgSend(v4, "colorWithAlphaComponent:", fmax(fmin(1.0 - v28, 1.0), 0.0));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v1, "copyWithEffectType:color:", 0, v6);
    }
    v9 = v1;
    v1 = (id)v29;
LABEL_21:

    goto LABEL_22;
  }
  v27 = v1;
LABEL_24:

  return v27;
}

@end
