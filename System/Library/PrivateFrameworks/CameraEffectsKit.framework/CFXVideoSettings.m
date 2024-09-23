@implementation CFXVideoSettings

+ (BOOL)screenCanShow2160P
{
  if (screenCanShow2160P_onceToken != -1)
    dispatch_once(&screenCanShow2160P_onceToken, &__block_literal_global_27);
  return screenCanShow2160P_result;
}

void __38__CFXVideoSettings_screenCanShow2160P__block_invoke()
{
  void *v0;
  double v1;
  double v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  BOOL v12;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (v2 < v5)
    v2 = v5;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v2 * v7;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "jfx_memorySize");

  v12 = v8 > 2500.0 && v10 > 1610612736;
  screenCanShow2160P_result = v12;
}

+ (BOOL)canDecodeHEVC2160P
{
  if (canDecodeHEVC2160P_onceToken != -1)
    dispatch_once(&canDecodeHEVC2160P_onceToken, &__block_literal_global_2);
  return (canDecodeHEVC2160P_result & 1) == 0;
}

uint64_t __38__CFXVideoSettings_canDecodeHEVC2160P__block_invoke()
{
  uint64_t result;
  size_t v2;
  int v3;

  v3 = 0;
  v2 = 4;
  result = sysctlbyname("hw.cpufamily", &v3, &v2, 0, 0);
  if (v3 == 933271106 || v3 == 747742334)
    canDecodeHEVC2160P_result = 1;
  return result;
}

+ (double)imageScale
{
  if (imageScale_onceToken != -1)
    dispatch_once(&imageScale_onceToken, &__block_literal_global_4_0);
  return *(double *)&imageScale_imageScale;
}

void __30__CFXVideoSettings_imageScale__block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  imageScale_imageScale = v0;

}

@end
