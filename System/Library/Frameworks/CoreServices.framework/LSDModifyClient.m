@implementation LSDModifyClient

uint64_t __58___LSDModifyClient_setDatabaseIsSeeded_completionHandler___block_invoke(uint64_t a1)
{
  _LSServer_SetDatabaseIsSeeded(*(unsigned __int8 *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  FSNode *v17;
  __CFDictionary *v18;
  void *v19;
  id v20;
  id v21;
  __CFDictionary *v22;
  FSNode *v23;
  id v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;
  id v29;
  __CFDictionary *v30;
  FSNode *v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  CFTypeRef v38;
  char v39;
  CFTypeRef cf;
  _QWORD v41[3];
  int v42;
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "canRegisterURL:withOptions:", *(_QWORD *)(a1 + 48), *(unsigned int *)(v2 + 16)) & 1) != 0)
    {
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      v42 = 0;
      v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      v4 = *(id *)(a1 + 48);
      v5 = *(id *)(a1 + 56);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = *(void **)(a1 + 64);
      else
        v6 = 0;
      v17 = v6;
      cf = 0;
      v18 = _LSCreateRegistrationData(0, v3, v4, v17, (const __CFArray **)&cf);
      MEMORY[0x186DAF208](v18);
      _LSServer_DatabaseExecutionContext();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3321888768;
      v27[2] = __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke_2;
      v27[3] = &unk_1E103E0F8;
      v37 = v41;
      v20 = v3;
      v28 = v20;
      v21 = v5;
      v29 = v21;
      v22 = v18;
      v30 = v22;
      v23 = v17;
      v31 = v23;
      v24 = v4;
      v25 = *(_QWORD *)(a1 + 40);
      v32 = v24;
      v33 = v25;
      v34 = *(id *)(a1 + 72);
      v36 = *(id *)(a1 + 80);
      v39 = 0;
      v35 = *(id *)(a1 + 32);
      v38 = cf;
      if (cf)
        CFRetain(cf);
      -[LSDBExecutionContext performAsyncWrite:]((uint64_t)v19, v27);

      if (v38)
        CFRelease(v38);
      v38 = 0;

      if (cf)
        CFRelease(cf);

      _Block_object_dispose(v41, 8);
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 80);
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10819, (uint64_t)"-[_LSDModifyClient registerItemInfo:alias:diskImageAlias:bundleURL:installationPlist:completionHandler:]_block_invoke", 405, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v15 + 16))(v15, 0, 0, 0, 0, v16);

    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 80);
    v43 = *MEMORY[0x1E0CB2938];
    v44[0] = CFSTR("invalid LSRegistrationInfo");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient registerItemInfo:alias:diskImageAlias:bundleURL:installationPlist:completionHandler:]_block_invoke", 402, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v7 + 16))(v7, 0, 0, 0, 0, v9);

  }
  return MEMORY[0x186DAF214](v10, v11, v12, v13, v14);
}

void __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  _DWORD *v8;
  unsigned int *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFDictionary *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  char v25;
  CFTypeRef cf;
  uint64_t v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  cf = 0;
  v27 = 0;
  v25 = 0;
  v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
  if (v7)
    goto LABEL_2;
  v18 = *(void **)(a1 + 32);
  v19 = *(void **)(a1 + 40);
  v20 = *(void **)(a1 + 48);
  v21 = *(const __CFDictionary **)(a1 + 56);
  cf = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = _LSServer_RegisterItemInfo(v18, v19, v20, v21, (int *)&v27, (uint64_t)&v27 + 4, &v25, &cf);
  if (cf)
  {
    +[_LSCanOpenURLManager sharedManager](_LSCanOpenURLManager, "sharedManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "resetSchemeQueryLimitForApplicationWithIdentifier:", cf);

  }
  v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
  if (!v7)
  {
    _LSArmSaveTimer(5);
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
LABEL_20:
    if (!v7)
    {
      v8 = 0;
      goto LABEL_3;
    }
LABEL_2:
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v7, (uint64_t)"-[_LSDModifyClient registerItemInfo:alias:diskImageAlias:bundleURL:installationPlist:completionHandler:]_block_invoke", 489, 0);
    v8 = (_DWORD *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v9 = (unsigned int *)&v27 + 1;
    if (!*(_BYTE *)(a1 + 120))
      v9 = (unsigned int *)&v27;
    v10 = *v9;
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 64), "filePathURL");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
      v14 = *(unsigned int *)(*(_QWORD *)(a1 + 88) + 28);
      objc_msgSend(*(id *)(a1 + 72), "XPCConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "processIdentifier");
      *(_DWORD *)buf = 138413314;
      v29 = v12;
      v30 = 2048;
      v31 = v13;
      v32 = 2048;
      v33 = v14;
      v34 = 2048;
      v35 = v10;
      v36 = 1024;
      v37 = v16;
      _os_log_impl(&dword_182882000, v11, OS_LOG_TYPE_DEFAULT, "registered %@ (status %ld, old id 0x%llx) as unit 0x%llx on behalf of pid %d", buf, 0x30u);

    }
    v17 = (*(uint64_t (**)(_QWORD, BOOL, uint64_t, _QWORD, BOOL, _DWORD *))(*(_QWORD *)(a1 + 96) + 16))(*(_QWORD *)(a1 + 96), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) == 0, v10, *(_QWORD *)(a1 + 112), v25 != 0, v8);
    MEMORY[0x186DAF214](v17);
    goto LABEL_8;
  }
  if (v7 != -10675)
    goto LABEL_20;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) & 2) != 0)
  {
    v7 = -10675;
    goto LABEL_2;
  }
  _LSInstallLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(void **)(a1 + 64);
    *(_DWORD *)buf = 138412290;
    v29 = v24;
    _os_log_impl(&dword_182882000, v23, OS_LOG_TYPE_DEFAULT, "Retrying registration of %@ with trusted bit", buf, 0xCu);
  }

  v8 = (_DWORD *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v8[4] |= 2u;
  objc_msgSend(*(id *)(a1 + 72), "registerItemInfo:alias:diskImageAlias:bundleURL:installationPlist:completionHandler:", v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96));
LABEL_8:

  if (cf)
    CFRelease(cf);

}

void __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _LSDatabaseSentinelDecrement();

}

void __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _LSDServiceDomain *v7;
  void **v8;
  int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _LSDServiceDomain *v13;
  uint64_t v14;
  id v15;
  id v16;
  void **v17;
  id v18;
  char v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v20 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v17, v7, 0);

  if (!v8)
  {
    v12 = *(_QWORD *)(a1 + 32);
    +[_LSDServiceDomain defaultServiceDomain]();
    v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v17, v13, 0);

    if (v14)
      v11 = 0;
    else
      v11 = v20;
    (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v11);
    goto LABEL_9;
  }
  v9 = _LSUnregisterBundle(v8, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
  v10 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v9, (uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]_block_invoke_2", 579, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v11);
LABEL_9:

    goto LABEL_10;
  }
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v10 + 16))(v10, 1, 0);
LABEL_10:
  if (v17 && v19)
    _LSContextDestroy(v17);
  v15 = v18;
  v17 = 0;
  v18 = 0;

  v19 = 0;
  v16 = v20;
  v20 = 0;

}

void __59___LSDModifyClient_registerContainerURL_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = 0;
  v2 = FSNodeCreateWithURL(*(_QWORD *)(a1 + 32), 1, &v5);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v2, (uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]_block_invoke", 613, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    _LSContainerAddWithNode(0, v5, 0, *(void **)(a1 + 40));
  }
  MEMORY[0x186DAF214]();

}

void __58___LSDModifyClient_updateContainerUnit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _LSDServiceDomain *v7;
  void **v8;
  int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _LSDServiceDomain *v13;
  uint64_t v14;
  id v15;
  id v16;
  _BYTE v17[20];
  void **v18;
  id v19;
  char v20;
  id v21;

  v5 = a2;
  v6 = a3;
  v21 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v18, v7, 0);

  if (v8)
  {
    v9 = _LSUpdateContainerState(*v8, *(unsigned int *)(a1 + 40), (uint64_t)v17);
    v10 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v9, (uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]_block_invoke", 650, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, 20);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, _QWORD))(v10 + 16))(v10, v11, 0);
    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    +[_LSDServiceDomain defaultServiceDomain]();
    v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v18, v13, 0);

    if (v14)
      v11 = 0;
    else
      v11 = v21;
    (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v11);
  }

  if (v18 && v20)
    _LSContextDestroy(v18);
  v15 = v19;
  v18 = 0;
  v19 = 0;

  v20 = 0;
  v16 = v21;
  v21 = 0;

}

void __92___LSDModifyClient_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id v4;

  v2 = _LSRegisterExtensionPoint(0, 0, *(__CFString **)(a1 + 32), *(unsigned int *)(a1 + 64), *(const __CFDictionary **)(a1 + 40), *(void **)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 56);
  if (v2)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v2, (uint64_t)"-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]_block_invoke", 687, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 1, 0);
  }
}

void __101___LSDModifyClient_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id v4;

  v2 = _LSUnregisterExtensionPoint(0, *(const __CFString **)(a1 + 32), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(__CFString **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v2, (uint64_t)"-[_LSDModifyClient unregisterExtensionPoint:platform:withVersion:parentBundleUnit:completionHandler:]_block_invoke", 706, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 1, 0);
  }
}

void __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = -10822;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "XPCConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke_2;
  v10[3] = &unk_1E1043630;
  v11 = *(id *)(a1 + 32);
  v14 = *(_DWORD *)(a1 + 64);
  v5 = *(id *)(a1 + 48);
  v15 = *(_OWORD *)(a1 + 68);
  v16 = *(_OWORD *)(a1 + 84);
  v6 = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  _LSIfCanModifyDefaultHandler(0, v2, &v9, v4, v10);

  v7 = *(_QWORD *)(a1 + 56);
  if (v9)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v9, (uint64_t)"-[_LSDModifyClient setHandler:version:roles:forContentType:completionHandler:]_block_invoke", 751, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, 1, 0);
  }

}

uint64_t __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  LSContext *v3;
  const __CFString *v4;
  __int128 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  _OWORD v16[2];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int128 v29[2];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 56);
  v3 = *(LSContext **)(a1 + 32);
  v4 = *(const __CFString **)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 76);
  v29[0] = *(_OWORD *)(a1 + 60);
  v29[1] = v5;
  v6 = _LSServer_SetContentTypeHandler(v3, v2, v4, v29);
  _LSDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "XPCConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "processIdentifier");
    v10 = *(unsigned int *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13 = *(_OWORD *)(a1 + 76);
    v16[0] = *(_OWORD *)(a1 + 60);
    v16[1] = v13;
    _LSVersionNumberGetStringRepresentation(v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v18 = v9;
    v19 = 2114;
    v20 = v12;
    v21 = 2048;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v14;
    v27 = 2048;
    v28 = (int)v6;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "pid %ld setting handler for content type %{public}@ roles %lx to %@ v %@ -> %ld", buf, 0x3Eu);

  }
  return v6;
}

void __72___LSDModifyClient_removeHandlerForContentType_roles_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  int v12;
  int v13;

  v13 = -10822;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "XPCConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72___LSDModifyClient_removeHandlerForContentType_roles_completionHandler___block_invoke_2;
  v9[3] = &unk_1E1043680;
  v5 = *(id *)(a1 + 32);
  v12 = *(_DWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  _LSIfCanModifyDefaultHandler(0, v2, &v13, v4, v9);

  v7 = *(_QWORD *)(a1 + 48);
  if (v13)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v13, (uint64_t)"-[_LSDModifyClient removeHandlerForContentType:roles:completionHandler:]_block_invoke", 777, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v7 + 16))(*(_QWORD *)(a1 + 48), 1, 0);
  }

}

uint64_t __72___LSDModifyClient_removeHandlerForContentType_roles_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = _LSServer_RemoveContentTypeHandler(*(const __CFString **)(a1 + 32), *(unsigned int *)(a1 + 48));
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "XPCConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "processIdentifier");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(unsigned int *)(a1 + 48);
    v9 = 134218754;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    v13 = 2048;
    v14 = v7;
    v15 = 2048;
    v16 = (int)v2;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "pid %ld removing content type handler for %{public}@ roles %lx -> %ld", (uint8_t *)&v9, 0x2Au);

  }
  return v2;
}

void __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = -10822;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "XPCConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke_2;
  v11[3] = &unk_1E10436D0;
  v12 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 80);
  v15 = *(_OWORD *)(a1 + 64);
  v16 = v6;
  v7 = *(_QWORD *)(a1 + 40);
  v13 = v5;
  v14 = v7;
  _LSIfCanModifyDefaultHandler(v2, 0, &v10, v4, v11);

  v8 = *(_QWORD *)(a1 + 56);
  if (v10)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v10, (uint64_t)"-[_LSDModifyClient setHandler:version:forURLScheme:completionHandler:]_block_invoke", 805, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, 1, 0);
  }

}

uint64_t __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke_2(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  __int128 v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  _OWORD v14[2];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int128 v25[2];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(const __CFString **)(a1 + 32);
  v3 = *(const __CFString **)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 72);
  v25[0] = *(_OWORD *)(a1 + 56);
  v25[1] = v4;
  v5 = _LSServer_SetSchemeHandler(v2, v3, v25);
  _LSDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "XPCConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "processIdentifier");
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = *(_OWORD *)(a1 + 72);
    v14[0] = *(_OWORD *)(a1 + 56);
    v14[1] = v11;
    _LSVersionNumberGetStringRepresentation(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v16 = v8;
    v17 = 2114;
    v18 = v10;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v12;
    v23 = 2048;
    v24 = (int)v5;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "pid %ld setting handler for scheme %{public}@ to %@ v %@: %ld", buf, 0x34u);

  }
  return v5;
}

void __64___LSDModifyClient_removeHandlerForURLScheme_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  int v12;

  v12 = -10822;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "XPCConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64___LSDModifyClient_removeHandlerForURLScheme_completionHandler___block_invoke_2;
  v9[3] = &unk_1E1043720;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  _LSIfCanModifyDefaultHandler(v2, 0, &v12, v4, v9);

  v7 = *(_QWORD *)(a1 + 48);
  if (v12)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v12, (uint64_t)"-[_LSDModifyClient removeHandlerForURLScheme:completionHandler:]_block_invoke", 832, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v7 + 16))(*(_QWORD *)(a1 + 48), 1, 0);
  }

}

uint64_t __64___LSDModifyClient_removeHandlerForURLScheme_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = _LSServer_RemoveSchemeHandler(*(const __CFString **)(a1 + 32));
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "XPCConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "processIdentifier");
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 134218498;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2048;
    v13 = (int)v2;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "pid %ld removing handler for scheme %{public}@: %ld", (uint8_t *)&v8, 0x20u);

  }
  return v2;
}

void __59___LSDModifyClient_removeAllHandlersWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[7];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__22;
  v12 = __Block_byref_object_dispose__22;
  v13 = 0;
  v7 = -10822;
  objc_msgSend(*(id *)(a1 + 32), "XPCConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59___LSDModifyClient_removeAllHandlersWithCompletionHandler___block_invoke_210;
  v6[3] = &unk_1E1043770;
  v6[5] = &v14;
  v6[6] = &v8;
  v6[4] = *(_QWORD *)(a1 + 32);
  _LSIfCanModifyDefaultHandler(CFSTR("*"), CFSTR("*"), &v7, v3, v6);

  if (!*((_BYTE *)v15 + 24) && !v9[5])
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v7, (uint64_t)"-[_LSDModifyClient removeAllHandlersWithCompletionHandler:]_block_invoke", 859, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v9[5];
    v9[5] = v4;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

uint64_t __59___LSDModifyClient_removeAllHandlersWithCompletionHandler___block_invoke_210(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  id obj;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v2 + 40);
  v3 = _LSServer_RemoveAllHandlers(&obj);
  objc_storeStrong((id *)(v2 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v4 = 0;
  else
    v4 = _LSGetOSStatusFromNSError(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  _LSDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "XPCConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "processIdentifier");
    *(_DWORD *)buf = 134218240;
    v11 = v7;
    v12 = 2048;
    v13 = (int)v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "pid %ld removing ALL handlers: %ld", buf, 0x16u);

  }
  return v4;
}

void __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  LSApplicationRecord *v2;
  uint64_t v3;
  id *v4;
  LSApplicationRecord *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  char v8;
  id obj;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  _QWORD v16[3];
  char v17;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__22;
  v14 = __Block_byref_object_dispose__22;
  v15 = 0;
  v2 = [LSApplicationRecord alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (id *)(v11 + 5);
  obj = (id)v11[5];
  v5 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:](v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &obj);
  objc_storeStrong(v4, obj);
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke_2;
    v7[3] = &unk_1E1043798;
    v8 = *(_BYTE *)(a1 + 48);
    v7[4] = v16;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke_3;
    v6[3] = &unk_1E10437C0;
    v6[4] = &v10;
    -[LSRecord _ifAttached:else:](v5, "_ifAttached:else:", v7, v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(v16, 8);
}

void __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void **a2, uint64_t a3, unsigned int a4)
{
  _LSBundleSetSpecialApplicationTypes(*a2, a4, *(_BYTE *)(a1 + 40), 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  _LSDatabaseCommit((uint64_t)*a2);
  _LSArmSaveTimer(1);
}

void __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0CB2938];
  v7[0] = CFSTR("Unable to access the specified record in the LS database for an unknown reason. Please file a bug report.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10810, (uint64_t)"-[_LSDModifyClient relaxApplicationTypeRequirements:forBundleIdentifier:completionHandler:]_block_invoke_3", 911, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __58___LSDModifyClient_resetServerStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "XPCConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _LSCheckEntitlementForXPCConnection(v2, CFSTR("com.apple.private.coreservices.canresetserverstore"));

  if (v3)
  {
    _LSResetServer();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient resetServerStoreWithCompletionHandler:]_block_invoke", 938, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

  }
}

void __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int updated;
  uint64_t v10;
  void *v11;
  _LSDModificationPendingSaveToken *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__22;
  v26 = __Block_byref_object_dispose__22;
  v27 = 0;
  updated = _LSServer_UpdateDatabaseWithInfo(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, a6, a7, a8);
  if (updated)
  {
    v10 = *(_QWORD *)(a1 + 72);
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], updated, (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:returnSaveToken:completionHandler:]_block_invoke_2", 1015, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, v11);

  }
  else
  {
    if (*(_BYTE *)(a1 + 84))
    {
      v12 = -[_LSDModificationPendingSaveToken initWithUUID:]([_LSDModificationPendingSaveToken alloc], "initWithUUID:", *(_QWORD *)(a1 + 64));
      v13 = (void *)v23[5];
      v23[5] = (uint64_t)v12;

      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke_2;
      v19[3] = &unk_1E1043810;
      v20 = *(id *)(a1 + 32);
      v21 = &v22;
      v14 = (void *)MEMORY[0x186DAE9BC](v19);

    }
    else
    {
      v14 = 0;
    }
    _LSArmSaveTimerWithObserver(5, v14);
    if (*(_DWORD *)(a1 + 80))
    {
      +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", *(_QWORD *)(a1 + 32), 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(unsigned int *)(a1 + 80);
        v28[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sendNotification:forAppProxies:Plugins:completion:", v17, v18, 0, 0);

      }
    }

    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 1, v23[5], 0);
  }
  _Block_object_dispose(&v22, 8);

}

void __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _LSInstallLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v12 = 138412802;
    v13 = v8;
    v14 = 1024;
    v15 = a2;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "Save after update app record for bundle %@ attempted: %d save error: %@", (uint8_t *)&v12, 0x1Cu);
  }

  v9 = v6;
  v10 = v9;
  if ((a2 & 1) == 0)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 89, (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:returnSaveToken:completionHandler:]_block_invoke", 984, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "saveDidHappen:error:", v10 == 0, v10);

}

uint64_t __53___LSDModifyClient_synchronizeWithMobileInstallation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _LSDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "XPCConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = 67109120;
    v5[1] = objc_msgSend(v4, "processIdentifier");
    _os_log_error_impl(&dword_182882000, v2, OS_LOG_TYPE_ERROR, "Request to synchronize with MobileInstallation made by pid %d", (uint8_t *)v5, 8u);

  }
  _LSServer_SyncWithMobileInstallation(0);
  return MEMORY[0x186DAF214]();
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _LSDServiceDomain *v6;
  uint64_t v7;
  FSNode *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _LSDServiceDomain *v19;
  uint64_t v20;
  NSObject *p_super;
  void *v22;
  _LSDModificationPendingSaveToken *v23;
  _LSDModificationPendingSaveToken *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  id v44;
  FSNode *v45;
  id *v46;
  uint64_t v47;
  id obj;
  _QWORD v49[4];
  id v50;
  _LSDModificationPendingSaveToken *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t, uint64_t);
  void *v59;
  uint64_t *v60;
  id *v61;
  int v62;
  NSObject *v63;
  id v64;
  int v65;
  void **v66;
  id v67;
  char v68;
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  char v76[16];
  uint64_t v77;
  const __CFString *v78;
  _BYTE v79[24];
  void *v80;
  _BYTE v81[128];
  uint64_t v82;
  const __CFString *v83;
  char v84[16];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v43 = a2;
  v44 = a3;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__22;
  v74 = __Block_byref_object_dispose__22;
  v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = 0;
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke", 1137, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v69 = 0;
  v66 = 0;
  v67 = 0;
  v68 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v47 = a1;
  v46 = (id *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v66, v6, 0);

  v7 = a1;
  if (!*(_QWORD *)(a1 + 32) || !v46)
    goto LABEL_28;
  v65 = 0;
  v8 = [FSNode alloc];
  v9 = *(_QWORD *)(a1 + 32);
  v64 = v5;
  v45 = -[FSNode initWithURL:flags:error:](v8, "initWithURL:flags:error:", v9, 8, &v64);
  v41 = v64;

  if (!v45)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v19 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v20 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v66, v19, 0);

    if (v20)
      v5 = 0;
    else
      v5 = v69;
    v17 = v41;
    goto LABEL_23;
  }
  v63 = v41;
  _LSContainerFindOrRegisterWithNode(v46, v45, 0, &v65, 0, 0, &v63);
  v10 = v63;

  v42 = v10;
  if (v10)
  {
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_4(v12, (uint64_t)v84, v11);
    }

  }
  +[FSNode rootVolumeNode](FSNode, "rootVolumeNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FSNode isEqual:](v45, "isEqual:", v13))
    goto LABEL_16;
  +[FSNode systemDataVolumeNode](FSNode, "systemDataVolumeNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FSNode isEqual:](v45, "isEqual:", v14))
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  +[FSNode prebootVolumeNode](FSNode, "prebootVolumeNode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FSNode isEqual:](v45, "isEqual:", v15))
  {

    goto LABEL_15;
  }
  +[FSNode userDataVolumeNode](FSNode, "userDataVolumeNode");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[FSNode isEqual:](v45, "isEqual:", v28);

  if (v29)
  {
LABEL_17:
    v82 = *MEMORY[0x1E0CB2938];
    v83 = CFSTR("Mount point was root/nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -46, (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke", 1156, v16);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    _LSDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_2(v18, (uint64_t)v79, v17);
    }
    goto LABEL_23;
  }
  if (v65)
  {
    v56 = MEMORY[0x1E0C809B0];
    v57 = 3221225472;
    v58 = __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_240;
    v59 = &unk_1E1043860;
    v62 = v65;
    v60 = &v70;
    v61 = v46;
    _CSStoreEnumerateUnits();
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = (id)v71[5];
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v81, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v53 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "appState");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isPlaceholder");
          v80 = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
            v38 = 9;
          else
            v38 = 8;
          objc_msgSend(v34, "sendNotification:forAppProxies:Plugins:completion:", v38, v37, 0, 0);

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v81, 16);
      }
      while (v30);
    }

    _LSContainerRemove((uint64_t *)v46, v65);
    if (!v42)
    {
      v5 = 0;
      p_super = &v45->super;
LABEL_26:

      goto LABEL_27;
    }
    _LSDefaultLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(v47 + 32), "absoluteString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_3(v40, (uint64_t)v42, (uint64_t)v79, v39);
    }

    v5 = v42;
LABEL_24:
    _LSDefaultLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(v47 + 32), "absoluteString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_1(v22, (uint64_t)v76, p_super);
    }
    goto LABEL_26;
  }
  v77 = *MEMORY[0x1E0CB2938];
  v78 = CFSTR("Container could not be resolved");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
  v17 = objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke", 1179, v17);
  v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
  if (v5)
    goto LABEL_24;
LABEL_27:
  v7 = v47;
LABEL_28:
  if (v5)
  {
    v23 = 0;
  }
  else
  {
    v24 = -[_LSDModificationPendingSaveToken initWithUUID:]([_LSDModificationPendingSaveToken alloc], "initWithUUID:", *(_QWORD *)(v7 + 40));
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_244;
    v49[3] = &unk_1E1043888;
    v50 = *(id *)(v7 + 32);
    v23 = v24;
    v51 = v23;
    v25 = (void *)MEMORY[0x186DAE9BC](v49);
    _LSArmSaveTimerWithObserver(1, v25);

    v7 = v47;
  }
  _LSDatabaseSentinelDecrement();
  if (!v23)
    _LSDatabaseSentinelFlush();
  (*(void (**)(void))(*(_QWORD *)(v7 + 56) + 16))();

  if (v66 && v68)
    _LSContextDestroy(v66);
  v26 = v67;
  v66 = 0;
  v67 = 0;

  v68 = 0;
  v27 = v69;
  v69 = 0;

  _Block_object_dispose(&v70, 8);
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (*(_DWORD *)(a3 + 4) == *(_DWORD *)(a1 + 48))
  {
    +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:](LSApplicationProxy, "applicationProxyWithBundleUnitID:withContext:", a2, *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:");

  }
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_244(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _LSInstallLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v8;
    v14 = 1024;
    v15 = a2;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "Save after unregistering mount point: %@ attempted: %d error: %@", (uint8_t *)&v12, 0x1Cu);

  }
  v9 = v6;
  v10 = v9;
  if ((a2 & 1) == 0)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 89, (uint64_t)"-[_LSDModifyClient unregisterApplicationsAtMountPoint:operationUUID:reply:]_block_invoke", 1201, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_msgSend(*(id *)(a1 + 40), "saveDidHappen:error:", v10 == 0, v10);

}

void __53___LSDModifyClient_unregisterApplicationAtURL_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  id v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = 0;
  v20 = 0;
  v18 = 0;
  v17 = 0;
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = _LSContextInit(&v20);
    if (!v7)
    {
      v7 = FSNodeCreateWithURL(*(_QWORD *)(a1 + 32), 0, &v19);
      if (!v7)
      {
        v7 = _LSBundleFindWithNode((uint64_t)&v20, v19, &v18, &v17);
        if (!v7)
        {
          if (*(_DWORD *)(v17 + 12))
          {
            v8 = (void *)_CSStringCopyCFString();
            if (v8)
            {
              +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:](LSApplicationProxy, "applicationProxyWithBundleUnitID:withContext:", v18, &v20);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = _LSUnregisterAppWithBundleIDUsingContext(v8, 0, &v20, 0);
              v9 = v7 == 0;
              +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "appState");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "isPlaceholder");
              v21[0] = v16;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
                v14 = 9;
              else
                v14 = 8;
              objc_msgSend(v10, "sendNotification:forAppProxies:Plugins:completion:", v14, v13, 0, 0);

              CFRelease(v8);
              goto LABEL_13;
            }
          }
          v7 = 0;
        }
      }
      v9 = 0;
LABEL_13:
      _LSContextDestroy(&v20);
      goto LABEL_14;
    }
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v7 = -50;
  }
LABEL_14:
  _LSDatabaseSentinelDecrement();
  if (!v9)
    _LSDatabaseSentinelFlush();
  if (v7)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v7, (uint64_t)"-[_LSDModifyClient unregisterApplicationAtURL:reply:]_block_invoke", 1273, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  const __CFString *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "XPCConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _LSCheckEntitlementForXPCConnection(v3, CFSTR("com.apple.lsapplicationworkspace.rebuildappdatabases"));

  if (v4)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke_2;
    v13[3] = &unk_1E103FE08;
    v5 = *(void **)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    _LSServer_RefreshContentInFrameworkAtURL(v5, v13);
    v6 = v14;
  }
  else
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "XPCConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v11;
      v19 = 1024;
      v20 = objc_msgSend(v12, "processIdentifier");
      _os_log_error_impl(&dword_182882000, v7, OS_LOG_TYPE_ERROR, "Unentitled request to refresh plugins in framework %@ by pid %d", buf, 0x12u);

    }
    v8 = *(_QWORD *)(a1 + 48);
    if (CFSTR("com.apple.lsapplicationworkspace.rebuildappdatabases"))
      v9 = CFSTR("com.apple.lsapplicationworkspace.rebuildappdatabases");
    else
      v9 = CFSTR("unknown entitlement");
    v15 = *MEMORY[0x1E0CB2938];
    v16 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient refreshContentInFrameworkAtURL:reply:]_block_invoke", 1290, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);

  }
}

uint64_t __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64___LSDModifyClient_garbageCollectDatabaseWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _LSDServiceDomain *v7;
  uint64_t v8;
  uint64_t v9;
  _LSDServiceDomain *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void **v15;
  id v16;
  char v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v18 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v15, v7, 0);

  if (v8)
  {
    if (_CSStoreGarbageCollect())
      _LSArmSaveTimer(1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    +[_LSDServiceDomain defaultServiceDomain]();
    v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v15, v10, 0);

    if (v11)
      v12 = 0;
    else
      v12 = v18;
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v12);

  }
  if (v15 && v17)
    _LSContextDestroy(v15);
  v13 = v16;
  v15 = 0;
  v16 = 0;

  v17 = 0;
  v14 = v18;
  v18 = 0;

}

void __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _LSDServiceDomain *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _LSDServiceDomain *v13;
  uint64_t v14;
  id v15;
  void **v16;
  id v17;
  char v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v7, 0);

  if (v8)
  {
    v9 = (id)objc_msgSend(*(id *)(a1 + 32), "bundleIdentifierWithContext:error:", v8, 0);
  }
  else
  {
    _LSDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v16, v13, 0);

      if (v14)
        v15 = 0;
      else
        v15 = v19;
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_log_error_impl(&dword_182882000, v10, OS_LOG_TYPE_ERROR, "Unexpected error talking to LS database while setting preference value: %{public}@", buf, 0xCu);

    }
  }
  if (v16 && v18)
    _LSContextDestroy(v16);
  v11 = v17;
  v16 = 0;
  v17 = 0;

  v18 = 0;
  v12 = v19;
  v19 = 0;

}

void __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke_251(LaunchServices::PrefsStorage *a1)
{
  uint64_t Shared;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  id obj;

  Shared = LaunchServices::PrefsStorage::GetShared(a1);
  v3 = (void *)*((_QWORD *)a1 + 4);
  v4 = (void *)*((_QWORD *)a1 + 5);
  v5 = (void *)*((_QWORD *)a1 + 6);
  v6 = *(_QWORD *)(*((_QWORD *)a1 + 8) + 8);
  obj = *(id *)(v6 + 40);
  v7 = LaunchServices::PrefsStorage::setValueForNode(Shared, v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)a1 + 7) + 8) + 24) = v7;
}

void __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _LSDServiceDomain *v7;
  uint64_t v8;
  LaunchServices::PrefsStorage *v9;
  uint64_t Shared;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  _LSDServiceDomain *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id obj;
  int v30;
  void **v31;
  id v32;
  char v33;
  id v34;

  v5 = a2;
  v6 = a3;
  v34 = 0;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v31, v7, 0);

  if (!v8)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v17 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v31, v16, 0);

    if (v17)
      v18 = 0;
    else
      v18 = v34;
    _LSDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_1((uint64_t)v18, v24, v25);

    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v23 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v18;
    goto LABEL_13;
  }
  v30 = 0;
  v9 = (LaunchServices::PrefsStorage *)_LSBundleFindWithNode(v8, *(void **)(a1 + 32), &v30, 0);
  if (!v30)
  {
    _LSDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_2((uint64_t *)(a1 + 32), v19, v20);

    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -600, (uint64_t)"-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]_block_invoke", 1427, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;
LABEL_13:

    goto LABEL_14;
  }
  Shared = LaunchServices::PrefsStorage::GetShared(v9);
  v12 = *(void **)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v13 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v14 + 40);
  v15 = LaunchServices::PrefsStorage::setValueForNode(Shared, v11, v12, v13, &obj);
  objc_storeStrong((id *)(v14 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v15;
LABEL_14:
  if (v31 && v33)
    _LSContextDestroy(v31);
  v27 = v32;
  v31 = 0;
  v32 = 0;

  v33 = 0;
  v28 = v34;
  v34 = 0;

}

uint64_t __71___LSDModifyClient_performShimmedInstallOfArtifact_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

uint64_t __90___LSDModifyClient_performShimmedUninstallOfApplicationWithIdentifier_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

void __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  LSMIResultRegistrant *v12;
  LSMIRegistrantServerStrategy *v13;
  LSMIResultRegistrant *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  _LSGetCollapsedMIDictionaryForAppAndContentsDictionaries(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    _LSDatabaseGetInstallingGroup();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v3);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_2;
    v20[3] = &unk_1E1043950;
    v21 = *(id *)(a1 + 64);
    v4 = (void *)MEMORY[0x186DAE9BC](v20);
    objc_msgSend(v2, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSInstallLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "XPCConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "processIdentifier");
      *(_DWORD *)buf = 138412802;
      v25 = v7;
      v26 = 2112;
      v27 = v9;
      v28 = 1024;
      v29 = v11;
      _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "Post installation registration: request to register %@, operation %@, from pid %d", buf, 0x1Cu);

    }
    v12 = [LSMIResultRegistrant alloc];
    v13 = objc_alloc_init(LSMIRegistrantServerStrategy);
    v14 = -[LSMIResultRegistrant initWithContext:operationUUID:itemInfoDict:personas:](v12, "initWithContext:operationUUID:itemInfoDict:personas:", v13, *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 56));

    -[LSMIResultRegistrant runWithCompletion:](v14, "runWithCompletion:", v4);
    v15 = v21;
  }
  else
  {
    _LSInstallLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_cold_1(v16);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zu items were provided to be registered; exactly 1 must be specified"),
      objc_msgSend(v2, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 64);
    v22 = *MEMORY[0x1E0CB2938];
    v23 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient performPostInstallationRegistration:personaUniqueStrings:operationUUID:reply:]_block_invoke", 1526, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v17 + 16))(v17, 0, 0, v19);

  }
}

void __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  _LSDatabaseGetInstallingGroup();
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  LSMIResultUnregistrant *v4;
  LSMIRegistrantServerStrategy *v5;
  LSMIResultUnregistrant *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _LSDatabaseGetInstallingGroup();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v2);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke_2;
  v13[3] = &unk_1E10439A0;
  v14 = *(id *)(a1 + 64);
  v3 = (void *)MEMORY[0x186DAE9BC](v13);
  v4 = [LSMIResultUnregistrant alloc];
  v5 = objc_alloc_init(LSMIRegistrantServerStrategy);
  v6 = -[LSMIResultUnregistrant initWithContext:operationUUID:bundleIdentifier:precondition:type:](v4, "initWithContext:operationUUID:bundleIdentifier:precondition:type:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 72));

  _LSInstallLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(unsigned int *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 56), "XPCConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "processIdentifier");
    *(_DWORD *)buf = 138413058;
    v16 = v9;
    v17 = 2112;
    v18 = v8;
    v19 = 2048;
    v20 = v10;
    v21 = 1024;
    v22 = v12;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "Post uninstallation unregistration: request to unregister %@, operation %@, type %lx from pid %d", buf, 0x26u);

  }
  -[LSMIResultUnregistrant runWithCompletion:](v6, "runWithCompletion:", v3);

}

void __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  _LSDatabaseGetInstallingGroup();
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97___LSDModifyClient_performUpdateOfPersonasOfBundleID_toPersonaUniqueStrings_operationUUID_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _LSDServiceDomain *v7;
  _QWORD *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  LSBundleRecordUpdater *v15;
  LSBundleRecordUpdater *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  id v21;
  _LSDServiceDomain *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  LSBundleRecordUpdater *v26;
  LSBundleRecordUpdater *v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  _BOOL4 v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _LSDModificationPendingSaveToken *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id obj;
  id v54;
  uint64_t v55;
  unsigned int v56;
  id v57;
  uint64_t v58;
  unsigned int v59;
  void **v60;
  id v61;
  char v62;
  id v63;
  void *v64;
  _OWORD v65[2];
  _OWORD v66[2];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v63 = 0;
  v60 = 0;
  v61 = 0;
  v62 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v60, v7, 0);

  if (!v8)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v22 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v23 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v60, v22, 0);

    if (v23)
      v24 = 0;
    else
      v24 = v63;
    v43 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v44 = *(void **)(v43 + 40);
    *(_QWORD *)(v43 + 40) = v24;

    goto LABEL_25;
  }
  v59 = 0;
  v58 = 0;
  v9 = *(void **)(a1 + 32);
  memset(v66, 0, sizeof(v66));
  v57 = 0;
  v10 = _LSBundleFindWithInfoAndNo_IOFilter((uint64_t)v8, 0, v9, 0, v66, 2, 128, 0, 0, &v59, &v58, &v57);
  v11 = v57;
  v56 = 0;
  v54 = v11;
  v55 = 0;
  v12 = *(void **)(a1 + 32);
  memset(v65, 0, sizeof(v65));
  v13 = _LSBundleFindWithInfoAndNo_IOFilter((uint64_t)v8, 0, v12, 0, v65, 2, 1152, 0, 0, &v56, &v55, &v54);
  v14 = v54;

  if (!v10)
  {
    if (!v13)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[_LSDModifyClient performUpdateOfPersonasOfBundleID:toPersonaUniqueStrings:operationUUID:reply:]_block_invoke", 1623, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    v20 = 0;
    goto LABEL_12;
  }
  v15 = [LSBundleRecordUpdater alloc];
  v16 = -[LSBundleRecordUpdater initWithDatabase:bundleUnit:bundleData:](v15, "initWithDatabase:bundleUnit:bundleData:", *v8, v59, v58);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v18 + 40);
  v19 = -[LSBundleRecordUpdater parsePersonas:error:](v16, "parsePersonas:error:", v17, &obj);
  objc_storeStrong((id *)(v18 + 40), obj);
  if (v19)
  {
    v52 = v14;
    v20 = -[LSBundleRecordUpdater updateBundleRecord:](v16, "updateBundleRecord:", &v52);
    v21 = v52;

    v14 = v21;
  }
  else
  {
    v20 = 0;
  }

  if (v13)
  {
LABEL_12:
    v26 = [LSBundleRecordUpdater alloc];
    v27 = -[LSBundleRecordUpdater initWithDatabase:bundleUnit:bundleData:](v26, "initWithDatabase:bundleUnit:bundleData:", *v8, v56, v55);
    v28 = *(_QWORD *)(a1 + 40);
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v51 = *(id *)(v29 + 40);
    v30 = -[LSBundleRecordUpdater parsePersonas:error:](v27, "parsePersonas:error:", v28, &v51);
    objc_storeStrong((id *)(v29 + 40), v51);
    if (v30)
    {
      v50 = v14;
      v31 = -[LSBundleRecordUpdater updateBundleRecord:](v27, "updateBundleRecord:", &v50);
      v32 = v50;

      v14 = v32;
    }
    else
    {
      v31 = 0;
    }

    goto LABEL_17;
  }
  v31 = 0;
LABEL_17:
  if (!v20 && v10 || !v31 && v13)
  {
    v25 = (uint64_t)v14;
    goto LABEL_22;
  }
  +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", *(_QWORD *)(a1 + 32));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "detach");
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sendNotification:forAppProxies:Plugins:completion:", 14, v35, 1, 0);

  v36 = -[_LSDModificationPendingSaveToken initWithUUID:]([_LSDModificationPendingSaveToken alloc], "initWithUUID:", *(_QWORD *)(a1 + 48));
  v37 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v38 = *(void **)(v37 + 40);
  *(_QWORD *)(v37 + 40) = v36;

  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __97___LSDModifyClient_performUpdateOfPersonasOfBundleID_toPersonaUniqueStrings_operationUUID_reply___block_invoke_2;
  v47[3] = &unk_1E1043810;
  v39 = *(id *)(a1 + 32);
  v40 = *(_QWORD *)(a1 + 64);
  v48 = v39;
  v49 = v40;
  _LSArmSaveTimerWithObserver(1, v47);

  v25 = 0;
  v14 = v33;
LABEL_20:

LABEL_22:
  v41 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v42 = *(void **)(v41 + 40);
  *(_QWORD *)(v41 + 40) = v25;

LABEL_25:
  if (v60 && v62)
    _LSContextDestroy(v60);
  v45 = v61;
  v60 = 0;
  v61 = 0;

  v62 = 0;
  v46 = v63;
  v63 = 0;

}

void __97___LSDModifyClient_performUpdateOfPersonasOfBundleID_toPersonaUniqueStrings_operationUUID_reply___block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _LSInstallLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v12 = 138412802;
    v13 = v8;
    v14 = 1024;
    v15 = a2;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "Save after update personas for bundle %@ attempted: %d save error: %@", (uint8_t *)&v12, 0x1Cu);
  }

  v9 = v6;
  v10 = v9;
  if ((a2 & 1) == 0)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 89, (uint64_t)"-[_LSDModifyClient performUpdateOfPersonasOfBundleID:toPersonaUniqueStrings:operationUUID:reply:]_block_invoke", 1641, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "saveDidHappen:error:", v10 == 0, v10);

}

uint64_t __54___LSDModifyClient_forceSaveForTestingWithCompletion___block_invoke(uint64_t a1)
{
  _LSSaveImmediately(3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_182882000, a3, (uint64_t)a3, "Couldn't create node for mount point: %@ ", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_2();
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_182882000, a3, (uint64_t)a3, "Tried to deregister root / nil mount point: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_2();
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_3(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_0(&dword_182882000, a4, a3, "Failed to deregister applications at mount point: %@ error: %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_3_2();
}

void __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_182882000, a3, (uint64_t)a3, "Mount point: %@ could not be resolved", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_2();
}

void __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136446466;
  v4 = "-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]_block_invoke";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_4_0(&dword_182882000, a2, a3, "could not get database in %{public}s: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5(&dword_182882000, a2, a3, "self-setting preference value: could not find record for %@ in the database", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "wrong number of items provided for registration, rejecting", v1, 2u);
}

@end
