@implementation LSAltIconManager

- (id)alternateIconNameForIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[LSAltIconManager _getPreferredIconNameForIdentifier:](self, "_getPreferredIconNameForIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("no AlternateName found for app");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), 109, (uint64_t)"-[LSAltIconManager alternateIconNameForIdentifier:error:]", 90, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = 0;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v6);
LABEL_4:

  return v5;
}

- (id)_getPreferredIconNameForIdentifier:(id)a3
{
  CFPropertyListRef v3;
  void *v4;
  CFTypeID v5;

  v3 = CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.lsd.iconNames"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v4 = (void *)v3;
  if (v3)
  {
    v5 = CFGetTypeID(v3);
    if (v5 != CFStringGetTypeID())
    {
      CFRelease(v4);
      v4 = 0;
    }
  }
  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_sharedInstance;
}

void __34__LSAltIconManager_sharedInstance__block_invoke()
{
  LSAltIconManager *v0;
  void *v1;

  v0 = objc_alloc_init(LSAltIconManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (LSAltIconManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LSAltIconManager;
  return -[LSAltIconManager init](&v3, sel_init);
}

- (void)clearAlternateNameForBundleIdentifier:(id)a3 validationDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[LSAltIconManager _getPreferredIconNameForIdentifier:](self, "_getPreferredIconNameForIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = !-[LSAltIconManager isValidAlternateIcon:forIconsDict:](self, "isValidAlternateIcon:forIconsDict:", v8, v7);
    else
      v9 = 0;

  }
  else
  {
    v9 = 1;
  }
  if (_LSIconsLog_onceToken != -1)
    dispatch_once(&_LSIconsLog_onceToken, &__block_literal_global_33);
  v10 = _LSIconsLog_log;
  if (os_log_type_enabled((os_log_t)_LSIconsLog_log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("won't");
    if (v9)
      v11 = CFSTR("will");
    v12 = 138412546;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, "clearAlternateNameForBundleIdentifier: %@ clear for %@", (uint8_t *)&v12, 0x16u);
  }
  if (v9)
    -[LSAltIconManager _setPreferredIconName:forIdentifier:](self, "_setPreferredIconName:forIdentifier:", 0, v6);

}

- (void)setAlternateIconName:(id)a3 forIdentifier:(id)a4 iconsDictionary:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  id v14;
  void *v15;
  void *v16;
  os_unfair_lock_s *v17;
  id v18;
  NSObject *v19;
  _BOOL8 v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[LSAltIconManager setAlternateIconName:forIdentifier:iconsDictionary:reply:]");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v12;
    v15 = 0;
  }
  else
  {
    v39 = *MEMORY[0x1E0CB2D50];
    v40[0] = CFSTR("CFBundleIcons dictionary is missing or incorrect type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), -105, (uint64_t)"-[LSAltIconManager setAlternateIconName:forIdentifier:iconsDictionary:reply:]", 109, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, 0, v15);
    v14 = 0;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  _LSServer_DatabaseExecutionContext();
  v17 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __77__LSAltIconManager_setAlternateIconName_forIdentifier_iconsDictionary_reply___block_invoke;
  v25[3] = &unk_1E103FB40;
  v27 = &v28;
  v18 = v11;
  v26 = v18;
  -[LSDBExecutionContext syncRead:](v17, v25);

  if (v10 && !v14)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("CFBundlePrimaryIcon")) & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      if (_LSIconsLog_onceToken != -1)
        dispatch_once(&_LSIconsLog_onceToken, &__block_literal_global_33);
      v19 = _LSIconsLog_log;
      if (os_log_type_enabled((os_log_t)_LSIconsLog_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v10;
        v37 = 2112;
        v38 = v18;
        _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_DEFAULT, "Setting alternate icon name %@ for app %@", buf, 0x16u);
      }
      objc_msgSend((id)v29[5], "iconsDictionary");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v24 = v15;
  v20 = -[LSAltIconManager _setAlternateIconName:forIdentifier:withIconsDictionary:error:](self, "_setAlternateIconName:forIdentifier:withIconsDictionary:error:", v10, v18, v14, &v24);
  v21 = v24;

  if (v20)
  {
    +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v29[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendNotification:forAppProxies:Plugins:completion:", 13, v23, 0, 0);

  }
  v13[2](v13, v20, v21);

  _Block_object_dispose(&v28, 8);
}

void __77__LSAltIconManager_setAlternateIconName_forIdentifier_iconsDictionary_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setPreferredIconName:(id)a3 forIdentifier:(id)a4
{
  CFPreferencesSetValue((CFStringRef)a4, a3, CFSTR("com.apple.lsd.iconNames"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (BOOL)isValidAlternateIcon:(id)a3 forIconsDict:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("CFBundleAlternateIcons"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray() && (objc_msgSend(v6, "containsObject:", v5) & 1) != 0)
  {
    v7 = 1;
  }
  else if (_NSIsNSDictionary())
  {
    objc_msgSend(v6, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_setAlternateIconName:(id)a3 forIdentifier:(id)a4 withIconsDictionary:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10 || (objc_msgSend(v10, "isEqualToString:", CFSTR("CFBundlePrimaryIcon")) & 1) != 0)
  {
    v13 = 0;
LABEL_4:
    -[LSAltIconManager _setPreferredIconName:forIdentifier:](self, "_setPreferredIconName:forIdentifier:", v13, v11);
    v14 = 1;
    goto LABEL_13;
  }
  if (v12)
  {
    if (-[LSAltIconManager isValidAlternateIcon:forIconsDict:](self, "isValidAlternateIcon:forIconsDict:", v10, v12))
    {
      v13 = v10;
      goto LABEL_4;
    }
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("iconName not found in CFBundleAlternateIcons entry");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 189;
  }
  else
  {
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("CFBundleIcons dictionary is missing or incorrect type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 193;
  }
  _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), -105, (uint64_t)"-[LSAltIconManager _setAlternateIconName:forIdentifier:withIconsDictionary:error:]", v16, v15);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v17 = (void *)*MEMORY[0x1E0CB28A8];
  v21 = *MEMORY[0x1E0CB3388];
  v22 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl(v17, 4, (uint64_t)"-[LSAltIconManager _setAlternateIconName:forIdentifier:withIconsDictionary:error:]", 201, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
    *a6 = objc_retainAutorelease(v19);

  v14 = 0;
LABEL_13:

  return v14;
}

@end
