@implementation _LSStringLocalizer

- (_LSBundleProvider)bundleProvider
{
  return self->_bundleProvider;
}

+ (id)newFrameworkBundleLocalizer
{
  uint64_t v2;
  _LSStringLocalizer *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = _LSGetBundle();
  if (!v2
    || (v3 = -[_LSStringLocalizer initWithCFBundle:stringsFile:]([_LSStringLocalizer alloc], "initWithCFBundle:stringsFile:", v2, CFSTR("Localized"))) == 0)
  {
    v3 = objc_alloc_init(_LSStringLocalizer);
    _LSDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[_LSStringLocalizer newFrameworkBundleLocalizer].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return v3;
}

+ (_LSStringLocalizer)coreTypesLocalizer
{
  if (+[_LSStringLocalizer coreTypesLocalizer]::once != -1)
    dispatch_once(&+[_LSStringLocalizer coreTypesLocalizer]::once, &__block_literal_global_71);
  return (_LSStringLocalizer *)(id)+[_LSStringLocalizer coreTypesLocalizer]::result;
}

- (_LSStringLocalizer)init
{
  return -[_LSStringLocalizer initWithBundleURL:stringsFile:](self, "initWithBundleURL:stringsFile:", 0, 0);
}

- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5
{
  return -[_LSStringLocalizer initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:](self, "initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:", a3, a4, 1, a5);
}

- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4 checkMainBundle:(BOOL)a5 legacyLocalizationList:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _LSStringLocalizer *v16;
  _LSBundleProvider *v17;
  _LSStringLocalizer *v18;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x186DAE7A0]();
  if (!v10 || !v7)
  {
    if (!v10)
    {
      v18 = 0;
      goto LABEL_9;
    }
LABEL_7:
    v17 = -[_LSBundleProvider initWithURL:useCacheIfPossible:]([_LSBundleProvider alloc], "initWithURL:useCacheIfPossible:", v10, 1);
    v18 = -[_LSStringLocalizer initWithBundleProvider:stringsFile:legacyLocalizationList:](self, "initWithBundleProvider:stringsFile:legacyLocalizationList:", v17, v11, v6);
    self = (_LSStringLocalizer *)v17;
LABEL_9:

    v16 = v18;
    goto LABEL_10;
  }
  _LSGetMainBundleURL();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  v15 = objc_msgSend(v13, "isEqual:", v10);

  if (!v15)
    goto LABEL_7;
  v16 = -[_LSStringLocalizer initWithCFBundle:stringsFile:legacyLocalizationList:](self, "initWithCFBundle:stringsFile:legacyLocalizationList:", CFBundleGetMainBundle(), v11, v6);
LABEL_10:
  objc_autoreleasePoolPop(v12);

  return v16;
}

- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4
{
  return -[_LSStringLocalizer initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:](self, "initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:", a3, a4, 1, 0);
}

- (_LSStringLocalizer)initWithCFBundle:(__CFBundle *)a3 stringsFile:(id)a4
{
  return -[_LSStringLocalizer initWithCFBundle:stringsFile:legacyLocalizationList:](self, "initWithCFBundle:stringsFile:legacyLocalizationList:", a3, a4, 0);
}

- (_LSStringLocalizer)initWithCFBundle:(__CFBundle *)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _LSBundleProvider *v9;
  _LSStringLocalizer *v10;

  v5 = a5;
  v8 = a4;
  v9 = -[_LSBundleProvider initWithCFBundle:]([_LSBundleProvider alloc], "initWithCFBundle:", a3);
  v10 = -[_LSStringLocalizer initWithBundleProvider:stringsFile:legacyLocalizationList:](self, "initWithBundleProvider:stringsFile:legacyLocalizationList:", v9, v8, v5);

  return v10;
}

- (_LSStringLocalizer)initWithBundleProvider:(id)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v9;
  id v10;
  _LSStringLocalizer *v11;
  _LSStringLocalizer *v12;
  _LSStringsFileContent *v13;
  _LSStringsFileContent *stringsContent;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *unlocalizedInfoPlistStrings;
  uint64_t v25;
  _LSLazyPropertyList *v26;
  void *v27;
  __CFBundle *v28;
  NSArray *bundleLocalizations;
  id *p_bundleLocalizations;
  NSObject *v31;
  void *v32;
  void *v33;
  const void *Unique;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  const __CFArray *v55;
  id v56;
  const __CFArray *v57;
  CFArrayRef v58;
  uint64_t v59;
  NSArray *bundleLocalizationsWithDefaultPrefLocs;
  objc_super v62;
  uint8_t buf[4];
  __CFString *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v5 = a5;
  v67 = *MEMORY[0x1E0C80C00];
  v9 = (__CFString *)a3;
  v10 = a4;
  v62.receiver = self;
  v62.super_class = (Class)_LSStringLocalizer;
  v11 = -[_LSStringLocalizer init](&v62, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_38;
  objc_storeStrong((id *)&v11->_bundleProvider, a3);
  v13 = (_LSStringsFileContent *)-[_LSStringsFileContent initWithStringsFile:]([_LSStringsFileContent alloc], v10);
  stringsContent = v12->_stringsContent;
  v12->_stringsContent = v13;

  v15 = (void *)MEMORY[0x186DAE7A0]();
  -[_LSStringLocalizer bundleProvider](v12, "bundleProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (v17)
  {
    p_bundleLocalizations = (id *)&v12->_bundleLocalizations;
    if (!v12->_bundleLocalizations)
    {
      v19 = 0;
      goto LABEL_33;
    }
LABEL_25:
    v47 = *p_bundleLocalizations;
    v19 = CFSTR("en");
    goto LABEL_26;
  }
  -[_LSStringLocalizer bundleProvider](v12, "bundleProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (__CFString *)LSBundleProvider::CFBundleCopyDevelopmentRegion((LSBundleProvider *)objc_msgSend(v18, "provider"));

  if (objc_msgSend(v10, "isEqual:", CFSTR("InfoPlist")))
  {
    -[_LSStringLocalizer bundleProvider](v12, "bundleProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "infoDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

    if (v22)
    {
      if (!-[__CFString cfBundleRef:reason:](v9, "cfBundleRef:reason:", 1, CFSTR("Need to load non-Info.Plist file")))
        goto LABEL_8;
      v23 = (void *)_CFBundleCopyInfoPlistURL();
      if (!v23)
        goto LABEL_7;
      +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:]((uint64_t)_LSLazyPropertyList, v23);
      v38 = objc_claimAutoreleasedReturnValue();
      unlocalizedInfoPlistStrings = v12->_unlocalizedInfoPlistStrings;
      v12->_unlocalizedInfoPlistStrings = (_LSLazyPropertyList *)v38;
    }
    else
    {
      -[_LSStringLocalizer bundleProvider](v12, "bundleProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "infoDictionary");
      unlocalizedInfoPlistStrings = (void *)objc_claimAutoreleasedReturnValue();
      +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, unlocalizedInfoPlistStrings);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v12->_unlocalizedInfoPlistStrings;
      v12->_unlocalizedInfoPlistStrings = (_LSLazyPropertyList *)v25;

    }
LABEL_7:

  }
LABEL_8:
  -[_LSStringLocalizer bundleProvider](v12, "bundleProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = LSBundleProvider::CFBundleCopyBundleLocalizations((LSBundleProvider *)objc_msgSend(v27, "provider"));
  p_bundleLocalizations = (id *)&v12->_bundleLocalizations;
  bundleLocalizations = v12->_bundleLocalizations;
  v12->_bundleLocalizations = (NSArray *)v28;

  if (v5 && v19 && objc_msgSend(*p_bundleLocalizations, "containsObject:", v19))
  {
    _LSDefaultLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v9;
      _os_log_impl(&dword_182882000, v31, OS_LOG_TYPE_DEFAULT, "Applying legacy localization list behavior to bundle %@", buf, 0xCu);
    }

    -[_LSStringLocalizer bundleProvider](v12, "bundleProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bundleURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    Unique = (const void *)_CFBundleCreateUnique();

    if (Unique)
    {
      v35 = (void *)MEMORY[0x186DAD7EC](Unique, 1);
      v36 = objc_msgSend(v35, "copy");
      v37 = *p_bundleLocalizations;
      *p_bundleLocalizations = (id)v36;

      CFRelease(Unique);
    }
    else
    {
      _LSDefaultLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[_LSStringLocalizer initWithBundleProvider:stringsFile:legacyLocalizationList:].cold.1(v39, v40, v41, v42, v43, v44, v45, v46);

    }
  }
  v47 = *p_bundleLocalizations;
  if (!*p_bundleLocalizations)
    goto LABEL_33;
  if (!v19)
    goto LABEL_25;
LABEL_26:
  v48 = objc_msgSend(v47, "indexOfObject:", v19);
  v49 = v48;
  if (v48)
  {
    if (v48 == 0x7FFFFFFFFFFFFFFFLL)
    {
      _LSDefaultLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        -[_LSStringLocalizer bundleProvider](v12, "bundleProvider");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "bundleURL");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        v64 = v19;
        v65 = 2113;
        v66 = v52;
        _os_log_error_impl(&dword_182882000, v50, OS_LOG_TYPE_ERROR, "LSStringLocalizer development region %{public}@ not found in localizations available for bundle %{private}@", buf, 0x16u);

      }
    }
    else
    {
      v50 = objc_msgSend(*p_bundleLocalizations, "mutableCopy");
      -[NSObject removeObjectAtIndex:](v50, "removeObjectAtIndex:", v49);
      -[NSObject insertObject:atIndex:](v50, "insertObject:atIndex:", v19, 0);
      v53 = -[NSObject copy](v50, "copy");
      v54 = *p_bundleLocalizations;
      *p_bundleLocalizations = (id)v53;

    }
  }
  v55 = (const __CFArray *)*p_bundleLocalizations;
  if (*p_bundleLocalizations)
    goto LABEL_34;
LABEL_33:
  v56 = *p_bundleLocalizations;
  *p_bundleLocalizations = (id)MEMORY[0x1E0C9AA60];

  v55 = (const __CFArray *)*p_bundleLocalizations;
  if (*p_bundleLocalizations)
  {
LABEL_34:
    objc_msgSend((id)__LSDefaultsGetSharedInstance(), "preferredLocalizations");
    v57 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v58 = CFBundleCopyLocalizationsForPreferences(v55, v57);
    v59 = -[__CFArray copy](v58, "copy");
    bundleLocalizationsWithDefaultPrefLocs = v12->_bundleLocalizationsWithDefaultPrefLocs;
    v12->_bundleLocalizationsWithDefaultPrefLocs = (NSArray *)v59;

  }
  if (!v12->_bundleLocalizationsWithDefaultPrefLocs)
  {
    v12->_bundleLocalizationsWithDefaultPrefLocs = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  objc_autoreleasePoolPop(v15);
LABEL_38:

  return v12;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_LSStringLocalizer;
  -[_LSStringLocalizer dealloc](&v2, sel_dealloc);
}

- (id)localizedStringWithString:(id)a3 preferredLocalizations:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSStringLocalizer.mm"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string != nil"));

  }
  -[_LSStringLocalizer bundleProvider](self, "bundleProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cfBundleRef");

  if (v10)
  {
    -[_LSStringLocalizer bundleProvider](self, "bundleProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSStringLocalizer localizedStringWithString:inBundle:preferredLocalizations:](self, "localizedStringWithString:inBundle:preferredLocalizations:", v7, objc_msgSend(v11, "cfBundleRef"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)localizedStringsWithStrings:(id)a3 preferredLocalizations:(id)a4
{
  id v7;
  id v8;
  void *v9;
  __CFBundle *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *context;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSStringLocalizer.mm"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("strings != nil"));

  }
  context = (void *)MEMORY[0x186DAE7A0]();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v10 = -[_LSBundleProvider cfBundleRef](self->_bundleProvider, "cfBundleRef");
  if (v10)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[_LSStringLocalizer localizedStringWithString:inBundle:preferredLocalizations:](self, "localizedStringWithString:inBundle:preferredLocalizations:", v15, v10, v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

  }
  v17 = (void *)objc_msgSend(v9, "copy");

  objc_autoreleasePoolPop(context);
  return v17;
}

- (id)localizedStringDictionaryWithString:(id)a3 defaultValue:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFAllocator *v13;
  uint64_t i;
  const __CFString *v15;
  void *v16;
  CFLocaleIdentifier CanonicalLanguageIdentifierFromString;
  __CFString *v18;
  CFLocaleIdentifier v19;
  void *v21;
  void *context;
  id v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v23 = a4;
  v25 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSStringLocalizer.mm"), 328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string != nil"));

  }
  context = (void *)MEMORY[0x186DAE7A0]();
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_LSStringLocalizer bundleProvider](self, "bundleProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cfBundleRef");

  if (v9)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = self->_bundleLocalizations;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v27;
      v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v10);
          v15 = *(const __CFString **)(*((_QWORD *)&v26 + 1) + 8 * i);
          -[_LSStringLocalizer localizedStringWithString:inBundle:localeCode:](self, "localizedStringWithString:inBundle:localeCode:", v25, v9, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(v13, v15);
            v18 = (__CFString *)CanonicalLanguageIdentifierFromString;
            if (CanonicalLanguageIdentifierFromString)
              v19 = CanonicalLanguageIdentifierFromString;
            else
              v19 = v15;
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v16, v19);

          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

  }
  if (v23)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("LSDefaultLocalizedValue"));
  objc_autoreleasePoolPop(context);

  return v24;
}

- (void)enumerateLocalizedStringsUsingBlock:(id)a3
{
  -[_LSStringLocalizer enumerateLocalizedStringsForKeys:usingBlock:](self, "enumerateLocalizedStringsForKeys:usingBlock:", 0, a3);
}

- (void)enumerateLocalizedStringsForKeys:(id)a3 usingBlock:(id)a4
{
  id v7;
  int v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _LSStringsFileContent *stringsContent;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  int v62;
  void *v63;
  void *context;
  void (**v65)(id, uint64_t, id, id, _QWORD *);
  NSArray *obj;
  uint64_t v67;
  _LSStringLocalizer *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  int v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD block[4];
  id v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v65 = (void (**)(id, uint64_t, id, id, _QWORD *))a4;
  v72 = v7;
  v68 = self;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSStringLocalizer.mm"), 358, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  context = (void *)MEMORY[0x186DAE7A0]();
  if (-[NSArray count](self->_bundleLocalizations, "count"))
  {
    v8 = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isRegionChina");
    v9 = v8 ^ 1;
    if (!v7)
      v9 = 1;
    v75 = v8;
    if ((v9 & 1) != 0)
    {
      v71 = 0;
    }
    else
    {
      v10 = (void *)MEMORY[0x186DAE7A0]();
      v11 = (void *)objc_msgSend(v7, "mutableCopy");
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v90;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v90 != v14)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "stringByAppendingString:", CFSTR("#CH"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v16);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
        }
        while (v13);
      }

      v71 = (void *)objc_msgSend(v11, "copy");
      objc_autoreleasePoolPop(v10);
    }
    v17 = (void *)MEMORY[0x186DAE7A0]();
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[_LSStringLocalizer bundleProvider](v68, "bundleProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bundleURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v18, "initWithFormat:", CFSTR("Reading localized string from %@"), v21);
    if (_LSLoggingQueue(void)::onceToken != -1)
      dispatch_once(&_LSLoggingQueue(void)::onceToken, &__block_literal_global_171);
    v23 = _LSLoggingQueue(void)::logQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZL18_LSSetCrashMessageP8NSString_block_invoke_1;
    block[3] = &unk_1E10418C8;
    v94 = v22;
    v24 = v22;
    dispatch_sync(v23, block);

    objc_autoreleasePoolPop(v17);
    v74 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v73 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    obj = v68->_bundleLocalizations;
    v69 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    if (v69)
    {
      v67 = *(_QWORD *)v86;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v86 != v67)
            objc_enumerationMutation(obj);
          v70 = v25;
          v26 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v25);
          v27 = (void *)MEMORY[0x186DAE7A0]();
          v28 = v71;
          if (!v71)
            v28 = v72;
          if (!v72)
            v28 = 0;
          v29 = v28;
          stringsContent = v68->_stringsContent;
          -[_LSStringLocalizer bundleProvider](v68, "bundleProvider");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[_LSStringsFileContent uncheckedObjectsForKeys:forLocaleCode:fromBundle:cacheLocalizations:](stringsContent, v29, v26, objc_msgSend(v31, "cfBundleRef"), v68->_bundleLocalizationsWithDefaultPrefLocs);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
            v33 = v72 != 0;
          else
            v33 = 1;
          if (!v33)
          {
            v34 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v32, "allKeys");
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = (void *)v35;
            if (v35)
              v37 = v35;
            else
              v37 = MEMORY[0x1E0C9AA60];
            objc_msgSend(v34, "setWithArray:", v37);
            v72 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_autoreleasePoolPop(v27);
          if (v32)
          {
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            v38 = v72;
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
            if (!v39)
              goto LABEL_54;
            v40 = *(_QWORD *)v82;
            while (1)
            {
              for (j = 0; j != v39; ++j)
              {
                if (*(_QWORD *)v82 != v40)
                  objc_enumerationMutation(v38);
                v42 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
                v43 = (void *)MEMORY[0x186DAE7A0]();
                if (v75
                  && (objc_msgSend(v42, "stringByAppendingString:", CFSTR("#CH")),
                      v44 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v32, "objectForKeyedSubscript:", v44),
                      v45 = (void *)objc_claimAutoreleasedReturnValue(),
                      v44,
                      v45)
                  || (objc_msgSend(v32, "objectForKeyedSubscript:", v42),
                      (v45 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  if (!_NSIsNSString())
                    goto LABEL_52;
                  objc_msgSend(v74, "objectForKeyedSubscript:", v42);
                  v46 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v46)
                  {
                    v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                    objc_msgSend(v74, "setObject:forKeyedSubscript:", v46, v42);
                  }
                  objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, v26);
                }
                else
                {
                  objc_msgSend(v73, "objectForKeyedSubscript:", v42);
                  v46 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v46)
                  {
                    v46 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                    objc_msgSend(v73, "setObject:forKeyedSubscript:", v46, v42);
                  }
                  objc_msgSend(v46, "addObject:", v26);
                  v45 = 0;
                }

LABEL_52:
                objc_autoreleasePoolPop(v43);
              }
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
              if (!v39)
              {
LABEL_54:

                break;
              }
            }
          }

          v25 = v70 + 1;
        }
        while (v70 + 1 != v69);
        v69 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
      }
      while (v69);
    }

    if (_LSLoggingQueue(void)::onceToken != -1)
      dispatch_once(&_LSLoggingQueue(void)::onceToken, &__block_literal_global_171);
    dispatch_sync((dispatch_queue_t)_LSLoggingQueue(void)::logQueue, &__block_literal_global_173);
    v47 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v48 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v76 = v72;
    v49 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v78;
LABEL_61:
      v51 = 0;
      while (1)
      {
        if (*(_QWORD *)v78 != v50)
          objc_enumerationMutation(v76);
        v52 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v51);
        v53 = (void *)MEMORY[0x186DAE7A0]();
        objc_msgSend(v74, "objectForKeyedSubscript:", v52);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = (void *)v54;
        v56 = v54 ? (id)v54 : v47;
        v57 = v56;

        objc_msgSend(v73, "objectForKeyedSubscript:", v52);
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = (void *)v58;
        v60 = v58 ? (id)v58 : v48;
        v61 = v60;

        LOBYTE(block[0]) = 0;
        v65[2](v65, v52, v57, v61, block);
        v62 = LOBYTE(block[0]);

        objc_autoreleasePoolPop(v53);
        if (v62)
          break;
        if (v49 == ++v51)
        {
          v49 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
          if (v49)
            goto LABEL_61;
          break;
        }
      }
    }

    v7 = v76;
  }
  objc_autoreleasePoolPop(context);

}

+ (NSString)missingLocalizationPlaceholder
{
  if (+[_LSStringLocalizer missingLocalizationPlaceholder]::once != -1)
    dispatch_once(&+[_LSStringLocalizer missingLocalizationPlaceholder]::once, &__block_literal_global_36);
  return (NSString *)(id)+[_LSStringLocalizer missingLocalizationPlaceholder]::result;
}

+ (BOOL)useLegacyLocalizationListForPlatform:(unsigned int)a3 sdkVersion:(unsigned int)a4
{
  unsigned int v4;

  if (a3 - 1 > 8)
    v4 = 0;
  else
    v4 = dword_1829FAD18[a3 - 1];
  return v4 > a4;
}

+ (void)gatherLocalizedStringsForLSBundleProvider:(id)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 delegatesMightBeMainBundle:(BOOL)a6 legacyLocalizationList:(BOOL)a7
{
  _BOOL8 v7;
  char v9;
  id v12;
  id v13;
  _LSStringLocalizer *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  _LSStringLocalizer *v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  id v36;
  BOOL v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[6];

  v7 = a7;
  v9 = a5;
  v43[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (_LSStringLocalizer *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleProvider:stringsFile:legacyLocalizationList:", v12, CFSTR("InfoPlist"), v7);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__45;
  v41[4] = __Block_byref_object_dispose__45;
  v42 = 0;
  if (v14)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = v15;
    if (v29 && v15)
    {
      _LSStringLocalizerPrewarmAllLocalizations(v14);
      v17 = (void *)MEMORY[0x1E0C99E20];
      if ((v9 & 1) != 0)
      {
        v19 = *MEMORY[0x1E0C9AE88];
        v43[0] = *MEMORY[0x1E0C9AAC8];
        v43[1] = v19;
        v43[2] = CFSTR("NSMicrophoneUsageDescription");
        v43[3] = CFSTR("NSIdentityUsageDescription");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setWithArray:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke;
        v39[3] = &unk_1E1045518;
        v18 = v21;
        v40 = v18;
        _LSBundleDisplayNameContextEnumerate(v39);
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, &stru_1E10473A0);

      }
      else
      {
        v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, &stru_1E10473A0);
      }

      if ((v9 & 4) != 0)
        objc_msgSend(a1, "findKeysToLocalizeInInfoDictionary:forArrayKey:stringKey:localizedKeys:", v13, *MEMORY[0x1E0C9AAD0], *MEMORY[0x1E0C9AB10], v16);
      if ((v9 & 2) != 0)
      {
        objc_msgSend(a1, "findKeysToLocalizeInInfoDictionary:forArrayKey:stringKey:localizedKeys:", v13, CFSTR("UTExportedTypeDeclarations"), CFSTR("UTTypeDescription"), v16);
        objc_msgSend(a1, "findKeysToLocalizeInInfoDictionary:forArrayKey:stringKey:localizedKeys:", v13, CFSTR("UTImportedTypeDeclarations"), CFSTR("UTTypeDescription"), v16);
      }
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2;
      v30[3] = &unk_1E1045568;
      v31 = v14;
      v22 = v13;
      v32 = v22;
      v35 = v41;
      v33 = v12;
      v36 = a1;
      v37 = a6;
      v38 = v7;
      v23 = v29;
      v34 = v23;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v30);
      if (objc_msgSend(v23, "count"))
      {
        v24 = *MEMORY[0x1E0C9AAC8];
        objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAC8]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (!v25 || !objc_msgSend(v25, "count"))
        {
          if (_LSGetBooleanFromDict((const __CFDictionary *)v22, CFSTR("LSHasLocalizedDisplayName")))
          {
            objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE88]);
            v27 = objc_claimAutoreleasedReturnValue();

            v26 = (void *)v27;
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, v24);
          }
        }
        v28 = (void *)objc_msgSend(v23, "copy");
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("_LSLocalizedStringsDictionary"));

      }
    }

  }
  _Block_object_dispose(v41, 8);

}

+ (void)gatherLocalizedStringsForCFBundle:(__CFBundle *)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 delegatesMightBeMainBundle:(BOOL)a6 legacyLocalizationList:(BOOL)a7
{
  _BOOL8 v7;
  char v9;
  void *v12;
  _LSStringLocalizer *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  _LSStringLocalizer *v31;
  id v32;
  id v33;
  _QWORD *v34;
  __CFBundle *v35;
  id v36;
  BOOL v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[6];

  v7 = a7;
  v9 = a5;
  v43[4] = *MEMORY[0x1E0C80C00];
  v29 = a4;
  v12 = (void *)MEMORY[0x186DAE7A0]();
  v13 = (_LSStringLocalizer *)objc_msgSend(objc_alloc((Class)a1), "initWithCFBundle:stringsFile:legacyLocalizationList:", a3, CFSTR("InfoPlist"), v7);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__45;
  v41[4] = __Block_byref_object_dispose__45;
  v42 = 0;
  if (v13)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = v14;
    if (v28 && v14)
    {
      _LSStringLocalizerPrewarmAllLocalizations(v13);
      v16 = (void *)MEMORY[0x1E0C99E20];
      if ((v9 & 1) != 0)
      {
        v18 = *MEMORY[0x1E0C9AE88];
        v43[0] = *MEMORY[0x1E0C9AAC8];
        v43[1] = v18;
        v43[2] = CFSTR("NSMicrophoneUsageDescription");
        v43[3] = CFSTR("NSIdentityUsageDescription");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke;
        v39[3] = &unk_1E1045518;
        v17 = v20;
        v40 = v17;
        _LSBundleDisplayNameContextEnumerate(v39);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, &stru_1E10473A0);

      }
      else
      {
        v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, &stru_1E10473A0);
      }

      if ((v9 & 4) != 0)
        objc_msgSend(a1, "findKeysToLocalizeInInfoDictionary:forArrayKey:stringKey:localizedKeys:", v29, *MEMORY[0x1E0C9AAD0], *MEMORY[0x1E0C9AB10], v15);
      if ((v9 & 2) != 0)
      {
        objc_msgSend(a1, "findKeysToLocalizeInInfoDictionary:forArrayKey:stringKey:localizedKeys:", v29, CFSTR("UTExportedTypeDeclarations"), CFSTR("UTTypeDescription"), v15);
        objc_msgSend(a1, "findKeysToLocalizeInInfoDictionary:forArrayKey:stringKey:localizedKeys:", v29, CFSTR("UTImportedTypeDeclarations"), CFSTR("UTTypeDescription"), v15);
      }
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2;
      v30[3] = &unk_1E1045590;
      v31 = v13;
      v21 = v29;
      v32 = v21;
      v34 = v41;
      v35 = a3;
      v36 = a1;
      v37 = a6;
      v38 = v7;
      v22 = v28;
      v33 = v22;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v30);
      if (objc_msgSend(v22, "count"))
      {
        v23 = *MEMORY[0x1E0C9AAC8];
        objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAC8]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (!v24 || !objc_msgSend(v24, "count"))
        {
          if (_LSGetBooleanFromDict((const __CFDictionary *)v21, CFSTR("LSHasLocalizedDisplayName")))
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE88]);
            v26 = objc_claimAutoreleasedReturnValue();

            v25 = (void *)v26;
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, v23);
          }
        }
        v27 = (void *)objc_msgSend(v22, "copy", v28);
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("_LSLocalizedStringsDictionary"));

      }
    }

  }
  _Block_object_dispose(v41, 8);

  objc_autoreleasePoolPop(v12);
}

+ (void)gatherLocalizedStringsForCFBundle:(__CFBundle *)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 legacyLocalizationList:(BOOL)a6
{
  objc_msgSend(a1, "gatherLocalizedStringsForCFBundle:infoDictionary:domains:delegatesMightBeMainBundle:legacyLocalizationList:", a3, a4, *(_QWORD *)&a5, 0, a6);
}

- (id)debugDescription
{
  void *v2;
  void *v3;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSStringLocalizer bundleProvider](self, "bundleProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_LSStringLocalizer bundleProvider](self, "bundleProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("(no bundle)");
  }
  -[_LSStringsFileContent debugDescription](self->_stringsContent, "debugDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p> { '%@'; %@ }"), v7, self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleProvider, 0);
  objc_storeStrong((id *)&self->_bundleLocalizationsWithDefaultPrefLocs, 0);
  objc_storeStrong((id *)&self->_bundleLocalizations, 0);
  objc_storeStrong((id *)&self->_unlocalizedInfoPlistStrings, 0);
  objc_storeStrong((id *)&self->_stringsContent, 0);
}

- (_LSStringLocalizer)initWithDatabase:(id)a3 bundleUnit:(unsigned int)a4 delegate:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  _LSStringLocalizer *v9;
  uint64_t v10;
  uint64_t v11;
  uint64x2_t v12;
  uint64_t v13;
  _BOOL8 v14;
  void *v15;
  id v17;
  uint64x2_t v18[2];
  uint64_t v19;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v17 = 0;
  if (_LSBundleCopyNode(v8, v6, v5, 0, &v17))
  {
    v9 = -[_LSStringLocalizer init](self, "init");
  }
  else
  {
    v10 = _LSBundleGet(v8, v6);
    if (v10)
    {
      v11 = *(unsigned int *)(v10 + 20);
      v12 = *(uint64x2_t *)(v10 + 76);
      v18[0] = *(uint64x2_t *)(v10 + 60);
      v18[1] = v12;
      v13 = _LSMakeDYLDVersionFromVersionNumber(v18);
    }
    else
    {
      v11 = 0;
      v13 = 0;
    }
    v14 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:sdkVersion:](_LSStringLocalizer, "useLegacyLocalizationListForPlatform:sdkVersion:", v11, v13);
    objc_msgSend(v17, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_LSStringLocalizer initWithBundleURL:stringsFile:legacyLocalizationList:](self, "initWithBundleURL:stringsFile:legacyLocalizationList:", v15, CFSTR("InfoPlist"), v14);

  }
  return v9;
}

- (_LSStringLocalizer)initWithDatabase:(id)a3 pluginUnit:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64x2_t v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  _LSStringLocalizer *v15;
  uint64x2_t v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _LSGetPlugin((uint64_t)v6, a4);
  v8 = (int *)v7;
  if (!v7)
    goto LABEL_6;
  if (!*(_DWORD *)v7)
    goto LABEL_6;
  v9 = *(unsigned int *)(v7 + 20);
  v10 = *(uint64x2_t *)(v7 + 76);
  v17[0] = *(uint64x2_t *)(v7 + 60);
  v17[1] = v10;
  v11 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:sdkVersion:](_LSStringLocalizer, "useLegacyLocalizationListForPlatform:sdkVersion:", v9, _LSMakeDYLDVersionFromVersionNumber(v17));
  v12 = _LSAliasCopyResolvedNode(v6, *v8, 0, 0, 0);
  v13 = v12;
  if (!v12)
    goto LABEL_6;
  objc_msgSend(v12, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = -[_LSStringLocalizer initWithBundleURL:stringsFile:legacyLocalizationList:](self, "initWithBundleURL:stringsFile:legacyLocalizationList:", v14, CFSTR("InfoPlist"), v11);

  }
  else
  {
LABEL_6:
    v15 = -[_LSStringLocalizer init](self, "init");
  }

  return v15;
}

+ (NSArray)preferredLocalizationsForXCTests
{
  char *v2;
  void *v3;
  void *v4;

  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure")
    && (v2 = getenv("LS_PREFERRED_LOCALIZATIONS")) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("||"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

+ (void)setPreferredLocalizationsForXCTests:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    if (v4)
    {
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR("||"));
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      setenv("LS_PREFERRED_LOCALIZATIONS", (const char *)objc_msgSend(v3, "UTF8String"), 1);

    }
    else
    {
      unsetenv("LS_PREFERRED_LOCALIZATIONS");
    }
  }

}

+ (id)localizedStringForCanonicalString:(id)a3 preferredLocalizations:(id)a4 context:(LSContext *)a5
{
  _LSDatabase *v7;
  NSString *v8;
  id v9;
  LaunchServices::CanonicalString *v10;
  uint64_t LocalizedString;
  void *v12;
  void *v13;

  v7 = (_LSDatabase *)a3;
  v9 = a4;
  if (!v7)
    goto LABEL_6;
  v10 = (LaunchServices::CanonicalString *)LaunchServices::CanonicalString::Find((LaunchServices::CanonicalString *)a5->db, v7, v8);
  if (!v10)
    goto LABEL_6;
  LocalizedString = LaunchServices::CanonicalString::getLocalizedString(v10);
  LaunchServices::LocalizedString::localizeUnsafely(LocalizedString, a5->db, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "isEqual:", v7))
  {

LABEL_6:
    v13 = 0;
  }

  return v13;
}

+ (id)localizedStringsForCanonicalString:(id)a3 context:(LSContext *)a4
{
  NSString *v5;
  _LSDatabase *v6;
  LaunchServices::CanonicalString *v7;
  LaunchServices::LocalizedString *LocalizedString;
  void *v9;

  v6 = (_LSDatabase *)a3;
  if (v6
    && (v7 = (LaunchServices::CanonicalString *)LaunchServices::CanonicalString::Find((LaunchServices::CanonicalString *)a4->db, v6, v5)) != 0)
  {
    LocalizedString = (LaunchServices::LocalizedString *)LaunchServices::CanonicalString::getLocalizedString(v7);
    LaunchServices::LocalizedString::getAllUnsafeLocalizations(LocalizedString, a4->db, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)localizedStringWithString:(id)a3 inBundle:(__CFBundle *)a4 preferredLocalizations:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSArray *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  NSArray *v20;
  NSArray *v21;
  NSArray *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (!v10)
    {
LABEL_4:
      v14 = self->_bundleLocalizationsWithDefaultPrefLocs;
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSStringLocalizer.mm"), 1019, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string != nil"));

    if (!v11)
      goto LABEL_4;
  }
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "preferredLocalizations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
    goto LABEL_4;
  v14 = (NSArray *)CFBundleCopyLocalizationsForPreferences((CFArrayRef)self->_bundleLocalizations, (CFArrayRef)v11);
LABEL_6:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v14;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v15);
        -[_LSStringLocalizer localizedStringWithString:inBundle:localeCode:](self, "localizedStringWithString:inBundle:localeCode:", v9, a4, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18));
        v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19 && -[NSArray length](v19, "length"))
        {
          v22 = v15;
          goto LABEL_20;
        }

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
        continue;
      break;
    }
  }

  -[_LSLazyPropertyList objectForKey:ofClass:](self->_unlocalizedInfoPlistStrings, "objectForKey:ofClass:", v9, objc_opt_class());
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21 && -[NSArray length](v21, "length"))
  {
    v22 = v22;
    v20 = v22;
  }
  else
  {
    v20 = 0;
  }
LABEL_20:

  return v20;
}

- (id)localizedStringWithString:(id)a3 inBundle:(__CFBundle *)a4 localeCode:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  CFURLRef v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[4];
  id v27;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  v25 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSStringLocalizer.mm"), 1060, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSStringLocalizer.mm"), 1061, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localeCode != nil"));

LABEL_3:
  v12 = (void *)MEMORY[0x186DAE7A0]();
  v13 = CFBundleCopyBundleURL(a4);
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[__CFURL path](v13, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("Reading localized string from %@"), v15);
  v17 = v9;
  if (_LSLoggingQueue(void)::onceToken != -1)
    dispatch_once(&_LSLoggingQueue(void)::onceToken, &__block_literal_global_171);
  v18 = _LSLoggingQueue(void)::logQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZL18_LSSetCrashMessageP8NSString_block_invoke_1;
  block[3] = &unk_1E10418C8;
  v27 = v16;
  v19 = v16;
  dispatch_sync(v18, block);

  v20 = v17;
  objc_autoreleasePoolPop(v12);
  -[_LSStringsFileContent stringForString:forLocale:fromBundle:cacheLocalizations:](&self->_stringsContent->super.isa, v17, v25, (uint64_t)a4, self->_bundleLocalizationsWithDefaultPrefLocs);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (_LSLoggingQueue(void)::onceToken != -1)
    dispatch_once(&_LSLoggingQueue(void)::onceToken, &__block_literal_global_171);
  dispatch_sync((dispatch_queue_t)_LSLoggingQueue(void)::logQueue, &__block_literal_global_173);

  return v21;
}

+ (void)findKeysToLocalizeInInfoDictionary:(id)a3 forArrayKey:(__CFString *)a4 stringKey:(__CFString *)a5 localizedKeys:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *context;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v29 = a6;
  context = (void *)MEMORY[0x186DAE7A0]();
  v28 = v9;
  v10 = objc_opt_class();
  objc_msgSend(v9, "objectForKey:", a4);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v12 = 0;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
        if (_NSIsNSDictionary())
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("_LSBundleLibraryDelegate"));
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          v21 = &stru_1E10473A0;
          if (v19)
            v21 = (__CFString *)v19;
          v22 = v21;

          objc_msgSend(v29, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v23, v22);
          }
          v24 = objc_opt_class();
          objc_msgSend(v18, "objectForKey:", a5);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          if (v24 && v25)
          {
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v26 = 0;
LABEL_23:

              goto LABEL_24;
            }
          }
          else if (!v25)
          {
            goto LABEL_23;
          }
          objc_msgSend(v23, "addObject:", v26);
          goto LABEL_23;
        }
LABEL_24:
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v15);
  }

  objc_autoreleasePoolPop(context);
}

+ (void)newFrameworkBundleLocalizer
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "frameworkBundleLocalizer init fallback localizer %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithBundleProvider:(uint64_t)a3 stringsFile:(uint64_t)a4 legacyLocalizationList:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "could not create fresh unique bundle in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
