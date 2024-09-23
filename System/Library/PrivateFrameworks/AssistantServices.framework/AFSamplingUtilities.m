@implementation AFSamplingUtilities

+ (id)component
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)sampledSubDirectoryPath
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)sampledCachesSubDirectoryPath
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)sampledPlistFileName
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)timezone
{
  return CFSTR("UTC");
}

+ (id)sampledSubDirectoryNameFormat
{
  return CFSTR("yyyyMMdd");
}

+ (id)sampledCurrentSamplingDateKey
{
  return CFSTR("currentSamplingDate");
}

+ (id)sampledLibraryDirectoryPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sampledSubDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)createSamplingDirectory
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sampledLibraryDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v12);
  v6 = v12;

  if ((v5 & 1) != 0)
  {
    v7 = v3;
  }
  else
  {
    v8 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v10 = v8;
      objc_msgSend(a1, "component");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v14 = "+[AFSamplingUtilities createSamplingDirectory]";
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v3;
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Error creating directory %@ - %@", buf, 0x2Au);

    }
    v7 = 0;
  }

  return v7;
}

+ (id)deleteItemAtFilePath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v6 = objc_msgSend(v5, "removeItemAtPath:error:", v4, &v14);
  v7 = v14;
  v8 = v7;
  if ((v6 & 1) == 0 && !AFIsFileNotFoundError(v7))
  {
    v12 = (void *)AFSiriLogContextUtility;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v10 = v12;
    objc_msgSend(a1, "component");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v16 = "+[AFSamplingUtilities deleteItemAtFilePath:]";
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v8;
    _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Error deleting item at %@ - %@", buf, 0x2Au);
    goto LABEL_5;
  }
  v9 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    objc_msgSend(a1, "component");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v16 = "+[AFSamplingUtilities deleteItemAtFilePath:]";
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s %@ Sampling: Successfully deleted %@", buf, 0x20u);
LABEL_5:

  }
LABEL_7:

  return v8;
}

+ (void)deleteAllSamplingData
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    objc_msgSend(a1, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "component");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315650;
    v19 = "+[AFSamplingUtilities deleteAllSamplingData]";
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %@ Sampling: Deleting all the %@ sampling data", (uint8_t *)&v18, 0x20u);

  }
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sampledCachesSubDirectoryPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(a1, "deleteItemAtFilePath:", v10);
  objc_msgSend(a1, "sampledLibraryDirectoryPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(a1, "deleteItemAtFilePath:", v12);

  v14 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    objc_msgSend(a1, "component");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sampledLibraryDirectoryPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315906;
    v19 = "+[AFSamplingUtilities deleteAllSamplingData]";
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s %@ Sampling: Done with deleting all the sampling data. Deleted - %@, %@", (uint8_t *)&v18, 0x2Au);

  }
}

+ (id)samplingDateAsString
{
  return 0;
}

+ (BOOL)isFileOlderThanAgeInSeconds:(double)a3 filePath:(id)a4 samplingComponent:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  BOOL v15;
  NSObject *v16;
  const char *v17;
  float v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v9, "attributesOfItemAtPath:error:", v7, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;

  if (!v10)
  {
    v16 = AFSiriLogContextUtility;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      v15 = 0;
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315906;
    v22 = "+[AFSamplingUtilities isFileOlderThanAgeInSeconds:filePath:samplingComponent:]";
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = (uint64_t)v11;
    v17 = "%s %@ Sampling: No attributes for file at path: %@, error: %@";
LABEL_10:
    _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x2Au);
    goto LABEL_7;
  }
  objc_msgSend(v10, "fileCreationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceNow");
  v14 = fabs(v13);

  if (v14 <= a3)
  {
    v16 = AFSiriLogContextUtility;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v19 = v14 / 60.0;
    *(_DWORD *)buf = 136315906;
    v22 = "+[AFSamplingUtilities isFileOlderThanAgeInSeconds:filePath:samplingComponent:]";
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v7;
    v27 = 2048;
    v28 = (uint64_t)rintf(v19);
    v17 = "%s %@ Sampling: File at path: %@ is ineligible for upload as it is only %ld minutes old.";
    goto LABEL_10;
  }
  v15 = 1;
LABEL_8:

  return v15;
}

+ (BOOL)isFileNameValid:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  objc_msgSend((id)objc_opt_class(), "sampledSubDirectoryNameFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v4 == v6)
  {
    objc_msgSend((id)objc_opt_class(), "dateFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromString:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8 != 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int64_t)calculateFileNameAgeInDays:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "dateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:toDate:options:", 16, v5, v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "day");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)dateFormatter
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v4 = (void *)MEMORY[0x1E0C99E80];
  objc_msgSend(a1, "timezone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZoneWithAbbreviation:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v6);

  objc_msgSend(a1, "sampledSubDirectoryNameFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDateFormat:", v7);

  return v3;
}

@end
