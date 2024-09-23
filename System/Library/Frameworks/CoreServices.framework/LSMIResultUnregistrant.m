@implementation LSMIResultUnregistrant

- (LSMIResultUnregistrant)initWithContext:(id)a3 operationUUID:(id)a4 bundleIdentifier:(id)a5 precondition:(id)a6 type:(unsigned int)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  LSMIResultUnregistrant *v17;
  LSMIResultUnregistrant *v18;
  uint64_t v19;
  NSString *bundleID;
  LSPrecondition *v21;
  LSPrecondition *precondition;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)LSMIResultUnregistrant;
  v17 = -[LSMIResultUnregistrant init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_strategy, a3);
    objc_storeStrong((id *)&v18->_uuid, a4);
    v19 = objc_msgSend(v15, "copy");
    bundleID = v18->_bundleID;
    v18->_bundleID = (NSString *)v19;

    if (v16)
    {
      v21 = (LSPrecondition *)v16;
    }
    else
    {
      +[LSPrecondition emptyPrecondition](LSPrecondition, "emptyPrecondition");
      v21 = (LSPrecondition *)objc_claimAutoreleasedReturnValue();
    }
    precondition = v18->_precondition;
    v18->_precondition = v21;

    v18->_type = a7;
  }

  return v18;
}

- (void)runWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  void *v5;
  LSMIResultRegistrantStrategy *strategy;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[8];
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  -[LSMIResultRegistrantStrategy preUnregistrationContextForBundleIdentifier:](self->_strategy, "preUnregistrationContextForBundleIdentifier:", self->_bundleID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__46;
  v29 = __Block_byref_object_dispose__46;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__46;
  v23 = __Block_byref_object_dispose__46;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__118;
  v17[4] = __Block_byref_object_dispose__119;
  v18 = 0;
  -[LSMIResultRegistrantStrategy beginModificationOperation](self->_strategy, "beginModificationOperation");
  strategy = self->_strategy;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__LSMIResultUnregistrant_runWithCompletion___block_invoke;
  v16[3] = &unk_1E10456F0;
  v16[4] = self;
  v16[5] = &v25;
  v16[6] = v17;
  v16[7] = &v19;
  -[LSMIResultRegistrantStrategy runSyncBlockInWriteContext:](strategy, "runSyncBlockInWriteContext:", v16);
  registrationCleanupQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = v7;
  v11 = 3221225472;
  v12 = __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_2;
  v13 = &unk_1E1041FF8;
  v15 = v17;
  v9 = v5;
  v14 = v9;
  dispatch_async(v8, &v10);

  _LSLogStepFinished(6, v26[5] == 0, self->_bundleID, CFSTR("Unregister bundles - End"), v10, v11, v12, v13);
  v4[2](v4, v20[5], v26[5]);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
}

void __44__LSMIResultUnregistrant_runWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _LSDModificationPendingSaveToken *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  id obj;
  uint8_t buf[16];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _LSLogStepStart(6, 0, *(NSString **)(a1[4] + 24), CFSTR("Unregister bundles via unregistrant - Start"));
  v4 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "databaseContextWithError:", &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    v6 = *(_QWORD *)(a1[5] + 8);
    v9 = *(void **)(v6 + 40);
    v7 = (id *)(v6 + 40);
    v8 = v9;
    v10 = *(id *)(a1[4] + 32);
    if ((objc_msgSend(v10, "isMet") & 1) != 0)
    {

      objc_storeStrong(v7, v8);
      v11 = a1[4];
      v12 = *(_QWORD *)(v11 + 24);
      v13 = *(unsigned int *)(v11 + 40);
      v14 = *(_QWORD *)(a1[5] + 8);
      v33 = *(id *)(v14 + 40);
      objc_msgSend(v5, "unregisterApplicationWithBundleIdentifier:type:error:", v12, v13, &v33);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v14 + 40), v33);
      v16 = *(_QWORD *)(a1[6] + 8);
      v17 = *(NSObject **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Precondition not met: %@"), v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = *MEMORY[0x1E0CB2938];
      *(_QWORD *)buf = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v36, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), 117, (uint64_t)"validatePrecondition", 324, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;

      objc_storeStrong(v7, v20);
      _LSInstallLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(a1[4] + 32);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v22;
        _os_log_impl(&dword_182882000, v17, OS_LOG_TYPE_DEFAULT, "Unregistration precondition not met: %@", buf, 0xCu);
      }
    }

    objc_msgSend(*(id *)(a1[4] + 8), "endModificationOperation");
    v23 = a1[4];
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      v24 = *(id *)(v23 + 24);
      v25 = -[_LSDModificationPendingSaveToken initWithUUID:]([_LSDModificationPendingSaveToken alloc], "initWithUUID:", *(_QWORD *)(a1[4] + 16));
      v26 = *(_QWORD *)(a1[7] + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_122;
      v30[3] = &unk_1E10456C8;
      v28 = v24;
      v29 = a1[7];
      v31 = v28;
      v32 = v29;
      objc_msgSend(v3, "armSaveTimerIfNecessary:", v30);

    }
    else
    {
      objc_msgSend(*(id *)(v23 + 8), "flushModificationState");
    }
  }

}

void __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_122(uint64_t a1, int a2, uint64_t a3, void *a4)
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
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "Save after unregistration for %@ attempted: %d save error: %@", (uint8_t *)&v12, 0x1Cu);
  }

  v9 = v6;
  v10 = v9;
  if ((a2 & 1) == 0)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 89, (uint64_t)"-[LSMIResultUnregistrant runWithCompletion:]_block_invoke", 354, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "saveDidHappen:error:", v10 == 0, v10);

}

uint64_t __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
  if (v1)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40), *(_QWORD *)(result + 32));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precondition, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
}

@end
