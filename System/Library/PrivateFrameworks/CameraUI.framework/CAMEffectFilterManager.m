@implementation CAMEffectFilterManager

+ (id)filtersForFilterType:(int64_t)a3 lightingType:(int64_t)a4 applyDepthEffect:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
    objc_msgSend(v9, "addObject:", CFSTR("CIDepthEffect"));
  objc_msgSend(a1, "ciFilterNameForFilterType:lightingType:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v10, "addObject:", v11);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16;
  v25 = __Block_byref_object_dispose__16;
  v26 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __77__CAMEffectFilterManager_filtersForFilterType_lightingType_applyDepthEffect___block_invoke;
  v18 = &unk_1EA32DAE0;
  v20 = &v21;
  v12 = v10;
  v19 = v12;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v15);
  v13 = (void *)objc_msgSend((id)v22[5], "copy", v15, v16, v17, v18);

  _Block_object_dispose(&v21, 8);
  return v13;
}

+ (id)ciFilterNameForFilterType:(int64_t)a3 lightingType:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportedPortraitLightingVersion");

  objc_msgSend(MEMORY[0x1E0D0D078], "ciFilterNameForLightingType:version:", a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(a1, "ciFilterNameForFilterType:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (id)ciFilterNameForFilterType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
    return 0;
  else
    return off_1EA32DB28[a3 - 1];
}

void __77__CAMEffectFilterManager_filtersForFilterType_lightingType_applyDepthEffect___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v4, "addObject:", v8);
    v3 = v8;
  }

}

+ (BOOL)areFilters:(id)a3 equalTo:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    +[CAMEffectFilterManager namesFromFilters:](CAMEffectFilterManager, "namesFromFilters:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMEffectFilterManager namesFromFilters:](CAMEffectFilterManager, "namesFromFilters:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToArray:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)namesFromFilters:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__CAMEffectFilterManager_namesFromFilters___block_invoke;
  v8[3] = &unk_1EA32DB08;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __43__CAMEffectFilterManager_namesFromFilters___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)displayNameForType:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  __CFString *v5;

  switch(a3)
  {
    case 0:
      v3 = CFSTR("FILTER_NONE");
      goto LABEL_21;
    case 1:
      v3 = CFSTR("FILTER_MONO");
      goto LABEL_21;
    case 2:
      v3 = CFSTR("FILTER_TONAL");
      goto LABEL_21;
    case 3:
      v3 = CFSTR("FILTER_NOIR");
      v5 = CFSTR("We understand 'Noir' may be hard to localize for your language. If that's the case, we'd prefer to use the EN string.");
      goto LABEL_22;
    case 4:
      v3 = CFSTR("FILTER_FADE");
      goto LABEL_21;
    case 5:
      v3 = CFSTR("FILTER_CHROME");
      goto LABEL_21;
    case 6:
      v3 = CFSTR("FILTER_PROCESS");
      goto LABEL_21;
    case 7:
      v3 = CFSTR("FILTER_TRANSFER");
      goto LABEL_21;
    case 8:
      v3 = CFSTR("FILTER_INSTANT");
      goto LABEL_21;
    case 9:
      v3 = CFSTR("FILTER_VIVID");
      goto LABEL_21;
    case 10:
      v3 = CFSTR("FILTER_VIVID_WARM");
      goto LABEL_21;
    case 11:
      v3 = CFSTR("FILTER_VIVID_COOL");
      goto LABEL_21;
    case 12:
      v3 = CFSTR("FILTER_DRAMATIC");
      goto LABEL_21;
    case 13:
      v3 = CFSTR("FILTER_DRAMATIC_WARM");
      goto LABEL_21;
    case 14:
      v3 = CFSTR("FILTER_DRAMATIC_COOL");
      goto LABEL_21;
    case 15:
      v3 = CFSTR("FILTER_SILVERPLATE");
      goto LABEL_21;
    case 16:
      v3 = CFSTR("FILTER_PORTRAIT");
LABEL_21:
      v5 = 0;
LABEL_22:
      CAMLocalizedFrameworkString(v3, v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

+ (BOOL)isDepthEffectInFilters:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "name", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("CIDepthEffect"));

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)isLightingEffectInFilters:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = (void *)MEMORY[0x1E0D0D078];
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "name", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "ciLightingTypeForFilterName:", v8);

        if ((unint64_t)(v9 - 7) > 0xFFFFFFFFFFFFFFFALL)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

@end
