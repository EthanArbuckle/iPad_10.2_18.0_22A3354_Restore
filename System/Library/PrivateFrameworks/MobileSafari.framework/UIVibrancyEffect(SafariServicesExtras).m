@implementation UIVibrancyEffect(SafariServicesExtras)

+ (id)_sf_effectWithStyle:()SafariServicesExtras forBarTintStyle:
{
  void *v4;
  void *v6;
  int v8;
  void *v9;
  double v10;
  int v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[5];

  if (a4 == 5)
  {
    switch(a3)
    {
      case 0:
      case 2:
        v6 = (void *)MEMORY[0x1E0DC3F08];
        goto LABEL_21;
      case 1:
        v6 = (void *)MEMORY[0x1E0DC3F08];
        goto LABEL_21;
      case 3:
        v6 = (void *)MEMORY[0x1E0DC3F08];
        goto LABEL_23;
      case 4:
        v6 = (void *)MEMORY[0x1E0DC3F08];
        goto LABEL_23;
      case 5:
        v6 = (void *)MEMORY[0x1E0DC3F08];
        goto LABEL_23;
      case 6:
        v6 = (void *)MEMORY[0x1E0DC3F08];
LABEL_21:
        CAColorMatrixMakeBrightness();
        goto LABEL_24;
      case 7:
        v6 = (void *)MEMORY[0x1E0DC3F08];
LABEL_23:
        CAColorMatrixMakeColorSourceOver();
        goto LABEL_24;
      default:
        return v4;
    }
  }
  v8 = _SFIsPrivateTintStyle(a4);
  if ((unint64_t)(a3 - 8) <= 0xFFFFFFFFFFFFFFF9 && v8)
  {
    if (a3 == 1)
    {
      v6 = (void *)MEMORY[0x1E0DC3F08];
      CAColorMatrixMakeBrightness();
      v17 = xmmword_18BAD51F0;
      v18 = xmmword_18BAD5200;
      v19 = xmmword_18BAD5210;
      v20 = xmmword_18BAD5220;
      v21 = xmmword_18BAD5230;
      CAColorMatrixConcat();
LABEL_24:
      v10 = 1.0;
      v9 = v6;
      goto LABEL_25;
    }
    if (!a3)
    {
      v9 = (void *)MEMORY[0x1E0DC3F08];
      v22[0] = xmmword_18BAD51F0;
      v22[1] = xmmword_18BAD5200;
      v22[2] = xmmword_18BAD5210;
      v22[3] = xmmword_18BAD5220;
      v22[4] = xmmword_18BAD5230;
      v10 = 1.0;
LABEL_25:
      objc_msgSend(v9, "_vibrantEffectWithCAColorMatrix:alpha:", v22, v10, v17, v18, v19, v20, v21);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = _SFIsDarkTintStyle(a4);
    if (a3 == 2 && v11)
    {
      v12 = _SFLightTintStyleForStyle(a4);
      v13 = (void *)MEMORY[0x1E0DC3F08];
      _SFBackdropEffectForBarTintStyle(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v15 = 112;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0DC3F08];
      _SFBackdropEffectForBarTintStyle(a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 103;
      switch(a3)
      {
        case 0:
        case 2:
        case 7:
          goto LABEL_13;
        case 1:
          v15 = 111;
          break;
        case 3:
          v15 = 101;
          break;
        case 4:
          v15 = 102;
          break;
        default:
          break;
      }
    }
    objc_msgSend(v13, "_effectForBlurEffect:vibrancyStyle:", v14, v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
