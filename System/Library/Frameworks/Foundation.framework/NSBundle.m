@implementation NSBundle

- (NSString)bundlePath
{
  __CFBundle *v3;
  CFURLRef v4;
  CFURLRef v5;
  NSString *v6;
  NSString *v8;
  NSObject *v9;
  int v10;
  NSBundle *v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (_CFExecutableLinkedOnOrAfter()
    || (v8 = (NSString *)(id)objc_msgSend(self->_initialPath, "copy")) == 0)
  {
    v3 = -[NSBundle _cfBundle](self, "_cfBundle");
    if (v3)
    {
      v4 = CFBundleCopyBundleURL(v3);
      if (v4)
      {
        v5 = v4;
        v6 = (NSString *)-[__CFURL path](v4, "path");
        CFRelease(v5);
        return v6;
      }
    }
    v8 = (NSString *)(id)objc_msgSend(self->_resolvedPath, "copy");
    v9 = _NSOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = v8;
      _os_log_error_impl(&dword_1817D9000, v9, OS_LOG_TYPE_ERROR, "This bundle %p does not have a valid path. Using backstop: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  return v8;
}

+ (NSBundle)mainBundle
{
  char *v3;
  __CFBundle *MainBundle;
  __CFBundle *v5;
  const __CFURL *v6;
  CFStringRef v7;
  __CFBundle *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;

  os_unfair_lock_lock(&stru_1ECD09B34);
  v3 = (char *)(id)qword_1ECD09B38;
  if (!v3)
  {
    os_unfair_lock_unlock(&stru_1ECD09B34);
    MainBundle = CFBundleGetMainBundle();
    v5 = MainBundle;
    if (MainBundle
      && (v6 = CFBundleCopyBundleURL(MainBundle),
          v7 = CFURLCopyFileSystemPath(v6, kCFURLPOSIXPathStyle),
          CFRelease(v6),
          v7))
    {
      v3 = (char *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:", v7);
      CFRelease(v7);
    }
    else
    {
      v3 = 0;
    }
    os_unfair_lock_lock(&stru_1ECD09B34);
    if (qword_1ECD09B38)
    {

      v3 = (char *)(id)qword_1ECD09B38;
    }
    else if (v3)
    {
      v8 = v5;
      atomic_store((unint64_t)v5, (unint64_t *)v3 + 2);
      v9 = (unint64_t *)(v3 + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 | 0x10000, v9));
      do
        v11 = __ldaxr(v9);
      while (__stlxr(v11 | 0x4000000, v9));
      if (*((_QWORD *)v3 + 6))
      {
        v12 = *((id *)v3 + 5);
        *((_QWORD *)v3 + 5) = objc_msgSend(*((id *)v3 + 6), "copy");
      }
      v13 = +[__NSBundleTables bundleTables]();
      -[__NSBundleTables removeBundle:forPath:type:]((uint64_t)v13, v3, 0, 0x20000);
      qword_1ECD09B38 = v3;
    }
  }
  os_unfair_lock_unlock(&stru_1ECD09B34);
  return (NSBundle *)v3;
}

- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath
{
  __CFBundle *v9;

  if ((!name || !-[NSString length](name, "length")) && (!ext || !-[NSString length](ext, "length")))
    return 0;
  v9 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v9)
    v9 = CFBundleCopyResourceURL(v9, (CFStringRef)name, (CFStringRef)ext, (CFStringRef)subpath);
  return (NSURL *)v9;
}

- (NSURL)bundleURL
{
  NSURL *result;
  CFURLRef v4;
  id v5;

  if (_CFExecutableLinkedOnOrAfter()
    || (v5 = (id)objc_msgSend(self->_initialPath, "copy")) == 0)
  {
    result = -[NSBundle _cfBundle](self, "_cfBundle");
    if (!result)
      return result;
    v4 = CFBundleCopyBundleURL((CFBundleRef)result);
  }
  else
  {
    v4 = (CFURLRef)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v5, 1);
  }
  return (NSURL *)v4;
}

- (NSString)bundleIdentifier
{
  NSDictionary *v2;

  v2 = -[NSBundle infoDictionary](self, "infoDictionary");
  return (NSString *)-[NSDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x1E0C9AE78]);
}

- (NSDictionary)infoDictionary
{
  NSDictionary *result;

  result = -[NSBundle _cfBundle](self, "_cfBundle");
  if (result)
    return (NSDictionary *)CFBundleGetInfoDictionary((CFBundleRef)result);
  return result;
}

- (NSString)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
  __CFBundle *v8;

  v8 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v8)
    v8 = (__CFBundle *)CFBundleCopyLocalizedString(v8, (CFStringRef)key, (CFStringRef)value, (CFStringRef)tableName);
  return (NSString *)v8;
}

- (__CFBundle)_cfBundle
{
  unint64_t *p_cfBundle;
  const __CFString *resolvedPath;
  const __CFURL *v5;
  CFBundleRef v6;

  p_cfBundle = (unint64_t *)&self->_cfBundle;
  if (!atomic_load((unint64_t *)&self->_cfBundle))
  {
    resolvedPath = (const __CFString *)self->_resolvedPath;
    if (resolvedPath)
    {
      v5 = CFURLCreateWithFileSystemPath(0, resolvedPath, kCFURLPOSIXPathStyle, 1u);
      v6 = CFBundleCreate(0, v5);
      if (v6)
      {
        while (!__ldaxr(p_cfBundle))
        {
          if (!__stlxr((unint64_t)v6, p_cfBundle))
            goto LABEL_8;
        }
        __clrex();
        CFRelease(v6);
      }
LABEL_8:
      CFRelease(v5);
    }
  }
  return (__CFBundle *)atomic_load(p_cfBundle);
}

+ (NSArray)preferredLocalizationsFromArray:(NSArray *)localizationsArray forPreferences:(NSArray *)preferencesArray
{
  if (localizationsArray)
    return (NSArray *)CFBundleCopyLocalizationsForPreferences((CFArrayRef)localizationsArray, (CFArrayRef)preferencesArray);
  else
    return (NSArray *)0;
}

- (NSArray)localizations
{
  __CFBundle *v2;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2)
    v2 = CFBundleCopyBundleLocalizations(v2);
  return (NSArray *)v2;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localizations:(id)a6
{
  __CFBundle *v6;

  v6 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v6)
    v6 = (__CFBundle *)_CFBundleCopyLocalizedStringForLocalizations();
  return v6;
}

+ (NSBundle)bundleWithURL:(NSURL *)url
{
  return (NSBundle *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithURL:", url);
}

- (NSBundle)initWithURL:(NSURL *)url
{
  NSString *v7;
  NSString *v8;

  if (!url)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil URL argument"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_6;
  }
  if (!-[NSURL isFileURL](url, "isFileURL"))
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: non-file URL argument"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_6:
    v8 = v7;

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0));
  }
  return -[NSBundle initWithPath:](self, "initWithPath:", -[NSURL path](url, "path"));
}

- (id)localizedAttributedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6
{
  const __CFString *v11;
  void *v12;
  void *v13;
  __CFBundle *v14;
  void *FormatSpecifierConfiguration;
  NSMutableAttributedString *v16;
  NSMutableAttributedString *v17;
  NSAttributedString *v18;
  const __CFString *v19;
  NSMutableDictionary *attributedStringTable;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFBundle *v25;
  id v26;
  id v27;
  char v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11 = CFSTR("Localizable");
    if (a5 && !objc_msgSend(a5, "isEqualToString:", &stru_1E0F56070))
      v11 = (const __CFString *)a5;
    os_unfair_lock_lock(&self->_lock);
    if (!a6)
    {
      attributedStringTable = self->_attributedStringTable;
      if (attributedStringTable)
      {
        v21 = (void *)-[NSMutableDictionary objectForKey:](attributedStringTable, "objectForKey:", v11);
        if (v21)
        {
          v22 = objc_msgSend((id)objc_msgSend(v21, "objectForKey:", a3), "copy");
          if (v22)
          {
            v23 = (void *)v22;
            os_unfair_lock_unlock(&self->_lock);
            return v23;
          }
        }
      }
    }
    os_unfair_lock_unlock(&self->_lock);
    v33 = 0;
    if (-[NSBundle _cfBundle](self, "_cfBundle"))
    {
      v12 = (void *)_CFBundleCopyLocalizedStringForLocalizationAndTableURL();
      v13 = (void *)objc_msgSend(v12, "__baseAttributedString");
      if (!v13)
      {
        if (v12)
        {
          v14 = -[NSBundle _cfBundle](self, "_cfBundle");
          FormatSpecifierConfiguration = (void *)_CFStringGetFormatSpecifierConfiguration();
          v16 = _NSStringCreateByParsingMarkdownAndOptionallyInflecting(v12, v14, 0, FormatSpecifierConfiguration, 1);
LABEL_20:
          v17 = v16;
LABEL_29:

          if (!v17)
          {
            v27 = a3;
            if (a4)
            {
              if (objc_msgSend(a4, "length"))
                v27 = a4;
              else
                v27 = a3;
            }
            v17 = -[NSAttributedString initWithString:]([NSAttributedString alloc], "initWithString:", v27);
          }
          v28 = objc_msgSend(a5, "hasSuffix:", CFSTR(".nocache"), v33);
          if (!a6 && (v28 & 1) == 0)
          {
            os_unfair_lock_lock(&self->_lock);
            v29 = self->_attributedStringTable;
            if (!v29)
            {
              v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
              self->_attributedStringTable = v29;
            }
            v30 = (void *)-[NSMutableDictionary objectForKey:](v29, "objectForKey:", v11);
            v31 = (void *)-[NSMutableAttributedString copy](v17, "copy");
            if (v30)
            {
              objc_msgSend(v30, "setObject:forKey:", v31, a3);
            }
            else
            {
              v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v32, "setObject:forKey:", v31, a3);
              -[NSMutableDictionary setObject:forKey:](self->_attributedStringTable, "setObject:forKey:", v32, v11);

            }
            os_unfair_lock_unlock(&self->_lock);
          }
          return v17;
        }
LABEL_24:
        if (a4 && objc_msgSend(a4, "length"))
        {
          v25 = -[NSBundle _cfBundle](self, "_cfBundle");
          v26 = a4;
        }
        else
        {
          v25 = -[NSBundle _cfBundle](self, "_cfBundle", 0, v34);
          v26 = a3;
        }
        v17 = _NSStringCreateByParsingMarkdownAndOptionallyInflecting(v26, v25, 0, 0, 1);
        v12 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      v13 = (void *)objc_msgSend(0, "__baseAttributedString");
      if (!v13)
        goto LABEL_24;
      v12 = 0;
    }
    v16 = (NSMutableAttributedString *)objc_msgSend(v13, "attributedStringByInflectingString", 0, v34);
    goto LABEL_20;
  }
  if (a4)
  {
    v17 = _NSStringCreateByParsingMarkdownAndOptionallyInflecting(a4, -[NSBundle _cfBundle](self, "_cfBundle"), 0, 0, 1);
    if (v17)
      return v17;
    v18 = [NSAttributedString alloc];
    v19 = (const __CFString *)a4;
  }
  else
  {
    v18 = [NSAttributedString alloc];
    v19 = &stru_1E0F56070;
  }
  return -[NSAttributedString initWithString:](v18, "initWithString:", v19);
}

- (NSBundle)initWithPath:(NSString *)path
{
  void *v5;
  unint64_t *p_flags;
  int v7;
  id *v8;
  id *v9;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id *v15;
  id *v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  id *v21;
  unint64_t v22;
  id *v23;
  id *v24;
  unint64_t v26;
  CFURLRef v27;
  id *v28;
  stat v29;
  uint8_t buf[4];
  NSString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)normalizedPath(path);
  p_flags = &self->_flags;
  v7 = atomic_load(&self->_flags);
  if ((v7 & 0x10000000) == 0)
  {
    v8 = (id *)+[__NSBundleTables bundleTables]();
    v9 = -[__NSBundleTables bundleForPath:](v8, (uint64_t)v5);
    if (v9)
    {
      v28 = v9;

      return (NSBundle *)v28;
    }
  }
  v11 = (void *)objc_msgSend(v5, "_stringByResolvingSymlinksInPathUsingCache:", 1);
  if (!v11 || (v12 = v11, objc_msgSend(v11, "isEqual:", &stru_1E0F56070)))
  {
    v13 = _NSOSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = path;
      _os_log_error_impl(&dword_1817D9000, v13, OS_LOG_TYPE_ERROR, "NSBundle %@ initWithPath failed because the resolved path is empty or nil", buf, 0xCu);
    }

    return 0;
  }
  v14 = atomic_load(p_flags);
  if ((v14 & 0x10000000) == 0)
  {
    v15 = (id *)+[__NSBundleTables bundleTables]();
    v16 = -[__NSBundleTables bundleForPath:](v15, (uint64_t)v12);
    if (v16)
      goto LABEL_24;
    memset(&v29, 0, sizeof(v29));
    if (!objc_msgSend(v12, "getFileSystemRepresentation:maxLength:", buf, 1024)
      || stat((const char *)buf, &v29))
    {
      goto LABEL_24;
    }
    if (access((const char *)buf, 4))
    {
      getpid();
      sandbox_check();
LABEL_24:

      return (NSBundle *)v16;
    }
    if ((v29.st_mode & 0xF000) != 0x4000)
      goto LABEL_24;
  }
  v17 = objc_msgSend(v12, "hasSuffix:", CFSTR(".framework"));
  v18 = 0x20000;
  if (v17)
    v18 = 0x40000;
  do
    v19 = __ldaxr(p_flags);
  while (__stlxr(v19 | v18, p_flags));
  self->_initialPath = (id)objc_msgSend(v5, "copy");
  self->_resolvedPath = (id)objc_msgSend(v12, "copy");
  self->_lock._os_unfair_lock_opaque = 0;
  v20 = atomic_load(&self->_flags);
  if ((v20 & 0x10000000) != 0)
  {
    v27 = CFURLCreateWithFileSystemPath(0, (CFStringRef)self->_resolvedPath, kCFURLPOSIXPathStyle, 1u);
    atomic_store(_CFBundleCreateUnique(), (unint64_t *)&self->_cfBundle);
    CFRelease(v27);
    return self;
  }
  v21 = (id *)+[__NSBundleTables bundleTables]();
  v22 = atomic_load(&self->_flags);
  v23 = -[__NSBundleTables addBundleIfNeeded:forPath:withType:isImmortal:](v21, self, (uint64_t)v12, v22 & 0xF0000, 1);
  if (!v23)
  {
    do
      v26 = __ldaxr(p_flags);
    while (__stlxr(v26 | 8, p_flags));
    return self;
  }
  v24 = v23;

  return (NSBundle *)v24;
}

+ (NSBundle)bundleForClass:(Class)aClass
{
  objc_class *Class;
  NSBundle *v5;
  id *v6;
  const char *ImageName;
  uint64_t v9;
  size_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSBundle *v15;
  unint64_t *p_flags;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id *v20;

  if (aClass)
  {
    Class = object_getClass(aClass);
    if (class_respondsToSelector(Class, sel_bundleForClass))
    {
      v5 = (NSBundle *)-[objc_class bundleForClass](aClass, "bundleForClass");
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v5)
          return v5;
      }
    }
    v6 = (id *)+[__NSBundleTables bundleTables]();
    v5 = (NSBundle *)-[__NSBundleTables bundleForClass:](v6, (uint64_t)aClass);
    if (v5)
      return v5;
    ImageName = class_getImageName(aClass);
    if (ImageName)
    {
      v9 = (uint64_t)ImageName;
      v10 = strnlen(ImageName, 0x402uLL);
      v11 = _NSFileSystemRepresentationString(v9, v10);
      v12 = (void *)normalizedPath(v11);
      if (v12)
      {
        v13 = v12;
        v14 = _NSFrameworkPathFromLibraryPath(v12);
        if (v14 || (v14 = _NSBundlePathFromExecutablePath(v13)) != 0)
        {
          v15 = -[NSBundle initWithPath:]([NSBundle alloc], "initWithPath:", v14);
          if (v15)
          {
            v5 = v15;
            p_flags = &v15->_flags;
            do
              v17 = __ldaxr(p_flags);
            while (__stlxr(v17 | 0x4000000, p_flags));
            do
              v18 = __ldaxr(p_flags);
            while (__stlxr(v18 | 0x30000, p_flags));
            do
              v19 = __ldaxr(p_flags);
            while (__stlxr(v19 | 8, p_flags));
            v20 = (id *)+[__NSBundleTables bundleTables]();
            -[__NSBundleTables addBundle:forPath:withType:forClass:isImmortal:](v20, v5, 0, 196608, (uint64_t)aClass, 1);
            return v5;
          }
        }
      }
    }
  }
  return +[NSBundle mainBundle](NSBundle, "mainBundle");
}

- (void)dealloc
{
  unint64_t *p_flags;
  int v5;
  unint64_t v6;
  NSObject *v7;
  _BOOL8 v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v15;
  NSMutableDictionary *attributedStringTable;
  objc_super v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  NSBundle *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  NSURL *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_flags = &self->_flags;
  v5 = atomic_load(&self->_flags);
  if ((v5 & 0x4000000) != 0)
    -[NSBundle unload](self, "unload");
  v6 = atomic_load(p_flags);
  if ((v6 & 0xD0000) == 0x10000)
  {
    v7 = _NSOSLog();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      *(_DWORD *)buf = 138413058;
      v19 = _NSMethodExceptionProem((objc_class *)self, a2);
      v20 = 2048;
      v21 = self;
      v22 = 2112;
      v23 = -[NSBundle bundleIdentifier](self, "bundleIdentifier");
      v24 = 2112;
      v25 = -[NSBundle bundleURL](self, "bundleURL");
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "%@: attempt to deallocate static bundle - break on _NSBundleDeallocatingStaticBundle to debug. This bundle %p would have been overreleased, but will instead be preserved.\n\tBundle Identifier: %@\n\tBundle URL: %@", buf, 0x2Au);
    }
    destructiveProjectEnumData for PredicateCodableError(v8, v9);
    if (NSZombieEnabled)
LABEL_18:
      __break(1u);
  }
  else
  {
    v10 = atomic_load(&self->_flags);
    if ((v10 & 8) != 0)
    {
      v11 = _NSOSLog();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        *(_DWORD *)buf = 138413058;
        v19 = _NSMethodExceptionProem((objc_class *)self, a2);
        v20 = 2048;
        v21 = self;
        v22 = 2112;
        v23 = -[NSBundle bundleIdentifier](self, "bundleIdentifier");
        v24 = 2112;
        v25 = -[NSBundle bundleURL](self, "bundleURL");
        _os_log_error_impl(&dword_1817D9000, v11, OS_LOG_TYPE_ERROR, "%@: attempting to deallocate an immortal bundle - break on _NSBundleDeallocatingImmortalBundle to debug. This bundle %p has been overreleased.\n\tBundle Identifier: %@\n\tBundle URL: %@", buf, 0x2Au);
      }
      destructiveProjectEnumData for PredicateCodableError(v12, v13);
      if (NSZombieEnabled)
        goto LABEL_18;
    }
    if (atomic_load((unint64_t *)&self->_cfBundle))
    {
      v15 = (void *)atomic_load((unint64_t *)&self->_cfBundle);

    }
    attributedStringTable = self->_attributedStringTable;
    if (attributedStringTable)

    v17.receiver = self;
    v17.super_class = (Class)NSBundle;
    -[NSBundle dealloc](&v17, sel_dealloc);
  }
}

+ (NSBundle)bundleWithIdentifier:(NSString *)identifier
{
  __CFBundle *v4;
  CFURLRef v5;
  CFURLRef v6;
  uint64_t v7;
  NSBundle *v8;

  if (!identifier)
    return 0;
  v4 = (__CFBundle *)MEMORY[0x186DA76E8](identifier);
  if (!v4)
    return 0;
  v5 = CFBundleCopyBundleURL(v4);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = -[__CFURL path](v5, "path");
  if (v7)
    v8 = (NSBundle *)objc_msgSend(a1, "bundleWithPath:", v7);
  else
    v8 = 0;
  CFRelease(v6);
  return v8;
}

+ (NSBundle)bundleWithPath:(NSString *)path
{
  return (NSBundle *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithPath:", path);
}

- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath
{
  return (NSString *)-[NSURL path](-[NSBundle URLForResource:withExtension:subdirectory:](self, "URLForResource:withExtension:subdirectory:", name, ext, subpath), "path");
}

- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext
{
  NSString *v4;

  v4 = -[NSURL path](-[NSBundle URLForResource:withExtension:](self, "URLForResource:withExtension:", name, ext), "path");
  if (pathForResource_ofType__onceToken != -1)
    dispatch_once(&pathForResource_ofType__onceToken, &__block_literal_global_4);
  return v4;
}

- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext
{
  return -[NSBundle URLForResource:withExtension:subdirectory:](self, "URLForResource:withExtension:subdirectory:", name, ext, 0);
}

- (id)objectForInfoDictionaryKey:(NSString *)key
{
  id result;

  result = -[NSDictionary objectForKey:](-[NSBundle localizedInfoDictionary](self, "localizedInfoDictionary"), "objectForKey:", key);
  if (!result)
    return -[NSDictionary objectForKey:](-[NSBundle infoDictionary](self, "infoDictionary"), "objectForKey:", key);
  return result;
}

- (NSDictionary)localizedInfoDictionary
{
  NSDictionary *result;

  result = -[NSBundle _cfBundle](self, "_cfBundle");
  if (result)
    return (NSDictionary *)CFBundleGetLocalInfoDictionary((CFBundleRef)result);
  return result;
}

- (NSAttributedString)localizedAttributedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
  return (NSAttributedString *)-[NSBundle localizedAttributedStringForKey:value:table:localization:](self, "localizedAttributedStringForKey:value:table:localization:", key, value, tableName, 0);
}

+ (id)_bundleWithIdentifier:(id)a3 andLibraryName:(id)a4
{
  NSBundle *v6;
  __CFBundle *BundleWithIdentifierAndLibraryName;
  CFURLRef v8;
  CFURLRef v9;
  void *v10;

  if (!a3)
    return 0;
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  if (!-[NSString isEqualToString:](-[NSBundle bundleIdentifier](v6, "bundleIdentifier"), "isEqualToString:", a3))
  {
    BundleWithIdentifierAndLibraryName = (__CFBundle *)_CFBundleGetBundleWithIdentifierAndLibraryName();
    if (BundleWithIdentifierAndLibraryName)
    {
      v8 = CFBundleCopyBundleURL(BundleWithIdentifierAndLibraryName);
      if (v8)
      {
        v9 = v8;
        v10 = (void *)objc_msgSend(a1, "bundleWithURL:", v8);
        CFRelease(v9);
        return v10;
      }
    }
    return 0;
  }
  return v6;
}

+ (NSArray)preferredLocalizationsFromArray:(NSArray *)localizationsArray
{
  if (localizationsArray)
    return (NSArray *)CFBundleCopyPreferredLocalizationsFromArray((CFArrayRef)localizationsArray);
  else
    return (NSArray *)0;
}

- (NSURL)appStoreReceiptURL
{
  Class v3;

  if (_iOSStyleReceipt_onceToken != -1)
    dispatch_once(&_iOSStyleReceipt_onceToken, &__block_literal_global_220);
  if (-[NSBundle isEqual:](self, "isEqual:", +[NSBundle mainBundle](NSBundle, "mainBundle"))&& (v3 = objc_lookUpClass("LSBundleProxy")) != 0)
  {
    return (NSURL *)objc_msgSend((id)-[objc_class bundleProxyForCurrentProcess](v3, "bundleProxyForCurrentProcess"), "appStoreReceiptURL");
  }
  else
  {
    return 0;
  }
}

- (NSString)resourcePath
{
  __CFBundle *v2;
  CFURLRef v3;
  CFURLRef v4;
  NSString *v5;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2)
    return 0;
  v3 = CFBundleCopyResourcesDirectoryURL(v2);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (NSString)executablePath
{
  __CFBundle *v2;
  CFURLRef v3;
  CFURLRef v4;
  NSString *v5;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2)
    return 0;
  v3 = CFBundleCopyExecutableURL(v2);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (NSArray)preferredLocalizations
{
  return +[NSBundle preferredLocalizationsFromArray:](NSBundle, "preferredLocalizationsFromArray:", -[NSBundle localizations](self, "localizations"));
}

- (Class)classNamed:(NSString *)className
{
  objc_class *v5;

  -[NSBundle load](self, "load");
  v5 = NSClassFromString(className);
  if ((NSBundle *)objc_msgSend((id)objc_opt_class(), "bundleForClass:", v5) == self)
    return v5;
  else
    return 0;
}

- (Class)principalClass
{
  -[NSBundle load](self, "load");
  os_unfair_lock_lock(&self->_lock);
  if (self->_principalClass)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_principalClass = _NSBundleGetPrincipalClassFromInfoDict((unint64_t *)self);
    os_unfair_lock_unlock(&self->_lock);
    _NSBundleInitializePrincipalClass((uint64_t)self->_principalClass);
  }
  return self->_principalClass;
}

- (BOOL)load
{
  return -[NSBundle loadAndReturnError:](self, "loadAndReturnError:", 0);
}

- (BOOL)loadAndReturnError:(NSError *)error
{
  os_unfair_lock_s *p_lock;
  unint64_t *p_flags;
  int v6;
  void *v7;
  __CFBundle *v8;
  _QWORD *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  size_t v13;
  id v14;
  void *v15;
  NSBundle *v16;
  NSBundle *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  BOOL result;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  unint64_t v28;
  Class v29;
  NSNotificationCenter *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  NSError *v34;
  Class PrincipalClassFromInfoDict;
  NSURL *v36;
  NSURL *v37;
  NSError *v38;
  __CFBundle *v39;
  os_unfair_lock_s *v40;
  void *context;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  NSURL *v49;
  __int16 v50;
  NSError *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_flags = &self->_flags;
  v6 = atomic_load(&self->_flags);
  if ((v6 & 0x4000000) != 0)
  {
    os_unfair_lock_unlock(p_lock);
    return 1;
  }
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  context = (void *)MEMORY[0x186DA8F78]();
  atomic_load(p_flags);
  v8 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v8)
  {
    v24 = _NSOSLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = -[NSBundle bundleURL](self, "bundleURL");
      _os_log_error_impl(&dword_1817D9000, v24, OS_LOG_TYPE_ERROR, "NSBundle %@ loading failed because the file does not exist", buf, 0xCu);
    }
    if (error)
      *error = -[NSError initWithDomain:code:userInfo:]([NSError alloc], "initWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4, 0);
    if ((_MergedGlobals_92 & 1) == 0)
      goto LABEL_53;
    goto LABEL_31;
  }
  if (_MergedGlobals_92 == 1)
  {
LABEL_31:
    v25 = _NSOSLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v36 = -[NSBundle bundleURL](self, "bundleURL");
      *(_DWORD *)buf = 138412290;
      v49 = v36;
      _os_log_error_impl(&dword_1817D9000, v25, OS_LOG_TYPE_ERROR, "NSBundle %@ loading failed because bundle loading is disabled", buf, 0xCu);
    }
    if (error)
    {
      CFGetAllocator(v8);
      *error = (NSError *)_CFBundleCreateError();
    }
    goto LABEL_53;
  }
  if (qword_1ECD09B50 != -1)
    dispatch_once(&qword_1ECD09B50, &__block_literal_global_208);
  _CFSetTSD();
  v40 = p_lock;
  if (_CFBundleLoadExecutableAndReturnError())
  {
    v9 = (_QWORD *)_CFGetTSD();
    if ((unint64_t)v9 >= 2 && *v9)
    {
      v39 = v8;
      do
      {
        v10 = (const char *)dyld_image_path_containing_address();
        v11 = (void *)objc_copyClassNamesForImageHeader();
        if (v11)
        {
          v12 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
          v13 = strlen(v10);
          v14 = _NSFileSystemRepresentationString((uint64_t)v10, v13);
          v15 = _NSFrameworkPathFromLibraryPath(v14);
          if (v15 || (v15 = _NSBundlePathFromExecutablePath(v14)) != 0)
          {
            v16 = -[NSBundle initWithPath:]([NSBundle alloc], "initWithPath:", v15);
            v17 = v16;
            if (v16)
            {
              v18 = &v16->_flags;
              v19 = atomic_load(&v16->_flags);
              if ((v19 & 0xF0000) == 0x40000)
              {
                do
                  v20 = __ldaxr(v18);
                while (__stlxr(v20 | 0x4000000, v18));
              }
              if (v16 != self)
                os_unfair_lock_lock(&v16->_lock);
              if (v17 != self)
                os_unfair_lock_unlock(&v17->_lock);
              p_lock = v40;
              objc_msgSend(v7, "addObject:", +[NSNotification notificationWithName:object:userInfo:](NSNotification, "notificationWithName:object:userInfo:", CFSTR("NSBundleDidLoadNotification"), v17, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v12, CFSTR("NSLoadedClasses"), 0, v39)));
            }
          }
          free(v11);
        }
        v21 = v9[1];
        ++v9;
      }
      while (v21);
    }
    v22 = 1;
  }
  else
  {
    if (error)
    {
      *error = 0;
      v26 = _NSOSLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v37 = -[NSBundle bundleURL](self, "bundleURL");
        v38 = *error;
        *(_DWORD *)buf = 138412546;
        v49 = v37;
        v50 = 2112;
        v51 = v38;
        _os_log_error_impl(&dword_1817D9000, v26, OS_LOG_TYPE_ERROR, "NSBundle %@ loading failed because of an error %@", buf, 0x16u);
      }
    }
    v22 = 0;
  }
  v27 = (void *)_CFGetTSD();
  _CFSetTSD();
  if ((unint64_t)v27 >= 2)
  {
    free(v27);
    if ((v22 & 1) == 0)
    {
LABEL_53:
      objc_autoreleasePoolPop(context);
      if (error)
        v34 = *error;
      PrincipalClassFromInfoDict = _NSBundleGetPrincipalClassFromInfoDict((unint64_t *)self);
      os_unfair_lock_unlock(p_lock);
      _NSBundleInitializePrincipalClass((uint64_t)PrincipalClassFromInfoDict);
      return 0;
    }
  }
  else if (!v22)
  {
    goto LABEL_53;
  }
  do
    v28 = __ldaxr(p_flags);
  while (__stlxr(v28 | 0x4000000, p_flags));
  objc_autoreleasePoolPop(context);
  v29 = _NSBundleGetPrincipalClassFromInfoDict((unint64_t *)self);
  os_unfair_lock_unlock(p_lock);
  _NSBundleInitializePrincipalClass((uint64_t)v29);
  if (!objc_msgSend(v7, "count"))
    return 1;
  v30 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v31 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
  if (!v31)
    return 1;
  v32 = *(_QWORD *)v45;
  do
  {
    for (i = 0; i != v31; ++i)
    {
      if (*(_QWORD *)v45 != v32)
        objc_enumerationMutation(v7);
      -[NSNotificationCenter postNotification:](v30, "postNotification:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
    }
    v31 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
    result = 1;
  }
  while (v31);
  return result;
}

- (id)description
{
  uint64_t v3;
  NSString *v4;
  _BOOL4 v5;
  const __CFString *v6;

  v3 = objc_opt_class();
  v4 = -[NSBundle bundlePath](self, "bundlePath");
  v5 = -[NSBundle isLoaded](self, "isLoaded");
  v6 = CFSTR("not yet ");
  if (v5)
    v6 = &stru_1E0F56070;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <%@> (%@loaded)"), v3, v4, v6);
}

- (BOOL)unload
{
  __CFBundle *v3;
  __CFBundle *v4;
  unint64_t *p_flags;
  int v6;
  unint64_t v7;

  v3 = -[NSBundle _cfBundleIfPresent](self, "_cfBundleIfPresent");
  if (v3)
  {
    v4 = v3;
    CFBundleUnloadExecutable(v3);
    if (CFBundleIsExecutableLoaded(v4))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      p_flags = &self->_flags;
      v6 = atomic_load(&self->_flags);
      if ((v6 & 0x4000000) != 0)
      {
        do
          v7 = __ldaxr(p_flags);
        while (__stlxr(v7 & 0xFFFFFFFFF9FFFFFFLL, p_flags));
      }
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

- (BOOL)isLoaded
{
  int v2;
  __CFBundle *v3;

  v2 = atomic_load(&self->_flags);
  if ((v2 & 0x4000000) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[NSBundle _cfBundleIfPresent](self, "_cfBundleIfPresent");
    if (v3)
      LOBYTE(v3) = CFBundleIsExecutableLoaded(v3) != 0;
  }
  return (char)v3;
}

- (__CFBundle)_cfBundleIfPresent
{
  return (__CFBundle *)atomic_load((unint64_t *)&self->_cfBundle);
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6
{
  __CFBundle *v6;

  v6 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v6)
    v6 = (__CFBundle *)CFBundleCopyLocalizedStringForLocalization();
  return v6;
}

- (NSURL)resourceURL
{
  __CFBundle *v2;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2)
    v2 = CFBundleCopyResourcesDirectoryURL(v2);
  return (NSURL *)v2;
}

- (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath
{
  __CFBundle *v6;

  v6 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v6)
    v6 = CFBundleCopyResourceURLsOfType(v6, (CFStringRef)ext, (CFStringRef)subpath);
  return (NSArray *)v6;
}

- (NSURL)builtInPlugInsURL
{
  __CFBundle *v2;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2)
    v2 = CFBundleCopyBuiltInPlugInsURL(v2);
  return (NSURL *)v2;
}

- (id)_objectForUnlocalizedInfoDictionaryKey:(id)a3
{
  return -[NSDictionary objectForKey:](-[NSBundle infoDictionary](self, "infoDictionary"), "objectForKey:", a3);
}

+ (NSArray)allBundles
{
  id v2;

  v2 = +[__NSBundleTables bundleTables]();
  return (NSArray *)-[__NSBundleTables allBundles]((uint64_t)v2);
}

- (NSURL)executableURL
{
  __CFBundle *v2;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2)
    v2 = CFBundleCopyExecutableURL(v2);
  return (NSURL *)v2;
}

- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName
{
  return (NSString *)-[NSURL path](-[NSBundle URLForResource:withExtension:subdirectory:localization:](self, "URLForResource:withExtension:subdirectory:localization:", name, ext, subpath, localizationName), "path");
}

- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath localization:(NSString *)localizationName
{
  __CFBundle *v11;

  if ((!name || !-[NSString length](name, "length")) && (!ext || !-[NSString length](ext, "length")))
    return 0;
  v11 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v11)
    v11 = CFBundleCopyResourceURLForLocalization(v11, (CFStringRef)name, (CFStringRef)ext, (CFStringRef)subpath, (CFStringRef)localizationName);
  return (NSURL *)v11;
}

+ (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath inBundleWithURL:(NSURL *)bundleURL
{
  if (name && -[NSString length](name, "length") || ext && -[NSString length](ext, "length"))
    return (NSURL *)CFBundleCopyResourceURLInDirectory((CFURLRef)bundleURL, (CFStringRef)name, (CFStringRef)ext, (CFStringRef)subpath);
  else
    return 0;
}

- (id)localizedStringsForTable:(id)a3 localization:(id)a4
{
  __CFBundle *v4;

  v4 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v4)
    v4 = (__CFBundle *)CFBundleCopyLocalizedStringTableForLocalization();
  return v4;
}

- (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath
{
  __CFBundle *v6;
  CFArrayRef v7;
  const __CFArray *v8;
  uint64_t v9;
  NSArray *v10;
  CFIndex i;

  v6 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v6)
    return 0;
  v7 = CFBundleCopyResourceURLsOfType(v6, (CFStringRef)ext, (CFStringRef)subpath);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = -[__CFArray count](v7, "count");
  v10 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v9)
  {
    for (i = 0; i != v9; ++i)
      -[NSArray addObject:](v10, "addObject:", objc_msgSend((id)CFArrayGetValueAtIndex(v8, i), "path"));
  }
  CFRelease(v8);
  return v10;
}

- (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName
{
  __CFBundle *v8;
  CFArrayRef v9;
  const __CFArray *v10;
  uint64_t v11;
  NSArray *v12;
  CFIndex i;

  v8 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v8)
    return 0;
  v9 = CFBundleCopyResourceURLsOfTypeForLocalization(v8, (CFStringRef)ext, (CFStringRef)subpath, (CFStringRef)localizationName);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = -[__CFArray count](v9, "count");
  v12 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v11)
  {
    for (i = 0; i != v11; ++i)
      -[NSArray addObject:](v12, "addObject:", objc_msgSend((id)CFArrayGetValueAtIndex(v10, i), "path"));
  }
  CFRelease(v10);
  return v12;
}

- (NSString)developmentLocalization
{
  NSString *result;

  result = -[NSBundle _cfBundle](self, "_cfBundle");
  if (result)
    return (NSString *)(id)(id)CFBundleGetDevelopmentRegion((CFBundleRef)result);
  return result;
}

- (BOOL)preflightAndReturnError:(NSError *)error
{
  __CFBundle *v4;
  NSError *v5;
  NSError *v6;
  BOOL result;
  CFErrorRef *v8;
  int v9;
  BOOL v10;
  NSError *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = -[NSBundle _cfBundle](self, "_cfBundle");
  v13[0] = 0;
  if (!v4)
  {
    if (error)
    {
      v5 = -[NSError initWithDomain:code:userInfo:]([NSError alloc], "initWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4, 0);
      goto LABEL_7;
    }
    return 0;
  }
  if ((_MergedGlobals_92 & 1) != 0)
  {
    if (error)
    {
      CFGetAllocator(v4);
      v5 = (NSError *)_CFBundleCreateError();
LABEL_7:
      v6 = v5;
      result = 0;
LABEL_18:
      if (!result)
      {
        v12 = v6;
        result = 0;
        *error = v12;
      }
      return result;
    }
    return 0;
  }
  if (error)
    v8 = (CFErrorRef *)v13;
  else
    v8 = 0;
  v9 = CFBundlePreflightExecutable(v4, v8);
  v10 = v9 == 0;
  result = v9 != 0;
  if (!v10 || error == 0)
    v6 = 0;
  else
    v6 = (NSError *)v13[0];
  if (error)
    goto LABEL_18;
  return result;
}

+ (id)findBundleResources:(id)a3 callingMethod:(SEL)a4 directory:(id)a5 languages:(id)a6 name:(id)a7 types:(id)a8 limit:(unint64_t)a9
{
  __CFBundle *v11;
  CFURLRef v12;
  CFURLRef v13;
  void *Resources;
  uint64_t v15;
  CFIndex i;
  uint64_t v18;

  if (a3 && (v11 = (__CFBundle *)objc_msgSend(a3, "_cfBundle")) != 0)
  {
    if (a5)
      v12 = CFURLCreateWithFileSystemPath(0, (CFStringRef)a5, kCFURLPOSIXPathStyle, 1u);
    else
      v12 = CFBundleCopyBundleURL(v11);
    v13 = v12;
    if (!v12)
      return v13;
    if (objc_msgSend(a8, "count"))
      objc_msgSend(a8, "objectAtIndex:", 0);
    LOBYTE(v18) = 0;
  }
  else
  {
    v13 = CFURLCreateWithFileSystemPath(0, (CFStringRef)a5, kCFURLPOSIXPathStyle, 1u);
    if (!v13)
      return v13;
    if (objc_msgSend(a8, "count"))
      objc_msgSend(a8, "objectAtIndex:", 0);
    LOBYTE(v18) = 0;
  }
  Resources = (void *)_CFBundleCopyFindResources();
  CFRelease(v13);
  if (!Resources)
    return 0;
  v15 = objc_msgSend(Resources, "count", v18, 0);
  v13 = (CFURLRef)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v15)
  {
    for (i = 0; i != v15; ++i)
      -[__CFURL addObject:](v13, "addObject:", objc_msgSend((id)objc_msgSend((id)CFArrayGetValueAtIndex((CFArrayRef)Resources, i), "absoluteURL"), "absoluteString"));
  }
  CFRelease(Resources);
  return v13;
}

- (id)findBundleResourceURLsCallingMethod:(SEL)a3 passingTest:(id)a4
{
  void *Resources;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  id v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSBundle _cfBundle](self, "_cfBundle", a3);
  v13 = a4;
  LOBYTE(v12) = 0;
  Resources = (void *)_CFBundleCopyFindResources();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(Resources, "count", v12, v13));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(Resources, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(Resources);
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10++), "absoluteURL"));
      }
      while (v8 != v10);
      v8 = objc_msgSend(Resources, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v8);
  }

  return v6;
}

+ (id)findBundleResourceURLsCallingMethod:(SEL)a3 baseURL:(id)a4 passingTest:(id)a5
{
  void *Resources;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  LOBYTE(v12) = 0;
  Resources = (void *)_CFBundleCopyFindResources();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(Resources, "count", v12, a5));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(Resources, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(Resources);
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10++), "absoluteURL"));
      }
      while (v8 != v10);
      v8 = objc_msgSend(Resources, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v8);
  }

  return v6;
}

+ (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)bundlePath
{
  NSUInteger v8;
  const __CFURL *v9;
  const __CFURL *v10;
  CFURLRef v11;
  NSString *v12;

  if (name && -[NSString length](name, "length"))
  {
    if (!bundlePath)
      return 0;
  }
  else
  {
    if (!ext)
      return 0;
    v8 = -[NSString length](ext, "length");
    if (!bundlePath || !v8)
      return 0;
  }
  v9 = CFURLCreateWithFileSystemPath(0, (CFStringRef)bundlePath, kCFURLPOSIXPathStyle, 1u);
  if (v9)
  {
    v10 = v9;
    v11 = CFBundleCopyResourceURLInDirectory(v9, (CFStringRef)name, (CFStringRef)ext, 0);
    CFRelease(v10);
    if (v11)
    {
      v12 = (NSString *)-[__CFURL path](v11, "path");
      CFRelease(v11);
      return v12;
    }
  }
  return 0;
}

+ (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)bundlePath
{
  const __CFURL *v5;
  NSArray *v6;
  CFArrayRef v7;
  uint64_t v8;
  CFIndex i;

  if (!bundlePath)
    return 0;
  v5 = CFURLCreateWithFileSystemPath(0, (CFStringRef)bundlePath, kCFURLPOSIXPathStyle, 1u);
  v6 = (NSArray *)v5;
  if (!v5)
    return v6;
  v7 = CFBundleCopyResourceURLsOfTypeInDirectory(v5, (CFStringRef)ext, 0);
  CFRelease(v6);
  if (!v7)
    return 0;
  v8 = -[__CFArray count](v7, "count");
  v6 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v8)
  {
    for (i = 0; i != v8; ++i)
      -[NSArray addObject:](v6, "addObject:", objc_msgSend((id)CFArrayGetValueAtIndex(v7, i), "path"));
  }
  CFRelease(v7);
  return v6;
}

+ (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath inBundleWithURL:(NSURL *)bundleURL
{
  return (NSArray *)CFBundleCopyResourceURLsOfTypeInDirectory((CFURLRef)bundleURL, (CFStringRef)ext, (CFStringRef)subpath);
}

- (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath localization:(NSString *)localizationName
{
  __CFBundle *v8;

  v8 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v8)
    v8 = CFBundleCopyResourceURLsOfTypeForLocalization(v8, (CFStringRef)ext, (CFStringRef)subpath, (CFStringRef)localizationName);
  return (NSArray *)v8;
}

- (id)_localizedStringsForKeys:(id)a3 forAllLocalizationsOfTable:(id)a4
{
  __CFBundle *v4;

  v4 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v4)
    v4 = (__CFBundle *)_CFBundleCopyFilteredLocalizedStringsForAllLocalizations();
  return v4;
}

+ (id)_localizedStringsForKeys:(id)a3 forAllLocalizationsOfTable:(id)a4 inBundleWithURL:(id)a5
{
  return (id)_CFBundleCopyFilteredLocalizedStringsForAllLocalizationsForURL();
}

- (BOOL)_searchForLocalizedString:(id)a3 foundKey:(id *)a4 foundTable:(id *)a5
{
  int v7;
  int v8;
  BOOL v9;

  if (!-[NSBundle _cfBundle](self, "_cfBundle"))
    return 0;
  v7 = _CFBundleSearchForLocalizedString();
  v8 = v7;
  v9 = v7 != 0;
  if (a4 && v7)
    *a4 = 0;
  if (a5 && v8)
    *a5 = 0;
  return v9;
}

- (id)_initUniqueWithURL:(id)a3
{
  unint64_t *p_flags;
  unint64_t v4;

  p_flags = &self->_flags;
  do
    v4 = __ldaxr(p_flags);
  while (__stlxr(v4 | 0x10000000, p_flags));
  return -[NSBundle initWithURL:](self, "initWithURL:", a3);
}

- (id)_initUniqueWithPath:(id)a3
{
  unint64_t *p_flags;
  unint64_t v4;

  p_flags = &self->_flags;
  do
    v4 = __ldaxr(p_flags);
  while (__stlxr(v4 | 0x10000000, p_flags));
  return -[NSBundle initWithPath:](self, "initWithPath:", a3);
}

- (id)_wrappedBundleURL
{
  __CFBundle *v2;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2)
    v2 = (__CFBundle *)_CFBundleCopyWrappedBundleURL();
  return v2;
}

- (id)_wrapperContainerURL
{
  __CFBundle *v2;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2)
    v2 = (__CFBundle *)_CFBundleCopyWrapperContainerURL();
  return v2;
}

- (NSString)pathForAuxiliaryExecutable:(NSString *)executableName
{
  __CFBundle *v4;
  CFURLRef v5;
  CFURLRef v6;
  NSString *v7;

  v4 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!executableName)
    return 0;
  if (!v4)
    return 0;
  v5 = CFBundleCopyAuxiliaryExecutableURL(v4, (CFStringRef)executableName);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = (NSString *)-[__CFURL path](v5, "path");
  CFRelease(v6);
  return v7;
}

- (NSURL)URLForAuxiliaryExecutable:(NSString *)executableName
{
  __CFBundle *v4;
  CFURLRef v5;

  v4 = -[NSBundle _cfBundle](self, "_cfBundle");
  v5 = 0;
  if (executableName && v4)
    v5 = CFBundleCopyAuxiliaryExecutableURL(v4, (CFStringRef)executableName);
  return (NSURL *)v5;
}

- (NSString)privateFrameworksPath
{
  __CFBundle *v2;
  CFURLRef v3;
  CFURLRef v4;
  NSString *v5;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2)
    return 0;
  v3 = CFBundleCopyPrivateFrameworksURL(v2);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (NSURL)privateFrameworksURL
{
  __CFBundle *v2;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2)
    v2 = CFBundleCopyPrivateFrameworksURL(v2);
  return (NSURL *)v2;
}

- (NSString)sharedFrameworksPath
{
  __CFBundle *v2;
  CFURLRef v3;
  CFURLRef v4;
  NSString *v5;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2)
    return 0;
  v3 = CFBundleCopySharedFrameworksURL(v2);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (NSURL)sharedFrameworksURL
{
  __CFBundle *v2;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2)
    v2 = CFBundleCopySharedFrameworksURL(v2);
  return (NSURL *)v2;
}

- (NSString)sharedSupportPath
{
  __CFBundle *v2;
  CFURLRef v3;
  CFURLRef v4;
  NSString *v5;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2)
    return 0;
  v3 = CFBundleCopySharedSupportURL(v2);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (NSURL)sharedSupportURL
{
  __CFBundle *v2;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2)
    v2 = CFBundleCopySharedSupportURL(v2);
  return (NSURL *)v2;
}

- (NSString)builtInPlugInsPath
{
  __CFBundle *v2;
  CFURLRef v3;
  CFURLRef v4;
  NSString *v5;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2)
    return 0;
  v3 = CFBundleCopyBuiltInPlugInsURL(v2);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (unint64_t)versionNumber
{
  unint64_t result;

  result = -[NSBundle _cfBundle](self, "_cfBundle");
  if (result)
    return CFBundleGetVersionNumber((CFBundleRef)result);
  return result;
}

- (id)bundleLanguages
{
  NSArray *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = -[NSBundle localizations](self, "localizations");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "stringByAppendingString:", CFSTR(".lproj")));
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v5);
  }
  return v3;
}

- (void)invalidateResourceCache
{
  if (-[NSBundle _cfBundle](self, "_cfBundle"))
    _CFBundleFlushBundleCaches();
}

+ (id)loadedBundles
{
  id v2;

  v2 = +[__NSBundleTables bundleTables]();
  return (id)-[__NSBundleTables loadedBundles]((uint64_t)v2);
}

- (void)__static
{
  unint64_t *p_flags;
  unint64_t v3;

  p_flags = &self->_flags;
  do
    v3 = __ldaxr(p_flags);
  while (__stlxr(v3 | 0x30000, p_flags));
}

+ (NSArray)allFrameworks
{
  id v2;

  if (allFrameworks_onceToken != -1)
    dispatch_once(&allFrameworks_onceToken, &__block_literal_global_40);
  v2 = +[__NSBundleTables bundleTables]();
  return (NSArray *)-[__NSBundleTables allFrameworks]((uint64_t)v2);
}

uint64_t __25__NSBundle_allFrameworks__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  NSBundle *v3;
  const char **v4;
  const char **v5;
  unint64_t i;
  const char *v7;
  size_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSBundle *v13;
  NSBundle *v14;
  unint64_t *p_flags;
  unint64_t v16;
  id v17;
  id v18;
  unsigned int outCount;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)MEMORY[0x186DA8F78]();
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  outCount = 0;
  v4 = objc_copyImageNames(&outCount);
  if (v4)
  {
    v5 = v4;
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        v7 = v5[i];
        v8 = strnlen(v7, 0x402uLL);
        v9 = _NSFileSystemRepresentationString((uint64_t)v7, v8);
        v10 = normalizedPath(v9);
        if (v10)
        {
          v11 = (void *)v10;
          if (!objc_msgSend(v2, "objectForKey:", v10))
          {
            v12 = _NSFrameworkPathFromLibraryPath(v11);
            if (v12 || (v12 = _NSBundlePathFromExecutablePath(v11)) != 0)
            {
              v13 = -[NSBundle initWithPath:]([NSBundle alloc], "initWithPath:", v12);
              if (v13)
              {
                v14 = v13;
                objc_msgSend(v2, "setObject:forKey:", v13, v11);

                p_flags = &v14->_flags;
                do
                  v16 = __ldaxr(p_flags);
                while (__stlxr(v16 | 0x4000000, p_flags));
                if (v3 != v14)
                  objc_msgSend(v0, "addObject:", v14);
              }
            }
          }
        }
      }
    }
    free(v5);
  }

  objc_autoreleasePoolPop(v1);
  v17 = v0;
  v18 = +[__NSBundleTables bundleTables]();
  return -[__NSBundleTables addStaticFrameworkBundles:]((uint64_t)v18, v17);
}

+ (id)debugDescription
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "loadedBundles"), "description");
}

- (NSArray)executableArchitectures
{
  __CFBundle *v2;

  v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2)
    v2 = CFBundleCopyExecutableArchitectures(v2);
  return (NSArray *)v2;
}

- (id)_localizedStringNoCacheNoMarkdownParsingForKey:(id)a3 value:(id)a4 table:(id)a5 localizations:(id)a6 actualTableURL:(id *)a7 formatSpecifierConfiguration:(id *)a8
{
  __CFBundle *v10;
  void *v11;
  __CFBundle *v12;
  __CFBundle *v13;
  void *FormatSpecifierConfiguration;

  v10 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v10)
  {
    v11 = (void *)_CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption();
    v10 = 0;
    if (!a7)
      goto LABEL_7;
  }
  else
  {
    v11 = 0;
    if (!a7)
      goto LABEL_7;
  }
  if (v11)
    v12 = v10;
  else
    v12 = 0;
  *a7 = v12;
LABEL_7:
  v13 = v10;
  if (a8)
  {
    if (v11)
      FormatSpecifierConfiguration = (void *)_CFStringGetFormatSpecifierConfiguration();
    else
      FormatSpecifierConfiguration = 0;
    *a8 = FormatSpecifierConfiguration;
  }
  return v11;
}

- (void)setPreservationPriority:(double)priority forTags:(NSSet *)tags
{
  _NSBundleODRDataForApplications *v6;
  id *p_isa;
  NSObject *initialStateGroup;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint8_t v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)self, 1);
  if (v6)
  {
    p_isa = (id *)&v6->super.super.isa;
    initialStateGroup = v6->_initialStateGroup;
    v9 = dispatch_time(0, 3000000000);
    if (dispatch_group_wait(initialStateGroup, v9))
    {
      if (qword_1ECD056F0 != -1)
        dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
      v10 = qword_1ECD056E8;
      if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v15 = 0;
        _os_log_debug_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEBUG, "Unable to connect to daemon to set preservation priority", v15, 2u);
      }
    }
    else
    {
      objc_msgSend(p_isa[2], "lock");
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](tags, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(tags);
            objc_msgSend((id)objc_msgSend(p_isa[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i)), "setPreservationPriority:", priority);
          }
          v12 = -[NSSet countByEnumeratingWithState:objects:count:](tags, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
        }
        while (v12);
      }
      objc_msgSend(p_isa[2], "unlock");
      objc_msgSend((id)objc_msgSend(+[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection"), "remoteObjectProxy"), "setPreservationPriority:forTags:inBundle:", tags, objc_msgSend(p_isa[3], "bundleURL"), priority);
    }
  }
}

- (void)setPreservationPriority:(double)a3 forTag:(id)a4
{
  -[NSBundle setPreservationPriority:forTags:](self, "setPreservationPriority:forTags:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a4), a3);
}

- (double)preservationPriorityForTag:(NSString *)tag
{
  _NSBundleODRDataForApplications *v4;
  _NSBundleODRDataForApplications *v5;
  NSObject *initialStateGroup;
  dispatch_time_t v7;
  NSObject *v8;
  double v9;
  double v10;
  uint8_t v12[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)self, 1);
  if (!v4)
    return 0.0;
  v5 = v4;
  initialStateGroup = v4->_initialStateGroup;
  v7 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(initialStateGroup, v7))
  {
    if (qword_1ECD056F0 != -1)
      dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
    v8 = qword_1ECD056E8;
    v9 = 1.0;
    if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_debug_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEBUG, "Unable to connect to daemon to get preservation priority", v12, 2u);
    }
  }
  else
  {
    -[NSLock lock](v5->super._lock, "lock");
    objc_msgSend(-[NSDictionary objectForKey:](v5->_tagToTagState, "objectForKey:", tag), "preservationPriority");
    v9 = v10;
    -[NSLock unlock](v5->super._lock, "unlock");
  }
  return v9;
}

@end
