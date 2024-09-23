@implementation UIFont(CSAdditions)

- (BOOL)cs_supportsVariantWeights
{
  CFDictionaryRef v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  v1 = CTFontCopyVariation(a1);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2003265650.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)cs_variantWeight
{
  void *v2;
  void *v3;
  uint64_t v4;
  CFDictionaryRef v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFDictionary *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "cs_cachedVariantWeight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "cs_cachedVariantWeight");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

    return v4;
  }
  else
  {
    v6 = CTFontCopyVariation((CTFontRef)a1);
    if (v6
      && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2003265650.0),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v8))
    {
      objc_msgSend(a1, "cs_setCachedVariantWeight:", v8);
      v9 = objc_msgSend(v8, "unsignedIntegerValue");

    }
    else
    {
      v22 = v6;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v10 = CTFontCopyVariationAxes((CTFontRef)a1);
      v11 = -[__CFArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v24;
        v14 = *MEMORY[0x1E0CA8488];
        v15 = *MEMORY[0x1E0CA8480];
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v10);
            v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v17, "objectForKeyedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18)
            {
              if (objc_msgSend(v18, "unsignedIntegerValue") == 2003265652)
              {
                objc_msgSend(v17, "objectForKeyedSubscript:", v15);
                v20 = objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  v21 = (void *)v20;
                  objc_msgSend(a1, "cs_setCachedVariantWeight:", v20);
                  v9 = objc_msgSend(v21, "unsignedIntegerValue");

                  goto LABEL_18;
                }
              }
            }

          }
          v12 = -[__CFArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v12)
            continue;
          break;
        }
      }

      objc_msgSend(a1, "cs_setCachedVariantWeight:", &unk_1E55F0830);
      v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

      v6 = v22;
    }

    return v9;
  }
}

- (uint64_t)cs_variantWeightRange
{
  const __CFArray *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v1 = CTFontCopyVariationAxes(a1);
  v2 = -[__CFArray countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v17;
    v4 = *MEMORY[0x1E0CA8488];
    v15 = *MEMORY[0x1E0CA8498];
    v5 = *MEMORY[0x1E0CA8490];
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v17 != v3)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8 && objc_msgSend(v8, "unsignedIntegerValue") == 2003265652)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v10)
            v13 = v11 == 0;
          else
            v13 = 1;
          if (!v13)
          {
            v2 = objc_msgSend(v10, "unsignedIntValue") + 1;
            objc_msgSend(v12, "unsignedIntValue");

            goto LABEL_16;
          }

        }
      }
      v2 = -[__CFArray countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v2);
  }
LABEL_16:

  return v2;
}

- (id)cs_fontWithVariantWeight:()CSAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = *MEMORY[0x1E0CA8470];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2003265650.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fontDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontDescriptorByAddingAttributes:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(a1, "pointSize");
  objc_msgSend(v11, "fontWithDescriptor:size:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
