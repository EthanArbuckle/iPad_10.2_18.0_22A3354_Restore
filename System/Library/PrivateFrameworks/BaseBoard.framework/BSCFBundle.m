@implementation BSCFBundle

- (id)localizedInfoDictionary
{
  return CFBundleGetLocalInfoDictionary(self->_cfBundle);
}

- (__CFBundle)cfBundle
{
  return self->_cfBundle;
}

- (BSCFBundle)initWithPath:(id)a3
{
  void *v4;
  BSCFBundle *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BSCFBundle initWithURL:](self, "initWithURL:", v4);

  return v5;
}

- (BSCFBundle)initWithURL:(id)a3
{
  id v5;
  void *Unique;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSCFBundle.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

  }
  Unique = (void *)_CFBundleCreateUnique();
  if (Unique)
  {
    if (self)
    {
      v9.receiver = self;
      v9.super_class = (Class)BSCFBundle;
      self = -[BSCFBundle init](&v9, sel_init);
      if (self)
      {
        CFRetain(Unique);
        self->_cfBundle = (__CFBundle *)Unique;
      }
    }
    CFRelease(Unique);
  }
  else
  {

    self = 0;
  }

  return self;
}

- (void)dealloc
{
  __CFBundle *cfBundle;
  objc_super v4;

  cfBundle = self->_cfBundle;
  if (cfBundle)
    CFRelease(cfBundle);
  v4.receiver = self;
  v4.super_class = (Class)BSCFBundle;
  -[BSCFBundle dealloc](&v4, sel_dealloc);
}

- (id)infoDictionary
{
  return CFBundleGetInfoDictionary(self->_cfBundle);
}

- (id)bundleIdentifier
{
  return (id)CFBundleGetIdentifier(self->_cfBundle);
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  return (id)(id)CFBundleCopyLocalizedString(self->_cfBundle, (CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5);
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCFBundle bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, 0);

  -[BSCFBundle bundlePath](self, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("path"), 1);

  v8 = (id)objc_msgSend(v3, "appendBool:withName:", CFBundleIsExecutableLoaded(self->_cfBundle) != 0, CFSTR("loaded"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)executablePath
{
  CFURLRef v2;
  CFURLRef v3;
  void *v4;
  uint64_t v5;

  v2 = CFBundleCopyExecutableURL(self->_cfBundle);
  if (v2)
  {
    v3 = v2;
    -[__CFURL path](v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
    if (v4 && objc_msgSend(v4, "hasPrefix:", CFSTR("/private/var/")))
    {
      objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, objc_msgSend(CFSTR("/private/var/"), "length"), CFSTR("/var/"));
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)bundlePath
{
  CFURLRef v2;
  CFURLRef v3;
  void *v4;

  v2 = CFBundleCopyBundleURL(self->_cfBundle);
  if (v2)
  {
    v3 = v2;
    -[__CFURL path](v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)pathForResource:(id)a3 ofType:(id)a4
{
  CFURLRef v4;
  CFURLRef v5;
  void *v6;

  v4 = CFBundleCopyResourceURL(self->_cfBundle, (CFStringRef)a3, (CFStringRef)a4, 0);
  if (v4)
  {
    v5 = v4;
    -[__CFURL path](v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)pathForResource:(id)a3 ofType:(id)a4 inDirectory:(id)a5
{
  id v8;
  id v9;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  CFArrayRef v13;
  void *v14;
  const __CFArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v26;
  __CFString *v27;
  CFArrayRef v28;
  __CFString *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = (const __CFString *)v9;
  v12 = (const __CFString *)a5;
  v29 = (__CFString *)v11;
  v27 = (__CFString *)v12;
  if (self)
  {
    v13 = CFBundleCopyResourceURLsOfType(self->_cfBundle, v11, v12);
    v28 = v13;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[__CFArray count](v13, "count"));
      self = (BSCFBundle *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingPathExtension:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v15 = v28;
      v16 = -[__CFArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v31 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v19, "path");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v10
              || (objc_msgSend(v19, "relativePath"),
                  v21 = (void *)objc_claimAutoreleasedReturnValue(),
                  v22 = objc_msgSend(v21, "isEqualToString:", v14),
                  v21,
                  v22))
            {
              -[BSCFBundle addObject:](self, "addObject:", v20);
            }

          }
          v16 = -[__CFArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
        }
        while (v16);
      }

    }
    else
    {
      self = 0;
    }

  }
  if ((unint64_t)-[BSCFBundle count](self, "count") >= 2)
  {
    BSLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "stringByAppendingPathExtension:", v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v26;
      _os_log_error_impl(&dword_18A184000, v23, OS_LOG_TYPE_ERROR, "More than one resource matches the given filename %{public}@", buf, 0xCu);

    }
  }
  -[BSCFBundle firstObject](self, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

@end
