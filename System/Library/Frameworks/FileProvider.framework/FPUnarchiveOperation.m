@implementation FPUnarchiveOperation

- (FPUnarchiveOperation)initWithItem:(id)a3 destinationFolder:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  FPUnarchiveOperation *v12;
  id v13;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPArchiveOperation.m"), 662, CFSTR("no item to unarchive: %@"), 0);

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPArchiveOperation.m"), 663, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationFolder"));

LABEL_3:
  objc_msgSend(v10, "providerDomainID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)FPUnarchiveOperation;
  v12 = -[FPActionOperation initWithProvider:action:](&v17, sel_initWithProvider_action_, v11, 0);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_item, a3);
    objc_storeStrong((id *)&v12->_destinationFolder, a4);
    v13 = -[FPUnarchiveOperation _newParentProgressWithCompletedUnitCount:](v12, "_newParentProgressWithCompletedUnitCount:", 0);
    -[FPActionOperation setProgress:](v12, "setProgress:", v13);

  }
  return v12;
}

- (id)_newParentProgressWithCompletedUnitCount:(int64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_setFileOperationKind:", *MEMORY[0x1E0CB30B0]);
  objc_msgSend(v4, "setCompletedUnitCount:", a3);
  return v4;
}

- (BOOL)getHasUnarchivedMultipleItems:(BOOL *)a3 firstUnarchivedItemURL:(id *)a4 forArchiveFolderURL:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  BOOL v17;
  BOOL v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5;
  v30 = __Block_byref_object_dispose__5;
  v31 = 0;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __103__FPUnarchiveOperation_getHasUnarchivedMultipleItems_firstUnarchivedItemURL_forArchiveFolderURL_error___block_invoke;
    v25[3] = &unk_1E444BC38;
    v25[4] = &v26;
    objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, 0, 1, v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
    if (v13)
    {
      v14 = 0;
      v15 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          if (v14)
          {
            v17 = 1;
            goto LABEL_19;
          }
          v14 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
        if (v13)
          continue;
        break;
      }
      v17 = 0;
    }
    else
    {
      v17 = 0;
      v14 = 0;
    }
LABEL_19:

    v19 = (void *)v27[5];
    v18 = v19 == 0;
    if (v19)
    {
      if (!a6)
        goto LABEL_29;
    }
    else
    {
      if (a3)
        *a3 = v17;
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      if (!a6)
        goto LABEL_29;
      v19 = (void *)v27[5];
    }
    *a6 = objc_retainAutorelease(v19);
LABEL_29:

    goto LABEL_30;
  }
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_30:
  _Block_object_dispose(&v26, 8);

  return v18;
}

uint64_t __103__FPUnarchiveOperation_getHasUnarchivedMultipleItems_firstUnarchivedItemURL_forArchiveFolderURL_error___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

- (void)_importUnarchivedContentAtURL:(id)a3 archiveName:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, id);
  char v10;
  id v11;
  void (**v12)(_QWORD);
  BOOL v13;
  id v14;
  id v15;
  NSObject *v16;
  FPArchiveTemporaryFolder *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  FPMoveOperation *v24;
  void *v25;
  FPMoveOperation *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  FPUnarchiveOperation *v42;
  id v43;
  FPArchiveTemporaryFolder *v44;
  id v45;
  void (**v46)(_QWORD);
  void (**v47)(id, _QWORD, id);
  id v48[2];
  char v49;
  id location;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  char v56;
  _QWORD v57[4];
  id v58;
  char v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36 = a4;
  v9 = (void (**)(id, _QWORD, id))a5;
  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "startAccessingSecurityScopedResource");
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __84__FPUnarchiveOperation__importUnarchivedContentAtURL_archiveName_completionHandler___block_invoke;
  v57[3] = &unk_1E444BAA8;
  v59 = v10;
  v11 = v8;
  v58 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x1A1B00850](v57);
  v56 = 0;
  v54 = 0;
  v55 = 0;
  v13 = -[FPUnarchiveOperation getHasUnarchivedMultipleItems:firstUnarchivedItemURL:forArchiveFolderURL:error:](self, "getHasUnarchivedMultipleItems:firstUnarchivedItemURL:forArchiveFolderURL:error:", &v56, &v55, v11, &v54);
  v14 = v55;
  v15 = v54;
  v35 = v14;
  if (v13)
  {
    if (v56)
    {
      v34 = v11;
      goto LABEL_6;
    }
    v34 = v14;
    if (v34)
    {
LABEL_6:
      if (v56)
      {
        fp_current_or_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[FPUnarchiveOperation _importUnarchivedContentAtURL:archiveName:completionHandler:].cold.3();

        v17 = -[FPArchiveTemporaryFolder initWithURL:]([FPArchiveTemporaryFolder alloc], "initWithURL:", v34);
        v53 = v15;
        -[FPArchiveTemporaryFolder temporaryFolderURLGetError:](v17, "temporaryFolderURLGetError:", &v53);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = v53;

        if (!v18)
        {
          v12[2](v12);
          v9[2](v9, 0, v19);
          v18 = 0;
LABEL_22:

          v15 = v19;
          goto LABEL_23;
        }
        objc_msgSend(v36, "stringByDeletingPathExtension");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v20, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = v19;
        v22 = objc_msgSend(v38, "moveItemAtURL:toURL:error:", v11, v21, &v52);
        v15 = v52;

        if ((v22 & 1) == 0)
        {
          v51 = 0;
          v29 = objc_msgSend(v38, "removeItemAtURL:error:", v18, &v51);
          v30 = v51;
          if ((v29 & 1) == 0)
          {
            fp_current_or_default_log();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              -[FPUnarchiveOperation _importUnarchivedContentAtURL:archiveName:completionHandler:].cold.2();

          }
          v12[2](v12);
          v9[2](v9, 0, v15);

          v19 = v15;
          goto LABEL_22;
        }
        v12[2](v12);

        v34 = v21;
      }
      else
      {
        v18 = 0;
        v17 = 0;
      }
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[FPUnarchiveOperation _importUnarchivedContentAtURL:archiveName:completionHandler:].cold.1((uint64_t)self, v34);

      v24 = [FPMoveOperation alloc];
      v60[0] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[FPMoveOperation initWithURLs:destinationFolder:](v24, "initWithURLs:destinationFolder:", v25, self->_destinationFolder);

      location = 0;
      objc_initWeak(&location, v26);
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __84__FPUnarchiveOperation__importUnarchivedContentAtURL_archiveName_completionHandler___block_invoke_143;
      v39[3] = &unk_1E444BC60;
      v49 = v56;
      v40 = v38;
      v41 = v11;
      v46 = v12;
      v42 = self;
      v18 = v18;
      v43 = v18;
      v48[1] = (id)a2;
      v17 = v17;
      v44 = v17;
      v47 = v9;
      objc_copyWeak(v48, &location);
      v19 = v15;
      v45 = v19;
      -[FPActionOperation setActionCompletionBlock:](v26, "setActionCompletionBlock:", v39);
      -[FPMoveOperation setShouldBounceOnCollision:](v26, "setShouldBounceOnCollision:", 1);
      -[FPActionOperation setHaveStitching:](v26, "setHaveStitching:", 0);
      -[FPActionOperation progress](self, "progress");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPActionOperation progress](v26, "progress");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addChild:withPendingUnitCount:", v28, 10);

      objc_msgSend(v37, "scheduleAction:", v26);
      objc_destroyWeak(v48);

      objc_destroyWeak(&location);
      goto LABEL_22;
    }
    fp_current_or_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      LOWORD(location) = 0;
      _os_log_impl(&dword_1A0A34000, v32, OS_LOG_TYPE_INFO, "[INFO] unarchive operation produced no output", (uint8_t *)&location, 2u);
    }

    v9[2](v9, 0, 0);
  }
  else
  {
    v12[2](v12);
    v9[2](v9, 0, v15);
  }
LABEL_23:

}

uint64_t __84__FPUnarchiveOperation__importUnarchivedContentAtURL_archiveName_completionHandler___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "stopAccessingSecurityScopedResource");
  return result;
}

void __84__FPUnarchiveOperation__importUnarchivedContentAtURL_archiveName_completionHandler___block_invoke_143(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v3 = a2;
  if (*(_BYTE *)(a1 + 112))
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 48), CFSTR("FPArchiveOperation.m"), 843, CFSTR("nil temporaryFolderURL"));

      v4 = *(_QWORD *)(a1 + 56);
    }
    v6 = *(void **)(a1 + 32);
    v18 = 0;
    v7 = objc_msgSend(v6, "removeItemAtURL:error:", v4, &v18);
    v8 = v18;
    if ((v7 & 1) != 0)
      goto LABEL_5;
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v19 = 0;
    v12 = objc_msgSend(v10, "removeItemAtURL:error:", v11, &v19);
    v8 = v19;
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    if ((v12 & 1) != 0)
    {
LABEL_5:

      v9 = *(_QWORD *)(a1 + 88);
      if (v3)
      {
        (*(void (**)(_QWORD, _QWORD, _QWORD))(v9 + 16))(*(_QWORD *)(a1 + 88), 0, *(_QWORD *)(a1 + 72));
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
        objc_msgSend(WeakRetained, "transferResults");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allValues");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v17, *(_QWORD *)(a1 + 72));

      }
      goto LABEL_13;
    }
  }
  if (v3)
    v13 = v3;
  else
    v13 = v8;
  objc_msgSend(*(id *)(a1 + 48), "completedWithResult:error:", 0, v13);

LABEL_13:
}

- (void)_unarchiveURLInFPEnumeratedDomain:(id)a3 archiveName:(id)a4 service:(id)a5 passphrase:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  fp_current_or_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[FPUnarchiveOperation _unarchiveURLInFPEnumeratedDomain:archiveName:service:passphrase:completionHandler:].cold.1((uint64_t)self, v12);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke;
  v22[3] = &unk_1E444BC88;
  v23 = v13;
  v24 = v14;
  v22[4] = self;
  v18 = v13;
  v19 = v14;
  objc_msgSend(v16, "unarchiveItemAtURL:passphrase:destinationFolderURL:completionHandler:", v12, v15, v12, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[FPActionOperation progress](self, "progress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addChild:withPendingUnitCount:", v20, 80);

  }
}

void __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a2;
  v6 = a3;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke_cold_2(a1, (uint64_t)v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v8)
      __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke_cold_1(a1, (uint64_t)v5);

    objc_msgSend(*(id *)(a1 + 32), "_importUnarchivedContentAtURL:archiveName:completionHandler:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)_unarchiveURLInDSEnumeratedDomain:(id)a3 service:(id)a4 passphrase:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __95__FPUnarchiveOperation__unarchiveURLInDSEnumeratedDomain_service_passphrase_completionHandler___block_invoke;
  v19[3] = &unk_1E444ADF0;
  v20 = v13;
  v16 = v13;
  objc_msgSend(v11, "unarchiveItemAtURL:toURL:options:acceptedFormats:passphrases:completionHandler:", v10, v14, 0, 1, v15, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)

  if (v17)
  {
    -[FPActionOperation progress](self, "progress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addChild:withPendingUnitCount:", v17, 80);

  }
}

void __95__FPUnarchiveOperation__unarchiveURLInDSEnumeratedDomain_service_passphrase_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    +[FPItemManager defaultManager](FPItemManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchItemForURL:completionHandler:", v6, *(_QWORD *)(a1 + 32));

  }
}

- (void)_unarchiveURL:(id)a3 archiveName:(id)a4 service:(id)a5 passphrase:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (-[FPProviderDomain isUsingFPFS](self->_providerDomain, "isUsingFPFS") && (objc_opt_respondsToSelector() & 1) != 0)
    -[FPUnarchiveOperation _unarchiveURLInDSEnumeratedDomain:service:passphrase:completionHandler:](self, "_unarchiveURLInDSEnumeratedDomain:service:passphrase:completionHandler:", v16, v13, v14, v15);
  else
    -[FPUnarchiveOperation _unarchiveURLInFPEnumeratedDomain:archiveName:service:passphrase:completionHandler:](self, "_unarchiveURLInFPEnumeratedDomain:archiveName:service:passphrase:completionHandler:", v16, v12, v13, v14, v15);

}

- (void)_unarchiveAndHandleIncorrectPassphraseURL:(id)a3 archiveName:(id)a4 service:(id)a5 passphrase:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  SEL v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke;
  v23[3] = &unk_1E444BCD8;
  v23[4] = self;
  v24 = v16;
  v28 = v17;
  v29 = a2;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v16;
  v22 = v17;
  -[FPUnarchiveOperation _unarchiveURL:archiveName:service:passphrase:completionHandler:](self, "_unarchiveURL:archiveName:service:passphrase:completionHandler:", v20, v19, v18, v21, v23);

}

void __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a2;
  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v7 = (id *)getDSArchiveServiceErrorDomainSymbolLoc_ptr;
  v33 = getDSArchiveServiceErrorDomainSymbolLoc_ptr;
  if (!getDSArchiveServiceErrorDomainSymbolLoc_ptr)
  {
    v8 = (void *)DesktopServicesPrivLibrary();
    v7 = (id *)dlsym(v8, "DSArchiveServiceErrorDomain");
    v31[3] = (uint64_t)v7;
    getDSArchiveServiceErrorDomainSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v30, 8);
  if (!v7)
    __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_1();
  v9 = *v7;
  objc_msgSend(v6, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", v9))
  {

    goto LABEL_11;
  }
  v11 = objc_msgSend(v6, "code");

  if (v11 != -1000)
  {
LABEL_11:
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "passphraseRequestBlock");
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "stitcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithItem:error:", 0, v6);

    objc_msgSend(*(id *)(a1 + 32), "resetStitcher");
    v14 = *(_QWORD *)(a1 + 40);
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v16)
        __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_3(a1 + 32, v15, v17, v18, v19, v20, v21, v22);
    }
    else if (v16)
    {
      __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_2(a1 + 32, v15, v17, v18, v19, v20, v21, v22);
    }

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_148;
    v24[3] = &unk_1E444BCB0;
    v23 = *(_QWORD *)(a1 + 32);
    v29 = *(_QWORD *)(a1 + 80);
    v24[4] = v23;
    v25 = *(id *)(a1 + 48);
    v26 = *(id *)(a1 + 56);
    v27 = *(id *)(a1 + 64);
    v28 = *(id *)(a1 + 72);
    ((void (**)(_QWORD, id, _QWORD *))v12)[2](v12, v6, v24);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

LABEL_17:
}

void __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_148(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v7 = a2;
  v5 = a3;
  if (!(v7 | v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("FPArchiveOperation.m"), 962, CFSTR("either the passphrase or the error should be set"));

    goto LABEL_5;
  }
  if (!v7)
  {
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "_unarchiveAndHandleIncorrectPassphraseURL:archiveName:service:passphrase:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7, *(_QWORD *)(a1 + 64));
LABEL_6:

}

- (void)actionMain
{
  void *v3;
  FPItem *v4;
  void *v5;
  FPProviderDomain *v6;
  FPProviderDomain *providerDomain;
  FPItem *v8;
  _QWORD v9[5];
  FPItem *v10;

  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_item;
  -[FPItem providerDomainID](v4, "providerDomainID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPProviderDomain providerDomainWithID:cachePolicy:error:](FPProviderDomain, "providerDomainWithID:cachePolicy:error:", v5, 1, 0);
  v6 = (FPProviderDomain *)objc_claimAutoreleasedReturnValue();
  providerDomain = self->_providerDomain;
  self->_providerDomain = v6;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__FPUnarchiveOperation_actionMain__block_invoke;
  v9[3] = &unk_1E444BD50;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v3, "fetchURLForItem:completionHandler:", v8, v9);

}

void __34__FPUnarchiveOperation_actionMain__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = v6;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a3);
  }
  else
  {
    if (objc_msgSend(v6, "startAccessingSecurityScopedResource"))
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 456), a2);
    objc_msgSend(MEMORY[0x1E0CB35F8], "readingIntentWithURL:options:", v7, 0x20000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v9, "setMaxConcurrentOperationCount:", 1);
    v10 = (void *)objc_opt_new();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 488), v10);
    v19[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __34__FPUnarchiveOperation_actionMain__block_invoke_2;
    v15[3] = &unk_1E444BD28;
    v12 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v10;
    v17 = v8;
    v18 = v12;
    v13 = v8;
    v14 = v10;
    objc_msgSend(v14, "coordinateAccessWithIntents:queue:byAccessor:", v11, v9, v15);

  }
}

void __34__FPUnarchiveOperation_actionMain__block_invoke_2(id *a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  if (a2)
  {
    objc_msgSend(a1[4], "completedWithResult:error:", 0, a2);
  }
  else
  {
    objc_msgSend(a1[5], "retainAccess");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v5 = (void *)v4[62];
    v4[62] = v3;

    objc_msgSend(a1[6], "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    getDSArchiveServiceClass();
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setUnarchivingDelegate:", a1[4]);
    v8 = a1[4];
    objc_msgSend(a1[7], "filename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __34__FPUnarchiveOperation_actionMain__block_invoke_3;
    v10[3] = &unk_1E444BD00;
    v10[4] = a1[4];
    objc_msgSend(v8, "_unarchiveAndHandleIncorrectPassphraseURL:archiveName:service:passphrase:completionHandler:", v6, v9, v7, 0, v10);

  }
}

uint64_t __34__FPUnarchiveOperation_actionMain__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", a2, a3);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSURL *itemURL;
  NSFileCoordinator *coordinator;
  id coordinationAccessToken;
  NSFileCoordinator *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  itemURL = self->_itemURL;
  if (itemURL)
    -[NSURL stopAccessingSecurityScopedResource](itemURL, "stopAccessingSecurityScopedResource");
  if (self->_coordinationAccessToken)
  {
    coordinator = self->_coordinator;
    if (!coordinator)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPArchiveOperation.m"), 1044, CFSTR("nil coordinator with a non-nil coordination access token"));

      coordinator = self->_coordinator;
    }
    -[NSFileCoordinator releaseAccess:](coordinator, "releaseAccess:");
    coordinationAccessToken = self->_coordinationAccessToken;
    self->_coordinationAccessToken = 0;

  }
  v12 = self->_coordinator;
  self->_coordinator = 0;

  v13 = v7;
  if (v8)
  {
    objc_msgSend(v8, "fp_annotatedErrorWithItem:variant:", self->_item, CFSTR("Unarchive"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FPActionOperation stitcher](self, "stitcher");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "associateItem:withPlaceholderID:", v13, self->_placeholderID);
    v14 = 0;
  }

  -[FPActionOperation stitcher](self, "stitcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "finishWithItem:error:", v13, v14);

  -[FPUnarchiveOperation unarchiveCompletionBlock](self, "unarchiveCompletionBlock");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
  {
    (*(void (**)(uint64_t, id, void *))(v16 + 16))(v16, v13, v14);
    -[FPUnarchiveOperation setUnarchiveCompletionBlock:](self, "setUnarchiveCompletionBlock:", 0);
  }

  v19.receiver = self;
  v19.super_class = (Class)FPUnarchiveOperation;
  -[FPActionOperation finishWithResult:error:](&v19, sel_finishWithResult_error_, v13, v14);

}

- (id)findUniqueUnarchivedName:(id)a3 isFolder:(BOOL)a4 parent:(id)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v6 = a4;
  v7 = a3;
  v13 = 0;
  objc_msgSend(a5, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", v7, v6, 0, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v9;
  if (v8)
  {
    if (!v9)
      v10 = &unk_1E448E920;
    objc_msgSend(v7, "fp_bouncedNameWithIndex:isDir:", objc_msgSend(v10, "longValue") + 1, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

- (void)service:(id)a3 didReceiveArchivedItemsDescriptors:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  FPItemID *placeholderID;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  SEL v39;
  FPUnarchiveOperation *v40;
  id v41;
  id obj;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "count") && !objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPArchiveOperation.m"), 1089, CFSTR("archived items info array was empty"));

  }
  v39 = a2;
  v40 = self;
  -[FPActionOperation stitcher](self, "stitcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "start");

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v9)
  {
    v10 = v9;
    v43 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v14, "filePath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pathComponents");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        if (objc_msgSend(v16, "count") == 2)
        {
          objc_msgSend(v16, "lastObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("/"));

        }
        else
        {
          v19 = 0;
        }
        if (v17 == 1 || (v19 & 1) != 0)
        {
          v20 = v14;

          if (v11)
          {
            v43 = v20;
            v11 = 2;
            goto LABEL_22;
          }
          v11 = 1;
          v43 = v20;
        }
        else
        {

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v43 = 0;
    v11 = 0;
  }
LABEL_22:

  -[FPItem fileURL](v40->_destinationFolder, "fileURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == 1)
  {
    objc_msgSend(v43, "filePath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v39, v40, CFSTR("FPArchiveOperation.m"), 1116, CFSTR("missing name in descriptor: %@"), v43);

    }
    objc_msgSend(v43, "typeIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC3F8], "fp_cachedTypeWithIdentifier:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPUnarchiveOperation findUniqueUnarchivedName:isFolder:parent:](v40, "findUniqueUnarchivedName:isFolder:parent:", v23, v26 == (void *)*MEMORY[0x1E0CEC4F0], v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPActionOperation stitcher](v40, "stitcher");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem itemIdentifier](v40->_destinationFolder, "itemIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem providerDomainID](v40->_destinationFolder, "providerDomainID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "createPlaceholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:", v27, v26, 0, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    placeholderID = v40->_placeholderID;
    v40->_placeholderID = (FPItemID *)v31;

  }
  else
  {
    -[FPItem displayName](v40->_item, "displayName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPUnarchiveOperation findUniqueUnarchivedName:isFolder:parent:](v40, "findUniqueUnarchivedName:isFolder:parent:", v33, 1, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[FPActionOperation stitcher](v40, "stitcher");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem itemIdentifier](v40->_destinationFolder, "itemIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem providerDomainID](v40->_destinationFolder, "providerDomainID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "createPlaceholderWithName:isFolder:contentAccessDate:underParent:inProviderDomainID:", v23, 1, 0, v26, v27);
    v34 = objc_claimAutoreleasedReturnValue();
    v28 = v40->_placeholderID;
    v40->_placeholderID = (FPItemID *)v34;
  }

  +[FPProgressManager defaultManager](FPProgressManager, "defaultManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPActionOperation progress](v40, "progress");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "registerCopyProgress:forItemID:", v36, v40->_placeholderID);

  -[FPActionOperation stitcher](v40, "stitcher");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "flush");

}

- (id)passphraseRequestBlock
{
  return self->_passphraseRequestBlock;
}

- (void)setPassphraseRequestBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (id)unarchiveCompletionBlock
{
  return self->_unarchiveCompletionBlock;
}

- (void)setUnarchiveCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unarchiveCompletionBlock, 0);
  objc_storeStrong(&self->_passphraseRequestBlock, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_storeStrong(&self->_coordinationAccessToken, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_destinationFolder, 0);
  objc_storeStrong((id *)&self->_placeholderID, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)_importUnarchivedContentAtURL:(uint64_t)a1 archiveName:(void *)a2 completionHandler:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "fp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG] %@: Importing unarchived content from %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)_importUnarchivedContentAtURL:archiveName:completionHandler:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_3();
  _os_log_error_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_ERROR, "[ERROR] failed to remove temporary folder at URL %@: %@", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)_importUnarchivedContentAtURL:archiveName:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: Archive contains multiple top-level item, wrapping them in a folder named after the archive", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_unarchiveURLInFPEnumeratedDomain:(uint64_t)a1 archiveName:(void *)a2 service:passphrase:completionHandler:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "fp_shortDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v2, v3, "[DEBUG] %@: Unarchiving %@ using old SPI", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_7_4(a1, a2), "fp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG] %@: Unarchiving produced output in %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __107__FPUnarchiveOperation__unarchiveURLInFPEnumeratedDomain_archiveName_service_passphrase_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_7_4(a1, a2), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG] %@: Unarchiving failed with error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getDSArchiveServiceErrorDomain(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPArchiveOperation.m"), 26, CFSTR("%s"), dlerror());

  __break(1u);
}

void __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] %@: archive requires a passphrase, asking for one", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __115__FPUnarchiveOperation__unarchiveAndHandleIncorrectPassphraseURL_archiveName_service_passphrase_completionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] %@: incorrect passphrase, asking for one", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
