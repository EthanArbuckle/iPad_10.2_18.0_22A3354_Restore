@implementation MBDomain

+ (BOOL)_BOOLFromValue:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Domain %@ value not a number: %@"), v6, v5));
  v7 = objc_msgSend(v5, "BOOLValue");

  return v7;
}

+ (id)_stringByRemovingCommentsFromValue:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Domain %@ value not a string: %@"), v6, v5));
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("#"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_setOfStringsFromValue:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Domain %@ value not an array"), v6));
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        +[MBDomain _stringByRemovingCommentsFromValue:forKey:](MBDomain, "_stringByRemovingCommentsFromValue:forKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)_dictionaryOfStringsToStringFromValue:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MBException *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = -[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Domain %@ value not a dictionary"), v6);
LABEL_12:
    objc_exception_throw(v17);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = -[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Domain %@ item key not a string"), v6);
          goto LABEL_12;
        }
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[MBDomain _stringByRemovingCommentsFromValue:forKey:](MBDomain, "_stringByRemovingCommentsFromValue:forKey:", v14, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v6);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

+ (double)doubleFromStringValueForKey:(id)a3 plist:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MBDomain _stringByRemovingCommentsFromValue:forKey:](MBDomain, "_stringByRemovingCommentsFromValue:forKey:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9;
}

+ (id)_relativePathsByAddingSQLiteJournals:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MBSQLitePathExtensions();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      v20 = v7;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        objc_msgSend(v10, "pathExtension", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "containsObject:", v11);

        if (v12)
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          MBSQLiteJournalSuffixes();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v23;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v23 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(v10, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addObject:", v18);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v15);
          }

          v7 = v20;
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  return v5;
}

+ (BOOL)isContainerizedName:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "containerIDWithName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)isAppName:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("AppDomain"));
}

+ (BOOL)isAppPlaceholderName:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("AppDomainPlaceholder"));
}

+ (BOOL)isPlaceholderName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("PlaceholderDomain"));
}

+ (BOOL)isAppPluginName:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("AppDomainPlugin"));
}

+ (BOOL)isAppGroupName:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("AppDomainGroup"));
}

+ (BOOL)isSystemContainerName:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("SysContainerDomain"));
}

+ (BOOL)isSystemSharedContainerName:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("SysSharedContainerDomain"));
}

+ (id)containerIDWithName:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(&unk_1E996E190, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(&unk_1E996E190);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      if (objc_msgSend(v3, "hasPrefix:", v8))
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(&unk_1E996E190, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v9 = objc_msgSend(v8, "length");
    if (v9 >= objc_msgSend(v3, "length"))
      goto LABEL_12;
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v8, "length") + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_12:
    v10 = 0;
  }

  return v10;
}

+ (int)containerTypeWithName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (+[MBDomain isAppPluginName:](MBDomain, "isAppPluginName:", v3))
  {
    v4 = 2;
  }
  else if (+[MBDomain isAppGroupName:](MBDomain, "isAppGroupName:", v3))
  {
    v4 = 3;
  }
  else if (+[MBDomain isSystemContainerName:](MBDomain, "isSystemContainerName:", v3))
  {
    v4 = 4;
  }
  else if (+[MBDomain isSystemSharedContainerName:](MBDomain, "isSystemSharedContainerName:", v3))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (id)nameWithAppID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AppDomain"), a3);
}

+ (id)placeholderNameWithAppID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AppDomainPlaceholder"), a3);
}

+ (id)_domainWithName:(id)a3 volumeMountPoint:(id)a4 rootPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
    +[MBDomain _domainWithName:volumeMountPoint:rootPath:].cold.1();
  v10 = v9;
  if (v9)
  {
    if ((objc_msgSend(v8, "hasPrefix:", CFSTR("/")) & 1) == 0)
      +[MBDomain _domainWithName:volumeMountPoint:rootPath:].cold.3();
    if ((MBPathHasVolumePrefix(v10, v8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[MBDomain _domainWithName:volumeMountPoint:rootPath:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("MBDomain.m"), 143, CFSTR("%@ is not a prefix of %@"), v8, v10);

    }
  }
  v11 = MBVolumeTypeFromMountPoint(v8);
  if (!v11)
    +[MBDomain _domainWithName:volumeMountPoint:rootPath:].cold.2();
  v12 = -[MBDomain _initWithName:volumeMountPoint:volumeType:rootPath:]([MBDomain alloc], "_initWithName:volumeMountPoint:volumeType:rootPath:", v7, v8, v11, v10);

  return v12;
}

+ (id)appDomainWithIdentifier:(id)a3 volumeMountPoint:(id)a4 rootPath:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AppDomain"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MBDomain _domainWithName:volumeMountPoint:rootPath:](MBDomain, "_domainWithName:volumeMountPoint:rootPath:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)appPlaceholderDomainWithIdentifier:(id)a3 volumeMountPoint:(id)a4 rootPath:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AppDomainPlaceholder"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MBDomain _domainWithName:volumeMountPoint:rootPath:](MBDomain, "_domainWithName:volumeMountPoint:rootPath:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)appPluginDomainWithIdentifier:(id)a3 volumeMountPoint:(id)a4 rootPath:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AppDomainPlugin"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MBDomain _domainWithName:volumeMountPoint:rootPath:](MBDomain, "_domainWithName:volumeMountPoint:rootPath:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)appGroupDomainWithIdentifier:(id)a3 volumeMountPoint:(id)a4 rootPath:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AppDomainGroup"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MBDomain _domainWithName:volumeMountPoint:rootPath:](MBDomain, "_domainWithName:volumeMountPoint:rootPath:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)systemContainerDomainWithIdentifier:(id)a3 volumeMountPoint:(id)a4 rootPath:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("SysContainerDomain"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MBDomain _domainWithName:volumeMountPoint:rootPath:](MBDomain, "_domainWithName:volumeMountPoint:rootPath:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)systemSharedContainerDomainWithIdentifier:(id)a3 volumeMountPoint:(id)a4 rootPath:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("SysSharedContainerDomain"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MBDomain _domainWithName:volumeMountPoint:rootPath:](MBDomain, "_domainWithName:volumeMountPoint:rootPath:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)skippedFilesDomainWithVolumeMountPoint:(id)a3 rootPath:(id)a4
{
  return +[MBDomain _domainWithName:volumeMountPoint:rootPath:](MBDomain, "_domainWithName:volumeMountPoint:rootPath:", CFSTR("SkippedFilesDomain"), a3, a4);
}

+ (id)uninstalledDomainWithName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[MBDomain _initWithName:volumeMountPoint:volumeType:rootPath:]([MBDomain alloc], "_initWithName:volumeMountPoint:volumeType:rootPath:", v3, 0, 0, 0);

  return v4;
}

+ (id)nonContainerizedDomainWithName:(id)a3 plist:(id)a4 accountType:(int64_t)a5 volumeMountPoint:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[MBDomain _initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:]([MBDomain alloc], "_initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:", v11, v10, a5, v9);

  return v12;
}

+ (BOOL)_shouldRestoreRelativeSymlinksForDomainName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("MediaDomain")) ^ 1;
}

- (id)_initWithName:(id)a3 volumeMountPoint:(id)a4 volumeType:(unint64_t)a5 rootPath:(id)a6
{
  id v11;
  id v12;
  id v13;
  MBDomain *v14;
  MBDomain *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MBDomain;
  v14 = -[MBDomain init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_volumeMountPoint, a4);
    v15->_volumeType = a5;
    objc_storeStrong((id *)&v15->_rootPath, a6);
    v15->_shouldDigest = 1;
    v15->_shouldRestoreRelativeSymlinks = +[MBDomain _shouldRestoreRelativeSymlinksForDomainName:](MBDomain, "_shouldRestoreRelativeSymlinksForDomainName:", v11);
  }

  return v15;
}

- (id)_initNonContainerizedDomainWithName:(id)a3 plist:(id)a4 accountType:(int64_t)a5 volumeMountPoint:(id)a6
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  MBDomain *v18;
  MBDomain *v19;
  uint64_t v20;
  MBDomain *v21;
  MBException *v23;
  const __CFString *v24;
  id v25;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [MBException alloc];
    v24 = CFSTR("Domain name not a string");
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [MBException alloc];
    v24 = CFSTR("Domain plist not a dictionary");
    goto LABEL_22;
  }
  if (!a5)
    -[MBDomain _initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:].cold.1();
  v14 = (__CFString *)v13;
  v15 = v14;
  if (a5 == 1)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("RootPath"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v15 = v14;
    if (v16)
    {
      v15 = v14;
      if ((MBPathHasVolumePrefix(v16, v14) & 1) == 0)
      {

        v15 = CFSTR("/private/var");
        if ((MBPathHasVolumePrefix(v17, CFSTR("/private/var")) & 1) == 0)
          -[MBDomain _initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:].cold.3();
      }
    }

  }
  v26.receiver = self;
  v26.super_class = (Class)MBDomain;
  v18 = -[MBDomain init](&v26, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_13;
  objc_storeStrong((id *)&v18->_name, a3);
  v19->_shouldDigest = 1;
  v19->_shouldRestoreRelativeSymlinks = +[MBDomain _shouldRestoreRelativeSymlinksForDomainName:](MBDomain, "_shouldRestoreRelativeSymlinksForDomainName:", v11);
  if (!-[MBDomain _loadSystemDomain:plist:volumeMountPoint:](v19, "_loadSystemDomain:plist:volumeMountPoint:", v11, v12, v15))
  {
    v21 = 0;
    goto LABEL_15;
  }
  if (!v19->_rootPath)
  {
    v23 = [MBException alloc];
    v25 = v11;
    v24 = CFSTR("Root path not specified for domain: %@");
LABEL_22:
    objc_exception_throw(-[MBException initWithCode:format:](v23, "initWithCode:format:", 11, v24, v25));
  }
  objc_storeStrong((id *)&v19->_volumeMountPoint, v15);
  v20 = MBVolumeTypeFromMountPoint(v19->_volumeMountPoint);
  v19->_volumeType = v20;
  if (!v20)
    -[MBDomain _initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:].cold.2();
LABEL_13:
  v21 = v19;
LABEL_15:

  return v21;
}

+ (id)domainForTestingWithName:(id)a3 plist:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MBDomain _initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:]([MBDomain alloc], "_initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:", v6, v5, 1, CFSTR("/private/var/mobile"));

  return v7;
}

+ (id)domainForTestingWithName:(id)a3 volumeMountPoint:(id)a4 rootPath:(id)a5
{
  return +[MBDomain _domainWithName:volumeMountPoint:rootPath:](MBDomain, "_domainWithName:volumeMountPoint:rootPath:", a3, a4, a5);
}

- (BOOL)_loadSystemDomain:(id)a3 plist:(id)a4 volumeMountPoint:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  NSObject *v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  NSObject *v24;
  NSString *name;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSString *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSString *v50;
  NSSet *relativePathsToOnlyBackupEncrypted;
  void *v52;
  NSString *v53;
  NSSet *relativePathsToBackupAndRestore;
  NSSet *v55;
  NSSet *v56;
  NSSet *v57;
  NSSet *v58;
  NSSet *v59;
  NSSet *v60;
  NSSet *v61;
  NSSet *v62;
  NSSet *v63;
  NSSet *v64;
  NSSet *v65;
  NSSet *v66;
  NSSet *v67;
  NSSet *v68;
  NSSet *v69;
  NSSet *v70;
  NSSet *v71;
  NSSet *v72;
  NSSet *v73;
  NSDictionary *v74;
  void *relativePathAggregateDictionaryGroups;
  NSDictionary *v76;
  void *v77;
  NSSet *v78;
  NSSet *relativePathsToBackupIgnoringProtectionClass;
  NSSet *v80;
  NSSet *v81;
  NSSet *v82;
  uint64_t v83;
  NSObject *v84;
  NSString *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  NSString *v93;
  NSString *rootPath;
  MBException *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t v107[128];
  uint8_t buf[4];
  NSString *v109;
  __int16 v110;
  void *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    -[MBDomain _loadSystemDomain:plist:volumeMountPoint:].cold.1();
  if (!v9)
    -[MBDomain _loadSystemDomain:plist:volumeMountPoint:].cold.2();
  v11 = v10;
  if (!v10)
    -[MBDomain _loadSystemDomain:plist:volumeMountPoint:].cold.3();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BackupRulesPath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_16;
  self->_isExternalConfig = 1;
  if (!-[MBDomain _loadDomainFromExternalPlist:](self, "_loadDomainFromExternalPlist:", v12))
  {
    MBGetDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412546;
      v109 = name;
      v110 = 2112;
      v111 = v12;
      _os_log_impl(&dword_1D5213000, v24, OS_LOG_TYPE_DEFAULT, "Failed to load backup rules for '%@' from external plist at '%@'", buf, 0x16u);
      v98 = v12;
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Failed to load backup rules for '%@' from external plist at '%@'", v26, v27, v28, v29, v30, v31, (uint64_t)self->_name);
    }

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HasFallbackConfig"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RootPath"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      +[MBDomain _stringByRemovingCommentsFromValue:forKey:](MBDomain, "_stringByRemovingCommentsFromValue:forKey:", v92, CFSTR("RootPath"));
      v93 = (NSString *)objc_claimAutoreleasedReturnValue();
      rootPath = self->_rootPath;
      self->_rootPath = v93;

      v23 = 1;
      goto LABEL_98;
    }
    MBGetDefaultLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = self->_name;
      *(_DWORD *)buf = 138412290;
      v109 = v34;
      _os_log_impl(&dword_1D5213000, v33, OS_LOG_TYPE_DEFAULT, "Unable to load external config for domain '%@', falling back to system definition", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Unable to load external config for domain '%@', falling back to system definition", v35, v36, v37, v38, v39, v40, (uint64_t)self->_name);
    }

    self->_isExternalConfig = 0;
LABEL_16:
    v41 = v11;
    v101 = v8;
    v99 = v11;
    if (objc_msgSend(v41, "hasPrefix:", CFSTR("/private")))
    {
      objc_msgSend(v41, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length"));
      v42 = objc_claimAutoreleasedReturnValue();

      v41 = (id)v42;
    }
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v100 = v9;
    v43 = v9;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
    if (!v44)
    {
LABEL_91:

      v23 = 1;
      v9 = v100;
      v8 = v101;
      v11 = v99;
      goto LABEL_98;
    }
    v45 = v44;
    v46 = *(_QWORD *)v104;
    v102 = v41;
LABEL_20:
    v47 = 0;
    while (1)
    {
      if (*(_QWORD *)v104 != v46)
        objc_enumerationMutation(v43);
      v48 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v47);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v96 = -[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Domain plist key not a string"), v97, v98);
        goto LABEL_103;
      }
      objc_msgSend(v43, "objectForKeyedSubscript:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v48, "isEqualToString:", CFSTR("RootPath")))
      {
        +[MBDomain _stringByRemovingCommentsFromValue:forKey:](MBDomain, "_stringByRemovingCommentsFromValue:forKey:", v49, v48);
        v50 = (NSString *)objc_claimAutoreleasedReturnValue();
        relativePathsToOnlyBackupEncrypted = (NSSet *)self->_rootPath;
        self->_rootPath = v50;
      }
      else
      {
        if (objc_msgSend(v48, "isEqualToString:", CFSTR("RootPathRelativeToVolumeMountPoint")))
        {
          +[MBDomain _stringByRemovingCommentsFromValue:forKey:](MBDomain, "_stringByRemovingCommentsFromValue:forKey:", v49, v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringByAppendingPathComponent:", v52);
          v53 = (NSString *)objc_claimAutoreleasedReturnValue();
          relativePathsToBackupAndRestore = (NSSet *)self->_rootPath;
          self->_rootPath = v53;
LABEL_29:

          goto LABEL_33;
        }
        if ((objc_msgSend(v48, "isEqualToString:", CFSTR("BackupRulesPlistPath")) & 1) != 0)
          goto LABEL_33;
        if (objc_msgSend(v48, "isEqualToString:", CFSTR("ShouldDigest")))
        {
          self->_shouldDigest = +[MBDomain _BOOLFromValue:forKey:](MBDomain, "_BOOLFromValue:forKey:", v49, v48);
          goto LABEL_33;
        }
        if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsToBackupAndRestore")))
        {
          +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v102;
          +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
          v55 = (NSSet *)objc_claimAutoreleasedReturnValue();
          relativePathsToBackupAndRestore = self->_relativePathsToBackupAndRestore;
          self->_relativePathsToBackupAndRestore = v55;
          goto LABEL_29;
        }
        if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToBackup")))
        {
          +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v102;
          +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
          v56 = (NSSet *)objc_claimAutoreleasedReturnValue();
          relativePathsToBackupAndRestore = self->_relativePathsNotToBackup;
          self->_relativePathsNotToBackup = v56;
          goto LABEL_29;
        }
        if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToBackupToDrive")))
        {
          +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v102;
          +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
          v57 = (NSSet *)objc_claimAutoreleasedReturnValue();
          relativePathsToBackupAndRestore = self->_relativePathsNotToBackupToDrive;
          self->_relativePathsNotToBackupToDrive = v57;
          goto LABEL_29;
        }
        if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToBackupToService")))
        {
          +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v102;
          +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
          v58 = (NSSet *)objc_claimAutoreleasedReturnValue();
          relativePathsToBackupAndRestore = self->_relativePathsNotToBackupToService;
          self->_relativePathsNotToBackupToService = v58;
          goto LABEL_29;
        }
        if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToBackupToLocal")))
        {
          +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v102;
          +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
          v59 = (NSSet *)objc_claimAutoreleasedReturnValue();
          relativePathsToBackupAndRestore = self->_relativePathsNotToBackupToLocal;
          self->_relativePathsNotToBackupToLocal = v59;
          goto LABEL_29;
        }
        if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsToOnlyBackupEncrypted")))
        {
          +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
          v60 = (NSSet *)objc_claimAutoreleasedReturnValue();
          relativePathsToOnlyBackupEncrypted = self->_relativePathsToOnlyBackupEncrypted;
          self->_relativePathsToOnlyBackupEncrypted = v60;
        }
        else if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToCheckIfModifiedDuringBackup")))
        {
          +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
          v61 = (NSSet *)objc_claimAutoreleasedReturnValue();
          relativePathsToOnlyBackupEncrypted = self->_relativePathsNotToCheckIfModifiedDuringBackup;
          self->_relativePathsNotToCheckIfModifiedDuringBackup = v61;
        }
        else
        {
          if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsToRestoreOnly")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v102;
            +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
            v62 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToBackupAndRestore = self->_relativePathsToRestoreOnly;
            self->_relativePathsToRestoreOnly = v62;
            goto LABEL_29;
          }
          if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsToRestoreOnlyFromService")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v102;
            +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
            v63 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToBackupAndRestore = self->_relativePathsToRestoreOnlyFromService;
            self->_relativePathsToRestoreOnlyFromService = v63;
            goto LABEL_29;
          }
          if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsToRemoveOnRestore")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v102;
            +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
            v64 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToBackupAndRestore = self->_relativePathsToRemoveOnRestore;
            self->_relativePathsToRemoveOnRestore = v64;
            goto LABEL_29;
          }
          if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsOfSystemFilesToAlwaysRestore")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v102;
            +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
            v65 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToBackupAndRestore = self->_relativePathsOfSystemFilesToAlwaysRestore;
            self->_relativePathsOfSystemFilesToAlwaysRestore = v65;
            goto LABEL_29;
          }
          if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsOfSystemFilesToAlwaysRemoveOnRestore")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v102;
            +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
            v66 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToBackupAndRestore = self->_relativePathsOfSystemFilesToAlwaysRemoveOnRestore;
            self->_relativePathsOfSystemFilesToAlwaysRemoveOnRestore = v66;
            goto LABEL_29;
          }
          if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToRestore")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v102;
            +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
            v67 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToBackupAndRestore = self->_relativePathsNotToRestore;
            self->_relativePathsNotToRestore = v67;
            goto LABEL_29;
          }
          if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToRestoreFromLocal")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v102;
            +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v52);
            v68 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToBackupAndRestore = self->_relativePathsNotToRestoreFromLocal;
            self->_relativePathsNotToRestoreFromLocal = v68;
            goto LABEL_29;
          }
          if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToMigrate")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v69 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToOnlyBackupEncrypted = self->_relativePathsNotToMigrate;
            self->_relativePathsNotToMigrate = v69;
          }
          else if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToRestoreToIPods")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v70 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToOnlyBackupEncrypted = self->_relativePathsNotToRestoreToIPods;
            self->_relativePathsNotToRestoreToIPods = v70;
          }
          else if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToBackupAndRestoreToAppleTVs")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v71 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToOnlyBackupEncrypted = self->_relativePathsNotToBackupAndRestoreToAppleTVs;
            self->_relativePathsNotToBackupAndRestoreToAppleTVs = v71;
          }
          else if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsToBackgroundRestore")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v72 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToOnlyBackupEncrypted = self->_relativePathsToBackgroundRestore;
            self->_relativePathsToBackgroundRestore = v72;
          }
          else
          {
            if (!objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToRemoveIfNotRestored")))
            {
              if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathAggregateDictionaryGroups")))
              {
                +[MBDomain _dictionaryOfStringsToStringFromValue:forKey:](MBDomain, "_dictionaryOfStringsToStringFromValue:forKey:", v49, v48);
                v74 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                relativePathAggregateDictionaryGroups = self->_relativePathAggregateDictionaryGroups;
                self->_relativePathAggregateDictionaryGroups = v74;
                goto LABEL_77;
              }
              if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathDomainRedirects")))
              {
                +[MBDomain _dictionaryOfStringsToStringFromValue:forKey:](MBDomain, "_dictionaryOfStringsToStringFromValue:forKey:", v49, v48);
                v76 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                relativePathAggregateDictionaryGroups = self->_relativePathDomainRedirects;
                self->_relativePathDomainRedirects = v76;
                goto LABEL_77;
              }
              if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsToBackupIgnoringProtectionClass")))
              {
                +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v77);
                v78 = (NSSet *)objc_claimAutoreleasedReturnValue();
                relativePathsToBackupIgnoringProtectionClass = self->_relativePathsToBackupIgnoringProtectionClass;
                self->_relativePathsToBackupIgnoringProtectionClass = v78;
                goto LABEL_81;
              }
              if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsToIgnoreExclusionsForDrive")))
              {
                +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
                v80 = (NSSet *)objc_claimAutoreleasedReturnValue();
                relativePathAggregateDictionaryGroups = self->_relativePathsToIgnoreExclusionsForDrive;
                self->_relativePathsToIgnoreExclusionsForDrive = v80;
LABEL_77:

              }
              else
              {
                v41 = v102;
                if ((objc_msgSend(v48, "isEqualToString:", CFSTR("BackupRulesPath")) & 1) != 0
                  || (objc_msgSend(v48, "isEqualToString:", CFSTR("HasFallbackConfig")) & 1) != 0)
                {
                  goto LABEL_33;
                }
                if (objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsToBackupToDriveAndStandardAccount")))
                {
                  +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v77);
                  v81 = (NSSet *)objc_claimAutoreleasedReturnValue();
                  relativePathsToBackupIgnoringProtectionClass = self->_relativePathsToBackupToDriveAndStandardAccount;
                  self->_relativePathsToBackupToDriveAndStandardAccount = v81;
                }
                else
                {
                  if (!objc_msgSend(v48, "isEqualToString:", CFSTR("RelativePathsNotToBackupInMegaBackup")))
                  {
                    v96 = -[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Unexpected domain plist key: %@"), v48, v98);
LABEL_103:
                    objc_exception_throw(v96);
                  }
                  +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", v77);
                  v82 = (NSSet *)objc_claimAutoreleasedReturnValue();
                  relativePathsToBackupIgnoringProtectionClass = self->_relativePathsNotToBackupInMegaBackup;
                  self->_relativePathsNotToBackupInMegaBackup = v82;
                }
LABEL_81:

              }
              v41 = v102;
              goto LABEL_33;
            }
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v49, v48);
            v73 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToOnlyBackupEncrypted = self->_relativePathsNotToRemoveIfNotRestored;
            self->_relativePathsNotToRemoveIfNotRestored = v73;
          }
        }
      }

LABEL_33:
      if (v45 == ++v47)
      {
        v83 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
        v45 = v83;
        if (!v83)
          goto LABEL_91;
        goto LABEL_20;
      }
    }
  }
  v13 = self->_rootPath;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RootPath"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

  if ((v13 & 1) != 0)
  {
    MBGetDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_name;
      *(_DWORD *)buf = 138412546;
      v109 = v16;
      v110 = 2112;
      v111 = v12;
      _os_log_impl(&dword_1D5213000, v15, OS_LOG_TYPE_DEFAULT, "Loaded backup rules for '%@' from external plist at '%@'", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Loaded backup rules for '%@' from external plist at '%@'", v17, v18, v19, v20, v21, v22, (uint64_t)self->_name);
    }

    v23 = 1;
    self->_hasExternalConfig = 1;
  }
  else
  {
    if (MBIsInternalInstall())
    {
      MBGetDefaultLog();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT))
      {
        v85 = self->_name;
        *(_DWORD *)buf = 138412546;
        v109 = v85;
        v110 = 2112;
        v111 = v12;
        _os_log_impl(&dword_1D5213000, v84, OS_LOG_TYPE_FAULT, "Backup rules plist does not match parent RootPath for '%@' at '%@'. Domain will be skipped.", buf, 0x16u);
        _MBLog(CFSTR("FAULT"), (uint64_t)"Backup rules plist does not match parent RootPath for '%@' at '%@'. Domain will be skipped.", v86, v87, v88, v89, v90, v91, (uint64_t)self->_name);
      }

    }
    v23 = 0;
  }
LABEL_98:

  return v23;
}

- (BOOL)_loadDomainFromExternalPlist:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *rootPath;
  NSSet *v26;
  NSSet *relativePathsToBackupAndRestore;
  NSSet *v28;
  NSSet *v29;
  NSSet *v30;
  NSSet *v31;
  NSSet *v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  NSObject *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  NSObject *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0;
    objc_msgSend(v7, "dictionaryWithContentsOfURL:error:", v8, &v75);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v75;

    if (!v9)
    {
      if (MBIsInternalInstall())
      {
        MBGetDefaultLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v79 = (uint64_t)v4;
          v80 = 2112;
          v81 = v10;
          _os_log_impl(&dword_1D5213000, v41, OS_LOG_TYPE_FAULT, "System plist specifies external plist at '%@' but error loading plist: %@. Domain will be skipped.", buf, 0x16u);
          _MBLog(CFSTR("FAULT"), (uint64_t)"System plist specifies external plist at '%@' but error loading plist: %@. Domain will be skipped.", v42, v43, v44, v45, v46, v47, (uint64_t)v4);
        }
        goto LABEL_60;
      }
      v34 = 0;
      goto LABEL_62;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E996E1A8);
    v66 = objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v72 != v14)
            objc_enumerationMutation(v11);
          v16 = *(NSObject **)(*((_QWORD *)&v71 + 1) + 8 * i);
          if ((-[NSObject containsObject:](v66, "containsObject:", v16) & 1) == 0)
          {
            if (MBIsInternalInstall())
            {
              MBGetDefaultLog();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
              {
LABEL_51:
                *(_DWORD *)buf = 138412546;
                v79 = (uint64_t)v4;
                v80 = 2112;
                v81 = v16;
                _os_log_impl(&dword_1D5213000, v48, OS_LOG_TYPE_FAULT, "External plist at '%@' includes invalid key: '%@'. Domain will be skipped.", buf, 0x16u);
                _MBLog(CFSTR("FAULT"), (uint64_t)"External plist at '%@' includes invalid key: '%@'. Domain will be skipped.", v49, v50, v51, v52, v53, v54, (uint64_t)v4);
              }
LABEL_52:

            }
LABEL_53:

            v34 = 0;
LABEL_54:
            v41 = v66;
            goto LABEL_61;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (MBIsInternalInstall())
            {
              MBGetDefaultLog();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
                goto LABEL_51;
              goto LABEL_52;
            }
            goto LABEL_53;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      }
      while (v13);
    }
    v63 = v9;
    v64 = v10;
    v65 = (uint64_t)v4;

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v17 = v11;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (!v18)
      goto LABEL_36;
    v19 = v18;
    v20 = *(_QWORD *)v68;
LABEL_14:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v68 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v21);
      objc_msgSend(v17, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqualToString:", CFSTR("RootPath")))
      {
        +[MBDomain _stringByRemovingCommentsFromValue:forKey:](MBDomain, "_stringByRemovingCommentsFromValue:forKey:", v23, v22);
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
        rootPath = self->_rootPath;
        self->_rootPath = v24;
      }
      else
      {
        if (objc_msgSend(v22, "isEqualToString:", CFSTR("RelativePathsToBackupAndRestore")))
        {
          +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v23, v22);
          rootPath = (void *)objc_claimAutoreleasedReturnValue();
          +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", rootPath);
          v26 = (NSSet *)objc_claimAutoreleasedReturnValue();
          relativePathsToBackupAndRestore = self->_relativePathsToBackupAndRestore;
          self->_relativePathsToBackupAndRestore = v26;
LABEL_27:

          goto LABEL_28;
        }
        if (!objc_msgSend(v22, "isEqualToString:", CFSTR("RelativePathsToOnlyBackupEncrypted")))
        {
          if (objc_msgSend(v22, "isEqualToString:", CFSTR("RelativePathsNotToBackup")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v23, v22);
            rootPath = (void *)objc_claimAutoreleasedReturnValue();
            +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", rootPath);
            v29 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToBackupAndRestore = self->_relativePathsNotToBackup;
            self->_relativePathsNotToBackup = v29;
          }
          else if (objc_msgSend(v22, "isEqualToString:", CFSTR("RelativePathsNotToBackupToDrive")))
          {
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v23, v22);
            rootPath = (void *)objc_claimAutoreleasedReturnValue();
            +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", rootPath);
            v30 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToBackupAndRestore = self->_relativePathsNotToBackupToDrive;
            self->_relativePathsNotToBackupToDrive = v30;
          }
          else
          {
            if (objc_msgSend(v22, "isEqualToString:", CFSTR("RelativePathsToBackgroundRestore")))
            {
              +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v23, v22);
              v31 = (NSSet *)objc_claimAutoreleasedReturnValue();
              rootPath = self->_relativePathsToBackgroundRestore;
              self->_relativePathsToBackgroundRestore = v31;
              goto LABEL_28;
            }
            if (!objc_msgSend(v22, "isEqualToString:", CFSTR("RelativePathsToRemoveOnRestore")))
              goto LABEL_29;
            +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v23, v22);
            rootPath = (void *)objc_claimAutoreleasedReturnValue();
            +[MBDomain _relativePathsByAddingSQLiteJournals:](MBDomain, "_relativePathsByAddingSQLiteJournals:", rootPath);
            v32 = (NSSet *)objc_claimAutoreleasedReturnValue();
            relativePathsToBackupAndRestore = self->_relativePathsToRemoveOnRestore;
            self->_relativePathsToRemoveOnRestore = v32;
          }
          goto LABEL_27;
        }
        +[MBDomain _setOfStringsFromValue:forKey:](MBDomain, "_setOfStringsFromValue:forKey:", v23, v22);
        v28 = (NSSet *)objc_claimAutoreleasedReturnValue();
        rootPath = self->_relativePathsToOnlyBackupEncrypted;
        self->_relativePathsToOnlyBackupEncrypted = v28;
      }
LABEL_28:

LABEL_29:
      if (v19 == ++v21)
      {
        v33 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
        v19 = v33;
        if (!v33)
        {
LABEL_36:

          if (self->_rootPath)
          {
            v34 = 1;
            v10 = v64;
            v4 = (id)v65;
            v9 = v63;
            goto LABEL_54;
          }
          v10 = v64;
          v4 = (id)v65;
          v9 = v63;
          v41 = v66;
          if (MBIsInternalInstall())
          {
            MBGetDefaultLog();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v79 = v65;
              _os_log_impl(&dword_1D5213000, v55, OS_LOG_TYPE_FAULT, "System plist specifies external plist at '%@' but plist is MALFORMED. Domain will be skipped.", buf, 0xCu);
              _MBLog(CFSTR("FAULT"), (uint64_t)"System plist specifies external plist at '%@' but plist is MALFORMED. Domain will be skipped.", v56, v57, v58, v59, v60, v61, v65);
            }

          }
LABEL_60:
          v34 = 0;
LABEL_61:

LABEL_62:
LABEL_63:

          goto LABEL_64;
        }
        goto LABEL_14;
      }
    }
  }
  if (MBIsInternalInstall())
  {
    MBGetDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v79 = (uint64_t)v4;
      _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_FAULT, "System plist specifies external plist at '%@' that DOES NOT EXIST on the filesystem. Domain will be skipped.", buf, 0xCu);
      _MBLog(CFSTR("FAULT"), (uint64_t)"System plist specifies external plist at '%@' that DOES NOT EXIST on the filesystem. Domain will be skipped.", v35, v36, v37, v38, v39, v40, (uint64_t)v4);
    }
    v34 = 0;
    goto LABEL_63;
  }
  v34 = 0;
LABEL_64:

  return v34;
}

- (void)dealloc
{
  objc_super v3;

  -[MBDomain releaseCachedFileDescriptors](self, "releaseCachedFileDescriptors");
  v3.receiver = self;
  v3.super_class = (Class)MBDomain;
  -[MBDomain dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[MBDomain isEqualToDomain:](self, "isEqualToDomain:", v4);

  return v5;
}

- (BOOL)isEqualToDomain:(id)a3
{
  return -[NSString isEqualToString:](self->_name, "isEqualToString:", *((_QWORD *)a3 + 8));
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  NSComparisonResult v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSString compare:](self->_name, "compare:", v4[8]);
  else
    v5 = NSOrderedSame;

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (id)description
{
  return self->_name;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Domain (name: %@, rootPath: %@, volumeMountPoint: %@"), self->_name, self->_rootPath, self->_volumeMountPoint);
}

- (int)containerType
{
  if (-[MBDomain isPluginAppDomain](self, "isPluginAppDomain"))
    return 2;
  if (-[MBDomain isGroupAppDomain](self, "isGroupAppDomain"))
    return 3;
  if (-[MBDomain isSystemContainerDomain](self, "isSystemContainerDomain"))
    return 4;
  if (-[MBDomain isSystemSharedContainerDomain](self, "isSystemSharedContainerDomain"))
    return 5;
  return 1;
}

- (NSSet)relativePathsToBackup
{
  return -[NSSet setByAddingObjectsFromSet:](self->_relativePathsToBackupAndRestore, "setByAddingObjectsFromSet:", self->_relativePathsToOnlyBackupEncrypted);
}

- (NSSet)relativePathsToRestore
{
  return -[NSSet setByAddingObjectsFromSet:](self->_relativePathsToBackupAndRestore, "setByAddingObjectsFromSet:", self->_relativePathsToRestoreOnly);
}

- (BOOL)isContainerizedDomain
{
  return +[MBDomain isContainerizedName:](MBDomain, "isContainerizedName:", self->_name);
}

- (BOOL)isAppDomain
{
  return +[MBDomain isAppName:](MBDomain, "isAppName:", self->_name);
}

- (BOOL)isPlaceholderAppDomain
{
  return +[MBDomain isAppPlaceholderName:](MBDomain, "isAppPlaceholderName:", self->_name);
}

- (BOOL)isPlaceholderDomain
{
  return +[MBDomain isPlaceholderName:](MBDomain, "isPlaceholderName:", self->_name);
}

- (BOOL)isPluginAppDomain
{
  return +[MBDomain isAppPluginName:](MBDomain, "isAppPluginName:", self->_name);
}

- (BOOL)isGroupAppDomain
{
  return +[MBDomain isAppGroupName:](MBDomain, "isAppGroupName:", self->_name);
}

- (BOOL)isUninstalledAppDomain
{
  _BOOL4 v3;

  v3 = -[MBDomain isAppDomain](self, "isAppDomain");
  if (v3)
    LOBYTE(v3) = self->_rootPath == 0;
  return v3;
}

- (BOOL)isSystemContainerDomain
{
  return +[MBDomain isSystemContainerName:](MBDomain, "isSystemContainerName:", self->_name);
}

- (BOOL)isSystemSharedContainerDomain
{
  return +[MBDomain isSystemSharedContainerName:](MBDomain, "isSystemSharedContainerName:", self->_name);
}

- (BOOL)isCameraRollDomain
{
  return -[NSString isEqualToString:](self->_name, "isEqualToString:", CFSTR("CameraRollDomain"));
}

- (BOOL)supportsFSEventsForDetectingChanges
{
  return -[MBDomain isAppDomain](self, "isAppDomain")
      || -[MBDomain isPluginAppDomain](self, "isPluginAppDomain")
      || -[MBDomain isGroupAppDomain](self, "isGroupAppDomain")
      || -[MBDomain isSystemContainerDomain](self, "isSystemContainerDomain")
      || -[MBDomain isSystemSharedContainerDomain](self, "isSystemSharedContainerDomain");
}

- (BOOL)shouldRestoreToSharedVolume
{
  return self->_volumeType == 1;
}

- (NSString)containerID
{
  return (NSString *)+[MBDomain containerIDWithName:](MBDomain, "containerIDWithName:", self->_name);
}

- (NSString)rootPath
{
  NSString *rootPath;
  void *v6;

  rootPath = self->_rootPath;
  if (!rootPath)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDomain.m"), 536, CFSTR("Domain has no root path (uninstalled app?): %@"), self->_name);

    rootPath = self->_rootPath;
  }
  return rootPath;
}

- (BOOL)hasRootPath
{
  return self->_rootPath != 0;
}

- (int)cachedFileDescriptorWithSnapshotPath:(id)a3 error:(id *)a4
{
  if (a3)
    return -[MBDomain _cachedFileDescriptorWithSnapshotPath:error:](self, "_cachedFileDescriptorWithSnapshotPath:error:", a3, a4);
  else
    return -[MBDomain _cachedFileDescriptorWithError:](self, "_cachedFileDescriptorWithError:", a4);
}

- (int)_cachedFileDescriptorWithSnapshotPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MBDomain *v11;
  NSFileHandle *v12;
  NSFileHandle *v13;
  const char *v14;
  int v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    -[MBDomain _cachedFileDescriptorWithSnapshotPath:error:].cold.1();
  v7 = v6;
  -[MBDomain rootPath](self, "rootPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBDomain volumeMountPoint](self, "volumeMountPoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MBSnapshotPathFromLivePath(v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    -[MBDomain _cachedFileDescriptorWithSnapshotPath:error:].cold.2();
  v11 = self;
  objc_sync_enter(v11);
  v12 = v11->_fileHandleForSnapshot;
  if (v12)
  {
    v13 = v12;
    if ((objc_msgSend(v10, "isEqualToString:", v11->_fileHandlePathForSnapshot) & 1) == 0)
    {
      v14 = "!fileHandle || [path isEqualToString:_fileHandlePathForSnapshot]";
      v15 = 558;
      goto LABEL_22;
    }
LABEL_8:
    v18 = -[NSFileHandle fileDescriptor](v13, "fileDescriptor");
    v19 = 1;
    goto LABEL_9;
  }
  v16 = objc_retainAutorelease(v10);
  v17 = open((const char *)objc_msgSend(v16, "fileSystemRepresentation"), 0);
  if ((_DWORD)v17 != -1)
  {
    v13 = (NSFileHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v17, 1);
    objc_storeStrong((id *)&v11->_fileHandleForSnapshot, v13);
    objc_storeStrong((id *)&v11->_fileHandlePathForSnapshot, v16);
    if (!v13)
    {
      v14 = "fileHandle";
      v15 = 569;
LABEL_22:
      __assert_rtn("-[MBDomain _cachedFileDescriptorWithSnapshotPath:error:]", "MBDomain.m", v15, v14);
    }
    goto LABEL_8;
  }
  v21 = *__error();
  if (a4)
  {
    +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v16, CFSTR("open failed"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  MBGetDefaultLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v16;
    v31 = 1024;
    v32 = v21;
    _os_log_impl(&dword_1D5213000, v22, OS_LOG_TYPE_ERROR, "open failed at %@: %{errno}d", buf, 0x12u);
    _MBLog(CFSTR("ERROR"), (uint64_t)"open failed at %@: %{errno}d", v23, v24, v25, v26, v27, v28, (uint64_t)v16);
  }

  v13 = 0;
  v19 = 0;
  v18 = -1;
LABEL_9:

  objc_sync_exit(v11);
  if (v19)
  {
    if (v18 == -1)
      -[MBDomain _cachedFileDescriptorWithSnapshotPath:error:].cold.3();
  }
  else
  {
    v18 = -1;
  }

  return v18;
}

- (int)_cachedFileDescriptorWithError:(id *)a3
{
  void *v5;
  MBDomain *v6;
  NSFileHandle *v7;
  NSFileHandle *v8;
  const char *v9;
  int v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[MBDomain rootPath](self, "rootPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    -[MBDomain _cachedFileDescriptorWithError:].cold.1();
  v6 = self;
  objc_sync_enter(v6);
  v7 = v6->_fileHandle;
  if (v7)
  {
    v8 = v7;
    if ((objc_msgSend(v5, "isEqualToString:", v6->_fileHandlePath) & 1) == 0)
    {
      v9 = "!fileHandle || [path isEqualToString:_fileHandlePath]";
      v10 = 583;
      goto LABEL_20;
    }
LABEL_7:
    v13 = -[NSFileHandle fileDescriptor](v8, "fileDescriptor");
    v14 = 1;
    goto LABEL_8;
  }
  v11 = objc_retainAutorelease(v5);
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0);
  if ((_DWORD)v12 != -1)
  {
    v8 = (NSFileHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v12, 1);
    objc_storeStrong((id *)&v6->_fileHandle, v8);
    objc_storeStrong((id *)&v6->_fileHandlePath, v11);
    if (!v8)
    {
      v9 = "fileHandle";
      v10 = 594;
LABEL_20:
      __assert_rtn("-[MBDomain _cachedFileDescriptorWithError:]", "MBDomain.m", v10, v9);
    }
    goto LABEL_7;
  }
  v16 = *__error();
  if (a3)
  {
    +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v11, CFSTR("open failed"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  MBGetDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v11;
    v26 = 1024;
    v27 = v16;
    _os_log_impl(&dword_1D5213000, v17, OS_LOG_TYPE_ERROR, "open failed at %@: %{errno}d", buf, 0x12u);
    _MBLog(CFSTR("ERROR"), (uint64_t)"open failed at %@: %{errno}d", v18, v19, v20, v21, v22, v23, (uint64_t)v11);
  }

  v8 = 0;
  v14 = 0;
  v13 = -1;
LABEL_8:

  objc_sync_exit(v6);
  if (v14)
  {
    if (v13 == -1)
      -[MBDomain _cachedFileDescriptorWithError:].cold.2();
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

- (BOOL)shouldBackUpAnyChildOfRelativePath:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  unint64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  char v29;
  void *v30;
  char v31;
  BOOL v32;
  MBDomain *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v34 = self;
    -[MBDomain relativePathsNotToBackup](self, "relativePathsNotToBackup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v13 = v4;
          v14 = v12;
          v15 = objc_msgSend(v13, "length");
          if (v15 == objc_msgSend(v14, "length"))
          {
            v16 = objc_msgSend(v13, "isEqualToString:", v14);

            if ((v16 & 1) != 0)
              goto LABEL_28;
          }
          else
          {
            objc_msgSend(v14, "stringByAppendingString:", CFSTR("/"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = objc_msgSend(v13, "hasPrefix:", v17);
            if ((v18 & 1) != 0)
              goto LABEL_28;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v9);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[MBDomain relativePathsToBackup](v34, "relativePathsToBackup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
      while (2)
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v7);
          v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          v24 = objc_msgSend(v23, "length");
          if (!v24)
          {
LABEL_30:
            v32 = 1;
            goto LABEL_31;
          }
          if (v6 >= v24)
          {
            v25 = v4;
            v26 = v23;
          }
          else
          {
            v25 = v23;
            v26 = v4;
          }
          v27 = v26;
          v28 = objc_msgSend(v25, "length");
          if (v28 == objc_msgSend(v27, "length"))
          {
            v29 = objc_msgSend(v25, "isEqualToString:", v27);

            if ((v29 & 1) != 0)
              goto LABEL_30;
          }
          else
          {
            objc_msgSend(v27, "stringByAppendingString:", CFSTR("/"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = objc_msgSend(v25, "hasPrefix:", v30);
            if ((v31 & 1) != 0)
              goto LABEL_30;
          }
        }
        v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v20)
          continue;
        break;
      }
    }
LABEL_28:
    v32 = 0;
LABEL_31:

  }
  else
  {
    v32 = 1;
  }

  return v32;
}

- (BOOL)shouldBackupRelativePathIgnoringProtectionClass:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MBDomain relativePathsToBackupIgnoringProtectionClass](self, "relativePathsToBackupIgnoringProtectionClass", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v10 = v4;
        v11 = v9;
        v12 = objc_msgSend(v10, "length");
        if (v12 == objc_msgSend(v11, "length"))
        {
          v13 = objc_msgSend(v10, "isEqualToString:", v11);

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {
          objc_msgSend(v11, "stringByAppendingString:", CFSTR("/"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v10, "hasPrefix:", v14);
          if ((v15 & 1) != 0)
          {
LABEL_13:
            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  return v6;
}

- (BOOL)shouldBackupRelativePathFromLiveFileSystem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  v4 = a3;
  -[MBDomain name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HomeDomain"));

  if (!v6)
  {
    -[MBDomain name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SkippedFilesDomain"));

    if ((v9 & 1) != 0)
      goto LABEL_8;
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "stringByStandardizingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Library/Application Support/CloudDocs/backup")) & 1) == 0
    && (objc_msgSend(v4, "hasPrefix:", CFSTR("Library/Application Support/CloudDocs/backup/")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("Library/Application Support/FileProvider/backup")) & 1) == 0
    && (objc_msgSend(v4, "hasPrefix:", CFSTR("Library/Application Support/FileProvider/backup/")) & 1) == 0)
  {

    goto LABEL_10;
  }

LABEL_8:
  v10 = 1;
LABEL_11:

  return v10;
}

- (NSString)rootPathRelativeToVolumeMountPoint
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[MBDomain volumeMountPoint](self, "volumeMountPoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("/private"));

  if (v4)
  {
    v5 = objc_msgSend(CFSTR("/private"), "length");
    -[MBDomain volumeMountPoint](self, "volumeMountPoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length") - v5;
  }
  else
  {
    -[MBDomain volumeMountPoint](self, "volumeMountPoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");
  }

  -[MBDomain rootPath](self, "rootPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringFromIndex:", v7 + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)releaseCachedFileDescriptors
{
  NSFileHandle *fileHandle;
  NSString *fileHandlePath;
  NSFileHandle *fileHandleForSnapshot;
  NSString *fileHandlePathForSnapshot;
  MBDomain *obj;

  obj = self;
  objc_sync_enter(obj);
  fileHandle = obj->_fileHandle;
  obj->_fileHandle = 0;

  fileHandlePath = obj->_fileHandlePath;
  obj->_fileHandlePath = 0;

  fileHandleForSnapshot = obj->_fileHandleForSnapshot;
  obj->_fileHandleForSnapshot = 0;

  fileHandlePathForSnapshot = obj->_fileHandlePathForSnapshot;
  obj->_fileHandlePathForSnapshot = 0;

  objc_sync_exit(obj);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)volumeMountPoint
{
  return self->_volumeMountPoint;
}

- (unint64_t)volumeType
{
  return self->_volumeType;
}

- (NSSet)relativePathsToBackupAndRestore
{
  return self->_relativePathsToBackupAndRestore;
}

- (void)setRelativePathsToBackupAndRestore:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsToBackupAndRestore, a3);
}

- (NSSet)relativePathsNotToBackup
{
  return self->_relativePathsNotToBackup;
}

- (void)setRelativePathsNotToBackup:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToBackup, a3);
}

- (NSSet)relativePathsNotToBackupToDrive
{
  return self->_relativePathsNotToBackupToDrive;
}

- (void)setRelativePathsNotToBackupToDrive:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToBackupToDrive, a3);
}

- (NSSet)relativePathsNotToBackupToService
{
  return self->_relativePathsNotToBackupToService;
}

- (void)setRelativePathsNotToBackupToService:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToBackupToService, a3);
}

- (NSSet)relativePathsNotToBackupInMegaBackup
{
  return self->_relativePathsNotToBackupInMegaBackup;
}

- (void)setRelativePathsNotToBackupInMegaBackup:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToBackupInMegaBackup, a3);
}

- (NSSet)relativePathsNotToBackupToLocal
{
  return self->_relativePathsNotToBackupToLocal;
}

- (void)setRelativePathsNotToBackupToLocal:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToBackupToLocal, a3);
}

- (NSSet)relativePathsToOnlyBackupEncrypted
{
  return self->_relativePathsToOnlyBackupEncrypted;
}

- (void)setRelativePathsToOnlyBackupEncrypted:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsToOnlyBackupEncrypted, a3);
}

- (NSSet)relativePathsNotToCheckIfModifiedDuringBackup
{
  return self->_relativePathsNotToCheckIfModifiedDuringBackup;
}

- (void)setRelativePathsNotToCheckIfModifiedDuringBackup:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToCheckIfModifiedDuringBackup, a3);
}

- (NSSet)relativePathsToRestoreOnly
{
  return self->_relativePathsToRestoreOnly;
}

- (void)setRelativePathsToRestoreOnly:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsToRestoreOnly, a3);
}

- (NSSet)relativePathsToRestoreOnlyFromService
{
  return self->_relativePathsToRestoreOnlyFromService;
}

- (void)setRelativePathsToRestoreOnlyFromService:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsToRestoreOnlyFromService, a3);
}

- (NSSet)relativePathsToRemoveOnRestore
{
  return self->_relativePathsToRemoveOnRestore;
}

- (void)setRelativePathsToRemoveOnRestore:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsToRemoveOnRestore, a3);
}

- (NSSet)relativePathsOfSystemFilesToAlwaysRestore
{
  return self->_relativePathsOfSystemFilesToAlwaysRestore;
}

- (void)setRelativePathsOfSystemFilesToAlwaysRestore:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsOfSystemFilesToAlwaysRestore, a3);
}

- (NSSet)relativePathsOfSystemFilesToAlwaysRemoveOnRestore
{
  return self->_relativePathsOfSystemFilesToAlwaysRemoveOnRestore;
}

- (void)setRelativePathsOfSystemFilesToAlwaysRemoveOnRestore:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsOfSystemFilesToAlwaysRemoveOnRestore, a3);
}

- (NSSet)relativePathsNotToRestore
{
  return self->_relativePathsNotToRestore;
}

- (void)setRelativePathsNotToRestore:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToRestore, a3);
}

- (NSSet)relativePathsNotToRestoreFromLocal
{
  return self->_relativePathsNotToRestoreFromLocal;
}

- (void)setRelativePathsNotToRestoreFromLocal:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToRestoreFromLocal, a3);
}

- (NSSet)relativePathsNotToMigrate
{
  return self->_relativePathsNotToMigrate;
}

- (void)setRelativePathsNotToMigrate:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToMigrate, a3);
}

- (NSSet)relativePathsNotToRestoreToIPods
{
  return self->_relativePathsNotToRestoreToIPods;
}

- (void)setRelativePathsNotToRestoreToIPods:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToRestoreToIPods, a3);
}

- (NSSet)relativePathsNotToBackupAndRestoreToAppleTVs
{
  return self->_relativePathsNotToBackupAndRestoreToAppleTVs;
}

- (void)setRelativePathsNotToBackupAndRestoreToAppleTVs:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToBackupAndRestoreToAppleTVs, a3);
}

- (NSSet)relativePathsToBackgroundRestore
{
  return self->_relativePathsToBackgroundRestore;
}

- (void)setRelativePathsToBackgroundRestore:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsToBackgroundRestore, a3);
}

- (NSSet)relativePathsNotToRemoveIfNotRestored
{
  return self->_relativePathsNotToRemoveIfNotRestored;
}

- (void)setRelativePathsNotToRemoveIfNotRestored:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsNotToRemoveIfNotRestored, a3);
}

- (NSSet)relativePathsToIgnoreExclusionsForDrive
{
  return self->_relativePathsToIgnoreExclusionsForDrive;
}

- (void)setRelativePathsToIgnoreExclusionsForDrive:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsToIgnoreExclusionsForDrive, a3);
}

- (NSSet)relativePathsToBackupToDriveAndStandardAccount
{
  return self->_relativePathsToBackupToDriveAndStandardAccount;
}

- (void)setRelativePathsToBackupToDriveAndStandardAccount:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsToBackupToDriveAndStandardAccount, a3);
}

- (NSSet)relativePathsToBackupIgnoringProtectionClass
{
  return self->_relativePathsToBackupIgnoringProtectionClass;
}

- (void)setRelativePathsToBackupIgnoringProtectionClass:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathsToBackupIgnoringProtectionClass, a3);
}

- (NSDictionary)relativePathAggregateDictionaryGroups
{
  return self->_relativePathAggregateDictionaryGroups;
}

- (void)setRelativePathAggregateDictionaryGroups:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathAggregateDictionaryGroups, a3);
}

- (NSDictionary)relativePathDomainRedirects
{
  return self->_relativePathDomainRedirects;
}

- (void)setRelativePathDomainRedirects:(id)a3
{
  objc_storeStrong((id *)&self->_relativePathDomainRedirects, a3);
}

- (BOOL)shouldDigest
{
  return self->_shouldDigest;
}

- (void)setShouldDigest:(BOOL)a3
{
  self->_shouldDigest = a3;
}

- (BOOL)hasExternalConfig
{
  return self->_hasExternalConfig;
}

- (void)setHasExternalConfig:(BOOL)a3
{
  self->_hasExternalConfig = a3;
}

- (BOOL)isExternalConfig
{
  return self->_isExternalConfig;
}

- (void)setIsExternalConfig:(BOOL)a3
{
  self->_isExternalConfig = a3;
}

- (BOOL)shouldRestoreRelativeSymlinks
{
  return self->_shouldRestoreRelativeSymlinks;
}

- (void)setShouldRestoreRelativeSymlinks:(BOOL)a3
{
  self->_shouldRestoreRelativeSymlinks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativePathDomainRedirects, 0);
  objc_storeStrong((id *)&self->_relativePathAggregateDictionaryGroups, 0);
  objc_storeStrong((id *)&self->_relativePathsToBackupIgnoringProtectionClass, 0);
  objc_storeStrong((id *)&self->_relativePathsToBackupToDriveAndStandardAccount, 0);
  objc_storeStrong((id *)&self->_relativePathsToIgnoreExclusionsForDrive, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToRemoveIfNotRestored, 0);
  objc_storeStrong((id *)&self->_relativePathsToBackgroundRestore, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToBackupAndRestoreToAppleTVs, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToRestoreToIPods, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToMigrate, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToRestoreFromLocal, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToRestore, 0);
  objc_storeStrong((id *)&self->_relativePathsOfSystemFilesToAlwaysRemoveOnRestore, 0);
  objc_storeStrong((id *)&self->_relativePathsOfSystemFilesToAlwaysRestore, 0);
  objc_storeStrong((id *)&self->_relativePathsToRemoveOnRestore, 0);
  objc_storeStrong((id *)&self->_relativePathsToRestoreOnlyFromService, 0);
  objc_storeStrong((id *)&self->_relativePathsToRestoreOnly, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToCheckIfModifiedDuringBackup, 0);
  objc_storeStrong((id *)&self->_relativePathsToOnlyBackupEncrypted, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToBackupToLocal, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToBackupInMegaBackup, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToBackupToService, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToBackupToDrive, 0);
  objc_storeStrong((id *)&self->_relativePathsNotToBackup, 0);
  objc_storeStrong((id *)&self->_relativePathsToBackupAndRestore, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_volumeMountPoint, 0);
  objc_storeStrong((id *)&self->_fileHandlePathForSnapshot, 0);
  objc_storeStrong((id *)&self->_fileHandleForSnapshot, 0);
  objc_storeStrong((id *)&self->_fileHandlePath, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
}

+ (void)_domainWithName:volumeMountPoint:rootPath:.cold.1()
{
  __assert_rtn("+[MBDomain _domainWithName:volumeMountPoint:rootPath:]", "MBDomain.m", 140, "name");
}

+ (void)_domainWithName:volumeMountPoint:rootPath:.cold.2()
{
  __assert_rtn("+[MBDomain _domainWithName:volumeMountPoint:rootPath:]", "MBDomain.m", 147, "volumeType != MBVolumeTypeUnspecified");
}

+ (void)_domainWithName:volumeMountPoint:rootPath:.cold.3()
{
  __assert_rtn("+[MBDomain _domainWithName:volumeMountPoint:rootPath:]", "MBDomain.m", 142, "[volumeMountPoint hasPrefix:@\"/\"]");
}

- (void)_initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:.cold.1()
{
  __assert_rtn("-[MBDomain _initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:]", "MBDomain.m", 221, "accountType != MBAccountTypeUnspecified");
}

- (void)_initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:.cold.2()
{
  __assert_rtn("-[MBDomain _initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:]", "MBDomain.m", 244, "_volumeType != MBVolumeTypeUnspecified");
}

- (void)_initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:.cold.3()
{
  __assert_rtn("-[MBDomain _initNonContainerizedDomainWithName:plist:accountType:volumeMountPoint:]", "MBDomain.m", 229, "MBPathHasVolumePrefix(rootPath, kMBSharedVolumeMountPoint)");
}

- (void)_loadSystemDomain:plist:volumeMountPoint:.cold.1()
{
  __assert_rtn("-[MBDomain _loadSystemDomain:plist:volumeMountPoint:]", "MBDomain.m", 260, "domainName");
}

- (void)_loadSystemDomain:plist:volumeMountPoint:.cold.2()
{
  __assert_rtn("-[MBDomain _loadSystemDomain:plist:volumeMountPoint:]", "MBDomain.m", 261, "plist");
}

- (void)_loadSystemDomain:plist:volumeMountPoint:.cold.3()
{
  __assert_rtn("-[MBDomain _loadSystemDomain:plist:volumeMountPoint:]", "MBDomain.m", 262, "volumeMountPoint");
}

- (void)_cachedFileDescriptorWithSnapshotPath:error:.cold.1()
{
  __assert_rtn("-[MBDomain _cachedFileDescriptorWithSnapshotPath:error:]", "MBDomain.m", 552, "snapshotPath");
}

- (void)_cachedFileDescriptorWithSnapshotPath:error:.cold.2()
{
  __assert_rtn("-[MBDomain _cachedFileDescriptorWithSnapshotPath:error:]", "MBDomain.m", 554, "path");
}

- (void)_cachedFileDescriptorWithSnapshotPath:error:.cold.3()
{
  __assert_rtn("-[MBDomain _cachedFileDescriptorWithSnapshotPath:error:]", "MBDomain.m", 573, "fd != -1");
}

- (void)_cachedFileDescriptorWithError:.cold.1()
{
  __assert_rtn("-[MBDomain _cachedFileDescriptorWithError:]", "MBDomain.m", 579, "path");
}

- (void)_cachedFileDescriptorWithError:.cold.2()
{
  __assert_rtn("-[MBDomain _cachedFileDescriptorWithError:]", "MBDomain.m", 598, "fd != -1");
}

@end
