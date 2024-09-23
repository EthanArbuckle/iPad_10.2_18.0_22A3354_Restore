@implementation CAMSmartStyleUtilities

+ (id)readAVCaptureSystemStyle
{
  return (id)objc_msgSend(a1, "readAVCaptureSystemStyleBypassXPC:", 0);
}

+ (id)readAVCaptureSystemStyleBypassXPC:(BOOL)a3
{
  void *v4;
  void *v5;

  if (a3)
    AVSmartStyleSettingsGetSystemStyleFast();
  else
    AVSmartStyleSettingsGetSystemStyle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C8B118], "identityStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "_validatedSystemStyleForStyle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)writeAVCaptureSystemStyle:(id)a3
{
  id v3;

  objc_msgSend(a1, "_validatedSystemStyleForStyle:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  AVSmartStyleSettingsSetSystemStyle();

}

+ (id)_validatedSystemStyleForStyle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v5, "toneBias");
    v7 = fmaxf(fminf(v6, 0.5), -0.5);
    objc_msgSend(v5, "colorBias");
    v9 = fmaxf(fminf(v8, 0.5), -0.5);
    objc_msgSend(v5, "toneBias");
    if (v7 == v10 && (objc_msgSend(v5, "colorBias"), v9 == v11))
    {
      v14 = v5;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C8B118];
      objc_msgSend(v5, "cast");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "intensity");
      objc_msgSend(v12, "styleWithCast:intensity:toneBias:colorBias:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = os_log_create("com.apple.camera", "SmartStyle");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543618;
        v18 = v5;
        v19 = 2114;
        v20 = v14;
        _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, "System style exceeded allowed range limits. Clamping from %{public}@ to %{public}@", (uint8_t *)&v17, 0x16u);
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (double)slider2DValueForColorOrToneBias:(double)result limitRangeForSystemStyles:(BOOL)a4
{
  if (a4)
    return result + result;
  return result;
}

+ (double)colorOrToneBiasForSlider2DValue:(double)result limitRangeForSystemStyles:(BOOL)a4
{
  if (a4)
    return result * 0.5;
  return result;
}

+ (CGPoint)slider2DValueForStyle:(id)a3 limitRangeForSystemStyles:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "colorBias");
  objc_msgSend(a1, "slider2DValueForColorOrToneBias:limitRangeForSystemStyles:", v4);
  v8 = v7;
  objc_msgSend(v6, "toneBias");
  v10 = v9;

  objc_msgSend(a1, "slider2DValueForColorOrToneBias:limitRangeForSystemStyles:", v4, v10);
  v12 = v11;
  v13 = v8;
  result.y = v12;
  result.x = v13;
  return result;
}

+ (CGPoint)colorAndToneBiasForSlider2DValue:(CGPoint)a3 limitRangeForSystemStyles:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a4;
  y = a3.y;
  objc_msgSend(a1, "colorOrToneBiasForSlider2DValue:limitRangeForSystemStyles:", a3.x);
  v8 = v7;
  objc_msgSend(a1, "colorOrToneBiasForSlider2DValue:limitRangeForSystemStyles:", v4, y);
  v10 = v9;
  v11 = v8;
  result.y = v10;
  result.x = v11;
  return result;
}

@end
