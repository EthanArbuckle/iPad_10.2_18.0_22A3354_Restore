@implementation SSUInstalledAppProviderSandbox

- (SSUInstalledAppProviderSandbox)initWithDirectory:(id)a3 locale:(id)a4
{
  NSURL *v6;
  NSString *v7;
  SSUInstalledAppProviderSandbox *v8;
  NSURL *directory;
  NSURL *v10;
  NSString *locale;
  objc_super v13;

  v6 = (NSURL *)a3;
  v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SSUInstalledAppProviderSandbox;
  v8 = -[SSUInstalledAppProviderSandbox init](&v13, sel_init);
  directory = v8->_directory;
  v8->_directory = v6;
  v10 = v6;

  locale = v8->_locale;
  v8->_locale = v7;

  return v8;
}

- (id)lookupSSUEnabledAppByBundleId:(id)a3
{
  NSURL *v4;
  NSURL *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  NSString *locale;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSURL *directory;
  NSURL *v19;
  void *v20;
  id v21;
  char v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSURL *v26;
  __int16 v27;
  NSURL *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (NSURL *)a3;
  -[NSURL URLByAppendingPathComponent:](self->_directory, "URLByAppendingPathComponent:", v4);
  v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v22);

  if ((v8 & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      directory = self->_directory;
      *(_DWORD *)buf = 136315650;
      v24 = "-[SSUInstalledAppProviderSandbox lookupSSUEnabledAppByBundleId:]";
      v25 = 2112;
      v26 = directory;
      v27 = 2112;
      v28 = v4;
      _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s The installed app sandbox directory %@ not contain a subdirectory: %@. Reporting app as not available.", buf, 0x20u);
    }
    goto LABEL_12;
  }
  if (!v22)
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SSUInstalledAppProviderSandbox lookupSSUEnabledAppByBundleId:]";
      v25 = 2112;
      v26 = v5;
      _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: The installed app sandbox directory has a non-directory file: %@. Reporting app as not available.", buf, 0x16u);
    }
LABEL_12:
    v12 = 0;
    goto LABEL_21;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "_initUniqueWithURL:", v5);
  objc_msgSend(v9, "SSUAssetPathForLocale:", self->_locale);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    locale = self->_locale;
    v21 = 0;
    objc_msgSend(MEMORY[0x24BE9E3C0], "applicationInfoWithBundleIdentifier:assetURL:forLocale:error:", v4, v10, locale, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v12, "bundleIdentifier");
        v19 = (NSURL *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v24 = "-[SSUInstalledAppProviderSandbox lookupSSUEnabledAppByBundleId:]";
        v25 = 2112;
        v26 = v19;
        _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Found SSU-enabled app in sandbox: %@", buf, 0x16u);

      }
      v16 = v12;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v24 = "-[SSUInstalledAppProviderSandbox lookupSSUEnabledAppByBundleId:]";
        v25 = 2112;
        v26 = v4;
        v27 = 2112;
        v28 = v5;
        v29 = 2112;
        v30 = v20;
        _os_log_error_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to build SNLPSSUApplicationInfo instance for bundle ID=%@ and app asset URL=%@: %@. Ignoring app.", buf, 0x2Au);

      }
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SSUInstalledAppProviderSandbox lookupSSUEnabledAppByBundleId:]";
      v25 = 2112;
      v26 = v5;
      _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s The installed app sandbox directory app is not SSU-enabled: %@ (no asset subdirectory found). Reporting app as not available.", buf, 0x16u);
    }
    v12 = 0;
  }

LABEL_21:
  return v12;
}

- (id)lookupAllSSUEnabledApps
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSURL *directory;
  uint64_t v21;
  NSURL *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    directory = self->_directory;
    *(_DWORD *)buf = 136315394;
    v34 = "-[SSUInstalledAppProviderSandbox lookupAllSSUEnabledApps]";
    v35 = 2112;
    v36 = (uint64_t)directory;
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Looking up all installed SSU-enabled apps in sandbox directory: %@.", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_directory, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v5, &v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v31;

  if (v6)
  {
    v24 = v7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          -[SSUInstalledAppProviderSandbox lookupSSUEnabledAppByBundleId:](self, "lookupSSUEnabledAppByBundleId:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            CDMOSLoggerForCategory(0);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v14, "bundleIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "assetURL");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "path");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v34 = "-[SSUInstalledAppProviderSandbox lookupAllSSUEnabledApps]";
              v35 = 2112;
              v36 = (uint64_t)v16;
              v37 = 2112;
              v38 = v17;
              _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Found SSU app %@ with asset URL %@", buf, 0x20u);

            }
            objc_msgSend(v8, "addObject:", v14);
          }

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }

    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 136315394;
      v34 = "-[SSUInstalledAppProviderSandbox lookupAllSSUEnabledApps]";
      v35 = 2048;
      v36 = v21;
      _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s Found %lu SSU-enabled apps in total in sandbox.", buf, 0x16u);
    }
    v7 = v24;
    v6 = v25;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = self->_directory;
      +[CDMPlatformUtils prettyPrintError:](CDMPlatformUtils, "prettyPrintError:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v34 = "-[SSUInstalledAppProviderSandbox lookupAllSSUEnabledApps]";
      v35 = 2112;
      v36 = (uint64_t)v22;
      v37 = 2112;
      v38 = v23;
      _os_log_error_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to list contents of directory %@ due to error: %@. Returning no installed apps.", buf, 0x20u);

    }
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (NSURL)directory
{
  return self->_directory;
}

- (NSString)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

@end
