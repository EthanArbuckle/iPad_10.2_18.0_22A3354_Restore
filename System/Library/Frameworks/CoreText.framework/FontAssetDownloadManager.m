@implementation FontAssetDownloadManager

+ (void)availableMobileAssetsWithOptions:(uint64_t *)a3 error:
{
  double v5;
  uint64_t v6;
  double v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  id v14;
  dispatch_time_t v15;
  id v16;
  id AssociatedObject;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  unint64_t v30;
  id v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  uint64_t k;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[6];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  gotLoadHelper_x8__OBJC_CLASS___MAAsset(v5);
  v6 = objc_opt_class();
  if (!v6)
    return 0;
  v8 = (uint64_t *)MEMORY[0x1E0D22410];
  if ((a2 & 1) == 0)
  {
    v9 = *MEMORY[0x1E0D22410];
    goto LABEL_14;
  }
  v10 = (void *)v6;
  v11 = dispatch_semaphore_create(0);
  dispatch_retain(v11);
  gotLoadHelper_x8__OBJC_CLASS___MADownloadOptions(v12);
  v14 = objc_alloc_init(*(Class *)(v13 + 144));
  objc_msgSend(v14, "setTimeoutIntervalForResource:", 30);
  objc_msgSend(v14, "setDiscretionary:", 0);
  if ((a2 & 4) != 0)
  {
    CFLog();
    objc_msgSend(v14, "setAllowsCellularAccess:", 1);
  }
  v9 = *v8;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __67__FontAssetDownloadManager_availableMobileAssetsWithOptions_error___block_invoke;
  v58[3] = &unk_1E15E89D0;
  v58[4] = v14;
  v58[5] = v11;
  objc_msgSend(v10, "startCatalogDownload:options:then:", v9, v14, v58);
  v15 = dispatch_time(0, 30000000000);
  if (!dispatch_semaphore_wait(v11, v15))
  {
    AssociatedObject = objc_getAssociatedObject(v14, (const void *)+[FontAssetDownloadManager availableMobileAssetsWithOptions:error:]::downloadErrorKey);
    if (!a3 || !AssociatedObject)
      goto LABEL_13;
    v16 = AssociatedObject;
    goto LABEL_12;
  }
  if (a3)
  {
    v16 = (id)+[FontAssetDownloadManager errorWithCode:description:]((uint64_t)FontAssetDownloadManager, 301, (uint64_t)CFSTR("Font asset catalog download failed."));
LABEL_12:
    *a3 = (uint64_t)v16;
  }
LABEL_13:

  dispatch_release(v11);
LABEL_14:
  gotLoadHelper_x8__OBJC_CLASS___MAAssetQuery(v7);
  v19 = (id)objc_msgSend(objc_alloc(*(Class *)(v18 + 88)), "initWithType:", v9);
  v20 = v19;
  if ((a2 & 2) != 0)
    v21 = 1;
  else
    v21 = 2;
  objc_msgSend(v19, "returnTypes:", v21);
  objc_msgSend(v20, "setDoNotBlockBeforeFirstUnlock:", 1);
  objc_msgSend(v20, "setDoNotBlockOnNetworkStatus:", 1);
  if (objc_msgSend(v20, "queryMetaDataSync") == 2)
  {
    if (a3)
    {
      v50 = 0;
      *a3 = +[FontAssetDownloadManager errorWithCode:description:]((uint64_t)FontAssetDownloadManager, 303, (uint64_t)CFSTR("Font asset catalog has not been downloaded."));
      return v50;
    }
    return 0;
  }
  v22 = 0x1E0C99000uLL;
  if ((a2 & 2) != 0)
  {
    v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v24 = (void *)objc_msgSend(v20, "results");
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v55 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_opt_self();
          v30 = objc_msgSend(v29, "state");
          if (v30 <= 6 && ((1 << v30) & 0x6C) != 0)
            objc_msgSend(v23, "addObject:", v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
      }
      while (v26);
    }
  }
  else
  {
    v23 = (id)objc_msgSend(v20, "results");
  }
  v32 = v23;
  objc_opt_self();
  v33 = FSGetMaxSupportedFontAssetCompatibilityVersion();
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v68 != v36)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "attributes"), "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion")), "unsignedIntValue") <= v33)objc_msgSend(obj, "addObject:", v38);
      }
      v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v35);
  }
  objc_msgSend(obj, "sortUsingComparator:", &__block_literal_global_52);
  v50 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v52)
  {
    v51 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v52; ++k)
      {
        if (*(_QWORD *)v64 != v51)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
        v42 = (void *)objc_msgSend((id)objc_msgSend(v41, "attributes"), "objectForKey:", CFSTR("FontInfo4"));
        v43 = (void *)objc_msgSend(*(id *)(v22 + 3560), "array");
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v60;
LABEL_51:
          v47 = 0;
          while (1)
          {
            if (*(_QWORD *)v60 != v46)
              objc_enumerationMutation(v42);
            v48 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v47), "objectForKey:", CFSTR("PostScriptFontName"));
            objc_msgSend(v43, "addObject:", v48);
            if ((objc_msgSend(v39, "containsObject:", v48) & 1) != 0)
              break;
            if (v45 == ++v47)
            {
              v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
              if (v45)
                goto LABEL_51;
              goto LABEL_57;
            }
          }
        }
        else
        {
LABEL_57:
          objc_msgSend(v39, "addObjectsFromArray:", v43);
          objc_msgSend(v50, "addObject:", v41);
        }
        v22 = 0x1E0C99000;
      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    }
    while (v52);
  }
  return v50;
}

+ (uint64_t)fontInfo:(uint64_t)a3 andAssetDesignLanguages:(void *)a4 matchesRequest:
{
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  objc_opt_self();
  v7 = (NSString *)objc_msgSend(a4, "objectForKey:", CFSTR("NSFontFamilyAttribute"));
  v8 = objc_msgSend(a4, "objectForKey:", CFSTR("NSFontNameAttribute"));
  v9 = -[NSDictionary objectForKey:](a2, "objectForKey:", CFSTR("PostScriptFontNameAliases"));
  if (!v8
    || (v10 = (void *)v9, (v11 = -[NSDictionary objectForKey:](a2, "objectForKey:", CFSTR("PostScriptFontName"))) == 0)
    || (objc_msgSend(v11, "isEqualToString:", v8) & 1) != 0
    || (result = objc_msgSend(v10, "containsObject:", v8), (_DWORD)result))
  {
    v13 = objc_msgSend(a4, "objectForKey:", CFSTR("NSCTFontPostScriptNameAttribute"));
    if (!v13
      || (v14 = v13, (v15 = -[NSDictionary objectForKey:](a2, "objectForKey:", CFSTR("PostScriptFontName"))) == 0)
      || (result = objc_msgSend(v15, "isEqualToString:", v14), (_DWORD)result))
    {
      if (DictHasUnmatchedNames(a2, CFSTR("FontFamilyName"), CFSTR("PreferredFamilyName"), v7)
        || DictHasUnmatchedNames(a2, CFSTR("FontStyleName"), CFSTR("PreferredStyleName"), (NSString *)objc_msgSend(a4, "objectForKey:", CFSTR("NSFontFaceAttribute"))))
      {
        return 0;
      }
      v16 = objc_msgSend(a4, "objectForKey:", CFSTR("NSFontVisibleNameAttribute"));
      if (!v16)
        goto LABEL_29;
      v17 = (void *)v16;
      CopyValueForCurrentUser((const __CFDictionary *)-[NSDictionary objectForKey:](a2, "objectForKey:", CFSTR("DisplayNames")), 0, (unint64_t *)&v24);
      v18 = atomic_load((unint64_t *)&v24);

      if (!v18)
        return 0;
      result = objc_msgSend(v17, "isEqualToString:", v18);
      if ((_DWORD)result)
      {
LABEL_29:
        if (objc_msgSend(a4, "objectForKey:", CFSTR("NSCTFontDesignLanguagesAttribute")))
          v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
        else
          v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v20 = v19;
        if (!objc_msgSend(v19, "count"))
          return 1;
        v21 = -[NSDictionary objectForKey:](a2, "objectForKey:", CFSTR("FontDesignLanguages"));
        v22 = v21 ? v21 : a3;
        v23 = v22 ? objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:") : objc_msgSend(MEMORY[0x1E0C99E60], "set");
        result = objc_msgSend(v20, "isSubsetOfSet:", v23);
        if ((_DWORD)result)
          return 1;
      }
    }
  }
  return result;
}

- (BOOL)callProgressCallback:(uint64_t)a1
{
  _BOOL8 v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (!a1)
    return 0;
  if (_MergedGlobals_35 != -1)
    dispatch_once(&_MergedGlobals_35, &__block_literal_global_10);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__FontAssetDownloadManager_callProgressCallback___block_invoke_2;
  block[3] = &unk_1E15E8968;
  block[4] = a1;
  block[5] = &v8;
  v7 = a2;
  dispatch_sync((dispatch_queue_t)qword_1ECDE7E30, block);
  v4 = *((_BYTE *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v4;
}

+ (void)availableMobileAssetsWithOptions:(uint64_t)a3 manager:(uint64_t *)a4 error:
{
  void *v7;
  uint64_t v8;
  double Current;
  char v11;

  objc_opt_self();
  if ((a2 & 1) != 0)
    -[FontAssetDownloadManager callProgressCallback:](a3, 2);
  v7 = +[FontAssetDownloadManager availableMobileAssetsWithOptions:error:]((uint64_t)FontAssetDownloadManager, a2, a4);
  v8 = objc_msgSend(v7, "count");
  if (!a4 || v8 || objc_msgSend((id)*a4, "code") != 303)
    return v7;
  if ((a2 & 1) != 0)
  {
    v11 = a2 & 0xFE;
    if ((v11 & 1) == 0)
      return +[FontAssetDownloadManager availableMobileAssetsWithOptions:error:]((uint64_t)FontAssetDownloadManager, v11, a4);
LABEL_10:
    -[FontAssetDownloadManager callProgressCallback:](a3, 2);
    return +[FontAssetDownloadManager availableMobileAssetsWithOptions:error:]((uint64_t)FontAssetDownloadManager, v11, a4);
  }
  objc_opt_self();
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&+[FontAssetDownloadManager shouldRetryWithServer]::lastTime < 30.0)
    return v7;
  +[FontAssetDownloadManager shouldRetryWithServer]::lastTime = *(_QWORD *)&Current;
  v11 = a2 | 1;
  if ((v11 & 1) != 0)
    goto LABEL_10;
  return +[FontAssetDownloadManager availableMobileAssetsWithOptions:error:]((uint64_t)FontAssetDownloadManager, v11, a4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

uint64_t __54__FontAssetDownloadManager_activateFontsFromAssetURL___block_invoke()
{
  return 1;
}

uint64_t __49__FontAssetDownloadManager_callProgressCallback___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

dispatch_queue_t __49__FontAssetDownloadManager_callProgressCallback___block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.CoreText.progressCallback", 0);
  qword_1ECDE7E30 = (uint64_t)result;
  return result;
}

- (void).cxx_destruct
{

}

- (void)dealloc
{
  unint64_t *p_fDescriptors;
  void *v4;
  unint64_t *p_fMandatoryAttributes;
  void *v6;
  objc_super v7;

  p_fDescriptors = (unint64_t *)&self->fDescriptors;
  do
    v4 = (void *)__ldaxr(p_fDescriptors);
  while (__stlxr(0, p_fDescriptors));

  p_fMandatoryAttributes = (unint64_t *)&self->fMandatoryAttributes;
  do
    v6 = (void *)__ldaxr(p_fMandatoryAttributes);
  while (__stlxr(0, p_fMandatoryAttributes));

  _Block_release(self->fProgressCallbackBlock);
  v7.receiver = self;
  v7.super_class = (Class)FontAssetDownloadManager;
  -[FontAssetDownloadManager dealloc](&v7, sel_dealloc);
}

+ (uint64_t)errorWithCode:(uint64_t)a3 description:
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreText"));
  v6 = objc_msgSend(v5, "localizedStringForKey:value:table:", a3, &stru_1E15EDAC0, 0);
  if (IsWAPIComplianceRequired())
    v7 = CFSTR("Check WLAN connection and try again later.");
  else
    v7 = CFSTR("Check Wi-Fi connection and try again later.");
  v8 = objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E15EDAC0, 0);
  v9 = *MEMORY[0x1E0CB2D68];
  v12[0] = *MEMORY[0x1E0CB2D50];
  v12[1] = v9;
  v13[0] = v6;
  v13[1] = v8;
  v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreText.CTFontManagerErrorDomain"), a2, v10);
}

uint64_t __52__FontAssetDownloadManager_filterIncompatibleAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  int v6;
  int v7;

  v4 = (void *)objc_msgSend(a2, "attributes");
  v5 = (void *)objc_msgSend(a3, "attributes");
  v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion")), "intValue");
  v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion")), "intValue");
  if (v6 > v7)
    return -1;
  if (v6 < v7)
    return 1;
  return objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__RelativePath")), "compare:", objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("__RelativePath")));
}

void __67__FontAssetDownloadManager_availableMobileAssetsWithOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  const void *v4;
  void *v5;

  if (a2)
  {
    NSLog(CFSTR("CoreText: FontAsset catalog update failed: %ld"), a2);
    v3 = *(void **)(a1 + 32);
    v4 = (const void *)+[FontAssetDownloadManager availableMobileAssetsWithOptions:error:]::downloadErrorKey;
    v5 = (void *)+[FontAssetDownloadManager errorWithCode:description:]((uint64_t)FontAssetDownloadManager, 301, (uint64_t)CFSTR("Font asset catalog download failed."));
    objc_setAssociatedObject(v3, v4, v5, (void *)0x301);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

intptr_t __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_3;
  v3[3] = &unk_1E15E8A20;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "cancelDownload:", v3);
}

uint64_t __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_4(uint64_t a1)
{
  id Weak;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  BOOL v6;

  Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    v3 = (uint64_t)Weak;
    v4 = objc_loadWeak((id *)(a1 + 48));
    if (v4)
    {
      v5 = v4;
      dispatch_suspend(v4);
      v6 = -[FontAssetDownloadManager callProgressCallback:](v3, 3);
      dispatch_resume(v5);
      if (!v6)
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
}

void __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_5(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  id v13[2];
  __int128 v14;
  uint64_t v15;
  int v16;

  if (objc_msgSend(a2, "totalExpected") < 1)
  {
    v5 = 0.0;
  }
  else
  {
    v4 = (double)objc_msgSend(a2, "totalWritten");
    v5 = v4 / (double)objc_msgSend(a2, "totalExpected");
  }
  objc_msgSend(a2, "expectedTimeRemaining");
  v7 = v6;
  if (qword_1ECDE7E38 != -1)
    dispatch_once(&qword_1ECDE7E38, &__block_literal_global_129);
  v8 = qword_1ECDE7E40;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_6;
  block[3] = &unk_1E15E8A98;
  objc_copyWeak(v13, (id *)(a1 + 64));
  block[4] = a2;
  v9 = *(_OWORD *)(a1 + 48);
  v11 = *(_OWORD *)(a1 + 32);
  v12 = v9;
  v13[1] = *(id *)&v5;
  v16 = *(_DWORD *)(a1 + 88);
  v14 = *(_OWORD *)(a1 + 72);
  v15 = v7;
  dispatch_sync(v8, block);
  objc_destroyWeak(v13);
}

void __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_6(uint64_t a1)
{
  NSObject *Weak;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  BOOL v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;
  BOOL v27;
  dispatch_time_t v28;

  Weak = objc_loadWeak((id *)(a1 + 72));
  v3 = Weak;
  if (Weak)
    dispatch_suspend(Weak);
  v4 = objc_msgSend(*(id *)(a1 + 32), "isStalled");
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v6 = +[FontAssetDownloadManager errorWithCode:description:]((uint64_t)FontAssetDownloadManager, 302, (uint64_t)CFSTR("Font Download failed."));
      v7 = *(void **)(v5 + 32);
      if (v6)
        objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("CTFontDescriptorMatchingError"));
      else
        objc_msgSend(v7, "removeObjectForKey:", CFSTR("CTFontDescriptorMatchingError"));
      v8 = -[FontAssetDownloadManager callProgressCallback:](v5, 8);
      objc_msgSend(*(id *)(v5 + 32), "removeObjectForKey:", CFSTR("CTFontDescriptorMatchingError"));
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v10 = v8 && *(_BYTE *)(v9 + 24) != 0;
    }
    else
    {
      v10 = 0;
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    }
    *(_BYTE *)(v9 + 24) = v10;
  }
  if (*(double *)(a1 + 80) >= 0.0)
    v11 = *(double *)(a1 + 80);
  else
    v11 = 0.0;
  if (v11 >= 0.0)
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "totalWritten") + *(_QWORD *)(a1 + 88));
    if (v12)
    {
      v14 = v13;
      v15 = *(void **)(v12 + 32);
      if (v14)
        objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("CTFontDescriptorMatchingTotalDownloadedSize"));
      else
        objc_msgSend(v15, "removeObjectForKey:", CFSTR("CTFontDescriptorMatchingTotalDownloadedSize"));
    }
  }
  v16 = *(_QWORD *)(a1 + 40);
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)((v11 + (double)*(int *)(a1 + 112)) / (double)*(unint64_t *)(a1 + 96) * 100.0));
  if (v16)
  {
    v18 = v17;
    v19 = *(void **)(v16 + 32);
    if (v18)
      objc_msgSend(v19, "setObject:forKey:", v18, CFSTR("CTFontDescriptorMatchingPercentage"));
    else
      objc_msgSend(v19, "removeObjectForKey:", CFSTR("CTFontDescriptorMatchingPercentage"));
  }
  if (v4)
    v20 = 3;
  else
    v20 = 5;
  v21 = *(_QWORD *)(a1 + 40);
  v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 104));
  if (v21)
  {
    v23 = v22;
    v24 = *(void **)(v21 + 32);
    if (v23)
      objc_msgSend(v24, "setObject:forKey:", v23, CFSTR("CTFontDescriptorMatchingEstimatedSecondsRemaining"));
    else
      objc_msgSend(v24, "removeObjectForKey:", CFSTR("CTFontDescriptorMatchingEstimatedSecondsRemaining"));
  }
  v25 = -[FontAssetDownloadManager callProgressCallback:](*(_QWORD *)(a1 + 40), v20);
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v27 = v25 && *(_BYTE *)(v26 + 24) != 0;
  *(_BYTE *)(v26 + 24) = v27;
  if (v3)
  {
    v28 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v3, v28, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
    dispatch_resume(v3);
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __57__FontAssetDownloadManager_executeDownloadingFontAssets___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
