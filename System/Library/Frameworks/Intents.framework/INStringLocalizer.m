@implementation INStringLocalizer

- (INStringLocalizer)init
{
  return -[INStringLocalizer initWithLanguageCode:](self, "initWithLanguageCode:", 0);
}

- (INStringLocalizer)initWithLanguageCode:(id)a3
{
  id v4;
  INStringLocalizer *v5;
  uint64_t v6;
  NSString *languageCode;
  uint64_t v8;
  NSMapTable *bundlesByIdentifier;
  uint64_t v10;
  NSMapTable *bundlesByURL;
  uint64_t v12;
  NSMapTable *bundleLocalizations;
  uint64_t v14;
  NSMapTable *preferredBundleLocalizations;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *preferredLanguages;
  INStringLocalizer *v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)INStringLocalizer;
  v5 = -[INStringLocalizer init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    bundlesByIdentifier = v5->_bundlesByIdentifier;
    v5->_bundlesByIdentifier = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    bundlesByURL = v5->_bundlesByURL;
    v5->_bundlesByURL = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    bundleLocalizations = v5->_bundleLocalizations;
    v5->_bundleLocalizations = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    preferredBundleLocalizations = v5->_preferredBundleLocalizations;
    v5->_preferredBundleLocalizations = (NSMapTable *)v14;

    if (v4)
    {
      v23[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      preferredLanguages = v5->_preferredLanguages;
      v5->_preferredLanguages = (NSArray *)v18;

    }
    v20 = v5;
  }

  return v5;
}

- (NSLocale)locale
{
  if (self->_languageCode)
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:");
  else
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  return (NSLocale *)(id)objc_claimAutoreleasedReturnValue();
}

- (__CFBundle)bundleWithIdentifier:(id)a3 fileURL:(id)a4
{
  __CFString *v6;
  CFURLRef v7;
  void (**v8)(_QWORD);
  id v9;
  int v10;
  __CFBundle *Unique;
  CFBundleRef BundleWithIdentifier;
  void *v13;
  __CFBundle *v14;
  const __CFURL *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[5];

  v6 = (__CFString *)a3;
  v7 = (CFURLRef)a4;
  os_unfair_lock_lock(&self->_lock);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __50__INStringLocalizer_bundleWithIdentifier_fileURL___block_invoke;
  v19[3] = &unk_1E2294DE0;
  v19[4] = self;
  v8 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v19);
  v9 = -[NSMapTable objectForKey:](self->_bundlesByIdentifier, "objectForKey:", v6);
  if (v9)
    goto LABEL_21;
  v9 = -[NSMapTable objectForKey:](self->_bundlesByURL, "objectForKey:", v7);
  if (v9)
    goto LABEL_21;
  v10 = -[__CFURL isFileURL](v7, "isFileURL") ^ 1;
  if (!v6)
    LOBYTE(v10) = 1;
  if ((v10 & 1) == 0)
  {
    Unique = (__CFBundle *)_CFBundleCreateUnique();
    v9 = Unique;
    if (Unique)
    {
      if ((-[__CFString isEqualToString:]((id)CFBundleGetIdentifier(Unique), "isEqualToString:", v6) & 1) != 0)
      {
LABEL_20:
        -[NSMapTable setObject:forKey:](self->_bundlesByIdentifier, "setObject:forKey:", v9, v6);
        -[NSMapTable setObject:forKey:](self->_bundlesByURL, "setObject:forKey:", v9, v7);
        CFAutorelease(v9);
        goto LABEL_21;
      }
      CFRelease(v9);
    }
LABEL_10:
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(v6);
    v9 = BundleWithIdentifier;
    if (BundleWithIdentifier)
    {
      CFRetain(BundleWithIdentifier);
      v13 = v7;
      v7 = CFBundleCopyBundleURL((CFBundleRef)v9);
LABEL_19:

      goto LABEL_20;
    }
    goto LABEL_12;
  }
  if (v6)
    goto LABEL_10;
LABEL_12:
  if (-[__CFURL isFileURL](v7, "isFileURL"))
  {
    v14 = (__CFBundle *)_CFBundleCreateUnique();
    v9 = v14;
    if (v14)
      goto LABEL_14;
  }
  if (!v6)
    goto LABEL_28;
  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForIdentifier:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleURL");
  v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (-[__CFURL isFileURL](v15, "isFileURL"))
  {
    v9 = (id)_CFBundleCreateUnique();
    if (v9)
    {

      v7 = v15;
      goto LABEL_19;
    }
  }

  v17 = _INVCIntentDefinitionManagerClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "intentDefinitionBundleURLForBundleID:", v6);
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = (CFURLRef)v18;
  }
  if (!v7)
  {
LABEL_28:
    v9 = 0;
    goto LABEL_21;
  }
  v9 = -[NSMapTable objectForKey:](self->_bundlesByURL, "objectForKey:", v7);
  if (!v9)
  {
    v14 = (__CFBundle *)_CFBundleCreateUnique();
    v9 = v14;
    if (v14)
    {
LABEL_14:
      CFBundleGetIdentifier(v14);
      v13 = v6;
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
LABEL_21:
  v8[2](v8);

  return (__CFBundle *)v9;
}

- (id)localizationsForBundle:(__CFBundle *)a3
{
  void *v5;
  id v6;

  os_unfair_lock_assert_owner(&self->_lock);
  if (a3)
  {
    -[NSMapTable objectForKey:](self->_bundleLocalizations, "objectForKey:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = CFBundleCopyBundleLocalizations(a3);
      -[NSMapTable setObject:forKey:](self->_bundleLocalizations, "setObject:forKey:", v5, a3);
    }
    v6 = v5;

  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }
  return v6;
}

- (id)preferredLocalizationsForBundle:(__CFBundle *)a3
{
  void (**v5)(_QWORD);
  void *v6;
  const __CFArray *v7;
  void *v9;
  NSArray *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CFArrayRef v16;
  _QWORD v17[5];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return MEMORY[0x1E0C9AA60];
  os_unfair_lock_lock(&self->_lock);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__INStringLocalizer_preferredLocalizationsForBundle___block_invoke;
  v17[3] = &unk_1E2294DE0;
  v17[4] = self;
  v5 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v17);
  -[NSMapTable objectForKey:](self->_preferredBundleLocalizations, "objectForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[INStringLocalizer localizationsForBundle:](self, "localizationsForBundle:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_preferredLanguages;
    if (self->_languageCode && (objc_msgSend(v9, "containsObject:") & 1) == 0)
    {
      +[INStringLocalizer alternativeLocales](INStringLocalizer, "alternativeLocales");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", self->_languageCode);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v18[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (NSArray *)v15;
      }

    }
    v16 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)v9, (CFArrayRef)v10);
    -[NSMapTable setObject:forKey:](self->_preferredBundleLocalizations, "setObject:forKey:", v16, a3);
    v7 = v16;

  }
  v5[2](v5);

  return v7;
}

- (BOOL)matchesBundleLocalizations:(__CFBundle *)a3
{
  NSString *v5;
  void (**v6)(_QWORD);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v5 = self->_languageCode;
  if (v5)
  {
    os_unfair_lock_lock(&self->_lock);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__INStringLocalizer_matchesBundleLocalizations___block_invoke;
    v14[3] = &unk_1E2294DE0;
    v14[4] = self;
    v6 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v14);
    -[INStringLocalizer localizationsForBundle:](self, "localizationsForBundle:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v5) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "languageCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "containsObject:", v10) & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        +[INStringLocalizer alternativeLocales](INStringLocalizer, "alternativeLocales");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "containsObject:", v12);

      }
    }

    v6[2](v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMapTable)bundlesByIdentifier
{
  return self->_bundlesByIdentifier;
}

- (NSMapTable)bundlesByURL
{
  return self->_bundlesByURL;
}

- (NSMapTable)bundleLocalizations
{
  return self->_bundleLocalizations;
}

- (NSMapTable)preferredBundleLocalizations
{
  return self->_preferredBundleLocalizations;
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_preferredBundleLocalizations, 0);
  objc_storeStrong((id *)&self->_bundleLocalizations, 0);
  objc_storeStrong((id *)&self->_bundlesByURL, 0);
  objc_storeStrong((id *)&self->_bundlesByIdentifier, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

void __48__INStringLocalizer_matchesBundleLocalizations___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __53__INStringLocalizer_preferredLocalizationsForBundle___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __50__INStringLocalizer_bundleWithIdentifier_fileURL___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

+ (id)alternativeLocales
{
  return &unk_1E23FAF90;
}

+ (id)siriLocalizer
{
  void *v3;
  void *v4;

  +[INPreferences siriLanguageCode](INPreferences, "siriLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizerForLanguage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)localizerForLanguage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLanguageCode:", v4);

  return v5;
}

@end
