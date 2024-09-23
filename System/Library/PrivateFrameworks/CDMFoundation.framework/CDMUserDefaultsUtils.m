@implementation CDMUserDefaultsUtils

+ (BOOL)prewarmModels
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:](CDMUserDefaultsUtils, "readUserDefaultForKeyBool:andDefaultValue:", CFSTR("prewarm models"), 1);
}

+ (unsigned)readNonSiriSelfSampleRate
{
  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
    return objc_msgSend(a1, "readUserDefaultsValueForKeyUint64:defaultValue:", CFSTR("non siri sample rate"), 5);
  else
    return 5;
}

+ (id)readCustomAssetsRootPath
{
  _BOOL4 v2;
  void *v3;
  uint64_t v4;

  v2 = +[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall");
  +[CDMUserDefaultsUtils getDefaultCustomAssetsRootPath](CDMUserDefaultsUtils, "getDefaultCustomAssetsRootPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[CDMUserDefaultsUtils readUserDefaultForKeyString:andDefaultValue:](CDMUserDefaultsUtils, "readUserDefaultForKeyString:andDefaultValue:", CFSTR("custom assets root path"), v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

+ (id)getDefaultCustomAssetsRootPath
{
  return CFSTR("/System/Library/PrivateFrameworks/ContinuousDialogManagerService.framework");
}

+ (unsigned)readGraphRunnerMaxConcurrentCount
{
  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
    return objc_msgSend(a1, "readUserDefaultsValueForKeyUint64:defaultValue:", CFSTR("graph runner max concurrent count"), 6);
  else
    return 6;
}

+ (void)initialize
{
  SafeMutableDictionary *v2;
  void *v3;

  v2 = objc_alloc_init(SafeMutableDictionary);
  v3 = (void *)_userDefaultsCache;
  _userDefaultsCache = (uint64_t)v2;

}

+ (id)userDefaultsCache
{
  return (id)_userDefaultsCache;
}

+ (BOOL)readUserDefaultForKeyBool:(id)a3 andDefaultValue:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  char v18;
  _BYTE v20[24];
  id v21;
  __int128 v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[CDMUserDefaultsUtils userDefaultsCache](CDMUserDefaultsUtils, "userDefaultsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.cdm"));
  objc_msgSend(v8, "objectForKey:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    if (v7)
      v11 = v7 == (void *)v9;
    else
      v11 = 0;
    v12 = v7;
    if (!v11)
    {
      CDMOSLoggerForCategory(1);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v20 = 136315906;
        *(_QWORD *)&v20[4] = "+[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:]";
        *(_WORD *)&v20[12] = 2112;
        *(_QWORD *)&v20[14] = CFSTR("com.apple.siri.cdm");
        *(_WORD *)&v20[22] = 2112;
        v21 = v5;
        LOWORD(v22) = 2112;
        *(_QWORD *)((char *)&v22 + 2) = v10;
        v14 = "%s defaults read \"%@\" \"%@\" -> %@";
LABEL_14:
        _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, v14, v20, 0x2Au);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v7)
      v16 = v7 == (void *)v15;
    else
      v16 = 0;
    v12 = v7;
    if (!v16)
    {
      v10 = (void *)v15;
      CDMOSLoggerForCategory(1);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v20 = 136315906;
        *(_QWORD *)&v20[4] = "+[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:]";
        *(_WORD *)&v20[12] = 2112;
        *(_QWORD *)&v20[14] = CFSTR("com.apple.siri.cdm");
        *(_WORD *)&v20[22] = 2112;
        v21 = v5;
        LOWORD(v22) = 2112;
        *(_QWORD *)((char *)&v22 + 2) = v10;
        v14 = "%s defaults read \"%@\" \"%@\" -> not set. Using default value: %@";
        goto LABEL_14;
      }
LABEL_15:

      +[CDMUserDefaultsUtils userDefaultsCache](CDMUserDefaultsUtils, "userDefaultsCache");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v10, v5);

      v12 = v10;
    }
  }
  v18 = objc_msgSend(v12, "BOOLValue", *(_OWORD *)v20, *(_QWORD *)&v20[16], v21, v22);

  return v18;
}

+ (id)readUserDefaultForKeyString:(id)a3 andDefaultValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  id v16;
  void *v17;
  int v19;
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[CDMUserDefaultsUtils userDefaultsCache](CDMUserDefaultsUtils, "userDefaultsCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.cdm"));
  objc_msgSend(v9, "stringForKey:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v16 = v6;
    v11 = v16;
    if (v8 && v8 == v16)
      goto LABEL_14;
    CDMOSLoggerForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v19 = 136315906;
      v20 = "+[CDMUserDefaultsUtils readUserDefaultForKeyString:andDefaultValue:]";
      v21 = 2112;
      v22 = CFSTR("com.apple.siri.cdm");
      v23 = 2112;
      v24 = v5;
      v25 = 2112;
      v26 = v11;
      v15 = "%s defaults read \"%@\" \"%@\" -> not set. Using default value: %@";
      goto LABEL_12;
    }
LABEL_13:

    +[CDMUserDefaultsUtils userDefaultsCache](CDMUserDefaultsUtils, "userDefaultsCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, v5);

LABEL_14:
    v13 = v11;
    goto LABEL_15;
  }
  v11 = (id)v10;
  if (v8)
    v12 = v8 == (id)v10;
  else
    v12 = 0;
  v13 = v8;
  if (!v12)
  {
    CDMOSLoggerForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v19 = 136315906;
      v20 = "+[CDMUserDefaultsUtils readUserDefaultForKeyString:andDefaultValue:]";
      v21 = 2112;
      v22 = CFSTR("com.apple.siri.cdm");
      v23 = 2112;
      v24 = v5;
      v25 = 2112;
      v26 = v11;
      v15 = "%s defaults read \"%@\" \"%@\" -> %@";
LABEL_12:
      _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v19, 0x2Au);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_15:

  return v13;
}

+ (id)readUaaPNLAppModelPaths
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.internal.ck"));
  objc_msgSend(v2, "objectForKey:", CFSTR("UaaPModelPaths"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "_cdm_JSONDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      CDMOSLoggerForCategory(1);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = 136315394;
        v8 = "+[CDMUserDefaultsUtils readUaaPNLAppModelPaths]";
        v9 = 2112;
        v10 = v4;
        _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)readUaaPNLCoreModelPath
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.internal.ck"));
  objc_msgSend(v2, "stringForKey:", CFSTR("UaaPCoreModelPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v10 = 136315394;
      v11 = "+[CDMUserDefaultsUtils readUaaPNLCoreModelPath]";
      v12 = 2112;
      v13 = v3;
      v6 = "%s UaaP Core model path: %@";
      v7 = v4;
      v8 = 22;
LABEL_8:
      _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v10, v8);
    }
  }
  else if (v5)
  {
    v10 = 136315138;
    v11 = "+[CDMUserDefaultsUtils readUaaPNLCoreModelPath]";
    v6 = "%s No UaaP Core model path provided via defaults write";
    v7 = v4;
    v8 = 12;
    goto LABEL_8;
  }

  return v3;
}

+ (id)readUaaPNLSystemConfigPath
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.internal.ck"));
  objc_msgSend(v2, "stringForKey:", CFSTR("UaaPSystemConfigPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v10 = 136315394;
      v11 = "+[CDMUserDefaultsUtils readUaaPNLSystemConfigPath]";
      v12 = 2112;
      v13 = v3;
      v6 = "%s UaaP system config path: %@";
      v7 = v4;
      v8 = 22;
LABEL_8:
      _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v10, v8);
    }
  }
  else if (v5)
  {
    v10 = 136315138;
    v11 = "+[CDMUserDefaultsUtils readUaaPNLSystemConfigPath]";
    v6 = "%s No UaaP system config path provided via defaults write";
    v7 = v4;
    v8 = 12;
    goto LABEL_8;
  }

  return v3;
}

+ (id)readUserDefaultSnlcOverride
{
  void *v2;
  void *v3;

  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.cdm"));
    objc_msgSend(v2, "stringForKey:", CFSTR("SNLC override"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)readUserDefaultPscOverride
{
  void *v2;
  void *v3;

  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.cdm"));
    objc_msgSend(v2, "stringForKey:", CFSTR("PSC override"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)readUserDefaultLVCOverride
{
  void *v2;
  void *v3;

  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.cdm"));
    objc_msgSend(v2, "stringForKey:", CFSTR("LVC override"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (unint64_t)readUserDefaultsValueForKeyUint64:(id)a3 defaultValue:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  void *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[CDMUserDefaultsUtils userDefaultsCache](CDMUserDefaultsUtils, "userDefaultsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.cdm"));
  v9 = objc_msgSend(v8, "integerForKey:", v5);
  v10 = v9;
  if (v9 >= 1)
    v11 = v9;
  else
    v11 = a4;
  if (!v7 || objc_msgSend(v7, "integerValue") != v11)
  {
    CDMOSLoggerForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v10 <= 0)
    {
      if (v13)
      {
        v18 = 136315906;
        v19 = "+[CDMUserDefaultsUtils readUserDefaultsValueForKeyUint64:defaultValue:]";
        v20 = 2112;
        v21 = CFSTR("com.apple.siri.cdm");
        v22 = 2112;
        v23 = v5;
        v24 = 2048;
        v25 = a4;
        v14 = "%s defaults read \"%@\" \"%@\" -> not set (or set to <= 0). Using default: count=%zd";
        goto LABEL_11;
      }
    }
    else if (v13)
    {
      v18 = 136315906;
      v19 = "+[CDMUserDefaultsUtils readUserDefaultsValueForKeyUint64:defaultValue:]";
      v20 = 2112;
      v21 = CFSTR("com.apple.siri.cdm");
      v22 = 2112;
      v23 = v5;
      v24 = 2048;
      v25 = v10;
      v14 = "%s defaults read \"%@\" \"%@\" -> count=%zd";
LABEL_11:
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v18, 0x2Au);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMUserDefaultsUtils userDefaultsCache](CDMUserDefaultsUtils, "userDefaultsCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v5);

  }
  return v11;
}

+ (unint64_t)readNLv4MaxNumParses
{
  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
    return objc_msgSend(a1, "readUserDefaultsValueForKeyUint64:defaultValue:", CFSTR("NLv4 max num parses"), 1);
  else
    return 1;
}

+ (unint64_t)readUaaPNLMaxNumParses
{
  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
    return objc_msgSend(a1, "readUserDefaultsValueForKeyUint64:defaultValue:", CFSTR("UaaPNL max num parses"), 3);
  else
    return 3;
}

+ (id)getDefaultCustomLogPath
{
  return CFSTR("/tmp/");
}

+ (id)readCustomLogPath
{
  _BOOL4 v2;
  void *v3;
  uint64_t v4;

  v2 = +[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall");
  +[CDMUserDefaultsUtils getDefaultCustomLogPath](CDMUserDefaultsUtils, "getDefaultCustomLogPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[CDMUserDefaultsUtils readUserDefaultForKeyString:andDefaultValue:](CDMUserDefaultsUtils, "readUserDefaultForKeyString:andDefaultValue:", CFSTR("custom log path"), v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

+ (BOOL)isWriteDebugToDiskEnabled
{
  _BOOL4 v2;

  v2 = +[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall");
  if (v2)
    LOBYTE(v2) = +[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:](CDMUserDefaultsUtils, "readUserDefaultForKeyBool:andDefaultValue:", CFSTR("write debug data"), 0);
  return v2;
}

+ (unsigned)readAsrAlternativeCount:(id)a3
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  unsigned int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.cdm"));
  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
  {
    objc_msgSend(v4, "dictionaryForKey:", CFSTR("asr alternatives count"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v17 = 136315906;
      v18 = "+[CDMUserDefaultsUtils readAsrAlternativeCount:]";
      v19 = 2112;
      v20 = CFSTR("com.apple.siri.cdm");
      v21 = 2112;
      v22 = CFSTR("asr alternatives count");
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_INFO, "%s defaults read \"%@\" \"%@\" -> %@", (uint8_t *)&v17, 0x2Au);
    }

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(&unk_24DCCCB90, "objectForKey:", v3);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    goto LABEL_7;
  if (v7 && (int)-[__CFString intValue](v7, "intValue") > 0)
  {
    if ((int)-[__CFString intValue](v8, "intValue") < 1)
    {
LABEL_7:
      -[__CFString objectForKey:](v5, "objectForKey:", v3);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && (int)-[__CFString intValue](v9, "intValue") > 0)
      {
        CDMOSLoggerForCategory(1);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v17 = 136315650;
          v18 = "+[CDMUserDefaultsUtils readAsrAlternativeCount:]";
          v19 = 2112;
          v20 = v3;
          v21 = 2112;
          v22 = v10;
          _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s NSUserDefaults found AND locale=%@ found in dict, returning %@", (uint8_t *)&v17, 0x20u);
        }

        v12 = -[__CFString intValue](v10, "intValue");
      }
      else
      {
        CDMOSLoggerForCategory(1);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v17 = 136315650;
          v18 = "+[CDMUserDefaultsUtils readAsrAlternativeCount:]";
          v19 = 2112;
          v20 = v3;
          v21 = 2112;
          v22 = v5;
          _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: Returning 1. NSUserDefaults found, BUT locale=%@'s value is invalid in it? %@", (uint8_t *)&v17, 0x20u);
        }

        v12 = 1;
      }

      goto LABEL_25;
    }
    CDMOSLoggerForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17 = 136315650;
      v18 = "+[CDMUserDefaultsUtils readAsrAlternativeCount:]";
      v19 = 2112;
      v20 = v3;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s NSUserDefaults not found. Locale=%@ found in default dict, returning %@", (uint8_t *)&v17, 0x20u);
    }

    v12 = -[__CFString intValue](v8, "intValue");
  }
  else
  {
    CDMOSLoggerForCategory(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = 136315650;
      v18 = "+[CDMUserDefaultsUtils readAsrAlternativeCount:]";
      v19 = 2112;
      v20 = v3;
      v21 = 2112;
      v22 = (const __CFString *)&unk_24DCCCB90;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Returning 1. NSUserDefaults not found and locale=%@'s value is invalid in default dict? %@", (uint8_t *)&v17, 0x20u);
    }

    v12 = 1;
  }
LABEL_25:

  return v12;
}

+ (unsigned)readXPCCallbackDefaultTimeout
{
  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
    return objc_msgSend(a1, "readUserDefaultsValueForKeyUint64:defaultValue:", CFSTR("xpc callback timeout"), 2);
  else
    return 2;
}

+ (BOOL)shouldUseSwiftBasedGraphRunner
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:](CDMUserDefaultsUtils, "readUserDefaultForKeyBool:andDefaultValue:", CFSTR("swift graph runner"), 0);
}

+ (BOOL)isSkipNodeEnabled
{
  return !+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall")
      || +[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:](CDMUserDefaultsUtils, "readUserDefaultForKeyBool:andDefaultValue:", CFSTR("enable skip node"), 1);
}

+ (BOOL)isSSURequestTimeoutDisabled
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:](CDMUserDefaultsUtils, "readUserDefaultForKeyBool:andDefaultValue:", CFSTR("disable ssu request timeout"), 0);
}

+ (BOOL)isInsertEmbeddingOutputsToFeatureStoreEnabled
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:](CDMUserDefaultsUtils, "readUserDefaultForKeyBool:andDefaultValue:", CFSTR("insert embedding outputs to featurestore"), 0);
}

+ (BOOL)isTapToRadarDisabled
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:](CDMUserDefaultsUtils, "readUserDefaultForKeyBool:andDefaultValue:", CFSTR("disable taptoradar"), 0);
}

+ (BOOL)isPrintUSOInSpanEnabled
{
  return +[CDMUserDefaultsUtils readUserDefaultForKeyBool:andDefaultValue:](CDMUserDefaultsUtils, "readUserDefaultForKeyBool:andDefaultValue:", CFSTR("UsoInSpan"), 0);
}

@end
