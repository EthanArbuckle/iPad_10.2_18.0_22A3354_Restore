@implementation CABackdropLayer(CoreMaterial)

- (void)_mt_applyFilterDescription:()CoreMaterial remainingExistingFilters:filterOrder:removingIfIdentity:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v37 = a5;
  objc_msgSend(v9, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = v9;
  objc_msgSend(v9, "objectForKey:", CFSTR("type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MTFilterKeyPathForFilter(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a1;
  objc_msgSend(a1, "valueForKeyPath:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v10;
  objc_msgSend(v10, "removeObject:", v17);

  objc_msgSend(v12, "removeObject:", CFSTR("type"));
  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CD2C20]))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);
    v19 = objc_alloc(MEMORY[0x1E0C99E60]);
    MTCAFilterCurvesInputValuesKeys();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithArray:", v20);
    v22 = objc_msgSend(v18, "intersectsSet:", v21);

    v23 = a6;
    if (!a6 || v22)
      objc_msgSend(v16, "_mt_configureFilterOfType:ifNecessaryWithFilterOrder:", v14, v37);
    else
      objc_msgSend(v16, "_mt_removeFilterOfTypeIfNecessary:", v14);
  }
  else
  {
    _IdentityPropertyForFilterType(v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v24);
    if (v24)
    {
      objc_msgSend(v9, "objectForKey:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = a1;
      v23 = a6;
      objc_msgSend(v26, "_mt_setValue:forFilterOfType:valueKey:filterOrder:removingIfIdentity:", v25, v14, v24, v37, a6);

    }
    else
    {
      v27 = a1;
      v23 = a6;
      objc_msgSend(v27, "_mt_setValue:forFilterOfType:valueKey:filterOrder:removingIfIdentity:", 0, v14, 0, v37, a6);
    }

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v28 = v12;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKey:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_mt_setValue:forFilterOfType:valueKey:filterOrder:removingIfIdentity:", v34, v14, v33, v37, v23);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v30);
  }

}

- (void)_mt_setValue:()CoreMaterial forFilterOfType:valueKey:filterOrder:removingIfIdentity:
{
  id v12;
  id v13;
  id v14;
  int IsIdentityProperty;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  char v23;
  id v24;

  v24 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  IsIdentityProperty = _IsIdentityProperty(v12, v13);
  if (v24)
  {
    if ((a7 & IsIdentityProperty) != 1)
      goto LABEL_8;
  }
  else
  {
    v16 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CD2B88]);
    if ((v16 & a7 & IsIdentityProperty & 1) == 0)
    {
      if (!v16)
        goto LABEL_6;
      goto LABEL_8;
    }
  }
  if (_IsValueIdentity(v24, v12, v13))
  {
LABEL_6:
    objc_msgSend(a1, "_mt_removeFilterOfTypeIfNecessary:", v12);
    goto LABEL_18;
  }
LABEL_8:
  if (IsIdentityProperty)
    objc_msgSend(a1, "_mt_configureFilterOfType:ifNecessaryWithFilterOrder:", v12, v14);
  MTFilterKeyPathForFilter(v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingFormat:", CFSTR(".%@"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKeyPath:", v17);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_msgSend(a1, "valueForKeyPath:", v18);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v24;
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v23 = objc_msgSend(v21, "isEqual:", v22);
    else
      v23 = v21 == v22;

    if ((v23 & 1) == 0)
      objc_msgSend(a1, "setValue:forKeyPath:", v22, v18);
  }

LABEL_18:
}

+ (id)mt_orderedFilterTypes
{
  if (mt_orderedFilterTypes_onceToken != -1)
    dispatch_once(&mt_orderedFilterTypes_onceToken, &__block_literal_global_0);
  return (id)mt_orderedFilterTypes___sortedFilterTypes;
}

- (void)_mt_configureFilterOfType:()CoreMaterial ifNecessaryWithFilterOrder:
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  MTFilterKeyPathForFilter(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(a1, "_mt_configureFilterOfType:ifNecessaryWithName:andFilterOrder:", v9, 0, v6);

}

- (void)_mt_configureFilterOfType:()CoreMaterial ifNecessaryWithName:andFilterOrder:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
    v10 = v8;
  else
    v10 = v20;
  MTFilterKeyPathForFilter(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKeyPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(a1, "filters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = v16;

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v8)
      objc_msgSend(v18, "setName:", v8);
    objc_msgSend(v17, "addObject:", v12, v20);
    v19 = objc_msgSend(v17, "count");
    if (v9 && v19 >= 2)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __94__CABackdropLayer_CoreMaterial___mt_configureFilterOfType_ifNecessaryWithName_andFilterOrder___block_invoke;
      v21[3] = &unk_1E58790A8;
      v22 = v9;
      objc_msgSend(v17, "sortUsingComparator:", v21);

    }
    objc_msgSend(a1, "setFilters:", v17);

  }
}

- (void)_mt_removeFilterOfType:()CoreMaterial ifNecessaryWithName:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(a1, "filters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v6)
    v9 = v6;
  else
    v9 = v12;
  MTFilterKeyPathForFilter(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKeyPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v11);

  objc_msgSend(a1, "setFilters:", v8);
}

- (uint64_t)mt_setColorMatrixDrivenOpacity:()CoreMaterial removingIfIdentity:
{
  void *v7;
  _OWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v7 = (void *)objc_opt_class();
  if (v7)
  {
    objc_msgSend(v7, "mt_colorMatrixForOpacity:", a2);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  objc_msgSend(a1, "_mt_removeFilterOfType:ifNecessaryWithName:", *MEMORY[0x1E0CD2BF0], CFSTR("opacityColorMatrix"));
  v9[2] = v12;
  v9[3] = v13;
  v9[4] = v14;
  v9[0] = v10;
  v9[1] = v11;
  return objc_msgSend(a1, "_mt_setColorMatrix:withName:filterOrder:removingIfIdentity:", v9, CFSTR("opacityColorMatrix"), 0, a4);
}

- (void)_mt_setColorMatrix:()CoreMaterial withName:filterOrder:removingIfIdentity:
{
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _OWORD v19[5];

  v10 = a4;
  v11 = a5;
  v12 = a3[3];
  v19[2] = a3[2];
  v19[3] = v12;
  v19[4] = a3[4];
  v13 = a3[1];
  v19[0] = *a3;
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v19, "{CAColorMatrix=ffffffffffffffffffff}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = *MEMORY[0x1E0CD2BF0];
  if (a6 && _IsValueIdentity(v14, (void *)*MEMORY[0x1E0CD2BF0], CFSTR("inputColorMatrix")))
  {
    objc_msgSend(a1, "_mt_removeFilterOfType:ifNecessaryWithName:", v16, v10);
  }
  else
  {
    objc_msgSend(a1, "_mt_configureFilterOfType:ifNecessaryWithName:andFilterOrder:", v16, v10, v11);
    MTFilterKeyPathForFilter(v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputColorMatrix"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forKeyPath:", v15, v18);

  }
}

- (void)mt_applyMaterialDescription:()CoreMaterial removingIfIdentity:
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  id v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = MTLogMaterials;
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
  {
    v34 = CFSTR("not ");
    *(_DWORD *)buf = 138543874;
    v59 = a1;
    if ((_DWORD)a4)
      v34 = &stru_1E5879838;
    v60 = 2112;
    v61 = v34;
    v62 = 2114;
    v63 = v6;
    _os_log_debug_impl(&dword_1AAB41000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: applying backdrop settings (%@removing if identity): %{public}@", buf, 0x20u);
  }
  objc_msgSend(a1, "filters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    v35 = CFSTR("type");
    v36 = *(_QWORD *)v52;
    v39 = a4;
    v37 = v10;
    v38 = v9;
    do
    {
      v14 = 0;
      v40 = v12;
      do
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v14);
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("filters"), v35))
        {
          objc_msgSend(v10, "objectForKey:", CFSTR("filters"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "valueForKey:", v35);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v18 = v16;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          obj = v18;
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v48 != v21)
                  objc_enumerationMutation(obj);
                objc_msgSend(a1, "_mt_applyFilterDescription:remainingExistingFilters:filterOrder:removingIfIdentity:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i), v9, v17, a4);
              }
              v18 = obj;
              v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
            }
            while (v20);
          }
          v41 = v14;

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v23 = v9;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v44 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
                objc_msgSend(v28, "name");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v29, "isEqualToString:", CFSTR("opacityColorMatrix")) & 1) == 0)
                {
                  objc_msgSend(v28, "name");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("inoperativeColorMatrix"));

                  if ((v31 & 1) != 0)
                    continue;
                  objc_msgSend(v28, "type");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "name");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "_mt_removeFilterOfType:ifNecessaryWithName:", v29, v32);

                }
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
            }
            while (v25);
          }

          a4 = v39;
          v10 = v37;
          v9 = v38;
          v13 = v36;
          v12 = v40;
          v14 = v41;
          v33 = obj;
        }
        else
        {
          objc_msgSend(v10, "objectForKey:", v15);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setValue:forKey:", v33, v15);
        }

        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v12);
  }

}

+ (id)mt_orderedFilterTypesBlurAtEnd
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CABackdropLayer_CoreMaterial__mt_orderedFilterTypesBlurAtEnd__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mt_orderedFilterTypesBlurAtEnd_onceToken != -1)
    dispatch_once(&mt_orderedFilterTypesBlurAtEnd_onceToken, block);
  return (id)mt_orderedFilterTypesBlurAtEnd___sortedFilterTypesBlurAtEnd;
}

- (double)mt_colorMatrixDrivenOpacity
{
  void *v2;
  void *v3;
  double v4;
  float v6;

  objc_msgSend((id)objc_opt_class(), "mt_keyPathForColorMatrixDrivenOpacity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKeyPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "CAColorMatrixValue");
    v4 = v6;
  }
  else
  {
    v4 = 1.0;
  }

  return v4;
}

- (double)mt_colorMatrixDrivenInoperativeOpacity
{
  void *v2;
  void *v3;
  double v4;
  float v6;

  objc_msgSend((id)objc_opt_class(), "mt_keyPathForColorMatrixDrivenInoperativeOpacity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKeyPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "CAColorMatrixValue");
    v4 = v6;
  }
  else
  {
    v4 = 1.0;
  }

  return v4;
}

- (uint64_t)mt_setColorMatrixDrivenInoperativeOpacity:()CoreMaterial removingIfIdentity:
{
  void *v7;
  _OWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v7 = (void *)objc_opt_class();
  if (v7)
  {
    objc_msgSend(v7, "mt_colorMatrixForOpacity:", a2);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  objc_msgSend(a1, "_mt_removeFilterOfType:ifNecessaryWithName:", *MEMORY[0x1E0CD2BF0], CFSTR("inoperativeColorMatrix"));
  v9[2] = v12;
  v9[3] = v13;
  v9[4] = v14;
  v9[0] = v10;
  v9[1] = v11;
  return objc_msgSend(a1, "_mt_setColorMatrix:withName:filterOrder:removingIfIdentity:", v9, CFSTR("inoperativeColorMatrix"), 0, a4);
}

- (uint64_t)_mt_removeFilterOfTypeIfNecessary:()CoreMaterial
{
  return objc_msgSend(a1, "_mt_removeFilterOfType:ifNecessaryWithName:", a3, 0);
}

@end
