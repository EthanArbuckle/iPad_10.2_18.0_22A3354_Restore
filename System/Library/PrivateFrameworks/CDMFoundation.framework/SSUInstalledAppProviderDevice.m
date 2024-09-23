@implementation SSUInstalledAppProviderDevice

- (SSUInstalledAppProviderDevice)initWithLocale:(id)a3
{
  NSString *v4;
  SSUInstalledAppProviderDevice *v5;
  NSString *locale;
  objc_super v8;

  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SSUInstalledAppProviderDevice;
  v5 = -[SSUInstalledAppProviderDevice init](&v8, sel_init);
  locale = v5->_locale;
  v5->_locale = v4;

  return v5;
}

- (id)lookupSSUEnabledAppByBundleId:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v11);
  v6 = v11;
  if (v5)
  {
    -[SSUInstalledAppProviderDevice applicationInfoFromAppRecord:](self, "applicationInfoFromAppRecord:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v13 = "-[SSUInstalledAppProviderDevice lookupSSUEnabledAppByBundleId:]";
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v10;
      _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Could not lookup app with bundle ID: %@. Error: %@", buf, 0x20u);

    }
    v7 = 0;
  }

  return v7;
}

- (id)lookupAllSSUEnabledApps
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  __int128 v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SSUInstalledAppProviderDevice lookupAllSSUEnabledApps]";
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Looking up all installed SSU-enabled apps.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 136315650;
    v18 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        -[SSUInstalledAppProviderDevice applicationInfoFromAppRecord:](self, "applicationInfoFromAppRecord:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10), v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          CDMOSLoggerForCategory(0);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "bundleIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "assetURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "path");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v18;
            v25 = "-[SSUInstalledAppProviderDevice lookupAllSSUEnabledApps]";
            v26 = 2112;
            v27 = (uint64_t)v13;
            v28 = 2112;
            v29 = v14;
            _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Found SSU app %@ with asset URL %@", buf, 0x20u);

          }
          objc_msgSend(v4, "addObject:", v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v8);
  }
  CDMOSLoggerForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 136315394;
    v25 = "-[SSUInstalledAppProviderDevice lookupAllSSUEnabledApps]";
    v26 = 2048;
    v27 = v17;
    _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Found %lu SSU-enabled apps in total.", buf, 0x16u);
  }

  return v4;
}

- (id)applicationInfoFromAppRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *locale;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v4, "isPlaceholder") & 1) == 0)
  {
    v7 = objc_alloc(MEMORY[0x24BDD1488]);
    objc_msgSend(v4, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "_initUniqueWithURL:", v8);
    objc_msgSend(v9, "SSUAssetPathForLocale:", self->_locale);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      locale = self->_locale;
      v19 = 0;
      objc_msgSend(MEMORY[0x24BE9E3C0], "applicationInfoWithBundleIdentifier:assetURL:forLocale:error:", v5, v10, locale, &v19);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v19;
      CDMOSLoggerForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v6)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v6, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v21 = "-[SSUInstalledAppProviderDevice applicationInfoFromAppRecord:]";
          v22 = 2112;
          v23 = v17;
          _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s Found SSU-enabled app: %@", buf, 0x16u);

        }
        v15 = v6;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v21 = "-[SSUInstalledAppProviderDevice applicationInfoFromAppRecord:]";
          v22 = 2112;
          v23 = v5;
          v24 = 2112;
          v25 = v10;
          v26 = 2112;
          v27 = v18;
          _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to build SNLPSSUApplicationInfo instance for bundle ID=%@ and app asset URL=%@: %@. Ignoring app.", buf, 0x2Au);

        }
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
