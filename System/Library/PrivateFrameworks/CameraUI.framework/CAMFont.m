@implementation CAMFont

+ (id)cameraFontOfSize:(double)a3
{
  return (id)objc_msgSend(a1, "cameraFontOfSize:weight:", a3, *MEMORY[0x1E0DC1440]);
}

+ (id)cameraFontOfSize:(double)a3 weight:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("size=%f weight=%f"), *(_QWORD *)&a3, *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (cameraFontOfSize_weight__onceToken != -1)
    dispatch_once(&cameraFontOfSize_weight__onceToken, &__block_literal_global_4);
  objc_msgSend((id)cameraFontOfSize_weight__cachedCAMFonts, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend((id)cameraFontOfSize_weight__cachedCAMFonts, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sfCameraFontSupported");

    CEKFontOfSizeWeightStyle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)cameraFontOfSize_weight__cachedCAMFonts, "setObject:forKeyedSubscript:", v8, v6);
  }

  return v8;
}

void __35__CAMFont_cameraFontOfSize_weight___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)cameraFontOfSize_weight__cachedCAMFonts;
  cameraFontOfSize_weight__cachedCAMFonts = (uint64_t)v0;

}

+ (id)cameraMonospacedFontOfSize:(double)a3
{
  return (id)objc_msgSend(a1, "cameraMonospacedFontOfSize:weight:", a3, *MEMORY[0x1E0DC1440]);
}

+ (id)cameraMonospacedFontOfSize:(double)a3 weight:(double)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "cameraFontOfSize:weight:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0DC1380];
  v7 = *MEMORY[0x1E0DC13D0];
  v14[0] = *MEMORY[0x1E0DC13D8];
  v14[1] = v7;
  v15[0] = &unk_1EA3B0148;
  v15[1] = &unk_1EA3B0160;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (double)interpolatedAdditionalFontSizeForMainScreen
{
  void *v2;
  double Width;
  double result;
  CGRect v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  Width = CGRectGetWidth(v5);

  result = 0.0;
  if (Width > 320.0)
    return 1.0;
  return result;
}

+ (id)cameraFontForContentSize:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  int v18;

  v4 = a3;
  objc_msgSend(a1, "interpolatedAdditionalFontSizeForMainScreen");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "cam_initialLayoutStyle");

  if (v8 == 1)
    v6 = v6 + 1.0;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4918]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4908]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4930]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4920]))
  {
    v9 = 12.0;
LABEL_8:
    v10 = v6 + v9;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4900]))
  {
    v9 = 13.0;
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48F8]))
  {
    v9 = 15.0;
    goto LABEL_8;
  }
  v13 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48F0]);
  v10 = 17.0;
  if ((v13 & 1) == 0)
  {
    v14 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48D8], 17.0);
    v10 = 20.0;
    if ((v14 & 1) == 0)
    {
      v15 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48D0], 20.0);
      v10 = 22.0;
      if ((v15 & 1) == 0)
      {
        v16 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48C8], 22.0);
        v10 = 24.0;
        if ((v16 & 1) == 0)
        {
          v17 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48C0], 24.0);
          v10 = 27.0;
          if ((v17 & 1) == 0)
          {
            v18 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48B8], 27.0);
            v10 = 17.0;
            if (v18)
              v10 = 29.0;
          }
        }
      }
    }
  }
LABEL_9:
  objc_msgSend(a1, "cameraFontOfSize:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)cameraTimerFontForContentSize:(id)a3 layoutStyle:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "interpolatedAdditionalFontSizeForMainScreen");
  v8 = v7;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC4908]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC4930]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC4920]) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC4918]))
  {
    v9 = 20.0;
LABEL_6:
    v10 = v8 + v9;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC4900]))
  {
    v9 = 21.0;
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48F8]))
  {
    v9 = 22.0;
    goto LABEL_6;
  }
  v10 = v8 + 23.0;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48F0]) & 1) == 0)
  {
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48D8]))
    {
      v9 = 26.0;
      goto LABEL_6;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48D0]))
    {
      v9 = 28.0;
      goto LABEL_6;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48C8]))
    {
      v9 = 30.0;
      goto LABEL_6;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48C0]))
    {
      v9 = 32.0;
      goto LABEL_6;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48B8]))
      v10 = v8 + 34.0;
  }
LABEL_7:
  v11 = v10 + 4.0;
  if (a4 != 1)
    v11 = v10;
  objc_msgSend(a1, "cameraMonospacedFontOfSize:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (double)cameraModeDialFontSizeForContentSize:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "interpolatedAdditionalFontSizeForMainScreen");
  v6 = v5;
  v7 = 13.0;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4908]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4930]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4920]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4918]) & 1) == 0)
  {
    v7 = 14.0;
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4900]) & 1) == 0)
    {
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48F8]))
        v7 = 16.0;
      else
        v7 = 18.0;
    }
  }

  return v6 + v7;
}

+ (id)cameraModeDialFontForContentSize:(id)a3
{
  return (id)objc_msgSend(a1, "cameraModeDialFontForContentSize:weight:", a3, *MEMORY[0x1E0DC1440]);
}

+ (id)cameraModeDialFontForContentSize:(id)a3 weight:(double)a4
{
  objc_msgSend(a1, "cameraModeDialFontSizeForContentSize:", a3);
  return (id)objc_msgSend(a1, "cameraFontOfSize:weight:");
}

+ (id)cameraModeDialApproximateFontForContentSize:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v10;

  v4 = a3;
  objc_msgSend(a1, "interpolatedAdditionalFontSizeForMainScreen");
  v6 = v5;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4908]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4930]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4920]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4918])
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4900]))
  {
    v7 = v6 + 22.0;
  }
  else
  {
    v10 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48F8]);
    v7 = v6 + 24.0;
    if (!v10)
      v7 = 26.0;
  }
  objc_msgSend(a1, "cameraFontOfSize:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)cameraPadModeDialFontForContentSize:(id)a3
{
  id v4;
  double v5;
  void *v6;

  v4 = a3;
  v5 = 17.0;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4908]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4930]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4920]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4918]) & 1) == 0)
  {
    v5 = 18.0;
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC4900]) & 1) == 0)
    {
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48F8]))
        v5 = 19.0;
      else
        v5 = 20.0;
    }
  }
  objc_msgSend(a1, "cameraFontOfSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cameraKerningForFont:(id)a3
{
  void *v3;
  double v4;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "pointSize");
  return (id)objc_msgSend(v3, "numberWithDouble:", v4 * 25.0 / 1000.0);
}

@end
