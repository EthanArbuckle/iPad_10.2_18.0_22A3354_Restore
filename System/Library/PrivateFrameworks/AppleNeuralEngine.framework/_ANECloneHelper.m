@implementation _ANECloneHelper

+ (BOOL)shouldSkipCloneFor:(id)a3 isEncryptedModel:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  BOOL v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "modelURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v8 = *MEMORY[0x1E0C99C18];
  v26 = 0;
  v9 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v27, v8, &v26);
  v10 = v27;
  v11 = v26;

  if (v9 && objc_msgSend(v10, "BOOLValue"))
  {
    +[_ANELog common](_ANELog, "common");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[_ANECloneHelper shouldSkipCloneFor:isEncryptedModel:].cold.2();
    LOBYTE(v13) = 1;
    v14 = 1;
    v15 = v11;
  }
  else
  {
    objc_msgSend(v6, "modelURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v17 = *MEMORY[0x1E0C99C08];
    v24 = 0;
    v13 = objc_msgSend(v16, "getResourceValue:forKey:error:", &v25, v17, &v24);
    v12 = v25;
    v15 = v24;

    if (v13 && -[NSObject BOOLValue](v12, "BOOLValue"))
    {
      +[_ANELog common](_ANELog, "common");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        +[_ANECloneHelper shouldSkipCloneFor:isEncryptedModel:].cold.3();

      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
  }

  if (v4)
  {
    +[_ANELog common](_ANELog, "common");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[_ANECloneHelper shouldSkipCloneFor:isEncryptedModel:].cold.1();

    v14 = 1;
  }
  if ((v13 & 1) == 0)
  {
    +[_ANELog common](_ANELog, "common");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modelURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v15;
      _os_log_error_impl(&dword_1D3352000, v20, OS_LOG_TYPE_ERROR, "%@: modelURL=%@ getResourceValue:forKey:error: FAILED. err=%@", buf, 0x20u);

    }
  }

  return v14;
}

+ (id)cloneIfWritable:(id)a3 isEncryptedModel:(BOOL)a4 cloneDirectory:(id)a5
{
  _BOOL8 v6;
  char *v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  char *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char *v31;
  id v32;
  NSObject *v33;
  void *v34;
  char v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  char *v40;
  const char *v41;
  _copyfile_state *v42;
  NSObject *v43;
  int v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int *v56;
  char *v57;
  void *v58;
  const char *aSelector;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  char v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  __int16 v78;
  char *v79;
  uint64_t v80;

  v6 = a4;
  v80 = *MEMORY[0x1E0C80C00];
  v9 = (char *)a3;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D824DB90]();
  +[_ANELog common](_ANELog, "common");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v69 = v52;
    v70 = 2112;
    v71 = v9;
    v72 = 2112;
    v73 = v10;
    _os_log_debug_impl(&dword_1D3352000, v12, OS_LOG_TYPE_DEBUG, "%@: START: model=%@ : cloneDirectory=%@", buf, 0x20u);

  }
  v13 = objc_msgSend(a1, "shouldSkipCloneFor:isEncryptedModel:", v9, v6);
  +[_ANELog common](_ANELog, "common");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "modelURL");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v69 = v16;
      v70 = 2112;
      v71 = v17;
      _os_log_impl(&dword_1D3352000, v15, OS_LOG_TYPE_INFO, "%@: modelURL=%@. Skipping copyfile()", buf, 0x16u);

    }
    objc_msgSend(v9, "modelURL");
    v18 = (char *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[_ANECloneHelper cloneIfWritable:isEncryptedModel:cloneDirectory:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0;
    objc_msgSend(v9, "modelURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v21, &v67);

    if ((v22 & 1) != 0)
    {
      aSelector = a2;
      objc_msgSend(v9, "modelURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v67)
      {
        objc_msgSend(v9, "modelURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringByDeletingLastPathComponent");
        v27 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v27;
      }
      +[_ANEHashEncoding hexStringForString:](_ANEHashEncoding, "hexStringForString:", v24);
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastPathComponent");
      v29 = objc_claimAutoreleasedReturnValue();
      v60 = (void *)v28;
      objc_msgSend(v10, "stringByAppendingPathComponent:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)v29;
      objc_msgSend(v30, "stringByAppendingPathComponent:", v29);
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      LOBYTE(v28) = objc_msgSend(v19, "removeItemAtPath:error:", v31, &v66);
      v32 = v66;
      v64 = v30;
      if ((v28 & 1) == 0)
      {
        +[_ANELog common](_ANELog, "common");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(aSelector);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v69 = v34;
          v70 = 2112;
          v71 = v31;
          v72 = 2112;
          v73 = v32;
          _os_log_impl(&dword_1D3352000, v33, OS_LOG_TYPE_INFO, "%@: %@ could not be removed err=%@", buf, 0x20u);

          v30 = v64;
        }

      }
      v65 = v32;
      v35 = objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v30, 1, 0, &v65);
      v36 = v65;

      if ((v35 & 1) == 0)
      {
        +[_ANELog common](_ANELog, "common");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(aSelector);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v69 = v38;
          v70 = 2112;
          v71 = (const char *)v64;
          v72 = 2112;
          v73 = v36;
          _os_log_impl(&dword_1D3352000, v37, OS_LOG_TYPE_INFO, "%@: %@ could not be created err=%@", buf, 0x20u);

        }
      }
      v63 = v11;
      v61 = objc_retainAutorelease(v24);
      v39 = (const char *)objc_msgSend(v61, "UTF8String");
      v40 = objc_retainAutorelease(v31);
      v41 = (const char *)objc_msgSend(v40, "UTF8String");
      v42 = copyfile_state_alloc();
      +[_ANELog common](_ANELog, "common");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(aSelector);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v69 = v58;
        v70 = 2080;
        v71 = v39;
        v72 = 2080;
        v73 = (id)v41;
        v74 = 1024;
        v75 = 819214;
        _os_log_debug_impl(&dword_1D3352000, v43, OS_LOG_TYPE_DEBUG, "%@: --> Calling copyfile(src:%s, dst:%s, flags:0x%x)", buf, 0x26u);

      }
      v44 = copyfile(v39, v41, v42, 0xC800Eu);
      copyfile_state_free(v42);
      if (v44 < 0)
      {
        +[_ANELog common](_ANELog, "common");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(aSelector);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = *__error();
          v56 = __error();
          v57 = strerror(*v56);
          *(_DWORD *)buf = 138413570;
          v69 = v54;
          v70 = 2080;
          v71 = v39;
          v72 = 2080;
          v73 = (id)v41;
          v74 = 1024;
          v75 = 819214;
          v76 = 1024;
          v77 = v55;
          v78 = 2080;
          v79 = v57;
          _os_log_error_impl(&dword_1D3352000, v45, OS_LOG_TYPE_ERROR, "%@: copyfile(%s, %s, %o) FAILED with (%d : %s)", buf, 0x36u);

        }
        v18 = 0;
        v11 = v63;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "ane_addWriteModeForPath:", v40);
        v45 = objc_msgSend(v40, "copy");
        if (!v67)
        {
          objc_msgSend(v9, "modelURL");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "path");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "lastPathComponent");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "stringByAppendingPathComponent:", v48);
          v49 = objc_claimAutoreleasedReturnValue();

          v45 = v49;
        }
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v45, 0, v58);
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        +[_ANELog common](_ANELog, "common");
        v50 = objc_claimAutoreleasedReturnValue();
        v11 = v63;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(aSelector);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v69 = v53;
          v70 = 2112;
          v71 = v18;
          v72 = 2112;
          v73 = v45;
          _os_log_debug_impl(&dword_1D3352000, v50, OS_LOG_TYPE_DEBUG, "%@: END: modelURL=%@ : dstNameAfterClone=%@", buf, 0x20u);

          v11 = v63;
        }

      }
    }
    else
    {
      +[_ANELog common](_ANELog, "common");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        +[_ANECloneHelper cloneIfWritable:isEncryptedModel:cloneDirectory:].cold.1();
      v18 = 0;
    }

  }
  objc_autoreleasePoolPop(v11);

  return v18;
}

+ (void)shouldSkipCloneFor:isEncryptedModel:.cold.1()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9_1(), "modelURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_3(&dword_1D3352000, v3, v4, "%@: modelURL=%@ is encrypted. Skipping clone", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)shouldSkipCloneFor:isEncryptedModel:.cold.2()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9_1(), "modelURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_3(&dword_1D3352000, v3, v4, "%@: modelURL=%@ is on root filesystem. Skipping clone", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)shouldSkipCloneFor:isEncryptedModel:.cold.3()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9_1(), "modelURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_3(&dword_1D3352000, v3, v4, "%@: modelURL=%@ is on read-only filesystem. Skipping clone", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)cloneIfWritable:isEncryptedModel:cloneDirectory:.cold.1()
{
  NSObject *v0;
  void *v1;
  SEL v2;
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  v5 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9_1(), "modelURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_10();
  _os_log_error_impl(&dword_1D3352000, v0, OS_LOG_TYPE_ERROR, "%@: modelURL=%@ does not exist", v4, 0x16u);

  OUTLINED_FUNCTION_2();
}

+ (void)cloneIfWritable:isEncryptedModel:cloneDirectory:.cold.2()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9_1(), "modelURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_3(&dword_1D3352000, v3, v4, "%@: modelURL=%@ is writable. Attempting copyfile()", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
