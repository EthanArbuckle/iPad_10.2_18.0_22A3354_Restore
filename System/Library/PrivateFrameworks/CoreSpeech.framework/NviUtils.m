@implementation NviUtils

+ (BOOL)isNviEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("IsNviEnabled"), CFSTR("com.apple.nvi"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

+ (id)strRepForNviSignalType:(unint64_t)a3
{
  id result;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = CFSTR("NviVADSignalType");
  switch(a3)
  {
    case 1uLL:
      return result;
    case 2uLL:
      result = CFSTR("NviKwdSignalType");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      result = CFSTR("NviDirectionalitySignalType");
      break;
    case 8uLL:
      result = CFSTR("NviAsdAnchorSignalType");
      break;
    default:
      if (a3 == 16)
      {
        result = CFSTR("NviAsdPayloadSignalType");
      }
      else
      {
LABEL_5:
        v5 = NviLogContextFacility;
        if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          v6 = 136315394;
          v7 = "+[NviUtils strRepForNviSignalType:]";
          v8 = 2048;
          v9 = a3;
          _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s WARN: Invalid sigType: %lu", (uint8_t *)&v6, 0x16u);
        }
        result = 0;
      }
      break;
  }
  return result;
}

+ (id)strRepForNviSignalMask:(unint64_t)a3
{
  unsigned int v3;
  void *v4;
  uint64_t i;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 5; ++i)
  {
    +[NviUtils strRepForNviSignalType:](NviUtils, "strRepForNviSignalType:", (1 << i) & v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("|%@"), v6);

  }
  objc_msgSend(v4, "appendString:", CFSTR("|"));
  return v4;
}

+ (unint64_t)nviSignalTypeForStr:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NviVADSignalType")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NviKwdSignalType")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NviDirectionalitySignalType")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NviAsdAnchorSignalType")) & 1) != 0)
  {
    v6 = 8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NviAsdPayloadSignalType")) & 1) != 0)
  {
    v6 = 16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NviUtils.m"), 144, CFSTR("Unknown NviSignalTypeString: <%@>"), v5);

    v6 = -1;
  }

  return v6;
}

+ (id)strRepForNviDataSourceType:(unint64_t)a3
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return CFSTR("NviAudioDataSrcType");
  v4 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "+[NviUtils strRepForNviDataSourceType:]";
    v8 = 2050;
    v9 = a3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Unknown DataSrc Type: %{public}lu", (uint8_t *)&v6, 0x16u);
  }
  return CFSTR("NviDataSource_END_MARKER");
}

+ (unint64_t)nviDataSourceTypeForStr:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NviAudioDataSrcType")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "+[NviUtils nviDataSourceTypeForStr:]";
      v9 = 2114;
      v10 = v3;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Unknown DataSrcTypeStr(%{public}@)", (uint8_t *)&v7, 0x16u);
    }
    v4 = 1;
  }

  return v4;
}

+ (BOOL)_createDirAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v9);
  v6 = v9;
  if (v6)
    v5 = 0;
  if ((v5 & 1) == 0)
  {
    v7 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "+[NviUtils _createDirAtPath:]";
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed to create dir at: %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

+ (id)timeStampString
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyyMMdd_HHmmss.SSS"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)getVoiceTriggerEndSampleCountFromVTEI:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  v4 = v3;
  if (v3
    && (v5 = *MEMORY[0x1E0D19730],
        objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D19730]),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    v8 = -1;
  }

  return v8;
}

+ (double)getVoiceTriggerEndSecsFromVTEI:(id)a3
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  float v9;

  v3 = a3;
  v4 = v3;
  v5 = -1.0;
  if (v3)
  {
    v6 = *MEMORY[0x1E0D19738];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D19738]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v5 = v9;

    }
  }

  return v5;
}

+ (id)readJsonDictionaryAt:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v18);

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NviUtils.m"), 213, CFSTR("Unexpected!! Received dir for NviConfig: %@"), v5);

    if ((v7 & 1) != 0)
    {
LABEL_3:
      v17 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v5, 0, &v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v17;
      if (v9 || !v8)
      {
        v11 = NviLogContextFacility;
        if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v20 = "+[NviUtils readJsonDictionaryAt:]";
          v21 = 2114;
          v22 = v5;
          v23 = 2114;
          v24 = v9;
          _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Could not read Json file at: %{public}@, err: %{public}@", buf, 0x20u);
        }
        v10 = 0;
      }
      else
      {
        v16 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v16;
        if (v9 || !v10)
        {
          v12 = NviLogContextFacility;
          if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v20 = "+[NviUtils readJsonDictionaryAt:]";
            v21 = 2114;
            v22 = v5;
            v23 = 2114;
            v24 = v9;
            _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to parse json at: %{public}@, err: %{public}@", buf, 0x20u);
          }
        }
        else
        {
          v9 = 0;
        }
      }

      goto LABEL_18;
    }
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_3;
  }
  v14 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "+[NviUtils readJsonDictionaryAt:]";
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Json file doesnt exist at: %{public}@", buf, 0x16u);
  }
  v10 = 0;
LABEL_18:

  return v10;
}

+ (id)getValueFromDictionaryOfDictionaries:(id)a3 keypath:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  if (objc_msgSend(v6, "count") == 1)
  {
LABEL_5:
    objc_msgSend(v6, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
    v10 = v7;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        break;
      ++v9;
      v10 = v8;
      if (v9 >= objc_msgSend(v6, "count") - 1)
        goto LABEL_5;
    }
    v14 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315650;
      v19 = "+[NviUtils getValueFromDictionaryOfDictionaries:keypath:]";
      v20 = 2114;
      v21 = v16;
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Could not find <%{public}@> in Keypath=%{public}@", (uint8_t *)&v18, 0x20u);

    }
    v13 = 0;
  }

  return v13;
}

+ (BOOL)createDirAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v9);
  v6 = v9;
  if (v6)
    v5 = 0;
  if ((v5 & 1) == 0)
  {
    v7 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "+[NviUtils createDirAtPath:]";
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed to create dir at: %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

@end
