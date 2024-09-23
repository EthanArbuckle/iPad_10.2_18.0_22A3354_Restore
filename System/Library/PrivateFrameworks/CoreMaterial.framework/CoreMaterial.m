uint64_t MTCompareObjectsWithOrder(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v5, "indexOfObject:", a1);
  v8 = objc_msgSend(v5, "indexOfObject:", v6);

  if (v7 < v8)
    return -1;
  else
    return v7 > v8;
}

id MTFilterKeyPathForFilter(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)MTFilterKeyPathForFilter___filterKeyCache;
  if (!MTFilterKeyPathForFilter___filterKeyCache)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)MTFilterKeyPathForFilter___filterKeyCache;
    MTFilterKeyPathForFilter___filterKeyCache = (uint64_t)v3;

    v2 = (void *)MTFilterKeyPathForFilter___filterKeyCache;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(CFSTR("filters"), "stringByAppendingFormat:", CFSTR(".%@"), v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)MTFilterKeyPathForFilter___filterKeyCache, "setObject:forKeyedSubscript:", v5, v1);
  }

  return v5;
}

uint64_t _IsIdentityProperty(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CD2708], "mt_orderedFilterTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v3))
  {
    _IdentityPropertyForFilterType(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

__CFString *_IdentityPropertyForFilterType(void *a1)
{
  id v1;
  __CFString *v2;
  __CFString **v3;
  __CFString *v4;

  v1 = a1;
  v2 = CFSTR("inputAmount");
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CD2C88]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CD2F00]) & 1) != 0)
  {
    v3 = kMTCAFilterPropertyNameInputRadius;
LABEL_4:
    v4 = *v3;
    goto LABEL_5;
  }
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CD2BF0]) & 1) != 0)
  {
    v3 = kMTCAFilterPropertyNameInputColorMatrix;
    goto LABEL_4;
  }
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CD2C20]) & 1) == 0)
    goto LABEL_6;
  v4 = 0;
LABEL_5:

  v2 = v4;
LABEL_6:

  return v2;
}

id MTCAFilterCurvesInputValuesKeys()
{
  if (MTCAFilterCurvesInputValuesKeys_onceToken != -1)
    dispatch_once(&MTCAFilterCurvesInputValuesKeys_onceToken, &__block_literal_global_1);
  return (id)MTCAFilterCurvesInputValuesKeys___curvesFilterInputValuesKeys;
}

id MTComposedFilterCreateDictionaryRepresentation(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  __CFString **v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  void *v53;
  uint64_t isKindOfClass;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  float v60;
  float v61;
  void *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  id obj;
  id obja;
  unsigned int v74;
  _BYTE v75[80];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  float32x4_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[80];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  float32x4_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  float32x4_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[9];

  v101[7] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v74 = a3;
  objc_msgSend(v7, "setValue:forProperty:ofFilter:isCompositingFilter:", 0, 0, v5, a3);
  v70 = v6;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v5;
  v11 = v8;
  v12 = v9;
  v13 = v10;
  v14 = v12;
  v71 = v11;
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CD2F18]))
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("inputColor0"), CFSTR("colorDodge"));
    v15 = kMTCAFilterPropertyNameInputColorLighten;
LABEL_5:
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("inputColor1"), *v15);
    goto LABEL_6;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CD2F20]))
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("inputColor0"), CFSTR("colorBurn"));
    v15 = kMTCAFilterPropertyNameInputColorDarken;
    goto LABEL_5;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CD2F08]))
  {
    obja = v7;
    v68 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v11, "objectForKeyedSubscript:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v11;
    v41 = (uint64_t)v39;
    if (!v39)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("darkenShadows"));
      v41 = objc_claimAutoreleasedReturnValue();
    }
    v69 = v14;
    objc_msgSend(v11, "objectForKeyedSubscript:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (uint64_t)v42;
    if (!v42)
    {
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("increaseSaturation"));
      v43 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v40, "objectForKeyedSubscript:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("redGreenContrast"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v43;
    v67 = v43;
    v48 = (void *)v41;
    v49 = (void *)objc_msgSend(v68, "initWithObjects:", v41, v67, v44, v45, v46, 0);

    if (!v42)
    v14 = v69;
    if (!v39)

    v101[0] = CFSTR("darkenShadowHighlights");
    v101[1] = CFSTR("darkenShadows");
    v101[2] = CFSTR("saturationAdjustment");
    v101[3] = CFSTR("increaseSaturation");
    v101[4] = CFSTR("darkenAll");
    v101[5] = CFSTR("blueYellowContrast");
    v101[6] = CFSTR("redGreenContrast");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 7);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v71;
    objc_msgSend(v71, "removeObjectsForKeys:", v50);

    v7 = obja;
    if ((unint64_t)objc_msgSend(v49, "count") >= 3)
    {
      v51 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
      v92 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
      v93 = v51;
      v94 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
      v52 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
      v90 = *(float32x4_t *)MEMORY[0x1E0CD2338];
      v91 = v52;
      objc_msgSend(v49, "firstObject");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v55 = v49;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v86, &v96, 16);
        if (v56)
        {
          v57 = v56;
          v58 = *(_QWORD *)v87;
          do
          {
            for (i = 0; i != v57; ++i)
            {
              if (*(_QWORD *)v87 != v58)
                objc_enumerationMutation(v55);
              MTCAColorMatrixMakeWithDictionaryRepresentation(*(void **)(*((_QWORD *)&v86 + 1) + 8 * i), (uint64_t)v85);
              v82 = v92;
              v83 = v93;
              v84 = v94;
              v80 = v90;
              v81 = v91;
              CAColorMatrixConcat();
            }
            v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v86, &v96, 16);
          }
          while (v57);
        }
      }
      else
      {
        objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
        v55 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "floatValue");
        v61 = v60;
        objc_msgSend(v49, "objectAtIndexedSubscript:", 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "floatValue");
        objc_msgSend(v49, "objectAtIndexedSubscript:", 2);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "floatValue");
        v64 = objc_msgSend(v49, "count");
        if (v64 >= 4)
        {
          objc_msgSend(v49, "objectAtIndexedSubscript:", 3);
          isKindOfClass = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)isKindOfClass, "floatValue");
        }
        if ((unint64_t)objc_msgSend(v49, "count") <= 4)
        {
          MTCAColorMatrixMakeWithVibrantShadowAttributes(&v96, v61);
          v92 = v98;
          v93 = v99;
          v94 = v100;
          v90 = v96;
          v91 = v97;
        }
        else
        {
          objc_msgSend(v49, "objectAtIndexedSubscript:", 4);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "floatValue");
          MTCAColorMatrixMakeWithVibrantShadowAttributes(&v96, v61);
          v92 = v98;
          v93 = v99;
          v94 = v100;
          v90 = v96;
          v91 = v97;

        }
        if (v64 >= 4)

        v7 = obja;
        v14 = v69;
      }

      v82 = v92;
      v83 = v93;
      v84 = v94;
      v80 = v90;
      v81 = v91;
      MTCAColorMatrixCreateDictionaryRepresentation(&v80, *(double *)&v91);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setObject:forKeyedSubscript:", v66, CFSTR("inputColorMatrix"));

    }
  }
LABEL_6:

  objc_msgSend(v11, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v18;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v77 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
        v24 = v14;
        objc_msgSend(v14, "objectForKey:", v23);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (v25)
          v27 = (void *)v25;
        else
          v27 = v23;
        v28 = v27;

        objc_msgSend(v11, "objectForKey:", v23);
        v29 = objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v30 = (void *)v29;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v31 = v13;
            v32 = v7;
            +[MTColor colorWithDescription:](MTColor, "colorWithDescription:", v30);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            if (v33)
            {
              objc_msgSend(objc_retainAutorelease(v33), "CGColor");
              v35 = objc_claimAutoreleasedReturnValue();
              goto LABEL_20;
            }
            if (MTCAColorMatrixIsDictionaryRepresentation(v30))
            {
              v36 = (void *)MEMORY[0x1E0CB3B18];
              MTCAColorMatrixMakeWithDictionaryRepresentation(v30, (uint64_t)v75);
              objc_msgSend(v36, "valueWithBytes:objCType:", v75, "{CAColorMatrix=ffffffffffffffffffff}");
              v35 = objc_claimAutoreleasedReturnValue();
LABEL_20:
              v37 = (void *)v35;

              v30 = v37;
            }

            v7 = v32;
            v13 = v31;
            v11 = v71;
          }
          objc_msgSend(v7, "setValue:forProperty:ofFilter:isCompositingFilter:", v30, v28, v13, v74);

        }
        v14 = v24;
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
    }
    while (v20);
  }

  return v7;
}

id MTAllPlatformColorVisualStyles()
{
  if (MTAllPlatformColorVisualStyles_onceToken != -1)
    dispatch_once(&MTAllPlatformColorVisualStyles_onceToken, &__block_literal_global_131);
  return (id)MTAllPlatformColorVisualStyles___systemColorVisualStyles;
}

id MTAllOrdinalVisualStyles()
{
  if (MTAllOrdinalVisualStyles_onceToken != -1)
    dispatch_once(&MTAllOrdinalVisualStyles_onceToken, &__block_literal_global_130);
  return (id)MTAllOrdinalVisualStyles___visualStyles;
}

id MTMaterialCreateDictionaryRepresentation(void *a1, void *a2)
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a1;
  v6 = objc_alloc_init(v4);
  _MTRecipeForRecipeWithOptions(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("MTDictionaryRepresentationOptionsBundleKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MTMaterialSettingsForRecipeFromBundle(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "baseMaterialSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MTTintingFilteringSettingsCreateDictionaryRepresentation(v10, v3);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v11;
  }

  return v6;
}

__CFString *_MTRecipeForRecipeWithOptions(void *a1, void *a2)
{
  id v3;
  id v4;
  __CFString *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString **v9;
  void *v10;
  uint64_t v11;

  v3 = a1;
  v4 = a2;
  v5 = (__CFString *)v3;
  objc_msgSend(v4, "objectForKey:", CFSTR("MTDictionaryRepresentationOptionsReduceTransparencyKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = v5;
  if (v7)
  {
    if ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("platformChromeLight")) & 1) != 0)
    {
      v9 = MTCoreMaterialRecipePlatformChromeLightReduceTransparency;
LABEL_7:
      v8 = *v9;

      goto LABEL_8;
    }
    v8 = v5;
    if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("platformChromeDark")))
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("MTDictionaryRepresentationOptionsUserInterfaceLevelKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      v9 = MTCoreMaterialRecipePlatformChromeDarkReduceTransparency;
      if (v11 == 1)
        v9 = MTCoreMaterialRecipePlatformChromeDarkReduceTransparencyLayer1;
      goto LABEL_7;
    }
  }
LABEL_8:

  return v8;
}

id _MTGetCoreMaterialPlatformConfiguration()
{
  void *v0;
  MTCoreMaterialDefaultPlatformConfiguration *v1;
  void *v2;

  v0 = (void *)__platformConfiguration;
  if (!__platformConfiguration)
  {
    v1 = objc_alloc_init(MTCoreMaterialDefaultPlatformConfiguration);
    v2 = (void *)__platformConfiguration;
    __platformConfiguration = (uint64_t)v1;

    v0 = (void *)__platformConfiguration;
  }
  return v0;
}

uint64_t MTCAColorMatrixIsDictionaryRepresentation(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m11"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v2, v2))
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m12"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v3, v3))
    {
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m13"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v4, v4))
      {
        objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m14"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v5, v5))
        {
          objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m15"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v6, v6))
          {
            objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m21"));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v7, v7))
            {
              objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m22"));
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v8, v8))
              {
                objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m23"));
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v9, v9))
                {
                  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m24"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v23, v23))
                  {
                    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m25"));
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v22, v22))
                    {
                      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m31"));
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v21, v21))
                      {
                        objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m32"));
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v20, v20))
                        {
                          objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m33"));
                          v19 = (void *)objc_claimAutoreleasedReturnValue();
                          if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v19, v19))
                          {
                            objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m34"));
                            v18 = (void *)objc_claimAutoreleasedReturnValue();
                            if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v18, v18))
                            {
                              objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m35"));
                              v17 = (void *)objc_claimAutoreleasedReturnValue();
                              if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v17, v17))
                              {
                                objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m41"));
                                v16 = (void *)objc_claimAutoreleasedReturnValue();
                                if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v16, v16))
                                {
                                  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m42"));
                                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v15, v15))
                                  {
                                    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m43"));
                                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v14, v14))
                                    {
                                      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m44"));
                                      v13 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v13, v13))
                                      {
                                        objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("m45"));
                                        v12 = (void *)objc_claimAutoreleasedReturnValue();
                                        v10 = __MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v12, v12);

                                      }
                                      else
                                      {
                                        v10 = 0;
                                      }

                                    }
                                    else
                                    {
                                      v10 = 0;
                                    }

                                  }
                                  else
                                  {
                                    v10 = 0;
                                  }

                                }
                                else
                                {
                                  v10 = 0;
                                }

                              }
                              else
                              {
                                v10 = 0;
                              }

                            }
                            else
                            {
                              v10 = 0;
                            }

                          }
                          else
                          {
                            v10 = 0;
                          }

                        }
                        else
                        {
                          v10 = 0;
                        }

                      }
                      else
                      {
                        v10 = 0;
                      }

                    }
                    else
                    {
                      v10 = 0;
                    }

                  }
                  else
                  {
                    v10 = 0;
                  }

                }
                else
                {
                  v10 = 0;
                }

              }
              else
              {
                v10 = 0;
              }

            }
            else
            {
              v10 = 0;
            }

          }
          else
          {
            v10 = 0;
          }

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void MTCAColorMatrixMakeWithDictionaryRepresentation(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  int v66;
  id v67;

  v3 = a1;
  v4 = (_OWORD *)MEMORY[0x1E0CD2338];
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  *(_OWORD *)(a2 + 48) = v5;
  *(_OWORD *)(a2 + 64) = v4[4];
  v6 = v4[1];
  *(_OWORD *)a2 = *v4;
  *(_OWORD *)(a2 + 16) = v6;
  if (v3)
  {
    v67 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("m11"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m11"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      *(_DWORD *)a2 = v9;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m12"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m12"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      *(_DWORD *)(a2 + 4) = v12;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m13"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m13"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      *(_DWORD *)(a2 + 8) = v15;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m14"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m14"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      *(_DWORD *)(a2 + 12) = v18;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m15"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m15"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      *(_DWORD *)(a2 + 16) = v21;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m21"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m21"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      *(_DWORD *)(a2 + 20) = v24;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m22"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m22"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "floatValue");
      *(_DWORD *)(a2 + 24) = v27;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m23"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m23"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "floatValue");
      *(_DWORD *)(a2 + 28) = v30;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m24"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m24"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      *(_DWORD *)(a2 + 32) = v33;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m25"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m25"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "floatValue");
      *(_DWORD *)(a2 + 36) = v36;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m31"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m31"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "floatValue");
      *(_DWORD *)(a2 + 40) = v39;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m32"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m32"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "floatValue");
      *(_DWORD *)(a2 + 44) = v42;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m33"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m33"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "floatValue");
      *(_DWORD *)(a2 + 48) = v45;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m34"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m34"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "floatValue");
      *(_DWORD *)(a2 + 52) = v48;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m35"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m35"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "floatValue");
      *(_DWORD *)(a2 + 56) = v51;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m41"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m41"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "floatValue");
      *(_DWORD *)(a2 + 60) = v54;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m42"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m42"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "floatValue");
      *(_DWORD *)(a2 + 64) = v57;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m43"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m43"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "floatValue");
      *(_DWORD *)(a2 + 68) = v60;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m44"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m44"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "floatValue");
      *(_DWORD *)(a2 + 72) = v63;

    }
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m45"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("m45"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "floatValue");
      *(_DWORD *)(a2 + 76) = v66;

    }
    v3 = v67;
  }

}

uint64_t MTCompareBlurInputQualities(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = a1;
  if (!MTIsValidBlurInputQuality(v4) || (MTIsValidBlurInputQuality(v3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSComparisonResult MTCompareBlurInputQualities(NSString *__strong, NSString *__strong)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("MTUtilities.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("MTIsValidBlurInputQuality(inputQuality1) && MTIsValidBlurInputQuality(inputQuality2)"));

  }
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("default")))
    v5 = CFSTR("medium");
  else
    v5 = v4;
  v6 = v5;

  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("default")))
    v7 = CFSTR("medium");
  else
    v7 = v3;
  v8 = v7;

  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", v8) & 1) != 0)
  {
    v9 = 0;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("low")) & 1) != 0)
  {
    v9 = -1;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("high")) & 1) != 0)
  {
    v9 = 1;
  }
  else if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("low")))
  {
    v9 = 1;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

uint64_t MTIsValidBlurInputQuality(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("default")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("low")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("medium")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("high"));
  }

  return v2;
}

float32x4_t MTCAColorMatrixInterpolate@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X8>, double a4@<D0>)
{
  double v4;
  float32x4_t v5;
  float32x4_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float32x4_t v18;
  float32x4_t result;

  v4 = fmax(fmin(a4, 1.0), 0.0);
  v5 = a1[1];
  v6 = vsubq_f32(*a2, *a1);
  v7 = vcvtq_f64_f32(*(float32x2_t *)v5.f32);
  v8 = vcvt_hight_f64_f32(v5);
  v9 = vsubq_f32(a2[1], v5);
  *a3 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)a1->f32), vcvtq_f64_f32(*(float32x2_t *)v6.f32), v4)), vmlaq_n_f64(vcvt_hight_f64_f32(*a1), vcvt_hight_f64_f32(v6), v4));
  a3[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(v7, vcvtq_f64_f32(*(float32x2_t *)v9.f32), v4)), vmlaq_n_f64(v8, vcvt_hight_f64_f32(v9), v4));
  v10 = a1[2];
  v11 = a1[3];
  v12 = vsubq_f32(a2[2], v10);
  v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v10.f32), vcvtq_f64_f32(*(float32x2_t *)v12.f32), v4)), vmlaq_n_f64(vcvt_hight_f64_f32(v10), vcvt_hight_f64_f32(v12), v4));
  v14 = vsubq_f32(a2[3], v11);
  a3[2] = v13;
  a3[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v11.f32), vcvtq_f64_f32(*(float32x2_t *)v14.f32), v4)), vmlaq_n_f64(vcvt_hight_f64_f32(v11), vcvt_hight_f64_f32(v14), v4));
  v15 = a1[4];
  v16 = vcvtq_f64_f32(*(float32x2_t *)v15.f32);
  v17 = vcvt_hight_f64_f32(v15);
  v18 = vsubq_f32(a2[4], v15);
  result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(v16, vcvtq_f64_f32(*(float32x2_t *)v18.f32), v4)), vmlaq_n_f64(v17, vcvt_hight_f64_f32(v18), v4));
  a3[4] = result;
  return result;
}

CGImageRef MTCGImageCreateWithName(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  const __CFURL *v21;
  CGDataProvider *v22;
  CGImageRef v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreMaterial"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v5;
  v8 = v7;
  if (v7)
  {
    v30[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 <= 0.0)
      a3 = MTBuiltInScreenScale();
    if (a3 == 0.0)
    {
      v10 = v9;
    }
    else
    {
      v10 = (void *)objc_msgSend(v9, "mutableCopy");
      v11 = (uint64_t)a3;
      if ((uint64_t)a3 >= 1)
      {
        objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("@%ldx"), 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 != 1)
        {
          v13 = 1;
          do
          {
            objc_msgSend(v10, "insertObject:atIndex:", v12, 0);

            objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("@%ldx"), ++v13);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          while (v11 != v13);
        }
        if (v12)
        {
          objc_msgSend(v10, "insertObject:atIndex:", v12, 0);

        }
      }

    }
  }
  else
  {
    v10 = 0;
  }
  v14 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v14 = v10;
  v15 = v14;

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v6, "URLForResource:withExtension:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), CFSTR("png"));
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (const __CFURL *)v20;
          goto LABEL_28;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v17)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_28:

  v22 = CGDataProviderCreateWithURL(v21);
  v23 = CGImageCreateWithPNGDataProvider(v22, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v22);

  return v23;
}

double MTBuiltInScreenScale()
{
  if (MTBuiltInScreenScale_onceToken != -1)
    dispatch_once(&MTBuiltInScreenScale_onceToken, &__block_literal_global_18);
  return *(double *)&MTBuiltInScreenScale___builtInScreenScale;
}

id MTTintingFilteringSettingsCreateDictionaryRepresentation(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  char v33;

  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v3)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("MTDictionaryRepresentationOptionsIncludeOptimizationsKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = objc_retainAutorelease(v3);
    +[MTColor colorWithCGColor:](MTColor, "colorWithCGColor:", objc_msgSend(v8, "tintColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tintAlpha");
    objc_msgSend(v9, "colorWithAlphaComponent:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:includingOptimizations:withAdditionalInfoPromise:", v10, v7, 0);

    objc_msgSend(v8, "luminanceValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "luminanceAmount");
    if (v11)
      v12 = 0;
    else
      v12 = &__block_literal_global_7;
    objc_msgSend(v5, "setLuminanceAmount:values:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", v11, 1, v7, v12);
    objc_msgSend(v4, "objectForKey:", CFSTR("MTDictionaryRepresentationOptionsReduceTransparencyKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v8, "saturation");
      v15 = 1;
      objc_msgSend(v5, "setSaturation:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 1, v7, 0);
      objc_msgSend(v8, "brightness");
      objc_msgSend(v5, "setBrightness:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 1, v7, 0);
    }
    else
    {
      objc_msgSend(v8, "blurRadius");
      v17 = v16;
      v18 = objc_retainAutorelease(v8);
      v19 = objc_msgSend(v18, "variableBlurInputMask");
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __MTTintingFilteringSettingsCreateDictionaryRepresentation_block_invoke_2;
      v31[3] = &unk_1E5879688;
      v33 = v7;
      v20 = v18;
      v32 = v20;
      objc_msgSend(v5, "setBlurRadius:inputMaskImage:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", v19, 1, v7, v31, v17);

      objc_msgSend(v20, "saturation");
      objc_msgSend(v5, "setSaturation:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 1, v7, 0);
      objc_msgSend(v20, "brightness");
      objc_msgSend(v5, "setBrightness:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 1, v7, 0);
      v15 = objc_msgSend(v20, "isAverageColorEnabled");
    }
    objc_msgSend(v5, "setAverageColorEnabled:includingOptimizations:withAdditionalInfoPromise:", v15, v7, 0);
    objc_msgSend(v8, "zoom");
    objc_msgSend(v5, "setZoom:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 1, v7, 0);
    objc_msgSend(v8, "colorMatrix");
    objc_msgSend(v5, "setColorMatrix:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", &v30, 1, v7, 0);
    objc_msgSend(v8, "curvesValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCurvesInputValues:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", v21, 1, v7, 0);

    if ((_DWORD)v7)
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "backdropScale");
      objc_msgSend(v22, "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "mt_isIdentityValueForMaterialSettingsProperty:", CFSTR("backdropScale"));

      if ((v24 & 1) == 0)
      {
        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "backdropScale");
        objc_msgSend(v25, "numberWithDouble:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("scale"));

      }
    }
    if ((objc_msgSend(v8, "isBlurAtEnd") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0CD2708], "mt_orderedFilterTypesBlurAtEnd");
    else
      objc_msgSend(MEMORY[0x1E0CD2708], "mt_orderedFilterTypes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortFiltersWithOrder:", v27);
    objc_msgSend(v8, "userInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("userInfo"));

  }
  return v5;
}

id MTVisualStylingCreateDictionaryRepresentation(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  _MTRecipeForRecipeWithOptions(a1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("MTDictionaryRepresentationOptionsBundleKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    MTSharedVisualStyleSetForStyleNameFromBundle(v10, v11);
  else
    MTSharedVisualStyleSetForRecipeAndCategory(v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12
    || (objc_msgSend(v12, "visualStylingForStyle:", v8), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (v15 = v14,
        MTVisualStylingSettingsCreateDictionaryRepresentation(v14, v9),
        v16 = (id)objc_claimAutoreleasedReturnValue(),
        v15,
        !v16))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  }

  return v16;
}

id MTVisualStylingSettingsCreateDictionaryRepresentation(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v3)
  {
    objc_msgSend(v3, "tintColorDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "tintColorDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("tintColor"));

      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "tintAlpha");
      objc_msgSend(v8, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("tintAlpha"));

    }
    objc_msgSend(v3, "compositingFilter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && (objc_msgSend(v4, "objectForKey:", CFSTR("MTDictionaryRepresentationOptionsFiltersRepresentationV2Key")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "BOOLValue"),
          v11,
          !v12))
    {
      objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("compositingFilter"));
    }
    else
    {
      objc_msgSend(v3, "filterType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "filterProperties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      MTComposedFilterCreateDictionaryRepresentation(v13, v14, v10 != 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addEntriesFromDictionary:", v15);

    }
    objc_msgSend(v3, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("userInfo"));

  }
  return v5;
}

id MTMaterialSettingsForRecipeFromBundle(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v4;
  if (v5 && (objc_msgSend(v5, "isEqualToString:", CFSTR("none")) & 1) == 0)
  {
    _RecipeNameForCoreMaterialRecipe(v5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v5;
    v11 = v10;

    _SharedMaterialSettingsForRecipeWithNameFromBundle(v11, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id MTSharedVisualStyleSetForRecipeAndCategory(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    _RecipeNameForCoreMaterialRecipe(v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v3;
    v10 = v9;

    v11 = v5;
    _SharedMaterialSettingsForRecipeWithNameFromBundle(v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "styleNameForCategory:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    MTSharedVisualStyleSetForStyleNameFromBundle(v13, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v10;
  }

  return v6;
}

MTRecipeMaterialSettings *_SharedMaterialSettingsForRecipeWithNameFromBundle(void *a1, void *a2)
{
  id v3;
  id v4;
  MTRecipeMaterialSettings *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3 || (objc_msgSend(v3, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v5 = 0;
    goto LABEL_47;
  }
  if (_SharedMaterialSettingsForRecipeWithNameFromBundle_onceToken != -1)
    dispatch_once(&_SharedMaterialSettingsForRecipeWithNameFromBundle_onceToken, &__block_literal_global_147);
  _RecipeNamesToSharedInstances();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v3);
  v5 = (MTRecipeMaterialSettings *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_SharedMaterialSettingsForRecipeWithNameFromBundle___lock);
    objc_msgSend(MEMORY[0x1E0CB34D0], "coreMaterialOverrideRecipeBundle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "coreMaterialRecipeBundle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v3;
    v8 = 0;
    v9 = v7;
    v30 = v7;
    while (1)
    {
      objc_msgSend(v4, "URLForMaterialRecipeDescendant:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;

      }
      else
      {
        objc_msgSend(v32, "URLForMaterialRecipeDescendant:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(v31, "URLForMaterialRecipeDescendant:", v7);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = v14;

        if (!v11)
        {
          v21 = v9;
LABEL_32:
          objc_msgSend(v4, "URLForMaterialRecipe:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24
            || (objc_msgSend(v32, "URLForMaterialRecipe:", v21),
                (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
            || (objc_msgSend(v31, "URLForMaterialRecipe:", v21),
                (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v33 = 0;
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v24, &v33);
            v26 = v33;
            v27 = v26;
            if (!v25 || v26)
            {
              if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_ERROR))
                _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_1();
              v5 = 0;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG))
                _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_3();
              v5 = -[MTRecipeMaterialSettings initWithRecipeName:andDescription:descendantDescriptions:bundle:]([MTRecipeMaterialSettings alloc], "initWithRecipeName:andDescription:descendantDescriptions:bundle:", v30, v25, v8, v4);
              if (v5)
              {
                _RecipeNamesToSharedInstances();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKey:", v5, v30);

                if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG))
                  _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_2();
              }
            }

          }
          else
          {
            v5 = 0;
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&_SharedMaterialSettingsForRecipeWithNameFromBundle___lock);

          break;
        }
      }
      v15 = objc_alloc(MEMORY[0x1E0C99D80]);
      v34 = 0;
      v16 = (void *)objc_msgSend(v15, "initWithContentsOfURL:error:", v11, &v34);
      v17 = v34;
      v18 = v17;
      v19 = MTLogConfiguration;
      if (v16)
        v20 = v17 == 0;
      else
        v20 = 0;
      if (v20)
      {
        if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v36 = v11;
          _os_log_debug_impl(&dword_1AAB41000, v19, OS_LOG_TYPE_DEBUG, "Loaded descendant material recipe plist at URL: %{public}@", buf, 0xCu);
        }
        objc_msgSend(v16, "objectForKey:", CFSTR("ancestorRecipe"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "objectForKey:", CFSTR("descendantDescription"));
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        v7 = 0;
        if (v21 && v22)
        {
          if (!v8)
            v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v8, "insertObject:atIndex:", v23, 0);
          v7 = v21;
        }

      }
      else
      {
        if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v36 = v11;
          v37 = 2114;
          v38 = v18;
          _os_log_error_impl(&dword_1AAB41000, v19, OS_LOG_TYPE_ERROR, "Failed to load descendant material recipe plist at URL (%{public}@): %{public}@", buf, 0x16u);
        }
        v7 = 0;
        v21 = v9;
      }

      v9 = v21;
      if (!v7)
        goto LABEL_32;
    }
  }
LABEL_47:

  return v5;
}

id _RecipeNamesToSharedInstances()
{
  if (_RecipeNamesToSharedInstances_onceToken != -1)
    dispatch_once(&_RecipeNamesToSharedInstances_onceToken, &__block_literal_global_146_0);
  return (id)_RecipeNamesToSharedInstances___recipeNamesToSharedInstances;
}

id _RecipeNameForCoreMaterialRecipe(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "isEqualToString:", CFSTR("none")) & 1) == 0)
  {
    if (_LoadCoreMaterialRecipeNames_onceToken != -1)
      dispatch_once(&_LoadCoreMaterialRecipeNames_onceToken, &__block_literal_global_143);
    if (objc_msgSend((id)__coreMaterialRecipeNames, "containsObject:", v2))
      v4 = v2;
    else
      v4 = 0;
    v3 = v4;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

MTVisualStyleSet *MTSharedVisualStyleSetForStyleNameFromBundle(void *a1, void *a2)
{
  id v3;
  id v4;
  MTVisualStyleSet *v5;
  id v6;
  id v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v27;
  id v28;
  id obj;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    _StylesToSharedInstances();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKey:", v3);
    v5 = (MTVisualStyleSet *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      obj = v31;
      objc_sync_enter(obj);
      objc_msgSend(MEMORY[0x1E0CB34D0], "coreMaterialOverrideRecipeBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "coreMaterialRecipeBundle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v3;
      v7 = 0;
      *(_QWORD *)&v8 = 138543362;
      v27 = v8;
      v9 = v6;
      v28 = v6;
      do
      {
        objc_msgSend(v4, "URLForVisualStyleSetDescendant:", v6, v27);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {

        }
        else
        {
          objc_msgSend(v32, "URLForVisualStyleSetDescendant:", v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = v11;
          }
          else
          {
            objc_msgSend(v30, "URLForVisualStyleSetDescendant:", v6);
            v13 = (id)objc_claimAutoreleasedReturnValue();
          }
          v10 = v13;

          if (!v10)
            break;
        }
        v14 = objc_alloc(MEMORY[0x1E0C99D80]);
        v34 = 0;
        v15 = (void *)objc_msgSend(v14, "initWithContentsOfURL:error:", v10, &v34);
        v16 = v34;
        v17 = v16;
        v18 = MTLogConfiguration;
        if (!v15 || v16)
        {
          if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v36 = v10;
            v37 = 2114;
            v38 = v17;
            _os_log_error_impl(&dword_1AAB41000, v18, OS_LOG_TYPE_ERROR, "Failed to load descendant style set plist at URL (%{public}@): %{public}@", buf, 0x16u);
          }
          v6 = 0;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v27;
            v36 = v10;
            _os_log_debug_impl(&dword_1AAB41000, v18, OS_LOG_TYPE_DEBUG, "Loaded descendant style set plist at URL: %{public}@", buf, 0xCu);
          }
          objc_msgSend(v15, "objectForKey:", CFSTR("ancestorStyleSet"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKey:", CFSTR("descendantDescription"));
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          v6 = 0;
          if (v19 && v20)
          {
            if (!v7)
              v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v7, "insertObject:atIndex:", v21, 0);
            v6 = v19;
          }

          v9 = v19;
        }

      }
      while (v6);
      objc_msgSend(v4, "URLForVisualStyleSet:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22
        || (objc_msgSend(v32, "URLForVisualStyleSet:", v9), (v22 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        || (objc_msgSend(v30, "URLForVisualStyleSet:", v9), (v22 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v33 = 0;
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v22, &v33);
        v24 = v33;
        v25 = v24;
        if (!v23 || v24)
        {
          if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_ERROR))
            MTSharedVisualStyleSetForStyleNameFromBundle_cold_1();
          v5 = 0;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG))
            MTSharedVisualStyleSetForStyleNameFromBundle_cold_3();
          v5 = -[MTVisualStyleSet initWithName:visualStyleSetDescription:andDescendantDescriptions:]([MTVisualStyleSet alloc], "initWithName:visualStyleSetDescription:andDescendantDescriptions:", v28, v23, v7);
          if (v5)
          {
            objc_msgSend(obj, "setObject:forKey:", v5, v28);
            if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG))
              MTSharedVisualStyleSetForStyleNameFromBundle_cold_2();
          }
        }

      }
      else
      {
        v5 = 0;
      }

      objc_sync_exit(obj);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_1AAB49EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id _StylesToSharedInstances()
{
  if (_StylesToSharedInstances_onceToken != -1)
    dispatch_once(&_StylesToSharedInstances_onceToken, &__block_literal_global_150);
  return (id)_StylesToSharedInstances___stylesToSharedInstances;
}

uint64_t MTDynamicBlurRadiusGraphicsQuality()
{
  if (MTDynamicBlurRadiusGraphicsQuality_onceToken != -1)
    dispatch_once(&MTDynamicBlurRadiusGraphicsQuality_onceToken, &__block_literal_global_14);
  if (MTDynamicBlurRadiusGraphicsQuality___dynamicBlurRadiusGraphicsQuality)
    return 10;
  else
    return 100;
}

BOOL MTFloatIsOne(double a1)
{
  return fabs(a1 + -1.0) < 2.22044605e-16;
}

BOOL _IsValueIdentity(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 IsIdentity;
  float v8;
  _OWORD v10[5];

  v5 = a1;
  v6 = a2;
  if (!_IsIdentityProperty(v6, a3))
  {
LABEL_6:
    IsIdentity = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2BF0]))
  {
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2B88]) & 1) == 0)
    {
      objc_msgSend(v5, "floatValue");
      IsIdentity = MTIdentityValueForFilter(v6) == v8;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (v5)
    objc_msgSend(v5, "CAColorMatrixValue");
  else
    memset(v10, 0, sizeof(v10));
  IsIdentity = MTCAColorMatrixIsIdentity(v10);
LABEL_10:

  return IsIdentity;
}

BOOL MTCAColorMatrixIsIdentity(_OWORD *a1)
{
  __int128 v1;
  __int128 v2;
  _OWORD v4[5];

  v1 = a1[3];
  v4[2] = a1[2];
  v4[3] = v1;
  v4[4] = a1[4];
  v2 = a1[1];
  v4[0] = *a1;
  v4[1] = v2;
  return MTCAColorMatrixEqualToMatrix((float *)v4, MEMORY[0x1E0CD2338]);
}

BOOL MTCAColorMatrixEqualToMatrix(float *a1, float *a2)
{
  return *a1 == *a2
      && a1[1] == a2[1]
      && a1[2] == a2[2]
      && a1[3] == a2[3]
      && a1[4] == a2[4]
      && a1[5] == a2[5]
      && a1[6] == a2[6]
      && a1[7] == a2[7]
      && a1[8] == a2[8]
      && a1[9] == a2[9]
      && a1[10] == a2[10]
      && a1[11] == a2[11]
      && a1[12] == a2[12]
      && a1[13] == a2[13]
      && a1[14] == a2[14]
      && a1[15] == a2[15]
      && a1[16] == a2[16]
      && a1[17] == a2[17]
      && a1[18] == a2[18]
      && a1[19] == a2[19];
}

double MTIdentityValueForFilter(void *a1)
{
  int v1;
  double result;

  v1 = objc_msgSend(a1, "isEqualToString:", *MEMORY[0x1E0CD2C00]);
  result = 0.0;
  if (v1)
    return 1.0;
  return result;
}

BOOL MTFloatEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a2, a1) < 2.22044605e-16;
}

void sub_1AAB4D82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MTProtocolGetProperties(void *a1, char a2)
{
  Protocol *v3;
  id v4;
  objc_property_t *v5;
  unsigned int v6;
  objc_property_t *v7;
  unsigned int v8;
  unsigned int v9;
  objc_property_t *v10;
  void *v11;
  unsigned int v13;
  unsigned int outCount;

  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  outCount = 0;
  if ((a2 & 1) != 0)
    v5 = protocol_copyPropertyList2(v3, &outCount, 1, 1);
  else
    v5 = 0;
  v13 = 0;
  if ((a2 & 2) != 0)
  {
    v7 = protocol_copyPropertyList2(v3, &v13, 0, 1);
    v6 = v13;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = outCount;
  if (v6 + outCount)
  {
    v9 = 0;
    do
    {
      if (v9 >= v8)
      {
        v10 = v7;
      }
      else
      {
        v8 = 0;
        v10 = v5;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v10[v9 - v8]));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v11);

      ++v9;
      v8 = outCount;
    }
    while (v9 < v13 + outCount);
  }
  if (v5)
    free(v5);
  if (v7)
    free(v7);

  return v4;
}

void MTRegisterCoreMaterialLogging()
{
  if (MTRegisterCoreMaterialLogging_onceToken != -1)
    dispatch_once(&MTRegisterCoreMaterialLogging_onceToken, &__block_literal_global_2);
}

id _MTLowQualityDevicesForDynamicBlurRadius()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("iPad5,1"), CFSTR("iPad5,2"), CFSTR("iPad5,3"), CFSTR("iPad5,4"), CFSTR("iPad7,1"), CFSTR("iPad7,2"), 0);
}

id _MTCurrentProduct()
{
  if (_MTCurrentProduct_onceToken != -1)
    dispatch_once(&_MTCurrentProduct_onceToken, &__block_literal_global_4);
  return (id)_MTCurrentProduct___currentProduct;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id MTCAColorMatrixCreateDictionaryRepresentation(_DWORD *a1, double a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[20];
  _QWORD v45[22];

  v45[20] = *MEMORY[0x1E0C80C00];
  v44[0] = CFSTR("m11");
  LODWORD(a2) = *a1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v43;
  v44[1] = CFSTR("m12");
  LODWORD(v3) = a1[1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v42;
  v44[2] = CFSTR("m13");
  LODWORD(v4) = a1[2];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v41;
  v44[3] = CFSTR("m14");
  LODWORD(v5) = a1[3];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v40;
  v44[4] = CFSTR("m15");
  LODWORD(v6) = a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v39;
  v44[5] = CFSTR("m21");
  LODWORD(v7) = a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v38;
  v44[6] = CFSTR("m22");
  LODWORD(v8) = a1[6];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v37;
  v44[7] = CFSTR("m23");
  LODWORD(v9) = a1[7];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v36;
  v44[8] = CFSTR("m24");
  LODWORD(v10) = a1[8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v35;
  v44[9] = CFSTR("m25");
  LODWORD(v11) = a1[9];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v34;
  v44[10] = CFSTR("m31");
  LODWORD(v12) = a1[10];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v33;
  v44[11] = CFSTR("m32");
  LODWORD(v13) = a1[11];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = v14;
  v44[12] = CFSTR("m33");
  LODWORD(v15) = a1[12];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[12] = v16;
  v44[13] = CFSTR("m34");
  LODWORD(v17) = a1[13];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[13] = v18;
  v44[14] = CFSTR("m35");
  LODWORD(v19) = a1[14];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45[14] = v20;
  v44[15] = CFSTR("m41");
  LODWORD(v21) = a1[15];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[15] = v22;
  v44[16] = CFSTR("m42");
  LODWORD(v23) = a1[16];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45[16] = v24;
  v44[17] = CFSTR("m43");
  LODWORD(v25) = a1[17];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[17] = v26;
  v44[18] = CFSTR("m44");
  LODWORD(v27) = a1[18];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45[18] = v28;
  v44[19] = CFSTR("m45");
  LODWORD(v29) = a1[19];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45[19] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

CGFloat MTCGColorPerceivedLightness(CGColor *a1)
{
  size_t NumberOfComponents;
  const CGFloat *Components;
  CGFloat result;

  NumberOfComponents = CGColorGetNumberOfComponents(a1);
  Components = CGColorGetComponents(a1);
  if (NumberOfComponents == 4)
    return sqrt(Components[1] * (Components[1] * 0.587)+ *Components * 0.299 * *Components+ Components[2] * 0.114 * Components[2]);
  result = 0.0;
  if (NumberOfComponents == 2)
    return *Components;
  return result;
}

BOOL MTCGColorIsPerceivedLight(CGColor *a1)
{
  return MTCGColorPerceivedLightness(a1) > 0.83;
}

BOOL MTCanGenerateVisualStylingDescriptionFromRecipeSettings(void *a1)
{
  void *v1;
  void *v2;
  _BOOL8 VisualStylingDescriptionFromConfigurationSettings;

  objc_msgSend(a1, "baseMaterialSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    VisualStylingDescriptionFromConfigurationSettings = _CanGenerateVisualStylingDescriptionFromConfigurationSettings(v1);
  else
    VisualStylingDescriptionFromConfigurationSettings = 0;

  return VisualStylingDescriptionFromConfigurationSettings;
}

BOOL _CanGenerateVisualStylingDescriptionFromConfigurationSettings(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  _OWORD v23[5];

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "luminanceAmount");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mt_isIdentityValueForMaterialSettingsProperty:", CFSTR("luminanceAmount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v1, "isAverageColorEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mt_isIdentityValueForMaterialSettingsProperty:", CFSTR("averageColorEnabled"));

  objc_msgSend(v1, "curvesValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "saturation");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "mt_isIdentityValueForMaterialSettingsProperty:", CFSTR("saturation"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "brightness");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mt_isIdentityValueForMaterialSettingsProperty:", CFSTR("brightness"));

  objc_msgSend(v1, "tintColorDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3B18];
  if (v1)
    objc_msgSend(v1, "colorMatrix");
  else
    memset(v23, 0, sizeof(v23));
  objc_msgSend(v15, "valueWithBytes:objCType:", v23, "{CAColorMatrix=ffffffffffffffffffff}");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "mt_isIdentityValueForMaterialSettingsProperty:", CFSTR("colorMatrix"));

  v18 = v4 ^ 1;
  if (!v1)
    v18 = 1;
  v19 = v18 | v6 ^ 1;
  if (v7)
    v19 = 1;
  if (v14)
    v20 = 1;
  else
    v20 = v19;
  if (v20 & 1 | ((v17 & 1) == 0))
    v21 = v19;
  else
    v21 = v10 & v13;

  return (v21 & 1) == 0;
}

void sub_1AAB511E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

float32x4_t _MTCAColorMatrixFloydRound@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t result;

  v2.i64[0] = 0x4300000043000000;
  v2.i64[1] = 0x4300000043000000;
  v3.i64[0] = 0x3C0000003C000000;
  v3.i64[1] = 0x3C0000003C000000;
  v4 = vmulq_f32(vrndaq_f32(vmulq_f32(a1[1], v2)), v3);
  *a2 = vmulq_f32(vrndaq_f32(vmulq_f32(*a1, v2)), v3);
  a2[1] = v4;
  v5 = vmulq_f32(vrndaq_f32(vmulq_f32(a1[3], v2)), v3);
  a2[2] = vmulq_f32(vrndaq_f32(vmulq_f32(a1[2], v2)), v3);
  a2[3] = v5;
  result = vmulq_f32(vrndaq_f32(vmulq_f32(a1[4], v2)), v3);
  a2[4] = result;
  return result;
}

void MTCAColorMatrixMakeWithVibrantShadowAttributes(float32x4_t *a1@<X8>, float a2@<S0>)
{
  __int128 v3;
  __int128 v4;
  float32x4_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  float32x4_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  MTFloatIsZero(fmaxf(fminf(a2, 0.99902), -0.99902));
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  v13 = v3;
  v14 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
  v10 = *(float32x4_t *)MEMORY[0x1E0CD2338];
  v7 = v12;
  v8 = v3;
  v9 = v14;
  v5 = v10;
  v6 = v4;
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  v13 = v8;
  v11 = v6;
  _MTCAColorMatrixFloydRound(&v5, a1);
}

BOOL _CanGenerateMaterialDescriptionForFilteringFromVisualStyling(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  v1 = a1;
  objc_msgSend(v1, "filterType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CD2F08]))
  {
    objc_msgSend(v1, "filterProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

double _MTDefaultBackdropScaleAdjustmentForWeighting()
{
  return 1.5 / MTPreferredDisplayModeScale();
}

uint64_t MTSupportsDeepColor()
{
  if (MTSupportsDeepColor_onceToken != -1)
    dispatch_once(&MTSupportsDeepColor_onceToken, &__block_literal_global_15);
  return MTSupportsDeepColor___supportsDeepColor;
}

double MTEdgeOutsetsForCoreMaterialShadowProperties(uint64_t a1, double a2)
{
  double v2;
  double v3;

  v2 = *(double *)(a1 + 24);
  v3 = *(double *)(a1 + 16) * a2;
  if (-(v3 - v2 * a2) >= 1.0)
    return -(v3 - v2 * a2);
  else
    return 1.0;
}

uint64_t MTDimensionsForContinuousCornerRadiusInBounds(uint64_t result)
{
  if ((_DWORD)result)
    return objc_msgSend(MEMORY[0x1E0CD27A8], "cornerCurveExpansionFactor:", *MEMORY[0x1E0CD2A68], 1.0);
  return result;
}

double MTResizableAreaForCornerDimensionsInBounds(double a1, double a2, double a3, double a4, double a5)
{
  double v7;
  double v8;

  v7 = 1.0 / a3;
  if (MTFloatEqualToFloat(a1 + a1, a4))
    v8 = 0.0;
  else
    v8 = v7;
  MTFloatEqualToFloat(a2 + a2, a5);
  return v8;
}

CGImageRef MTShadowImageCreateWithCoreMaterialShadowProperties(uint64_t a1, int a2, double *a3, CGFloat a4, double a5, double a6, double a7)
{
  uint64_t *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  size_t v34;
  size_t AlignedBytesPerRow;
  CGContext *v36;
  CGContext *v37;
  id v38;
  double Width;
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t v43;
  double v44;
  id v45;
  id v46;
  CGImageRef Image;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGAffineTransform v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  if (*(double *)(a1 + 24) <= 0.0)
    return 0;
  v14 = (uint64_t *)MEMORY[0x1E0CD2A68];
  v15 = 1.0;
  if (a2)
    objc_msgSend(MEMORY[0x1E0CD27A8], "cornerCurveExpansionFactor:", *MEMORY[0x1E0CD2A68], 1.0);
  v55 = a5;
  v16 = ceil(v15 * a5 * a4) / a4;
  if (v16 >= a6 * 0.5)
    v17 = a6 * 0.5;
  else
    v17 = v16;
  if (v16 >= a7 * 0.5)
    v18 = a7 * 0.5;
  else
    v18 = v16;
  if (MTFloatEqualToFloat(v17 + v17, a6))
    v19 = 0.0;
  else
    v19 = 1.0 / a4;
  v54 = v19;
  if (MTFloatEqualToFloat(v18 + v18, a7))
    v20 = 0.0;
  else
    v20 = 1.0 / a4;
  v21 = *(double *)(a1 + 24);
  v22 = *(double *)(a1 + 16) * a4;
  if (-(v22 - v21 * a4) >= 1.0)
    v23 = -(v22 - v21 * a4);
  else
    v23 = 1.0;
  v24 = *(double *)(a1 + 8) * a4;
  if (-(v24 - v21 * a4) >= 1.0)
    v25 = -(v24 - v21 * a4);
  else
    v25 = 1.0;
  v26 = v22 + v21 * a4;
  if (v26 >= 1.0)
    v27 = v26;
  else
    v27 = 1.0;
  v28 = v24 + v21 * a4;
  if (v28 >= 1.0)
    v29 = v28;
  else
    v29 = 1.0;
  v50 = v17;
  v30 = v54 + v17 * 2.0;
  v31 = v20 + v18 * 2.0;
  v51 = -v25;
  v57.origin.x = v25;
  v57.origin.y = v23;
  v57.size.width = v30;
  v57.size.height = v31;
  v49 = v29;
  v32 = v29 + CGRectGetWidth(v57) + v25;
  v52 = v30;
  v53 = v25;
  v58.origin.x = v25;
  v58.origin.y = v23;
  v58.size.width = v30;
  v58.size.height = v31;
  v33 = v27 + CGRectGetHeight(v58) + v23;
  v34 = (unint64_t)(v33 * a4);
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v36 = CGBitmapContextCreate(0, (unint64_t)(v32 * a4), v34, 8uLL, AlignedBytesPerRow, 0, 7u);
  v37 = v36;
  if (v36)
  {
    v59.size.width = (double)(unint64_t)(v32 * a4);
    v59.origin.x = 0.0;
    v59.origin.y = 0.0;
    v59.size.height = (double)v34;
    CGContextClearRect(v36, v59);
    CGContextTranslateCTM(v37, 0.0, (double)v34);
    CGContextScaleCTM(v37, a4, -a4);
    CGContextGetCTM(&v56, v37);
    CGContextSetBaseCTM();
  }
  v38 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  v60.origin.x = -v25;
  v60.origin.y = -v23;
  v60.size.width = v32;
  v60.size.height = v33;
  Width = CGRectGetWidth(v60);
  v61.origin.x = v51;
  v61.origin.y = -v23;
  v61.size.width = v32;
  v61.size.height = v33;
  objc_msgSend(v38, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v61));
  v40 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v38, "addSublayer:", v40);
  objc_msgSend(v40, "setFrame:", v53, v23, v52, v31);
  +[MTColor blackColor](MTColor, "blackColor");
  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v40, "setBackgroundColor:", objc_msgSend(v41, "CGColor"));

  v42 = (uint64_t *)MEMORY[0x1E0CD2A60];
  if (a2)
    v42 = v14;
  v43 = *v42;
  objc_msgSend(v40, "setCornerCurve:", *v42);
  objc_msgSend(v40, "setCornerRadius:", v55);
  LODWORD(v44) = *(_DWORD *)a1;
  objc_msgSend(v40, "setShadowOpacity:", v44);
  objc_msgSend(v40, "setShadowOffset:", *(double *)(a1 + 8), *(double *)(a1 + 16));
  objc_msgSend(v40, "setShadowRadius:", *(double *)(a1 + 24));
  objc_msgSend(v38, "renderInContext:", v37);
  v45 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v45, "setFrame:", v53, v23, v52, v31);
  +[MTColor blackColor](MTColor, "blackColor");
  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v45, "setBackgroundColor:", objc_msgSend(v46, "CGColor"));

  objc_msgSend(v45, "setCornerCurve:", v43);
  objc_msgSend(v45, "setCornerRadius:", v55);
  CGContextSetBlendMode(v37, kCGBlendModeClear);
  objc_msgSend(v40, "removeFromSuperlayer");
  objc_msgSend(v38, "addSublayer:", v45);
  objc_msgSend(v38, "renderInContext:", v37);
  Image = CGBitmapContextCreateImage(v37);
  CGContextRelease(v37);
  if (a3)
  {
    *a3 = v18 + v23;
    a3[1] = v50 + v53;
    a3[2] = v18 + v27;
    a3[3] = v50 + v49;
  }

  return Image;
}

CGImageRef _MTCreateDefaultLuminanceColorMap()
{
  return MTCGImageCreateWithName(CFSTR("luminanceColorMap"), 0, 0.0);
}

uint64_t MTDefaultLuminanceColorMap()
{
  if (MTDefaultLuminanceColorMap_onceToken != -1)
    dispatch_once(&MTDefaultLuminanceColorMap_onceToken, &__block_literal_global_5);
  return MTDefaultLuminanceColorMap___defaultLuminanceColorMap;
}

IOSurfaceRef MTIOSurfaceCreate(char a1, double a2, double a3)
{
  int v6;
  float v7;
  unint64_t v8;
  float v9;
  unint64_t v10;
  uint64_t AlignedBytesPerRow;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  float v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFDictionary *v23;
  uint64_t v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  IOSurfaceRef v37;
  _QWORD v39[2];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = MTSupportsDeepColor();
  v7 = a2;
  if (v6)
  {
    if ((a1 & 1) == 0)
    {
      v24 = llroundf(v7);
      v25 = a3;
      v26 = llroundf(v25);
      v27 = *MEMORY[0x1E0CBBF08];
      v28 = MEMORY[0x1AF4251F4](*MEMORY[0x1E0CBBF08], 4 * v24);
      v29 = v28 * v26;
      _makeIOSurfacePlaneProperties(v24, v26, v28, 0, v28 * v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1AF4251F4](v27, v24);
      v31 = v30 * v26;
      _makeIOSurfacePlaneProperties(v24, v26, v30, v29, v30 * v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31 + v29;
      v40 = *MEMORY[0x1E0CBC1E0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v21;
      v41 = *MEMORY[0x1E0CBC008];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *MEMORY[0x1E0CBC070];
      v47 = v22;
      v48 = &unk_1E587FD88;
      v34 = *MEMORY[0x1E0CBC158];
      v42 = v33;
      v43 = v34;
      v39[0] = v13;
      v39[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v35;
      v44 = *MEMORY[0x1E0CBBEE0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v40, 5);
      v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = llroundf(v7);
    v9 = a3;
    v10 = llroundf(v9);
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    v12 = (AlignedBytesPerRow * v10);
    v40 = *MEMORY[0x1E0CBC1E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v13;
    v41 = *MEMORY[0x1E0CBC008];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v14;
    v48 = &unk_1E587FD58;
    v15 = *MEMORY[0x1E0CBBF00];
    v42 = *MEMORY[0x1E0CBC070];
    v43 = v15;
    v16 = &unk_1E587FD70;
  }
  else
  {
    v17 = llroundf(v7);
    v18 = a3;
    v19 = llroundf(v18);
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    v12 = (AlignedBytesPerRow * v19);
    v40 = *MEMORY[0x1E0CBC1E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v13;
    v41 = *MEMORY[0x1E0CBC008];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v14;
    v48 = &unk_1E587FDA0;
    v20 = *MEMORY[0x1E0CBBF00];
    v42 = *MEMORY[0x1E0CBC070];
    v43 = v20;
    v16 = &unk_1E587FDB8;
  }
  v49 = v16;
  v44 = *MEMORY[0x1E0CBBF08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", AlignedBytesPerRow);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v21;
  v45 = *MEMORY[0x1E0CBBEE0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v40, 6);
  v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  v37 = IOSurfaceCreate(v23);
  return v37;
}

id _makeIOSurfacePlaneProperties(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0CBC178];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v16[1] = *MEMORY[0x1E0CBC140];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  v16[2] = *MEMORY[0x1E0CBC098];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  v16[3] = *MEMORY[0x1E0CBC160];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v12;
  v16[4] = *MEMORY[0x1E0CBC168];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id MTMaterialSettingsForRecipe(void *a1)
{
  return MTMaterialSettingsForRecipeFromBundle(a1, 0);
}

id MTDiscoveredMaterialRecipes()
{
  if (MTDiscoveredMaterialRecipes_onceToken != -1)
    dispatch_once(&MTDiscoveredMaterialRecipes_onceToken, &__block_literal_global_6);
  return (id)MTDiscoveredMaterialRecipes___materialRecipes;
}

id MTCoreMaterialRecipeForVisualStyleFromStyleWithNameFromBundle(void *a1, void *a2, void *a3)
{
  return _MTCoreMaterialRecipeForVisualStyleFromStyleWithNameFromBundleWithProvidedStyles(a1, a2, a3, 0);
}

id _MTCoreMaterialRecipeForVisualStyleFromStyleWithNameFromBundleWithProvidedStyles(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = 0;
  if (v7 && v8)
  {
    MTSharedVisualStyleSetForStyleNameFromBundle(v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    v14 = v12;
    v15 = v10;
    if (v14)
    {
      objc_msgSend(v14, "visualStyleSetName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MTVisualStyleSet recipeNameForRecipeFromStyle:fromStyleSetWithName:](MTVisualStyleSet, "recipeNameForRecipeFromStyle:fromStyleSetWithName:", v13, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      _RecipeNamesToSharedInstances();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v19 = (void *)objc_msgSend(v14, "_newMaterialSettingsForStyle:withProvidedStyles:", v13, v15);
          if (v19)
          {
            obj = v18;
            objc_sync_enter(obj);
            objc_msgSend(obj, "setObject:forKey:", v19, v17);
            objc_sync_exit(obj);

          }
        }
        else
        {
          v19 = 0;
        }
      }

    }
    else
    {
      v19 = 0;
    }

    if (v19)
    {
      objc_msgSend(v19, "recipeName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

void sub_1AAB54544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id MTCoreMaterialRecipeForVisualStyleFromStyleWithName(void *a1, void *a2)
{
  return _MTCoreMaterialRecipeForVisualStyleFromStyleWithNameFromBundleWithProvidedStyles(a1, a2, 0, 0);
}

id MTCoreMaterialRecipeForVisualStyleFromRecipeFromBundle(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  _SharedMaterialSettingsForRecipeWithNameFromBundle(a1, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "styleNameForCategory:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __MTCoreMaterialRecipeForVisualStyleFromRecipeFromBundle_block_invoke;
  v17[3] = &unk_1E5879508;
  v18 = v10;
  v12 = v10;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1AF42541C](v17);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  ((void (**)(_QWORD, const __CFString *, void *))v13)[2](v13, CFSTR("stroke"), v14);
  ((void (**)(_QWORD, const __CFString *, void *))v13)[2](v13, CFSTR("fill"), v14);
  ((void (**)(_QWORD, const __CFString *, void *))v13)[2](v13, CFSTR("overlay"), v14);
  _MTCoreMaterialRecipeForVisualStyleFromStyleWithNameFromBundleWithProvidedStyles(v8, v11, v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id MTSharedVisualStyleSetGeneratedFromRecipe(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    _RecipeNameForCoreMaterialRecipe(v1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (void *)v3;
    else
      v5 = v2;
    v6 = v5;

    +[MTRecipeMaterialSettings styleSetNameForStyleSetFromRecipeWithName:](MTRecipeMaterialSettings, "styleSetNameForStyleSetFromRecipeWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _StylesToSharedInstances();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      MTMaterialSettingsForRecipeFromBundle(v6, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v10, "_newVisualStyleSet");
        if (v9)
        {
          v11 = v8;
          objc_sync_enter(v11);
          objc_msgSend(v11, "setObject:forKey:", v9, v7);
          objc_sync_exit(v11);

        }
      }

    }
  }
  else
  {
    v9 = 0;
    v6 = 0;
  }

  return v9;
}

void sub_1AAB54844(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id MTAllVisualStyleCategories()
{
  if (MTAllVisualStyleCategories_onceToken != -1)
    dispatch_once(&MTAllVisualStyleCategories_onceToken, &__block_literal_global_128);
  return (id)MTAllVisualStyleCategories___categories;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id MTMaterialCreateDictionaryRepresentationWithOptions(void *a1, uint64_t a2, void *a3)
{
  return MTMaterialCreateDictionaryRepresentation(a1, a3);
}

id MTStylingProvidingSolidColorLayerStyleDictionaryForPlusLAndWhiteTint(CGColor *a1, double a2, double a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v17;
  double v18;
  double v19;
  _QWORD v20[4];
  _QWORD v21[4];
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v18 = 0.0;
  v19 = 0.0;
  v17 = 0.0;
  _ColorGetComponents(a1, &v19, &v18, &v17);
  v5 = fmin(a2 + a3 * v19, 1.0);
  if (v5 < 0.0)
    v5 = 0.0;
  v6 = fmin(a2 + a3 * v18, 1.0);
  if (v6 >= 0.0)
    v7 = v6;
  else
    v7 = 0.0;
  v8 = fmin(a2 + a3 * v17, 1.0);
  if (v8 >= 0.0)
    v9 = v8;
  else
    v9 = 0.0;
  v24 = CFSTR("tinting");
  v22 = CFSTR("tintColor");
  v21[0] = &unk_1E587FDD0;
  v20[0] = CFSTR("alpha");
  v20[1] = CFSTR("red");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  v20[2] = CFSTR("green");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v11;
  v20[3] = CFSTR("blue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id MTStylingProvidingSolidColorLayerHighlightStyleDictionary(CGColor *a1)
{
  double v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _DWORD v7[20];
  const __CFString *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  MTCGColorPerceivedLightness(a1);
  v12[0] = CFSTR("tinting");
  v12[1] = CFSTR("filtering");
  v13[0] = &unk_1E587FF50;
  v11[0] = *MEMORY[0x1E0CD2F08];
  v10[0] = CFSTR("filterType");
  v10[1] = CFSTR("filterProperties");
  v8 = CFSTR("inputColorMatrix");
  CAColorMatrixMakeBrightness();
  MTCAColorMatrixCreateDictionaryRepresentation(v7, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id MTStylingProvidingSolidColorLayerStyleDictionaryForPlusDAmount(CGColor *a1, double a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v17;
  double v18;
  double v19;
  _QWORD v20[4];
  _QWORD v21[4];
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v18 = 0.0;
  v19 = 0.0;
  v17 = 0.0;
  _ColorGetComponents(a1, &v19, &v18, &v17);
  v3 = 1.0 - a2;
  v4 = fmin(1.0 - a2 + 1.0 - v19, 1.0);
  if (v4 >= 0.0)
    v5 = 1.0 - v4;
  else
    v5 = 1.0;
  v6 = fmin(v3 + 1.0 - v18, 1.0);
  if (v6 >= 0.0)
    v7 = 1.0 - v6;
  else
    v7 = 1.0;
  v8 = fmin(v3 + 1.0 - v17, 1.0);
  if (v8 >= 0.0)
    v9 = 1.0 - v8;
  else
    v9 = 1.0;
  v24 = CFSTR("tinting");
  v22 = CFSTR("tintColor");
  v21[0] = &unk_1E587FDD0;
  v20[0] = CFSTR("alpha");
  v20[1] = CFSTR("red");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  v20[2] = CFSTR("green");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v11;
  v20[3] = CFSTR("blue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

CGFloat _ColorGetComponents(CGColor *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  size_t NumberOfComponents;
  const CGFloat *Components;
  CGFloat result;

  if (a1 && a2 && a3 && a4)
  {
    NumberOfComponents = CGColorGetNumberOfComponents(a1);
    Components = CGColorGetComponents(a1);
    if (NumberOfComponents == 4)
    {
      *a2 = *(_QWORD *)Components;
      *a3 = *((_QWORD *)Components + 1);
      Components += 2;
    }
    else
    {
      if (NumberOfComponents != 2)
        return result;
      *a2 = *(_QWORD *)Components;
      *a3 = *(_QWORD *)Components;
    }
    result = *Components;
    *a4 = *(_QWORD *)Components;
  }
  return result;
}

void _MTSetCoreMaterialPlatformConfiguration(void *a1)
{
  id v2;
  id v3;

  v2 = a1;
  if ((id)__platformConfiguration != v2)
  {
    v3 = v2;
    objc_storeStrong((id *)&__platformConfiguration, a1);
    v2 = v3;
  }

}

void sub_1AAB55CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL MTFloatIsZero(double a1)
{
  return fabs(a1) < 2.22044605e-16;
}

double MTPreferredDisplayModeScale()
{
  if (MTPreferredDisplayModeScale___once != -1)
    dispatch_once(&MTPreferredDisplayModeScale___once, &__block_literal_global_9);
  return *(double *)&MTPreferredDisplayModeScale___cachedScale;
}

void _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1AAB41000, v0, v1, "Failed to load material recipe plist at URL (%{public}@): %{public}@");
  OUTLINED_FUNCTION_3();
}

void _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1AAB41000, v0, v1, "Loaded recipe material settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1AAB41000, v0, v1, "Loaded base material recipe plist at URL: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void MTSharedVisualStyleSetForStyleNameFromBundle_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1AAB41000, v0, v1, "Failed to load stytle set plist at URL (%{public}@): %{public}@");
  OUTLINED_FUNCTION_3();
}

void MTSharedVisualStyleSetForStyleNameFromBundle_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1AAB41000, v0, v1, "Loaded style set settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void MTSharedVisualStyleSetForStyleNameFromBundle_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1AAB41000, v0, v1, "Loaded base style set plist at URL: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1E0CD2330]();
}

uint64_t CAColorMatrixMakeBrightness()
{
  return MEMORY[0x1E0CD2340]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x1E0CD2348]();
}

uint64_t CAColorMatrixMakeSaturation()
{
  return MEMORY[0x1E0CD2370]();
}

uint64_t CARenderServerSnapshot()
{
  return MEMORY[0x1E0CD25E0]();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1E0CD25F0](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BED0](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C610](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CBD0](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x1E0CBBAC0](property, value);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

objc_property_t *__cdecl protocol_copyPropertyList2(Protocol *proto, unsigned int *outCount, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  return (objc_property_t *)MEMORY[0x1E0DE8098](proto, outCount, isRequiredProperty, isInstanceProperty);
}

