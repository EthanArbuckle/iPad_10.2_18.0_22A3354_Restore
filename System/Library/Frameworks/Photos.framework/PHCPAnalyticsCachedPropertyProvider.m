@implementation PHCPAnalyticsCachedPropertyProvider

- (PHCPAnalyticsCachedPropertyProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCPAnalyticsCachedPropertyProvider.m"), 51, CFSTR("%s is not available as initializer"), "-[PHCPAnalyticsCachedPropertyProvider init]");

  abort();
}

- (PHCPAnalyticsCachedPropertyProvider)initWithPhotoLibrary:(id)a3
{
  id v4;
  PHCPAnalyticsCachedPropertyProvider *v5;
  PHCPAnalyticsCachedPropertyProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHCPAnalyticsCachedPropertyProvider;
  v5 = -[PHCPAnalyticsCachedPropertyProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_photoLibrary, v4);

  return v6;
}

- (void)registerSystemProperties:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PHCPAnalyticsCachedPropertyProvider *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  v58 = a3;
  v41 = self;
  -[PHCPAnalyticsCachedPropertyProvider _cachedProperties](self, "_cachedProperties");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", *MEMORY[0x1E0D09690]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D098C8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D098C8]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = *MEMORY[0x1E0D098D8];
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = *MEMORY[0x1E0D09880];
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = *MEMORY[0x1E0D098A8];
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = *MEMORY[0x1E0D098B8];
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *MEMORY[0x1E0D098D0];
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D09888];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D09888]);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D098A0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D098A0]);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D09898];
  v53 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D09898]);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addProperty:withValue:", v5, v55);
  objc_msgSend(v58, "addProperty:withValue:", v51, v6);
  objc_msgSend(v58, "addProperty:withValue:", v49, v54);
  objc_msgSend(v58, "addProperty:withValue:", v47, v56);
  objc_msgSend(v58, "addProperty:withValue:", v45, v57);
  v50 = (void *)v7;
  objc_msgSend(v58, "addProperty:withValue:", v43, v7);
  v48 = (void *)v9;
  objc_msgSend(v58, "addProperty:withValue:", v8, v9);
  v46 = (void *)v11;
  objc_msgSend(v58, "addProperty:withValue:", v10, v11);
  v44 = (void *)v13;
  objc_msgSend(v58, "addProperty:withValue:", v12, v13);
  if (v54)
  {
    -[PHCPAnalyticsCachedPropertyProvider _librarySizeRange:](v41, "_librarySizeRange:", objc_msgSend(v54, "integerValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addProperty:withValue:", *MEMORY[0x1E0D09890], v14);

  }
  if (v56)
  {
    objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForInteger:bucketLimits:", objc_msgSend(v56, "integerValue"), 0, 100, 250, 500, 1000, 2000, 4000, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addProperty:withValue:", *MEMORY[0x1E0D098B0], v15);

  }
  if (v57)
  {
    objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForInteger:bucketLimits:", objc_msgSend(v57, "integerValue"), 0, 2, 5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addProperty:withValue:", *MEMORY[0x1E0D098C0], v16);

  }
  v17 = *MEMORY[0x1E0D098E8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D098E8]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D098F0];
  objc_msgSend(v53, "objectForKeyedSubscript:", *MEMORY[0x1E0D098F0]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0D09900];
  objc_msgSend(v53, "objectForKeyedSubscript:", *MEMORY[0x1E0D09900]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0D09908];
  objc_msgSend(v53, "objectForKeyedSubscript:", *MEMORY[0x1E0D09908]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0D098F8];
  objc_msgSend(v53, "objectForKeyedSubscript:", *MEMORY[0x1E0D098F8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addProperty:withValue:", v17, v42);
  objc_msgSend(v58, "addProperty:withValue:", v18, v40);
  objc_msgSend(v58, "addProperty:withValue:", v19, v39);
  objc_msgSend(v58, "addProperty:withValue:", v20, v38);
  objc_msgSend(v58, "addProperty:withValue:", v21, v22);
  v23 = *MEMORY[0x1E0D098E0];
  objc_msgSend(v53, "objectForKeyedSubscript:", *MEMORY[0x1E0D098E0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addProperty:withValue:", v23, v24);
  objc_msgSend(v52, "objectForKeyedSubscript:", *MEMORY[0x1E0D09680]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0D096A0];
  objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D096A0]);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (__CFString *)v27;
  else
    v29 = CFSTR("Unknown");
  v30 = v29;

  v31 = *MEMORY[0x1E0D09698];
  objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D09698]);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
    v34 = (__CFString *)v32;
  else
    v34 = CFSTR("Unknown");
  v35 = v34;

  objc_msgSend(v58, "addProperty:withValue:", v26, v30);
  objc_msgSend(v58, "addProperty:withValue:", v31, v35);

  v36 = *MEMORY[0x1E0D09810];
  objc_msgSend(v52, "objectForKeyedSubscript:", *MEMORY[0x1E0D09810]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addProperty:withValue:", v36, v37);

}

- (id)_cachedProperties
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v20;
  uint8_t buf[4];
  NSObject *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0D749E8], "UTF8String");
  v3 = (void *)xpc_copy_entitlement_for_self();
  objc_msgSend((id)*MEMORY[0x1E0D749F0], "UTF8String");
  v4 = xpc_copy_entitlement_for_self();
  v5 = (void *)v4;
  if (v3 == (void *)MEMORY[0x1E0C81240] || v4 == MEMORY[0x1E0C81240])
  {
    -[PHCPAnalyticsCachedPropertyProvider photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "urlForApplicationDataFolderIdentifier:", 9);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = *MEMORY[0x1E0D09870];
    -[NSObject URLByAppendingPathComponent:](v17, "URLByAppendingPathComponent:", *MEMORY[0x1E0D09870]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

      if ((v12 & 1) != 0)
      {
        v20 = 0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v9, &v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v20;
        if (v14)
        {
          CPAnalyticsLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v14;
            _os_log_error_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "CPAnalytics failed loading cache file. Error:%@", buf, 0xCu);
          }

          v16 = (id)MEMORY[0x1E0C9AA70];
        }
        else
        {
          v16 = v13;
        }

        goto LABEL_22;
      }
      CPAnalyticsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_INFO, "Cache file will be missing until the first nightly caching task is done. Log message instead of error", buf, 2u);
      }
    }
    else
    {
      CPAnalyticsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v8;
        v23 = 2112;
        v24 = v17;
        _os_log_error_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "Failed creating %@ url from baseUrl %@", buf, 0x16u);
      }
    }
    v16 = (id)MEMORY[0x1E0C9AA70];
LABEL_22:

    goto LABEL_23;
  }
  CPAnalyticsLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_INFO, "CPAnalytics Cache not entitled.", buf, 2u);
  }
  v16 = (id)MEMORY[0x1E0C9AA70];
LABEL_23:

  return v16;
}

- (id)_librarySizeRange:(int64_t)a3
{
  if (!a3)
    return CFSTR("LibrarySizeRangeEmpty");
  if (a3 < 501)
    return CFSTR("LibrarySizeRangeVerySmall");
  if ((unint64_t)a3 < 0x7D1)
    return CFSTR("LibrarySizeRangeSmall");
  if ((unint64_t)a3 < 0x1389)
    return CFSTR("LibrarySizeRangeMedium5K");
  if ((unint64_t)a3 < 0x2711)
    return CFSTR("LibrarySizeRangeMedium10K");
  if ((unint64_t)a3 < 0x7531)
    return CFSTR("LibrarySizeRangeLarge20K");
  if ((unint64_t)a3 < 0x9C41)
    return CFSTR("LibrarySizeRangeLarge30K");
  if ((unint64_t)a3 < 0xC351)
    return CFSTR("LibrarySizeRangeLarge40K");
  if ((unint64_t)a3 < 0x124F9)
    return CFSTR("LibrarySizeRangeLarge50K");
  if ((unint64_t)a3 >= 0x186A1)
    return CFSTR("LibrarySizeRangeHuge");
  return CFSTR("LibrarySizeRangeVeryLarge");
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
}

@end
