uint64_t ATXCacheFileWrite(int a1, void *a2)
{
  id v3;
  id v4;
  ssize_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v11;
  void *v12;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL ATXCacheFileWrite(int, NSData *__strong _Nonnull)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("ATXCacheFile.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  if (flock(a1, 2) != -1)
  {
    if (ftruncate(a1, 0) == -1)
    {
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ATXCacheFileWriteChunks_cold_2();
    }
    else
    {
      v4 = objc_retainAutorelease(v3);
      v5 = pwrite(a1, (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), 0);
      if (v5 == -1)
      {
        __atxlog_handle_default();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          ATXCacheFileWrite_cold_3();
      }
      else
      {
        v6 = v5;
        if (v5 == objc_msgSend(v4, "length"))
        {
          v7 = 1;
LABEL_18:
          flock(a1, 8);
          goto LABEL_19;
        }
        __atxlog_handle_default();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          ATXCacheFileWrite_cold_4(v4, v6, v9);
      }
    }

    v7 = 0;
    goto LABEL_18;
  }
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    ATXCacheFileWriteChunks_cold_1();

  v7 = 0;
LABEL_19:

  return v7;
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1)
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_4);
  return (id)__atxlog_handle_default_log;
}

void sub_1C99CD160(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99CD830(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ATXCacheFileRead(int a1, void **a2, double *a3, double a4)
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  double tv_sec;
  NSObject *v13;
  NSObject *v14;
  int64_t st_size;
  void *v16;
  void *v17;
  ssize_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint8_t v29[16];
  stat v30;

  if (a3)
    *a3 = 1.79769313e308;
  if (a2)
  {
    v8 = *a2;
    *a2 = 0;

  }
  if (flock(a1, 1) != -1)
  {
    lseek(a1, 0, 0);
    memset(&v30, 0, sizeof(v30));
    if (fstat(a1, &v30) < 0)
    {
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        ATXCacheFileRead_cold_2();
    }
    else
    {
      if (a4 < 0.0)
        goto LABEL_16;
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "timeIntervalSince1970");
      v11 = v10;

      tv_sec = (double)v30.st_mtimespec.tv_sec;
      if (a3)
        *a3 = v11 - tv_sec;
      if (v11 - a4 <= tv_sec)
      {
LABEL_16:
        st_size = v30.st_size;
        if (v30.st_size)
        {
          if (a2)
          {
            v16 = malloc_type_malloc(v30.st_size, 0x74756E11uLL);
            if (v16)
            {
              v17 = v16;
              v18 = read(a1, v16, st_size);
              if (v18 == -1)
              {
                __atxlog_handle_default();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  ATXCacheFileRead_cold_6();
              }
              else
              {
                if (v18 >= st_size)
                {
                  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v17, st_size);
                  v28 = *a2;
                  *a2 = (void *)v27;

                  goto LABEL_32;
                }
                __atxlog_handle_default();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  ATXCacheFileRead_cold_7();
              }

              free(v17);
LABEL_32:
              flock(a1, 8);
              return;
            }
            __atxlog_handle_default();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              ATXCacheFileRead_cold_5();
          }
          else
          {
            __atxlog_handle_default();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              ATXCacheFileRead_cold_4(v13);
          }
        }
        else
        {
          __atxlog_handle_default();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            ATXCacheFileRead_cold_3(v13, v20, v21, v22, v23, v24, v25, v26);
        }
      }
      else
      {
        __atxlog_handle_default();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_1C99CA000, v13, OS_LOG_TYPE_INFO, "ATXCache is no longer valid -- skipping read", v29, 2u);
        }
      }
    }

    goto LABEL_32;
  }
  __atxlog_handle_default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    ATXCacheFileWriteChunks_cold_1();

}

void sub_1C99CDFCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99CE044(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C99CE0AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id ATXCacheFileJoinChunks(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData * _Nonnull ATXCacheFileJoinChunks(NSArray<NSData *> *__strong _Nonnull)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("ATXCacheFile.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("chunks"));

  }
  headerForChunks(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v3 += objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "length");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v3);
  objc_msgSend(v9, "appendData:", v2);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "appendData:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

  return v9;
}

id headerForChunks(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  _DWORD *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _DWORD *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = 8 * objc_msgSend(v1, "count") + 8;
  v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v2));
  v4 = (_DWORD *)objc_msgSend(v3, "mutableBytes");
  *v4 = 197626155;
  v4[1] = objc_msgSend(v1, "count");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = v4 + 2;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "length", (_QWORD)v14);
        v12 = v8 + 2;
        *v8 = v2;
        v8[1] = v11;
        LODWORD(v2) = v2 + v11;
        ++v10;
        v8 += 2;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v12;
    }
    while (v7);
  }

  return v3;
}

id ATXCacheFileSplitChunks(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  id v4;
  _DWORD *v5;
  _DWORD *v6;
  uint64_t v7;
  void *v8;
  unsigned int *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  if (v2 < 8)
    goto LABEL_13;
  v3 = v2;
  v4 = objc_retainAutorelease(v1);
  v5 = (_DWORD *)objc_msgSend(v4, "bytes");
  if (*v5 != 197626155)
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      ATXCacheFileSplitChunks_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);

    goto LABEL_13;
  }
  v6 = v5;
  v7 = v5[1];
  if (v3 < 4 * (unint64_t)(2 * v7 + 2))
  {
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  if ((_DWORD)v7)
  {
    v9 = v6 + 3;
    while (*v9 + (unint64_t)*(v9 - 1) <= v3)
    {
      objc_msgSend(v4, "subdataWithRange:");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
        break;
      v11 = (void *)v10;
      v9 += 2;
      objc_msgSend(v8, "addObject:", v10);

      LODWORD(v7) = v7 - 1;
      if (!(_DWORD)v7)
        goto LABEL_9;
    }
    v12 = 0;
  }
  else
  {
LABEL_9:
    v12 = v8;
  }

LABEL_14:
  return v12;
}

uint64_t ATXCacheFileWriteChunks(int a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  iovec *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t *p_iov_len;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  off_t v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  ssize_t v31;
  _BOOL4 v32;
  uint64_t v33;
  void *v35;
  void *v36;
  uint64_t v37;
  const iovec *v38;
  uint64_t v39;
  id v40;
  uint64_t *v41;
  int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL ATXCacheFileWriteChunks(int, NSArray<NSData *> *__strong _Nonnull)");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("ATXCacheFile.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("chunks"));

  }
  v42 = a1;
  headerForChunks(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  v41 = &v37;
  MEMORY[0x1E0C80A78]();
  v39 = v5;
  v6 = (iovec *)(&v37 - 2 * v5);
  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  v6->iov_base = (void *)v8;
  v6->iov_len = v9;
  v40 = v7;
  v10 = objc_msgSend(v7, "length");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  v38 = v6;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v44;
    p_iov_len = &v6->iov_len;
    v16 = 1;
    do
    {
      v17 = 0;
      v18 = v16;
      v19 = (uint64_t *)&p_iov_len[2 * v16];
      do
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v11);
        v20 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v17));
        v21 = objc_msgSend(v20, "bytes");
        v22 = objc_msgSend(v20, "length");
        *(v19 - 1) = v21;
        *v19 = v22;
        v10 += objc_msgSend(v20, "length");
        ++v17;
        v19 += 2;
      }
      while (v13 != v17);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      v16 = v18 + v17;
    }
    while (v13);
  }

  v23 = v42;
  if (flock(v42, 2) != -1)
  {
    if (ftruncate(v23, 0) == -1)
    {
      __atxlog_handle_default();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        ATXCacheFileWriteChunks_cold_2();
    }
    else
    {
      v24 = lseek(v23, 0, 0);
      if (v24)
      {
        v25 = v24;
        if (v24 == -1)
        {
          __atxlog_handle_default();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          v28 = v40;
          if (v27)
            ATXCacheFileWriteChunks_cold_4();
        }
        else
        {
          __atxlog_handle_default();
          v26 = objc_claimAutoreleasedReturnValue();
          v32 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          v28 = v40;
          if (v32)
            ATXCacheFileWriteChunks_cold_3(v25, v26, v33);
        }
        goto LABEL_27;
      }
      v31 = writev(v23, v38, v39);
      if (v31 == -1)
      {
        __atxlog_handle_default();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          ATXCacheFileWriteChunks_cold_5();
      }
      else
      {
        if (v31 == v10)
        {
          v30 = 1;
          v28 = v40;
LABEL_28:
          flock(v23, 8);
          goto LABEL_29;
        }
        __atxlog_handle_default();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          ATXCacheFileWriteChunks_cold_6();
      }
    }
    v28 = v40;
LABEL_27:

    v30 = 0;
    goto LABEL_28;
  }
  __atxlog_handle_default();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    ATXCacheFileWriteChunks_cold_1();

  v30 = 0;
  v28 = v40;
LABEL_29:

  return v30;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

char *OUTLINED_FUNCTION_3(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_4()
{
  return __error();
}

int *OUTLINED_FUNCTION_5()
{
  return __error();
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1C99CEF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t shouldDenyConnectionForCurrentProcess()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("duetexpertd")) & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("atxtool")) ^ 1;

  return v3;
}

id prepareXPCConnection()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.proactive.AppPredictionIntentsHelperService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF92BD40);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_titleForIntent_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_titleForIntentNoLocalization_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_subtitleForIntent_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_indexingHashForIntent_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_eligibleForWidgetsForIntent_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_supportsBackgroundExecutionForIntent_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_localizedStringForLinkString_withReply_, 0, 0);

  objc_msgSend(v0, "setRemoteObjectInterface:", v1);
  objc_msgSend(v0, "resume");

  return v0;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1C99CF53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C99CF7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C99CFA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C99CFCC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C99CFF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C99D0234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C99D04C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C99D06FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1C99D0DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t ATXDetailedActionLoggingEnabled()
{
  if (ATXDetailedActionLoggingEnabled_onceToken != -1)
    dispatch_once(&ATXDetailedActionLoggingEnabled_onceToken, &__block_literal_global_1);
  return ATXDetailedActionLoggingEnabled_enabled;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

const __CFString *ATXSpecialWidgetKindFiles()
{
  return CFSTR("SBHSpecialAvocadoDescriptorKindFiles");
}

const __CFString *ATXSpecialWidgetKindShortcutsSingle()
{
  return CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsSingle");
}

const __CFString *ATXSpecialWidgetKindShortcutsFolder()
{
  return CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsFolder");
}

const __CFString *ATXSpecialWidgetKindAppPredictions()
{
  return CFSTR("SBHSpecialAvocadoDescriptorKindAppPredictions");
}

const __CFString *ATXSpecialWidgetKindSiriSuggestions()
{
  return CFSTR("SBHSpecialAvocadoDescriptorKindSiri");
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

int *OUTLINED_FUNCTION_4_2()
{
  return __error();
}

int *OUTLINED_FUNCTION_6_1()
{
  return __error();
}

const __CFString *ATXMemoryPressureTypeToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E82BFBC8[a1];
}

double ATXBucketDoubleBetweenValues(double result, double a2, double a3)
{
  if (a3 > result)
    result = a3;
  if (a3 >= a2)
    return a2;
  return result;
}

uint64_t ATXBucketUInt32BetweenValuesWithRounding(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  if (a4 < a2)
  {
    a2 = a1;
    if (a4 > a1)
      return a4 / a3 * a3;
  }
  return a2;
}

id ATXLocalizationNotNeeded(void *a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return objc_opt_class();
}

void sub_1C99D3580(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ____atxlog_handle_default_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "general");
  v1 = (void *)__atxlog_handle_default_log;
  __atxlog_handle_default_log = (uint64_t)v0;

}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1)
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_3);
  return (id)__atxlog_handle_xpc_log;
}

void ____atxlog_handle_xpc_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "xpc");
  v1 = (void *)__atxlog_handle_xpc_log;
  __atxlog_handle_xpc_log = (uint64_t)v0;

}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_5_0);
  return (id)__atxlog_handle_heuristic_log;
}

void ____atxlog_handle_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "heuristic");
  v1 = (void *)__atxlog_handle_heuristic_log;
  __atxlog_handle_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1)
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_7_0);
  return (id)__atxlog_handle_notifications_log;
}

void ____atxlog_handle_notifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notifications");
  v1 = (void *)__atxlog_handle_notifications_log;
  __atxlog_handle_notifications_log = (uint64_t)v0;

}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1)
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_9);
  return (id)__atxlog_handle_pmm_log;
}

void ____atxlog_handle_pmm_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.mm", "GENERAL");
  v1 = (void *)__atxlog_handle_pmm_log;
  __atxlog_handle_pmm_log = (uint64_t)v0;

}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1)
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_12);
  return (id)__atxlog_handle_dailyroutines_log;
}

void ____atxlog_handle_dailyroutines_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "dailyroutines");
  v1 = (void *)__atxlog_handle_dailyroutines_log;
  __atxlog_handle_dailyroutines_log = (uint64_t)v0;

}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1)
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_14);
  return (id)__atxlog_handle_feedback_log;
}

void ____atxlog_handle_feedback_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "feedback");
  v1 = (void *)__atxlog_handle_feedback_log;
  __atxlog_handle_feedback_log = (uint64_t)v0;

}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1)
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_16);
  return (id)__atxlog_handle_modes_log;
}

void ____atxlog_handle_modes_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "modes");
  v1 = (void *)__atxlog_handle_modes_log;
  __atxlog_handle_modes_log = (uint64_t)v0;

}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1)
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_18);
  return (id)__atxlog_handle_hero_log;
}

void ____atxlog_handle_hero_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "hero");
  v1 = (void *)__atxlog_handle_hero_log;
  __atxlog_handle_hero_log = (uint64_t)v0;

}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1)
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_20);
  return (id)__atxlog_handle_deletions_log;
}

void ____atxlog_handle_deletions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "deletions");
  v1 = (void *)__atxlog_handle_deletions_log;
  __atxlog_handle_deletions_log = (uint64_t)v0;

}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1)
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_22);
  return (id)__atxlog_handle_gi_log;
}

void ____atxlog_handle_gi_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "information");
  v1 = (void *)__atxlog_handle_gi_log;
  __atxlog_handle_gi_log = (uint64_t)v0;

}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1)
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_24);
  return (id)__atxlog_handle_timeline_log;
}

void ____atxlog_handle_timeline_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "timeline");
  v1 = (void *)__atxlog_handle_timeline_log;
  __atxlog_handle_timeline_log = (uint64_t)v0;

}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_26);
  return (id)__atxlog_handle_relevant_shortcut_log;
}

void ____atxlog_handle_relevant_shortcut_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");
  v1 = (void *)__atxlog_handle_relevant_shortcut_log;
  __atxlog_handle_relevant_shortcut_log = (uint64_t)v0;

}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_28);
  return (id)__atxlog_handle_relevance_model_log;
}

void ____atxlog_handle_relevance_model_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevance_model");
  v1 = (void *)__atxlog_handle_relevance_model_log;
  __atxlog_handle_relevance_model_log = (uint64_t)v0;

}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1)
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_30);
  return (id)__atxlog_handle_watch_log;
}

void ____atxlog_handle_watch_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "watch");
  v1 = (void *)__atxlog_handle_watch_log;
  __atxlog_handle_watch_log = (uint64_t)v0;

}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1)
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_32);
  return (id)__atxlog_handle_ui_log;
}

void ____atxlog_handle_ui_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "UI");
  v1 = (void *)__atxlog_handle_ui_log;
  __atxlog_handle_ui_log = (uint64_t)v0;

}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_34);
  return (id)__atxlog_handle_blending_log;
}

void ____atxlog_handle_blending_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending");
  v1 = (void *)__atxlog_handle_blending_log;
  __atxlog_handle_blending_log = (uint64_t)v0;

}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_36);
  return (id)__atxlog_handle_blending_internal_cache_log;
}

void ____atxlog_handle_blending_internal_cache_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");
  v1 = (void *)__atxlog_handle_blending_internal_cache_log;
  __atxlog_handle_blending_internal_cache_log = (uint64_t)v0;

}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_38);
  return (id)__atxlog_handle_blending_ecosystem_log;
}

void ____atxlog_handle_blending_ecosystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");
  v1 = (void *)__atxlog_handle_blending_ecosystem_log;
  __atxlog_handle_blending_ecosystem_log = (uint64_t)v0;

}

id __atxlog_handle_home_screen()
{
  if (__atxlog_handle_home_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_40);
  return (id)__atxlog_handle_home_screen_log;
}

void ____atxlog_handle_home_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "homescreen");
  v1 = (void *)__atxlog_handle_home_screen_log;
  __atxlog_handle_home_screen_log = (uint64_t)v0;

}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1)
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_42);
  return (id)__atxlog_handle_sleep_schedule_log;
}

void ____atxlog_handle_sleep_schedule_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "sleepschedule");
  v1 = (void *)__atxlog_handle_sleep_schedule_log;
  __atxlog_handle_sleep_schedule_log = (uint64_t)v0;

}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_44);
  return (id)__atxlog_handle_lock_screen_log;
}

void ____atxlog_handle_lock_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "lockscreen");
  v1 = (void *)__atxlog_handle_lock_screen_log;
  __atxlog_handle_lock_screen_log = (uint64_t)v0;

}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1)
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_46);
  return (id)__atxlog_handle_anchor_log;
}

void ____atxlog_handle_anchor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "anchor");
  v1 = (void *)__atxlog_handle_anchor_log;
  __atxlog_handle_anchor_log = (uint64_t)v0;

}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_48);
  return (id)__atxlog_handle_app_prediction_log;
}

void ____atxlog_handle_app_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_prediction");
  v1 = (void *)__atxlog_handle_app_prediction_log;
  __atxlog_handle_app_prediction_log = (uint64_t)v0;

}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_50);
  return (id)__atxlog_handle_action_prediction_log;
}

void ____atxlog_handle_action_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "action_prediction");
  v1 = (void *)__atxlog_handle_action_prediction_log;
  __atxlog_handle_action_prediction_log = (uint64_t)v0;

}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_52);
  return (id)__atxlog_handle_app_library_log;
}

void ____atxlog_handle_app_library_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_library");
  v1 = (void *)__atxlog_handle_app_library_log;
  __atxlog_handle_app_library_log = (uint64_t)v0;

}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_54);
  return (id)__atxlog_handle_app_install_log;
}

void ____atxlog_handle_app_install_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_install");
  v1 = (void *)__atxlog_handle_app_install_log;
  __atxlog_handle_app_install_log = (uint64_t)v0;

}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1)
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_56);
  return (id)__atxlog_handle_backup_log;
}

void ____atxlog_handle_backup_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "backup");
  v1 = (void *)__atxlog_handle_backup_log;
  __atxlog_handle_backup_log = (uint64_t)v0;

}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1)
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_58);
  return (id)__atxlog_handle_metrics_log;
}

void ____atxlog_handle_metrics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "metrics");
  v1 = (void *)__atxlog_handle_metrics_log;
  __atxlog_handle_metrics_log = (uint64_t)v0;

}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1)
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_60);
  return (id)__atxlog_handle_trial_assets_log;
}

void ____atxlog_handle_trial_assets_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "trial_assets");
  v1 = (void *)__atxlog_handle_trial_assets_log;
  __atxlog_handle_trial_assets_log = (uint64_t)v0;

}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_62);
  return (id)__atxlog_handle_notification_management_log;
}

void ____atxlog_handle_notification_management_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_management");
  v1 = (void *)__atxlog_handle_notification_management_log;
  __atxlog_handle_notification_management_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_64);
  return (id)__atxlog_handle_contextual_actions_log;
}

void ____atxlog_handle_contextual_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextual_actions");
  v1 = (void *)__atxlog_handle_contextual_actions_log;
  __atxlog_handle_contextual_actions_log = (uint64_t)v0;

}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1)
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_66);
  return (id)__atxlog_handle_intents_helper_log;
}

void ____atxlog_handle_intents_helper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "intents_helper");
  v1 = (void *)__atxlog_handle_intents_helper_log;
  __atxlog_handle_intents_helper_log = (uint64_t)v0;

}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_68);
  return (id)__atxlog_handle_context_heuristic_log;
}

void ____atxlog_handle_context_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "context_heuristic");
  v1 = (void *)__atxlog_handle_context_heuristic_log;
  __atxlog_handle_context_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1)
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_70);
  return (id)__atxlog_handle_zkw_hide_log;
}

void ____atxlog_handle_zkw_hide_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "zkw_hide");
  v1 = (void *)__atxlog_handle_zkw_hide_log;
  __atxlog_handle_zkw_hide_log = (uint64_t)v0;

}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_72);
  return (id)__atxlog_handle_context_user_education_suggestions_log;
}

void ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");
  v1 = (void *)__atxlog_handle_context_user_education_suggestions_log;
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)v0;

}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1)
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_74);
  return (id)__atxlog_handle_time_intelligence_log;
}

void ____atxlog_handle_time_intelligence_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "time");
  v1 = (void *)__atxlog_handle_time_intelligence_log;
  __atxlog_handle_time_intelligence_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_76);
  return (id)__atxlog_handle_contextual_engine_log;
}

void ____atxlog_handle_contextual_engine_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextualengine");
  v1 = (void *)__atxlog_handle_contextual_engine_log;
  __atxlog_handle_contextual_engine_log = (uint64_t)v0;

}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1)
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_78);
  return (id)__atxlog_handle_usage_insights_log;
}

void ____atxlog_handle_usage_insights_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "usage_insights");
  v1 = (void *)__atxlog_handle_usage_insights_log;
  __atxlog_handle_usage_insights_log = (uint64_t)v0;

}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_80);
  return (id)__atxlog_handle_notification_categorization_log;
}

void ____atxlog_handle_notification_categorization_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_categorization");
  v1 = (void *)__atxlog_handle_notification_categorization_log;
  __atxlog_handle_notification_categorization_log = (uint64_t)v0;

}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_82);
  return (id)__atxlog_handle_settings_actions_log;
}

void ____atxlog_handle_settings_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  v1 = (void *)__atxlog_handle_settings_actions_log;
  __atxlog_handle_settings_actions_log = (uint64_t)v0;

}

__CFString *ATXBundleIdReplacementForBundleId(void *a1)
{
  return ATXBundleIdReplacementForBundleIdWithWebpageURLHint(a1, 0);
}

__CFString *ATXBundleIdReplacementForBundleIdWithWebpageURLHint(void *a1, void *a2)
{
  __CFString *v3;
  id v4;
  int v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  int v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (-[__CFString length](v3, "length"))
  {
    v5 = objc_msgSend(v4, "atx_isOpenableFaceTimeURL");

    v15[0] = CFSTR("com.apple.FaceTimeLinkTrampoline");
    v15[1] = CFSTR("com.apple.callhistory.sync-helper");
    v6 = CFSTR("com.apple.mobilephone");
    v16[0] = CFSTR("com.apple.facetime");
    v16[1] = CFSTR("com.apple.mobilephone");
    v15[2] = CFSTR("com.apple.InCallService");
    if (v5)
      v6 = CFSTR("com.apple.facetime");
    v16[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v3;
    v11 = v10;

  }
  else
  {
    objc_msgSend(v4, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "isEqual:", CFSTR("tel"));
    if (v13)
    {

      v3 = CFSTR("com.apple.mobilephone");
    }
    v3 = v3;
    v11 = v3;
  }

  return v11;
}

uint64_t ATXBundleIdIsFakeContainerBundleId(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Batteries")) & 1) != 0
      || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Health.Sleep")) & 1) != 0
      || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.PeopleViewService")) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.gamecenter.widgets"));
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t ATXBundleIdIsSpecialWidgetExtensionBundleId(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.proactive.suggestions.widget")) & 1) != 0
      || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.proactive.appprediction.panel")) & 1) != 0
      || (objc_msgSend(v2, "isEqualToString:", CFSTR("Files")) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Shortcuts"));
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void ATXCacheFileSplitChunks_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1C99CA000, a1, a3, "Invalid magic number for cache", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void ATXCacheFileWriteChunks_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C99CA000, v1, v2, "flock failed: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

void ATXCacheFileWriteChunks_cold_2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C99CA000, v1, v2, "ftruncate failed: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

void ATXCacheFileWriteChunks_cold_3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = 0;
  OUTLINED_FUNCTION_6(&dword_1C99CA000, a2, a3, "lseek returned offset of %lld, expected %lld", (uint8_t *)&v3);
  OUTLINED_FUNCTION_10();
}

void ATXCacheFileWriteChunks_cold_4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C99CA000, v1, v2, "lseek failed: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

void ATXCacheFileWriteChunks_cold_5()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C99CA000, v1, v2, "writev failed: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

void ATXCacheFileWriteChunks_cold_6()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C99CA000, v0, (uint64_t)v0, "writev returned offset of %zd, expected %zd", v1);
  OUTLINED_FUNCTION_10();
}

void ATXCacheFileWrite_cold_3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C99CA000, v1, v2, "pwrite failed: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

void ATXCacheFileWrite_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = a2;
  v7 = 2048;
  v8 = objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_6(&dword_1C99CA000, a3, v4, "pwrite wrote %lu bytes, expected %lu", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2();
}

void ATXCacheFileRead_cold_2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C99CA000, v1, v2, "fstat failed: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

void ATXCacheFileRead_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1C99CA000, a1, a3, "ATXCache file length is zero", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void ATXCacheFileRead_cold_4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C99CA000, log, OS_LOG_TYPE_DEBUG, "ATXCache file data read skipped", v1, 2u);
  OUTLINED_FUNCTION_9();
}

void ATXCacheFileRead_cold_5()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C99CA000, v1, v2, "Failed to allocate buffer to read data for ATXCache: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

void ATXCacheFileRead_cold_6()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C99CA000, v1, v2, "Could not read ATXCache: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

void ATXCacheFileRead_cold_7()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C99CA000, v0, (uint64_t)v0, "Wrong ATXCache length; expected %lu, got %lu", v1);
  OUTLINED_FUNCTION_10();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x1E0CBD438]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x1E0C85140]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x1E0C85150]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1E0C85D48](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

