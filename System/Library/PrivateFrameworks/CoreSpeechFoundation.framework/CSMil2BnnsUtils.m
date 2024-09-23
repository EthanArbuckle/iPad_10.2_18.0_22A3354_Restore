@implementation CSMil2BnnsUtils

+ (id)compileModelWithMilFile:(id)a3 bnnsIrCachePath:(id)a4 compilationFramework:(int64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  char v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v36 = "+[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:]";
    v37 = 2112;
    v38 = v7;
    v39 = 2112;
    v40 = v8;
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Compile MIL: %@ to BNNS IR: %@", buf, 0x20u);
  }
  +[CSOnDeviceCompilationUtils getMilConfigFromMilFilePath:](CSOnDeviceCompilationUtils, "getMilConfigFromMilFilePath:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  if ((objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v10, &v32) & 1) != 0)
  {
    v12 = 0;
    goto LABEL_6;
  }
  v31 = 0;
  v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v31);
  v12 = v31;
  if ((v13 & 1) != 0)
  {
LABEL_6:
    if ((objc_msgSend(v11, "fileExistsAtPath:", v8) & 1) != 0)
    {
      v14 = objc_msgSend(a1, "_isBnnsIrReadable:", v8);
      v15 = CSLogContextFacilityCoreSpeech;
      if ((v14 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:]";
          v37 = 2112;
          v38 = v8;
          _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s bnnsIr already existed, touch file but skipping compilation for: %@", buf, 0x16u);
        }
        v33 = *MEMORY[0x1E0CB2A88];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        v18 = 0;
        objc_msgSend(v11, "setAttributes:ofItemAtPath:error:", v17, v8, 0);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:]";
          v37 = 2112;
          v38 = v8;
          _os_log_error_impl(&dword_1B502E000, v15, OS_LOG_TYPE_ERROR, "%s can't open bnnsIr: %@, recompiling to a new bnnsir file", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        objc_msgSend(v21, "removeItemAtPath:error:", v8, &v29);
        v17 = v29;

        v22 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:]";
          v37 = 2112;
          v38 = v17;
          _os_log_error_impl(&dword_1B502E000, v22, OS_LOG_TYPE_ERROR, "%s Invalid bnnsIr removal error: %@", buf, 0x16u);
        }
        v28 = 0;
        objc_msgSend(a1, "_compileWithExceptionHandlingUsingModelFilePath:bnnsIrPath:milConfigPath:compilationFramework:error:", v7, v8, v27, a5, &v28);
        v18 = v28;
      }

    }
    else
    {
      v30 = 0;
      objc_msgSend(a1, "_compileWithExceptionHandlingUsingModelFilePath:bnnsIrPath:milConfigPath:compilationFramework:error:", v7, v8, v27, a5, &v30);
      v18 = v30;
      if (v18)
      {
LABEL_24:
        v20 = v18;

        goto LABEL_25;
      }
    }
    objc_msgSend(v7, "stringByStandardizingPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByStandardizingPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSFBnnsIrLookUp setCacheMapWithMilFile:bnnsIr:](CSFBnnsIrLookUp, "setCacheMapWithMilFile:bnnsIr:", v23, v24);

    if (a5 == 1)
      MEMORY[0x1B5E46090](CSModelEngineCacheLookUpHandler);
    goto LABEL_24;
  }
  v19 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "+[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:]";
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s Creating model directory not success %@", buf, 0x16u);
  }
  v12 = v12;
  v20 = v12;
LABEL_25:

  return v20;
}

+ (void)removeConfigFromQuasarComputeEngineCacheWithMilBnnsPath:(id)a3 bnnsIrPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "stringByStandardizingPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByStandardizingPath");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8 && v9)
  {
    objc_msgSend(a1, "readBnnsIrFromCacheMapWithMilFile:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", v10))
    {
      +[CSFBnnsIrLookUp removeBnnsIrFromCacheMapWithMilFile:](CSFBnnsIrLookUp, "removeBnnsIrFromCacheMapWithMilFile:", v8);
      v12 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315394;
        v14 = "+[CSMil2BnnsUtils removeConfigFromQuasarComputeEngineCacheWithMilBnnsPath:bnnsIrPath:]";
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s removing milBnns model file path from cacheMap :%@", (uint8_t *)&v13, 0x16u);
      }
    }

  }
  MEMORY[0x1B5E46090](CSModelEngineCacheLookUpHandler);

}

+ (id)readBnnsIrFromModelConfig:(id)a3 modelType:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[CSOnDeviceCompilationUtils readMilFilePathFromConfig:modelType:](CSOnDeviceCompilationUtils, "readMilFilePathFromConfig:modelType:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CSOnDeviceCompilationUtils getBackendTypeFromModelFile:](CSOnDeviceCompilationUtils, "getBackendTypeFromModelFile:", v5) == 1)
  {
    objc_msgSend(v5, "stringByStandardizingPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readBnnsIrFromCacheMapWithMilFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "+[CSMil2BnnsUtils readBnnsIrFromModelConfig:modelType:]";
      _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Only mil2Bnns is supported for prewarm", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)readBnnsIrFromCacheMapWithMilFile:(id)a3
{
  +[CSFBnnsIrLookUp readBnnsIrFromCacheMapWithMilFile:](CSFBnnsIrLookUp, "readBnnsIrFromCacheMapWithMilFile:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)_isBnnsIrReadable:(id)a3
{
  id v3;
  int v4;
  int v5;
  int v6;
  BOOL v7;
  NSObject *v8;
  int *v9;
  char *v10;
  NSObject *v11;
  int *v12;
  char *v13;
  int v15;
  const char *v16;
  __int16 v17;
  char *v18;
  stat v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v4 = open((const char *)objc_msgSend(v3, "UTF8String"), 0);
  v5 = v4;
  if (v4 == -1)
  {
    v11 = (id)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = __error();
      v13 = strerror(*v12);
      v19.st_dev = 136315394;
      *(_QWORD *)&v19.st_mode = "+[CSMil2BnnsUtils _isBnnsIrReadable:]";
      WORD2(v19.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v19.st_ino + 6) = (__darwin_ino64_t)v13;
      _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s Could not read OPEN() BNNSIR: %s", (uint8_t *)&v19, 0x16u);
    }

    v7 = 0;
  }
  else
  {
    v6 = fstat(v4, &v19);
    close(v5);
    v7 = v6 == 0;
    if (v6)
    {
      v8 = (id)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = __error();
        v10 = strerror(*v9);
        v15 = 136315394;
        v16 = "+[CSMil2BnnsUtils _isBnnsIrReadable:]";
        v17 = 2080;
        v18 = v10;
        _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Could not fstat() BNNSIR: %s", (uint8_t *)&v15, 0x16u);
      }

    }
  }

  return v7;
}

+ (void)_compileWithExceptionHandlingUsingModelFilePath:(id)a3 bnnsIrPath:(id)a4 milConfigPath:(id)a5 compilationFramework:(int64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  CSOSTransaction *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = -[CSOSTransaction initWithDescription:]([CSOSTransaction alloc], "initWithDescription:", CFSTR("Mil2Bnns compilation"));
  if (a6 == 2)
  {
    +[CSFModelComputeBackendUtils compileWithMilFile:bnnsIrPath:](CSFModelComputeBackendUtils, "compileWithMilFile:bnnsIrPath:", v11, v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a6 == 1)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0D1F1A0], "compileWithModelMilPath:bnnsIrOutPath:milConfigPath:errorOut:", v11, v12, v13, &v18);
    v15 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2251, &unk_1E68A1540);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  if (v15)
  {
    v17 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      if (!a7)
        goto LABEL_10;
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315906;
    v20 = "+[CSMil2BnnsUtils _compileWithExceptionHandlingUsingModelFilePath:bnnsIrPath:milConfigPath:compilationFramework:error:]";
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v16;
    _os_log_error_impl(&dword_1B502E000, v17, OS_LOG_TYPE_ERROR, "%s mil2Bnns compilation error for modelFilePath: %@ to bnnsIrCachePath: %@ with error: %@", buf, 0x2Au);
    if (a7)
LABEL_9:
      *a7 = objc_retainAutorelease(v16);
  }
LABEL_10:
  if (v14)

}

+ (void)_changePermissionOfBnnsIr:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0CB2AA8];
  v15[0] = &unk_1E68A16A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v4, "setAttributes:ofItemAtPath:error:", v5, v3, &v9);
  v7 = v9;
  if ((v6 & 1) == 0)
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "+[CSMil2BnnsUtils _changePermissionOfBnnsIr:]";
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Error setting file permissions: %@", buf, 0x16u);
    }
  }

}

@end
