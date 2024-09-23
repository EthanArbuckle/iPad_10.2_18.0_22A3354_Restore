@implementation MBDomainManager

- (id)_initWithSystemDomains:(id)a3 versions:(id)a4
{
  id v6;
  id v7;
  MBDomainManager *v8;
  NSMutableDictionary *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *systemDomainsByName;
  NSMutableDictionary *domainsByName;
  NSMutableDictionary *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MBDomainManager;
  v8 = -[MBDomainManager init](&v27, sel_init);
  if (v8)
  {
    v22 = v7;
    v9 = (NSMutableDictionary *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v15, v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    v17 = -[NSMutableDictionary copy](v9, "copy");
    systemDomainsByName = v8->_systemDomainsByName;
    v8->_systemDomainsByName = (NSDictionary *)v17;

    domainsByName = v8->_domainsByName;
    v8->_domainsByName = v9;
    v20 = v9;

    objc_storeStrong((id *)&v8->_systemDomainsVersions, a4);
    v7 = v22;
  }

  return v8;
}

- (MBDomainManager)initWithSystemDomains:(id)a3
{
  id v4;
  void *v5;
  MBDomainManager *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[MBDomainManager _initWithSystemDomains:versions:](self, "_initWithSystemDomains:versions:", v4, v5);

  return v6;
}

- (id)initForTestingWithDomains:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[MBDomainManager _initWithSystemDomains:versions:](self, "_initWithSystemDomains:versions:", MEMORY[0x1E0C9AA60], v5);

  if (v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v13 = (void *)v6[3];
          objc_msgSend(v12, "name", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
  return v6;
}

+ (id)_readDomainsFromPlist:(id)a3 accountType:(int64_t)a4 volumeMountPoint:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  switch(a4)
  {
    case 0:
      +[MBDomainManager _readDomainsFromPlist:accountType:volumeMountPoint:error:].cold.1();
    case 1:
    case 3:
      v11 = CFSTR("SystemDomains");
      break;
    case 2:
      v11 = CFSTR("DataSeparatedDomains");
      break;
    default:
      v11 = 0;
      break;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v30 = v12;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[MBDomain nonContainerizedDomainWithName:plist:accountType:volumeMountPoint:](MBDomain, "nonContainerizedDomainWithName:plist:accountType:volumeMountPoint:", v19, v20, a4, v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v13, "addObject:", v21);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v16);
    }

    v12 = v30;
  }
  else
  {
    MBGetDefaultLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v11;
      v38 = 2114;
      v39 = v12;
      _os_log_impl(&dword_1D5213000, v22, OS_LOG_TYPE_ERROR, "Domain plist value for key %@ is not a dictionary: %{public}@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Domain plist value for key %@ is not a dictionary: %{public}@", v23, v24, v25, v26, v27, v28, (uint64_t)v11);
    }

    if (a6)
    {
      +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("%@ value is not a dictionary"), v11);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)_initWithAccountType:(int64_t)a3 volumeMountPoint:(id)a4 plistPath:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  MBSystemDomainsVersions *v46;
  MBDomainManager *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  int64_t v60;
  __int16 v61;
  double v62;
  __int16 v63;
  double v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (!a6)
    -[MBDomainManager _initWithAccountType:volumeMountPoint:plistPath:error:].cold.1();
  v12 = v11;
  v13 = (void *)MEMORY[0x1D8270CF0]();
  MBGetDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v58 = v12;
    v59 = 2048;
    v60 = a3;
    _os_log_impl(&dword_1D5213000, v14, OS_LOG_TYPE_DEFAULT, "Loading system domains from %{public}@ %ld", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Loading system domains from %{public}@ %ld", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v21, &v56);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v56;
  if (v22)
  {
    +[MBDomain doubleFromStringValueForKey:plist:](MBDomain, "doubleFromStringValueForKey:plist:", CFSTR("MinSupportedVersion"), v22);
    v25 = v24;
    +[MBDomain doubleFromStringValueForKey:plist:](MBDomain, "doubleFromStringValueForKey:plist:", CFSTR("Version"), v22);
    v27 = v26;
    +[MBDomain doubleFromStringValueForKey:plist:](MBDomain, "doubleFromStringValueForKey:plist:", CFSTR("MaxSupportedVersion"), v22);
    v29 = v28;
    v55 = v23;
    objc_msgSend((id)objc_opt_class(), "_readDomainsFromPlist:accountType:volumeMountPoint:error:", v22, a3, v10, &v55);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v23;
    v23 = v55;
  }
  else
  {
    MBGetDefaultLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v29 = -1.0;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v58 = v12;
      v59 = 2114;
      v60 = (int64_t)v23;
      _os_log_impl(&dword_1D5213000, v31, OS_LOG_TYPE_ERROR, "Failed to load the system domains plist at %{public}@: %{public}@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to load the system domains plist at %{public}@: %{public}@", v32, v33, v34, v35, v36, v37, (uint64_t)v12);
    }
    v30 = 0;
    v27 = -1.0;
    v25 = -1.0;
  }

  objc_autoreleasePoolPop(v13);
  MBGetDefaultLog();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (!v30 || v23)
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v58 = v12;
      v59 = 2114;
      v60 = (int64_t)v23;
      _os_log_impl(&dword_1D5213000, v39, OS_LOG_TYPE_ERROR, "Failed to load the system domains at %{public}@: %{public}@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to load the system domains at %{public}@: %{public}@", v48, v49, v50, v51, v52, v53, (uint64_t)v12);
    }

    v47 = 0;
    *a6 = objc_retainAutorelease(v23);
  }
  else
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      v58 = v12;
      v59 = 2048;
      v60 = *(_QWORD *)&v27;
      v61 = 2048;
      v62 = v25;
      v63 = 2048;
      v64 = v29;
      v65 = 2114;
      v66 = v30;
      _os_log_impl(&dword_1D5213000, v39, OS_LOG_TYPE_DEFAULT, "Loaded system domains from %{public}@ (%.1f,%.1f,%.1f): %{public}@", buf, 0x34u);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Loaded system domains from %{public}@ (%.1f,%.1f,%.1f): %{public}@", v40, v41, v42, v43, v44, v45, (uint64_t)v12);
    }

    v46 = -[MBSystemDomainsVersions initWithVersion:minSupportedVersion:maxSupportedVersion:]([MBSystemDomainsVersions alloc], "initWithVersion:minSupportedVersion:maxSupportedVersion:", v27, v25, v29);
    self = (MBDomainManager *)-[MBDomainManager _initWithSystemDomains:versions:](self, "_initWithSystemDomains:versions:", v30, v46);

    v47 = self;
  }

  return v47;
}

- (MBDomainManager)initWithPersona:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  MBDomainManager *v8;
  id v9;
  id v11;

  v4 = a3;
  _systemDomainsPlistPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "accountType");
  objc_msgSend(v4, "volumeMountPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = -[MBDomainManager _initWithAccountType:volumeMountPoint:plistPath:error:](self, "_initWithAccountType:volumeMountPoint:plistPath:error:", v6, v7, v5, &v11);
  v9 = v11;

  if (!v8)
    objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Failed to load system domains from %@: %@"), v5, v9));

  return v8;
}

- (id)initForTestingWithPersona:(id)a3 systemDomainsPlistAtPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "accountType");
  objc_msgSend(v6, "volumeMountPoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = -[MBDomainManager _initWithAccountType:volumeMountPoint:plistPath:error:](self, "_initWithAccountType:volumeMountPoint:plistPath:error:", v8, v9, v7, &v13);
  v11 = v13;

  if (!v10)
    objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Failed to load system domains from %@: %@"), v7, v11));

  return v10;
}

- (BOOL)isSystemDomainName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MBDomainManager systemDomainsByName](self, "systemDomainsByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)allDomains
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allValues](self->_domainsByName, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)containsDomainName:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_domainsByName, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)domainForName:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDomainManager.m"), 214, CFSTR("Null name"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_domainsByName, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    +[MBDomain containerIDWithName:](MBDomain, "containerIDWithName:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "domainForName:containerID:domainManager:", v5, v8, self);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v8)
        objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Unknown domain: %@"), v5));
      MBGetDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v8;
        _os_log_impl(&dword_1D5213000, v12, OS_LOG_TYPE_INFO, "Creating domain for uninstalled container %@", buf, 0xCu);
        _MBLog(CFSTR("INFO"), (uint64_t)"Creating domain for uninstalled container %@", v13, v14, v15, v16, v17, v18, (uint64_t)v8);
      }

      +[MBDomain uninstalledDomainWithName:](MBDomain, "uninstalledDomainWithName:", v5);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v11;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_domainsByName, "setObject:forKeyedSubscript:", v11, v5);
    v7 = v19;

  }
  return v7;
}

- (id)domainForPath:(id)a3 relativePath:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_domainsByName, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    v39 = v7;
    v40 = (uint64_t)v6;
    v37 = *(_QWORD *)v42;
    while (2)
    {
      v11 = 0;
      v38 = v9;
      do
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
        objc_msgSend(v12, "rootPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mb_stringByAppendingSlash");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "hasPrefix:", v14);

        if (v15)
        {
          objc_msgSend(v12, "rootPath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v16, "length") + 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "pathComponents");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count"))
          {
            v19 = 1;
            while (1)
            {
              v20 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v18, "subarrayWithRange:", 0, v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "pathWithComponents:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v12, "relativePathsToRestore");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v23, "containsObject:", v22))
                break;
              objc_msgSend(v12, "relativePathsToRestoreOnlyFromService");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "containsObject:", v22);

              if (v25)
                goto LABEL_18;

              if (++v19 > (unint64_t)objc_msgSend(v18, "count"))
                goto LABEL_12;
            }

LABEL_18:
            MBGetDefaultLog();
            v27 = objc_claimAutoreleasedReturnValue();
            v6 = (id)v40;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v12, "name");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v46 = v40;
              v47 = 2112;
              v48 = v28;
              v49 = 2112;
              v50 = v17;
              _os_log_impl(&dword_1D5213000, v27, OS_LOG_TYPE_DEBUG, "Domain for path \"%@\": domain=\"%@\", relativePath=\"%@\", buf, 0x20u);

              objc_msgSend(v12, "name");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              _MBLog(CFSTR("DEBUG"), (uint64_t)"Domain for path \"%@\": domain=\"%@\", relativePath=\"%@\", v29, v30, v31, v32, v33, v34, v40);

            }
            if (a4)
              *a4 = objc_retainAutorelease(v17);
            v26 = v12;

            v7 = v39;
            goto LABEL_23;
          }
LABEL_12:

          v7 = v39;
          v6 = (id)v40;
          v10 = v37;
          v9 = v38;
        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      v26 = 0;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v26 = 0;
  }
LABEL_23:

  return v26;
}

- (id)redirectDomain:(id)a3 forRelativePath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v7, "relativePathDomainRedirects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", v14))
        {
          objc_msgSend(v7, "relativePathDomainRedirects");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          MBGetDefaultLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v7, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v34 = v19;
            v35 = 2112;
            v36 = v17;
            v37 = 2112;
            v38 = v8;
            _os_log_impl(&dword_1D5213000, v18, OS_LOG_TYPE_INFO, "Redirecting from %@ to %@: %@", buf, 0x20u);

            objc_msgSend(v7, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            _MBLog(CFSTR("INFO"), (uint64_t)"Redirecting from %@ to %@: %@", v21, v22, v23, v24, v25, v26, (uint64_t)v20);

          }
          -[MBDomainManager domainForName:](self, "domainForName:", v17);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDomainManager.m"), 261, CFSTR("Domain not found for redirect: %@"), v17);

          }
          goto LABEL_15;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      if (v11)
        continue;
      break;
    }
  }

  v15 = v7;
LABEL_15:

  return v15;
}

- (void)addDomain:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_domainsByName, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDomainManager.m"), 270, CFSTR("Domain already exists: %@"), v5);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_domainsByName, "setObject:forKeyedSubscript:", v8, v5);

}

- (void)addDomain:(id)a3 forName:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_domainsByName, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)removeDomains:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_domainsByName, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (MBSystemDomainsVersions)systemDomainsVersions
{
  return self->_systemDomainsVersions;
}

- (void)setSystemDomainsVersions:(id)a3
{
  objc_storeStrong((id *)&self->_systemDomainsVersions, a3);
}

- (NSDictionary)systemDomainsByName
{
  return self->_systemDomainsByName;
}

- (void)setSystemDomainsByName:(id)a3
{
  objc_storeStrong((id *)&self->_systemDomainsByName, a3);
}

- (NSMutableDictionary)domainsByName
{
  return self->_domainsByName;
}

- (void)setDomainsByName:(id)a3
{
  objc_storeStrong((id *)&self->_domainsByName, a3);
}

- (MBDomainManagerDelegate)delegate
{
  return (MBDomainManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_domainsByName, 0);
  objc_storeStrong((id *)&self->_systemDomainsByName, 0);
  objc_storeStrong((id *)&self->_systemDomainsVersions, 0);
}

+ (void)_readDomainsFromPlist:accountType:volumeMountPoint:error:.cold.1()
{
  __assert_rtn("+[MBDomainManager _readDomainsFromPlist:accountType:volumeMountPoint:error:]", "MBDomainManager.m", 118, "accountType != MBAccountTypeUnspecified");
}

- (void)_initWithAccountType:volumeMountPoint:plistPath:error:.cold.1()
{
  __assert_rtn("-[MBDomainManager _initWithAccountType:volumeMountPoint:plistPath:error:]", "MBDomainManager.m", 149, "error");
}

@end
