@implementation UIFont(HKAdditions)

+ (id)hk_scalableFontForTextStyle:()HKAdditions symbolicTraits:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a1, "hk_staticPreferredFontForTextStyle:symbolicTraits:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC37F8]), "initForTextStyle:", v6);

  objc_msgSend(v8, "scaledFontForFont:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)hk_staticPreferredFontForTextStyle:()HKAdditions symbolicTraits:
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)hk_roundedSystemFontWithSize:()HKAdditions weight:
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:design:", *MEMORY[0x1E0DC1400]);
}

+ (uint64_t)hk_chartAxisLabelFont
{
  return objc_msgSend(a1, "hk_roundedSystemFontWithSize:weight:", 13.0, *MEMORY[0x1E0DC1438]);
}

+ (uint64_t)hk_staticPreferredFontForTextStyle:()HKAdditions
{
  return objc_msgSend(a1, "hk_staticPreferredFontForTextStyle:symbolicTraits:", a3, 0);
}

+ (uint64_t)hk_preferredFontForTextStyle:()HKAdditions
{
  return objc_msgSend(a1, "hk_preferredFontForTextStyle:symbolicTraits:", a3, 0);
}

+ (id)hk_preferredFontForTextStyle:()HKAdditions symbolicTraits:
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_preferredFontForTextStyle:()HKAdditions symbolicTraits:maximumContentSizeCategory:
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "_preferredFontForTextStyle:maximumContentSizeCategory:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_fontByAddingSymbolicTraits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)hk_preferredFontIgnoringAccessibilitySizeForTextStyle:()HKAdditions
{
  return objc_msgSend(a1, "hk_preferredFontIgnoringAccessibilitySizeForTextStyle:symbolicTraits:", a3, 0);
}

+ (id)hk_preferredFontIgnoringAccessibilitySizeForTextStyle:()HKAdditions symbolicTraits:
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, a4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (double)hk_fittingScaleFactorForUILabels:()HKAdditions constrainingWidth:
{
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  v6 = 1.0;
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v32;
    v11 = *MEMORY[0x1E0DC1138];
    v12 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v14, "text");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v11;
        objc_msgSend(v14, "font");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 0, v17, 0, 3.40282347e38, 3.40282347e38);
        v19 = v18;

        v20 = v19 - a1;
        if (v20 > 0.00000011920929 && v20 > v12)
        {
          objc_msgSend(v14, "text");
          v22 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "font");
          v23 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v23;
          v9 = (void *)v22;
          v12 = v20;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v7);
    if (v9)
    {
      v6 = 0.9;
      do
      {
        objc_msgSend(v8, "pointSize");
        objc_msgSend(v8, "fontWithSize:", v6 * v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v11;
        v36 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 0, v26, 0, 3.40282347e38, 3.40282347e38);
        v28 = v27;

        if (v28 <= a1)
          break;
        v6 = v6 + -0.1;
      }
      while (v6 > 0.1);
    }
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }

  return v6;
}

+ (id)hk_defaultFontWithUIFontTextStyle:()HKAdditions symbolicTraits:attributes:
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v7 = a5;
  objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "fontDescriptorByAddingAttributes:", v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v9, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)hk_titleLabelFontScaledBy:()HKAdditions
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;

  objc_msgSend(a1, "hk_defaultFontWithUIFontTextStyle:symbolicTraits:attributes:", *MEMORY[0x1E0DC4AD0], 0x8000, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2 != 1.0)
  {
    objc_msgSend(v3, "pointSize");
    objc_msgSend(v4, "fontWithSize:", v5 * a2);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

+ (id)hk_unitLabelFontScaledBy:()HKAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "hk_defaultFontWithUIFontTextStyle:symbolicTraits:attributes:", *MEMORY[0x1E0DC4AD0], 0x8000, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithSize:", a2 * 15.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)hk_compactRoundedFontOfSize:()HKAdditions
{
  return objc_msgSend(a1, "hk_compactRoundedFontOfSize:weight:", a3, *MEMORY[0x1E0DC1440]);
}

+ (uint64_t)hk_compactRoundedFontOfSize:()HKAdditions weight:
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:design:", *MEMORY[0x1E0CA8428]);
}

+ (uint64_t)hk_compactRoundedFontOfStyle:()HKAdditions weight:
{
  return objc_msgSend(a1, "_hk_compactFontOfStyle:weight:rounded:", a3, 1);
}

+ (uint64_t)hk_compactFontOfSize:()HKAdditions
{
  return objc_msgSend(a1, "hk_compactFontOfSize:weight:", a3, *MEMORY[0x1E0DC1440]);
}

+ (uint64_t)hk_compactFontOfSize:()HKAdditions weight:
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:design:", *MEMORY[0x1E0CA8420]);
}

+ (uint64_t)hk_compactFontOfStyle:()HKAdditions weight:
{
  return objc_msgSend(a1, "_hk_compactFontOfStyle:weight:rounded:", a3, 0);
}

+ (id)_hk_compactFontOfStyle:()HKAdditions weight:rounded:
{
  id *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (a5)
    v7 = (id *)MEMORY[0x1E0CA8428];
  else
    v7 = (id *)MEMORY[0x1E0CA8420];
  v8 = (void *)MEMORY[0x1E0DC1358];
  v9 = *v7;
  objc_msgSend(v8, "preferredFontDescriptorWithTextStyle:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0DC13C0];
  v11 = *MEMORY[0x1E0DC1458];
  v18[0] = *MEMORY[0x1E0DC1408];
  v18[1] = v11;
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontDescriptorByAddingAttributes:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v15, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)hk_roundedSystemFontWithSize:()HKAdditions weight:textStyle:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a5;
  objc_msgSend(a1, "hk_roundedSystemFontWithSize:weight:", a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC37F8]), "initForTextStyle:", v8);

  objc_msgSend(v10, "scaledFontForFont:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)hk_preferredRoundedFontForTextStyle:()HKAdditions
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", a3, 0x10000);
}

+ (id)hk_preferredRoundedFontForTextStyle:()HKAdditions additionalSymbolicTraits:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "hk_preferredRoundedFontForTextStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_fontByAddingSymbolicTraits:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hk_monospacedFont
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC13D0];
  v15[0] = *MEMORY[0x1E0DC13D8];
  v15[1] = v2;
  v16[0] = &unk_1E9CEB318;
  v16[1] = &unk_1E9CEB330;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC1380];
  v12 = v3;
  v13 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(a1, "pointSize");
  objc_msgSend(v9, "fontWithDescriptor:size:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hk_fontByAddingSymbolicTraits:()HKAdditions
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__UIFont_HKAdditions__hk_fontByAddingSymbolicTraits___block_invoke;
  v4[3] = &__block_descriptor_36_e8_I12__0I8l;
  v5 = a3;
  objc_msgSend(a1, "_hk_fontByModifyingSymbolicTraits:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hk_fontByRemovingSymbolicTraits:()HKAdditions
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__UIFont_HKAdditions__hk_fontByRemovingSymbolicTraits___block_invoke;
  v4[3] = &__block_descriptor_36_e8_I12__0I8l;
  v5 = a3;
  objc_msgSend(a1, "_hk_fontByModifyingSymbolicTraits:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_hk_fontByModifyingSymbolicTraits:()HKAdditions
{
  uint64_t (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4[2](v4, objc_msgSend(v6, "symbolicTraits"));

  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)hk_chartLollipopKeyFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueKindFont");
}

+ (uint64_t)hk_chartLollipopValueFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueValueFont");
}

+ (id)hk_chartLollipopValueFontSmaller
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0DC13C0];
  v8[0] = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0DC13E8];
  v9[0] = v0;
  v9[1] = &unk_1E9CEB348;
  v2 = *MEMORY[0x1E0DC1408];
  v8[1] = v1;
  v8[2] = v2;
  v9[2] = *MEMORY[0x1E0DC13A8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)CTFontDescriptorCreateWithTextStyleAndAttributes();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hk_chartCurrentValueKindFont
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AB8], 32770, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)hk_chartCurrentValueValueFont
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0DC13C0];
  v8[0] = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0DC13E8];
  v9[0] = v0;
  v9[1] = &unk_1E9CEB348;
  v2 = *MEMORY[0x1E0DC1408];
  v8[1] = v1;
  v8[2] = v2;
  v9[2] = *MEMORY[0x1E0DC13A8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)CTFontDescriptorCreateWithTextStyleAndAttributes();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hk_chartActivityValueFont
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0DC13C0];
  v8[0] = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1448]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0DC13E8];
  v9[0] = v0;
  v9[1] = &unk_1E9CEB348;
  v2 = *MEMORY[0x1E0DC1408];
  v8[1] = v1;
  v8[2] = v2;
  v9[2] = *MEMORY[0x1E0DC13A8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)CTFontDescriptorCreateWithTextStyleAndAttributes();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hk_chartCurrentValueUnitFont
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 32770, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)hk_chartCurrentValueDateFont
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 32770, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)hk_chartOverlaySectionHeaderFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4AD0], 1024);
}

+ (uint64_t)hk_chartOverlaySectionHeaderAccessoryButtonFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4A88], 256);
}

+ (uint64_t)hk_chartOverlaySectionItemTitleFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B08], 0x8000);
}

+ (uint64_t)hk_chartOverlaySectionItemValueAndUnitFont
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B08], 32770);
}

+ (id)hk_chrValueCellPrimaryFont
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B50], 0x8000, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1448]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *MEMORY[0x1E0DC1408];
  v9[0] = *MEMORY[0x1E0DC13C0];
  v9[1] = v3;
  v4 = *MEMORY[0x1E0DC13A8];
  v10[0] = v2;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptorByAddingAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
