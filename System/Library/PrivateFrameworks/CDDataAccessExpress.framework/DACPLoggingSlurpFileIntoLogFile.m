@implementation DACPLoggingSlurpFileIntoLogFile

uint64_t __DACPLoggingSlurpFileIntoLogFile_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __DACPLoggingSlurpFileIntoLogFile_block_invoke_2(uint64_t a1)
{
  uint64_t *v1;
  const __CFString *v2;
  double v3;
  const void *v4;
  CFAbsoluteTime Current;
  const void *v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  const void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  const void *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  _BYTE cf[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v1 = *(uint64_t **)(a1 + 40);
  v2 = *(const __CFString **)(a1 + 48);
  v29 = *(_QWORD *)(a1 + 64);
  v30 = *(_QWORD *)(a1 + 56);
  if (v1[3] < 1)
    goto LABEL_7;
  if (*(_QWORD *)v1[8])
  {
    v3 = MEMORY[0x1C3BB5664]();
    if (v3 < CFAbsoluteTimeGetCurrent())
    {
      v4 = *(const void **)v1[8];
      if (v4)
        CFRelease(v4);
      goto LABEL_6;
    }
LABEL_7:
    v28 = 0;
    goto LABEL_8;
  }
LABEL_6:
  Current = CFAbsoluteTimeGetCurrent();
  *(_QWORD *)v1[8] = CFDateCreate(0, Current + 13.0);
  v28 = v1[3];
LABEL_8:
  v6 = 0;
  v7 = 0;
  v31 = 0;
  v8 = *(_QWORD *)(v1[8] + 8);
  do
  {
    if (v8 || (_workQueueRefreshUUIDForWorkSettings(v1), (v8 = *(_QWORD *)(v1[8] + 8)) != 0))
    {
      if (v6)
      {
        CFRelease(v6);
        v8 = *(_QWORD *)(v1[8] + 8);
      }
      v9 = *((unsigned __int8 *)v1 + 74);
      v10 = *((unsigned __int8 *)v1 + 72);
      v11 = *((_DWORD *)v1 + 8);
      v12 = malloc_type_malloc(0xC8uLL, 0xD1C8F99DuLL);
      if (!v12)
      {
        __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_2();
        __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_3();
      }
      v13 = v12;
      v14 = 200;
      while (!CFStringGetCString(v2, (char *)v13, v14, 0x8000100u))
      {
        free(v13);
        if (v14 < 0x100000)
        {
          v14 *= 2;
          v13 = malloc_type_malloc(v14, 0xB08B271BuLL);
          if (v13)
            continue;
        }
        __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_1(v2);
        __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_3();
      }
      v15 = open((const char *)v13, 0);
      *(_QWORD *)cf = 0;
      HIDWORD(v26) = v11;
      LOBYTE(v26) = v10 != 0;
      v16 = -[DACPLogShared _slurpToFileUUID:slurpeeFileDescriptor:prefix:suffix:startNewFile:sizeCheck:wantsCompressed:maxLogFileCount:outDidCreateNewFile:outNewFilePath:](+[DACPLogShared shared](DACPLogShared, "shared"), "_slurpToFileUUID:slurpeeFileDescriptor:prefix:suffix:startNewFile:sizeCheck:wantsCompressed:maxLogFileCount:outDidCreateNewFile:outNewFilePath:", v8, v15, v30, v29, v9 != 0, v28, v26, &v31, cf);
      if (*(_QWORD *)cf)
      {
        CFRetain(*(CFTypeRef *)cf);
        v6 = *(const void **)cf;
      }
      else
      {
        v6 = 0;
      }
      if ((_DWORD)v15 != -1)
        close(v15);
      free(v13);
      v17 = v1[8];
      v18 = *(const void **)(v17 + 8);
      if (!v16)
      {
        if (v18)
        {
          CFRelease(v18);
          v17 = v1[8];
        }
        v18 = 0;
        *(_QWORD *)(v17 + 8) = 0;
      }
    }
    else
    {
      v18 = 0;
    }
    if (v18)
      break;
    ++v7;
    v8 = 0;
  }
  while (v7 < 3);
  if (v7 >= 3)
  {
    v19 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = *v1;
      *(_DWORD *)cf = 138412290;
      *(_QWORD *)&cf[4] = v20;
      _os_log_impl(&dword_1C1D11000, v19, OS_LOG_TYPE_ERROR, "Can't slurp lookaside file into log file, even after retrying. Giving up. Facilities: %@", cf, 0xCu);
    }
  }
  v21 = v1[6];
  if (v21 && v31)
    (*(void (**)(uint64_t, const void *))(v21 + 16))(v21, v6);
  if (v6)
    CFRelease(v6);
  free(*(void **)(a1 + 40));
  v22 = *(const void **)(a1 + 48);
  if (v22)
    CFRelease(v22);
  v23 = *(const void **)(a1 + 56);
  if (v23)
    CFRelease(v23);
  v24 = *(const void **)(a1 + 64);
  if (v24)
    CFRelease(v24);
  v25 = *(_QWORD *)(a1 + 32);
  if (v25)
  {
    (*(void (**)(void))(v25 + 16))();
    _Block_release(*(const void **)(a1 + 32));
  }
}

void __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_1(const __CFString *a1)
{
  NSObject *v2;
  CFIndex Length;
  CFIndex v4;
  UniChar *v5;
  UniChar *v6;
  __CFString *Mutable;
  __CFString *v8;
  UniChar *v9;
  unsigned int v10;
  NSObject *v11;
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;
  CFRange v15;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = OUTLINED_FUNCTION_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C1D11000, v2, OS_LOG_TYPE_ERROR, "Cannot encode string into UTF-8.", buf, 2u);
  }
  Length = CFStringGetLength(a1);
  if (Length)
  {
    v4 = Length;
    v5 = (UniChar *)malloc_type_malloc(2 * Length, 0x937914B4uLL);
    if (v5)
    {
      v6 = v5;
      v15.location = 0;
      v15.length = v4;
      CFStringGetCharacters(a1, v15, v5);
      Mutable = CFStringCreateMutable(0, 0);
      if (Mutable)
      {
        v8 = Mutable;
        CFStringAppend(Mutable, CFSTR("UTF-16 Bytes: "));
        if (v4 >= 1)
        {
          v9 = v6;
          do
          {
            v10 = *v9++;
            CFStringAppendFormat(v8, 0, CFSTR("%04x "), v10);
            --v4;
          }
          while (v4);
        }
        v11 = OUTLINED_FUNCTION_0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v8;
          _os_log_impl(&dword_1C1D11000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
        CFRelease(v8);
      }
      free(v6);
    }
  }
}

void __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_2()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = OUTLINED_FUNCTION_0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1C1D11000, v0, OS_LOG_TYPE_ERROR, "Could not allocate buffer for logging.", v1, 2u);
  }
}

void __DACPLoggingSlurpFileIntoLogFile_block_invoke_2_cold_3()
{
  __assert_rtn("_workQueueSlurpToFileUUID", "DACPLogging.m", 181, "slurpeeChars");
}

@end
