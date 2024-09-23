uint64_t MBGetDefaultLog()
{
  if (MBGetDefaultLog_onceToken != -1)
    dispatch_once(&MBGetDefaultLog_onceToken, &__block_literal_global_4);
  return MBGetDefaultLog_log;
}

void _MBLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a1;
  if (sFileLoggingEnabled)
  {
    v11 = (void *)MEMORY[0x1D8270CF0]();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a2, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    MBStripLogFormatString(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFormat:arguments:", v14, &a9);

    _MBLogHelper(v10, v15);
    objc_autoreleasePoolPop(v11);
  }

}

id MBDisabledDomainsQueue()
{
  if (MBDisabledDomainsQueue_onceToken != -1)
    dispatch_once(&MBDisabledDomainsQueue_onceToken, &__block_literal_global_159);
  return (id)MBDisabledDomainsQueue_sDisabledDomainsQueue;
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

void sub_1D52187BC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1D52187C8(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1D52187D4);
}

id _volumeMountPointForPlist(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Container"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    _volumeMountPointForPlist_cold_1();
  v6 = (void *)v5;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v4;
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((MBPathHasVolumePrefix(v6, v12) & 1) != 0)
        {
          v24 = v12;
          v13 = v7;
          goto LABEL_14;
        }
      }
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v9)
        continue;
      break;
    }
  }

  MBGetDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    -[NSObject sortedArrayUsingSelector:](v7, "sortedArrayUsingSelector:", sel_compare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v15;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_1D5213000, v13, OS_LOG_TYPE_ERROR, "Failed to find volume (%@) for %@", buf, 0x16u);

    -[NSObject sortedArrayUsingSelector:](v7, "sortedArrayUsingSelector:", sel_compare_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to find volume (%@) for %@", v18, v19, v20, v21, v22, v23, (uint64_t)v17);

  }
  v24 = 0;
LABEL_14:

  return v24;
}

void sub_1D521AEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

char *_mkdtemp(const char *a1, void *a2)
{
  id v3;
  id v4;
  char *v5;
  char *v6;
  void *v8;
  void *v9;
  char __str[1025];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    _mkdtemp_cold_1();
  if (!v3)
    _mkdtemp_cold_2();
  v4 = objc_retainAutorelease(v3);
  snprintf(__str, 0x401uLL, "%s/%s_XXXXXXXXXXXXXXX", a1, (const char *)objc_msgSend(v4, "fileSystemRepresentation"));
  v5 = mkdtemp(__str);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "char *_mkdtemp(const char *, NSString *__strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MBTemporaryDirectory.m"), 33, CFSTR("TempDir: Unable to create %s directory (mkdtemp error: %d)"), __str, *__error());

  }
  v6 = strdup(v5);

  return v6;
}

void _mkpath_if_necessary(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uid_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!a1)
    _mkpath_if_necessary_cold_1();
  v2 = mkpath_np(a1, 0x1FFu);
  if ((_DWORD)v2 != 17)
  {
    v3 = v2;
    if ((_DWORD)v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _mkpath_if_necessary(const char *)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MBTemporaryDirectory.m"), 66, CFSTR("TempDir: Unable to create %s directory (mkpath_np error: %d)"), a1, v3);

    }
    v4 = MBMobileUID();
    if (chown(a1, v4, v4))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _mkpath_if_necessary(const char *)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MBTemporaryDirectory.m"), 69, CFSTR("TempDir: Unable to set ownership on %s directory (chown error: %d)"), a1, *__error());

    }
  }
}

id _mktemp(const char *a1)
{
  void *v3;
  void *v4;
  char __str[1025];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!a1)
    _mktemp_cold_1();
  snprintf(__str, 0x401uLL, "%s/XXXXXXXXXXXXXXX", a1);
  if (!mktemp(__str))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_mktemp(const char *)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MBTemporaryDirectory.m"), 51, CFSTR("TempDir: Unable to create temp file path in %s (%d)"), a1, *__error());

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "mb_stringWithFileSystemRepresentation:", __str);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1D521C874(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id MBCreateTemporaryFilePathIn(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (!v1)
    MBCreateTemporaryFilePathIn_cold_1();
  v2 = objc_retainAutorelease(v1);
  _mktemp((const char *)objc_msgSend(v2, "fileSystemRepresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void ___testingOnlySharedVolumeTmpDirRoot_block_invoke()
{
  _testingOnlySharedVolumeTmpDirRoot__path = (uint64_t)strdup("/var/tmp/com.apple.backup.testing");
  _mkpath_if_necessary((const char *)_testingOnlySharedVolumeTmpDirRoot__path);
}

void ___testingOnlyUserVolumeTmpDirRoot_block_invoke()
{
  _testingOnlyUserVolumeTmpDirRoot__path = (uint64_t)strdup("/var/mobile/tmp/com.apple.backup.testing");
  _mkpath_if_necessary((const char *)_testingOnlyUserVolumeTmpDirRoot__path);
}

void ___sharedVolumeTmpDirRoot_block_invoke()
{
  _sharedVolumeTmpDirRoot__path = (uint64_t)strdup("/var/tmp/com.apple.backup");
  _mkpath_if_necessary((const char *)_sharedVolumeTmpDirRoot__path);
}

void sub_1D521D594(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1D521DB0C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1D521DFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D52210DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D5221334(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *CryptoBufferAllocate(size_t size)
{
  void *memptr;

  memptr = 0;
  if (!malloc_type_posix_memalign(&memptr, 0x10uLL, size, 0xC80B7877uLL))
    bzero(memptr, size);
  return memptr;
}

void *CryptoBufferDuplicate(const void *a1, size_t size)
{
  void *v4;
  void *v5;

  v4 = CryptoBufferAllocate(size);
  v5 = v4;
  if (v4)
    memcpy(v4, a1, size);
  return v5;
}

uint64_t CryptoAcceleratorConnect()
{
  CFMutableDictionaryRef v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  io_object_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  io_connect_t connect;
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  connect = 0;
  v0 = IOServiceMatching("IOAESAccelerator");
  if (!v0)
  {
    v10 = MBGetDefaultLog();
    result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_ERROR, "IOServiceMatching failed", buf, 2u);
    _MBLog(CFSTR("ERROR"), (uint64_t)"IOServiceMatching failed", v12, v13, v14, v15, v16, v17, v28);
    return 0;
  }
  v1 = v0;
  CFRetain(v0);
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v1);
  if (!MatchingService)
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_ERROR, "IOServiceGetMatchingService failed", buf, 2u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"IOServiceGetMatchingService failed", v4, v5, v6, v7, v8, v9, v28);
    }
    CFRelease(v1);
    return 0;
  }
  v18 = MatchingService;
  v19 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
  if ((_DWORD)v19)
  {
    v20 = v19;
    v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v31 = v20;
      _os_log_impl(&dword_1D5213000, v21, OS_LOG_TYPE_ERROR, "IOServiceOpen failed, status:0x%x", buf, 8u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"IOServiceOpen failed, status:0x%x", v22, v23, v24, v25, v26, v27, v20);
    }
  }
  CFRelease(v1);
  IOObjectRelease(v18);
  return connect;
}

uint64_t CryptoAcceleratorEncrypt(mach_port_t a1, uint64_t a2, uint64_t a3, int a4)
{
  size_t outputStructCnt;
  _QWORD outputStruct[2];
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v9 = 0;
  v8 = 0;
  v11 = 0u;
  v12 = 0u;
  outputStructCnt = 88;
  outputStruct[0] = a2;
  outputStruct[1] = a3;
  v7 = a4;
  v10 = 0x8000000000;
  v13 = 2107;
  return IOConnectCallStructMethod(a1, 1u, outputStruct, 0x58uLL, outputStruct, &outputStructCnt);
}

void sub_1D5223520(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D5223EF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D5224054(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *MBStringWithArray(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
  v3 = (void *)objc_msgSend(a1, "objectEnumerator");
  v4 = objc_msgSend(v3, "nextObject");
  if (v4)
  {
    v5 = v4;
    do
    {
      if (objc_msgSend(v2, "length") != 1)
        objc_msgSend(v2, "appendString:", CFSTR(", "));
      objc_msgSend(v2, "appendString:", MBStringWithObject(v5));
      v5 = objc_msgSend(v3, "nextObject");
    }
    while (v5);
  }
  objc_msgSend(v2, "appendString:", CFSTR("]"));
  return v2;
}

id MBStringWithObject(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return MBStringWithArray(a1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return MBStringWithNibbles((unsigned __int8 *)objc_msgSend(a1, "bytes"), 2 * objc_msgSend(a1, "length"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)MBStringWithDictionary(a1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return MBStringWithSet(a1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\""), a1);
  else
    return (id)objc_msgSend(a1, "description");
}

void *MBStringWithLimitedArray(void *a1, unint64_t a2)
{
  void *v3;
  void *v4;

  v3 = a1;
  if (objc_msgSend(a1, "count") > a2)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend(v3, "subarrayWithRange:", 0, a2));
    objc_msgSend(v4, "addObject:", CFSTR("..."));
    v3 = v4;
  }
  return MBStringWithArray(v3);
}

uint64_t MBStringWithSizeInBytes(unint64_t a1)
{
  double v2;

  if (a1 <= 0x3FF)
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld B"), a1);
  if (!(a1 >> 20))
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.1f KB"), (double)a1 * 0.0009765625);
  v2 = (double)a1;
  if (a1 >> 30)
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.1f GB"), v2 * 9.31322575e-10);
  else
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.1f MB"), v2 * 0.000000953674316);
}

id MBStringWithNibbles(unsigned __int8 *a1, unint64_t a2)
{
  _WORD *v4;
  unint64_t v5;
  char v6;
  unsigned int v7;

  v4 = malloc_type_malloc(2 * a2, 0x1000040BDFB0063uLL);
  if (a2)
  {
    v5 = 0;
    do
    {
      v7 = *a1++;
      v6 = v7;
      v4[v5] = _MBNibbleToChar[(unint64_t)v7 >> 4];
      if (v5 + 1 < a2)
        v4[v5 + 1] = _MBNibbleToChar[v6 & 0xF];
      v5 += 2;
    }
    while (v5 < a2);
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharactersNoCopy:length:freeWhenDone:", v4, a2, 1);
}

id MBStringWithBytes(unsigned __int8 *a1, uint64_t a2)
{
  return MBStringWithNibbles(a1, 2 * a2);
}

uint64_t MBBytesWithString(void *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t i;
  int v7;
  int v9;
  int v10;

  v3 = a3;
  if (objc_msgSend(a1, "length") == 2 * a3)
  {
    if (!v3)
      return 1;
    for (i = 1; ; i += 2)
    {
      v7 = objc_msgSend(a1, "characterAtIndex:", i - 1);
      if ((v7 - 48) >= 0xA && (v7 - 97) > 5)
        break;
      v9 = v7;
      v10 = objc_msgSend(a1, "characterAtIndex:", i);
      if ((v10 - 48) >= 0xA && (v10 - 97) > 5)
        break;
      *a2++ = _MBCharToNibble[v10] | (16 * LOBYTE(_MBCharToNibble[v9]));
      if (!--v3)
        return 1;
    }
  }
  return 0;
}

uint64_t MBDataWithString(void *a1)
{
  unint64_t v2;
  _BYTE *v3;

  if ((objc_msgSend(a1, "length") & 1) == 0)
  {
    v2 = (unint64_t)objc_msgSend(a1, "length") >> 1;
    v3 = malloc_type_malloc(v2, 0xC6825122uLL);
    if (MBBytesWithString(a1, v3, v2))
      return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v3, v2, 1);
    if (v3)
      free(v3);
  }
  return 0;
}

id MBStringWithData(void *a1)
{
  return MBStringWithNibbles((unsigned __int8 *)objc_msgSend(a1, "bytes"), 2 * objc_msgSend(a1, "length"));
}

uint64_t MBStringWithDate(uint64_t result)
{
  if (result)
    return objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", result, 1, 2);
  return result;
}

void *MBStringWithDictionary(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(a1);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (objc_msgSend(v2, "length") != 1)
          objc_msgSend(v2, "appendString:", CFSTR(", "));
        objc_msgSend(v2, "appendFormat:", CFSTR("%@: %@"), v7, MBStringWithObject((void *)objc_msgSend(a1, "objectForKeyedSubscript:", v7)));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  objc_msgSend(v2, "appendString:", CFSTR("}"));
  return v2;
}

void *MBStringWithSet(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{"));
  v3 = (void *)objc_msgSend(a1, "objectEnumerator");
  v4 = objc_msgSend(v3, "nextObject");
  if (v4)
  {
    v5 = v4;
    do
    {
      if (objc_msgSend(v2, "length") != 1)
        objc_msgSend(v2, "appendString:", CFSTR(", "));
      objc_msgSend(v2, "appendString:", MBStringWithObject(v5));
      v5 = objc_msgSend(v3, "nextObject");
    }
    while (v5);
  }
  objc_msgSend(v2, "appendString:", CFSTR("}"));
  return v2;
}

uint64_t MBHTTPDateFormatter()
{
  if (MBHTTPDateFormatter_pred != -1)
    dispatch_once(&MBHTTPDateFormatter_pred, &__block_literal_global_1);
  return MBHTTPDateFormatter_formatter;
}

void sub_1D5226280(void *a1)
{
  objc_end_catch();
  objc_begin_catch(a1);
  JUMPOUT(0x1D5226244);
}

id MBTemporaryPath()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v4;
  void *v5;
  _QWORD block[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (MBTemporaryPath_onceToken != -1)
    dispatch_once(&MBTemporaryPath_onceToken, &__block_literal_global_2);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  MBTemporaryPathQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MBTemporaryPath_block_invoke_5;
  block[3] = &unk_1E995D120;
  block[4] = &v7;
  dispatch_sync(v0, block);

  v1 = (void *)v8[5];
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *MBTemporaryPath(void)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MBTempPathUtils.m"), 77, CFSTR("Unable to obtain MBTemporaryPath()"));

    v1 = (void *)v8[5];
  }
  v2 = v1;
  _Block_object_dispose(&v7, 8);

  return v2;
}

void sub_1D5226494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id MBTemporaryPathQueue()
{
  if (MBTemporaryPathQueue_onceToken != -1)
    dispatch_once(&MBTemporaryPathQueue_onceToken, &__block_literal_global_19);
  return (id)MBTemporaryPathQueue_sTemporaryPathQueue;
}

void MBRemoveTemporaryDirectory()
{
  NSObject *v0;

  MBTemporaryPathQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v0, &__block_literal_global_16);

}

uint64_t MCMContainerContentClassForMBContainerType(int a1)
{
  if ((a1 - 1) > 2)
    return 0;
  else
    return qword_1D52599B8[a1 - 1];
}

__CFString *MBStringForContainerType(int a1)
{
  if ((a1 - 1) > 4)
    return 0;
  else
    return off_1E995D260[a1 - 1];
}

uint64_t MBContainerTypeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Data/Application")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Data/PluginKitPlugin")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Shared/AppGroup")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("System/Data")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("System/Shared")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id MBEntitlementsRelativePathForBundleDir(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "stringByStandardizingPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "substringFromIndex:", objc_msgSend(v2, "length") + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PlaceholderEntitlements.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id MBAppRelativePathsToBackupAndRestore()
{
  if (MBAppRelativePathsToBackupAndRestore_onceToken != -1)
    dispatch_once(&MBAppRelativePathsToBackupAndRestore_onceToken, &__block_literal_global_158);
  return (id)MBAppRelativePathsToBackupAndRestore_sSet;
}

id MBAppRelativePathsNotToBackup()
{
  if (MBAppRelativePathsNotToBackup_onceToken != -1)
    dispatch_once(&MBAppRelativePathsNotToBackup_onceToken, &__block_literal_global_165);
  return (id)MBAppRelativePathsNotToBackup_sSet;
}

id MBAppRelativePathsNotToRestore()
{
  if (MBAppRelativePathsNotToRestore_onceToken != -1)
    dispatch_once(&MBAppRelativePathsNotToRestore_onceToken, &__block_literal_global_174);
  return (id)MBAppRelativePathsNotToRestore_sSet;
}

uint64_t MBIsTransientErrorCode(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = 1;
  if (a1 > 299)
  {
    v3 = a1 - 300;
    if (v3 > 8 || ((1 << v3) & 0x135) == 0)
      return 0;
  }
  else if (((unint64_t)(a1 - 202) > 0x12 || ((1 << (a1 + 54)) & 0x78041) == 0)
         && ((unint64_t)a1 > 0x14 || ((1 << a1) & 0x1A0000) == 0)
         && (unint64_t)(a1 - 105) >= 2)
  {
    return 0;
  }
  return result;
}

uint64_t MBGetMBSwiftLog()
{
  if (MBGetMBSwiftLog_onceToken != -1)
    dispatch_once(&MBGetMBSwiftLog_onceToken, &__block_literal_global_3);
  return MBGetMBSwiftLog_log;
}

uint64_t MBGetSQLLog()
{
  if (MBGetSQLLog_onceToken != -1)
    dispatch_once(&MBGetSQLLog_onceToken, &__block_literal_global_5);
  return MBGetSQLLog_log;
}

uint64_t MBGetLogDateFormatter()
{
  if (MBGetLogDateFormatter_onceToken != -1)
    dispatch_once(&MBGetLogDateFormatter_onceToken, &__block_literal_global_7);
  return MBGetLogDateFormatter_formatter;
}

const __CFString *MBLogStringForNSQualityOfService(uint64_t a1)
{
  const __CFString *result;

  if (a1 <= 16)
  {
    if (a1 == -1)
      return CFSTR("default");
    if (a1 == 9)
      return CFSTR("bg");
    return CFSTR("???");
  }
  result = CFSTR("ui");
  if (a1 != 33 && a1 != 25)
  {
    if (a1 == 17)
      return CFSTR("utility");
    return CFSTR("???");
  }
  return result;
}

const __CFString *MBGetLogDir()
{
  if (MBIsInternalInstall())
    return CFSTR("/var/mobile/Library/Logs/MobileBackup");
  else
    return CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/MobileBackup");
}

uint64_t MBBackgroundRestoreSignpostHandle()
{
  if (MBBackgroundRestoreSignpostHandle_onceToken != -1)
    dispatch_once(&MBBackgroundRestoreSignpostHandle_onceToken, &__block_literal_global_23);
  return MBBackgroundRestoreSignpostHandle_log;
}

uint64_t MBSupportedProtocolVersions()
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2.1);
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
}

id MBDefaultOptions()
{
  CFPropertyListRef v0;
  void *v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = CFPreferencesCopyValue(CFSTR("Options"), CFSTR("com.apple.MobileBackup"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v0)
  {
    v1 = (void *)v0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v1;
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = CFSTR("com.apple.MobileBackup");
      v12 = 2112;
      v13 = CFSTR("Options");
      _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_DEFAULT, "Preference %@ %@ not a dictionary", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Preference %@ %@ not a dictionary", v4, v5, v6, v7, v8, v9, (uint64_t)CFSTR("com.apple.MobileBackup"));
    }
    CFRelease(v1);
  }
  return (id)MEMORY[0x1E0C9AA70];
}

uint64_t MBHardwareModel()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("HWModelStr"));
}

uint64_t _MBGetCachedGestaltValue(uint64_t a1)
{
  if (_MBGetCachedGestaltValues_pred != -1)
    dispatch_once(&_MBGetCachedGestaltValues_pred, &__block_literal_global_99);
  return objc_msgSend((id)_MBCachedGestaltValues, "objectForKeyedSubscript:", a1);
}

uint64_t MBDeviceClass()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("DeviceClass"));
}

uint64_t MBDeviceUDID_Legacy()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("UniqueDeviceID"));
}

uint64_t MBDeviceUDID_Legacy_client()
{
  if (MBDeviceUDID_Legacy_client_onceToken != -1)
    dispatch_once(&MBDeviceUDID_Legacy_client_onceToken, &__block_literal_global_5);
  return MBDeviceUDID_Legacy_client_sDeviceUDID;
}

uint64_t MBDeviceUUID()
{
  if (MBDeviceUUID_pred != -1)
    dispatch_once(&MBDeviceUUID_pred, &__block_literal_global_34);
  return _MBCachedBackupDeviceID;
}

uint64_t MBSerialNumber()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("SerialNumber"));
}

void *MBDeviceName()
{
  return MBGetGestaltValueForKey();
}

uint64_t MBProductType()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("ProductType"));
}

uint64_t MBBuildVersion()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("BuildVersion"));
}

void *MBBuildIsSeed()
{
  void *v0;
  void *result;
  void *v2;
  int v3;

  v0 = (id)CFPreferencesCopyValue(CFSTR("IsSeedBuild"), CFSTR("com.apple.MobileBackup"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v0)
    return (void *)objc_msgSend(v0, "BOOLValue");
  result = (void *)_MBGetCachedGestaltValue((uint64_t)CFSTR("ReleaseType"));
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, "isEqualToString:", CFSTR("Beta"));
    return (void *)(v3 | objc_msgSend(v2, "isEqualToString:", CFSTR("Carrier")));
  }
  return result;
}

uint64_t MBProductVersion()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("ProductVersion"));
}

uint64_t MBDeviceColor()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("DeviceColor"));
}

uint64_t MBDeviceEnclosureColor()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("DeviceEnclosureColor"));
}

uint64_t MBDeviceCoverGlassColor()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("9N7qIucqhr0Cy2/Tk27/hw"));
}

uint64_t MBDeviceHousingColor()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("NJsxTSI2WuD+13rxShXX9w"));
}

uint64_t MBDeviceBackingColor()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("CJcvxERO5v/3IWjDFKZKRw"));
}

uint64_t MBMarketingName()
{
  return _MBGetCachedGestaltValue((uint64_t)CFSTR("marketing-name"));
}

uint64_t MBHomeButtonType()
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)MGGetSInt32Answer());
}

uint64_t MBMobileUID()
{
  uint64_t result;
  passwd *v1;
  MBException *v2;
  int *v3;
  char *v4;
  MBException *v5;

  result = _MBMobileUID;
  if (_MBMobileUID < 0)
  {
    v1 = getpwnam((const char *)objc_msgSend(CFSTR("mobile"), "UTF8String"));
    if (!v1)
    {
      v2 = [MBException alloc];
      v3 = __error();
      v4 = strerror(*v3);
      v5 = -[MBException initWithCode:format:](v2, "initWithCode:format:", 1, CFSTR("getpwnam(\"%@\") failed: %s (%d)"), CFSTR("mobile"), v4, *__error());
      objc_exception_throw(v5);
    }
    result = v1->pw_uid;
    _MBMobileUID = result;
  }
  return result;
}

uint64_t MBNobodyUID()
{
  return 4294967294;
}

uint64_t MBMobileFileAttributes()
{
  _QWORD v1[2];
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v1[0] = *MEMORY[0x1E0CB2A90];
  v2[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", MBMobileUID());
  v1[1] = *MEMORY[0x1E0CB2A50];
  v2[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", MBMobileUID());
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 2);
}

id MBLocale()
{
  const __CFString *v0;
  const __CFString *v1;
  CFPropertyListRef v2;

  v0 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v1 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B228], CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v2 = (id)CFPreferencesCopyValue(CFSTR("AppleLocale"), v0, CFSTR("mobile"), v1);
  if (v2)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v2);
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
}

CFPropertyListRef MBLocalizations()
{
  const __CFString *v0;
  const __CFString *v1;
  CFPropertyListRef result;

  v0 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v1 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B228], CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  result = (id)CFPreferencesCopyValue(CFSTR("AppleLanguages"), v0, CFSTR("mobile"), v1);
  if (!result)
    return &unk_1E996E1C0;
  return result;
}

void MBLogDeviceProperties()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (MBDeviceUUID_pred != -1)
    dispatch_once(&MBDeviceUUID_pred, &__block_literal_global_34);
  v0 = _MBCachedBackupDeviceID;
  v1 = _MBGetCachedGestaltValue((uint64_t)CFSTR("UniqueDeviceID"));
  v2 = MBGetGestaltValueForKey();
  v3 = _MBGetCachedGestaltValue((uint64_t)CFSTR("ProductType"));
  v4 = _MBGetCachedGestaltValue((uint64_t)CFSTR("BuildVersion"));
  v5 = _MBGetCachedGestaltValue((uint64_t)CFSTR("ProductVersion"));
  v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544642;
    v14 = v1;
    v15 = 2112;
    v16 = v0;
    v17 = 2112;
    v18 = v2;
    v19 = 2114;
    v20 = v3;
    v21 = 2114;
    v22 = v5;
    v23 = 2114;
    v24 = v4;
    _os_log_impl(&dword_1D5213000, v6, OS_LOG_TYPE_DEFAULT, "DeviceUDID=\"%{public}@\", DeviceUUID=\"%@\", DeviceName=\"%@\", ProductType=\"%{public}@\", ProductVersion=%{public}@, BuildVersion=%{public}@", buf, 0x3Eu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"DeviceUDID=\"%{public}@\", DeviceUUID=\"%@\", DeviceName=\"%@\", ProductType=\"%{public}@\", ProductVersion=%{public}@, BuildVersion=%{public}@", v7, v8, v9, v10, v11, v12, v1);
  }
}

void sub_1D522CC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *MBCKStringForBackupState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xC)
    return 0;
  else
    return off_1E995D3C0[a1 - 1];
}

__CFString *MBRandomUUID()
{
  const __CFUUID *v0;
  __CFString *v1;

  v0 = CFUUIDCreate(0);
  v1 = (__CFString *)CFUUIDCreateString(0, v0);
  CFRelease(v0);
  return v1;
}

uint64_t MBRandomDataWithLength(size_t a1)
{
  char *v2;
  int v3;
  int v4;
  size_t v5;
  ssize_t v6;
  ssize_t v8;
  MBException *v9;
  const __CFString *v10;
  int *v11;
  MBException *v12;
  MBException *v13;
  int *v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v2 = (char *)malloc_type_malloc(a1, 0x94ADEF60uLL);
  v3 = open("/dev/random", 0);
  if (v3 < 0)
  {
    v13 = [MBException alloc];
    v14 = __error();
    v15 = strerror(*v14);
    v12 = -[MBException initWithCode:format:](v13, "initWithCode:format:", 1, CFSTR("Error opening /dev/random: %s (%d)"), v15, *__error());
    goto LABEL_11;
  }
  v4 = v3;
  if (a1)
  {
    v5 = 0;
    while (1)
    {
      v6 = read(v4, &v2[v5], a1 - v5);
      if (v6 < 1)
        break;
      v5 += v6;
      if (v5 >= a1)
        goto LABEL_6;
    }
    v8 = v6;
    v9 = [MBException alloc];
    if (v8)
    {
      v11 = __error();
      v16 = strerror(*v11);
      v17 = *__error();
      v10 = CFSTR("Error reading /dev/random: %s (%d)");
    }
    else
    {
      v10 = CFSTR("EOF from /dev/random");
    }
    v12 = -[MBException initWithCode:format:](v9, "initWithCode:format:", 1, v10, v16, v17);
LABEL_11:
    objc_exception_throw(v12);
  }
LABEL_6:
  close(v4);
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v2, a1, 1);
}

uint64_t MBUniqueIntegerFilenameWithDirectory(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", a1, 0);
  if (v1
    && (v2 = v1,
        v12 = 0u,
        v13 = 0u,
        v10 = 0u,
        v11 = 0u,
        (v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16)) != 0))
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "integerValue") >= v6)
          v6 = objc_msgSend(v8, "integerValue") + 1;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1;
  }
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6), "description");
}

uint64_t MBStandardizePath(void *a1)
{
  void *v1;

  v1 = a1;
  if (objc_msgSend(a1, "hasPrefix:", CFSTR("~/")))
    v1 = (void *)objc_msgSend(CFSTR("/var/mobile"), "stringByAppendingPathComponent:", objc_msgSend(v1, "substringFromIndex:", 2));
  return objc_msgSend(v1, "stringByStandardizingPath");
}

uint64_t MBCompareVersionStrings(void *a1, const char *a2)
{
  return objc_msgSend(a1, "compare:options:", a2, 64);
}

BOOL MBIsRestoreCompatible(void *a1, void *a2, uint64_t a3, void *a4)
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    MBIsRestoreCompatible_cold_1();
  if (!a2)
    MBIsRestoreCompatible_cold_2();
  v8 = (void *)MBDeviceClass();
  if ((objc_msgSend(v8, "isEqualToString:", a4) & 1) == 0
    && ((objc_msgSend(v8, "isEqualToString:", CFSTR("RealityDevice")) & 1) != 0
     || objc_msgSend(a4, "isEqualToString:", CFSTR("RealityDevice"))))
  {
    v14 = MBGetDefaultLog();
    v13 = 0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v40 = (uint64_t)a4;
      v41 = 2112;
      v42 = v8;
      _os_log_impl(&dword_1D5213000, v14, OS_LOG_TYPE_DEFAULT, "Incoming backup device class %@ is not compatible with current device class %@", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Incoming backup device class %@ is not compatible with current device class %@", v15, v16, v17, v18, v19, v20, (uint64_t)a4);
      return 0;
    }
    return v13;
  }
  v9 = (void *)objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v10 = objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("."));
  if (!a3)
    goto LABEL_17;
  v11 = (void *)v10;
  if (objc_msgSend(a2, "compare:options:", a3, 64) == -1)
  {
    v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v40 = a3;
      _os_log_impl(&dword_1D5213000, v21, OS_LOG_TYPE_ERROR, "Invalid required product version: %{public}@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Invalid required product version: %{public}@", v22, v23, v24, v25, v26, v27, a3);
    }
    goto LABEL_17;
  }
  if ((unint64_t)objc_msgSend(v9, "count") < 2 || (unint64_t)objc_msgSend(v11, "count") < 2)
  {
LABEL_17:
    v28 = a1;
    v29 = a2;
LABEL_18:
    v13 = (unint64_t)objc_msgSend(v28, "compare:options:", v29, 64) < 2;
    goto LABEL_19;
  }
  v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "subarrayWithRange:", 0, 2), "componentsJoinedByString:", CFSTR(".")), "compare:options:", objc_msgSend((id)objc_msgSend(v11, "subarrayWithRange:", 0, 2), "componentsJoinedByString:", CFSTR(".")), 64);
  if (v12 != -1)
  {
    if (v12 == 1)
    {
      v13 = 1;
      goto LABEL_19;
    }
    if (v12)
      MBIsRestoreCompatible_cold_3();
    v28 = a1;
    v29 = (void *)a3;
    goto LABEL_18;
  }
  v13 = 0;
LABEL_19:
  v30 = MBGetDefaultLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v40 = (uint64_t)a1;
    if (v13)
      v31 = "YES";
    else
      v31 = "NO";
    v41 = 2114;
    v42 = a2;
    v43 = 2114;
    v44 = a3;
    v45 = 2082;
    v46 = v31;
    _os_log_impl(&dword_1D5213000, v30, OS_LOG_TYPE_DEFAULT, "Checked restore compatibility - productVersion:%{public}@, incomingProductVersion:%{public}@, incomingRequiredProductVersion:%{public}@, result:%{public}s", buf, 0x2Au);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Checked restore compatibility - productVersion:%{public}@, incomingProductVersion:%{public}@, incomingRequiredProductVersion:%{public}@, result:%{public}s", v32, v33, v34, v35, v36, v37, (uint64_t)a1);
  }
  return v13;
}

void *MBGetGestaltValueForKey()
{
  void *v0;
  id v1;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MGCopyAnswerWithError();
  v1 = v0;
  return v0;
}

uint64_t MBSQLiteJournalSuffixes()
{
  if (MBSQLiteJournalSuffixes_pred != -1)
    dispatch_once(&MBSQLiteJournalSuffixes_pred, &__block_literal_global_6);
  return MBSQLiteJournalSuffixes_set;
}

uint64_t MBSQLitePathExtensions()
{
  if (MBSQLitePathExtensions_pred != -1)
    dispatch_once(&MBSQLitePathExtensions_pred, &__block_literal_global_40);
  return MBSQLitePathExtensions_set;
}

intptr_t MBSemaphoreWaitForever(NSObject *a1)
{
  uint64_t v2;
  uint64_t v3;
  intptr_t result;

  if (!objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    return dispatch_semaphore_wait(a1, 0xFFFFFFFFFFFFFFFFLL);
  v2 = *MEMORY[0x1E0C99748];
  do
  {
    v3 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.01);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop"), "runMode:beforeDate:", v2, v3);
    result = dispatch_semaphore_wait(a1, 0);
  }
  while (result);
  return result;
}

intptr_t MBGroupWaitForever(NSObject *a1)
{
  uint64_t v2;
  uint64_t v3;
  intptr_t result;

  if (!objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    return dispatch_group_wait(a1, 0xFFFFFFFFFFFFFFFFLL);
  v2 = *MEMORY[0x1E0C99748];
  do
  {
    v3 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.01);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop"), "runMode:beforeDate:", v2, v3);
    result = dispatch_group_wait(a1, 0);
  }
  while (result);
  return result;
}

void MBRunLoopPerformBlockAndWait(void *a1, uint64_t a2)
{
  NSObject *v4;
  __CFRunLoop *v5;
  const void *v6;
  _QWORD v7[6];

  v4 = dispatch_semaphore_create(0);
  v5 = (__CFRunLoop *)objc_msgSend(a1, "getCFRunLoop");
  v6 = (const void *)*MEMORY[0x1E0C99748];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __MBRunLoopPerformBlockAndWait_block_invoke;
  v7[3] = &unk_1E995D450;
  v7[4] = v4;
  v7[5] = a2;
  CFRunLoopPerformBlock(v5, v6, v7);
  CFRunLoopWakeUp((CFRunLoopRef)objc_msgSend(a1, "getCFRunLoop"));
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v4);
}

uint64_t MBFreeDiskSpace()
{
  return MBFreeDiskSpaceForVolume(CFSTR("/private/var"));
}

uint64_t MBFreeDiskSpaceForVolume(void *a1)
{
  MBException *v2;
  int *v3;
  char *v4;
  MBException *v5;
  statfs v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(&v6, 0, 512);
  if (statfs((const char *)objc_msgSend(a1, "fileSystemRepresentation"), &v6))
  {
    v2 = [MBException alloc];
    v3 = __error();
    v4 = strerror(*v3);
    v5 = -[MBException initWithCode:format:](v2, "initWithCode:format:", 100, CFSTR("statfs error: %s (%d)"), v4, *__error());
    objc_exception_throw(v5);
  }
  return v6.f_bavail * v6.f_bsize;
}

uint64_t MBUsedDiskSpaceForVolume(void *a1)
{
  MBException *v2;
  int *v3;
  char *v4;
  MBException *v5;
  _QWORD v6[3];
  _QWORD v7[2];

  memset(v7, 0, 12);
  v6[2] = 0;
  v6[0] = 5;
  v6[1] = 2155872256;
  if (getattrlist((const char *)objc_msgSend(a1, "fileSystemRepresentation"), v6, v7, 0xCuLL, 0))
  {
    v2 = [MBException alloc];
    v3 = __error();
    v4 = strerror(*v3);
    v5 = -[MBException initWithCode:format:](v2, "initWithCode:format:", 100, CFSTR("getattrlist error: %s (%d)"), v4, *__error());
    objc_exception_throw(v5);
  }
  return *(_QWORD *)((char *)v7 + 4);
}

uint64_t MBPurgeDiskSpace(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v11[0] = a1;
  v10[0] = CFSTR("CACHE_DELETE_VOLUME");
  v10[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v10[2] = CFSTR("CACHE_DELETE_URGENCY_LIMIT");
  v11[1] = v2;
  v11[2] = &unk_1E996E260;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  CacheDeletePurgeSpaceWithInfo();
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v4;
}

void sub_1D522EB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MBPeakProcessMemoryUsage()
{
  pid_t v0;
  NSObject *v1;
  int v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v20;
  rusage_info_t buffer[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  *(_OWORD *)buffer = 0u;
  v22 = 0u;
  v0 = getpid();
  if (proc_pid_rusage(v0, 4, buffer))
  {
    v1 = MBGetDefaultLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v2 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v2;
      _os_log_impl(&dword_1D5213000, v1, OS_LOG_TYPE_ERROR, "Failed to fetch rusage info: %{errno}d", buf, 8u);
      v3 = __error();
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to fetch rusage info: %{errno}d", v4, v5, v6, v7, v8, v9, *v3);
    }
    return 0;
  }
  else
  {
    v10 = *((_QWORD *)&v38 + 1);
    v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v10;
      _os_log_impl(&dword_1D5213000, v11, OS_LOG_TYPE_INFO, "Fetched peak memory usage of %llu ", buf, 0xCu);
      _MBLog(CFSTR("INFO"), (uint64_t)"Fetched peak memory usage of %llu ", v12, v13, v14, v15, v16, v17, v10);
    }
  }
  return v10;
}

id MBDefaultDebugContext()
{
  CFPropertyListRef v0;
  void *v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = CFPreferencesCopyValue(CFSTR("DebugContext"), CFSTR("com.apple.MobileBackup"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v0)
  {
    v1 = (void *)v0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v1;
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = CFSTR("com.apple.MobileBackup");
      v12 = 2112;
      v13 = CFSTR("DebugContext");
      _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_DEFAULT, "Preference %@ %@ not a dictionary", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Preference %@ %@ not a dictionary", v4, v5, v6, v7, v8, v9, (uint64_t)CFSTR("com.apple.MobileBackup"));
    }
    CFRelease(v1);
  }
  return (id)MEMORY[0x1E0C9AA70];
}

void sub_1D522F35C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D522F3BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D522F41C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D522F474(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D522F4D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D522F548(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D522F5B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D522F794(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MBLogEnableFileLogging()
{
  uint64_t result;

  result = MBIsInternalInstall();
  sFileLoggingEnabled = result;
  return result;
}

void _MBLogFlushDeprecated()
{
  if (sFileLoggingEnabled)
  {
    pthread_mutex_lock(&sLogLock);
    if (sLog)
      fflush((FILE *)sLog);
    pthread_mutex_unlock(&sLogLock);
  }
}

id MBStripLogFormatString(void *a1)
{
  id v1;
  unint64_t v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  BOOL v15;
  unint64_t v16;
  id v17;
  void *v18;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = objc_msgSend(v1, "characterAtIndex:", v4);
      switch(v7)
      {
        case 0:
          v7 = v8 == 37;
          goto LABEL_20;
        case 1:
          v9 = (v8 - 64);
          if (v9 > 0x3B)
            goto LABEL_26;
          if (((1 << (v8 - 64)) & 0x129C2FA010000E3) != 0)
            goto LABEL_19;
          if (v9 == 16)
            goto LABEL_23;
          if (v9 != 59)
            goto LABEL_26;
          if (v6 < v4)
          {
            v10 = v3;
            objc_msgSend(v1, "substringWithRange:", v6, v4 - v6);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "appendString:", v11);

          }
          v7 = 2;
          v6 = v4;
          goto LABEL_20;
        case 2:
          if (v8 == 125)
            v7 = 3;
          else
            v7 = 2;
          if (v8 == 125)
            v5 = v4 + 1;
          goto LABEL_20;
        case 3:
          v12 = (v8 - 64);
          if (v12 > 0x38)
            goto LABEL_26;
          if (((1 << (v8 - 64)) & 0x129C2FA010000E3) != 0)
            goto LABEL_19;
          if (v12 == 16)
          {
LABEL_23:
            if (v5 < v4)
            {
              v13 = v3;
              objc_msgSend(v1, "substringWithRange:", v5, v4 - v5);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "appendString:", v14);

            }
            objc_msgSend(v3, "appendString:", CFSTR("p"));
            v5 = v4 + 1;
          }
          else
          {
LABEL_26:
            if (v8 != 37)
            {
              v7 = 3;
              goto LABEL_20;
            }
          }
LABEL_19:
          v7 = 0;
          v6 = v5;
LABEL_20:
          if (v2 == ++v4)
            goto LABEL_29;
          break;
        default:
          goto LABEL_20;
      }
    }
  }
  v6 = 0;
LABEL_29:
  v15 = v2 > v6;
  v16 = v2 - v6;
  if (v15)
  {
    v17 = v3;
    objc_msgSend(v1, "substringWithRange:", v6, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v18);

  }
  return v3;
}

void _MBLogHelper(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __uint64_t v8;
  void *v9;
  const char *v10;
  size_t v11;
  __objc2_class_ro **p_info;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  time_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  __objc2_class_ro **v49;
  const char *v50;
  id v51;
  FILE *v52;
  uid_t v53;
  int v54;
  uid_t st_uid;
  FILE *v56;
  NSObject *v57;
  dispatch_time_t v58;
  uid_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  const char *v64;
  void *v65;
  void *v66;
  id v67;
  size_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  __darwin_time_t v74;
  off_t st_size;
  off_t v76;
  id obj;
  __uint64_t v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  stat v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (_MBLogHelper_onceToken != -1)
    dispatch_once(&_MBLogHelper_onceToken, &__block_literal_global_8);
  MBGetLogDateFormatter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = 0;
  if (pthread_threadid_np(0, &v78))
  {
    v8 = 0;
    v78 = 0;
  }
  else
  {
    v8 = v78;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %d.%llx %@: %@\n"), v7, _MBLogHelper_pid, v8, v3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  v11 = strlen(v10);
  pthread_mutex_lock(&sLogLock);
  p_info = &OBJC_METACLASS___MBError.info;
  if (sLog)
  {
    if (MBMaxLogSize_onceToken != -1)
      dispatch_once(&MBMaxLogSize_onceToken, &__block_literal_global_14);
    if (MBMaxLogSize_sMaxLogSize > (unint64_t)sLoggedSize)
      goto LABEL_80;
    if (sLog)
      fclose((FILE *)sLog);
  }
  if (MBCreateLogDirectory_onceToken != -1)
    dispatch_once(&MBCreateLogDirectory_onceToken, &__block_literal_global_18);
  if (MBCreateLogDirectory_sCanCreateLogDirectory)
  {
    MBGetLogDir();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");
    if (mkdir(v14, 0x1C0u) && *__error() != 17)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        _MBLogHelper_cold_5();
    }
    else if (!geteuid())
    {
      memset(&v86, 0, sizeof(v86));
      if (lstat(v14, &v86))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          _MBLogHelper_cold_4();
      }
      else
      {
        v59 = MBMobileUID();
        if (v86.st_uid == v59 && v86.st_gid == v59 || !lchown(v14, v59, v59))
        {
          if ((~v86.st_mode & 0x1C0) != 0
            && lchmod(v14, 0x1C0u)
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            _MBLogHelper_cold_2();
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          _MBLogHelper_cold_3();
        }
      }
    }

  }
  if (MBCanCreateLogs_onceToken != -1)
    dispatch_once(&MBCanCreateLogs_onceToken, &__block_literal_global_23_0);
  if (!MBCanCreateLogs_sCanCreateLogs)
  {
    sLog = 0;
    goto LABEL_82;
  }
  v68 = v11;
  v69 = v3;
  MBGetLogDir();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  MBLogBasename();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sLoggedSize = 0;
  memset(&v86, 0, sizeof(v86));
  v17 = objc_retainAutorelease(v16);
  v73 = v15;
  if (!lstat((const char *)objc_msgSend(v17, "fileSystemRepresentation"), &v86))
  {
    if (MBMaxLogSize_onceToken != -1)
      dispatch_once(&MBMaxLogSize_onceToken, &__block_literal_global_14);
    v76 = MBMaxLogSize_sMaxLogSize;
    if (MBMaxLogCount_onceToken != -1)
      dispatch_once(&MBMaxLogCount_onceToken, &__block_literal_global_40_0);
    v18 = MBMaxLogCount_sMaxLogCount;
    v19 = time(0);
    v74 = v19;
    st_size = v86.st_size;
    if (v76 < v86.st_size
      || (sLoggedSize = v86.st_size, v19 > v86.st_birthtimespec.tv_sec) && v19 - v86.st_birthtimespec.tv_sec >= 86401)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (MBCanRotateLogs_onceToken != -1)
        dispatch_once(&MBCanRotateLogs_onceToken, &__block_literal_global_24);
      if (MBCanRotateLogs_sCanRotateLogs)
      {
        v63 = v17;
        v64 = v10;
        v65 = v9;
        v66 = v7;
        v67 = v4;
        objc_msgSend(v20, "contentsOfDirectoryAtPath:error:", v15, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3880];
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __MBOpenLogFile_block_invoke;
        v84[3] = &unk_1E995D4A0;
        v23 = v70;
        v85 = v23;
        objc_msgSend(v22, "predicateWithBlock:", v84);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v21;
        objc_msgSend(v21, "filteredArrayUsingPredicate:");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "sortedArrayUsingComparator:", &__block_literal_global_16_0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        obj = v24;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
        if (!v25)
          goto LABEL_66;
        v26 = v25;
        v27 = *(_QWORD *)v81;
        v71 = *MEMORY[0x1E0CB28A8];
        v72 = v18;
        while (1)
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v81 != v27)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            objc_msgSend(v29, "stringByDeletingPathExtension");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqualToString:", v23);

            if ((v31 & 1) == 0)
            {
              if ((objc_msgSend(v29, "isEqualToString:", v23) & 1) == 0)
                continue;
              v33 = 0;
LABEL_48:
              objc_msgSend(v15, "stringByAppendingPathComponent:", v29);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34;
              if (v18 <= v33)
              {
                v46 = objc_retainAutorelease(v34);
                if (!lstat((const char *)objc_msgSend(v46, "fileSystemRepresentation"), &v86)
                  && v74 > v86.st_mtimespec.tv_sec
                  && v74 - v86.st_mtimespec.tv_sec >= 864001)
                {
                  v47 = v20;
                  v48 = v46;
                  goto LABEL_60;
                }
              }
              else if (v76 < st_size)
              {
                if (v18 > v33 + 1)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
                  v36 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v36, "description");
                  v37 = v15;
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "stringByAppendingPathExtension:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "stringByAppendingPathComponent:", v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  v79 = 0;
                  v41 = v20;
                  LOBYTE(v36) = objc_msgSend(v20, "moveItemAtPath:toPath:error:", v35, v40, &v79);
                  v42 = v79;
                  v43 = v42;
                  if ((v36 & 1) == 0)
                  {
                    objc_msgSend(v42, "domain");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v44, "isEqualToString:", v71) & 1) != 0)
                    {
                      v45 = objc_msgSend(v43, "code");

                      if (v45 == 513)
                        objc_msgSend(v41, "removeItemAtPath:error:", v35, 0);
                    }
                    else
                    {

                    }
                  }

                  v20 = v41;
                  v18 = v72;
                  v15 = v73;
                  goto LABEL_63;
                }
                v47 = v20;
                v48 = v35;
LABEL_60:
                objc_msgSend(v47, "removeItemAtPath:error:", v48, 0);
              }
LABEL_63:

              continue;
            }
            objc_msgSend(v29, "pathExtension");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "intValue");

            if ((v33 & 0x80000000) == 0)
              goto LABEL_48;
          }
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
          if (!v26)
          {
LABEL_66:

            v7 = v66;
            v4 = v67;
            v10 = v64;
            v9 = v65;
            p_info = (__objc2_class_ro **)(&OBJC_METACLASS___MBError + 32);
            v17 = v63;
            goto LABEL_69;
          }
        }
      }
      objc_msgSend(v20, "removeItemAtPath:error:", v17, 0);
LABEL_69:

    }
  }
  v49 = p_info;
  v50 = v10;
  v51 = objc_retainAutorelease(v17);
  v52 = fopen((const char *)objc_msgSend(v51, "fileSystemRepresentation"), "a");
  if (v52)
  {
    v53 = MBMobileUID();
    v54 = fileno(v52);
    if (!fstat(v54, &v86))
    {
      st_uid = v86.st_uid;
      if (v86.st_uid != v53 && st_uid == geteuid())
        fchown(v54, v53, 0xFFFFFFFF);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    _MBLogHelper_cold_1();
  }

  sLog = (uint64_t)v52;
  v10 = v50;
  v11 = v68;
  v3 = v69;
  if (v52)
  {
    p_info = v49;
    if (ftello(v52))
    {
      fputs("\n", (FILE *)sLog);
      v49[296] = (__objc2_class_ro *)((char *)v49[296] + 1);
    }
LABEL_80:
    v56 = (FILE *)sLog;
    if (sLog)
    {
      p_info[296] = (__objc2_class_ro *)((char *)p_info[296] + v11);
      fputs(v10, v56);
      v57 = sFlushTimer;
      v58 = dispatch_time(0, 3000000000);
      dispatch_source_set_timer(v57, v58, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
LABEL_82:
  pthread_mutex_unlock(&sLogLock);

}

uint64_t MBLogStashLogs()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *context;
  id obj;
  int v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  result = MBIsInternalInstall();
  if ((_DWORD)result)
  {
    v1 = pthread_mutex_lock(&sLogLock);
    v2 = MEMORY[0x1D8270CF0](v1);
    if (sLog)
    {
      fclose((FILE *)sLog);
      sLog = 0;
    }
    MBGetLogDir();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MBLogBasename();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "contentsOfDirectoryAtPath:error:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3880];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __MBLogStashLogs_block_invoke;
    v36[3] = &unk_1E995D4A0;
    v7 = v4;
    v37 = v7;
    objc_msgSend(v6, "predicateWithBlock:", v36);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v5;
    context = (void *)v2;
    v25 = v9;
    v26 = (void *)v8;
    if (MBMaxLogCount_onceToken != -1)
      dispatch_once(&MBMaxLogCount_onceToken, &__block_literal_global_40_0);
    v30 = MBMaxLogCount_sMaxLogCount;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v15, "stringByDeletingPathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v7);

          if ((v17 & 1) == 0)
          {
            if ((objc_msgSend(v15, "isEqualToString:", v7) & 1) == 0)
              continue;
            v19 = 0;
LABEL_16:
            objc_msgSend(v3, "stringByAppendingPathComponent:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v19 + v30));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "description");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "stringByAppendingPathExtension:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "stringByAppendingPathComponent:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "moveItemAtPath:toPath:error:", v20, v24, 0);
            continue;
          }
          objc_msgSend(v15, "pathExtension");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "intValue");

          if ((v19 & 0x80000000) == 0)
            goto LABEL_16;
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v12);
    }

    objc_autoreleasePoolPop(context);
    return pthread_mutex_unlock(&sLogLock);
  }
  return result;
}

id MBLogBasename()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1 || (v2 = objc_retainAutorelease(v1), !strcmp((const char *)objc_msgSend(v2, "UTF8String"), "backupd")))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("MobileBackup"), CFSTR("log"), v5);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@.%@"), CFSTR("MobileBackup"), v2, CFSTR("log"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int *OUTLINED_FUNCTION_3()
{
  return __error();
}

uint64_t MBSnapshotName(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), a1, a2);
}

id MBSnapshotNameWithCurrentDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v1 = (void *)MEMORY[0x1E0C99D68];
  v2 = a1;
  objc_msgSend(v1, "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd.HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v6);

  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "stringFromDate:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@-%@"), v2, v8);

  return v9;
}

id MBSnapshotPathFromLivePath(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6 && !v7)
    MBSnapshotPathFromLivePath_cold_1();
  if (objc_msgSend(v6, "length"))
  {
    if (!objc_msgSend(v5, "length"))
    {
      v9 = v8;

      v5 = v9;
    }
    v10 = CFSTR("/private/var");
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("/private/var")))
    {
      if ((objc_msgSend(v5, "hasPrefix:", CFSTR("/var/")) & 1) != 0)
      {
        v10 = CFSTR("/var");
      }
      else if (!objc_msgSend(v5, "hasPrefix:", CFSTR("/private/var/")))
      {
        v10 = 0;
      }
    }
    else
    {
      if (objc_msgSend(v5, "hasPrefix:", CFSTR("/private/var/")))
      {
        objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length"));
        v12 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v12;
      }
      if (objc_msgSend(v5, "hasPrefix:", CFSTR("/var/")))
      {
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("/private/var/")))
        {
          objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length"));
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = v8;
        }
        v10 = v13;
      }
      else
      {
        v10 = 0;
      }
    }
    v14 = objc_msgSend(v5, "length");
    v15 = -[__CFString length](v10, "length");
    v16 = v15;
    if (v10 && v14 == v15)
    {
      if (objc_msgSend(v5, "hasPrefix:", v10))
      {
        v17 = v6;
LABEL_33:
        v11 = v17;

        goto LABEL_34;
      }
    }
    else if (!v10)
    {
LABEL_32:
      v17 = v5;
      goto LABEL_33;
    }
    if (objc_msgSend(v5, "hasPrefix:", v10)
      && v14 != v16
      && objc_msgSend(v5, "characterAtIndex:", v16) == 47)
    {
      if (objc_msgSend(v5, "rangeOfString:", v10) || !v18)
        MBSnapshotPathFromLivePath_cold_2();
      objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", 0, v18, v6);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  v5 = v5;
  v11 = v5;
LABEL_34:

  return v11;
}

uint64_t MBPathHasVolumePrefix(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("/"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("/var/"))
    && objc_msgSend(v4, "hasPrefix:", CFSTR("/private")))
  {
    objc_msgSend(v4, "substringFromIndex:", 8);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v7 = objc_msgSend(v3, "hasPrefix:", v5);

  return v7;
}

uint64_t MBVolumeTypeFromMountPoint(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("/private/var/mobile")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("/private/var")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "hasPrefix:", CFSTR("/private/var/PersonaVolumes")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t MBVolumeTypeFromPath(void *a1)
{
  id v1;
  uint64_t HasVolumePrefix;

  v1 = a1;
  if ((MBPathHasVolumePrefix(v1, CFSTR("/private/var/mobile")) & 1) != 0)
  {
    HasVolumePrefix = 2;
  }
  else if ((MBPathHasVolumePrefix(v1, CFSTR("/private/var/PersonaVolumes")) & 1) != 0)
  {
    HasVolumePrefix = 3;
  }
  else
  {
    HasVolumePrefix = MBPathHasVolumePrefix(v1, CFSTR("/private/var"));
  }

  return HasVolumePrefix;
}

void *MBiCloudUserSessionSnapshotMountPoints()
{
  return &unk_1E996E1D8;
}

void *MBD2DSnapshotMountPoints()
{
  return &unk_1E996E1F0;
}

void *MBFinderSnapshotMountPoints()
{
  return &unk_1E996E208;
}

id MBLivePathFromSnapshotPath(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v5;
  v9 = v6;
  v10 = v7;
  if ((objc_msgSend(v8, "hasPrefix:", v9) & 1) == 0)
    goto LABEL_6;
  if (objc_msgSend(v8, "rangeOfString:", v9))
    MBLivePathFromSnapshotPath_cold_1();
  v12 = v11;
  if (objc_msgSend(v8, "length") > v11 && objc_msgSend(v8, "characterAtIndex:", v12) == 47)
  {
    objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", 0, v12, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v13 = v8;
  }
  v14 = v13;

  return v14;
}

void sub_1D5236FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5237380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  void *v11;

  objc_sync_exit(v11);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D52374D0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1D5237568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5237618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D52376C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D52377F0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1D5237920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D52379BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5237A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5237B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5237C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5237D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5237F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D5238128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D52381C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D52382F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5238454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5238974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D5238C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1D5238E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5238FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5239184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523930C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D52393C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523946C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5239514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523961C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1D5239810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D5239988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D5239A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D5239B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5239E40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  _Unwind_Resume(exception_object);
}

void sub_1D523A068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523A1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523A334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523A470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523A5F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523A7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523A964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523AA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523AA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523ABD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523AD60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523AEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523B0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523B184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523B2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523B450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523B610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523B7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523B9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523BB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523BD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523BF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523BFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523C068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523C1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523C274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523C308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523C400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523C4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523C5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523C6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523C768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523C878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523C99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523CBD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523CE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523D014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523D27C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523D4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523D624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523D6C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523D7E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523D880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523D988(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1D523DA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523DB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523DBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523DC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523DD58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523DE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523DEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523DF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523E114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523E28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523E408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523E580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523E774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523E8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523E99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523EB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1D523ED80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523EEAC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1D523EFE0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1D523F110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523F244(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1D523F590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523F6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523F828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D523F9E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523FB8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523FD3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D523FF64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  _Unwind_Resume(exception_object);
}

void sub_1D5240194(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  _Unwind_Resume(exception_object);
}

void sub_1D5240230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5240390(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D5241298(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D5241348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D52413D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5241488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D524157C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5241678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5241730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5241848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5241968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5241A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5241B44(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1D5241C70(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1D5241DCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  _Unwind_Resume(exception_object);
}

void sub_1D5241E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D5241F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D52420D0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1D5242200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D52422B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

uint64_t MBIsRunningInDaemon()
{
  return sIsRunningInDaemon;
}

void MBSetIsRunningInDaemon()
{
  sIsRunningInDaemon = 1;
}

void sub_1D5242AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1D5243124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D524365C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D52437EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL MBSnapshotTypeIsFull(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

const __CFString *MBStringForSnapshotType(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("unspecified");
  else
    return off_1E995D7C0[a1];
}

__CFString *MBStringForSnapshotFormat(uint64_t a1)
{
  void *v3;

  if ((unint64_t)(a1 + 1) < 5)
    return off_1E995D7E8[a1 + 1];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  return (__CFString *)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *MBStringForSnapshotFormat(MBSnapshotFormat)"), CFSTR("MBCommon.m"), 82, CFSTR("Unknown snapshot format reason %llu"), a1);
}

uint64_t MBSnapshotFormatForString(void *a1)
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("ManifestsFiles")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("ManifestsFilesAndDomains")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("ManifestsFilesAndDomainsAssets")) & 1) != 0)
    return 2;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("ManifestsFilesAndDomains")))
    return 3;
  return -1;
}

uint64_t MBSnapshotFormatContainsManifests(uint64_t a1)
{
  unsigned int v1;
  void *v3;

  if ((unint64_t)(a1 + 1) >= 5)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL MBSnapshotFormatContainsManifests(MBSnapshotFormat)"), CFSTR("MBCommon.m"), 113, CFSTR("Unknown snapshot format %llu"), a1);
  }
  else
  {
    v1 = (0xFu >> (a1 + 1)) & 1;
  }
  return v1 & 1;
}

uint64_t MBSnapshotFormatContainsFileLists(uint64_t a1)
{
  unsigned int v1;
  void *v3;

  if ((unint64_t)(a1 + 1) >= 5)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL MBSnapshotFormatContainsFileLists(MBSnapshotFormat)"), CFSTR("MBCommon.m"), 130, CFSTR("Unknown snapshot format %llu"), a1);
  }
  else
  {
    v1 = (0x1Cu >> (a1 + 1)) & 1;
  }
  return v1 & 1;
}

uint64_t MBSnapshotFormatContainsAssets(uint64_t a1)
{
  unsigned int v1;
  void *v3;

  if ((unint64_t)(a1 + 1) >= 5)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL MBSnapshotFormatContainsAssets(MBSnapshotFormat)"), CFSTR("MBCommon.m"), 147, CFSTR("Unknown snapshot format %llu"), a1);
  }
  else
  {
    v1 = (0x18u >> (a1 + 1)) & 1;
  }
  return v1 & 1;
}

__CFString *MBStringForBackupReason(unint64_t a1)
{
  void *v3;

  if (a1 < 6)
    return off_1E995D810[a1];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *MBStringForBackupReason(MBBackupReason)"), CFSTR("MBCommon.m"), 164, CFSTR("Unknown backup reason %lu"), a1);
  return 0;
}

BOOL MBBackupReasonIsManual(uint64_t a1)
{
  return a1 == 1;
}

BOOL MBBackupReasonIsScheduled(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 3;
}

uint64_t MBGetBackupDir()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *MBGetBackupDir(void)"), CFSTR("MBCommon.m"), 192, CFSTR("Backup directory not defined on the device"));
  return 0;
}

uint64_t MBGetCacheDir()
{
  return objc_msgSend(CFSTR("/var/mobile"), "stringByAppendingPathComponent:", CFSTR("Library/Caches/Backup"));
}

id MBSetBackupDir(void *a1)
{
  id result;

  result = a1;
  _MBBackupDir = (uint64_t)result;
  return result;
}

uint64_t MBAcquireRestoreLock(int a1)
{
  const char *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  int *v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  int *v42;
  char *v43;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[8];
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v2 = (const char *)objc_msgSend(CFSTR("/var/mobile/Library/Caches/Backup/RestoreFromBackupLock"), "fileSystemRepresentation");
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_INFO, "Acquiring the MBS restore lock", buf, 2u);
    _MBLog(CFSTR("INFO"), (uint64_t)"Acquiring the MBS restore lock", v4, v5, v6, v7, v8, v9, v45);
  }
  if (_MBRestoreLockFD != -1)
  {
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_INFO, "The MBS restore lock is already held by this process", buf, 2u);
      _MBLog(CFSTR("INFO"), (uint64_t)"The MBS restore lock is already held by this process", v11, v12, v13, v14, v15, v16, v45);
    }
    return 0;
  }
  v17 = objc_msgSend(CFSTR("/var/mobile/Library/Caches/Backup/RestoreFromBackupLock"), "stringByDeletingLastPathComponent");
  v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = *MEMORY[0x1E0CB2A58];
  v48[0] = *MEMORY[0x1E0CB2A98];
  v48[1] = v19;
  v49[0] = CFSTR("mobile");
  v49[1] = CFSTR("mobile");
  objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2), 0);
  v46 = 420;
  v20 = open(v2, 514);
  _MBRestoreLockFD = v20;
  if (v20 < 0)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99750];
    v23 = __error();
    v46 = (uint64_t)strerror(*v23);
    __error();
    objc_msgSend(v21, "raise:format:", v22, CFSTR("Error opening incomplete MBS restore directory lock file: %s (%d)"));
    v20 = _MBRestoreLockFD;
  }
  if (a1)
    v24 = 6;
  else
    v24 = 2;
  if (flock(v20, v24))
  {
    if (*__error() != 35)
    {
      v40 = (void *)MEMORY[0x1E0C99DA0];
      v41 = *MEMORY[0x1E0C99750];
      v42 = __error();
      v43 = strerror(*v42);
      objc_msgSend(v40, "raise:format:", v41, CFSTR("Error locking incomplete MBS restore directory lock file: %s (%d)"), v43, *__error());
      return 0;
    }
    v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5213000, v25, OS_LOG_TYPE_INFO, "The MBS restore lock is already held by another process", buf, 2u);
      _MBLog(CFSTR("INFO"), (uint64_t)"The MBS restore lock is already held by another process", v26, v27, v28, v29, v30, v31, v46);
    }
    close(_MBRestoreLockFD);
    v32 = 0;
    _MBRestoreLockFD = -1;
  }
  else
  {
    v33 = MBGetDefaultLog();
    v32 = 1;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5213000, v33, OS_LOG_TYPE_INFO, "Acquired the MBS restore lock", buf, 2u);
      _MBLog(CFSTR("INFO"), (uint64_t)"Acquired the MBS restore lock", v34, v35, v36, v37, v38, v39, v46);
    }
  }
  return v32;
}

void MBReleaseRestoreLock()
{
  int v0;
  NSObject *v1;
  _BOOL4 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[16];

  v0 = _MBRestoreLockFD;
  v1 = MBGetDefaultLog();
  v2 = os_log_type_enabled(v1, OS_LOG_TYPE_INFO);
  if (v0 < 0)
  {
    if (v2)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D5213000, v1, OS_LOG_TYPE_INFO, "The MBS restore lock is not held by this process", (uint8_t *)&v15, 2u);
      _MBLog(CFSTR("INFO"), (uint64_t)"The MBS restore lock is not held by this process", v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5213000, v1, OS_LOG_TYPE_INFO, "Releasing the MBS restore lock", buf, 2u);
      _MBLog(CFSTR("INFO"), (uint64_t)"Releasing the MBS restore lock", v3, v4, v5, v6, v7, v8, v15);
    }
    close(_MBRestoreLockFD);
    _MBRestoreLockFD = -1;
  }
}

id MBBackupMetadataFilenames()
{
  id result;

  result = (id)_MBBackupMetadataFilenames;
  if (!_MBBackupMetadataFilenames)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Status.plist"), CFSTR("Manifest.plist"), CFSTR("Manifest.mbdb"), CFSTR("Manifest.mbdx"), CFSTR("Info.plist"), CFSTR("Snapshot"), CFSTR("Manifest.db"), 0);
    _MBBackupMetadataFilenames = (uint64_t)result;
  }
  return result;
}

void MBGetFileIDBytes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  MBDigestSHA1 *v9;

  if (a4 != 20)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MBGetFileIDBytes(NSString *, NSString *, void *, NSUInteger)"), CFSTR("MBCommon.m"), 334, CFSTR("Invalid buffer size"));
  }
  v9 = objc_alloc_init(MBDigestSHA1);
  -[MBDigest updateWithString:](v9, "updateWithString:", a1);
  -[MBDigest updateWithString:](v9, "updateWithString:", CFSTR("-"));
  -[MBDigest updateWithString:](v9, "updateWithString:", a2);
  -[MBDigestSHA1 finalWithBytes:length:](v9, "finalWithBytes:length:", a3, a4);

}

uint64_t MBIsValidRelativePathIgnoreTilde(void *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  uint64_t v10;

  if (!a1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Null path"));
  v4 = objc_msgSend(a1, "length");
  if (!v4)
    return 1;
  v5 = v4;
  v6 = objc_msgSend(a1, "characterAtIndex:", 0);
  result = 0;
  if (v6 == 126)
    v8 = a2;
  else
    v8 = 1;
  if (v6 != 47 && v8)
  {
    if (v5 == 1)
    {
      v9 = 0;
    }
    else
    {
      v9 = 0;
      v10 = 1;
      do
      {
        if (objc_msgSend(a1, "characterAtIndex:", v10) == 47)
        {
          result = _MBIsValidRelativePathComponent(a1, v9, v10);
          if (!(_DWORD)result)
            return result;
          v9 = ++v10;
        }
        else
        {
          ++v10;
        }
      }
      while (v10 != v5);
    }
    return _MBIsValidRelativePathComponent(a1, v9, v5);
  }
  return result;
}

BOOL _MBIsValidRelativePathComponent(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;

  v7 = a3 - a2;
  if (a3 == a2)
    return 0;
  v11 = v4;
  v12 = v3;
  if (v7 == 2)
  {
    if (objc_msgSend(a1, "characterAtIndex:", a3 - 2) != 46)
      return 1;
  }
  else if (v7 != 1)
  {
    return 1;
  }
  return objc_msgSend(a1, "characterAtIndex:", a3 - 1, v11, v12, v5, v6) != 46;
}

uint64_t MBIsValidRelativePath(void *a1)
{
  return MBIsValidRelativePathIgnoreTilde(a1, 0);
}

id MBLocalizedStringFromTable(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (MBIsInternalInstall())
  {
    objc_msgSend(v6, "bundlePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("/usr/local/bin")) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "processName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("backupctl"));

      if ((v10 & 1) != 0)
      {
LABEL_8:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/MobileBackup.framework"));
        v11 = v6;
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v6, "bundlePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("/usr/libexec")))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "processName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("BackupAgent2"));

    if (!v14)
      goto LABEL_10;
    goto LABEL_8;
  }
LABEL_9:

LABEL_10:
  MBLocalizations();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v6, "localizations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferredLocalizationsFromArray:forPreferences:", v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "firstObject");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = CFSTR("en");
  }
  objc_msgSend(v6, "_cfBundle");
  v20 = (void *)CFBundleCopyLocalizedStringForLocalization();

  return v20;
}

id MBLocalizedString(void *a1)
{
  return MBLocalizedStringFromTable(a1, CFSTR("MobileBackup"));
}

id MBLocalizedStringWithSubstitutionsFromTable(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t *v24;

  v11 = a1;
  v24 = &a9;
  v12 = a3;
  MBLocalizedStringFromTable(v11, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull MBLocalizedStringWithSubstitutionsFromTable(NSString *__strong _Nonnull, NSString *__strong _Nonnull, NSString *__strong _Nonnull, ...)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("MBLocalizedStringUtils.m"), 45, CFSTR("nil localized format string for %@ key"), v11);

  }
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v16 = (void *)objc_msgSend(v14, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v13, v12, v15, v24, &v23);

  v17 = v23;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull MBLocalizedStringWithSubstitutionsFromTable(NSString *__strong _Nonnull, NSString *__strong _Nonnull, NSString *__strong _Nonnull, ...)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("MBLocalizedStringUtils.m"), 49, CFSTR("nil localized string for %@ key - %@"), v11, v17);

  }
  return v16;
}

id MBLocalizedStringWithFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t *v21;

  v10 = a1;
  v21 = &a9;
  v11 = a2;
  MBLocalizedStringFromTable(v10, CFSTR("MobileBackup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull MBLocalizedStringWithFormat(NSString *__strong _Nonnull, NSString *__strong _Nonnull, ...)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("MBLocalizedStringUtils.m"), 61, CFSTR("nil localized format for %@ key"), v10);

  }
  v20 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v12, v11, 0, v21, &v20);

  v14 = v20;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull MBLocalizedStringWithFormat(NSString *__strong _Nonnull, NSString *__strong _Nonnull, ...)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("MBLocalizedStringUtils.m"), 65, CFSTR("nil string for %@ key - %@"), v10, v14);

  }
  return v13;
}

id MBLocalizedStringWithSubstitutions(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t *v23;

  v10 = a1;
  v23 = &a9;
  v11 = a2;
  MBLocalizedStringFromTable(v10, CFSTR("MobileBackup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull MBLocalizedStringWithSubstitutions(NSString *__strong _Nonnull, NSString *__strong _Nonnull, ...)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("MBLocalizedStringUtils.m"), 77, CFSTR("nil localized format string for %@ key"), v10);

  }
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v15 = (void *)objc_msgSend(v13, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v12, v11, v14, v23, &v22);

  v16 = v22;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull MBLocalizedStringWithSubstitutions(NSString *__strong _Nonnull, NSString *__strong _Nonnull, ...)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("MBLocalizedStringUtils.m"), 81, CFSTR("nil localized string for %@ key - %@"), v10, v16);

  }
  return v15;
}

id MBLocalizedStringWithGreenTeaSuffix(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t *v21;

  v21 = &a9;
  v10 = a2;
  objc_msgSend(a1, "mb_stringByAppendingGreenteaSuffix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MBLocalizedStringFromTable(v11, CFSTR("MobileBackup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull MBLocalizedStringWithGreenTeaSuffix(NSString *__strong _Nonnull, NSString *__strong _Nonnull, ...)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("MBLocalizedStringUtils.m"), 94, CFSTR("nil localized format string for %@ key"), v11);

  }
  v20 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v12, v10, 0, v21, &v20);

  v14 = v20;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull MBLocalizedStringWithGreenTeaSuffix(NSString *__strong _Nonnull, NSString *__strong _Nonnull, ...)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("MBLocalizedStringUtils.m"), 98, CFSTR("nil localized string for %@ key - %@"), v11, v14);

  }
  return v13;
}

id MBLocalizedStringWithGreenTeaSuffixAndSubstitutions(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t *v23;

  v23 = &a9;
  v10 = a2;
  objc_msgSend(a1, "mb_stringByAppendingGreenteaSuffix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MBLocalizedStringFromTable(v11, CFSTR("MobileBackup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull MBLocalizedStringWithGreenTeaSuffixAndSubstitutions(NSString *__strong _Nonnull, NSString *__strong _Nonnull, ...)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("MBLocalizedStringUtils.m"), 112, CFSTR("nil localized format string for %@ key"), v11);

  }
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v15 = (void *)objc_msgSend(v13, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v12, v10, v14, v23, &v22);

  v16 = v22;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull MBLocalizedStringWithGreenTeaSuffixAndSubstitutions(NSString *__strong _Nonnull, NSString *__strong _Nonnull, ...)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("MBLocalizedStringUtils.m"), 116, CFSTR("nil localized string for %@ key - %@"), v11, v16);

  }
  return v15;
}

void sub_1D5246720(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D5246818(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _MBAssert(char a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MBAssertV(a1, a2, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id MBAssertV(char a1, void *a2, uint64_t a3)
{
  void *v3;

  if ((a1 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    MBAssertionFailureV(a2, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

id MBAssertionFailureV(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a1;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:arguments:", v4, a2);

  +[MBError errorWithCode:description:](MBError, "errorWithCode:description:", 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t MBSimpleChecksumForString(void *a1)
{
  const char *v1;
  int64_t v2;
  unsigned int v3;
  char *v4;
  int64_t v5;
  int v6;
  uint64_t v7;

  v1 = (const char *)objc_msgSend(a1, "UTF8String");
  v2 = strlen(v1);
  if (v2 < 1)
    return 0;
  v3 = 0;
  v4 = (char *)&v1[v2];
  do
  {
    v5 = v4 - v1;
    if ((unint64_t)(v4 - v1) < 4)
    {
      switch(v5)
      {
        case 1:
          v6 = *v1 << 24;
          v7 = 1;
          break;
        case 2:
          v6 = (v1[1] << 16) | (*v1 << 24);
          v7 = 2;
          break;
        case 3:
          v6 = (v1[1] << 16) | (*v1 << 24) | (v1[2] << 8);
          v7 = 3;
          break;
        default:
          MBSimpleChecksumForString_cold_1();
      }
    }
    else
    {
      v6 = (v1[1] << 16) | (*v1 << 24) | (v1[2] << 8) | v1[3];
      v7 = 4;
    }
    v1 += v7;
    v3 += v6;
  }
  while (v1 < v4);
  return v3;
}

id MBStringWithXPCObject()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x1D82711D0]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  free(v0);
  return v1;
}

id _systemDomainsPlistPath()
{
  if (_systemDomainsPlistPath_onceToken != -1)
    dispatch_once(&_systemDomainsPlistPath_onceToken, &__block_literal_global_12);
  return (id)_systemDomainsPlistPath_systemDomainsPlistPath;
}

void ___systemDomainsPlistPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("Domains"), CFSTR("plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_systemDomainsPlistPath_systemDomainsPlistPath;
  _systemDomainsPlistPath_systemDomainsPlistPath = v0;

}

void sub_1D524F60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1D5250060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D5250624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5250B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MBIsInternalInstall()
{
  if (MBIsInternalInstall_onceToken != -1)
    dispatch_once(&MBIsInternalInstall_onceToken, &__block_literal_global_13);
  return MBIsInternalInstall_sMBIsInternalInstall;
}

Class MBWeakLinkClass(void *a1, uint64_t a2)
{
  void *v5;

  if (!_MBDLHandleForLibrary(a2))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class MBWeakLinkClass(NSString *, NSString *)"), CFSTR("MBWeakLinking.m"), 93, CFSTR("Could not load framework %@ for class %@"), a2, a1);
  }
  return objc_getClass((const char *)objc_msgSend(a1, "UTF8String"));
}

uint64_t _MBDLHandleForLibrary(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if (_MBDLHandleForLibrary_onceToken != -1)
    dispatch_once(&_MBDLHandleForLibrary_onceToken, &__block_literal_global_14);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___MBDLHandleForLibrary_block_invoke_2;
  v4[3] = &unk_1E995D988;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)_MBDLHandleForLibrary_queue, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void *MBWeakLinkSymbol(void *a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)_MBDLHandleForLibrary(a2);
  return dlsym(v3, (const char *)objc_msgSend(a1, "UTF8String"));
}

const __CFString *MBStringForBackupPolicy(uint64_t a1)
{
  if (a1)
    return CFSTR("mega");
  else
    return CFSTR("default");
}

void _volumeMountPointForPlist_cold_1()
{
  __assert_rtn("_volumeMountPointForPlist", "MBAppManager.m", 748, "path");
}

void _mkdtemp_cold_1()
{
  __assert_rtn("_mkdtemp", "MBTemporaryDirectory.m", 26, "root");
}

void _mkdtemp_cold_2()
{
  __assert_rtn("_mkdtemp", "MBTemporaryDirectory.m", 27, "identifier");
}

void _mkpath_if_necessary_cold_1()
{
  __assert_rtn("_mkpath_if_necessary", "MBTemporaryDirectory.m", 57, "path");
}

void _mktemp_cold_1()
{
  __assert_rtn("_mktemp", "MBTemporaryDirectory.m", 39, "root");
}

void MBCreateTemporaryFilePathIn_cold_1()
{
  __assert_rtn("MBCreateTemporaryFilePathIn", "MBTemporaryDirectory.m", 252, "parentDirectoryPath");
}

void MBIsRestoreCompatible_cold_1()
{
  __assert_rtn("MBIsRestoreCompatible", "MBUtilities.m", 133, "productVersion");
}

void MBIsRestoreCompatible_cold_2()
{
  __assert_rtn("MBIsRestoreCompatible", "MBUtilities.m", 134, "incomingProductVersion");
}

void MBIsRestoreCompatible_cold_3()
{
  __assert_rtn("MBIsRestoreCompatible", "MBUtilities.m", 173, "cmp == NSOrderedSame");
}

void _MBLogHelper_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D5213000, MEMORY[0x1E0C81028], v0, "Failed to open MobileBackup log file at %@: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void _MBLogHelper_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D5213000, MEMORY[0x1E0C81028], v0, "lchmod failed at %s: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void _MBLogHelper_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D5213000, MEMORY[0x1E0C81028], v0, "lchown failed at %s: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void _MBLogHelper_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D5213000, MEMORY[0x1E0C81028], v0, "lstat failed at %s: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void _MBLogHelper_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D5213000, MEMORY[0x1E0C81028], v0, "mkdir failed at %s: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void MBSnapshotPathFromLivePath_cold_1()
{
  __assert_rtn("MBSnapshotPathFromLivePath", "MBFileSystemManager.m", 700, "!snapshotPath || volumeMountPoint");
}

void MBSnapshotPathFromLivePath_cold_2()
{
  __assert_rtn("MBSnapshotPathFromLivePath", "MBFileSystemManager.m", 739, "r.location == 0 && 0 < r.length");
}

void MBLivePathFromSnapshotPath_cold_1()
{
  __assert_rtn("replaceSnapshotMountPointPrefix", "MBFileSystemManager.m", 806, "range.location == 0");
}

void MBSimpleChecksumForString_cold_1()
{
  __assert_rtn("MBSimpleChecksumForString", "MBDigest.m", 365, "0");
}

uint64_t CCHmacOneShot()
{
  return MEMORY[0x1E0C80208]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1E0C98060]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98858](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return MEMORY[0x1E0D09B80]();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD90](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1E0DE2B38]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C82640](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C832E0](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83380](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fs_snapshot_create(int a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1E0C834F8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int fs_snapshot_delete(int a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1E0C83500](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int fs_snapshot_list(int a1, attrlist *a2, void *a3, size_t a4, uint32_t a5)
{
  return MEMORY[0x1E0C83508](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

int fs_snapshot_mount(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x1E0C83510](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fs_snapshot_rename(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x1E0C83518](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1E0C83588](__stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1E0C83670](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int getpagesize(void)
{
  return MEMORY[0x1E0C83740]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C83B30](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C83B38](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1E0C841C0](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x1E0CCFE10](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x1E0CCFE20](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE48](monitor);
}

nw_path_monitor_t nw_path_monitor_create_with_type(nw_interface_type_t required_interface_type)
{
  return (nw_path_monitor_t)MEMORY[0x1E0CCFE58](*(_QWORD *)&required_interface_type);
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCFE60](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x1E0CCFE68](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE70](monitor);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1E0C844A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

uint64_t os_log_copy_message_string()
{
  return MEMORY[0x1E0C84720]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

uint64_t os_log_set_hook()
{
  return MEMORY[0x1E0C84758]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_log_type_get_name()
{
  return MEMORY[0x1E0C84788]();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1E0C84C28](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1E0C84F38](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unmount(const char *a1, int a2)
{
  return MEMORY[0x1E0C859C8](a1, *(_QWORD *)&a2);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  MEMORY[0x1E0C860E0](connection);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

