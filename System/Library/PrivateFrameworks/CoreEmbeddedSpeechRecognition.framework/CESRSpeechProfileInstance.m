@implementation CESRSpeechProfileInstance

- (CESRSpeechProfileInstance)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CESRSpeechProfileInstance)initWithSpeechProfileSiteURL:(id)a3 create:(BOOL)a4 locale:(id)a5 options:(unsigned __int8)a6 error:(id *)a7
{
  uint64_t v8;
  _BOOL8 v10;
  id v12;
  id v13;
  CESRSpeechProfileInstance *v14;
  void *v15;
  void *v16;
  void *v17;
  CESRDictionaryLog *v18;
  CESRDictionaryLog *log;
  id v20;
  void *v21;
  uint64_t v22;
  CCSetChangeRegistry *changeRegistry;
  CESRSpeechProfileInstance *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;
  uint64_t v35;
  _QWORD v36[2];

  v8 = a6;
  v10 = a4;
  v36[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v34.receiver = self;
  v34.super_class = (Class)CESRSpeechProfileInstance;
  v14 = -[CESRSpeechProfileInstance init](&v34, sel_init);
  if (!v14)
    goto LABEL_7;
  v14->_dataProtectionClass = SFProtectionClassForDataSiteURL();
  objc_storeStrong((id *)&v14->_locale, a5);
  -[NSLocale localeIdentifier](v14->_locale, "localeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB28A8];
    v35 = *MEMORY[0x1E0CB2D50];
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "localeIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Invalid locale: %@ in speechProfileSite: %@"), v28, v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, -1000, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (a7 && v31)
      *a7 = objc_retainAutorelease(v31);

    goto LABEL_13;
  }
  -[NSLocale localeIdentifier](v14->_locale, "localeIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("instance_"), "stringByAppendingString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[CESRDictionaryLog initWithFilename:protectionClass:directory:readOnly:create:error:]([CESRDictionaryLog alloc], "initWithFilename:protectionClass:directory:readOnly:create:error:", v17, v14->_dataProtectionClass, v12, 0, v10, a7);
  log = v14->_log;
  v14->_log = v18;

  if (!v14->_log || v10 && !-[CESRSpeechProfileInstance _updateOptions:error:](v14, "_updateOptions:error:", v8, a7))
  {

LABEL_13:
    v24 = 0;
    goto LABEL_14;
  }
  v20 = objc_alloc(MEMORY[0x1E0D0D410]);
  -[CESRSpeechProfileInstance _changeRegistryFilename](v14, "_changeRegistryFilename");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "initWithFilename:directory:protectionClass:error:", v21, v12, v14->_dataProtectionClass, a7);
  changeRegistry = v14->_changeRegistry;
  v14->_changeRegistry = (CCSetChangeRegistry *)v22;

  v24 = (CESRSpeechProfileInstance *)v14->_changeRegistry;
  if (v24)
LABEL_7:
    v24 = v14;
LABEL_14:

  return v24;
}

- (id)_changeRegistryFilename
{
  void *v2;
  void *v3;

  -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("registry_"), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CESRSpeechProfileInstanceOptionsDescription(-[CESRSpeechProfileInstance options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:[%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)remove:(id *)a3
{
  int v5;

  v5 = -[CCSetChangeRegistry clearAllBookmarksAndCommit:](self->_changeRegistry, "clearAllBookmarksAndCommit:");
  if (v5)
    LOBYTE(v5) = -[CESRDictionaryLog clear:](self->_log, "clear:", a3);
  return v5;
}

- (BOOL)_updateOptions:(unsigned __int8)a3 error:(id *)a4
{
  CESRDictionaryLog *log;
  void *v6;

  log = self->_log;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CESRDictionaryLog writeUpdatedObject:forKey:error:](log, "writeUpdatedObject:forKey:error:", v6, CFSTR("options"), a4);

  return (char)a4;
}

- (id)_updateVersion:(id)a3 forKeys:(id)a4 logKey:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CESRDictionaryLog mutableDictionaryForKey:error:](self->_log, "mutableDictionaryForKey:error:", a5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "setObject:forKey:", v8, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), (_QWORD)v17);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  return v10;
}

- (void)registerUpdateForSpeechCategories:(id)a3 version:(id)a4
{
  CESRDictionaryLog *log;
  id v5;

  log = self->_log;
  -[CESRSpeechProfileInstance _updateVersion:forKeys:logKey:](self, "_updateVersion:forKeys:logKey:", a4, a3, CFSTR("registered"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CESRDictionaryLog writeUpdatedObject:forKey:error:](log, "writeUpdatedObject:forKey:error:", v5, CFSTR("registered"), 0);

}

- (void)recordUpdateCompletedForSpeechCategories:(id)a3 version:(id)a4
{
  CESRDictionaryLog *log;
  id v5;

  log = self->_log;
  -[CESRSpeechProfileInstance _updateVersion:forKeys:logKey:](self, "_updateVersion:forKeys:logKey:", a4, a3, CFSTR("completed"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CESRDictionaryLog writeUpdatedObject:forKey:error:](log, "writeUpdatedObject:forKey:error:", v5, CFSTR("completed"), 0);

}

- (id)lastRegisteredVersionForSpeechCategory:(id)a3
{
  CESRDictionaryLog *log;
  id v4;
  void *v5;
  void *v6;

  log = self->_log;
  v4 = a3;
  -[CESRDictionaryLog mutableDictionaryForKey:error:](log, "mutableDictionaryForKey:error:", CFSTR("registered"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lastCompletedVersionForSpeechCategory:(id)a3
{
  CESRDictionaryLog *log;
  id v4;
  void *v5;
  void *v6;

  log = self->_log;
  v4 = a3;
  -[CESRDictionaryLog mutableDictionaryForKey:error:](log, "mutableDictionaryForKey:error:", CFSTR("completed"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)options
{
  void *v2;
  unsigned __int8 v3;

  -[CESRDictionaryLog objectForKey:](self->_log, "objectForKey:", CFSTR("options"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedCharValue");

  return v3;
}

- (BOOL)updateOptions:(unsigned __int8)a3 error:(id *)a4
{
  CESRDictionaryLog *log;
  void *v6;

  log = self->_log;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CESRDictionaryLog writeUpdatedObject:forKey:error:](log, "writeUpdatedObject:forKey:error:", v6, CFSTR("options"), a4);

  return (char)a4;
}

- (BOOL)isEqual:(id)a3
{
  CESRSpeechProfileInstance *v4;
  CESRSpeechProfileInstance *v5;
  BOOL v6;

  v4 = (CESRSpeechProfileInstance *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CESRSpeechProfileInstance isEqualToInstance:](self, "isEqualToInstance:", v5);

  return v6;
}

- (BOOL)isEqualToInstance:(id)a3
{
  id v4;
  NSLocale *locale;
  void *v6;
  int v7;
  BOOL v8;

  v4 = a3;
  locale = self->_locale;
  objc_msgSend(v4, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSLocale isEqual:](locale, "isEqual:", v6))
  {
    v7 = -[CESRSpeechProfileInstance options](self, "options");
    v8 = v7 == objc_msgSend(v4, "options");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSLocale hash](self->_locale, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[CESRSpeechProfileInstance options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (CCSetChangeRegistry)changeRegistry
{
  return self->_changeRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRegistry, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

+ (id)loadAllInstancesAtSpeechProfileSiteURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  id v28;
  id *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = a4;
  v30 = v6;
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = 1;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v8;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      v27 = v9;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", v14, v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "path");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v30, "fileExistsAtPath:isDirectory:", v16, &v35))
            v17 = v35 == 0;
          else
            v17 = 0;
          if (v17 && objc_msgSend(v14, "hasPrefix:", CFSTR("instance_")))
          {
            objc_msgSend(v14, "substringFromIndex:", objc_msgSend(CFSTR("instance_"), "length"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[CESRSpeechProfileInstance loadInstanceAtSpeechProfileSiteURL:locale:error:](CESRSpeechProfileInstance, "loadInstanceAtSpeechProfileSiteURL:locale:error:", v5, v19, v29);
            v20 = objc_claimAutoreleasedReturnValue();
            if (!v20)
            {

              v24 = 0;
              v8 = v26;
              v23 = v28;
              goto LABEL_22;
            }
            v21 = (void *)v20;
            objc_msgSend(v28, "addObject:", v20);

            v9 = v27;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v11)
          continue;
        break;
      }
    }

    v22 = *MEMORY[0x1E0CFE6C0];
    v23 = v28;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "+[CESRSpeechProfileInstance loadAllInstancesAtSpeechProfileSiteURL:error:]";
      v38 = 2112;
      v39 = v28;
      _os_log_impl(&dword_1B3E5F000, v22, OS_LOG_TYPE_INFO, "%s Managed profile instances: %@", buf, 0x16u);
    }
    v24 = v28;
    v8 = v26;
LABEL_22:

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)loadOrCreateInstanceAtSpeechProfileSiteURL:(id)a3 locale:(id)a4 options:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7;
  id v9;
  id v10;
  CESRSpeechProfileInstance *v11;

  v7 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CESRSpeechProfileInstance initWithSpeechProfileSiteURL:create:locale:options:error:]([CESRSpeechProfileInstance alloc], "initWithSpeechProfileSiteURL:create:locale:options:error:", v10, 1, v9, v7, a6);

  return v11;
}

+ (id)loadInstanceAtSpeechProfileSiteURL:(id)a3 locale:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  CESRSpeechProfileInstance *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[CESRSpeechProfileInstance initWithSpeechProfileSiteURL:create:locale:options:error:]([CESRSpeechProfileInstance alloc], "initWithSpeechProfileSiteURL:create:locale:options:error:", v8, 0, v7, 0, a5);

  return v9;
}

@end
