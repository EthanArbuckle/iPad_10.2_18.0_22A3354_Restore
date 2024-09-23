@implementation UIWindowScene(AVSecondScreenAdditions)

- (uint64_t)avkit_screenType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v16;
  char v17;

  objc_msgSend(a1, "avkit_asWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "avkit_asWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v8)
  {

    goto LABEL_6;
  }
  v9 = (void *)v8;
  v10 = objc_msgSend(v5, "hasPrefix:", CFSTR("LCD"));

  if ((v10 & 1) != 0)
  {
LABEL_6:
    v14 = 2;
    goto LABEL_7;
  }
  objc_msgSend(a1, "avkit_asWindowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_isCarScreen");

  if ((v13 & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v5, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("wireless"));

    if ((v17 & 1) != 0)
    {
      v14 = 4;
    }
    else if (objc_msgSend(v5, "hasPrefix:", CFSTR("TVOut")))
    {
      v14 = 3;
    }
    else
    {
      v14 = 0;
    }
  }
LABEL_7:

  return v14;
}

- (BOOL)avkit_screenHasWindowsExcludingWindow:()AVSecondScreenAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(a1, "windows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__UIWindowScene_AVSecondScreenAdditions__avkit_screenHasWindowsExcludingWindow___block_invoke;
  v12[3] = &unk_1E5BB4028;
  v13 = v4;
  v7 = v4;
  objc_msgSend(v6, "predicateWithBlock:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") != 0;

  return v10;
}

- (uint64_t)_avkit_setPreferredRefreshRate:()AVSecondScreenAdditions HDRMode:overscanCompensation:
{
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v13;
  const char *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a4 + 1) > 3)
      v10 = CFSTR("SDR");
    else
      v10 = off_1E5BB4088[a4 + 1];
    v11 = CFSTR("Unknown");
    v14 = "-[UIWindowScene(AVSecondScreenAdditions) _avkit_setPreferredRefreshRate:HDRMode:overscanCompensation:]";
    v15 = 2048;
    v13 = 136315906;
    v16 = a2;
    if (!a5)
      v11 = CFSTR("None");
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s Refresh: %.f HDRMode: %@ overscanCompensation: %@", (uint8_t *)&v13, 0x2Au);
  }

  return objc_msgSend(a1, "_setAVKitRequestedRefreshRate:HDRMode:overscanCompensation:", a4, a5, a2);
}

@end
