@implementation UIVisualEffect(GKDashboardUtils)

+ (id)_gkGameLayerBackgroundVisualEffect
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 100.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 2.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.05);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorEffectBlendNormal:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.062745098, 0.062745098, 0.062745098, 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorEffectBlendNormal:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_gkGameLayerModuleVisualEffect
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_gkGameLayerBackgroundVisualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.08);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorEffectBlendNormal:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  return v3;
}

+ (id)_gkGameLayerButtonVisualEffect
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 4.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorEffectBlendNormal:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_gkGameLayerDisabledButtonVisualEffect
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorEffectBlendNormal:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_gkGameLayerPanelVisualEffect
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_gkGameLayerBackgroundVisualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorEffectBlendNormal:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  return v3;
}

+ (id)_gkGameLayerPopOverVisualEffect
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 30.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_gkGameLayerContentVibrancyEffect
{
  _OWORD v1[6];
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  v2 = 0u;
  v3 = 0u;
  v1[5] = 0u;
  CAColorMatrixMakeSaturation();
  LODWORD(v2) = 1060320051;
  DWORD1(v3) = 1060320051;
  DWORD2(v4) = 1060320051;
  HIDWORD(v5) = 1065353216;
  v1[2] = v3;
  v1[3] = v4;
  v1[4] = v5;
  v1[0] = 0u;
  v1[1] = v2;
  objc_msgSend(MEMORY[0x1E0DC3F08], "_vibrantEffectWithCAColorMatrix:alpha:", v1, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorEffectBlendNormal:()GKDashboardUtils
{
  double v4;
  __int128 v5;
  __int128 v6;
  double v7;
  __int128 v8;
  __int128 v9;
  double v10;
  __int128 v11;
  __int128 v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17[3];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  *(_OWORD *)v17 = 0u;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v16, (char *)&v16 + 8, v17, &v17[1]);
  *(double *)&v16 = v17[1] * *(double *)&v16;
  *((double *)&v16 + 1) = v17[1] * *((double *)&v16 + 1);
  v17[0] = v17[1] * v17[0];
  v4 = 1.0 - v17[1];
  v5 = 0u;
  v6 = 0u;
  v7 = 1.0 - v17[1];
  v8 = 0u;
  v9 = 0u;
  v10 = 1.0 - v17[1];
  v11 = 0u;
  v12 = 0u;
  v13 = 1.0 - v17[1];
  v14 = v16;
  v15 = *(_OWORD *)v17;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectMatrix:", &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
