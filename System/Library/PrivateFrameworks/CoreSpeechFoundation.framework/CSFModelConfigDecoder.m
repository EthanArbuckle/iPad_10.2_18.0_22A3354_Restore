@implementation CSFModelConfigDecoder

+ (id)getAftmRecognizerRelativeConfigFromConfigDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("checkerConfig"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("checkerConfig"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recognizerConfigs"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)getAftmCheckerConfigFromConfigDict:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("checkerConfig"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getOdldModelFileFromConfigDict:(id)a3 resourcePath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    +[CSFModelConfigDecoder getOdldValueForKey:categoryKey:configDict:](CSFModelConfigDecoder, "getOdldValueForKey:categoryKey:configDict:", CFSTR("model"), CFSTR("pipeline"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("modelFile"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("modelFile"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

+ (id)getNCModelFileFromConfigDict:(id)a3 resourcePath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ModelFile"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ModelFile"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v8;
}

+ (id)decodeJsonFromFile:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    if (v5)
    {
      v6 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v12 = "+[CSFModelConfigDecoder decodeJsonFromFile:]";
        v13 = 2114;
        v14 = v3;
        v15 = 2114;
        v16 = v5;
        _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s ERR: read metafile %{public}@ failed with %{public}@ - defaulting to NO", buf, 0x20u);
      }
      v7 = 0;
    }
    else
    {
      v7 = v4;
    }

  }
  else
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "+[CSFModelConfigDecoder decodeJsonFromFile:]";
      v13 = 2114;
      v14 = 0;
      _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s ERR: metaData is nil, defaulting to NO for %{public}@", buf, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)getOdldValueForKey:(id)a3 categoryKey:(id)a4 configDict:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v9)
    goto LABEL_5;
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_5:
    v11 = 0;
  }
LABEL_6:

  return v11;
}

@end
