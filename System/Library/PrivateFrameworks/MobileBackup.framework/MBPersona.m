@implementation MBPersona

+ (void)installPersonaForTesting
{
  _personaClass = (uint64_t)a1;
}

+ (Class)personaClass
{
  void *v2;

  v2 = (void *)_personaClass;
  if (!_personaClass)
    v2 = (void *)objc_opt_class();
  return (Class)v2;
}

+ (id)personaWithIdentifier:(id)a3 userPersonaType:(unint64_t)a4 dataSeparatedPersona:(BOOL)a5 volumeMountPoint:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;

  v6 = a5;
  v9 = a6;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc(+[MBPersona personaClass](MBPersona, "personaClass")), "initWithPersonaIdentifier:userPersonaType:dataSeparatedPersona:volumeMountPoint:", v10, a4, v6, v9);

  return v11;
}

+ (id)personaWithAttributes:(id)a3 volumeMountPoint:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(+[MBPersona personaClass](MBPersona, "personaClass")), "initWithPersonaAttributes:volumeMountPoint:", v6, v5);

  return v7;
}

+ (id)personaWithUMPersona:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(+[MBPersona personaClass](MBPersona, "personaClass")), "initWithUMPersona:error:", v5, a4);

  return v6;
}

- (MBPersona)initWithPersonaIdentifier:(id)a3 userPersonaType:(unint64_t)a4 dataSeparatedPersona:(BOOL)a5 volumeMountPoint:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  MBPersona *v13;
  MBPersona *v14;
  objc_super v16;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if (!v10)
    -[MBPersona initWithPersonaIdentifier:userPersonaType:dataSeparatedPersona:volumeMountPoint:].cold.1();
  v12 = v11;
  if (!v11)
    -[MBPersona initWithPersonaIdentifier:userPersonaType:dataSeparatedPersona:volumeMountPoint:].cold.2();
  v16.receiver = self;
  v16.super_class = (Class)MBPersona;
  v13 = -[MBPersona init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[MBPersona setPersonaIdentifier:](v13, "setPersonaIdentifier:", v10);
    -[MBPersona setUserPersonaType:](v14, "setUserPersonaType:", a4);
    -[MBPersona setIsDataSeparatedPersona:](v14, "setIsDataSeparatedPersona:", v7);
    -[MBPersona setVolumeMountPoint:](v14, "setVolumeMountPoint:", v12);
  }

  return v14;
}

- (MBPersona)initWithPersonaAttributes:(id)a3 volumeMountPoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MBPersona *v10;

  v6 = a3;
  v7 = a4;
  if (!v6)
    -[MBPersona initWithPersonaAttributes:volumeMountPoint:].cold.1();
  v8 = v7;
  objc_msgSend(v6, "userPersonaUniqueString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MBPersona initWithPersonaIdentifier:userPersonaType:dataSeparatedPersona:volumeMountPoint:](self, "initWithPersonaIdentifier:userPersonaType:dataSeparatedPersona:volumeMountPoint:", v9, objc_msgSend(v6, "userPersonaType"), objc_msgSend(v6, "isDataSeparatedPersona"), v8);

  return v10;
}

- (MBPersona)initWithUMPersona:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  MBPersona *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  MBPersona *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    -[MBPersona initWithUMPersona:error:].cold.1();
  if (!a4)
    -[MBPersona initWithUMPersona:error:].cold.2();
  v7 = v6;
  objc_msgSend(v6, "userPersonaUniqueString");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (MBPersona *)v8;
    if (objc_msgSend(v7, "isPersonalPersona"))
    {
      objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaUniqueString:", v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = v10;
        if ((-[__CFString isPersonalPersona](v10, "isPersonalPersona") & 1) == 0)
          -[MBPersona initWithUMPersona:error:].cold.3();
        v12 = (uint64_t)v9;
        v9 = (MBPersona *)CFSTR("/private/var/mobile");
LABEL_20:
        v22 = -[MBPersona initWithPersonaAttributes:volumeMountPoint:](self, "initWithPersonaAttributes:volumeMountPoint:", v11, v9);
        v38 = v11;
        self = v9;
        v11 = (__CFString *)v12;
        v9 = v22;
LABEL_30:

        self = v9;
        goto LABEL_31;
      }
      v11 = CFSTR("/private/var/mobile");
      goto LABEL_22;
    }
    if ((objc_msgSend(v7, "isDefaultPersona") & 1) != 0 || objc_msgSend(v7, "isSystemPersona"))
    {
      MBGetDefaultLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "userPersonaNickName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v79 = v9;
        v80 = 2112;
        v81 = (uint64_t)v24;
        v82 = 2048;
        v83 = objc_msgSend(v7, "userPersonaType");
        _os_log_impl(&dword_1D5213000, v23, OS_LOG_TYPE_INFO, "Using the personal persona for persona %{public}@ %@ (%ld)", buf, 0x20u);

        objc_msgSend(v7, "userPersonaNickName");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v7, "userPersonaType");
        _MBLog(CFSTR("INFO"), (uint64_t)"Using the personal persona for persona %{public}@ %@ (%ld)", v25, v26, v27, v28, v29, v30, (uint64_t)v9);

      }
      objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if ((-[__CFString isPersonalPersona](v11, "isPersonalPersona") & 1) == 0)
          -[MBPersona initWithUMPersona:error:].cold.4();
        MBGetDefaultLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v79 = v11;
          _os_log_impl(&dword_1D5213000, v31, OS_LOG_TYPE_INFO, "Fetched the attributes for personal persona: %{public}@", buf, 0xCu);
          _MBLog(CFSTR("INFO"), (uint64_t)"Fetched the attributes for personal persona: %{public}@", v32, v33, v34, v35, v36, v37, (uint64_t)v11);
        }

        -[__CFString userPersonaUniqueString](v11, "userPersonaUniqueString");
        v12 = objc_claimAutoreleasedReturnValue();
        v9 = (MBPersona *)CFSTR("/private/var/mobile");
        if (v12)
          goto LABEL_20;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaUniqueString:", v9);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
LABEL_22:
        MBGetDefaultLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "userPersonaNickName");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v79 = v9;
          v80 = 2112;
          v81 = (uint64_t)v40;
          v82 = 2048;
          v83 = objc_msgSend(v7, "userPersonaType");
          _os_log_impl(&dword_1D5213000, v39, OS_LOG_TYPE_ERROR, "Failed to fetch the attributes for persona %{public}@ %@ (%ld)", buf, 0x20u);

          objc_msgSend(v7, "userPersonaNickName");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v7, "userPersonaType");
          _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to fetch the attributes for persona %{public}@ %@ (%ld)", v41, v42, v43, v44, v45, v46, (uint64_t)v9);

        }
        objc_msgSend(v7, "userPersonaNickName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("nil persona attributes for %@ persona"), v38, v76, v77);
LABEL_29:
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      MBGetDefaultLog();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v79 = v9;
        v80 = 2114;
        v81 = (uint64_t)v11;
        _os_log_impl(&dword_1D5213000, v58, OS_LOG_TYPE_INFO, "Fetched persona attributes for persona %{public}@: %{public}@", buf, 0x16u);
        v76 = v11;
        _MBLog(CFSTR("INFO"), (uint64_t)"Fetched persona attributes for persona %{public}@: %{public}@", v59, v60, v61, v62, v63, v64, (uint64_t)v9);
      }

      -[__CFString userPersonaUniqueString](v11, "userPersonaUniqueString");
      v12 = objc_claimAutoreleasedReturnValue();

      -[__CFString personaLayoutPathURL](v11, "personaLayoutPathURL");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "path");
      v9 = (MBPersona *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        if (!v9)
        {
          MBGetDefaultLog();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "userPersonaNickName");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v7, "userPersonaType");
            *(_DWORD *)buf = 138543618;
            v79 = v67;
            v80 = 2048;
            v81 = v68;
            _os_log_impl(&dword_1D5213000, v66, OS_LOG_TYPE_ERROR, "nil volumeMountPoint for %{public}@ persona (%ld)", buf, 0x16u);

            objc_msgSend(v7, "userPersonaNickName");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "userPersonaType");
            _MBLog(CFSTR("ERROR"), (uint64_t)"nil volumeMountPoint for %{public}@ persona (%ld)", v70, v71, v72, v73, v74, v75, (uint64_t)v69);

          }
          objc_msgSend(v7, "userPersonaNickName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("nil volume mount point for %@ persona"), v38);
          v22 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          v9 = (MBPersona *)v12;
          goto LABEL_30;
        }
        goto LABEL_20;
      }
    }
    MBGetDefaultLog();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "userPersonaNickName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v7, "userPersonaType");
      *(_DWORD *)buf = 138543618;
      v79 = v48;
      v80 = 2048;
      v81 = v49;
      _os_log_impl(&dword_1D5213000, v47, OS_LOG_TYPE_ERROR, "nil personaIdentifier for %{public}@ persona (%ld)", buf, 0x16u);

      objc_msgSend(v7, "userPersonaNickName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)objc_msgSend(v7, "userPersonaType");
      _MBLog(CFSTR("ERROR"), (uint64_t)"nil personaIdentifier for %{public}@ persona (%ld)", v51, v52, v53, v54, v55, v56, (uint64_t)v50);

    }
    objc_msgSend(v7, "userPersonaNickName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("nil persona identifier for %@ persona"), v38, v76, v77);
    goto LABEL_29;
  }
  MBGetDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "userPersonaNickName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v79 = v14;
    _os_log_impl(&dword_1D5213000, v13, OS_LOG_TYPE_ERROR, "nil personaIdentifier for %{public}@ persona", buf, 0xCu);

    objc_msgSend(v7, "userPersonaNickName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _MBLog(CFSTR("ERROR"), (uint64_t)"nil personaIdentifier for %{public}@ persona", v16, v17, v18, v19, v20, v21, (uint64_t)v15);

  }
  objc_msgSend(v7, "userPersonaNickName");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("nil persona identifier for %@ persona"), v11);
  v22 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v22;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *personaIdentifier;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  personaIdentifier = self->_personaIdentifier;
  -[MBPersona user](self, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; id=%@, user=%@>"), v5, self, personaIdentifier, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isPersonalPersona
{
  return -[MBPersona userPersonaType](self, "userPersonaType") == 0;
}

- (BOOL)isEnterprisePersona
{
  return -[MBPersona userPersonaType](self, "userPersonaType") == 2;
}

- (BOOL)shouldRestoreToSharedVolume
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[MBPersona isPersonalPersona](self, "isPersonalPersona");
  if (v3)
  {
    -[MBPersona user](self, "user");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPrimaryUser");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (_MBUser)user
{
  MBPersona *v2;
  _MBUser *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_user;
  if (!v3)
  {
    +[_MBUser currentUser](_MBUser, "currentUser");
    v3 = (_MBUser *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_user, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    -[MBPersona user].cold.1();
  return v3;
}

- (NSString)cacheDirectory
{
  void *v3;
  void *v4;

  if (-[MBPersona isPersonalPersona](self, "isPersonalPersona"))
  {
    MBGetCacheDir();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MBPersona volumeMountPoint](self, "volumeMountPoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Backup/Caches"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v3)
    -[MBPersona cacheDirectory].cold.1();
  return (NSString *)v3;
}

- (NSString)preferencesDirectory
{
  __CFString *v3;
  void *v4;

  if (-[MBPersona isPersonalPersona](self, "isPersonalPersona"))
  {
    v3 = CFSTR("/var/mobile/Library/Preferences");
  }
  else
  {
    -[MBPersona volumeMountPoint](self, "volumeMountPoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Backup/Preferences"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[MBPersona preferencesDirectory].cold.1();
  }
  return (NSString *)v3;
}

- (NSString)sqliteCopyDirectory
{
  void *v2;
  void *v3;

  -[MBPersona cacheDirectory](self, "cacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("sqlcache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[MBPersona sqliteCopyDirectory].cold.1();
  return (NSString *)v3;
}

- (NSString)appPlaceholderArchiveDirectory
{
  __CFString *v3;
  void *v4;

  if (-[MBPersona isPersonalPersona](self, "isPersonalPersona"))
  {
    v3 = CFSTR("/var/mobile/Library/Caches/Backup/placeholders");
  }
  else
  {
    -[MBPersona volumeMountPoint](self, "volumeMountPoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Backup/Caches/placeholders"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[MBPersona appPlaceholderArchiveDirectory].cold.1();
  }
  return (NSString *)v3;
}

- (NSString)safeHarborDirectory
{
  return (NSString *)CFSTR("/var/mobile/Library/SafeHarbor");
}

- (NSString)userRestoreDirectory
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = -[MBPersona isPersonalPersona](self, "isPersonalPersona");
  -[MBPersona volumeMountPoint](self, "volumeMountPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("backup");
  else
    v6 = CFSTR("Backup/backup");
  objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[MBPersona userRestoreDirectory].cold.1();
  return (NSString *)v7;
}

- (NSString)sharedRestoreDirectory
{
  return (NSString *)CFSTR("/private/var/backup");
}

- (NSString)userIncompleteRestoreDirectory
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = -[MBPersona isPersonalPersona](self, "isPersonalPersona");
  -[MBPersona volumeMountPoint](self, "volumeMountPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR(".backup.i");
  else
    v6 = CFSTR("Backup/.backup.i");
  objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[MBPersona userIncompleteRestoreDirectory].cold.1();
  return (NSString *)v7;
}

- (NSString)sharedIncompleteRestoreDirectory
{
  return (NSString *)CFSTR("/private/var/.backup.i");
}

- (NSString)placeholderRestoreDirectory
{
  __CFString *v3;
  void *v4;

  if (-[MBPersona isPersonalPersona](self, "isPersonalPersona"))
  {
    v3 = CFSTR("/var/mobile/Library/Backup/AppPlaceholders");
  }
  else
  {
    -[MBPersona volumeMountPoint](self, "volumeMountPoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Backup/AppPlaceholders"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[MBPersona placeholderRestoreDirectory].cold.1();
  }
  return (NSString *)v3;
}

- (NSString)demotedAppsPlistPath
{
  __CFString *v3;
  void *v4;

  if (-[MBPersona isPersonalPersona](self, "isPersonalPersona"))
  {
    v3 = CFSTR("/var/mobile/Library/Preferences/com.apple.MobileBackup.DemotedApps.plist");
  }
  else
  {
    -[MBPersona preferencesDirectory](self, "preferencesDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("com.apple.MobileBackup.DemotedApps.plist"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[MBPersona demotedAppsPlistPath].cold.1();
  }
  return (NSString *)v3;
}

- (NSString)volumeMapPlistPath
{
  void *v2;
  void *v3;

  -[MBPersona cacheDirectory](self, "cacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("volume_map.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_userRestorePrefetchDirectory
{
  __CFString *v3;
  void *v4;

  if (-[MBPersona isPersonalPersona](self, "isPersonalPersona"))
  {
    v3 = CFSTR("/var/mobile/Library/Caches/Backup/prefetch");
  }
  else
  {
    -[MBPersona volumeMountPoint](self, "volumeMountPoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Backup/Caches/prefetch"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[MBPersona _userRestorePrefetchDirectory].cold.1();
  }
  return v3;
}

- (id)restorePrefetchDirectoryForDomain:(id)a3
{
  __CFString *v4;

  if ((objc_msgSend(a3, "shouldRestoreToSharedVolume") & 1) != 0)
  {
    v4 = CFSTR("/var/root/Library/Caches/Backup/prefetch");
  }
  else
  {
    -[MBPersona _userRestorePrefetchDirectory](self, "_userRestorePrefetchDirectory");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)restorePrefetchDirectories
{
  void *v3;
  void *v4;

  -[MBPersona _userRestorePrefetchDirectory](self, "_userRestorePrefetchDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MBPersona shouldRestoreToSharedVolume](self, "shouldRestoreToSharedVolume"))
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v3, CFSTR("/var/root/Library/Caches/Backup/prefetch"), 0);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)snapshotDatabaseDirectory
{
  void *v2;
  void *v3;

  -[MBPersona cacheDirectory](self, "cacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("snapshots"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)restoreSnapshotsDatabaseDirectory
{
  void *v2;
  void *v3;

  -[MBPersona cacheDirectory](self, "cacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("restore_snapshots"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)restoreOperationLogPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MBPersona personaIdentifier](self, "personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("RestoreOperationLog-%@.log"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  MBGetLogDir();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)l28BackupTelemetryPlistPath
{
  void *v2;
  void *v3;

  -[MBPersona cacheDirectory](self, "cacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("l28BackupTelemetry.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)systemDataContainerRestoreDirectory
{
  if (_os_feature_enabled_impl())
    return (NSString *)CFSTR("/var/root/Library/Backup/SystemContainers/Data");
  else
    return (NSString *)CFSTR("/var/mobile/Library/Backup/SystemContainers/Data");
}

- (NSString)systemSharedDataContainerRestoreDirectory
{
  if (_os_feature_enabled_impl())
    return (NSString *)CFSTR("/var/root/Library/Backup/SystemContainers/Shared");
  else
    return (NSString *)CFSTR("/var/mobile/Library/Backup/SystemContainers/Shared");
}

- (NSString)systemContainersVolumeMountPoint
{
  __CFString *v3;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v3 = CFSTR("/private/var");
  }
  else
  {
    -[MBPersona volumeMountPoint](self, "volumeMountPoint");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)restoreKeyBagsPath
{
  __CFString *v3;
  void *v4;

  if (-[MBPersona isPersonalPersona](self, "isPersonalPersona"))
  {
    v3 = CFSTR("/var/mobile/Library/Backup/RestoreKeyBag.plist");
  }
  else
  {
    -[MBPersona cacheDirectory](self, "cacheDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("RestoreKeyBag.plist"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[MBPersona restoreKeyBagsPath].cold.1();
  }
  return (NSString *)v3;
}

- (NSString)skippedFileRecordsPlistPath
{
  void *v2;
  void *v3;

  -[MBPersona cacheDirectory](self, "cacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.MobileBackup.SkippedFileRecords.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)removeRestoreKeybags
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[MBPersona restoreKeyBagsPath](self, "restoreKeyBagsPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MBGetDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v2;
    _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_DEFAULT, "Removing the restore keybags at %{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Removing the restore keybags at %{public}@", v4, v5, v6, v7, v8, v9, (uint64_t)v2);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v11 = objc_msgSend(v10, "removeItemAtPath:error:", v2, &v20);
  v12 = v20;

  if ((v11 & 1) == 0)
  {
    MBGetDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v22 = v2;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_1D5213000, v13, OS_LOG_TYPE_ERROR, "Failed to remove the restore keybags at %{public}@: %{public}@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to remove the restore keybags at %{public}@: %{public}@", v14, v15, v16, v17, v18, v19, (uint64_t)v2);
    }

  }
}

- (NSSet)volumesToBackUp
{
  MBPersona *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSSet *volumesToBackUp;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_volumesToBackUp)
  {
    if (-[MBPersona isPersonalPersona](v2, "isPersonalPersona")
      && (-[MBPersona user](v2, "user"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "isPrimaryUser"),
          v3,
          v4))
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      -[MBPersona volumeMountPoint](v2, "volumeMountPoint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWithObjects:", v6, CFSTR("/private/var"), 0);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      -[MBPersona volumeMountPoint](v2, "volumeMountPoint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithObjects:", v6, 0);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    volumesToBackUp = v2->_volumesToBackUp;
    v2->_volumesToBackUp = (NSSet *)v7;

  }
  objc_sync_exit(v2);

  return v2->_volumesToBackUp;
}

- (NSDictionary)restoreDepotRootsByVolume
{
  MBPersona *v2;
  NSDictionary *restoreDepotRootsByVolume;
  NSDictionary *v4;
  void *v5;
  int v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  restoreDepotRootsByVolume = v2->_restoreDepotRootsByVolume;
  if (!restoreDepotRootsByVolume)
  {
    if (!-[MBPersona isPersonalPersona](v2, "isPersonalPersona")
      || (-[MBPersona user](v2, "user"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isPrimaryUser"),
          v5,
          !v6))
    {
      -[MBPersona volumeMountPoint](v2, "volumeMountPoint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MBPersona cacheDirectory](v2, "cacheDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("restore_depot"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v8;
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v2->_restoreDepotRootsByVolume;
      v2->_restoreDepotRootsByVolume = (NSDictionary *)v11;

      v4 = v2->_restoreDepotRootsByVolume;
      goto LABEL_7;
    }
    v7 = v2->_restoreDepotRootsByVolume;
    v2->_restoreDepotRootsByVolume = (NSDictionary *)&unk_1E996E238;

    restoreDepotRootsByVolume = v2->_restoreDepotRootsByVolume;
  }
  v4 = restoreDepotRootsByVolume;
LABEL_7:
  objc_sync_exit(v2);

  return v4;
}

- (int64_t)accountType
{
  void *v3;
  int v4;
  void *v6;
  void *v7;

  if (-[MBPersona isPersonalPersona](self, "isPersonalPersona"))
  {
    -[MBPersona user](self, "user");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPrimaryUser");

    if (v4)
      return 1;
    else
      return 3;
  }
  else if (-[MBPersona isDataSeparatedPersona](self, "isDataSeparatedPersona"))
  {
    return 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MBPersona accountType]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MBPersona.m"), 423, CFSTR("Unexpected call"));

    return 0;
  }
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (void)setPersonaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_personaIdentifier, a3);
}

- (BOOL)isDataSeparatedPersona
{
  return self->_isDataSeparatedPersona;
}

- (void)setIsDataSeparatedPersona:(BOOL)a3
{
  self->_isDataSeparatedPersona = a3;
}

- (NSString)volumeMountPoint
{
  return self->_volumeMountPoint;
}

- (void)setVolumeMountPoint:(id)a3
{
  objc_storeStrong((id *)&self->_volumeMountPoint, a3);
}

- (void)setVolumesToBackUp:(id)a3
{
  objc_storeStrong((id *)&self->_volumesToBackUp, a3);
}

- (void)setRestoreDepotRootsByVolume:(id)a3
{
  objc_storeStrong((id *)&self->_restoreDepotRootsByVolume, a3);
}

- (unint64_t)userPersonaType
{
  return self->_userPersonaType;
}

- (void)setUserPersonaType:(unint64_t)a3
{
  self->_userPersonaType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreDepotRootsByVolume, 0);
  objc_storeStrong((id *)&self->_volumesToBackUp, 0);
  objc_storeStrong((id *)&self->_volumeMountPoint, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

- (void)initWithPersonaIdentifier:userPersonaType:dataSeparatedPersona:volumeMountPoint:.cold.1()
{
  __assert_rtn("-[MBPersona initWithPersonaIdentifier:userPersonaType:dataSeparatedPersona:volumeMountPoint:]", "MBPersona.m", 65, "personaIdentifier");
}

- (void)initWithPersonaIdentifier:userPersonaType:dataSeparatedPersona:volumeMountPoint:.cold.2()
{
  __assert_rtn("-[MBPersona initWithPersonaIdentifier:userPersonaType:dataSeparatedPersona:volumeMountPoint:]", "MBPersona.m", 66, "volumeMountPoint");
}

- (void)initWithPersonaAttributes:volumeMountPoint:.cold.1()
{
  __assert_rtn("-[MBPersona initWithPersonaAttributes:volumeMountPoint:]", "MBPersona.m", 79, "personaAttributes");
}

- (void)initWithUMPersona:error:.cold.1()
{
  __assert_rtn("-[MBPersona initWithUMPersona:error:]", "MBPersona.m", 85, "persona");
}

- (void)initWithUMPersona:error:.cold.2()
{
  __assert_rtn("-[MBPersona initWithUMPersona:error:]", "MBPersona.m", 86, "error");
}

- (void)initWithUMPersona:error:.cold.3()
{
  __assert_rtn("-[MBPersona initWithUMPersona:error:]", "MBPersona.m", 100, "!personaAttributes || personaAttributes.isPersonalPersona");
}

- (void)initWithUMPersona:error:.cold.4()
{
  __assert_rtn("-[MBPersona initWithUMPersona:error:]", "MBPersona.m", 107, "personaAttributes.isPersonalPersona");
}

- (void)user
{
  __assert_rtn("-[MBPersona user]", "MBPersona.m", 169, "user");
}

- (void)cacheDirectory
{
  __assert_rtn("-[MBPersona cacheDirectory]", "MBPersona.m", 185, "dir");
}

- (void)preferencesDirectory
{
  __assert_rtn("-[MBPersona preferencesDirectory]", "MBPersona.m", 197, "dir");
}

- (void)sqliteCopyDirectory
{
  __assert_rtn("-[MBPersona sqliteCopyDirectory]", "MBPersona.m", 203, "dir");
}

- (void)appPlaceholderArchiveDirectory
{
  __assert_rtn("-[MBPersona appPlaceholderArchiveDirectory]", "MBPersona.m", 215, "dir");
}

- (void)userRestoreDirectory
{
  __assert_rtn("-[MBPersona userRestoreDirectory]", "MBPersona.m", 232, "dir");
}

- (void)userIncompleteRestoreDirectory
{
  __assert_rtn("-[MBPersona userIncompleteRestoreDirectory]", "MBPersona.m", 247, "dir");
}

- (void)placeholderRestoreDirectory
{
  __assert_rtn("-[MBPersona placeholderRestoreDirectory]", "MBPersona.m", 262, "dir");
}

- (void)demotedAppsPlistPath
{
  __assert_rtn("-[MBPersona demotedAppsPlistPath]", "MBPersona.m", 273, "path");
}

- (void)_userRestorePrefetchDirectory
{
  __assert_rtn("-[MBPersona _userRestorePrefetchDirectory]", "MBPersona.m", 288, "dir");
}

- (void)restoreKeyBagsPath
{
  __assert_rtn("-[MBPersona restoreKeyBagsPath]", "MBPersona.m", 357, "path");
}

@end
