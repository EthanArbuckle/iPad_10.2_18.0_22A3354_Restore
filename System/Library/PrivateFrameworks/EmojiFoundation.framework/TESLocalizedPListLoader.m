@implementation TESLocalizedPListLoader

- (TESLocalizedPListLoader)initWithLocaleIdentifier:(id)a3
{
  id v4;
  TESLocalizedPListLoader *v5;
  uint64_t v6;
  NSString *localeIdentifier;
  NSURL *plistPath;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TESLocalizedPListLoader;
  v5 = -[TESLocalizedPListLoader init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v6;

    plistPath = v5->_plistPath;
    v5->_plistPath = 0;

  }
  return v5;
}

- (id)plistPath
{
  NSURL *plistPath;
  NSURL *v4;
  NSURL *v5;

  plistPath = self->_plistPath;
  if (!plistPath)
  {
    -[TESLocalizedPListLoader _resolvePlistPath](self, "_resolvePlistPath");
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v5 = self->_plistPath;
    self->_plistPath = v4;

    plistPath = self->_plistPath;
  }
  return plistPath;
}

- (id)_resolvePlistPath
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  __int128 *p_buf;
  uint8_t v26[4];
  void *v27;
  __int16 v28;
  __CFString *v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[TESLocalizedPListLoader localeIdentifier](self, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  emf_logging_get_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[TESLocalizedPListLoader localeIdentifier](self, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B3DE1000, v5, OS_LOG_TYPE_INFO, "Loading Text Effects plist file for locale '%{public}@'", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  -[TESLocalizedPListLoader resourceName](self, "resourceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:subdirectory:localization:", v8, CFSTR("plist"), 0, v4);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "languageIdentifier");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("nb-NO")) & 1) != 0
      || -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("nn")))
    {

      v11 = CFSTR("no");
    }
    emf_logging_get_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[TESLocalizedPListLoader localeIdentifier](self, "localeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138543618;
      v27 = v13;
      v28 = 2114;
      v29 = v11;
      _os_log_impl(&dword_1B3DE1000, v12, OS_LOG_TYPE_INFO, "No Text Effects plist file found for locale identifier '%{public}@'; attempting to load data associated with the"
        " normalized locale identifier '%{public}@'.",
        v26,
        0x16u);

    }
    -[TESLocalizedPListLoader resourceName](self, "resourceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLForResource:withExtension:subdirectory:localization:", v14, CFSTR("plist"), 0, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v15;

    v9 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (!v9)
    {
      emf_logging_get_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        -[TESLocalizedPListLoader localeIdentifier](self, "localeIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v26 = 138543362;
        v27 = v18;
        _os_log_impl(&dword_1B3DE1000, v17, OS_LOG_TYPE_INFO, "No Text Effects plist found for locale identifier '%{public}@'; attempting to load a fallback language.",
          v26,
          0xCu);

      }
      v19 = (void *)MEMORY[0x1E0C99DC8];
      -[TESLocalizedPListLoader localeIdentifier](self, "localeIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __44__TESLocalizedPListLoader__resolvePlistPath__block_invoke;
      v23[3] = &unk_1E66F9EB0;
      v23[4] = self;
      p_buf = &buf;
      v24 = v7;
      objc_msgSend(v19, "_enumerateLanguageFallbackGraphForLocaleIdentifier:usingBlock:", v20, v23);

      v9 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    }
  }
  v21 = v9;
  _Block_object_dispose(&buf, 8);

  return v21;
}

void __44__TESLocalizedPListLoader__resolvePlistPath__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  if ((v7 & 1) == 0)
  {
    emf_logging_get_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = 138543362;
      v15 = v5;
      _os_log_impl(&dword_1B3DE1000, v8, OS_LOG_TYPE_INFO, "Loading Text Effects plist file for language fallback '%{public}@'", (uint8_t *)&v14, 0xCu);
    }

    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "resourceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLForResource:withExtension:subdirectory:localization:", v10, CFSTR("plist"), 0, v5);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      *a3 = 1;
  }

}

- (id)_loadItems
{
  void *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[TESLocalizedPListLoader plistPath](self, "plistPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v3, &v20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v20;
    if (v5)
      v6 = 1;
    else
      v6 = v4 == 0;
    if (v6 || !objc_msgSend(v4, "count"))
    {
      emf_logging_get_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "absoluteString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TESLocalizedPListLoader localeIdentifier](self, "localeIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject localizedDescription](v5, "localizedDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v17;
        v23 = 2114;
        v24 = v18;
        v25 = 2114;
        v26 = (uint64_t)v19;
        _os_log_error_impl(&dword_1B3DE1000, v8, OS_LOG_TYPE_ERROR, "Text Effects plist at path '%{public}@' for locale '%{public}@' could not be read with error: '%{public}@", buf, 0x20u);

      }
      v11 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("schemaVersion"));
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && -[NSObject unsignedLongValue](v9, "unsignedLongValue") == 1)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggers"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          emf_logging_get_default_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v3, "absoluteString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[TESLocalizedPListLoader localeIdentifier](self, "localeIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v11, "count");
            *(_DWORD *)buf = 138543874;
            v22 = v13;
            v23 = 2114;
            v24 = v14;
            v25 = 2048;
            v26 = v15;
            _os_log_impl(&dword_1B3DE1000, v12, OS_LOG_TYPE_INFO, "Loaded Text Effects plist '%{public}@' for locale '%{public}@' (%lu entries)", buf, 0x20u);

          }
        }
        else
        {
          emf_logging_get_default_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[TESLocalizedPListLoader _loadItems].cold.3(v3, v10, v12);
          v11 = 0;
        }

      }
      else
      {
        emf_logging_get_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[TESLocalizedPListLoader _loadItems].cold.2(v3);
        v11 = 0;
      }

    }
  }
  else
  {
    emf_logging_get_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[TESLocalizedPListLoader _loadItems].cold.1(self);
    v11 = 0;
  }

  return v11;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
  self->_resourceName = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_plistPath, 0);
}

- (void)_loadItems
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2048;
  v9 = objc_msgSend(a2, "unsignedLongValue");
  _os_log_error_impl(&dword_1B3DE1000, a3, OS_LOG_TYPE_ERROR, "Text Effects plist at path '%{public}@' registers an unsupported schemaVersion of '%lu'.", (uint8_t *)&v6, 0x16u);

}

@end
