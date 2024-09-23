@implementation AFDictationSamplingUtilities

+ (id)component
{
  return CFSTR("Dictation");
}

+ (id)sampledSubDirectoryPath
{
  return CFSTR("/Assistant/DictationSampled");
}

+ (id)sampledCachesSubDirectoryPath
{
  return CFSTR("com.apple.assistantd/DictationSampled");
}

+ (id)sampledPlistFileName
{
  return CFSTR("DictationSampled.plist");
}

+ (id)samplingDateAsString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "sampledLibraryDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sampledPlistFileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v7, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  if (v9)
  {
    v10 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v17 = v10;
      objc_msgSend(a1, "component");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v23 = "+[AFDictationSamplingUtilities samplingDateAsString]";
      v24 = 2112;
      v25 = v18;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v9;
      _os_log_error_impl(&dword_19AF50000, v17, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Error while reading plist at location %@ - %@", buf, 0x2Au);

    }
    v11 = 0;
  }
  else
  {
    objc_msgSend(a1, "sampledCurrentSamplingDateKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend((id)objc_opt_class(), "dateFormatter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringFromDate:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = (void *)AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        v19 = v15;
        objc_msgSend(a1, "component");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v23 = "+[AFDictationSamplingUtilities samplingDateAsString]";
        v24 = 2112;
        v25 = v20;
        _os_log_error_impl(&dword_19AF50000, v19, OS_LOG_TYPE_ERROR, "%s %@ Sampling: currentSamplingDate is nil. Check if ADDictationOnDeviceSampling is getting initialized.", buf, 0x16u);

      }
      v11 = 0;
    }

  }
  return v11;
}

@end
