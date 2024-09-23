@implementation SecCoreAnalytics

+ (void)sendEvent:(id)a3 event:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v13 = xmmword_1E1FCDC48;
    v14 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v7 = v5;
    v8 = v6;
    *(_QWORD *)&v13 = 0;
    *((_QWORD *)&v13 + 1) = &v13;
    v14 = 0x2020000000;
    v9 = getAnalyticsSendEventSymbolLoc_ptr;
    v15 = getAnalyticsSendEventSymbolLoc_ptr;
    if (!getAnalyticsSendEventSymbolLoc_ptr)
    {
      v10 = CoreAnalyticsLibrary();
      v9 = dlsym(v10, "AnalyticsSendEvent");
      *(_QWORD *)(*((_QWORD *)&v13 + 1) + 24) = v9;
      getAnalyticsSendEventSymbolLoc_ptr = v9;
    }
    _Block_object_dispose(&v13, 8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_AnalyticsSendEvent(NSString *__strong, NSDictionary<NSString *,NSObject *> *__strong)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SecCoreAnalytics.m"), 198, CFSTR("%s"), dlerror());

      __break(1u);
    }
    ((void (*)(id, id))v9)(v7, v8);

  }
}

+ (void)sendEventLazy:(id)a3 builder:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v13 = xmmword_1E1FCDC48;
    v14 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v7 = v5;
    v8 = v6;
    *(_QWORD *)&v13 = 0;
    *((_QWORD *)&v13 + 1) = &v13;
    v14 = 0x2020000000;
    v9 = getAnalyticsSendEventLazySymbolLoc_ptr;
    v15 = getAnalyticsSendEventLazySymbolLoc_ptr;
    if (!getAnalyticsSendEventLazySymbolLoc_ptr)
    {
      v10 = CoreAnalyticsLibrary();
      v9 = dlsym(v10, "AnalyticsSendEventLazy");
      *(_QWORD *)(*((_QWORD *)&v13 + 1) + 24) = v9;
      getAnalyticsSendEventLazySymbolLoc_ptr = v9;
    }
    _Block_object_dispose(&v13, 8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_AnalyticsSendEventLazy(NSString *__strong, NSDictionary<NSString *,NSObject *> *(^__strong)(void))");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SecCoreAnalytics.m"), 200, CFSTR("%s"), dlerror());

      __break(1u);
    }
    ((void (*)(id, id))v9)(v7, v8);

  }
}

+ (id)appNameFromPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __CFBundle *v10;
  __CFBundle *v11;
  CFURLRef v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  const __CFURL *v19;
  CFDictionaryRef v20;
  uint64_t v21;
  int v22;
  id v23;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
LABEL_2:
    objc_msgSend(v4, "infoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("CFBundleVisibleComponentName"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("CFBundleDisplayName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("CFBundleName"));
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v7 = v15;

      goto LABEL_13;
    }
LABEL_3:
    v7 = v6;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
    v11 = v10;
    if (v10)
    {
      v12 = CFBundleCopyBundleURL(v10);

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v12);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
          goto LABEL_2;
        goto LABEL_20;
      }
      v9 = 0;
    }

  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
  v19 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  if (!v19)
  {
    v5 = 0;
    v7 = 0;
    goto LABEL_14;
  }
  v20 = CFBundleCopyInfoDictionaryForURL(v19);
  v5 = v20;
  if (v20)
  {
    -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("CFBundleVisibleComponentName"));
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21
      || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CFBundleDisplayName")),
          (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (id)v21;
      goto LABEL_14;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CFBundleName"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_14;
  }
  v23 = 0;
  v22 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v23, *MEMORY[0x1E0C99A90], 0);
  v6 = v23;
  v7 = 0;
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_13;
    }
    goto LABEL_3;
  }
LABEL_13:

LABEL_14:
  if (!v7 || objc_msgSend(&unk_1E1FFEE30, "indexOfObject:", v7) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByDeletingPathExtension");
    v17 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v17;
  }

  return v7;
}

@end
