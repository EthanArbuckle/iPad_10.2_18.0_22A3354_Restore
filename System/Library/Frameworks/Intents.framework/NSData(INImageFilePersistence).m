@implementation NSData(INImageFilePersistence)

- (_QWORD)_in_writeDataToPathForImage:()INImageFilePersistence storeType:error:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "_in_writeableFilePersistenceConfigurationForStoreType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "filePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

    v14 = INSiriLogContextIntents;
    v15 = os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[NSData(INImageFilePersistence) _in_writeDataToPathForImage:storeType:error:]";
        v29 = 2112;
        v30 = v11;
        v16 = "%s File already exists at path %@, overwriting";
        v17 = v14;
        v18 = 22;
LABEL_9:
        _os_log_impl(&dword_18BEBC000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[NSData(INImageFilePersistence) _in_writeDataToPathForImage:storeType:error:]";
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v11;
      v16 = "%s Writing image %@ to new file path %@";
      v17 = v14;
      v18 = 32;
      goto LABEL_9;
    }
    objc_msgSend(a1, "writeToFile:options:error:", v11, 1, a5);
    v23 = _INImageFilePersistenceUpdateModifiedDateAtFilePath(v11);
    objc_msgSend(v10, "identifier");
    a5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (a5)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("No writable file configuration available for image: %@"), v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6002, v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
LABEL_11:

  }
  return a5;
}

@end
