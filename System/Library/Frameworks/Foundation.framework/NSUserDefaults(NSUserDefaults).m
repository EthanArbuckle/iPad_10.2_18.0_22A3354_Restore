@implementation NSUserDefaults(NSUserDefaults)

- (uint64_t)_willBeginKeyValueObserving
{
  uint64_t result;

  result = objc_msgSend(a1, "_kvo");
  if (!result)
  {
    objc_msgSend(a1, "_setKVO:", &off_1E0FBDF20);
    return _CFPrefsRegisterUserDefaultsInstance();
  }
  return result;
}

- (void)registerDefaults:()NSUserDefaults
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 && objc_msgSend(a3, "count"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3052000000;
    v12 = __Block_byref_object_copy__17;
    v13 = __Block_byref_object_dispose__17;
    v14 = 0;
    v5 = objc_opt_class();
    v6 = (void *)MEMORY[0x186DA8F78]();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__NSUserDefaults_NSUserDefaults__registerDefaults___block_invoke;
    v8[3] = &unk_1E0F51200;
    v8[5] = a3;
    v8[6] = &v9;
    v8[4] = v5;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);
    objc_autoreleasePoolPop(v6);
    _CFXPreferencesRegisterDefaultValues();
    v7 = (void *)v10[5];
    if (v7)

    -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUserDefaultsDidChangeNotification"), a1, 0);
    _Block_object_dispose(&v9, 8);
  }
}

- (void)release
{
  BOOL v2;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD0A250 != -1)
    dispatch_once(&qword_1ECD0A250, &__block_literal_global_53);
  if (_MergedGlobals_126)
    v2 = qword_1ECD0A248 == (_QWORD)a1;
  else
    v2 = 0;
  if (!v2)
  {
    v3.receiver = a1;
    v3.super_class = (Class)&off_1EDCFA068;
    objc_msgSendSuper2(&v3, sel_release);
  }
}

- (id)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "_kvo"))
    _CFPrefsUnregisterUserDefaultsInstance();
  objc_msgSend(a1, "_setIdentifier:", 0);
  objc_msgSend(a1, "_setContainer:", 0);
  v3.receiver = a1;
  v3.super_class = (Class)&off_1EDCFA068;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

- (void)_initWithSuiteName:()NSUserDefaults container:
{
  __CFBundle *MainBundle;
  void *v8;
  id v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3
    && ((objc_msgSend(a3, "isEqualToString:", CFSTR("NSGlobalDomain")) & 1) != 0
     || (MainBundle = CFBundleGetMainBundle(),
         objc_msgSend(a3, "isEqualToString:", CFBundleGetIdentifier(MainBundle)))))
  {
    _NSUserDefaults_Log_Nonsensical_Suites((uint64_t)a3);

    return 0;
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&off_1EDCFA068;
    v9 = objc_msgSendSuper2(&v11, sel_init);
    v8 = v9;
    if (v9)
    {
      objc_msgSend(v9, "_setContainer:", a4);
      objc_msgSend(v8, "_setIdentifier:", a3);
    }
  }
  return v8;
}

- (uint64_t)setInteger:()NSUserDefaults forKey:
{
  return objc_msgSend(a1, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"), a4);
}

- (uint64_t)dataForKey:()NSUserDefaults
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSData())
    return v1;
  else
    return 0;
}

- (uint64_t)arrayForKey:()NSUserDefaults
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSArray())
    return v1;
  else
    return 0;
}

- (float)floatForKey:()NSUserDefaults
{
  uint64_t v1;
  void *v2;
  float result;

  v1 = objc_msgSend(a1, "objectForKey:");
  if (!v1)
    return 0.0;
  v2 = (void *)v1;
  if ((_NSIsNSNumber() & 1) == 0 && !_NSIsNSString())
    return 0.0;
  objc_msgSend(v2, "floatValue");
  return result;
}

- (void)stringArrayForKey:()NSUserDefaults
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(a1, "objectForKey:");
  if (!_NSIsNSArray())
    return 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
LABEL_4:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v4)
        objc_enumerationMutation(v1);
      if (!_NSIsNSString())
        return 0;
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
        if (v3)
          goto LABEL_4;
        return v1;
      }
    }
  }
  return v1;
}

- (double)doubleForKey:()NSUserDefaults
{
  uint64_t v1;
  void *v2;
  double result;

  v1 = objc_msgSend(a1, "objectForKey:");
  if (!v1)
    return 0.0;
  v2 = (void *)v1;
  if ((_NSIsNSNumber() & 1) == 0 && !_NSIsNSString())
    return 0.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

+ (id)standardUserDefaults
{
  void *v0;
  id v1;

  os_unfair_lock_lock(&stru_1ECD0A244);
  v0 = (void *)qword_1ECD0A248;
  if (!qword_1ECD0A248)
  {
    _CFAutoreleasePoolPush();
    qword_1ECD0A248 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99EA0]), "init");
    _CFPreferencesRegisterStandardUserDefaultsExists();
    _CFAutoreleasePoolPop();
    v0 = (void *)qword_1ECD0A248;
  }
  v1 = v0;
  os_unfair_lock_unlock(&stru_1ECD0A244);
  return v1;
}

- (uint64_t)initWithSuiteName:()NSUserDefaults
{
  return objc_msgSend(a1, "_initWithSuiteName:container:", a3, 0);
}

- (uint64_t)init
{
  return objc_msgSend(a1, "initWithUser:", 0);
}

- (uint64_t)initWithUser:()NSUserDefaults
{
  return objc_msgSend(a1, "initWithSuiteName:", 0);
}

- (id)dictionaryRepresentation
{
  objc_msgSend(a1, "_identifier");
  objc_msgSend(a1, "_container");
  return (id)_CFPrefsCopyAppDictionaryWithContainer();
}

- (BOOL)synchronize
{
  _BOOL8 v2;

  objc_msgSend(a1, "_identifier");
  objc_msgSend(a1, "_container");
  v2 = _CFPreferencesAppSynchronizeWithContainer() != 0;
  _CFPrefsSynchronizeForProcessTermination();
  return v2;
}

- (uint64_t)dictionaryForKey:()NSUserDefaults
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSDictionary())
    return v1;
  else
    return 0;
}

- (uint64_t)stringForKey:()NSUserDefaults
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "objectForKey:");
  if ((_NSIsNSString() & 1) == 0)
  {
    if (_NSIsNSNumber())
      return objc_msgSend(v1, "stringValue");
    return 0;
  }
  return (uint64_t)v1;
}

- (uint64_t)setObject:()NSUserDefaults forKey:
{
  objc_msgSend(a1, "_identifier");
  objc_msgSend(a1, "_container");
  _CFPreferencesSetAppValueWithContainer();
  return -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUserDefaultsDidChangeNotification"), a1, 0);
}

- (uint64_t)integerForKey:()NSUserDefaults
{
  uint64_t v6;
  void *v7;

  if (objc_msgSend(a1, "isMemberOfClass:", MEMORY[0x1E0C99EA0]))
  {
    objc_msgSend(a1, "_identifier");
    objc_msgSend(a1, "_container");
    return _CFPreferencesGetAppIntegerValueWithContainer();
  }
  else
  {
    v6 = objc_msgSend(a1, "objectForKey:", a3);
    if (v6 && ((v7 = (void *)v6, (_NSIsNSString() & 1) != 0) || _NSIsNSNumber()))
      return objc_msgSend(v7, "integerValue");
    else
      return 0;
  }
}

- (uint64_t)BOOLForKey:()NSUserDefaults
{
  BOOL v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;

  if (objc_msgSend(a1, "isMemberOfClass:", MEMORY[0x1E0C99EA0]))
  {
    objc_msgSend(a1, "_identifier");
    objc_msgSend(a1, "_container");
    v5 = _CFPreferencesGetAppBooleanValueWithContainer() == 0;
    return !v5;
  }
  v8 = (void *)objc_msgSend(a1, "objectForKey:", a3);
  if (_NSIsNSString())
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("YES")) & 1) == 0)
    {
      v9 = objc_msgSend(v8, "length");
      v6 = 1;
      if (!objc_msgSend(v8, "compare:options:range:", CFSTR("YES"), 1, 0, v9))
        return v6;
      v6 = 1;
      if (!objc_msgSend(v8, "compare:options:range:", CFSTR("Y"), 1, 0, v9))
        return v6;
      v5 = objc_msgSend(v8, "integerValue") == 0;
      return !v5;
    }
    return 1;
  }
  if (!_NSIsNSNumber())
    return 0;
  return objc_msgSend(v8, "BOOLValue");
}

- (id)objectForKey:()NSUserDefaults
{
  objc_msgSend(a1, "_identifier");
  objc_msgSend(a1, "_container");
  return (id)_CFPreferencesCopyAppValueWithContainer();
}

- (uint64_t)removeObjectForKey:()NSUserDefaults
{
  return objc_msgSend(a1, "setObject:forKey:", 0, a3);
}

- (void)setURL:()NSUserDefaults forKey:
{
  void *v7;

  v7 = (void *)MEMORY[0x186DA8F78]();
  objc_msgSend(a1, "setObject:forKey:", encodeURLForDefaults(a3), a4);
  objc_autoreleasePoolPop(v7);
}

- (uint64_t)setBool:()NSUserDefaults forKey:
{
  return objc_msgSend(a1, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:"), a4);
}

- (id)persistentDomainForName:()NSUserDefaults
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("NSGlobalDomain"));
  return (id)_CFXPreferencesCopyDictionaryForSourceWithBundleID();
}

- (CFPropertyListRef)objectForKey:()NSUserDefaults inDomain:
{
  const __CFString *v8;
  void *v10;

  if (!a4 || -[__CFString isEqualToString:](a4, "isEqualToString:", &stru_1E0F56070))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: domain name cannot be nil or empty"), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v10);
  }
  if (-[__CFString isEqualToString:](a4, "isEqualToString:", CFSTR("NSGlobalDomain")))
    v8 = (const __CFString *)*MEMORY[0x1E0C9B228];
  else
    v8 = a4;
  return (id)CFPreferencesCopyAppValue(a3, v8);
}

- (uint64_t)setDouble:()NSUserDefaults forKey:
{
  return objc_msgSend(a1, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), a3);
}

- (uint64_t)setFloat:()NSUserDefaults forKey:
{
  return objc_msgSend(a1, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), a3);
}

- (void)addSuiteNamed:()NSUserDefaults
{
  __CFBundle *MainBundle;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NSGlobalDomain")) & 1) != 0
    || (MainBundle = CFBundleGetMainBundle(),
        objc_msgSend(a3, "isEqualToString:", CFBundleGetIdentifier(MainBundle))))
  {
    _NSUserDefaults_Log_Nonsensical_Suites((uint64_t)a3);
  }
  else
  {
    objc_msgSend(a1, "_identifier");
    objc_msgSend(a1, "_container");
    _CFPreferencesAddSuitePreferencesToAppWithContainer();
  }
}

- (id)URLForKey:()NSUserDefaults
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSData())
    return +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "_strictlyUnarchivedObjectOfClasses:fromData:error:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()), v1, 0);
  if (_NSIsNSString())
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", objc_msgSend(v1, "stringByExpandingTildeInPath"));
  return 0;
}

- (uint64_t)setObject:()NSUserDefaults forKey:inDomain:
{
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  NSString *v14;

  if (!a5 || -[__CFString isEqualToString:](a5, "isEqualToString:", &stru_1E0F56070))
  {
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: domain name cannot be nil or empty"), _NSMethodExceptionProem(a1, a2));
    goto LABEL_12;
  }
  if (!-[__CFString isEqualToString:](a5, "isEqualToString:", CFSTR("NSGlobalDomain")))
  {
    if ((-[__CFString isEqualToString:](a5, "isEqualToString:", CFSTR("NSRegistrationDomain")) & 1) == 0
      && !-[__CFString isEqualToString:](a5, "isEqualToString:", CFSTR("NSArgumentDomain")))
    {
      CFPreferencesSetAppValue(a4, a3, a5);
      CFPreferencesAppSynchronize(a5);
      return -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUserDefaultsDidChangeNotification"), a1, 0);
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, a4);
      _CFXPreferencesReplaceValuesInNamedVolatileSource();
      return -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUserDefaultsDidChangeNotification"), a1, 0);
    }
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: value name cannot be nil for registration or argument domain"), _NSMethodExceptionProem(a1, a2));
LABEL_12:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
  }
  v10 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v11 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v12 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(a4, a3, (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSynchronize(v10, v11, v12);
  return -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUserDefaultsDidChangeNotification"), a1, 0);
}

- (uint64_t)removeObjectForKey:()NSUserDefaults inDomain:
{
  return objc_msgSend(a1, "setObject:forKey:inDomain:", 0, a3, a4);
}

- (uint64_t)longForKey:()NSUserDefaults
{
  uint64_t result;
  void *v2;
  unint64_t v3;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1, "objectForKey:");
  v4[0] = 0;
  if (result)
  {
    v2 = (void *)result;
    if (_NSIsNSNumber())
    {
      return objc_msgSend(v2, "longLongValue");
    }
    else if (_NSIsNSString())
    {
      v3 = 0;
      if (_NSScanLongLongFromString(v2, +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"), v4, &v3))return v4[0];
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setLong:()NSUserDefaults forKey:
{
  return objc_msgSend(a1, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:"), a4);
}

- (uint64_t)searchList
{
  if ((searchList_warnonce & 1) == 0)
  {
    searchList_warnonce = 1;
    NSLog((NSString *)CFSTR("-[NSUserDefaults searchList] is obsolete and returns nil; convert off of it."));
  }
  return 0;
}

- (void)setSearchList:()NSUserDefaults
{
  if ((setSearchList__warnonce & 1) == 0)
  {
    setSearchList__warnonce = 1;
    NSLog((NSString *)CFSTR("-[NSUserDefaults setSearchList:] is obsolete and has no effect; convert off of it."));
  }
}

- (uint64_t)removeSuiteNamed:()NSUserDefaults
{
  objc_msgSend(a1, "_identifier");
  objc_msgSend(a1, "_container");
  return _CFPreferencesRemoveSuitePreferencesFromAppWithContainer();
}

- (uint64_t)_didEndKeyValueObserving
{
  uint64_t result;

  result = objc_msgSend(a1, "_kvo");
  if (result)
  {
    _CFPrefsUnregisterUserDefaultsInstance();
    return objc_msgSend(a1, "_setKVO:", 0);
  }
  return result;
}

- (id)finalize
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "_kvo"))
    _CFPrefsUnregisterUserDefaultsInstance();
  v3.receiver = a1;
  v3.super_class = (Class)&off_1EDCFA068;
  return objc_msgSendSuper2(&v3, sel_finalize);
}

+ (void)setStandardUserDefaults:()NSUserDefaults
{
  id v4;

  os_unfair_lock_lock(&stru_1ECD0A244);
  v4 = a3;

  qword_1ECD0A248 = (uint64_t)a3;
  os_unfair_lock_unlock(&stru_1ECD0A244);
}

+ (id)_copyStandardUserDefaultsIfPresent
{
  id v0;

  os_unfair_lock_lock(&stru_1ECD0A244);
  v0 = (id)qword_1ECD0A248;
  os_unfair_lock_unlock(&stru_1ECD0A244);
  return v0;
}

- (id)volatileDomainNames
{
  return (id)_CFXPreferencesCopyVolatileSourceNames();
}

- (id)volatileDomainForName:()NSUserDefaults
{
  return (id)_CFXPreferencesCopyDictionaryForNamedVolatileSource();
}

- (uint64_t)setVolatileDomain:()NSUserDefaults forName:
{
  _CFXPreferencesReplaceValuesInNamedVolatileSource();
  return -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUserDefaultsDidChangeNotification"), a1, 0);
}

- (uint64_t)removeVolatileDomainForName:()NSUserDefaults
{
  _CFXPreferencesRemoveNamedVolatileSource();
  return -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUserDefaultsDidChangeNotification"), a1, 0);
}

- (CFArrayRef)persistentDomainNames
{
  CFArrayRef v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = CFPreferencesCopyApplicationList((CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v1 = -[__CFArray indexOfObject:](v0, "indexOfObject:", *MEMORY[0x1E0C9B228]);
  if (v1 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = v1;
    v3 = (void *)-[__CFArray mutableCopyWithZone:](v0, "mutableCopyWithZone:", 0);
    objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v2, CFSTR("NSGlobalDomain"));

    v0 = (CFArrayRef)objc_msgSend(v3, "copyWithZone:", 0);
  }
  return v0;
}

- (uint64_t)setPersistentDomain:()NSUserDefaults forName:
{
  void *v8;

  if (a3
    && objc_msgSend(a3, "count")
    && ((objc_msgSend(a4, "isEqual:", CFSTR("NSArgumentDomain")) & 1) != 0
     || objc_msgSend(a4, "isEqual:", CFSTR("NSRegistrationDomain"))))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: cannot create persistent domain %@. Volatile domain %@ already exists."), _NSMethodExceptionProem(a1, a2), a4, a4), 0);
    objc_exception_throw(v8);
  }
  objc_msgSend(a4, "isEqual:", CFSTR("NSGlobalDomain"));
  -[objc_class _container](a1, "_container");
  _CFXPreferencesReplaceValuesInSourceWithBundleIDWithContainer();
  -[objc_class _container](a1, "_container");
  _CFPreferencesSynchronizeWithContainer();
  return -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUserDefaultsDidChangeNotification"), a1, 0);
}

- (uint64_t)removePersistentDomainForName:()NSUserDefaults
{
  return objc_msgSend(a1, "setPersistentDomain:forName:", 0, a3);
}

- (BOOL)objectIsForcedForKey:()NSUserDefaults
{
  return CFPreferencesAppValueIsForced(a3, (CFStringRef)objc_msgSend(a1, "_identifier")) != 0;
}

- (BOOL)objectIsForcedForKey:()NSUserDefaults inDomain:
{
  return CFPreferencesAppValueIsForced(key, applicationID) != 0;
}

@end
