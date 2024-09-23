@implementation VSAccountSerializationCenter

+ (id)defaultSerializationCenter
{
  if (defaultSerializationCenter___vs_lazy_init_predicate != -1)
    dispatch_once(&defaultSerializationCenter___vs_lazy_init_predicate, &__block_literal_global_5);
  return (id)defaultSerializationCenter___vs_lazy_init_variable;
}

void __58__VSAccountSerializationCenter_defaultSerializationCenter__block_invoke()
{
  VSAccountSerializationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(VSAccountSerializationCenter);
  v1 = (void *)defaultSerializationCenter___vs_lazy_init_variable;
  defaultSerializationCenter___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSAccountSerializationCenter)init
{
  VSAccountSerializationCenter *v2;
  NSOperationQueue *v3;
  NSOperationQueue *serializationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSAccountSerializationCenter;
  v2 = -[VSAccountSerializationCenter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    serializationQueue = v2->_serializationQueue;
    v2->_serializationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_serializationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v2->_serializationQueue, "setName:", CFSTR("VSAccountSerializationCenter"));
  }
  return v2;
}

- (VSPersistentStorage)storage
{
  VSAccountSerializationCenter *v2;
  VSPersistentStorage *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_storage;
  if (!v3)
  {
    v3 = objc_alloc_init(VSPersistentStorage);
    objc_storeStrong((id *)&v2->_storage, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (NSUndoManager)undoManager
{
  void *v2;
  void *v3;
  void *v4;

  -[VSAccountSerializationCenter storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channelsCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUndoManager *)v4;
}

- (void)setUndoManager:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VSAccountSerializationCenter storage](self, "storage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "channelsCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUndoManager:", v4);

}

- (id)exportDataWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completionHandler parameter must not be nil."));
  v5 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
  -[VSAccountSerializationCenter storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "channelsCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E939F360;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "fetchAccountChannelsWithCompletionHandler:", v10);

  return v5;
}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB34C8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E939F1F8;
  v5 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  objc_msgSend(v4, "blockOperationWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serializationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v7);

}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a1[4], "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_3;
  v4[3] = &unk_1E939F338;
  v5 = a1[5];
  v6 = a1[6];
  objc_msgSend(v3, "fetchAccountsWithCompletionHandler:", v4);

}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_1E939F310;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_11;
  v5[3] = &unk_1E939F2C0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "unwrapObject:error:", v7, v5);

}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  VSAccountsArchive *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  VSAccountsArchive *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(VSAccountsArchive);
    -[VSAccountsArchive setChannels:](v4, "setChannels:", *(_QWORD *)(a1 + 32));
    -[VSAccountsArchive setAccounts:](v4, "setAccounts:", v3);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    -[VSAccountsArchive encodeWithCoder:](v4, "encodeWithCoder:", v5);
    objc_msgSend(v5, "encodedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", CFSTR("VSDataCompressionValueTransformer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transformedValue:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_5;
      v17[3] = &unk_1E939F298;
      v18 = *(id *)(a1 + 40);
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_7;
      v15[3] = &unk_1E939F2C0;
      v16 = *(id *)(a1 + 40);
      objc_msgSend(v8, "unwrapObject:error:", v17, v15);

      v10 = v18;
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_9;
      v13[3] = &unk_1E939F2E8;
      v14 = *(id *)(a1 + 40);
      VSPerformCompletionHandler(v13);
      v10 = v14;
    }

  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_10;
    v11[3] = &unk_1E939F2E8;
    v12 = (VSAccountsArchive *)*(id *)(a1 + 40);
    VSPerformCompletionHandler(v11);
    v4 = v12;
  }

}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_6;
  v6[3] = &unk_1E939F1A8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  VSPerformCompletionHandler(v6);

}

uint64_t __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_8;
  v6[3] = &unk_1E939F1A8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  VSPerformCompletionHandler(v6);

}

uint64_t __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x1E0C99D50]);
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_12;
  v6[3] = &unk_1E939F1A8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  VSPerformCompletionHandler(v6);

}

uint64_t __64__VSAccountSerializationCenter_exportDataWithCompletionHandler___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)importData:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  void (**v15)(_QWORD, _QWORD, _QWORD);
  _QWORD v16[5];
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The data parameter must not be nil."));
    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completionHandler parameter must not be nil."));
LABEL_3:
  v9 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", CFSTR("VSDataCompressionValueTransformer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reverseTransformedValue:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke;
    v16[3] = &unk_1E939F3D8;
    v16[4] = self;
    v18 = v8;
    v17 = v9;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_76;
    v14[3] = &unk_1E939F2C0;
    v15 = v18;
    objc_msgSend(v11, "unwrapObject:error:", v16, v14);

  }
  else
  {
    v8[2](v8, 1, 0);
  }

  return v9;
}

void __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  VSAccountsArchive *v7;
  void *v8;
  VSAccountChannels *v9;
  VSAccountChannels *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  VSAccountSaveOperation *v18;
  void *v19;
  void *v20;
  VSAccountSaveOperation *v21;
  void *v22;
  uint64_t v23;
  VSAccountSaveOperation *v24;
  void *v25;
  void *v26;
  VSAccountSaveOperation *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  VSAccountSaveOperation *v41;
  _QWORD v42[4];
  VSAccountSaveOperation *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v49 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v49);
  v5 = v49;
  if (v4)
  {
    v39 = v3;
    v6 = v4;
    objc_msgSend(v6, "setDecodingFailurePolicy:", 1);
    v37 = v6;
    v7 = -[VSAccountsArchive initWithCoder:]([VSAccountsArchive alloc], "initWithCoder:", v6);
    -[VSAccountsArchive channels](v7, "channels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(VSAccountChannels);
    v38 = v5;
    v36 = v8;
    if (v8)
    {
      v10 = v8;

      v9 = v10;
    }
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[VSAccountsArchive accounts](v7, "accounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if (objc_msgSend(v17, "isSynchronizable"))
            objc_msgSend(v11, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v11, "count"))
    {
      v18 = [VSAccountSaveOperation alloc];
      -[VSAccountsArchive accounts](v7, "accounts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "storage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[VSAccountSaveOperation initWithUnsavedAccounts:channels:storage:](v18, "initWithUnsavedAccounts:channels:storage:", v19, v9, v20);

      v22 = (void *)MEMORY[0x1E0CB34C8];
      v23 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_2;
      v42[3] = &unk_1E939F3B0;
      v24 = v21;
      v43 = v24;
      v44 = *(id *)(a1 + 48);
      objc_msgSend(v22, "blockOperationWithBlock:", v42);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addDependency:", v24);
      VSEnqueueCompletionOperation(v25);
      v26 = *(void **)(a1 + 40);
      v40[0] = v23;
      v40[1] = 3221225472;
      v40[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_5;
      v40[3] = &unk_1E939EE88;
      v41 = v24;
      v27 = v24;
      objc_msgSend(v26, "setCancellationHandler:", v40);
      objc_msgSend(*(id *)(a1 + 32), "serializationQueue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addOperation:", v27);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    v3 = v39;

    v5 = v38;
  }
  else
  {
    VSErrorLogObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_cold_1((uint64_t)v5, v29, v30, v31, v32, v33, v34, v35);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUnwrapObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E939F388;
  v8 = *(id *)(a1 + 40);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E939F2C0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "unwrapObject:error:", v7, v5);

}

uint64_t __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_76_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSOperationQueue)serializationQueue
{
  return self->_serializationQueue;
}

- (void)setSerializationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serializationQueue, a3);
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_serializationQueue, 0);
}

void __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Failed to unarchive data: %@", a5, a6, a7, a8, 2u);
}

void __65__VSAccountSerializationCenter_importData_withCompletionHandler___block_invoke_76_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Failed to decompress data: %@", a5, a6, a7, a8, 2u);
}

@end
