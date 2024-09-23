@implementation NSURL

uint64_t __43__NSURL_FPAdditions__fp_matchesEDSLocation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v4 >= objc_msgSend(v3, "count"))
    {
      if (!objc_msgSend(v3, "count"))
      {
LABEL_9:
        v5 = 1;
        goto LABEL_10;
      }
      v6 = 0;
      while (1)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("<uuid>")) & 1) == 0
          && (objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
        {
          break;
        }

        if (++v6 >= (unint64_t)objc_msgSend(v3, "count"))
          goto LABEL_9;
      }

    }
  }
  v5 = 0;
LABEL_10:

  return v5;
}

uint64_t __45__NSURL_FPFSHelpers__fp_isDatalessWithError___block_invoke(uint64_t a1)
{
  return lstat((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation"), (stat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
}

uint64_t __42__NSURL_FPFSHelpers__fp_defaultMoverBlock__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v6 = (void *)MEMORY[0x1E0CB3620];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "moveItemAtURL:toURL:error:", v8, v7, a4);

  return v10;
}

void __41__NSURL_FPFSHelpers__getMaxChildrenCount__block_invoke()
{
  uint64_t v0;
  id v1;

  v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
  v0 = objc_msgSend(v1, "integerForKey:", CFSTR("FPMaxChildrenCountForScanOverride"));
  if (v0)
    getMaxChildrenCount_maxChildrenCount = v0;

}

void __133__NSURL_FPFSHelpers__fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("fp move work queue", v2);
  v1 = (void *)fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler__workQueue;
  fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler__workQueue = (uint64_t)v0;

}

uint64_t __133__NSURL_FPFSHelpers__fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fp_queued_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id obj;
  id v27;
  id v28;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v28 = 0;
    v7 = *MEMORY[0x1E0C998D8];
    v27 = 0;
    v8 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v28, v7, &v27);
    v9 = v28;
    v10 = v27;
    if ((v8 & 1) == 0)
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_cold_2();

    }
    if (v9 && (objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;

LABEL_22:
      goto LABEL_23;
    }

  }
  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 40), "itemAtURL:willMoveToURL:", v5, v6);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v14 + 40);
  v15 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_storeStrong((id *)(v14 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v15;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v17 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "code");

    if (v17 != 516)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorForCollisionWithURL:", v6);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;
  }

LABEL_15:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_cold_1();

    if (*(_BYTE *)(a1 + 80))
      objc_msgSend(*(id *)(a1 + 40), "itemAtURL:didMoveToURL:", v5, v6);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v22 = v6;
    v10 = *(id *)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v22;
    goto LABEL_22;
  }
LABEL_23:

}

void __90__NSURL_FPFSHelpers__fp_importUnderFolder_allowCoordination_usingBlock_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!v5)
    objc_msgSend(v6, "fp_hideExtension:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  __int128 v6;
  int v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v8 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2;
  v5[3] = &unk_1E444AE18;
  v7 = *(_DWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "coordinateWritingItemAtURL:options:error:byAccessor:", a2, 1, &v8, v5);
  v3 = v8;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_cold_1();

  }
}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  stat v8;

  v3 = a2;
  memset(&v8, 0, sizeof(v8));
  if (fstat(*(_DWORD *)(a1 + 48), &v8) < 0)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_1(v3, v5);
  }
  else if ((fpfs_is_busy_date(v8.st_birthtimespec.tv_sec) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v4, "removeItemAtURL:error:", v3, &v7);
    v5 = v7;

    if (v5)
    {
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_2();

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_3(a1, v5);
  }

}

void __54__NSURL_FPFSHelpers__fp_coordinatedDeleteWithHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (!a1[4])
  {
LABEL_9:
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      v13 = 0;
    else
      v13 = v4;
    (*(void (**)(_QWORD, void *))(a1[5] + 16))(a1[5], v13);
    goto LABEL_16;
  }
  v16 = 0;
  v5 = *MEMORY[0x1E0C998D8];
  v15 = 0;
  v6 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v16, v5, &v15);
  v7 = v16;
  v8 = v15;
  if ((v6 & 1) != 0)
  {
    if (v7 && (objc_msgSend(v7, "isEqual:", a1[4]) & 1) == 0)
    {
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __54__NSURL_FPFSHelpers__fp_coordinatedDeleteWithHandler___block_invoke_cold_1();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[6] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    goto LABEL_9;
  }
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_cold_2();

LABEL_16:
}

void __70__NSURL_FPFSHelpers__fp_deleteAllowingCoordination_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v8 = objc_msgSend(v7, "removeItemAtURL:error:", v5, &v24);
    v9 = v24;
    v10 = v9;
    if ((v8 & 1) != 0)
    {
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB28A8];
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v13 = objc_msgSend(v10, "code");

      if (v13 == 4)
        goto LABEL_16;
    }
    else
    {

    }
    objc_msgSend(v10, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", v12))
    {
      v15 = objc_msgSend(v10, "code");

      if (v15 == 513)
      {
        fp_current_or_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __70__NSURL_FPFSHelpers__fp_deleteAllowingCoordination_completionHandler___block_invoke_cold_1();

        v17 = (void *)objc_opt_new();
        v18 = (void *)objc_opt_new();
        objc_msgSend(v17, "setDelegate:", v18);
        v23 = v10;
        v19 = objc_msgSend(v17, "removeItemAtURL:error:", v5, &v23);
        v20 = v23;
        v21 = v23;

        if ((v19 & 1) == 0)
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v20);
        v7 = v17;
        goto LABEL_17;
      }
    }
    else
    {

    }
LABEL_16:
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v21 = v10;
    v18 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;
LABEL_17:

    v10 = v21;
    goto LABEL_18;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
LABEL_19:

}

void __61__NSURL_FPAdditions__fp_personaSharedDirectoryPathForUserID___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)fp_personaSharedDirectoryPathForUserID__pathByPersonaID;
  fp_personaSharedDirectoryPathForUserID__pathByPersonaID = v0;

}

void __59__NSURL_FPAdditions__fp_secureTempDirectoryIgnoringPersona__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)fp_secureTempDirectoryIgnoringPersona_sandboxedTemporaryDirectory;
  fp_secureTempDirectoryIgnoringPersona_sandboxedTemporaryDirectory = v2;

  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = fp_secureTempDirectoryIgnoringPersona_sandboxedTemporaryDirectory;
    _os_log_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_INFO, "[INFO] Sandboxed temporary directory is %@", (uint8_t *)&v5, 0xCu);
  }

}

void __48__NSURL_FPAdditions__fp_makeWritableOnFD_error___block_invoke()
{
  size_t v0;
  size_t v1;
  char *v2;
  BOOL v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  passwd *v7;
  passwd v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = sysconf(71);
  if (v0 == -1)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __48__NSURL_FPAdditions__fp_makeWritableOnFD_error___block_invoke_cold_1(v5);

  }
  else
  {
    v1 = v0;
    v2 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v2, v0);
    memset(&v8, 0, sizeof(v8));
    v7 = 0;
    if (getpwnam_r("mobile", &v8, v2, v1, &v7))
      v3 = 1;
    else
      v3 = v7 == 0;
    if (v3)
    {
      fp_current_or_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        __48__NSURL_FPAdditions__fp_makeWritableOnFD_error___block_invoke_cold_2();

    }
    else
    {
      fp_makeWritableOnFD_error__mobile_uid = v8.pw_uid;
      fp_makeWritableOnFD_error__mobile_gid = v8.pw_gid;
    }
  }
}

void __110__NSURL_CopyFile__fp_copyToURL_queue_precomputedItemSize_replacePlaceholder_shouldCopyAppleDouble_completion___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v2 = *(id *)(a1 + 32);
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __110__NSURL_CopyFile__fp_copyToURL_queue_precomputedItemSize_replacePlaceholder_shouldCopyAppleDouble_completion___block_invoke_cold_1(a1, v3);

  if ((*(_BYTE *)(a1 + 196) & 0x20) == 0
    && ((v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8),
         v5 = *(_DWORD *)(v4 + 24),
         (*(_WORD *)(a1 + 84) & 0xF000) == 0x8000)
      ? (v6 = (v5 & 0x1000000) == 0)
      : (v6 = 0),
        v6))
  {
    if ((v5 & 8) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 224), *(_QWORD *)(a1 + 40), CFSTR("NSURL+CopyFile.m"), 325, CFSTR("flags must include COPYFILE_DATA"));

      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v5 = *(_DWORD *)(v4 + 24);
    }
    *(_DWORD *)(v4 + 24) = v5 ^ 8;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(_DWORD *)(v9 + 24);
    if ((v10 & 0x40000) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 224), *(_QWORD *)(a1 + 40), CFSTR("NSURL+CopyFile.m"), 327, CFSTR("flags must include COPYFILE_NOFOLLOW_SRC"));

      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v10 = *(_DWORD *)(v9 + 24);
    }
    *(_DWORD *)(v9 + 24) = v10 ^ 0x40000;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v13 = *(_DWORD *)(v12 + 24);
    if ((v13 & 0x20000) != 0)
      *(_DWORD *)(v12 + 24) = v13 ^ 0x20000;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[FPThreadedCopier sharedCopier](FPThreadedCopier, "sharedCopier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(unsigned __int8 *)(a1 + 241);
    v18 = *(_QWORD *)(a1 + 56);
    v26 = 0;
    v19 = objc_msgSend(v16, "copy:to:overwriteDestination:progress:error:", v14, v15, v17, v18, &v26);
    v20 = v26;

    if ((v19 & 1) == 0)
    {
      (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "rootWasCopied"), v20);
      goto LABEL_26;
    }
  }
  else
  {
    v20 = 0;
  }
  if (copyfile((const char *)objc_msgSend(v14, "fileSystemRepresentation"), (const char *)objc_msgSend(v15, "fileSystemRepresentation"), *(copyfile_state_t *)(a1 + 232), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "copyError"))
      v21 = objc_msgSend(*(id *)(a1 + 32), "copyError");
    else
      v21 = *__error();
    v22 = v21;
    v23 = *(_QWORD *)(a1 + 64);
    v24 = objc_msgSend(*(id *)(a1 + 32), "rootWasCopied");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v22, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v23 + 16))(v23, v24, v25);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "fp_makeWritableAndRemoveNonExportableAttributes");
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 1, 0);
  }
LABEL_26:
  copyfile_state_free(*(copyfile_state_t *)(a1 + 232));

}

void __88__NSURL_CopyFile__fp_copyToTempFolderWithFilename_queue_precomputedItemSize_completion___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1[6];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(v3 + 16))(a1[6], 0, 0, a3);
  }
  else
  {
    v4 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a1[5], 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v3 + 16))(v3, v4, v5, 0);

  }
}

uint64_t __61__NSURL_CopyFile__fp_createEmptyTempFileWithName_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D50];
  v5 = a2;
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "writeToURL:options:error:", v5, 0, a3);

  return v7;
}

uint64_t __64__NSURL_CopyFile__fp_createEmptyTempPackageWithName_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3650];
  v5 = a2;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initDirectoryWithFileWrappers:", MEMORY[0x1E0C9AA70]);
  v8 = objc_msgSend(v7, "writeToURL:options:originalContentsURL:error:", v5, 0, 0, a3);

  return v8;
}

void __50__NSURL_FPConflictWinner__fp_lastEditorDeviceName__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
  {
    if (!a3)
    {
      objc_msgSend(a2, "itemVersion");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastEditorDeviceName");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

void __54__NSURL_FPConflictWinner__fp_lastEditorNameComponents__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v11 = v5;
    v7 = objc_msgSend(v5, "isShared");
    v6 = v11;
    if (v7)
    {
      objc_msgSend(v11, "mostRecentEditorNameComponents");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v6 = v11;
    }
  }

}

void __110__NSURL_FPConflictWinner__fp_addTestConflictLoserFromItemAtURL_lastEditorDeviceName_lastEditorUserName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_27_0();
  objc_msgSend(v1, "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26_0(), "fp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG] sucessfully imported %@ to %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

void __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_cold_2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_27_0();
  objc_msgSend(v1, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26_0(), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG] Can't read mtime from %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, v0, v1, "[DEBUG] Coordination for writing failed with error: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_obfuscatedPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Can't stat file at coordinated url: \"%@\", v5, 0xCu);

  OUTLINED_FUNCTION_7();
}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1A0A34000, v1, OS_LOG_TYPE_ERROR, "[ERROR] Failed to remove file at url: \"%@\" error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_3(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_obfuscatedPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v5, "[DEBUG] File is not busy anymore, it was not stale \"%@\", v6);

  OUTLINED_FUNCTION_7();
}

void __54__NSURL_FPFSHelpers__fp_coordinatedDeleteWithHandler___block_invoke_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_27_0();
  objc_msgSend(v1, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26_0(), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG] The file was modified after the coordination %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

void __70__NSURL_FPFSHelpers__fp_deleteAllowingCoordination_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] block failed with a permission error, let's try again after changing the file's permissions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __48__NSURL_FPAdditions__fp_makeWritableOnFD_error___block_invoke_cold_1(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  OUTLINED_FUNCTION_22(&dword_1A0A34000, a1, v3, "[CRIT] cannot fetch _SC_GETPW_R_SIZE_MAX: %{errno}d", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

void __48__NSURL_FPAdditions__fp_makeWritableOnFD_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_22(&dword_1A0A34000, v0, v1, "[CRIT] cannot resolve the mobile user: %{errno}d", v2);
  OUTLINED_FUNCTION_30();
}

void __110__NSURL_CopyFile__fp_copyToURL_queue_precomputedItemSize_replacePlaceholder_shouldCopyAppleDouble_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 240);
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 1024;
  v12 = v6;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] copyfile: %@ -> %@ AD-copy: %d", (uint8_t *)&v7, 0x1Cu);

  OUTLINED_FUNCTION_11_1();
}

@end
