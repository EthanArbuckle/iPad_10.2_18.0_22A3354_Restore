@implementation LSMIResultRegistrant

- (LSMIResultRegistrant)initWithContext:(id)a3 operationUUID:(id)a4 itemInfoDict:(id)a5 personas:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LSMIResultRegistrant *v15;
  LSMIResultRegistrant *v16;
  uint64_t v17;
  NSDictionary *miDict;
  uint64_t v19;
  NSSet *personas;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)LSMIResultRegistrant;
  v15 = -[LSMIResultRegistrant init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_strategy, a3);
    objc_storeStrong((id *)&v16->_uuid, a4);
    v17 = objc_msgSend(v13, "copy");
    miDict = v16->_miDict;
    v16->_miDict = (NSDictionary *)v17;

    v19 = objc_msgSend(v14, "copy");
    personas = v16->_personas;
    v16->_personas = (NSSet *)v19;

  }
  return v16;
}

- (void)_replyWithError:(id)a3 onQueue:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__LSMIResultRegistrant__replyWithError_onQueue_block___block_invoke;
  v11[3] = &unk_1E1045628;
  v12 = v7;
  v13 = v8;
  v9 = v7;
  v10 = v8;
  dispatch_async((dispatch_queue_t)a4, v11);

}

uint64_t __54__LSMIResultRegistrant__replyWithError_onQueue_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)runPostProcessingForBundleID:(id)a3 success:(BOOL)a4 isSystemApp:(BOOL)a5 isPlaceholder:(BOOL)a6 registeredBothFullAppAndPlaceholder:(BOOL)a7 notificationJournaller:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v21[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a8;
  if (v12)
  {
    if (v11)
    {
      +[LSApplicationRestrictionsManager sharedInstance]();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[LSApplicationRestrictionsManager setApplication:removed:]((uint64_t)v15, v13, 0);

      if ((v16 & 1) != 0)
        _LSNoteSystemAppInstallOrUninstall((uint64_t)v13, 1u);
    }
    if (v10)
      v17 = 1;
    else
      v17 = 7;
    if (v9)
      v18 = 15;
    else
      v18 = v17;
    if (!v10)
    {
      +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "installationEndedForApplication:withState:", v13, 5);

    }
  }
  else
  {
    v18 = 11;
  }
  v21[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendNotification:forApps:withPlugins:", v18, v20, 0);

  objc_msgSend(v14, "writeFinalJournal");
  objc_msgSend(v14, "removeJournalAfterNotificationFence");

}

- (void)runWithCompletion:(id)a3
{
  NSDictionary *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v20;
  FSNode *v21;
  id v22;
  FSNode *v23;
  FSNode *v24;
  FSNode *v25;
  LSMIResultRegistrantStrategy *strategy;
  FSNode *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  NSDictionary *v36;
  FSNode *v37;
  LSMIResultRegistrant *v38;
  id v39;
  FSNode *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  char v45;
  BOOL v46;
  id v47;
  id v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v4 = self->_miDict;
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("Path"));
  v6 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v6;
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("ParallelPlaceholderPath"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("ApplicationType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = CFSTR("No bundle identifier provided. ");
    if (v5)
      v8 = &stru_1E10473A0;
    v9 = v8;
    v10 = v9;
    if (v6)
      v11 = &stru_1E10473A0;
    else
      v11 = CFSTR("No path provided.");
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v49 = *MEMORY[0x1E0CB2938];
    v50[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v12;
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[LSMIResultRegistrant runWithCompletion:]", 182, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, void *))v32 + 2))(v32, 0, 0, v14);
  }
  else
  {
    -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("ParallelPlaceholderPath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != 0;

    if (v15)
    {
      v17 = 1;
    }
    else
    {
      -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("IsPlaceholder"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v18, "BOOLValue");

    }
    -[LSMIResultRegistrantStrategy notificationJournallerForBundleIdentifier:registeringPlaceholder:](self->_strategy, "notificationJournallerForBundleIdentifier:registeringPlaceholder:", v5, v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v6, 1);
    if (v33)
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v33);
    else
      v28 = 0;
    v48 = 0;
    v27 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v14, 0, &v48);
    v19 = v16;
    v20 = v48;
    if (v28)
    {
      v47 = v20;
      v21 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v28, 0, &v47);
      v22 = v47;

      v20 = v22;
    }
    else
    {
      v21 = 0;
    }
    if (v27 && (!v33 || v21))
    {
      if (v21)
        v23 = v21;
      else
        v23 = v27;
      v24 = v23;
      -[LSMIResultRegistrantStrategy beginModificationOperation](self->_strategy, "beginModificationOperation");
      strategy = self->_strategy;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __42__LSMIResultRegistrant_runWithCompletion___block_invoke;
      v34[3] = &unk_1E10456A0;
      v35 = v5;
      v36 = v4;
      v45 = v17;
      v46 = v19;
      v37 = v27;
      v38 = self;
      v39 = v33;
      v25 = v24;
      v40 = v25;
      v41 = v20;
      v42 = v30;
      v43 = v29;
      v44 = v32;
      -[LSMIResultRegistrantStrategy runSyncBlockInWriteContext:](strategy, "runSyncBlockInWriteContext:", v34);

    }
    else
    {
      -[LSMIResultRegistrant runPostProcessingForBundleID:success:isSystemApp:isPlaceholder:registeredBothFullAppAndPlaceholder:notificationJournaller:](self, "runPostProcessingForBundleID:success:isSystemApp:isPlaceholder:registeredBothFullAppAndPlaceholder:notificationJournaller:", v5, 0, objc_msgSend(v30, "isEqualToString:", CFSTR("System")), v17, 0, v29);
      (*((void (**)(id, _QWORD, _QWORD, id))v32 + 2))(v32, 0, 0, v20);
    }

  }
}

void __42__LSMIResultRegistrant_runWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  LSRecordPromise *v10;
  void *v11;
  unint64_t v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _LSDModificationPendingSaveToken *v30;
  char v31;
  _LSDModificationPendingSaveToken *v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  id v40;
  char v41;
  BOOL v42;
  _QWORD v43[4];
  _LSDModificationPendingSaveToken *v44;
  int v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void **v51;
  id v52;
  char v53;
  id v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _LSLogStepStart(4, 0, *(NSString **)(a1 + 32), CFSTR("Registering bundles via registrant - start"));
  v54 = 0;
  v51 = 0;
  v52 = 0;
  v53 = 0;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v50 = 0;
  objc_msgSend(v3, "databaseContextWithError:", &v50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v50;
  if (!v5)
  {
    v8 = 0;
    LODWORD(v9) = 0;
    v10 = 0;
    goto LABEL_32;
  }
  if (!*(_BYTE *)(a1 + 112))
    goto LABEL_23;
  if (*(_BYTE *)(a1 + 113))
  {
    if ((objc_msgSend(v5, "fullBundleExistsForIdentifier:matchingNode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48)) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      _LSInstallLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v56 = v15;
        _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "%@ registration is for parallel placeholder but full app is not registered; registering it",
          buf,
          0xCu);
      }

      v17 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 32);
      v49 = v6;
      v7 = objc_msgSend(v5, "findOrRegisterContainerizedNodeReinitializingContext:installDictionary:personasWithAttributes:error:", v16, v17, v18, &v49);
      v19 = v49;

      if (v7)
      {
        _LSInstallLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v56 = v21;
          v57 = 2048;
          v58 = v7;
          _os_log_impl(&dword_182882000, v20, OS_LOG_TYPE_DEFAULT, "Successfully registered full app for %@: %llx", buf, 0x16u);
        }

        v7 = 1;
      }
      v6 = v19;
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), CFSTR("Path"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsPlaceholder"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsParallelPlaceholder"));
    goto LABEL_24;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsPlaceholder"));
  if ((objc_msgSend(v5, "fullBundleExistsForIdentifier:matchingNode:", *(_QWORD *)(a1 + 32), 0) & 1) != 0)
    goto LABEL_20;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("LSInstallType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");
  v13 = v12;
  if (v12 >= 7)
  {
    if (v12 - 7 >= 4)
    {
      _LSDefaultLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        __42__LSMIResultRegistrant_runWithCompletion___block_invoke_cold_1(v13, v35);

      goto LABEL_9;
    }

LABEL_20:
    _LSInstallLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v22, OS_LOG_TYPE_DEFAULT, "while registering placeholder, found existing full bundle but not registering a parallel placeholder; noting pla"
        "ceholder registration is a downgrade",
        buf,
        2u);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("LSAppDowngrade"));
    goto LABEL_23;
  }
LABEL_9:

LABEL_23:
  v7 = 0;
LABEL_24:
  v8 = v7 != 0;
  if (v6)
  {

    v10 = 0;
LABEL_33:
    v30 = 0;
    _LSLogStepFinished(4, 0, *(NSString **)(a1 + 32), CFSTR("Failed to register %@"), *(_QWORD *)(a1 + 32));
    v31 = 0;
    goto LABEL_35;
  }
  v23 = *(_QWORD *)(a1 + 72);
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 32);
  v48 = 0;
  v9 = objc_msgSend(v5, "findOrRegisterContainerizedNodeReinitializingContext:installDictionary:personasWithAttributes:error:", v23, v4, v24, &v48);
  v25 = v48;
  v26 = v25;
  if ((_DWORD)v9)
  {
    v47 = v25;
    objc_msgSend(v5, "findContainerizedRecordForBundleUnit:error:", v9, &v47);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v47;

    if (v27)
    {
      v46 = v28;
      v10 = -[LSRecordPromise initWithRecord:error:]([LSRecordPromise alloc], "initWithRecord:error:", v27, &v46);
      v29 = v46;

      v28 = v29;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v28 = *(id *)(a1 + 80);
    v10 = 0;
    v27 = v26;
  }

  v6 = v28;
LABEL_32:

  if (v6)
    goto LABEL_33;
  _LSLogStepFinished(4, 1, *(NSString **)(a1 + 32), CFSTR("Finished registering %@, bundle unit %llx"), *(_QWORD *)(a1 + 32), v9);
  v32 = -[_LSDModificationPendingSaveToken initWithUUID:]([_LSDModificationPendingSaveToken alloc], "initWithUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16));
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __42__LSMIResultRegistrant_runWithCompletion___block_invoke_94;
  v43[3] = &unk_1E1045650;
  v45 = v9;
  v30 = v32;
  v44 = v30;
  objc_msgSend(v3, "armSaveTimerIfNecessary:", v43);

  v6 = 0;
  v31 = 1;
LABEL_35:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "endModificationOperation");
  if ((v31 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "flushModificationState");
  registrationCleanupQueue();
  v33 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__LSMIResultRegistrant_runWithCompletion___block_invoke_2;
  block[3] = &unk_1E1045678;
  block[4] = *(_QWORD *)(a1 + 56);
  v37 = *(id *)(a1 + 32);
  v34 = v6;
  v38 = v34;
  v39 = *(id *)(a1 + 88);
  v41 = *(_BYTE *)(a1 + 112);
  v42 = v8;
  v40 = *(id *)(a1 + 96);
  dispatch_async(v33, block);

  (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
  if (v51 && v53)
    _LSContextDestroy(v51);

}

void __42__LSMIResultRegistrant_runWithCompletion___block_invoke_94(uint64_t a1, int a2, uint64_t a3, void *a4)
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
    v8 = *(unsigned int *)(a1 + 40);
    v12 = 134218498;
    v13 = v8;
    v14 = 1024;
    v15 = a2;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "Save after registration for unit %llx attempted: %d save error: %@", (uint8_t *)&v12, 0x1Cu);
  }

  v9 = v6;
  v10 = v9;
  if ((a2 & 1) == 0)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 89, (uint64_t)"-[LSMIResultRegistrant runWithCompletion:]_block_invoke", 270, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_msgSend(*(id *)(a1 + 32), "saveDidHappen:error:", v10 == 0, v10);

}

uint64_t __42__LSMIResultRegistrant_runWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runPostProcessingForBundleID:success:isSystemApp:isPlaceholder:registeredBothFullAppAndPlaceholder:notificationJournaller:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48) == 0, objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", CFSTR("System")), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 64));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personas, 0);
  objc_storeStrong((id *)&self->_miDict, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
}

void __42__LSMIResultRegistrant_runWithCompletion___block_invoke_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_182882000, a2, OS_LOG_TYPE_FAULT, "install type %d not handled", (uint8_t *)v2, 8u);
}

@end
