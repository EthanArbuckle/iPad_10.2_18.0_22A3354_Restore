@implementation DACPLoggingAppendDataToLogFile

uint64_t __DACPLoggingAppendDataToLogFile_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __DACPLoggingAppendDataToLogFile_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __DACPLoggingAppendDataToLogFile_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  double v5;
  const void *v6;
  CFAbsoluteTime Current;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  uint64_t v14;
  const void *v15;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t v19;
  DACPLogShared *v20;
  BOOL v21;
  uint64_t v22;
  const void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  _QWORD block[5];
  char v30;
  _BYTE buf[24];
  uint64_t v32;

  v1 = a1;
  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(uint64_t **)(a1 + 40);
  if (!v2)
  {
    v9 = DALoggingwithCategory(0);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v10 = "Cannot append data to log file because workSettings is NULL.";
    v11 = v9;
    v12 = 2;
LABEL_13:
    _os_log_impl(&dword_1C1D11000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
    goto LABEL_37;
  }
  v3 = (_QWORD *)v2[8];
  if (!v3)
  {
    v13 = DALoggingwithCategory(0);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    v14 = *v2;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v14;
    v10 = "Cannot append data to log file because shared work settings is NULL. Facilities: %@";
    v11 = v13;
    v12 = 12;
    goto LABEL_13;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v2[3] >= 1)
  {
    if (!*v3)
    {
LABEL_8:
      Current = CFAbsoluteTimeGetCurrent();
      *(_QWORD *)v2[8] = CFDateCreate(0, Current + 13.0);
      v8 = v2[3];
      goto LABEL_15;
    }
    v5 = MEMORY[0x1C3BB5664]();
    if (v5 < CFAbsoluteTimeGetCurrent())
    {
      v6 = *(const void **)v2[8];
      if (v6)
        CFRelease(v6);
      goto LABEL_8;
    }
  }
  v8 = 0;
LABEL_15:
  v15 = 0;
  v16 = 0;
  v30 = 0;
  do
  {
    if (v15)
      CFRelease(v15);
    v15 = *(const void **)(v2[8] + 8);
    if (v15 || (_workQueueRefreshUUIDForWorkSettings(v2), (v15 = *(const void **)(v2[8] + 8)) != 0))
    {
      v17 = *((unsigned __int8 *)v2 + 74);
      v18 = *((unsigned __int8 *)v2 + 72);
      v19 = *((int *)v2 + 8);
      v20 = +[DACPLogShared shared](DACPLogShared, "shared");
      *(_QWORD *)buf = 0;
      v21 = -[DACPLogShared _logData:UUID:startNewFile:sizeCheck:wantsCompressed:maxFileCount:outDidCreateNewFile:outNewFilePath:](v20, "_logData:UUID:startNewFile:sizeCheck:wantsCompressed:maxFileCount:outDidCreateNewFile:outNewFilePath:", v4, v15, v17 != 0, v8, v18 != 0, v19, &v30, buf);
      if (*(_QWORD *)buf)
      {
        CFRetain(*(CFTypeRef *)buf);
        v15 = *(const void **)buf;
      }
      else
      {
        v15 = 0;
      }
      v22 = v2[8];
      v23 = *(const void **)(v22 + 8);
      if (!v21)
      {
        if (v23)
        {
          CFRelease(v23);
          v22 = v2[8];
        }
        v23 = 0;
        *(_QWORD *)(v22 + 8) = 0;
      }
    }
    else
    {
      v23 = 0;
    }
    if (v23)
      break;
    ++v16;
  }
  while (v16 < 3);
  if (v16 >= 3)
  {
    v24 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *v2;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v25;
      _os_log_impl(&dword_1C1D11000, v24, OS_LOG_TYPE_ERROR, "Can't append data to log file, even after retrying. Giving up. Facilities: %@", buf, 0xCu);
    }
  }
  v26 = v2[6];
  if (v26 && v30)
    (*(void (**)(uint64_t, const void *))(v26 + 16))(v26, v15);
  if (v15)
    CFRelease(v15);
  v1 = a1;
LABEL_37:
  free(*(void **)(v1 + 40));
  v27 = *(const void **)(v1 + 48);
  if (v27)
    CFRelease(v27);
  if (*(_QWORD *)(v1 + 32))
  {
    if (_callbackQueue_onceToken != -1)
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __DACPLoggingAppendDataToLogFile_block_invoke_4;
    block[3] = &unk_1E7B9D188;
    block[4] = *(_QWORD *)(v1 + 32);
    dispatch_async((dispatch_queue_t)_callbackQueue_queue, block);
  }
}

void __DACPLoggingAppendDataToLogFile_block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

@end
