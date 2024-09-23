@implementation UIFont(Camera)

+ (uint64_t)ck_cui_cameraFontOfSize:()Camera
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:design:", *MEMORY[0x1E0DC13F0], a1, *MEMORY[0x1E0DC1440]);
}

+ (void)_interpolatedAdditionalFontSizeForMainScreen
{
  void *v0;
  CGRect v1;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  CGRectGetWidth(v1);

}

+ (id)ck_cui_cameraFontForContentSize:()Camera
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "_interpolatedAdditionalFontSizeForMainScreen");
  v6 = v5;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB410]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB438]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB428]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB420]))
  {
    v7 = 12.0;
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB408]))
  {
    v7 = 13.0;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB400]))
    {
      objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB3F8]);
      v8 = 17.0;
      goto LABEL_7;
    }
    v7 = 15.0;
  }
  v8 = v6 + v7;
LABEL_7:
  objc_msgSend(a1, "ck_cui_cameraFontOfSize:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ck_cui_cameraTimerFontForContentSize:()Camera
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "_interpolatedAdditionalFontSizeForMainScreen");
  v6 = v5;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB410]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB438]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB428]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB420]))
  {
    v7 = 20.0;
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB408]))
  {
    v7 = 21.0;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB400]))
    {
      v8 = v6 + 23.0;
      objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB3F8]);
      goto LABEL_7;
    }
    v7 = 22.0;
  }
  v8 = v6 + v7;
LABEL_7:
  objc_msgSend(a1, "ck_cui_cameraFontOfSize:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ck_cui_cameraModeDialFontForContentSize:()Camera
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_interpolatedAdditionalFontSizeForMainScreen");
  v6 = v5;
  v7 = 13.0;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB410]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB438]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB428]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB420]) & 1) == 0)
  {
    v7 = 14.0;
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB408]) & 1) == 0)
    {
      v7 = 16.0;
      if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB400]) & 1) == 0)
      {
        if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB3F8]))
          v7 = 18.0;
        else
          v7 = 13.0;
      }
    }
  }
  objc_msgSend(a1, "ck_cui_cameraFontOfSize:", v6 + v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ck_cui_cameraModeDialApproximateFontForContentSize:()Camera
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v11;

  v4 = a3;
  objc_msgSend(a1, "_interpolatedAdditionalFontSizeForMainScreen");
  v6 = v5;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB410]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB438]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB428]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB420])
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB408]))
  {
    v7 = 22.0;
LABEL_7:
    v8 = v6 + v7;
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB400]))
  {
    v7 = 24.0;
    goto LABEL_7;
  }
  v11 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB3F8]);
  v8 = 16.0;
  if (v11)
    v8 = 26.0;
LABEL_8:
  objc_msgSend(a1, "ck_cui_cameraFontOfSize:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ck_cui_cameraPadModeDialFontForContentSize:()Camera
{
  id v4;
  double v5;
  void *v6;

  v4 = a3;
  v5 = 17.0;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB410]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB438]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB428]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB420]) & 1) == 0)
  {
    v5 = 18.0;
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB408]) & 1) == 0)
    {
      v5 = 19.0;
      if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB400]) & 1) == 0)
      {
        if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB3F8]))
          v5 = 20.0;
        else
          v5 = 16.0;
      }
    }
  }
  objc_msgSend(a1, "ck_cui_cameraFontOfSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)ck_cui_cameraKerningForFont:()Camera
{
  void *v3;
  double v4;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "pointSize");
  return objc_msgSend(v3, "numberWithDouble:", v4 * 25.0 / 1000.0);
}

@end
