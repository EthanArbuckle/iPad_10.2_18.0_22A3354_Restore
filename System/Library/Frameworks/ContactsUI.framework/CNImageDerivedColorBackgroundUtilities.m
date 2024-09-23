@implementation CNImageDerivedColorBackgroundUtilities

+ (BOOL)backgroundColorsPreferWhiteForegroundText:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "averageColorForBackgroundColors:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend((id)objc_opt_class(), "backgroundColorPrefersWhiteForegroundText:", v4);
  return v5;
}

+ (BOOL)backgroundColorPrefersWhiteForegroundText:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  double v6;
  BOOL v7;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CNUILogContactCard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_colorDifferenceFromColor:", v9);
    v11 = 134218240;
    v12 = v10;
    v13 = 2048;
    v14 = 0x3FDCCCCCCCCCCCCDLL;
    _os_log_debug_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEBUG, "colorDifference %.2f > %.2f", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_colorDifferenceFromColor:", v5);
  v7 = v6 > 0.45;

  return v7;
}

+ (id)averageColorForBackgroundColors:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  void *v14;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v18 = 0.0;
        v19 = 0.0;
        v16 = 0.0;
        v17 = 0.0;
        objc_msgSend(v12, "getRed:green:blue:alpha:", &v19, &v18, &v17, &v16);
        v10 = v10 + v19;
        v9 = v9 + v18;
        v8 = v8 + v17;
        v7 = v7 + v16;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
  }
  v13 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v10 / (double)v13, v9 / (double)v13, v8 / (double)v13, v7 / (double)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
