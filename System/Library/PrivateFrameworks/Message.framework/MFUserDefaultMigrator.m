@implementation MFUserDefaultMigrator

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MFUserDefaultMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_33 != -1)
    dispatch_once(&log_onceToken_33, block);
  return (id)log_log_33;
}

void __28__MFUserDefaultMigrator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_33;
  log_log_33 = (uint64_t)v1;

}

+ (id)oldKeysToNewKeysMap
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("ReplyToSelf");
  v4[0] = *MEMORY[0x1E0D1DFF8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_keysToMigrateToSharedAppGroup
{
  objc_msgSend(&unk_1E4F69A00, "arrayByAddingObjectsFromArray:", &unk_1E4F69A18);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)_migrateExtPropertiesPlist
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _QWORD v38[7];

  v38[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.mobilemail"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dataContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(CFSTR("com.apple.MailAccount-ExtProperties"), "stringByAppendingPathExtension:", CFSTR("plist"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    v38[0] = v3;
    v38[1] = CFSTR("Library");
    v38[2] = CFSTR("Preferences");
    v38[3] = v4;
    v25 = (void *)v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathWithComponents:", v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileExistsAtPath:", v26);

    +[MFUserDefaultMigrator log](MFUserDefaultMigrator, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("Not Found");
      if (v8)
        v10 = CFSTR("Found");
      *(_DWORD *)buf = 138543618;
      v35 = (void *)v10;
      v36 = 2112;
      v37 = v26;
      _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_DEFAULT, "extPropertiesDomain %{public}@ at path: %@", buf, 0x16u);
    }

    if (v8)
    {
      v24 = (void *)_CFPreferencesCopyValueWithContainer();
      if ((objc_msgSend(v24, "BOOLValue") & 1) != 0)
      {
        +[MFUserDefaultMigrator log](MFUserDefaultMigrator, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "extPropertiesDomain already migrated to shared app group.", buf, 2u);
        }
      }
      else
      {
        v23 = _CFPreferencesCopyKeyListWithContainer();
        if (-[NSObject count](v23, "count"))
        {
          +[MFUserDefaultMigrator log](MFUserDefaultMigrator, "log");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "Migrating extPropertiesDomain to shared app group.", buf, 2u);
          }

          v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v15 = v23;
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v30;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v30 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
                v20 = (void *)_CFPreferencesCopyValueWithContainer();
                -[NSObject setObject:forKey:](v14, "setObject:forKey:", v20, v19);
                _CFPreferencesSetValueWithContainer();

              }
              v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            }
            while (v16);
          }

          objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v14, CFSTR("com.apple.MailAccount-ExtProperties"));

          +[MFUserDefaultMigrator log](MFUserDefaultMigrator, "log");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v14;
            _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "Migrated following extPropertiesDomain defaults to shared app group: %@", buf, 0xCu);
          }

        }
        else
        {
          +[MFUserDefaultMigrator log](MFUserDefaultMigrator, "log");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "No keys found to migrate in extPropertiesDomain.", buf, 2u);
          }
        }

        _CFPreferencesSetValueWithContainer();
        v11 = v23;
      }

    }
  }
  else
  {
    +[MFUserDefaultMigrator log](MFUserDefaultMigrator, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    v25 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "MobileMail container path not found - Skipping extProperties migration.", buf, 2u);
    }
  }

}

+ (BOOL)migratePreferencesToSharedAppGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  pid_t v8;
  char *v9;
  size_t v11;
  const char *v12;
  size_t size;
  int v14[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "oldKeysToNewKeysMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "migrateDefaultsFromOldKeysToNewKeys:", v3);

  objc_msgSend(a1, "_keysToMigrateToSharedAppGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "migrateDefaults:", v4);

  objc_msgSend(a1, "_migrateExtPropertiesPlist");
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currentDeviceIdentifer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("DeviceIdentifier"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronize");

  *(_OWORD *)v14 = xmmword_1A5999B50;
  v15 = 0;
  size = 0xAAAAAAAAAAAAAAAALL;
  v8 = sysctl(v14, 3u, 0, &size, 0, 0);
  if (!v8)
  {
    v9 = (char *)malloc_type_malloc(size, 0xE81E6E4FuLL);
    v8 = sysctl(v14, 3u, v9, &size, 0, 0);
    if (!v8)
    {
      if (size < 0x288)
      {
LABEL_12:
        free(v9);
        return 1;
      }
      v11 = size / 0x288;
      v12 = v9 + 243;
      while (1)
      {
        v8 = *(_DWORD *)(v12 - 203);
        if (v8 >= 1 && !strncmp("maild", v12, 0x10uLL))
          break;
        v12 += 648;
        if (!--v11)
          goto LABEL_12;
      }
      free(v9);
      goto LABEL_5;
    }
    free(v9);
  }
  if (v8 >= 1)
LABEL_5:
    kill(v8, 9);
  return 1;
}

+ (void)migrateDefaults:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "migratePropertyForOldKey:newKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7), *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7), (_QWORD)v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (void)migrateDefaultsFromOldKeysToNewKeys:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__MFUserDefaultMigrator_migrateDefaultsFromOldKeysToNewKeys___block_invoke;
  v3[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSString_16_B24l;
  v3[4] = a1;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __61__MFUserDefaultMigrator_migrateDefaultsFromOldKeysToNewKeys___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "migratePropertyForOldKey:newKey:", a2, a3);
}

+ (void)migratePropertyForOldKey:(id)a3 newKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(a1, "mobileMailDefaultForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[MFUserDefaultMigrator log](MFUserDefaultMigrator, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412802;
        v14 = v6;
        v15 = 2112;
        v16 = v7;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "Migrating %@ to %@ with default %@", (uint8_t *)&v13, 0x20u);
      }

      objc_msgSend(v8, "setObject:forKey:", v10, v7);
      objc_msgSend(a1, "removeMobileMailDefaultForKey:", v6);
    }
    else
    {
      +[MFUserDefaultMigrator log](MFUserDefaultMigrator, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "No default for key %@", (uint8_t *)&v13, 0xCu);
      }

    }
  }

}

+ (id)currentDeviceIdentifer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.mobilemail"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)_CFPreferencesCopyValueWithContainer();
  return v5;
}

+ (id)mobileMailDefaultForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.mobilemail"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataContainerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)_CFPreferencesCopyValueWithContainer();
  return v7;
}

+ (void)removeMobileMailDefaultForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.mobilemail"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataContainerURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _CFPreferencesSetValueWithContainer();
  _CFPreferencesSynchronizeWithContainer();

}

@end
