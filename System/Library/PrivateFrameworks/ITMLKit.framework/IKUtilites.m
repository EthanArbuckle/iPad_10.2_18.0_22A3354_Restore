@implementation IKUtilites

+ (id)sort:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = a4;
  objc_msgSend(MEMORY[0x1E0CEA728], "currentCollation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v5;
  objc_msgSend((id)objc_opt_class(), "_entriesBySectionIndexForArrayOfStringEntries:currentCollation:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  IKRequiredVisibilitySetForLocalizedIndexedCollation();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (v13 && objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "count"))
        {
          objc_msgSend(v6, "sectionTitles");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndex:", v10 + i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "sectionIndexTitles");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndex:", v10 + i);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("systemBucketID-%@"), v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v19, "setObject:forKey:", v15, CFSTR("sectionTitle"));
          objc_msgSend(v19, "setObject:forKey:", v17, CFSTR("sectionIndexTitle"));
          objc_msgSend(v19, "setObject:forKey:", v18, CFSTR("indexBarEntryID"));
          objc_msgSend(v19, "setObject:forKey:", v13, CFSTR("values"));
          if (objc_msgSend(v30, "containsObject:", v17))
            objc_msgSend(v19, "setObject:forKey:", CFSTR("required"), CFSTR("visibility"));
          objc_msgSend(v31, "addObject:", v19);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v10 += i;
    }
    while (v9);
  }

  if (!v28)
  {
    v25 = (void *)objc_opt_class();
    v21 = v31;
LABEL_19:
    objc_msgSend(v25, "_arrayByAddingValuesFromArrayOfDictionaries:", v21);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_msgSend(v28, "objectForKey:", CFSTR("bucket"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v31;
  if (v20)
  {
    objc_msgSend(v28, "objectForKey:", CFSTR("bucket"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    if ((v23 & 1) == 0)
    {
      v25 = (void *)objc_opt_class();
      goto LABEL_19;
    }
  }
  v24 = v31;
LABEL_20:
  v26 = v24;

  return v26;
}

+ (BOOL)runningAnInternalBuild
{
  if (!+[IKAppContext isInFactoryMode](IKAppContext, "isInFactoryMode")
    && runningAnInternalBuild_onceToken != -1)
  {
    dispatch_once(&runningAnInternalBuild_onceToken, &__block_literal_global_23);
  }
  return runningAnInternalBuild_internalBuild;
}

void __36__IKUtilites_runningAnInternalBuild__block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;

  runningAnInternalBuild_internalBuild = 0;
  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID())
      runningAnInternalBuild_internalBuild = CFBooleanGetValue(v1) != 0;
    CFRelease(v1);
  }
}

+ (BOOL)isAppleTV
{
  if (isAppleTV_sOnce != -1)
    dispatch_once(&isAppleTV_sOnce, &__block_literal_global_25);
  return isAppleTV_sIsAppleTV;
}

uint64_t __23__IKUtilites_isAppleTV__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  isAppleTV_sIsAppleTV = (_DWORD)result == 4;
  return result;
}

+ (BOOL)isAppTrusted
{
  __SecTask *v2;
  __SecTask *v3;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  CFTypeID v6;
  BOOL v7;

  if (+[IKAppContext isInFactoryMode](IKAppContext, "isInFactoryMode"))
    return 0;
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v2, CFSTR("com.apple.itunesstored.private"), 0);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

+ (id)_entriesBySectionIndexForArrayOfStringEntries:(id)a3 currentCollation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t j;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "sectionIndexTitles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
  if (v8 >= 1)
  {
    v10 = v8;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

      --v10;
    }
    while (v10);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "sectionForObject:collationStringSelector:", v17, sel_self, (_QWORD)v23));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  if (v8)
  {
    for (j = 0; j != v8; ++j)
    {
      objc_msgSend(v9, "objectAtIndex:", j, (_QWORD)v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sortedArrayFromArray:collationStringSelector:", v20, sel_self);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "replaceObjectAtIndex:withObject:", j, v21);

    }
  }

  return v9;
}

+ (id)_arrayByAddingValuesFromArrayOfDictionaries:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "objectForKey:", CFSTR("values"), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

@end
