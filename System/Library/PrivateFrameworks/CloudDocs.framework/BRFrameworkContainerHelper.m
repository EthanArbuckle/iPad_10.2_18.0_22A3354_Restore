@implementation BRFrameworkContainerHelper

uint64_t __67__BRFrameworkContainerHelper_fetchContainerForMangledID_personaID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

void __42__BRFrameworkContainerHelper_sharedHelper__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedHelper_instance;
  sharedHelper_instance = v0;

}

- (id)fetchContainerForMangledID:(id)a3 personaID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = a4;
    +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "newSyncProxy");

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__BRFrameworkContainerHelper_fetchContainerForMangledID_personaID___block_invoke;
    v19[3] = &unk_1E3DA7090;
    v9 = v8;
    v20 = v9;
    objc_msgSend(v9, "getContainerForMangledID:personaID:reply:", v5, v6, v19);

    objc_msgSend(v9, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "error");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v9, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "br_isCloudDocsErrorCode:", 2);

      if ((v14 & 1) == 0)
      {
        brc_bread_crumbs((uint64_t)"-[BRFrameworkContainerHelper fetchContainerForMangledID:personaID:]", 3033);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
        {
          objc_msgSend(v9, "error");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v22 = v5;
          v23 = 2112;
          v24 = v18;
          v25 = 2112;
          v26 = v15;
          _os_log_error_impl(&dword_19CBF0000, v16, (os_log_type_t)0x90u, "[ERROR] Failed getting container for MangledID: %@, error: %@%@", buf, 0x20u);

        }
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)sharedHelper
{
  if (sharedHelper_onceToken != -1)
    dispatch_once(&sharedHelper_onceToken, &__block_literal_global_510);
  return (id)sharedHelper_instance;
}

- (id)fetchAllContainersByIDWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newSyncProxy");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__BRFrameworkContainerHelper_fetchAllContainersByIDWithError___block_invoke;
  v10[3] = &unk_1E3DA5410;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "getContainersByID:", v10);
  if (a3)
  {
    objc_msgSend(v6, "error");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __62__BRFrameworkContainerHelper_fetchAllContainersByIDWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

- (void)_resolveItemIdentifierAtURL:(id)a3 withHandler:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, uint64_t, uint64_t);
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
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

  v5 = a3;
  v6 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__9;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  v7 = dispatch_semaphore_create(0);
  v8 = (void *)MEMORY[0x1E0CAAD20];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__BRFrameworkContainerHelper__resolveItemIdentifierAtURL_withHandler___block_invoke;
  v10[3] = &unk_1E3DA5128;
  v12 = &v15;
  v13 = &v27;
  v14 = &v21;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "getIdentifierForUserVisibleFileAtURL:completionHandler:", v5, v10);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v6[2](v6, v28[5], v22[5], v16[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

void __70__BRFrameworkContainerHelper__resolveItemIdentifierAtURL_withHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  v15 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v11 = v7;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unsigned)br_capabilityToMoveFromURL:(id)a3 toNewParent:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  unsigned __int16 v21;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, void *);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__9;
  v41 = __Block_byref_object_dispose__9;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  if (BRIsFPFSEnabled(v9, v10))
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke;
    v29[3] = &unk_1E3DA70E0;
    v31 = &v33;
    v30 = v8;
    v32 = &v37;
    -[BRFrameworkContainerHelper _resolveItemIdentifierAtURL:withHandler:](self, "_resolveItemIdentifierAtURL:withHandler:", v9, v29);
    v11 = v30;
  }
  else
  {
    +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "newLegacySyncProxy");

    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke_3;
    v27 = &unk_1E3DA7108;
    v11 = v13;
    v28 = v11;
    objc_msgSend(v11, "capabilityWhenTryingToReparentItemAtURL:toNewParent:reply:", v8, v9, &v24);
    objc_msgSend(v11, "result", v24, v25, v26, v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "longValue");
    *((_WORD *)v34 + 12) = v15;

    objc_msgSend(v11, "error");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v38[5];
    v38[5] = v16;

  }
  v18 = (id)v38[5];
  if (v18)
  {
    brc_bread_crumbs((uint64_t)"-[BRFrameworkContainerHelper br_capabilityToMoveFromURL:toNewParent:error:]", 3084);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      v23 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v44 = "-[BRFrameworkContainerHelper br_capabilityToMoveFromURL:toNewParent:error:]";
      v45 = 2080;
      if (!a5)
        v23 = "(ignored by caller)";
      v46 = v23;
      v47 = 2112;
      v48 = v18;
      v49 = 2112;
      v50 = v19;
      _os_log_error_impl(&dword_19CBF0000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a5)
    *a5 = objc_retainAutorelease(v18);

  v21 = *((_WORD *)v34 + 12);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v21;
}

void __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  int8x16_t v11;

  if (a4)
  {
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 8;
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = a3;
    v8 = a2;
    objc_msgSend(v6, "_br_itemServiceSyncProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke_2;
    v10[3] = &unk_1E3DA70B8;
    v11 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    objc_msgSend(v9, "capabilityWhenTryingToReparentToNewParent:domain:reply:", v8, v7, v10);

  }
}

void __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke_2(uint64_t a1, __int16 a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

void __75__BRFrameworkContainerHelper_br_capabilityToMoveFromURL_toNewParent_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedShort:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjResult:error:", v7, v6);

}

- (id)itemIDForURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a3, "_br_getAttributeValue:withSecondaryConnection:withError:", CFSTR("BRURLUbiquitousItemIdentifierKey"), 0, a4);
}

@end
