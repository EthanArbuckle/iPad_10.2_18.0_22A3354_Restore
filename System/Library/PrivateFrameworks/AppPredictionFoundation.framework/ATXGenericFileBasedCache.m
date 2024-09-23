@implementation ATXGenericFileBasedCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheFilePath, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_loggingHandle, 0);
}

- (BOOL)storeSecureCodedObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x1CAA46674]();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  objc_autoreleasePoolPop(v7);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)self->_loggingHandle, OS_LOG_TYPE_ERROR))
    {
      -[ATXGenericFileBasedCache storeSecureCodedObject:error:].cold.1();
      if (a4)
        goto LABEL_5;
    }
    else if (a4)
    {
LABEL_5:
      v10 = 0;
      *a4 = objc_retainAutorelease(v9);
      goto LABEL_8;
    }
    v10 = 0;
    goto LABEL_8;
  }
  v10 = -[ATXGenericFileBasedCache storeData:error:](self, "storeData:error:", v8, a4);
LABEL_8:

  return v10;
}

- (BOOL)storeData:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  int v8;
  char v9;
  int v10;
  int *v11;
  char *v12;
  NSObject *loggingHandle;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *debugName;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  NSString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = open(-[NSString UTF8String](self->_cacheFilePath, "UTF8String"), 514, 384);
  if (v7 == -1)
  {
    v10 = *__error();
    v11 = __error();
    v12 = strerror(*v11);
    loggingHandle = self->_loggingHandle;
    if (os_log_type_enabled(loggingHandle, OS_LOG_TYPE_ERROR))
    {
      debugName = self->_debugName;
      *(_DWORD *)buf = 138412802;
      v32 = debugName;
      v33 = 1024;
      v34 = v10;
      v35 = 2080;
      v36 = v12;
      _os_log_error_impl(&dword_1C99CA000, loggingHandle, OS_LOG_TYPE_ERROR, "Couldn't create %@ cache file: [%i] %s", buf, 0x1Cu);
      if (!a4)
        goto LABEL_16;
    }
    else if (!a4)
    {
      goto LABEL_16;
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2FE0];
    if (v12)
    {
      v29 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v10, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
      LOBYTE(a4) = 0;
      goto LABEL_16;
    }
    v27 = *MEMORY[0x1E0CB2938];
    v28 = CFSTR("Unknown error");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    v21 = v15;
    v22 = 22;
LABEL_14:
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v8 = v7;
  v9 = ATXCacheFileWrite(v7, v6);
  if ((v8 & 0x80000000) == 0)
    close(v8);
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_loggingHandle, OS_LOG_TYPE_ERROR))
    {
      -[ATXGenericFileBasedCache storeData:error:].cold.1();
      if (!a4)
        goto LABEL_16;
    }
    else if (!a4)
    {
      goto LABEL_16;
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2FE0];
    v25 = *MEMORY[0x1E0CB2938];
    v26 = CFSTR("Unable to write data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    v21 = v19;
    v22 = 5;
    goto LABEL_14;
  }
  LOBYTE(a4) = 1;
LABEL_16:

  return (char)a4;
}

- (id)readSecureCodedObjectWithMaxValidAge:(double)a3 allowableClasses:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v15;
  id v16;

  v8 = a4;
  v9 = (void *)MEMORY[0x1CAA46674]();
  v16 = 0;
  -[ATXGenericFileBasedCache readWithMaxValidAge:error:](self, "readWithMaxValidAge:error:", &v16, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v10)
  {
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v10, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;

    if (!v12)
    {
      if (os_log_type_enabled((os_log_t)self->_loggingHandle, OS_LOG_TYPE_ERROR))
        -[ATXGenericFileBasedCache readSecureCodedObjectWithMaxValidAge:allowableClasses:error:].cold.1();
      v12 = 0;
    }
    v11 = v13;
  }
  else
  {
    v12 = 0;
  }

  objc_autoreleasePoolPop(v9);
  if (a5)
    *a5 = objc_retainAutorelease(v11);

  return v12;
}

- (id)readWithMaxValidAge:(double)a3 error:(id *)a4
{
  int v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  int *v13;
  char *v14;
  NSObject *loggingHandle;
  NSString *debugName;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSString *v25;
  double v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  _BYTE buf[12];
  __int16 v34;
  int v35;
  __int16 v36;
  char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = open(-[NSString UTF8String](self->_cacheFilePath, "UTF8String"), 0);
  if (v7 == -1)
  {
    v12 = *__error();
    v13 = __error();
    v14 = strerror(*v13);
    loggingHandle = self->_loggingHandle;
    if (v12 == 2)
    {
      if (os_log_type_enabled(loggingHandle, OS_LOG_TYPE_DEFAULT))
      {
        debugName = self->_debugName;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = debugName;
        _os_log_impl(&dword_1C99CA000, loggingHandle, OS_LOG_TYPE_DEFAULT, "Couldn't open %@ cache file because it is missing", buf, 0xCu);
        if (!a4)
          goto LABEL_24;
        goto LABEL_20;
      }
    }
    else if (os_log_type_enabled(loggingHandle, OS_LOG_TYPE_ERROR))
    {
      v25 = self->_debugName;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v25;
      v34 = 1024;
      v35 = v12;
      v36 = 2080;
      v37 = v14;
      _os_log_error_impl(&dword_1C99CA000, loggingHandle, OS_LOG_TYPE_ERROR, "Couldn't open %@ cache file: [%i] %s", buf, 0x1Cu);
      if (!a4)
        goto LABEL_24;
      goto LABEL_20;
    }
    if (!a4)
    {
LABEL_24:
      v10 = 0;
      return v10;
    }
LABEL_20:
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2FE0];
    if (v14)
    {
      v31 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v12, v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = *MEMORY[0x1E0CB2938];
      v30 = CFSTR("Unknown error");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 22, v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_24;
  }
  v8 = v7;
  *(_QWORD *)buf = 0;
  v26 = 0.0;
  v9 = (void *)MEMORY[0x1CAA46674]();
  ATXCacheFileRead(v8, (void **)buf, &v26, a3);
  objc_autoreleasePoolPop(v9);
  if (v26 < 0.0)
  {
    if (os_log_type_enabled((os_log_t)self->_loggingHandle, OS_LOG_TYPE_ERROR))
      -[ATXGenericFileBasedCache readWithMaxValidAge:error:].cold.2();
    -[ATXGenericFileBasedCache evict](self, "evict");
  }
  if ((v8 & 0x80000000) == 0)
    close(v8);
  v10 = *(void **)buf;
  if (!*(_QWORD *)buf)
  {
    if (os_log_type_enabled((os_log_t)self->_loggingHandle, OS_LOG_TYPE_ERROR))
    {
      -[ATXGenericFileBasedCache readWithMaxValidAge:error:].cold.1();
      if (!a4)
        goto LABEL_17;
    }
    else if (!a4)
    {
      goto LABEL_17;
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2FE0];
    v27 = *MEMORY[0x1E0CB2938];
    v28 = CFSTR("Unable to read data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 5, v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v11 = *(id *)buf;
LABEL_17:

  return v10;
}

- (ATXGenericFileBasedCache)initWithCacheFilePath:(id)a3 loggingHandle:(id)a4 debugName:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXGenericFileBasedCache *v11;
  uint64_t v12;
  NSString *cacheFilePath;
  uint64_t v14;
  NSString *debugName;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXGenericFileBasedCache;
  v11 = -[ATXGenericFileBasedCache init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    cacheFilePath = v11->_cacheFilePath;
    v11->_cacheFilePath = (NSString *)v12;

    objc_storeStrong((id *)&v11->_loggingHandle, a4);
    v14 = objc_msgSend(v10, "copy");
    debugName = v11->_debugName;
    v11->_debugName = (NSString *)v14;

  }
  return v11;
}

- (void)evict
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int *v5;
  char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = a2;
  v4 = *__error();
  v5 = __error();
  v6 = strerror(*v5);
  v7 = 138412802;
  v8 = v2;
  v9 = 1024;
  v10 = v4;
  v11 = 2080;
  v12 = v6;
  _os_log_error_impl(&dword_1C99CA000, v3, OS_LOG_TYPE_ERROR, "Couldn't unlink %@ cache file: [%i] %s", (uint8_t *)&v7, 0x1Cu);

}

- (NSString)cacheFilePath
{
  return self->_cacheFilePath;
}

- (void)storeData:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "Couldn't write %@ cache file", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)storeSecureCodedObject:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_1(&dword_1C99CA000, v0, v1, "Couldn't archive secure coded data for %@ cache file: %@");
  OUTLINED_FUNCTION_10();
}

- (void)readWithMaxValidAge:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "Couldn't read %@ cache file", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)readWithMaxValidAge:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1(&dword_1C99CA000, v0, v1, "Detected %@ cache file with last modified date in the future -- will attempt deletion", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)readSecureCodedObjectWithMaxValidAge:allowableClasses:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_1(&dword_1C99CA000, v0, v1, "Couldn't unarchive secure coded data for %@ cache file: %@");
  OUTLINED_FUNCTION_10();
}

@end
