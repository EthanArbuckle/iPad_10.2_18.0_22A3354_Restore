@implementation FCTranslationManager

- (FCTranslationManager)initWithContentContext:(id)a3
{
  FCContentContext *v4;
  FCTranslationManager *v5;
  FCContentContext *contentContext;
  FCContentContext *v7;
  FCAsyncSerialQueue *v8;
  FCAsyncSerialQueue *queue;
  objc_super v11;

  v4 = (FCContentContext *)a3;
  v11.receiver = self;
  v11.super_class = (Class)FCTranslationManager;
  v5 = -[FCTranslationManager init](&v11, sel_init);
  contentContext = v5->_contentContext;
  v5->_contentContext = v4;
  v7 = v4;

  v8 = -[FCAsyncSerialQueue initWithQualityOfService:]([FCAsyncSerialQueue alloc], "initWithQualityOfService:", 25);
  queue = v5->_queue;
  v5->_queue = v8;

  return v5;
}

- (FCTranslationProvider)possiblyUnfetchedTranslationProvider
{
  void *v3;
  void *v5;
  void *v6;
  id v7;
  FCResourcesFetchOperation *v8;
  void *v9;
  void *v10;
  FCResourcesFetchOperation *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  uint8_t *v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[5];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[FCTranslationManager translationMap](self, "translationMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __60__FCTranslationManager_possiblyUnfetchedTranslationProvider__block_invoke;
    v27[3] = &unk_1E4647A68;
    v27[4] = self;
    __60__FCTranslationManager_possiblyUnfetchedTranslationProvider__block_invoke((uint64_t)v27);
    return (FCTranslationProvider *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("translationMapResourceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = v6;
      v8 = [FCResourcesFetchOperation alloc];
      -[FCTranslationManager contentContext](self, "contentContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v8, "initWithContext:resourceIDs:downloadAssets:", v9, v10, 0);

      -[FCFetchOperation setCachePolicy:](v11, "setCachePolicy:", 3);
      -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v11, "setCanSendFetchCompletionSynchronously:", 1);
      *(_QWORD *)buf = 0;
      v22 = buf;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__55;
      v25 = __Block_byref_object_dispose__55;
      v26 = 0;
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __60__FCTranslationManager_possiblyUnfetchedTranslationProvider__block_invoke_6;
      v18 = &unk_1E4647A90;
      v20 = buf;
      v12 = v7;
      v19 = v12;
      -[FCFetchOperation setFetchCompletionBlock:](v11, "setFetchCompletionBlock:", &v15);
      -[FCOperation start](v11, "start", v15, v16, v17, v18);
      -[FCResourcesFetchOperation waitUntilFinished](v11, "waitUntilFinished");
      v13 = *((id *)v22 + 5);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v14 = FCTranslationLog;
      if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "No translation map resource ID available in User Defaults, we have no translation map to synchronously return", buf, 2u);
      }
      v13 = 0;
    }

    return (FCTranslationProvider *)v13;
  }
}

- (FCTranslationMap)translationMap
{
  return self->_translationMap;
}

id __60__FCTranslationManager_possiblyUnfetchedTranslationProvider__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Already have a translation map, returning it", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "translationMap");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __60__FCTranslationManager_possiblyUnfetchedTranslationProvider__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  FCTranslationMap *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Synchronous Fetch operation completed", buf, 2u);
    }
    objc_opt_class();
    objc_opt_class();
    objc_msgSend(v3, "fetchedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    if (v11)
    {
      v12 = v11;
      v13 = FCTranslationLog;
      if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v12;
        _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "Got resource %@", buf, 0xCu);
      }
      objc_msgSend(v12, "fileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;
        v17 = FCTranslationLog;
        if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v16;
          _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEFAULT, "Got fileURL %@", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
          v21 = (void *)FCTranslationLog;
          v22 = v20;
          if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (void *)MEMORY[0x1E0CB37E8];
            v24 = v21;
            objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v22, "length"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = v25;
            _os_log_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_DEFAULT, "Got back data of length %@", buf, 0xCu);

          }
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62898]), "initWithData:", v22);
          v27 = v26;
          if (v26)
          {
            v33 = v16;
            v28 = v22;
            v29 = v26;
            v30 = -[FCTranslationMap initWithPBTranslationMap:resourceID:]([FCTranslationMap alloc], "initWithPBTranslationMap:resourceID:", v29, *(_QWORD *)(a1 + 32));

            v22 = v28;
            v16 = v33;
            v31 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v32 = *(void **)(v31 + 40);
            *(_QWORD *)(v31 + 40) = v30;

          }
        }

      }
    }

  }
}

- (void)fetchTranslationProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[FCTranslationManager queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke;
  v7[3] = &unk_1E4647B30;
  v6 = v4;
  v8 = v6;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  objc_msgSend(v5, "enqueueBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  id v15;
  uint8_t buf[16];
  _QWORD aBlock[4];
  id v18;
  id v19;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2;
  aBlock[3] = &unk_1E4647AB8;
  v18 = *(id *)(a1 + 40);
  v5 = v3;
  v19 = v5;
  v6 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "Attempting Translation Map Resource Fetch", buf, 2u);
    }
    objc_msgSend(v9, "contentContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appConfigurationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(25, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_24;
    v14[3] = &unk_1E4647B08;
    v14[5] = v9;
    v15 = v6;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "fetchAppConfigurationIfNeededWithCompletionQueue:completion:", v13, v14);

  }
  else if (v6)
  {
    (*((void (**)(void *, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  FCResourcesFetchOperation *v19;
  NSObject *v20;
  FCResourcesFetchOperation *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  _QWORD v34[5];
  _QWORD v35[6];
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v9 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "App Config Manager Returned", buf, 2u);
    }
    objc_msgSend(v5, "translationMapResourceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_26;
      v34[3] = &unk_1E463B598;
      v34[4] = *(_QWORD *)(a1 + 48);
      __49__FCTranslationManager_fetchTranslationProvider___block_invoke_26((uint64_t)v34);
      goto LABEL_16;
    }
    v12 = v10;
    objc_msgSend(*(id *)(a1 + 32), "translationMap");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_10;
    v14 = (void *)v13;
    objc_msgSend(*(id *)(a1 + 32), "translationMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resourceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v12);

    if (v17)
    {
      v18 = *(_QWORD *)(a1 + 48);
      if (!v18)
      {
LABEL_14:

LABEL_16:
        goto LABEL_17;
      }
      objc_msgSend(*(id *)(a1 + 32), "translationMap");
      v19 = (FCResourcesFetchOperation *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, FCResourcesFetchOperation *, _QWORD))(v18 + 16))(v18, v19, 0);
    }
    else
    {
LABEL_10:
      v20 = FCTranslationLog;
      if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v12;
        _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "Found translationMapResourceID %@, building fetch operation", buf, 0xCu);
      }
      v21 = [FCResourcesFetchOperation alloc];
      objc_msgSend(*(id *)(a1 + 32), "contentContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v21, "initWithContext:resourceIDs:downloadAssets:", v22, v23, 1);

      -[FCFetchOperation setCachePolicy:](v19, "setCachePolicy:", 1);
      -[FCOperation setQualityOfService:](v19, "setQualityOfService:", 25);
      -[FCOperation setRelativePriority:](v19, "setRelativePriority:", 1);
      -[FCOperation shortOperationDescription](v19, "shortOperationDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_31;
      v28[3] = &unk_1E4647AE0;
      v29 = v24;
      v30 = 0;
      v33 = *(id *)(a1 + 48);
      v25 = v12;
      v26 = *(_QWORD *)(a1 + 40);
      v31 = v25;
      v32 = v26;
      v27 = v24;
      -[FCFetchOperation setFetchCompletionBlock:](v19, "setFetchCompletionBlock:", v28);
      -[FCOperation start](v19, "start");

    }
    goto LABEL_14;
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_25;
  v35[3] = &unk_1E463B790;
  v8 = *(_QWORD *)(a1 + 48);
  v35[4] = v6;
  v35[5] = v8;
  __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_25((uint64_t)v35);
LABEL_17:

}

uint64_t __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_25(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "App Config Returned Error: %@", (uint8_t *)&v5, 0xCu);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[8];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "App Config contained no translationMapResourceID", v7, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("Didn't find a translation map resource ID in the News app configuration");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 19, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v6);

  }
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  FCTranslationMap *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[6];
  _QWORD v40[6];
  _QWORD v41[6];
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  void *v48;
  uint64_t v49;
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_32;
    v46[3] = &unk_1E463CCB8;
    v5 = *(void **)(a1 + 40);
    v47 = *(id *)(a1 + 32);
    v48 = v5;
    v49 = *(_QWORD *)(a1 + 64);
    v6 = v5;
    v7 = v47;
    __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_32(v46);

  }
  else
  {
    v8 = FCTranslationLog;
    if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "Fetch operation completed", buf, 2u);
    }
    objc_opt_class();
    objc_opt_class();
    objc_msgSend(v3, "fetchedObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    if (v14)
    {
      v7 = v14;
      v15 = FCTranslationLog;
      if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v7;
        _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "Got resource %@", buf, 0xCu);
      }
      objc_msgSend(v7, "fileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
        v19 = FCTranslationLog;
        if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v18;
          _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "Got fileURL %@", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          v22 = v20;
          v23 = (void *)FCTranslationLog;
          if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
          {
            v24 = (void *)MEMORY[0x1E0CB37E8];
            v25 = v23;
            objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v22, "length"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v51 = v26;
            _os_log_impl(&dword_1A1B90000, v25, OS_LOG_TYPE_DEFAULT, "Got back data of length %@", buf, 0xCu);

          }
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62898]), "initWithData:", v22);
          v28 = v27;
          if (v27)
          {
            v29 = v27;
            v30 = -[FCTranslationMap initWithPBTranslationMap:resourceID:]([FCTranslationMap alloc], "initWithPBTranslationMap:resourceID:", v29, *(_QWORD *)(a1 + 48));
            objc_msgSend(*(id *)(a1 + 56), "setTranslationMap:", v30);

            objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("translationMapResourceID"));

            v32 = *(_QWORD *)(a1 + 64);
            if (v32)
            {
              objc_msgSend(*(id *)(a1 + 56), "translationMap");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, void *, _QWORD))(v32 + 16))(v32, v33, 0);

            }
          }
          else
          {
            v39[0] = MEMORY[0x1E0C809B0];
            v39[1] = 3221225472;
            v39[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_43;
            v39[3] = &unk_1E463B2D0;
            v38 = *(void **)(a1 + 64);
            v39[4] = v22;
            v39[5] = v38;
            v29 = v38;
            __49__FCTranslationManager_fetchTranslationProvider___block_invoke_43((uint64_t)v39);
          }

        }
        else
        {
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_40;
          v40[3] = &unk_1E463B790;
          v22 = v18;
          v37 = *(_QWORD *)(a1 + 64);
          v40[4] = v22;
          v40[5] = v37;
          __49__FCTranslationManager_fetchTranslationProvider___block_invoke_40((uint64_t)v40);
        }

      }
      else
      {
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_37;
        v41[3] = &unk_1E463B2D0;
        v36 = *(void **)(a1 + 64);
        v41[4] = v7;
        v41[5] = v36;
        v18 = v36;
        __49__FCTranslationManager_fetchTranslationProvider___block_invoke_37((uint64_t)v41);
      }

    }
    else
    {
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __49__FCTranslationManager_fetchTranslationProvider___block_invoke_33;
      v42[3] = &unk_1E463DC60;
      v34 = *(id *)(a1 + 64);
      v44 = v3;
      v45 = v34;
      v43 = *(id *)(a1 + 48);
      v35 = v43;
      __49__FCTranslationManager_fetchTranslationProvider___block_invoke_33((uint64_t)v42);

      v7 = 0;
    }
  }

}

uint64_t __49__FCTranslationManager_fetchTranslationProvider___block_invoke_2_32(_QWORD *a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = a1[4];
    v5 = a1[5];
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Fetch operation %@ error %@", (uint8_t *)&v6, 0x16u);
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, a1[5]);
  return result;
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_33(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[16];

  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "No resource provided back from fetch operation", buf, 2u);
  }
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "fetchedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Failed to find a resource for ID %@, got back %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fc_missingResourceErrorWithDescription:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v9);

  }
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_37(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Resource had no fileURL", buf, 2u);
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got a nil fileURL for resource %@"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 19, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v7);

  }
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_40(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Failed to get data from fileURL %@", buf, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get data from fileURL %@"), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 19, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v8);

  }
}

void __49__FCTranslationManager_fetchTranslationProvider___block_invoke_43(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = FCTranslationLog;
  if (os_log_type_enabled((os_log_t)FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Failed to turn data into NTPBTranslationMap", buf, 2u);
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to initialize NTPBTranslationMap with data %@"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 19, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v7);

  }
}

- (FCAsyncSerialQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setTranslationMap:(id)a3
{
  objc_storeStrong((id *)&self->_translationMap, a3);
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_translationMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
