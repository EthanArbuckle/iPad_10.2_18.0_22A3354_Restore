void sub_1D41511D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id gs_default_log()
{
  if (gs_default_log_once != -1)
    dispatch_once(&gs_default_log_once, &__block_literal_global);
  return (id)gs_default_log_logger;
}

BOOL get_volume_uuid(const char *a1, _OWORD *a2)
{
  int v3;
  __int128 v5;
  uint64_t v6;
  _BYTE v7[20];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(v7, 0, sizeof(v7));
  v5 = xmmword_1D4167740;
  v6 = 0;
  v3 = getattrlist(a1, &v5, v7, 0x14uLL, 0);
  if (!v3)
    *a2 = *(_OWORD *)&v7[4];
  return v3 == 0;
}

uint64_t GSGetDocumentID(int a1, _DWORD *a2)
{
  uint64_t result;
  NSObject *v4;
  uint64_t v5;
  unsigned int v6;
  __int128 v7;
  uint64_t v8;

  v8 = 0;
  v7 = xmmword_1D4167758;
  v6 = 0;
  v5 = 0;
  if (fgetattrlist(a1, &v7, &v5, 0xCuLL, 0x20u) < 0)
  {
    gs_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
      GSGetDocumentID_cold_1();

    result = 0;
    if (a2)
      *a2 = 0;
  }
  else
  {
    if (a2)
      *a2 = HIDWORD(v5);
    return v6;
  }
  return result;
}

void __gs_default_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.revisiond", "default");
  v1 = (void *)gs_default_log_logger;
  gs_default_log_logger = (uint64_t)v0;

}

void reportSimulatedCrashWithFormatSignature(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = a1;
  if (reportSimulatedCrashWithFormatSignature_onceToken != -1)
    dispatch_once(&reportSimulatedCrashWithFormatSignature_onceToken, &__block_literal_global_3);
  if ((unint64_t)objc_msgSend(v1, "length") >= 0x65)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":0x%lx"), objc_msgSend(v1, "hash"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "substringToIndex:", 100 - objc_msgSend(v2, "length"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v2);
    v4 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v4;
  }
  objc_msgSend((id)reportSimulatedCrashWithFormatSignature__diagnosticReporter, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("Application"), CFSTR("Functional"), CFSTR("AssertionFailed"), CFSTR("revisiond"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v1, *MEMORY[0x1E0DB00F0]);
  v6 = objc_msgSend((id)reportSimulatedCrashWithFormatSignature__diagnosticReporter, "snapshotWithSignature:duration:event:payload:reply:", v5, 0, 0, &__block_literal_global_15, 15.0);
  gs_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      reportSimulatedCrashWithFormatSignature_cold_1((uint64_t)v1, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
  {
    reportSimulatedCrashWithFormatSignature_cold_2((uint64_t)v1, v8);
  }

}

void __reportSimulatedCrashWithFormatSignature_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
  v1 = (void *)reportSimulatedCrashWithFormatSignature__diagnosticReporter;
  reportSimulatedCrashWithFormatSignature__diagnosticReporter = (uint64_t)v0;

}

void __reportSimulatedCrashWithFormatSignature_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  gs_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __reportSimulatedCrashWithFormatSignature_block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id GSAdditionCreationInfoValidate(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v15;
  void *v16;
  void *v17;

  v5 = a1;
  v6 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v6, "objectForKey:", CFSTR("kGSAdditionNameSpace"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v7, "validateGSName:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid NameSpace value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
LABEL_10:

      if (a3)
      {
        _GSErrorForStatus(105, v11, 0);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      v13 = 0;
      goto LABEL_13;
    }
LABEL_9:
    GSAdditionCreationInfoValidate_cold_2();
    goto LABEL_10;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("kGSAdditionOnDuplicate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid OnDuplicate value"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_26;
      goto LABEL_27;
    }
    if ((unint64_t)objc_msgSend(v8, "unsignedLongLongValue") >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid OnDuplicate value"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_26;
      goto LABEL_27;
    }
  }
  else
  {
    objc_msgSend(v6, "setObject:forKey:", &unk_1E97757A0, CFSTR("kGSAdditionOnDuplicate"));
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("kGSAdditionName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v7, "validateGSName:", 0) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid Name value"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "gs_stringByUpdatingPathExtensionWithPathOrURL:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKey:", v17, CFSTR("kGSAdditionName"));
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("kGSAdditionOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_msgSend(v8, "unsignedLongLongValue") & 0xFFFFFFFFFFFFFFE1) != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid options"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
LABEL_26:
        GSAdditionCreationInfoValidate_cold_1();
LABEL_27:

      if (a3)
      {
        _GSErrorForStatus(110, v9, 0);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      v13 = 0;
      v7 = v8;
      goto LABEL_13;
    }
  }
  else
  {
    objc_msgSend(v6, "setObject:forKey:", &unk_1E97757B8, CFSTR("kGSAdditionOptions"));
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("kGSAdditionConflictResolved"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("kGSAdditionConflictResolved"));
  v13 = v6;
LABEL_13:

  return v13;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

id GSDaemonInterface()
{
  if (GSDaemonInterface_init != -1)
    dispatch_once(&GSDaemonInterface_init, &__block_literal_global_0);
  return (id)sGSDaemonInterface;
}

id GSDaemonProxy(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  if (_GSDaemonInitialize_once != -1)
    dispatch_once(&_GSDaemonInitialize_once, &__block_literal_global_121);
  v2 = sDaemonTrackerQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __GSDaemonProxy_block_invoke;
  v6[3] = &unk_1E9771A30;
  v7 = v1;
  v8 = &v9;
  v3 = v1;
  dispatch_sync(v2, v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
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

void _SetupGSXPCConn()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v0 = (void *)MEMORY[0x1D825874C]();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.revisiond"), 4096);
  GSDaemonInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setRemoteObjectInterface:", v2);

  objc_initWeak(&location, v1);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___SetupGSXPCConn_block_invoke;
  v7[3] = &unk_1E9771AA0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v1, "setInterruptionHandler:", v7);
  objc_msgSend(v1, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = ___SetupGSXPCConn_block_invoke_2;
  v5[3] = &unk_1E9771AA0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v1, "setInvalidationHandler:", v5);
  objc_storeStrong((id *)&sDaemonConn, v1);
  objc_storeStrong((id *)&sDaemonProxy, v4);
  objc_msgSend(v1, "resume");
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v0);
}

void sub_1D4153410(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void GSDaemonConnectionClose()
{
  if (_GSDaemonInitialize_once != -1)
    dispatch_once(&_GSDaemonInitialize_once, &__block_literal_global_121);
  dispatch_sync((dispatch_queue_t)sDaemonTrackerQueue, &__block_literal_global_79);
}

void sub_1D4153604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id mountpoint_url(const char *a1, _QWORD *a2)
{
  void *v4;
  statfs v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(&v5, 0, 512);
  if (statfs(a1, &v5))
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v5.f_mntonname, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

id real_url(const char *a1, _QWORD *a2)
{
  void *v4;
  _QWORD v5[3];
  _OWORD v6[65];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, 512);
  v5[1] = 0;
  v5[2] = 0;
  v5[0] = 0x800000800000005;
  if (getattrlist(a1, v5, v6, 0x410uLL, 0))
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", (char *)v6 + SDWORD2(v6[0]) + 8, DWORD1(v6[0]) == 2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

uint64_t GSTrackDocument(int a1)
{
  NSObject *v3;

  if ((GSFchflags(a1, 0, 0x40u) & 0x80000000) == 0)
    return GSGetDocumentID(a1, 0);
  gs_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, (os_log_type_t)0x90u))
    GSTrackDocument_cold_1();

  return 0;
}

uint64_t GSFchflags(int a1, int a2, gid_t a3)
{
  NSObject *v5;
  unsigned int v6;
  int v9;
  __uint32_t st_flags;
  __uint32_t v11;
  char v12;
  char v13;
  NSObject *v14;
  int v15;
  int *v16;
  char *v17;
  _DWORD v18[2];
  __uint32_t v19;
  stat v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((a3 & a2) != 0)
  {
    *__error() = 22;
    gs_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      GSFchflags_cold_3();
LABEL_7:

    return 0xFFFFFFFFLL;
  }
  v6 = (a3 | a2) & 0xFFFF0000;
  if (v6)
  {
    *__error() = 1;
    gs_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v15 = *__error();
      v16 = __error();
      v17 = strerror(*v16);
      v20.st_dev = 136316418;
      *(_QWORD *)&v20.st_mode = "GSFchflags";
      WORD2(v20.st_ino) = 1024;
      *(_DWORD *)((char *)&v20.st_ino + 6) = a2;
      HIWORD(v20.st_uid) = 1024;
      v20.st_gid = a3;
      LOWORD(v20.st_rdev) = 1024;
      *(dev_t *)((char *)&v20.st_rdev + 2) = v6;
      *((_WORD *)&v20.st_rdev + 3) = 1024;
      LODWORD(v20.st_atimespec.tv_sec) = v15;
      WORD2(v20.st_atimespec.tv_sec) = 2080;
      *(__darwin_time_t *)((char *)&v20.st_atimespec.tv_sec + 6) = (__darwin_time_t)v17;
      _os_log_error_impl(&dword_1D414C000, v5, (os_log_type_t)0x90u, "[ERROR] %s: non-modifyable flags -%x/+%x (%x); error %d (%s)",
        (uint8_t *)&v20,
        0x2Eu);
    }
    goto LABEL_7;
  }
  memset(&v20, 0, sizeof(v20));
  if (fstat(a1, &v20) < 0)
  {
    gs_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      GSFchflags_cold_1();

    return 0xFFFFFFFFLL;
  }
  v9 = (a2 << 25) & 0x40000000 | a2;
  st_flags = v20.st_flags;
  v11 = v20.st_flags & ~v9 | a3;
  if (v11 != v20.st_flags)
  {
    v12 = 1;
    while (1)
    {
      v13 = v12;
      v18[0] = st_flags;
      v18[1] = v11;
      v19 = 0;
      if (ffsctl(a1, 0xC00C4114uLL, v18, 0) < 0)
        break;
      st_flags = v19;
      if (v19 != v18[0])
      {
        v12 = 0;
        v11 = v19 & ~v9 | a3;
        if ((v13 & 1) != 0)
          continue;
      }
      return 0;
    }
    gs_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      GSFchflags_cold_2();
    goto LABEL_7;
  }
  return 0;
}

uint64_t _RemoveTree(char *a1, uint64_t a2, _QWORD *a3)
{
  return _RemoveTreeInternal(a1, a2, 0, a3);
}

uint64_t _RemoveTreeInternal(char *a1, uint64_t a2, char a3, _QWORD *a4)
{
  FTS *v7;
  FTS *v8;
  FTSENT *v9;
  FTSENT *v10;
  std::error_code *v11;
  const char *fts_path;
  stat *fts_statp;
  mode_t *p_st_mode;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  int v21;
  NSObject *v22;
  int fts_errno;
  stat v28;
  char *v29[4];

  v29[2] = *(char **)MEMORY[0x1E0C80C00];
  v29[0] = a1;
  v29[1] = 0;
  v7 = fts_open(v29, 84, 0);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fts_open(\"%s\") failed"), a1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *__error();
    gs_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    if (a4)
    {
      _GSErrorForErrno(v18, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0;
  }
  v8 = v7;
  v9 = fts_read(v7);
  if (!v9)
  {
LABEL_21:
    v16 = 1;
    goto LABEL_40;
  }
  v10 = v9;
  while (2)
  {
    switch(v10->fts_info)
    {
      case 1u:
        fts_path = v10->fts_path;
        fts_statp = v10->fts_statp;
        if (GSLchflags(fts_path, 6, 0))
          goto LABEL_31;
        memset(&v28, 0, sizeof(v28));
        if (fts_statp)
        {
          p_st_mode = &fts_statp->st_mode;
        }
        else
        {
          v15 = lstat(fts_path, &v28);
          p_st_mode = &v28.st_mode;
          if (v15)
            goto LABEL_31;
        }
        if (!lchmod(fts_path, *p_st_mode | 0x90))
          goto LABEL_20;
LABEL_31:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to make \"%s\" deletable"), v10->fts_path);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *__error();
        gs_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          goto LABEL_37;
        goto LABEL_36;
      case 3u:
      case 8u:
      case 0xCu:
      case 0xDu:
        if (GSLchflags(v10->fts_path, 6, 0))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to make \"%s\" deletable"), v10->fts_path);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *__error();
          gs_default_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            goto LABEL_36;
          goto LABEL_37;
        }
        v11 = (std::error_code *)v10->fts_statp;
        if (!v11)
          _RemoveTreeInternal_cold_2();
        if (_Remove((std::__fs::filesystem::path *)v10->fts_path, v11))
        {
LABEL_20:
          v10 = fts_read(v8);
          if (!v10)
            goto LABEL_21;
          continue;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to remove \"%s\""), v10->fts_path);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *__error();
        gs_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
LABEL_36:
          _RemoveTreeInternal_cold_1();
LABEL_37:

        if (a4)
        {
          _GSErrorForErrno(v21, v20);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        v16 = 0;
LABEL_40:
        fts_close(v8);
        return v16;
      case 4u:
      case 6u:
        if (!v10->fts_level && (a3 & 1) != 0
          || _Remove((std::__fs::filesystem::path *)v10->fts_path, (std::error_code *)v10->fts_statp))
        {
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to remove \"%s\""), v10->fts_path);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *__error();
        gs_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          goto LABEL_36;
        goto LABEL_37;
      case 7u:
      case 0xAu:
        if (*__error() == 2)
          goto LABEL_20;
        fts_errno = v10->fts_errno;
        *__error() = fts_errno;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fts_read() failed for path '%s'\n"), v10->fts_path);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *__error();
        gs_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          goto LABEL_36;
        goto LABEL_37;
      default:
        goto LABEL_20;
    }
  }
}

uint64_t _RemoveSubTrees(char *a1, uint64_t a2, _QWORD *a3)
{
  return _RemoveTreeInternal(a1, a2, 1, a3);
}

BOOL _SetBirthTimeSpecForFD(int a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[0] = a2;
  v6[1] = a3;
  v4 = xmmword_1D4167788;
  v5 = 0;
  return fsetattrlist(a1, &v4, v6, 0x10uLL, 0) >= 0;
}

uint64_t _GSOpenByID()
{
  return openbyid_np();
}

id _GSPathResolveByID(int32_t a1, uint64_t a2, _QWORD *a3)
{
  char *v6;
  char *v7;
  void *v8;
  NSObject *v9;

  v6 = (char *)malloc_type_malloc(0x2000uLL, 0x5048A9D1uLL);
  if (v6)
  {
    v7 = v6;
    if (_PathResolve(v6, 0x2000uLL, a1, a2) < 0)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
        v8 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "gs_stringWithFileSystemRepresentation:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    free(v7);
  }
  else
  {
    gs_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      _GSPathResolveByID_cold_1();

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

ssize_t _PathResolve(char *a1, size_t a2, int32_t a3, uint64_t a4)
{
  int v7;
  ssize_t v8;
  NSObject *v10;
  fsid_t v11;

  v11.val[0] = a3;
  v11.val[1] = 0;
  v7 = 5;
  while (1)
  {
    v8 = fsgetpath(a1, a2, &v11, a4);
    if ((v8 & 0x8000000000000000) == 0)
      return v8 - 1;
    if (*__error() != 35)
      break;
    if (!--v7)
      return -1;
  }
  gs_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    _PathResolve_cold_1();

  return -1;
}

uint64_t _PathRename(std::__fs::filesystem::path *a1, std::__fs::filesystem::path *a2, _QWORD *a3)
{
  uint64_t result;
  std::error_code *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  stat v16;

  memset(&v16, 0, sizeof(v16));
  if (lstat((const char *)a1, &v16) < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to lstat \"%s\""), a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *__error();
    gs_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    if (a3)
    {
      _GSErrorForErrno(v10, v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0;
  }
  v15 = 0;
  result = _PathUnProtect((char *)a1, (uint64_t)&v16, (uint64_t)&v15, a3);
  if (!(_DWORD)result)
    return result;
  rename(a1, a2, v7);
  if (!v8)
    goto LABEL_7;
  if (*__error() == 18)
  {
    if ((copyfile((const char *)a1, (const char *)a2, 0, 0x10E000Fu) & 0x80000000) == 0)
    {
      _TransferBirthTime((const char *)a1, (const char *)a2);
      _RemoveTreeInternal((char *)a1, 0, 0, 0);
LABEL_7:
      _PathReProtect((char *)a2, (unsigned __int16 *)&v15);
      return 1;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("copyfile(%s, %s) failed"), a1, a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *__error();
    gs_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rename(%s, %s) failed"), a1, a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *__error();
  gs_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
LABEL_16:
    _RemoveTreeInternal_cold_1();
LABEL_17:

  if (a3)
  {
    _GSErrorForErrno(v13, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  _PathReProtect((char *)a1, (unsigned __int16 *)&v15);
  return 0;
}

uint64_t _PathUnProtect(char *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  int v8;
  int v9;
  __int16 v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v16;
  int v17;
  NSObject *v18;

  v8 = *(unsigned __int16 *)(a2 + 4);
  v9 = *(_DWORD *)(a2 + 116);
  if (v8 == (v8 | 0x92))
  {
    v10 = 0;
    v11 = *(_DWORD *)(a2 + 116);
  }
  else
  {
    if (chmod(a1, v8 | 0x92))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed make \"%s\" writable"), a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *__error();
      gs_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        _RemoveTreeInternal_cold_1();

      if (a4)
      {
        _GSErrorForErrno(v13, v12);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0;
    }
    v10 = *(_WORD *)(a2 + 4);
    v11 = *(_DWORD *)(a2 + 116);
  }
  *(_WORD *)a3 = v10;
  if (v11 == (v9 & 0xFFFFFFF9))
  {
    *(_DWORD *)(a3 + 4) = 0;
    return 1;
  }
  if ((GSChflags(a1, 6, 0) & 0x80000000) == 0)
  {
    *(_DWORD *)(a3 + 4) = *(_DWORD *)(a2 + 116);
    return 1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to make \"%s\" writable"), a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *__error();
  gs_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    _RemoveTreeInternal_cold_1();

  if (a4)
  {
    _GSErrorForErrno(v17, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (*(_WORD *)a3)
    chmod(a1, *(_WORD *)a3);
  return 0;
}

void _PathReProtect(char *a1, unsigned __int16 *a2)
{
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;

  v4 = *a2;
  if (v4 && chmod(a1, v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed restore \"%s\" permissions"), a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __error();
    gs_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

  }
  if (*((_DWORD *)a2 + 1) && GSChflags(a1, 0, (unsigned __int16)*((_DWORD *)a2 + 1)) && *__error() != 45)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed restore \"%s\" flags"), a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __error();
    gs_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

  }
}

void _TransferBirthTime(const char *a1, const char *a2)
{
  NSObject *v3;
  _QWORD v4[2];
  int v5;
  __int128 v6;
  uint64_t v7;

  v7 = 0;
  v6 = xmmword_1D4167788;
  v4[0] = 0;
  v4[1] = 0;
  v5 = 0;
  if (getattrlist(a1, &v6, v4, 0x14uLL, 1u))
  {
    gs_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      _TransferBirthTime_cold_2();
  }
  else
  {
    if (!setattrlist(a2, &v6, (char *)v4 + 4, 0x10uLL, 1u))
      return;
    gs_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      _TransferBirthTime_cold_1();
  }

}

id GSMutableInfoDictionary(const char *a1, _QWORD *a2)
{
  ssize_t v4;
  size_t v5;
  void *v6;
  void *v7;
  ssize_t v8;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v20;
  NSObject *v21;

  v4 = getxattr(a1, "com.apple.genstore.info", 0, 0, 0, 0);
  if (v4 == -1)
  {
    if (*__error() == 93)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      return v12;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("getxattr failed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *__error();
    gs_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      goto LABEL_21;
LABEL_20:
    _RemoveTreeInternal_cold_1();
LABEL_21:

    if (a2)
    {
      _GSErrorForErrno(v14, v13);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_26;
  }
  v5 = v4;
  v6 = malloc_type_malloc(v4, 0x72217624uLL);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("malloc failed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *__error();
    gs_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      goto LABEL_21;
    goto LABEL_20;
  }
  v7 = v6;
  v8 = getxattr(a1, "com.apple.genstore.info", v6, v5, 0, 0);
  if (v8 == -1 || v8 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attribute %s at path \"%s\" should have size: %ld; actual %ld\n"),
      "com.apple.genstore.info",
      a1,
      v5,
      v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      GSMutableInfoDictionary_cold_4();

    if (a2)
    {
      _GSErrorForStatus(101, v10, 0);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }

    free(v7);
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, v5, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v13, 1, 0, a2);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    gs_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      GSMutableInfoDictionary_cold_3((uint64_t)a1, v18);

LABEL_26:
LABEL_27:
    v12 = 0;
    return v12;
  }
  v17 = (void *)v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("result isn't a CFDictionary"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      GSMutableInfoDictionary_cold_4();

    if (a2)
    {
      _GSErrorForStatus(101, v20, 0);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_27;
  }
  v12 = v17;

  return v12;
}

uint64_t GSSetInfoDictionary(char *a1, id a2, _QWORD *a3)
{
  id v5;
  const void *v6;
  size_t v7;

  v5 = objc_retainAutorelease(a2);
  v6 = (const void *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  return _PathSetEA(a1, "com.apple.genstore.info", v6, v7, a3);
}

uint64_t _PathSetEA(char *a1, const char *a2, const void *a3, size_t a4, _QWORD *a5)
{
  uid_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  stat v19;
  uint64_t v20;

  v10 = geteuid();
  v20 = 0;
  if (v10)
  {
    memset(&v19, 0, sizeof(v19));
    if (lstat(a1, &v19))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lstat(%s) failed"), a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *__error();
      gs_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        _RemoveTreeInternal_cold_1();

      if (a5)
      {
        _GSErrorForErrno(v12, v11);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0;
    }
    if (!_PathUnProtect(a1, (uint64_t)&v19, (uint64_t)&v20, a5))
      return 0;
  }
  if (a3 && a4)
  {
    v14 = 1;
    if (setxattr(a1, a2, a3, a4, 0, 1))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setxattr(%s) failed"), a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *__error();
      gs_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        goto LABEL_18;
      goto LABEL_19;
    }
  }
  else
  {
    v14 = 1;
    if (removexattr(a1, a2, 1) && *__error() != 93)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("removexattr(%s) failed"), a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *__error();
      gs_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
LABEL_18:
        _RemoveTreeInternal_cold_1();
LABEL_19:

      if (a5)
      {
        _GSErrorForErrno(v16, v15);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      v14 = 0;
    }
  }
  if (v10)
    _PathReProtect(a1, (unsigned __int16 *)&v20);
  return v14;
}

uint64_t GSMergeInfoValueDictionary(char *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  GSMutableInfoDictionary(a1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __GSMergeInfoValueDictionary_block_invoke;
    v12[3] = &unk_1E9771AF0;
    v8 = v6;
    v13 = v8;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v10 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = GSSetInfoDictionary(a1, v9, a3);

    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

id GSGetOriginalPOSIXName(char *path, _QWORD *a2)
{
  return _GSGetNameXattr("com.apple.genstore.origposixname", path, a2);
}

id _GSGetNameXattr(char *name, char *path, _QWORD *a3)
{
  ssize_t v6;
  ssize_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  _BYTE value[766];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = getxattr(path, name, value, 0x2FEuLL, 0, 0);
  if (v6 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get %s xattr"), name);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *__error();
    gs_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
LABEL_12:
    _RemoveTreeInternal_cold_1();
LABEL_13:

    if (a3)
    {
      _GSErrorForErrno(v11, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  v7 = v6;
  if (v6 >= 766)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s xattr too large (%ld) at path \"%s\""), name, v6, path);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      GSMutableInfoDictionary_cold_4();

    if (a3)
    {
      _GSErrorForStatus(101, v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      v13 = 0;
      *a3 = v10;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s xattr too short (0) at path \"%s\""), name, path);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *__error();
    gs_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
    goto LABEL_12;
  }
  value[v6] = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFileSystemRepresentation:length:", value, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v13;
}

id GSGetOriginalDisplayName(char *path, _QWORD *a2)
{
  return _GSGetNameXattr("com.apple.genstore.origdisplayname", path, a2);
}

uint64_t GSSetOriginalPOSIXName(char *a1, id a2, _QWORD *a3)
{
  const char *v5;
  const char *v6;
  size_t v7;

  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a2), "fileSystemRepresentation");
  v6 = v5;
  if (v5)
    v7 = strlen(v5);
  else
    v7 = 0;
  return _PathSetEA(a1, "com.apple.genstore.origposixname", v6, v7, a3);
}

uint64_t GSSetOriginalDisplayName(char *a1, id a2, _QWORD *a3)
{
  const char *v5;
  const char *v6;
  size_t v7;

  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a2), "fileSystemRepresentation");
  v6 = v5;
  if (v5)
    v7 = strlen(v5);
  else
    v7 = 0;
  return _PathSetEA(a1, "com.apple.genstore.origdisplayname", v6, v7, a3);
}

uint64_t GSSetGenerationOptions(char *a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];

  if ((a2 & 0xC) == 0)
    return _PathSetEA(a1, "com.apple.genstore.gen_options", 0, 0, a3);
  v6[1] = v3;
  v6[2] = v4;
  v6[0] = a2 & 0xC | 1;
  return _PathSetEA(a1, "com.apple.genstore.gen_options", v6, 8uLL, a3);
}

BOOL GSGetGenerationOptions(const char *a1)
{
  ssize_t v1;
  ssize_t v2;
  _BOOL8 result;
  uint64_t value;

  value = 0;
  v1 = getxattr(a1, "com.apple.genstore.gen_options", &value, 8uLL, 0, 1);
  if (v1 == -1)
    return *__error() == 93;
  v2 = v1;
  result = 0;
  if (v2 == 8)
    return value;
  return result;
}

uint64_t GSSetConflictResolved(char *a1, char a2, _QWORD *a3)
{
  char v4;

  v4 = a2;
  return _PathSetEA(a1, "com.apple.genstore.conflictResolved", &v4, 1uLL, a3);
}

BOOL GSGetConflictResolved(const char *a1)
{
  char value;

  return getxattr(a1, "com.apple.genstore.conflictResolved", &value, 1uLL, 0, 1) == 1 && value == 1;
}

uint64_t GSSupportsCloneAtPath(const char *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  dev_t st_dev;
  id v8;
  BOOL v9;
  _OWORD v11[2];
  int v12;
  __int128 v13;
  uint64_t v14;
  stat v15;
  statfs v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  memset(&v15, 0, sizeof(v15));
  if (stat(a1, &v15))
    return 0;
  v4 = 0;
  if (getxattr(a1, "com.apple.decmpfs", 0, 0, 0, 32) <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "gs_stringWithFileSystemRepresentation:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    st_dev = v15.st_dev;
    v8 = objc_retainAutorelease(v6);
    if (stat((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v15))
      v9 = 0;
    else
      v9 = st_dev == v15.st_dev;
    if (!v9 || (memset(&v16, 0, 512), statfs(a1, &v16) < 0))
    {
      v4 = 0;
    }
    else
    {
      v14 = 0;
      v13 = xmmword_1D4167770;
      v12 = 0;
      memset(v11, 0, sizeof(v11));
      if (getattrlist(v16.f_mntonname, &v13, v11, 0x24uLL, 0x21u) >= 0)
        v4 = HIWORD(DWORD2(v11[0])) & 1;
      else
        v4 = 0;
    }

  }
  return v4;
}

uint64_t GSComputeTreeSize(char *a1, _QWORD *a2)
{
  FTS *v4;
  FTS *v5;
  FTSENT *v6;
  FTSENT *v7;
  uint64_t v8;
  int fts_info;
  void *v11;
  int v12;
  NSObject *v13;
  int fts_errno;
  void *v15;
  int v16;
  NSObject *v17;
  char *v20[3];

  v20[2] = *(char **)MEMORY[0x1E0C80C00];
  v20[0] = a1;
  v20[1] = 0;
  v4 = fts_open(v20, 84, 0);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fts_open(%s) failed"), a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *__error();
    gs_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    if (a2)
    {
      _GSErrorForErrno(v12, v11);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0;
  }
  v5 = v4;
  v6 = fts_read(v4);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_26;
  }
  v7 = v6;
  v8 = 0;
  while (1)
  {
    fts_info = v7->fts_info;
    if (fts_info == 8)
    {
      if (strncmp(v7->fts_name, "._", 2uLL))
        v8 += v7->fts_statp->st_size;
      goto LABEL_13;
    }
    if (fts_info == 7 || fts_info == 10)
      break;
LABEL_13:
    v7 = fts_read(v5);
    if (!v7)
      goto LABEL_26;
  }
  fts_errno = v7->fts_errno;
  *__error() = fts_errno;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fts_read(%s) failed"), v7->fts_path);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *__error();
  gs_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    _RemoveTreeInternal_cold_1();

  if (a2)
  {
    _GSErrorForErrno(v16, v15);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  v8 = -1;
LABEL_26:
  fts_close(v5);
  return v8;
}

uint64_t GSStageTree(std::__fs::filesystem::path *a1, std::__fs::filesystem::path *a2, int a3, uint64_t a4, _QWORD *a5)
{
  void *v8;
  int v9;
  NSObject *v10;
  _CopyfileCallbackCtx *v11;
  _CopyfileCallbackCtx *v12;
  uint64_t v13;
  std::error_code *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v20;
  stat v21;

  if (a3)
  {
    memset(&v21, 0, sizeof(v21));
    v20 = 0;
    if (lstat((const char *)a1, &v21))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lstat(%s) failed"), a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *__error();
      gs_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        _RemoveTreeInternal_cold_1();

      if (a5)
      {
        _GSErrorForErrno(v9, v8);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else if (_PathUnProtect((char *)a1, (uint64_t)&v21, (uint64_t)&v20, a5))
    {
      rename(a1, a2, v14);
      if (!v15)
      {
        _PathReProtect((char *)a2, (unsigned __int16 *)&v20);
        return GSArchiveTree((char *)a2, 0, 0, a5);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rename(%s, %s) failed"), a1, a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *__error();
      gs_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        _RemoveTreeInternal_cold_1();

      if (a5)
      {
        _GSErrorForErrno(v17, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      _PathReProtect((char *)a1, (unsigned __int16 *)&v20);
    }
    return 0;
  }
  else
  {
    v11 = -[_CopyfileCallbackCtx initWithPath:error:]([_CopyfileCallbackCtx alloc], "initWithPath:error:", a1, a5);
    v12 = v11;
    if (v11)
    {
      -[_CopyfileCallbackCtx setDoArchive:](v11, "setDoArchive:", 1);
      v13 = _do_copyfile((const char *)a1, (char *)a2, 17563663, v12, a5);
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

uint64_t GSArchiveTree(char *a1, int a2, _QWORD *a3, _QWORD *a4)
{
  FTS *v8;
  FTS *v9;
  _CopyfileCallbackCtx *v10;
  FTSENT *v11;
  FTSENT *v12;
  unsigned int fts_info;
  uint64_t fts_statp;
  _ftsent *fts_parent;
  stat *v17;
  uint64_t fts_pathlen;
  uint64_t v19;
  int v20;
  _CopyfileCallbackCtx *v21;
  std::error_code *v22;
  int v23;
  uint64_t v24;
  void *v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  int fts_errno;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  _CopyfileCallbackCtx *v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  int v42;
  NSObject *v43;
  _CopyfileCallbackCtx *v44;
  _QWORD *v45;
  stat v46;
  uint64_t v47;
  char *v48[2];
  std::__fs::filesystem::path __str;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v48[0] = a1;
  v48[1] = 0;
  v8 = fts_open(v48, 84, 0);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fts_open(\"%s\") failed"), a1);
    v10 = (_CopyfileCallbackCtx *)objc_claimAutoreleasedReturnValue();
    v26 = *__error();
    gs_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    if (a4)
    {
      _GSErrorForErrno(v26, v10);
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
LABEL_40:
    v28 = 0;
    goto LABEL_63;
  }
  v9 = v8;
  v10 = -[_CopyfileCallbackCtx initWithPath:error:]([_CopyfileCallbackCtx alloc], "initWithPath:error:", a1, a4);
  if (!v10)
    goto LABEL_40;
  v11 = fts_read(v9);
  if (v11)
  {
    v12 = v11;
    do
    {
      fts_info = v12->fts_info;
      if (fts_info > 0xD)
        goto LABEL_13;
      fts_statp = (uint64_t)v12->fts_statp;
      if (((1 << fts_info) & 0x3048) == 0)
      {
        if (fts_info != 8)
        {
          if (((1 << fts_info) & 0x490) != 0)
            goto LABEL_41;
          goto LABEL_13;
        }
        if (!strncmp(v12->fts_name, "._", 2uLL))
          goto LABEL_13;
        v45 = a3;
        if ((*(_WORD *)(fts_statp + 4) & 0xF000) == 0x8000 && *(unsigned __int16 *)(fts_statp + 6) >= 2u)
        {
          v44 = v10;
          fts_parent = v12->fts_parent;
          v47 = 0;
          memset(&v46, 0, sizeof(v46));
          v17 = fts_parent->fts_statp;
          fts_pathlen = fts_parent->fts_pathlen;
          if (snprintf((char *)&__str, 0x400uLL, "%s_XXXXXX", v12->fts_path) >= 0x400)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("temporary path \"%s_XXXXXX\" too long"), v12->fts_path);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            gs_default_log();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              GSArchiveTree_cold_5((uint64_t)v33, v34, v35);

            v36 = v44;
            if (a4)
            {
              _GSErrorForStatus(104, v33, 0);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_50;
            }
LABEL_51:

            v21 = v36;
            goto LABEL_58;
          }
          if (!v12->fts_level)
          {
            v19 = v12->fts_pathlen;
            while (v19 >= 2)
            {
              if (v12->fts_path[--v19] == 47)
                goto LABEL_29;
            }
            LOWORD(v19) = 0;
LABEL_29:
            fts_pathlen = (unsigned __int16)v19;
            __str.__pn_.__r_.__value_.__s.__data_[(unsigned __int16)v19] = 0;
            if (stat((const char *)&__str, &v46))
            {
              v21 = v44;
              if (!a4 || *a4)
                goto LABEL_58;
              v36 = v44;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stat(%s) failed"), &__str);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = *__error();
              gs_default_log();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                _RemoveTreeInternal_cold_1();

              _GSErrorForErrno(v42, v33);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_50:
              *a4 = v37;
              goto LABEL_51;
            }
            __str.__pn_.__r_.__value_.__s.__data_[fts_pathlen] = 47;
            v17 = &v46;
          }
          __str.__pn_.__r_.__value_.__s.__data_[fts_pathlen] = 0;
          v20 = _PathUnProtect((char *)&__str, (uint64_t)v17, (uint64_t)&v47, a4);
          v21 = v44;
          if (!v20)
            goto LABEL_58;
          __str.__pn_.__r_.__value_.__s.__data_[fts_pathlen] = 47;
          if (!_do_copyfile(v12->fts_path, &__str, 16777231))
            goto LABEL_57;
          rename(&__str, (const std::__fs::filesystem::path *)v12->fts_path, v22);
          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rename(%s, %s) failed"), &__str, v12->fts_path);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = *__error();
            gs_default_log();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              _RemoveTreeInternal_cold_1();

            if (a4)
            {
              _GSErrorForErrno(v39, v38);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }

LABEL_57:
            unlink((const char *)&__str);
            __str.__pn_.__r_.__value_.__s.__data_[fts_pathlen] = 0;
            _PathReProtect((char *)&__str, (unsigned __int16 *)&v47);
            v21 = v44;
LABEL_58:

            a3 = v45;
            break;
          }
          __str.__pn_.__r_.__value_.__s.__data_[fts_pathlen] = 0;
          _PathReProtect((char *)&__str, (unsigned __int16 *)&v47);

        }
        -[_CopyfileCallbackCtx setGenerationSize:](v10, "setGenerationSize:", *(_QWORD *)(fts_statp + 96) + -[_CopyfileCallbackCtx generationSize](v10, "generationSize"));
        v24 = -[_CopyfileCallbackCtx generationSize](v10, "generationSize");
        -[_CopyfileCallbackCtx progress](v10, "progress");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setCompletedUnitCount:", v24);

        a3 = v45;
      }
      if (!_ArchiveItem(v12->fts_path, fts_statp, a2, a4))
        break;
      if (fts_info <= 0xA && ((1 << fts_info) & 0x490) != 0)
      {
LABEL_41:
        fts_errno = v12->fts_errno;
        *__error() = fts_errno;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fts_read() failed for path '%s'\n"), v12->fts_path);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *__error();
        gs_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          _RemoveTreeInternal_cold_1();

        if (a4)
        {
          _GSErrorForErrno(v31, v30);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        v28 = 0;
        goto LABEL_62;
      }
LABEL_13:
      v12 = fts_read(v9);
    }
    while (v12);
  }
  if (a3)
    *a3 = -[_CopyfileCallbackCtx generationSize](v10, "generationSize");
  v28 = 1;
LABEL_62:
  fts_close(v9);
LABEL_63:

  return v28;
}

uint64_t _do_copyfile(const char *a1, char *a2, int a3, void *a4, _QWORD *a5)
{
  _QWORD *v9;
  int v10;
  uint64_t v11;
  int v12;
  copyfile_flags_t v13;
  _copyfile_state *v14;
  int v15;
  const char *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  FTS *v22;
  FTS *v23;
  FTSENT *v24;
  FTSENT *v25;
  unsigned int fts_info;
  int fts_errno;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  int v33;
  NSObject *v34;
  char *v35[3];

  v35[2] = *(char **)MEMORY[0x1E0C80C00];
  v9 = a4;
  objc_msgSend(v9, "doUnarchive");
  v10 = GSSupportsCloneAtPath(a1, (uint64_t)a2);
  if (!v10)
  {
    v12 = a3 & 0x100000 | 0x8000;
    if (v12 == 1081344)
      v13 = a3 & 0xFEEF7FFF | 0x8000;
    else
      v13 = a3 & 0xFEFF7FFF | 0x8000;
    v14 = copyfile_state_alloc();
    copyfile_state_set(v14, 6u, _CopyfileCallback);
    copyfile_state_set(v14, 7u, v9);
    v15 = copyfile(a1, a2, v14, v13);
    v11 = v15 == 0;
    copyfile_state_free(v14);
    if (v12 == 1081344 && !v15)
    {
      v11 = 1;
      removefile(a1, 0, 1u);
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  if (clonefile(a1, a2, 1u))
    goto LABEL_3;
  if ((a3 & 0x100000) != 0)
    removefile(a1, 0, 1u);
  if (objc_msgSend(v9, "doArchive"))
  {
    v11 = GSArchiveTree(a2, 0, v9 + 3, a5);
LABEL_15:
    if (!a5)
      goto LABEL_22;
    goto LABEL_16;
  }
  if (!objc_msgSend(v9, "doUnarchive"))
  {
    v11 = 1;
    goto LABEL_22;
  }
  v35[0] = a2;
  v35[1] = 0;
  v22 = fts_open(v35, 84, 0);
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fts_open(\"%s\") failed"), a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *__error();
    gs_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    if (a5)
    {
      _GSErrorForErrno(v33, v32);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_3:
    v11 = 0;
    if (!a5)
      goto LABEL_22;
    goto LABEL_16;
  }
  v23 = v22;
  v24 = fts_read(v22);
  v11 = 1;
  if (!v24)
    goto LABEL_50;
  v25 = v24;
  while (1)
  {
    fts_info = v25->fts_info;
    if (fts_info > 0xD)
      goto LABEL_35;
    if (((1 << fts_info) & 0x3148) != 0)
      break;
    if (((1 << fts_info) & 0x490) != 0)
      goto LABEL_38;
LABEL_35:
    v25 = fts_read(v23);
    if (!v25)
    {
LABEL_49:
      v11 = 1;
      goto LABEL_50;
    }
  }
  if (!_UnarchiveItem(v25->fts_path, v25->fts_statp, a5))
    goto LABEL_49;
  if (fts_info > 0xA || ((1 << fts_info) & 0x490) == 0)
    goto LABEL_35;
LABEL_38:
  fts_errno = v25->fts_errno;
  *__error() = fts_errno;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fts_read() failed for path '%s'\n"), v25->fts_path);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *__error();
  gs_default_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    _RemoveTreeInternal_cold_1();

  if (a5)
  {
    _GSErrorForErrno(v30, v29);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v11 = 0;
LABEL_50:
  fts_close(v23);
  if (a5)
  {
LABEL_16:
    if ((v11 & 1) == 0)
    {
      v16 = "copyfile";
      if (v10)
        v16 = "clonefile";
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s(%s, %s) failed"), v16, a1, a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *__error();
      gs_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        _RemoveTreeInternal_cold_1();

      _GSErrorForErrno(v18, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      *a5 = v20;
    }
  }
LABEL_22:

  return v11;
}

uint64_t GSCopyOutGeneration(const char *a1, char *a2, _QWORD *a3)
{
  _CopyfileCallbackCtx *v6;
  _CopyfileCallbackCtx *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v14;

  v6 = -[_CopyfileCallbackCtx initWithPath:error:]([_CopyfileCallbackCtx alloc], "initWithPath:error:", a1, a3);
  v7 = v6;
  if (v6)
  {
    -[_CopyfileCallbackCtx setDoUnarchive:](v6, "setDoUnarchive:", 1);
    v14 = 0;
    v8 = _do_copyfile(a1, a2, 17694735, v7, &v14);
    v9 = v14;
    v10 = v9;
    if ((v8 & 1) == 0 && objc_msgSend(v9, "code") == 17)
    {
      objc_msgSend(v10, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

      if (v12)
        _RemoveTreeInternal(a2, 0, 0, 0);
    }
    if (a3)
      *a3 = objc_retainAutorelease(v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t _ArchiveItem(char *a1, uint64_t a2, int a3, _QWORD *a4)
{
  __int16 v4;
  uint64_t v5;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  __int16 v16;
  __int16 v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  int v24;
  unsigned int v25;
  char value;

  v4 = *(_WORD *)(a2 + 4);
  if ((v4 & 0xF000) == 0xA000)
    return 1;
  v10 = *(_DWORD *)(a2 + 116);
  if ((v10 & 0x46) != 0)
  {
    if (chflags(a1, v10 & 0xFFFFFFB9))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to make path \"%s\" writable"), a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *__error();
      gs_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
      goto LABEL_12;
    }
    v4 = *(_WORD *)(a2 + 4);
  }
  if ((v4 & 0x80) == 0)
  {
    if (chmod(a1, v4 | 0x80))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to make path \"%s\" writable"), a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *__error();
      gs_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
LABEL_11:
        _RemoveTreeInternal_cold_1();
LABEL_12:

      if (a4)
      {
        _GSErrorForErrno(v12, v11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0;
    }
    v4 = *(_WORD *)(a2 + 4);
  }
  if ((v4 & 0xF000) == 0x4000)
    v14 = open(a1, 256);
  else
    v14 = open(a1, 258);
  v15 = v14;
  if ((v14 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)(a2 + 116) & 0x20) != 0 && (GSFchflags(v14, 102, 0) & 0x80000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed make path \"%s\" uncompressed"), a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *__error();
      gs_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        _RemoveTreeInternal_cold_1();
      goto LABEL_45;
    }
    if ((fgetxattr(v15, "com.apple.genstore.orig_perms_v1", 0, 0, 0, 32) & 0x8000000000000000) == 0)
      goto LABEL_23;
    v24 = (*(unsigned __int8 *)(a2 + 4) >> 1) & 8 | (*(unsigned __int8 *)(a2 + 4) >> 5) & 4 | (16
                                                                                             * ((*(unsigned __int8 *)(a2 + 4) >> 1) & 1));
    value = (*(_BYTE *)(a2 + 4) >> 1) & 8 | (*(_BYTE *)(a2 + 4) >> 5) & 4 | (16 * ((*(_BYTE *)(a2 + 4) & 2) != 0));
    v25 = *(_DWORD *)(a2 + 116);
    if ((v25 & 6) != 0)
      value = (v25 >> 1) & 3 | v24;
    if (fsetxattr(v15, "com.apple.genstore.orig_perms_v1", &value, 1uLL, 0, 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to save original permissions for \"%s\""), a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *__error();
      gs_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        goto LABEL_45;
    }
    else
    {
LABEL_23:
      v16 = *(_WORD *)(a2 + 4);
      if ((v16 & 0xF000) == 0x4000)
        v17 = 365;
      else
        v17 = 292;
      if (!a3)
        v17 = 0;
      if (!fchmod(v15, (v16 | v17) & 0xFF6D))
      {
        v5 = 1;
LABEL_48:
        close(v15);
        return v5;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to set archived permissions for \"%s\""), a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *__error();
      gs_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
LABEL_45:

        if (a4)
        {
          _GSErrorForErrno(v19, v18);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        v5 = 0;
        goto LABEL_48;
      }
    }
    _RemoveTreeInternal_cold_1();
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to open generation item \"%s\""), a1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *__error();
  gs_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    _RemoveTreeInternal_cold_1();

  if (a4)
  {
    _GSErrorForErrno(v22, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v5 = 0;
  if (v15 != -1)
    goto LABEL_48;
  return v5;
}

uint64_t GSChflags(const char *a1, int a2, gid_t a3)
{
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  NSObject *v10;

  v5 = open(a1, 32772);
  if (v5 < 0)
  {
    gs_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      GSChflags_cold_1();

    return 0xFFFFFFFFLL;
  }
  else
  {
    v6 = v5;
    v7 = GSFchflags(v5, a2, a3);
    v8 = *__error();
    close(v6);
    *__error() = v8;
    return v7;
  }
}

uint64_t GSLchflags(const char *a1, int a2, gid_t a3)
{
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  NSObject *v10;

  v5 = open(a1, 2129924);
  if (v5 < 0)
  {
    gs_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      GSChflags_cold_1();

    return 0xFFFFFFFFLL;
  }
  else
  {
    v6 = v5;
    v7 = GSFchflags(v5, a2, a3);
    v8 = *__error();
    close(v6);
    *__error() = v8;
    return v7;
  }
}

BOOL _Remove(std::__fs::filesystem::path *__p, std::error_code *a2)
{
  if (_BeforePathRemove)
    _BeforePathRemove(__p);
  return !remove(__p, a2) || *__error() == 2;
}

uint64_t _CopyfileCallback(int a1, int a2, _copyfile_state *a3, char *a4, char *a5, void *a6)
{
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  stat v25;
  uint64_t dst;

  v11 = a6;
  dst = 0;
  objc_msgSend(v11, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isCancelled");

    if (v14)
    {
      *__error() = 89;
      v15 = 2;
      goto LABEL_26;
    }
    if (a1 == 4 && a2 == 4 && !copyfile_state_get(a3, 8u, &dst))
    {
      v16 = objc_msgSend(v11, "generationSize");
      v17 = dst + v16;
      objc_msgSend(v11, "progress");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCompletedUnitCount:", v17);

    }
  }
  v15 = 2;
  if (a1 && a2 != 3)
  {
    if (a1 == 1 && a2 == 1)
    {
      v19 = strrchr(a4, 47);
      if (v19)
        v20 = v19 + 1;
      else
        v20 = a4;
      v15 = strncmp(v20, "._", 2uLL) == 0;
      goto LABEL_26;
    }
    if (a2 != 2 || (a1 | 2) != 3)
    {
LABEL_25:
      v15 = 0;
      goto LABEL_26;
    }
    memset(&v25, 0, sizeof(v25));
    if (!lstat(a5, &v25)
      && (!objc_msgSend(v11, "doArchive") || _ArchiveItem(a5, (uint64_t)&v25, 0, 0))
      && (!objc_msgSend(v11, "doUnarchive") || _UnarchiveItem(a5, &v25, 0)))
    {
      _TransferBirthTime(a4, a5);
      if ((v25.st_mode & 0xF000) != 0x4000)
      {
        v21 = objc_msgSend(v11, "generationSize");
        objc_msgSend(v11, "setGenerationSize:", v25.st_size + v21);
        v22 = objc_msgSend(v11, "generationSize");
        objc_msgSend(v11, "progress");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCompletedUnitCount:", v22);

      }
      goto LABEL_25;
    }
  }
LABEL_26:

  return v15;
}

uint64_t _UnarchiveItem(char *a1, stat *a2, _QWORD *a3)
{
  stat *v4;
  mode_t st_mode;
  ssize_t v8;
  gid_t v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  mode_t v14;
  unsigned __int8 value;
  stat v16;

  v4 = a2;
  memset(&v16, 0, sizeof(v16));
  if (a2 || (v4 = &v16, !lstat(a1, &v16)))
  {
    st_mode = v4->st_mode;
    if ((st_mode & 0xF000) == 0xA000)
      return 1;
    value = 0;
    v8 = getxattr(a1, "com.apple.genstore.orig_perms_v1", &value, 1uLL, 0, 0);
    if (v8 == 1)
    {
      v9 = (2 * value) & 6;
      v10 = (2 * value) & 0x10 | (32 * value) & 0x92 | (value >> 3) & 2;
    }
    else
    {
      if (*__error() != 93)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to retrieve original perms from xattr on item \"%s\""), a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *__error();
        gs_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          goto LABEL_27;
        goto LABEL_28;
      }
      v9 = 0;
      v10 = 128;
    }
    if ((v4->st_flags & 2) != 0 && GSChflags(a1, 2, 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to temporarily unset UF_IMMUTABLE for \"%s\""), a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *__error();
      gs_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        goto LABEL_27;
    }
    else
    {
      v14 = v4->st_mode;
      if ((v14 & 0x80) == 0)
      {
        if (chmod(a1, v14 | 0x80))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to temporarily make \"%s\" writable"), a1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *__error();
          gs_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            goto LABEL_27;
          goto LABEL_28;
        }
        v14 = v4->st_mode;
      }
      if ((v14 & 0xF000) == 0x4000)
        removexattr(a1, "com.apple.genstore.orig_mtime", 0);
      removexattr(a1, "com.apple.genstore.origdisplayname", 0);
      removexattr(a1, "com.apple.genstore.info", 0);
      removexattr(a1, "com.apple.genstore.gen_options", 0);
      if (v8 == 1)
        removexattr(a1, "com.apple.genstore.orig_perms_v1", 0);
      if (!chmod(a1, st_mode & 0xFFF | v10))
      {
        if (!GSChflags(a1, 2, v9) || *__error() == 45)
          return 1;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("chflags(%s) failed"), a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *__error();
        gs_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          goto LABEL_28;
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("chmod(%s, %04o) failed"), a1, st_mode & 0xFFF | v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *__error();
      gs_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
LABEL_27:
        _RemoveTreeInternal_cold_1();
    }
LABEL_28:

    if (a3)
    {
      _GSErrorForErrno(v12, v11);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return 0;
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

char *OUTLINED_FUNCTION_4(int a1, int __errnum, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return strerror(__errnum);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

char *OUTLINED_FUNCTION_10(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_12()
{
  return __error();
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x28u);
}

int *OUTLINED_FUNCTION_17()
{
  return __error();
}

int *OUTLINED_FUNCTION_20()
{
  return __error();
}

int *OUTLINED_FUNCTION_22()
{
  return __error();
}

id _GSError(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = *MEMORY[0x1E0C9B000];
    v22[0] = *MEMORY[0x1E0C9AFB0];
    v22[1] = v6;
    v23[0] = a2;
    v23[1] = a3;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = a3;
    v9 = a2;
    v10 = (void **)v23;
    v11 = v22;
    v12 = v7;
    v13 = 2;
  }
  else
  {
    v20 = *MEMORY[0x1E0C9AFB0];
    v21 = a2;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = 0;
    v16 = a2;
    v10 = &v21;
    v11 = &v20;
    v12 = v14;
    v13 = 1;
  }
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v10, v11, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GSLibraryErrorDomain"), a1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id _GSErrorForStatus(int a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_retainAutorelease(CFSTR("GSLibraryErrorDomain"));
  v8 = 1;
  switch(a1)
  {
    case 'e':
      goto LABEL_16;
    case 'f':
      v8 = 7;
      goto LABEL_16;
    case 'g':
      goto LABEL_4;
    case 'h':
      v8 = 2;
      goto LABEL_16;
    case 'i':
    case 'p':
      v8 = 3;
      goto LABEL_16;
    case 'j':
      v7 = (__CFString *)objc_retainAutorelease((id)*MEMORY[0x1E0CB28A8]);
      v8 = 516;
      goto LABEL_16;
    case 'k':
      v8 = 5;
      goto LABEL_16;
    case 'l':
      v8 = 6;
      goto LABEL_16;
    case 'm':
      v7 = (__CFString *)objc_retainAutorelease((id)*MEMORY[0x1E0CB28A8]);
      v8 = 640;
      goto LABEL_16;
    case 'n':
      v8 = 9;
      goto LABEL_16;
    case 'o':
      v7 = (__CFString *)objc_retainAutorelease((id)*MEMORY[0x1E0CB28A8]);
      v8 = 642;
      goto LABEL_16;
    case 'q':
      v8 = 10;
      goto LABEL_16;
    default:
      if (a1)
      {
LABEL_4:
        gs_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
          _GSErrorForStatus_cold_1(a1, v9);

        v10 = v7;
        v11 = 0;
      }
      else
      {
LABEL_16:
        v10 = v7;
        if (v6)
        {
          v12 = *MEMORY[0x1E0C9B000];
          v21[0] = *MEMORY[0x1E0C9AFB0];
          v21[1] = v12;
          v22[0] = v5;
          v22[1] = v6;
          v13 = (void *)MEMORY[0x1E0C99D80];
          v14 = (id *)v22;
          v15 = v21;
          v16 = 2;
        }
        else
        {
          v19 = *MEMORY[0x1E0C9AFB0];
          v20 = v5;
          v13 = (void *)MEMORY[0x1E0C99D80];
          v14 = &v20;
          v15 = &v19;
          v16 = 1;
        }
        objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v10, v8, v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      return v11;
  }
}

id _GSErrorForErrno(int a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0C9AFB0];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "gs_stringWithFileSystemRepresentation:", strerror(a1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 <= 44)
  {
    v8 = 106;
    switch(a1)
    {
      case 13:
      case 26:
        goto LABEL_17;
      case 14:
      case 15:
      case 16:
      case 19:
      case 22:
      case 23:
      case 24:
      case 25:
      case 27:
      case 29:
      case 31:
      case 32:
      case 33:
        goto LABEL_19;
      case 17:
        goto LABEL_20;
      case 18:
      case 20:
      case 21:
        goto LABEL_16;
      case 28:
      case 34:
        goto LABEL_13;
      case 30:
        v8 = 111;
        goto LABEL_20;
      default:
        if (a1 == 1)
        {
LABEL_17:
          v8 = 108;
          goto LABEL_20;
        }
        if (a1 != 2)
          goto LABEL_19;
        break;
    }
    goto LABEL_16;
  }
  if (a1 <= 68)
  {
    if ((a1 - 62) < 2)
      goto LABEL_16;
    if (a1 != 45)
    {
      if (a1 != 66)
        goto LABEL_19;
LABEL_16:
      v8 = 104;
      goto LABEL_20;
    }
LABEL_18:
    v8 = 107;
    goto LABEL_20;
  }
  switch(a1)
  {
    case 'E':
LABEL_13:
      v8 = 109;
      break;
    case 'f':
      goto LABEL_18;
    case ']':
      v8 = 112;
      break;
    default:
LABEL_19:
      v8 = 101;
      break;
  }
LABEL_20:
  _GSErrorForStatus(v8, v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t GSLibrarySetStorageOptions()
{
  return 0;
}

uint64_t GSLibraryGetStorageOptions()
{
  return 0;
}

uint64_t GSLibraryAddGenerationWithOptionsByCopyingFile(void *a1, uint64_t a2, void *a3, uint64_t a4, _QWORD *a5)
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1D825874C]();
  v22[0] = a2;
  v21[0] = CFSTR("kGSAdditionName");
  v21[1] = CFSTR("kGSAdditionNameSpace");
  v11 = a1;
  objc_msgSend(v11, "nameSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v12;
  v21[2] = CFSTR("kGSAdditionOptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  GSAdditionSaveBlocking(v15, a3, 0, v14, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20;

  if (v16)
  {
    v18 = 1;
  }
  else
  {
    v18 = 0;
    if (a5)
      *a5 = v17;
  }

  objc_autoreleasePoolPop(v10);
  return v18;
}

uint64_t GSLibraryAddGenerationWithOptionsByMovingFile(void *a1, uint64_t a2, void *a3, uint64_t a4, _QWORD *a5)
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1D825874C]();
  v22[0] = a2;
  v21[0] = CFSTR("kGSAdditionName");
  v21[1] = CFSTR("kGSAdditionNameSpace");
  v11 = a1;
  objc_msgSend(v11, "nameSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v12;
  v21[2] = CFSTR("kGSAdditionOptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v16 = 1;
  GSAdditionSaveBlocking(v15, a3, 1, v14, &v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v20;

  if (!v17)
  {
    v16 = 0;
    if (a5)
      *a5 = v18;
  }

  objc_autoreleasePoolPop(v10);
  return v16;
}

uint64_t GSLibrarySetGenerationOptions(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;

  v6 = (void *)MEMORY[0x1D825874C]();
  _GSLibraryGetAddition(a1, a2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "setOptions:error:", a3, 0);

  objc_autoreleasePoolPop(v6);
  return v8;
}

id _GSLibraryGetAddition(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a1;
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "additionWithName:inNameSpace:error:", a2, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t GSLibraryGetGenerationOptions(void *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)MEMORY[0x1D825874C]();
  _GSLibraryGetAddition(a1, a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "options");

  objc_autoreleasePoolPop(v4);
  return v6;
}

uint64_t GSLibraryCopyURLForGeneration(void *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (void *)MEMORY[0x1D825874C]();
  _GSLibraryGetAddition(a1, a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sandboxExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      MEMORY[0x1D8258488](v8, v7);

  }
  else
  {
    v9 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}

uint64_t GSLibraryCopyGeneration(void *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void *v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v19;
  id v20;

  if ((objc_msgSend(a3, "isFileURL") & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1D825874C]();
    v20 = 0;
    _GSLibraryGetAddition(a1, a2, (uint64_t)&v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    v19 = v10;
    v11 = objc_msgSend(v9, "copyAdditionContentToURL:error:", a3, &v19);
    v12 = v19;

    if ((v11 & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      v13 = 0;
      if (a4)
        *a4 = v12;
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not a file URL"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        GSLibraryCopyGeneration_cold_1();

      _GSErrorForStatus(104, v14, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v16;
      *a4 = v17;

    }
    return 0;
  }
  return v13;
}

uint64_t GSLibraryRestoreGeneration(void *a1, uint64_t a2, void *a3, void *a4, uint64_t *a5)
{
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isFileURL") & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1D825874C]();
    v11 = a1;
    v24 = 0;
    _GSLibraryGetAddition(v11, a2, (uint64_t)&v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24;
    if (v12)
    {
      if (a4)
      {
        v26[0] = a4;
        v25[0] = CFSTR("kGSAdditionName");
        v25[1] = CFSTR("kGSAdditionNameSpace");
        objc_msgSend(v11, "nameSpace");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
        a4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v11, "storage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDocumentURL:", a3);

      objc_msgSend(v11, "storage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v13;
      objc_msgSend(v16, "replaceDocumentWithContentsOfAddition:preservingCurrentVersionWithCreationInfo:createdAddition:error:", v12, a4, 0, &v23);
      v17 = v23;

      v13 = v17;
    }
    if (v13)
    {
      v18 = 0;
      if (a5)
        *a5 = (uint64_t)v13;
    }
    else
    {
      v18 = 1;
    }

    objc_autoreleasePoolPop(v10);
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not a file URL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      GSLibraryCopyGeneration_cold_1();

    _GSErrorForStatus(104, v19, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v18 = 0;
    *a5 = v21;
  }
  else
  {
    return 0;
  }
  return v18;
}

uint64_t GSLibrarySetGenerationInfoValueForKey(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1D825874C]();
  _GSLibraryGetAddition(a1, a2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = a3;
  v10 = a4;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "mergeUserInfo:error:", v11, 0);

  if (!a4)
  objc_autoreleasePoolPop(v8);
  return v12;
}

uint64_t GSLibraryCopyGenerationInfoValueForKey(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = (void *)MEMORY[0x1D825874C]();
  _GSLibraryGetAddition(a1, a2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", a3);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  return v9;
}

uint64_t GSLibraryCopyGenerationInfoDictionary(void *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)MEMORY[0x1D825874C]();
  _GSLibraryGetAddition(a1, a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v6;
}

uint64_t GSLibrarySetGenerationOriginalDisplayName(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;

  v6 = (void *)MEMORY[0x1D825874C]();
  _GSLibraryGetAddition(a1, a2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "setDisplayName:error:", a3, 0);

  objc_autoreleasePoolPop(v6);
  return v8;
}

uint64_t GSLibraryCopyGenerationOriginalDisplayName(void *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)MEMORY[0x1D825874C]();
  _GSLibraryGetAddition(a1, a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v6;
}

uint64_t GSLibraryRemoveGenerations(void *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = (void *)MEMORY[0x1D825874C]();
  v5 = objc_msgSend(a1, "generationsRemove:error:", a2, 0);
  objc_autoreleasePoolPop(v4);
  return v5;
}

id GSLibraryCopyGenerationNames(void *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D825874C]();
  v3 = a1;
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "name", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v7;
}

uint64_t GSLibraryCopyGenerationInfos(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, _QWORD *a6)
{
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v26;
  id v27;
  id v28;
  int v29;
  id v30;
  id v31;

  v12 = (void *)MEMORY[0x1D825874C]();
  +[GSStorageManager manager](GSStorageManager, "manager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "storage");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = 0;
  }
  else
  {
    v31 = 0;
    objc_msgSend(v13, "permanentStorageForItemAtURL:allocateIfNone:error:", a2, 0, &v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v31;
  }
  v30 = v16;
  objc_msgSend(v15, "additionWithName:inNameSpace:error:", a4, a3, &v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v30;

  if (!v17)
  {
    v23 = 0;
    if (!a6)
      goto LABEL_13;
    goto LABEL_11;
  }
  v29 = 0;
  objc_msgSend(a5, "objectForKey:", CFSTR("fields"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v18;
  v28 = 0;
  v20 = _genInfosFieldsGet(v19, &v29, &v28, &v27);
  v21 = v28;
  v22 = v27;

  if (v20)
  {
    v26 = v22;
    _copyGenInfos(v17, &v29, v21, &v26);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v26;

    v22 = v24;
  }
  else
  {
    v23 = 0;
  }

  v18 = v22;
  if (a6)
  {
LABEL_11:
    if (!v23)
      *a6 = v18;
  }
LABEL_13:

  objc_autoreleasePoolPop(v12);
  return v23;
}

uint64_t _genInfosFieldsGet(void *a1, _BYTE *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;

  v7 = a1;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("ODN"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        a2[3] = objc_msgSend(v9, "BOOLValue");
        *a3 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid type for UserInfos"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          gs_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            GSAdditionCreationInfoValidate_cold_1();

          if (a4)
          {
            _GSErrorForStatus(110, v10, 0);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_30;
        }
        a2[3] = 1;
        *a3 = objc_retainAutorelease(v9);
      }
    }
    else
    {
      a2[3] = 0;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("URL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid type for Path"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        goto LABEL_26;
    }
    else
    {
      v11 = objc_msgSend(v10, "BOOLValue");

      *a2 = v11;
      objc_msgSend(v8, "objectForKey:", CFSTR("options"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v12 = objc_msgSend(v10, "BOOLValue");

        a2[1] = v12;
        objc_msgSend(v8, "objectForKey:", CFSTR("ODN"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v13 = objc_msgSend(v10, "BOOLValue");

          a2[2] = v13;
          goto LABEL_16;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid type for ODN"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        gs_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          goto LABEL_27;
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid type for fields.Options"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
LABEL_26:
        GSAdditionCreationInfoValidate_cold_1();
    }
LABEL_27:

    if (a4)
    {
      _GSErrorForStatus(110, v15, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_30:
    v14 = 0;
    goto LABEL_31;
  }
  *(_DWORD *)a2 = 16843009;
LABEL_16:
  v14 = 1;
LABEL_31:

  return v14;
}

id _copyGenInfos(void *a1, _BYTE *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  v9 = 0x1E0C99000uLL;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("name"));

  if (a2[1])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "options"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("options"));

  }
  if (*a2)
  {
    objc_msgSend(v7, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sandboxExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      MEMORY[0x1D8258488](v13, v14);
    objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("URL"));

  }
  if (!a2[2])
    goto LABEL_11;
  v37 = 0;
  objc_msgSend(v7, "displayNameWithError:", &v37);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v37;
  v17 = v16;
  if (!v15)
  {
    objc_msgSend(v16, "userInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "domain");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v30 = objc_msgSend(v28, "code");

      if (v30 == 93)
      {

        v9 = 0x1E0C99000;
        goto LABEL_10;
      }
    }
    else
    {

    }
    if (a4)
      *a4 = objc_retainAutorelease(v17);

    v18 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("ODN"));
LABEL_10:

LABEL_11:
  if (!a2[3])
  {
LABEL_29:
    v18 = v10;
    goto LABEL_34;
  }
  objc_msgSend(v7, "userInfoWithError:", a4);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v8)
    {
      v19 = (void *)objc_msgSend(objc_alloc(*(Class *)(v9 + 3592)), "initWithCapacity:", objc_msgSend(v8, "count"));
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v32 = v8;
      v20 = v8;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v34 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v18, "objectForKey:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
              objc_msgSend(v19, "setObject:forKey:", v26, v25);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v22);
      }

      objc_msgSend(v10, "setObject:forKey:", v19, CFSTR("info"));
      v8 = v32;
    }
    else
    {
      objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("info"));
    }

    goto LABEL_29;
  }
LABEL_34:

  return v18;
}

id GSLibraryCopyAllGenerationsInfos(void *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD *v62;
  id v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  id v75;
  int v76;
  id v77;
  _BYTE v78[128];
  _QWORD v79[3];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1D825874C]();
  +[GSStorageManager manager](GSStorageManager, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "storage");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v64 = (void *)v10;
    v11 = 0;
  }
  else
  {
    v77 = 0;
    objc_msgSend(v9, "permanentStorageForItemAtURL:allocateIfNone:error:", a2, 0, &v77);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v77;
  }
  v76 = 0;
  objc_msgSend(a3, "objectForKey:", CFSTR("fields"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v11;
  v75 = 0;
  v13 = _genInfosFieldsGet(v12, &v76, &v75, &v74);
  v14 = v75;
  v15 = v74;

  if (!v13)
  {
    v18 = 0;
    v19 = 0;
    v63 = 0;
    v20 = 0;
    if (a4)
    {
LABEL_9:
      v15 = v15;
      v21 = 0;
      *a4 = v15;
LABEL_54:
      v16 = v18;
      v29 = v63;
      v33 = v64;
      goto LABEL_55;
    }
LABEL_53:
    v21 = 0;
    goto LABEL_54;
  }
  v62 = a4;
  objc_msgSend(a3, "objectForKey:", CFSTR("withOptions"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid type for spec.withOptions"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        GSAdditionCreationInfoValidate_cold_1();

      _GSErrorForStatus(110, v23, 0);
      v25 = objc_claimAutoreleasedReturnValue();

      v16 = 0;
      goto LABEL_25;
    }
    v17 = objc_msgSend(v16, "longLongValue");
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(a3, "objectForKey:", CFSTR("withoutOptions"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

    v22 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid type for spec.withoutOptions"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      GSAdditionCreationInfoValidate_cold_1();

    _GSErrorForStatus(110, v27, 0);
    v25 = objc_claimAutoreleasedReturnValue();

LABEL_25:
    v19 = 0;
    v29 = 0;
    v21 = 0;
LABEL_29:
    v15 = (id)v25;
    v20 = 0;
    goto LABEL_30;
  }

  v22 = objc_msgSend(v18, "longLongValue");
LABEL_18:
  objc_msgSend(a3, "objectForKey:", CFSTR("clients"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v30 = v20;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid type for spec.clients"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        GSAdditionCreationInfoValidate_cold_1();

      _GSErrorForStatus(110, v31, 0);
      v25 = objc_claimAutoreleasedReturnValue();

      v19 = 0;
      v21 = 0;
      v16 = v18;
      v29 = 0;
      goto LABEL_29;
    }
  }
  v63 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  if (v20)
  {
    v26 = v20;
  }
  else
  {
    v79[0] = CFSTR("com.apple.documentVersions");
    v79[1] = CFSTR("com.apple.ubiquity");
    v79[2] = CFSTR("com.apple.FileProvider.conflict");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v34 = v26;
  v60 = v9;
  v61 = v8;
  v35 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
  if (v35)
  {
    v58 = v17;
    v59 = v20;
    v19 = 0;
    v36 = *(_QWORD *)v71;
    v37 = 0x1E0C99000uLL;
    v38 = v15;
    v52 = *(_QWORD *)v71;
    v53 = v22;
    v57 = v34;
LABEL_34:
    v39 = 0;
    v54 = v35;
    while (1)
    {
      if (*(_QWORD *)v71 != v36)
        objc_enumerationMutation(v34);
      v56 = v39;
      v40 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v39);
      v41 = objc_alloc_init(*(Class *)(v37 + 3560));
      v55 = v40;
      objc_msgSend(v64, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", v40, v58, v22, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v19 = v42;
      v43 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v67;
        while (2)
        {
          v46 = 0;
          v47 = v38;
          do
          {
            if (*(_QWORD *)v67 != v45)
              objc_enumerationMutation(v19);
            v48 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v46);
            v65 = v47;
            _copyGenInfos(v48, &v76, v14, &v65);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v65;

            if (!v49)
            {

              a4 = v62;
              v20 = v59;
              goto LABEL_52;
            }
            objc_msgSend(v41, "addObject:", v49);

            ++v46;
            v47 = v38;
          }
          while (v44 != v46);
          v44 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
          if (v44)
            continue;
          break;
        }
      }

      if (objc_msgSend(v41, "count"))
        objc_msgSend(v63, "setObject:forKey:", v41, v55);
      objc_msgSend(v19, "error", v52, v53);
      v50 = objc_claimAutoreleasedReturnValue();

      a4 = v62;
      v20 = v59;
      if (v50)
        break;

      v38 = 0;
      v39 = v56 + 1;
      v22 = v53;
      v34 = v57;
      v36 = v52;
      v37 = 0x1E0C99000;
      if (v56 + 1 == v54)
      {
        v35 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
        v38 = 0;
        v15 = 0;
        if (v35)
          goto LABEL_34;
        goto LABEL_57;
      }
    }
    v38 = (id)v50;
LABEL_52:

    v15 = v38;
    v9 = v60;
    v8 = v61;
    if (a4)
      goto LABEL_9;
    goto LABEL_53;
  }
  v19 = 0;
LABEL_57:

  v16 = v18;
  v29 = v63;
  v21 = v29;
  v9 = v60;
  v8 = v61;
LABEL_30:
  v33 = v64;
LABEL_55:

  objc_autoreleasePoolPop(v8);
  return v21;
}

_QWORD *GSLibraryDocumentWillSafeSave(void *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  _QWORD *v9;

  v4 = (void *)MEMORY[0x1D825874C]();
  objc_msgSend(a1, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "caseInsensitiveCompare:", v6)
    && objc_msgSend(&unk_1E9775920, "containsObject:", v5)
    && (v7 = open((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), 256),
        (v7 & 0x80000000) == 0))
  {
    v8 = v7;
    v9 = malloc_type_malloc(0x10uLL, 0x10600407B16006EuLL);
    *(_DWORD *)v9 = v8;
    v9[1] = CFRetain(a2);
  }
  else
  {
    v9 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}

void GSLibraryDocumentDidSafeSave(uint64_t a1)
{
  int v2;

  if (a1)
  {
    v2 = open((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 8)), "fileSystemRepresentation"), 256);
    if ((v2 & 0x80000000) == 0)
      ffsctl(*(_DWORD *)a1, 0x80046820uLL, &v2, 0);
    close(*(_DWORD *)a1);
    close(v2);
    CFRelease(*(CFTypeRef *)(a1 + 8));
    free((void *)a1);
  }
}

uint64_t GSLibraryInternalStatGeneration(const char *a1, stat *a2)
{
  void *v4;
  uint64_t v5;

  v4 = (void *)MEMORY[0x1D825874C]();
  v5 = GSAdditionStatInternal(a1, a2);
  objc_autoreleasePoolPop(v4);
  return v5;
}

void sub_1D415A158(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D415A390(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id GSStagingContainer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;

  v5 = a1;
  v6 = a2;
  objc_msgSend(a3, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");
  if (v8 >= objc_msgSend(v7, "count"))
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if ((v12 & 1) == 0)
        goto LABEL_7;
    }
    while (++v9 < (unint64_t)objc_msgSend(v6, "count"));
  }
  objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v14;
}

id GSAdditionComputePOSIXName(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  objc_msgSend(a1, "objectForKey:", CFSTR("kGSAdditionPOSIXName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v9, "validateGSNameAllowingDot:error:", 1, 0) & 1) != 0)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid POSIX Name value"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        GSAdditionCreationInfoValidate_cold_2();

      if (a4)
      {
        _GSErrorForStatus(105, v11, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "gs_stringByUpdatingPathExtensionWithPathOrURL:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

id GSAdditionComputeDN(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  int v19;
  int v20;
  id v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  id v25;
  id v27;
  id v28;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("kGSAdditionDisplayName"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v28 = 0;
    v13 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v28, *MEMORY[0x1E0C999B0], 0);
    v14 = v28;
    v15 = v14;
    if (v13)
      v16 = v14 == 0;
    else
      v16 = 1;
    if (v16)
      v19 = 1;
    else
      v19 = objc_msgSend(v14, "BOOLValue") ^ 1;
    v27 = 0;
    v20 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v27, *MEMORY[0x1E0C99A70], 0);
    v21 = v27;
    v22 = v21;
    if (v20)
      v23 = v21 == 0;
    else
      v23 = 1;
    if (v23)
    {
      GSAdditionComputePOSIXName(v7, v8, v9, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v11 = 0;
        goto LABEL_29;
      }
      if (!v19)
      {
        objc_msgSend(v12, "stringByDeletingPathExtension");
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        v11 = (id)v24;

        objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("/"));
        v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
        v12 = v25;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      if ((v19 & 1) == 0)
      {
        v25 = v21;
        v11 = v25;
        goto LABEL_28;
      }
      v12 = v21;
    }
    objc_msgSend(v12, "gs_stringByUpdatingPathExtensionWithPathOrURL:", v9);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v11 = (id)v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v11;
    v12 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid DisplayName value"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      GSAdditionCreationInfoValidate_cold_2();

    if (a4)
    {
      _GSErrorForStatus(105, v17, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v12 = 0;
  }
LABEL_30:

  return v12;
}

id GSAdditionValidateUInfo(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  char v9;

  objc_msgSend(a1, "objectForKey:", CFSTR("kGSAdditionUserInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &v9, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, a2);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid UserInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  gs_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    GSAdditionValidateUInfo_cold_1();

  if (a2)
  {
    _GSErrorForStatus(110, v6, 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  v5 = 0;
LABEL_11:

  return v5;
}

id GSReplaceDocumentInternal(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v21;

  v5 = a1;
  v6 = a2;
  objc_msgSend(v5, "pathExtension");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_1E9772CD0;
  v10 = v9;

  objc_msgSend(v6, "pathExtension");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_1E9772CD0;
  v14 = v13;

  if (!-[__CFString caseInsensitiveCompare:](v14, "caseInsensitiveCompare:", v10))
  {
    v5 = v5;
    goto LABEL_15;
  }
  objc_msgSend(v5, "URLByDeletingPathExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v14, "length"))
  {
    objc_msgSend(v15, "URLByAppendingPathExtension:", v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  if ((objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    v19 = v15;

    v5 = v19;
LABEL_15:
    v21 = 0;
    v15 = v5;
    if (MEMORY[0x1D8258494](*MEMORY[0x1E0C9AE00], v5, v6, 0, 0, 0, 0, &v21))
      goto LABEL_19;
    goto LABEL_16;
  }
  v21 = 0;
  v17 = *MEMORY[0x1E0C9AE00];
  objc_msgSend(v15, "lastPathComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = MEMORY[0x1D8258494](v17, v5, v6, v18, 0, 0, 0, &v21);

  if ((_DWORD)v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3600], "__itemAtURL:didMoveToURL:purposeID:", v5, v15, 0);
    goto LABEL_19;
  }
LABEL_16:

  if (a3)
  {
    v15 = 0;
    *a3 = v21;
  }
  else
  {
    CFRelease(v21);
    v15 = 0;
  }
LABEL_19:

  return v15;
}

id GSRestoreAdditionInternal(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a1;
  v6 = a2;
  objc_msgSend(v6, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLforReplacingItemWithError:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "copyAdditionContentToURL:error:", v10, a3))
    {
      GSReplaceDocumentInternal(v5, v10, a3);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v11;
    }
    _RemoveTree((char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), 0, 0);
    v5 = v5;

    v12 = v5;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id GSAdditionSaveBlocking(void *a1, void *a2, uint64_t a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v9 = a1;
  v10 = a2;
  v11 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  objc_msgSend(v9, "prepareAdditionCreationWithItemAtURL:byMoving:creationInfo:error:", v10, a3, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = dispatch_semaphore_create(0);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __GSAdditionSaveBlocking_block_invoke;
    v17[3] = &unk_1E9771BD8;
    v19 = &v27;
    v20 = &v21;
    v14 = v13;
    v18 = v14;
    objc_msgSend(v9, "createAdditionStagedAtURL:creationInfo:completionHandler:", v12, v11, v17);
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (a5)
      *a5 = objc_retainAutorelease((id)v22[5]);
    v15 = (id)v28[5];

  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v15;
}

void sub_1D415B1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

uint64_t GSAdditionStatInternal(const char *a1, stat *a2)
{
  uint64_t v4;
  int v5;
  mode_t st_mode;
  unsigned int v7;
  int v8;
  NSObject *v9;
  unsigned __int8 value;

  v4 = lstat(a1, a2);
  if (!(_DWORD)v4)
  {
    v5 = *__error();
    st_mode = a2->st_mode;
    v7 = a2->st_flags & 0xFFFFFFDD;
    value = 0;
    *__error() = 0;
    if (getxattr(a1, "com.apple.genstore.orig_perms_v1", &value, 1uLL, 0, 0) == 1)
    {
      v7 |= (2 * value) & 6;
      v8 = (2 * value) & 0x10 | (32 * value) & 0x92 | (value >> 3) & 2;
    }
    else
    {
      if (*__error() != 93)
      {
        gs_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
          GSAdditionStatInternal_cold_1();

        v4 = 0xFFFFFFFFLL;
        v5 = 5;
        goto LABEL_10;
      }
      LOWORD(v8) = 128;
    }
    v4 = 0;
    a2->st_flags = v7;
    a2->st_mode = st_mode | v8;
LABEL_10:
    *__error() = v5;
  }
  return v4;
}

void sub_1D415BFC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D415C16C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D415C3EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D415C98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D415CB68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D415CD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D415CF04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

GSClientManagedLibrary *GSLibraryCreateClientManaged(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  GSClientManagedLibrary *v6;
  id v7;
  void *v8;
  GSClientManagedLibrary *v9;
  id v11;

  v5 = (void *)MEMORY[0x1D825874C]();
  v11 = 0;
  v6 = -[GSClientManagedLibrary initWithURL:error:]([GSClientManagedLibrary alloc], "initWithURL:error:", a2, &v11);
  v7 = v11;
  v8 = v7;
  if (v6)
  {
    v9 = v6;
  }
  else if (a3)
  {
    *a3 = v7;
  }

  objc_autoreleasePoolPop(v5);
  return v6;
}

uint64_t GSLibraryDestroyClientManaged(void *a1, _QWORD *a2)
{
  void *v4;
  char v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v10;

  v4 = (void *)MEMORY[0x1D825874C]();
  v10 = 0;
  v5 = _RemoveTree((char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), 0, &v10);
  v6 = v10;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (a2)
      *a2 = v6;
  }

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_1D415EDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

uint64_t GSSetDocIDResolutionPolicy(unsigned int a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t result;
  int v5;
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  gs_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (a1 > 1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 67109120;
      v6 = a1;
      _os_log_impl(&dword_1D414C000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Invalid GS docID resolution policy (%x) ignoring", (uint8_t *)&v5, 8u);
    }

    return gResolutionPolicy;
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v5 = 67109120;
      v6 = a1;
      _os_log_impl(&dword_1D414C000, v3, OS_LOG_TYPE_INFO, "[INFO] New GS docID resolution policy (%x)", (uint8_t *)&v5, 8u);
    }

    do
      result = __ldxr((unsigned int *)&gResolutionPolicy);
    while (__stxr(a1, (unsigned int *)&gResolutionPolicy));
  }
  return result;
}

void sub_1D415FB9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D415FD54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4160690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
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

uint64_t _GSIsDocumentRevision(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[GSStorageManager manager](GSStorageManager, "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isItemAtURLInsidePermanentStorage:error:", a1, 0);

  return v3;
}

uint64_t GSLibraryResolveDocumentIdWithAPFS(uint64_t a1, int a2, char *a3)
{
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v7[0] = a1;
  v7[1] = 1;
  v8 = 0;
  if (!fsctl(a3, 0xC0104A5DuLL, v7, 1u))
    return v8;
  gs_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    GSLibraryResolveDocumentIdWithAPFS_cold_1((uint64_t)a3, a1, v5);

  return 0;
}

uint64_t GSLibraryResolveDocumentIdCachedAPFS(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  int v8;
  uint64_t v9;
  timespec v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (GSLibraryGetPathFromDevice_once != -1)
    dispatch_once(&GSLibraryGetPathFromDevice_once, &__block_literal_global_3);
  v11.tv_sec = 0;
  v11.tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC_RAW, &v11);
  pthread_rwlock_rdlock(&gDevCacheLock);
  if (v11.tv_sec < gDevCacheTime.tv_sec
    || v11.tv_sec > gDevCacheTime.tv_sec + 1
    || (objc_msgSend((id)gDevCache, "objectForKey:", v3), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    gs_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      GSLibraryResolveDocumentIdCachedAPFS_cold_2(v5);

    pthread_rwlock_unlock(&gDevCacheLock);
    pthread_rwlock_wrlock(&gDevCacheLock);
    objc_msgSend((id)gDevCache, "removeAllObjects");
    GSLibraryGetMNTInfo();
    objc_msgSend((id)gDevCache, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      gs_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        GSLibraryResolveDocumentIdCachedAPFS_cold_1((uint64_t)v3, v6);

      objc_msgSend((id)gDevCache, "setObject:forKey:", &stru_1E9772CD0, v3);
      v4 = 0;
    }
  }
  pthread_rwlock_unlock(&gDevCacheLock);

  if (objc_msgSend(v4, "length"))
  {
    v7 = (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v9 = GSLibraryResolveDocumentIdWithAPFS(a1, v8, v7);
  }
  else
  {
    v9 = 0;
    *__error() = 22;
  }

  return v9;
}

uint64_t GSLibraryResolveDocumentId2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int *v5;

  if (gs_is_feature_flag_ApfsDocID_enabled_once_token != -1)
    dispatch_once(&gs_is_feature_flag_ApfsDocID_enabled_once_token, &__block_literal_global_84);
  if (gs_is_feature_flag_ApfsDocID_enabled_feature_enabled)
  {
    result = GSLibraryResolveDocumentIdCachedAPFS(a1, a2);
    if (!result)
    {
      if (*__error() == 2 || gResolutionPolicy == 1)
        return 0;
      return GSLibraryResolveDocumentIdRevD(a1, a2);
    }
  }
  else
  {
    if (gResolutionPolicy != 1)
      return GSLibraryResolveDocumentIdRevD(a1, a2);
    v5 = __error();
    result = 0;
    *v5 = 45;
  }
  return result;
}

uint64_t GSLibraryResolveDocumentIdRevD(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  void *v5;
  time_t v6;
  id v7;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t *v13;
  int v14;
  int v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v2 = a1;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1D825874C]();
    +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v6 = time(0);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __GSLibraryResolveDocumentIdRevD_block_invoke;
    v17[3] = &unk_1E9771EC8;
    v19 = &v30;
    v20 = &v26;
    v21 = &v22;
    v7 = v5;
    v18 = v7;
    objc_msgSend(v7, "getFileIdForDocumentId:onDevice:reply:", v2, a2, v17);
    v8 = (id)objc_msgSend(v7, "result");
    v9 = *((_DWORD *)v27 + 6);
    if (!v9)
    {
      v10 = _GSOpenByID();
      v11 = v10;
      v16 = 0;
      if (v10 < 0)
      {
        if (*__error() != 2)
        {
LABEL_16:
          v2 = v31[3];

          _Block_object_dispose(&v22, 8);
          _Block_object_dispose(&v26, 8);
          _Block_object_dispose(&v30, 8);

          objc_autoreleasePoolPop(v4);
          return v2;
        }
        v12 = 0;
      }
      else
      {
        v12 = GSGetDocumentID(v10, &v16);
        close(v11);
      }
      if (v12 == v2)
      {
        v13 = v27;
      }
      else
      {
        v13 = v27;
        if (v6 - v23[3] >= 3)
          v14 = 70;
        else
          v14 = 16;
        *((_DWORD *)v27 + 6) = v14;
        v31[3] = 0;
      }
      v9 = *((_DWORD *)v13 + 6);
    }
    *__error() = v9;
    goto LABEL_16;
  }
  *__error() = 22;
  return v2;
}

void sub_1D4161060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t GSLibraryGetOrAllocateDocumentId(int a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v7;

  if (a1 < 0)
  {
    v3 = 0;
    *__error() = 22;
  }
  else
  {
    v2 = (void *)MEMORY[0x1D825874C]();
    v7 = 0;
    v3 = GSGetDocumentID(a1, &v7);
    if (!(_DWORD)v3)
    {
      v3 = GSTrackDocument(a1);
      if ((_DWORD)v3)
      {
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", dup(a1), 1);
        GSDaemonProxy(0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "hintDocIDCreationForFileHandle:", v4);

      }
    }
    objc_autoreleasePoolPop(v2);
  }
  return v3;
}

uint64_t GSLibraryTransferDocumentId(unsigned int a1, int a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned int v9;

  v9 = a1;
  if (((a2 | a1) & 0x80000000) != 0)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  else
  {
    v3 = (void *)MEMORY[0x1D825874C]();
    if (ffsctl(a2, 0x80046820uLL, &v9, 0) < 0)
    {
      v7 = 0xFFFFFFFFLL;
    }
    else
    {
      v4 = objc_alloc(MEMORY[0x1E0CB3608]);
      v5 = (void *)objc_msgSend(v4, "initWithFileDescriptor:closeOnDealloc:", v9, 0);
      +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hintDocIDCreationForFileHandle:", v5);

      v7 = 0;
    }
    objc_autoreleasePoolPop(v3);
  }
  return v7;
}

void sub_1D4161418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4161584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D41618C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 120), 8);
  _Unwind_Resume(a1);
}

int *GSLibraryGetMNTInfo()
{
  int v0;
  unsigned int v1;
  NSObject *v2;
  uint64_t v3;
  char *f_mntonname;
  void *v5;
  void *v6;
  statfs v8;
  uint64_t v9;

  MEMORY[0x1E0C80A78]();
  v9 = *MEMORY[0x1E0C80C00];
  v0 = getfsstat(&v8, 138752, 2);
  if (v0 < 0)
    return __error();
  v1 = v0;
  if (v0)
  {
    if (v0 == 64 && (GSLibraryGetMNTInfo_warned & 1) == 0)
    {
      gs_default_log();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
        GSLibraryGetMNTInfo_cold_1(v2);

      GSLibraryGetMNTInfo_warned = 1;
    }
    v3 = v1;
    f_mntonname = v8.f_mntonname;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)f_mntonname - 10));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!strcmp("apfs", f_mntonname - 16))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", f_mntonname);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)gDevCache, "setObject:forKeyedSubscript:", v6, v5);

      }
      else
      {
        objc_msgSend((id)gDevCache, "setObject:forKeyedSubscript:", &stru_1E9772CD0, v5);
      }
      f_mntonname += 2168;

      --v3;
    }
    while (v3);
  }
  gDevCacheTime.tv_sec = 0;
  gDevCacheTime.tv_nsec = 0;
  return (int *)clock_gettime(_CLOCK_MONOTONIC_RAW, &gDevCacheTime);
}

void sub_1D4161ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void reportSimulatedCrashWithFormatSignature_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D414C000, a2, a3, "[DEBUG] Sent snapshot for signature %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void reportSimulatedCrashWithFormatSignature_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D414C000, a2, (os_log_type_t)0x90u, "[ERROR] Failed to send snapshot for signature %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __reportSimulatedCrashWithFormatSignature_block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D414C000, a2, a3, "[DEBUG] got response from diagnosticReporter - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void GSAdditionCreationInfoValidate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D414C000, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void GSAdditionCreationInfoValidate_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D414C000, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void GSGetDocumentID_cold_1()
{
  int *v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_22();
  v0 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_15();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x18u);
  OUTLINED_FUNCTION_23();
}

void GSTrackDocument_cold_1()
{
  int *v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12();
  v0 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_15();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x1Eu);
  OUTLINED_FUNCTION_3();
}

void GSFchflags_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __error();
  v0 = __error();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_1D414C000, v1, v2, "[ERROR] %s: stat() failed; error %d (%s)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_23();
}

void GSFchflags_cold_2()
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
  OUTLINED_FUNCTION_12();
  v0 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13(&dword_1D414C000, v1, v2, "[ERROR] %s: FSIOC_CAS_BSDFLAGS failed for -%x/+%x\n; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
  OUTLINED_FUNCTION_3();
}

void GSFchflags_cold_3()
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
  OUTLINED_FUNCTION_12();
  v0 = OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13(&dword_1D414C000, v1, v2, "[ERROR] %s: inconsistent flags -%x/+%x; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
  OUTLINED_FUNCTION_3();
}

void _RemoveTreeInternal_cold_1()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v0, v1, v2, v3, v4, v5, v6, v7, v14, v16, v17, v18, v19, v20);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1D414C000, v8, v9, "[DEBUG] %@; error %d (%s)", v10, v11, v12, v13, v15);
  OUTLINED_FUNCTION_3();
}

void _RemoveTreeInternal_cold_2()
{
  __assert_rtn("_RemoveTreeInternal", "PathUtils.m", 205, "ftsEnt->fts_statp");
}

void _GSPathResolveByID_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __error();
  v0 = __error();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_1D414C000, v1, v2, "[ERROR] %s: failed to allocate buffer; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    2u);
  OUTLINED_FUNCTION_23();
}

void _PathResolve_cold_1()
{
  int *v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_12();
  v0 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_15();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x26u);
  OUTLINED_FUNCTION_3();
}

void _TransferBirthTime_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7(&dword_1D414C000, v0, v1, "[DEBUG] setattrlist failed (errno %d) for %s\n", v2);
  OUTLINED_FUNCTION_21();
}

void _TransferBirthTime_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7(&dword_1D414C000, v0, v1, "[DEBUG] gettattrlist failed (errno %d) for %s\n", v2);
  OUTLINED_FUNCTION_21();
}

void GSMutableInfoDictionary_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "com.apple.genstore.info";
  v4 = 2080;
  v5 = a1;
  _os_log_error_impl(&dword_1D414C000, a2, (os_log_type_t)0x90u, "[ERROR] Invalid property list found in attribute %s at path \"%s\"", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void GSMutableInfoDictionary_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1D414C000, v0, v1, "[DEBUG] %@; status %d", v2);
  OUTLINED_FUNCTION_1();
}

void GSArchiveTree_cold_5(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = 104;
  OUTLINED_FUNCTION_7(&dword_1D414C000, a2, a3, "[DEBUG] %@; status %d", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void GSChflags_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_12();
  v0 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_1D414C000, v1, v2, "[ERROR] open() failed for path '%s'\n; error %d (%s)",
    v3,
    v4,
    v5,
    v6,
    v7);
  OUTLINED_FUNCTION_3();
}

void _GSErrorForStatus_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D414C000, a2, (os_log_type_t)0x90u, "[ERROR] Unknown status code encountered: %d\n", (uint8_t *)v2, 8u);
}

void GSLibraryCopyGeneration_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D414C000, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void GSAdditionValidateUInfo_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_0(&dword_1D414C000, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void GSAdditionStatInternal_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_1D414C000, v1, v2, "[ERROR] failed to retrieve original perms from xattr on item \"%s\"; error %d (%s)\n",
    v3,
    v4,
    v5,
    v6,
    v7);
  OUTLINED_FUNCTION_3();
}

void GSLibraryResolveDocumentIdWithAPFS_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6;
  int *v7;
  char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = *__error();
  v7 = __error();
  v8 = strerror(*v7);
  v9 = 134218754;
  v10 = a2;
  v11 = 2080;
  v12 = a1;
  v13 = 1024;
  v14 = v6;
  v15 = 2080;
  v16 = v8;
  _os_log_error_impl(&dword_1D414C000, a3, (os_log_type_t)0x90u, "[ERROR] fsctl failed to resolve docID %llu to file ID using path %s; error %d (%s)",
    (uint8_t *)&v9,
    0x26u);
  OUTLINED_FUNCTION_3();
}

void GSLibraryResolveDocumentIdCachedAPFS_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D414C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Cache negative entry for %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void GSLibraryResolveDocumentIdCachedAPFS_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D414C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] gDevCache needs to be rebuilt", v1, 2u);
}

void GSLibraryGetMNTInfo_cold_1(os_log_t log)
{
  _DWORD v1[2];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109376;
  v1[1] = 64;
  v2 = 2048;
  v3 = 64;
  _os_log_fault_impl(&dword_1D414C000, log, OS_LOG_TYPE_FAULT, "[CRIT] getfsstat() returned as many mount points as we can process (%d = %zu) - possible docID resolution failures", (uint8_t *)v1, 0x12u);
  OUTLINED_FUNCTION_1();
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

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

uint64_t _CFURLReplaceObject()
{
  return MEMORY[0x1E0C9A768]();
}

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x1E0CB3C38]();
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

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

int chflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1E0C82630](a1, *(_QWORD *)&a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1E0C82668](*(_QWORD *)&__clock_id, __tp);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1E0C82678](a1, a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1E0C82B20]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1E0C82B28](a1);
}

int copyfile_state_get(copyfile_state_t s, uint32_t flag, void *dst)
{
  return MEMORY[0x1E0C82B30](s, *(_QWORD *)&flag, dst);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x1E0C82B38](s, *(_QWORD *)&flag, src);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83380](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C833A8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83540](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1E0C83550](a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1E0C83570](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1E0C835A0](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1E0C835A8](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1E0C835B0](a1);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1E0C83670](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C83B30](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

uint64_t openbyid_np()
{
  return MEMORY[0x1E0C844B8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t pthread_fchdir_np()
{
  return MEMORY[0x1E0C84D90]();
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C850B8](__p, __ec);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850C0](path, state, *(_QWORD *)&flags);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C85318](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

