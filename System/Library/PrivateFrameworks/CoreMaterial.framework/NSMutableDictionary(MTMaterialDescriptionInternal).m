@implementation NSMutableDictionary(MTMaterialDescriptionInternal)

- (void)setValue:()MTMaterialDescriptionInternal forProperty:ofFilter:isCompositingFilter:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    if ((a6 & 1) != 0)
    {
      objc_msgSend(a1, "objectForKey:", CFSTR("compositingFilter"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      if (v13)
        goto LABEL_22;
    }
    else
    {
      objc_msgSend(a1, "objectForKey:", CFSTR("filters"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(a1, "setObject:forKey:", v15, CFSTR("filters"));
      }
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v14 = v15;
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v16)
      {
        v17 = v16;
        v23 = a6;
        v24 = a1;
        v25 = v11;
        v18 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v27 != v18)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v20, "objectForKey:", CFSTR("type"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v12, "isEqualToString:", v21);

            if (v22)
            {
              v13 = v20;
              goto LABEL_17;
            }
          }
          v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v17)
            continue;
          break;
        }
        v13 = 0;
LABEL_17:
        a1 = v24;
        v11 = v25;
        a6 = v23;
      }
      else
      {
        v13 = 0;
      }

      if (v13)
        goto LABEL_22;
    }
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("type"));
    if (!a6)
    {
      objc_msgSend(v14, "addObject:", v13);
      if (!v10)
        goto LABEL_24;
      goto LABEL_23;
    }
    objc_msgSend(a1, "setObject:forKey:", v13, CFSTR("compositingFilter"));
LABEL_22:
    if (!v10)
    {
LABEL_24:

      goto LABEL_25;
    }
LABEL_23:
    objc_msgSend(v13, "setObject:forKey:", v10, v11);
    goto LABEL_24;
  }
LABEL_25:

}

- (void)setLuminanceAmount:()MTMaterialDescriptionInternal values:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v11 = a7;
  v12 = (void *)*MEMORY[0x1E0CD2E20];
  if (!a5 || MTIdentityValueForFilter((void *)*MEMORY[0x1E0CD2E20]) != a2)
  {
    v13 = (void *)*MEMORY[0x1E0CD2E18];
    if (!v17)
      v13 = v12;
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forProperty:ofFilterInFiltersArray:", v15, CFSTR("inputAmount"), v14);

    if (objc_msgSend(v17, "count") == 4)
      objc_msgSend(a1, "setValue:forProperty:ofFilterInFiltersArray:", v17, CFSTR("inputValues"), v14);
    if (v11)
    {
      v11[2](v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", v16, v14);

    }
    else
    {
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", 0, v14);
    }

  }
}

- (void)setBlurRadius:()MTMaterialDescriptionInternal inputMaskImage:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void (**v23)(void);

  v23 = a7;
  v12 = (void *)*MEMORY[0x1E0CD2C88];
  if (!a5 || MTIdentityValueForFilter((void *)*MEMORY[0x1E0CD2C88]) != a2)
  {
    v13 = a2 > 29.5;
    if (a2 >= 35.0)
      v13 = 0;
    if ((v13 & a6) != 0)
      a2 = 29.5;
    v14 = *MEMORY[0x1E0CD2F00];
    if (a4)
      v15 = (void *)*MEMORY[0x1E0CD2F00];
    else
      v15 = v12;
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forProperty:ofFilterInFiltersArray:", v17, CFSTR("inputRadius"), v16);

    if (a4)
      objc_msgSend(a1, "setValue:forProperty:ofFilterInFiltersArray:", a4, CFSTR("inputMaskImage"), v14);
    if (v23)
    {
      v23[2]();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if ((a6 & 1) != 0)
      {
        if (v18)
        {
          v20 = objc_msgSend(v18, "mutableCopy");

          v19 = (id)v20;
LABEL_18:
          _MTGetCoreMaterialPlatformConfiguration();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v21, "blurEdgesOptimization");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v22);

          }
          if ((objc_opt_respondsToSelector() & 1) == 0
            || objc_msgSend(v21, "isDitherOptimizationSupported"))
          {
            objc_msgSend(v19, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputDither"));
          }

          goto LABEL_25;
        }
LABEL_17:
        v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        goto LABEL_18;
      }
    }
    else
    {
      if ((a6 & 1) != 0)
        goto LABEL_17;
      v19 = 0;
    }
LABEL_25:
    objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", v19, v16);

  }
}

- (uint64_t)setValue:()MTMaterialDescriptionInternal forProperty:ofFilterInFiltersArray:
{
  return objc_msgSend(a1, "setValue:forProperty:ofFilter:isCompositingFilter:", a3, a4, a5, 0);
}

- (void)_processAdditionalInfo:()MTMaterialDescriptionInternal forFilterInFiltersArray:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v6);
            v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
            objc_msgSend(v6, "objectForKey:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "setValue:forProperty:ofFilter:isCompositingFilter:", v14, v13, v8, 0);

          }
          v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }
    }
  }

}

- (void)setTintColor:()MTMaterialDescriptionInternal includingOptimizations:withAdditionalInfoPromise:
{
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  _OWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v7 = a5;
  if (a3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    objc_msgSend(a3, "sourceOverColorMatrix");
    v11[2] = v14;
    v11[3] = v15;
    v11[4] = v16;
    v11[0] = v12;
    v11[1] = v13;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v11, "{CAColorMatrix=ffffffffffffffffffff}");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CD2BF0];
    objc_msgSend(a1, "setValue:forProperty:ofFilterInFiltersArray:", v8, CFSTR("inputColorMatrix"), *MEMORY[0x1E0CD2BF0]);

    if (v7)
    {
      v7[2](v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", v10, v9);

    }
    else
    {
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", 0, v9);
    }
  }

}

- (void)sortFiltersWithOrder:()MTMaterialDescriptionInternal
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", CFSTR("filters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__NSMutableDictionary_MTMaterialDescriptionInternal__sortFiltersWithOrder___block_invoke;
  v7[3] = &unk_1E58796B0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "sortUsingComparator:", v7);

}

- (void)setCurvesInputValues:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  id v9;
  void (**v10)(_QWORD);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (!a4 || objc_msgSend(v9, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      v15 = *MEMORY[0x1E0CD2C20];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v17, (_QWORD)v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setValue:forProperty:ofFilterInFiltersArray:", v18, v17, v15);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    if (v10)
    {
      v10[2](v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", v19, *MEMORY[0x1E0CD2C20]);

    }
    else
    {
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", 0, *MEMORY[0x1E0CD2C20]);
    }
  }

}

- (void)setColorMatrix:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  void (**v9)(_QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _OWORD v17[5];
  _OWORD v18[5];

  v9 = a6;
  if (!a4
    || (v10 = a3[3],
        v18[2] = a3[2],
        v18[3] = v10,
        v18[4] = a3[4],
        v11 = a3[1],
        v18[0] = *a3,
        v18[1] = v11,
        !MTCAColorMatrixIsIdentity(v18)))
  {
    v12 = a3[3];
    v17[2] = a3[2];
    v17[3] = v12;
    v17[4] = a3[4];
    v13 = a3[1];
    v17[0] = *a3;
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v17, "{CAColorMatrix=ffffffffffffffffffff}");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CD2BF0];
    objc_msgSend(a1, "setValue:forProperty:ofFilterInFiltersArray:", v14, CFSTR("inputColorMatrix"), *MEMORY[0x1E0CD2BF0]);

    if (v9)
    {
      v9[2](v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", v16, v15);

    }
    else
    {
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", 0, v15);
    }
  }

}

- (void)setSaturation:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(void);

  v12 = a6;
  v9 = *MEMORY[0x1E0CD2C00];
  if (!a4 || MTIdentityValueForFilter((void *)*MEMORY[0x1E0CD2C00]) != a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forProperty:ofFilterInFiltersArray:", v10, CFSTR("inputAmount"), v9);

    if (v12)
    {
      v12[2]();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", v11, v9);

    }
    else
    {
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", 0, v9);
    }
  }

}

- (void)setBrightness:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(void);

  v12 = a6;
  v9 = *MEMORY[0x1E0CD2BB8];
  if (!a4 || MTIdentityValueForFilter((void *)*MEMORY[0x1E0CD2BB8]) != a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forProperty:ofFilterInFiltersArray:", v10, CFSTR("inputAmount"), v9);

    if (v12)
    {
      v12[2]();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", v11, v9);

    }
    else
    {
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", 0, v9);
    }
  }

}

- (void)setZoom:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  id v5;

  if (a2 != 0.0 || (a4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKey:", v5, CFSTR("zoom"));

  }
}

- (void)setAverageColorEnabled:()MTMaterialDescriptionInternal includingOptimizations:withAdditionalInfoPromise:
{
  void (**v8)(id);
  uint64_t v9;
  void *v10;
  void (**v11)(id);

  v8 = a5;
  if (a3)
  {
    v11 = v8;
    v9 = *MEMORY[0x1E0CD2B88];
    objc_msgSend(a1, "setValue:forProperty:ofFilterInFiltersArray:", 0, 0, *MEMORY[0x1E0CD2B88]);
    if (a4)
      objc_msgSend(a1, "setObject:forKey:", &unk_1E587FDF8, CFSTR("scale"));
    if (v11)
    {
      v11[2](v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", v10, v9);

    }
    else
    {
      objc_msgSend(a1, "_processAdditionalInfo:forFilterInFiltersArray:", 0, v9);
    }
    v8 = v11;
  }

}

@end
