@implementation MSDDomainsPlistPatcher

+ (id)patchDomainsPlist:(id)a3
{
  id v3;
  int has_internal_content;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  uint8_t buf[16];
  uint8_t v47[16];

  v3 = a3;
  has_internal_content = os_variant_has_internal_content();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.1((uint64_t)v3, v7);
    goto LABEL_141;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("SystemDomains"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    defaultLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_213A7E000, v31, OS_LOG_TYPE_DEFAULT, "Cannot find system domains.", v47, 2u);
    }

    goto LABEL_141;
  }
  -[NSObject objectForKey:](v7, "objectForKey:", CFSTR("CameraRollDomain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v3;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!has_internal_content)
    {
      v10 = 0;
      goto LABEL_16;
    }
    defaultLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.2();

LABEL_140:
LABEL_141:
    v29 = 0;
    goto LABEL_116;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsNotToBackup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_12;
    defaultLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.25();

    goto LABEL_140;
  }
  objc_msgSend(v9, "removeObject:", CFSTR("Media/PhotoData/Sync"));
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("RelativePathsNotToBackup"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("CameraRollDomain"));
LABEL_12:
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsToRemoveOnRestore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "removeObject:", CFSTR("Media/PhotoData/Sync"));
    objc_msgSend(v10, "removeObject:", CFSTR("Media/PhotoData/Metadata/PhotoData/Sync"));
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("RelativePathsToRemoveOnRestore"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("CameraRollDomain"));
  }
  else if (has_internal_content)
  {
    defaultLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.26();
    goto LABEL_159;
  }
LABEL_16:
  -[NSObject objectForKey:](v7, "objectForKey:", CFSTR("HomeKitDomain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToRemoveOnRestore"));
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if ((v12 || (v12 = objc_alloc_init(MEMORY[0x24BDBCEB8])) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v12, "addObject:", CFSTR("Library/homed/protected-home.config"));
        objc_msgSend(v12, "addObject:", CFSTR("Library/homed/datastore.sqlite"));
        objc_msgSend(v12, "addObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
        objc_msgSend(v12, "addObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
        objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("RelativePathsToRemoveOnRestore"));
        -[NSObject setObject:forKey:](v7, "setObject:forKey:", v11, CFSTR("HomeKitDomain"));
      }
      else if (has_internal_content)
      {
        defaultLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.20();
        goto LABEL_190;
      }
      objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsNotToBackupToService"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v10, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
        objc_msgSend(v10, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
        objc_msgSend(v10, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
        objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("RelativePathsNotToBackupToService"));
        -[NSObject setObject:forKey:](v7, "setObject:forKey:", v11, CFSTR("HomeKitDomain"));
      }
      else if (has_internal_content)
      {
        defaultLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.21();
LABEL_153:

LABEL_191:
        goto LABEL_187;
      }
      objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsNotToBackupInMegaBackup"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v13, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
        objc_msgSend(v13, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
        objc_msgSend(v13, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
        objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("RelativePathsNotToBackupInMegaBackup"));
        -[NSObject setObject:forKey:](v7, "setObject:forKey:", v11, CFSTR("HomeKitDomain"));
      }
      else if (has_internal_content)
      {
        defaultLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.22();

        goto LABEL_191;
      }
      objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToRestoreOnly"));
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "removeObject:", CFSTR("Library/homed/protected-home.config"));
          objc_msgSend(v12, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
          objc_msgSend(v12, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
          objc_msgSend(v12, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
          objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("RelativePathsToRestoreOnly"));
          -[NSObject setObject:forKey:](v7, "setObject:forKey:", v11, CFSTR("HomeKitDomain"));
          goto LABEL_35;
        }
      }
      if (!has_internal_content)
      {
LABEL_35:
        objc_msgSend(v11, "objectForKey:", CFSTR("RelativePathsToOnlyBackupEncrypted"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "removeObject:", CFSTR("Library/homed/protected-home.config"));
            objc_msgSend(v10, "removeObject:", CFSTR("Library/homed/datastore.sqlite"));
            objc_msgSend(v10, "removeObject:", CFSTR("Library/homed/datastore.sqlite-shm"));
            objc_msgSend(v10, "removeObject:", CFSTR("Library/homed/datastore.sqlite-wal"));
            objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("RelativePathsToOnlyBackupEncrypted"));
            -[NSObject setObject:forKey:](v7, "setObject:forKey:", v11, CFSTR("HomeKitDomain"));
            goto LABEL_39;
          }
        }
        if (!has_internal_content)
          goto LABEL_39;
        defaultLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.24();
        goto LABEL_153;
      }
      defaultLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.23();
LABEL_190:

      goto LABEL_191;
    }
  }
LABEL_39:
  -[NSObject objectForKey:](v7, "objectForKey:", CFSTR("HomeDomain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!has_internal_content)
    {
      v15 = 0;
      goto LABEL_86;
    }
    defaultLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.3();
    goto LABEL_159;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsNotToBackup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v14, "addObject:", CFSTR("Library/Preferences/com.apple.identityservices.idstatuscache.plist"));
    objc_msgSend(v14, "addObject:", CFSTR("Library/Preferences/com.apple.identityservicesd.plist"));
    objc_msgSend(v14, "addObject:", CFSTR("Library/Preferences/com.apple.ids.deviceproperties.plist"));
    objc_msgSend(v14, "addObject:", CFSTR("Library/Preferences/com.apple.ids.subservices.plist"));
    objc_msgSend(v14, "addObject:", CFSTR("Library/Preferences/com.apple.ids.plist"));
    objc_msgSend(v14, "removeObject:", CFSTR("Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db"));
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("RelativePathsNotToBackup"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    defaultLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.11();

    goto LABEL_186;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!has_internal_content)
    {
      v15 = 0;
      goto LABEL_58;
    }
    defaultLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.12();
LABEL_159:

LABEL_185:
    goto LABEL_186;
  }
  objc_msgSend(v10, "removeObject:", CFSTR("Library/Accounts"));
  objc_msgSend(v10, "removeObject:", CFSTR("Library/DeviceRegistry"));
  objc_msgSend(v10, "removeObject:", CFSTR("Library/DeviceRegistry.state"));
  objc_msgSend(v10, "removeObject:", CFSTR("Library/MobileBluetooth"));
  objc_msgSend(v10, "addObject:", CFSTR("Library/Application Support/ScreenSaverManager"));
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsToBackupToDriveAndStandardAccount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v18, CFSTR("RelativePathsToBackupToDriveAndStandardAccount"));

    v10 = (void *)v17;
  }
  else
  {
    defaultLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A7E000, v19, OS_LOG_TYPE_DEFAULT, "Cannot find RelativePathsToBackupToDriveAndStandardAccount under HomeDomain.", buf, 2u);
    }

  }
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("HomeDomain"));
LABEL_58:
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v20, "addObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurations.json"));
    objc_msgSend(v20, "addObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"));
    objc_msgSend(v8, "setObject:forKey:", v20, CFSTR("RelativePathsToBackupAndRestore"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    defaultLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.13();
    goto LABEL_177;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsToRestoreOnly"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurations.json"));
    objc_msgSend(v10, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"));
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("RelativePathsToRestoreOnly"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    defaultLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.14();
    goto LABEL_184;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsToOnlyBackupEncrypted"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v20, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurations.json"));
    objc_msgSend(v20, "removeObject:", CFSTR("Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"));
    objc_msgSend(v8, "setObject:forKey:", v20, CFSTR("RelativePathsToOnlyBackupEncrypted"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    defaultLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.15();
    goto LABEL_177;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "addObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("RelativePathsToBackupAndRestore"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    defaultLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.16();
    goto LABEL_184;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsToRestoreOnly"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v20, "removeObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v8, "setObject:forKey:", v20, CFSTR("RelativePathsToRestoreOnly"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    defaultLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.17();
    goto LABEL_177;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsToOnlyBackupEncrypted"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v21, "removeObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v8, "setObject:forKey:", v21, CFSTR("RelativePathsToOnlyBackupEncrypted"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    defaultLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.18();
LABEL_172:

LABEL_186:
    goto LABEL_187;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsNotToBackupToService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "removeObject:", CFSTR("Library/Safari/SafariTabs.db"));
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("RelativePathsNotToBackupToService"));
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("HomeDomain"));
  }
  else if (has_internal_content)
  {
    defaultLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.19();
    goto LABEL_184;
  }
LABEL_86:
  -[NSObject objectForKey:](v7, "objectForKey:", CFSTR("KeychainDomain"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("RelativePathsToBackupAndRestore"));

    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v22, CFSTR("KeychainDomain"));
  }
  else if (has_internal_content)
  {
    defaultLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.4();

    goto LABEL_187;
  }
  -[NSObject objectForKey:](v7, "objectForKey:", CFSTR("MediaDomain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!has_internal_content)
    {
      v20 = v10;
      goto LABEL_98;
    }
    defaultLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.5();
LABEL_184:

    goto LABEL_185;
  }
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("RelativePathsNotToBackupToDrive"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("MediaDomain"));
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_98;
    defaultLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.10();
LABEL_177:

    goto LABEL_186;
  }
  objc_msgSend(v20, "removeObject:", CFSTR("Media/iTunes_Control/Device/Trainer"));
  objc_msgSend(v20, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/iTunesPrefs.plist"));
  objc_msgSend(v20, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/MobileSync.plist"));
  objc_msgSend(v20, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/iPhotoAlbumPrefs"));
  objc_msgSend(v20, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/ApertureAlbumPrefs"));
  objc_msgSend(v20, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PSAlbumAlbums"));
  objc_msgSend(v20, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PSElementsAlbums"));
  objc_msgSend(v20, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PhotosFolderPrefs"));
  objc_msgSend(v20, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PhotosFolderAlbums"));
  objc_msgSend(v20, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/PhotosFolderName"));
  objc_msgSend(v20, "removeObject:", CFSTR("Media/iTunes_Control/iTunes/MediaLibrary.sqlitedb"));
  objc_msgSend(v20, "addObject:", CFSTR("Media/iTunes_Control/iTunes"));
  objc_msgSend(v20, "addObject:", CFSTR("Media/iTunes_Control/Music"));
  objc_msgSend(v20, "addObject:", CFSTR("Media/iTunes_Control/Sync"));
  objc_msgSend(v20, "addObject:", CFSTR("Media/iTunes_Control/Artwork"));
  objc_msgSend(v20, "addObject:", CFSTR("Media/Books"));
  objc_msgSend(v20, "addObject:", CFSTR("Media/Music/Downloads"));
  objc_msgSend(v8, "setObject:forKey:", v20, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("MediaDomain"));
LABEL_98:
  -[NSObject objectForKey:](v7, "objectForKey:", CFSTR("RootDomain"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!has_internal_content)
    {
      v21 = v20;
      goto LABEL_106;
    }
    defaultLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.6();

LABEL_181:
LABEL_187:
    v29 = 0;
    goto LABEL_115;
  }
  objc_msgSend(v24, "objectForKey:", CFSTR("RelativePathsNotToRestore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_106;
    defaultLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.9();

    goto LABEL_181;
  }
  objc_msgSend(v21, "addObject:", CFSTR("Library/Preferences/com.apple.ASPCarryLog.plist"));
  objc_msgSend(v24, "setObject:forKey:", v21, CFSTR("RelativePathsToRemoveOnRestore"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v24, CFSTR("RootDomain"));
LABEL_106:
  -[NSObject objectForKey:](v7, "objectForKey:", CFSTR("SystemPreferencesDomain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!has_internal_content)
    {
      v10 = v21;
      goto LABEL_114;
    }
    defaultLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.7();
    goto LABEL_172;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("RelativePathsNotToBackup"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!has_internal_content)
      goto LABEL_114;
    defaultLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      +[MSDDomainsPlistPatcher patchDomainsPlist:].cold.8();
    goto LABEL_184;
  }
  objc_msgSend(v10, "addObject:", CFSTR("SystemConfiguration/com.apple.wifi.plist"));
  objc_msgSend(v10, "addObject:", CFSTR("SystemConfiguration/com.apple.wifi-networks.plist"));
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("RelativePathsNotToBackup"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("SystemPreferencesDomain"));
LABEL_114:
  v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v25, "setObject:forKey:", CFSTR("/var/MobileAsset"), CFSTR("RootPath"));
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

  objc_msgSend(v26, "addObject:", CFSTR("AssetsV2/com_apple_MobileAsset_SystemEnvironmentAsset"));
  objc_msgSend(v26, "addObject:", CFSTR("PreinstalledAssetsV2/InstallWithOs"));
  objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v25, CFSTR("MobileAssetDomain"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setObject:forKey:", CFSTR("/var/mobile/XcodeBuiltProducts"), CFSTR("RootPath"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "addObject:", CFSTR("PressDemoScripts.xctestproducts"));
  objc_msgSend(v27, "setObject:forKey:", v28, CFSTR("RelativePathsToBackupAndRestore"));
  -[NSObject setObject:forKey:](v7, "setObject:forKey:", v27, CFSTR("DemoPortalScriptsDomain"));
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("SystemDomains"));
  v29 = v6;

LABEL_115:
  v3 = v45;
LABEL_116:

  return v29;
}

+ (void)patchDomainsPlist:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_213A7E000, a2, OS_LOG_TYPE_ERROR, "Cannot load Domains.plist: %{public}@.", (uint8_t *)&v2, 0xCu);
}

+ (void)patchDomainsPlist:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find CameraRollDomain, or in wrong format.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find HomeDomain, or in wrong format.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find KeychainDomain, or in wrong format.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find MediaDomain, or in wrong format.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RootDomain, or in wrong format.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find SystemPreferencesDomain, or in wrong format.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsNotToBackup under SystemPreferencesDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under RootDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsToBackupAndRestore under MediaDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsNotToBackup under HomeDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToRestoreOnly under HomeDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToOnlyBackupEncrypted under HomeDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToRestoreOnly under HomeDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToOnlyBackupEncrypted under HomeDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.19()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsNotToBackupToService under HomeDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under HomeKitDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.21()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsNotToBackupToService under HomeKitDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.22()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsNotToBackupInMegaBackup under HomeKitDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.23()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsToRestoreOnly under HomeKitDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsToOnlyBackupEncrypted under HomeKitDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.25()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsNotToBackup under CameraRollDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)patchDomainsPlist:.cold.26()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under CameraRollDomain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
