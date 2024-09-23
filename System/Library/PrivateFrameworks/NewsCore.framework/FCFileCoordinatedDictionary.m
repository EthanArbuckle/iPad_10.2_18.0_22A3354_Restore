@implementation FCFileCoordinatedDictionary

void __60__FCFileCoordinatedDictionary_writeWithAccessor_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void (**v5)(id, uint64_t);

  v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "writeSyncWithAccessor:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  v5[2](v5, v3);

}

- (BOOL)writeSyncWithAccessor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", self);
  -[FCFileCoordinatedDictionary presentedItemURL](self, "presentedItemURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__FCFileCoordinatedDictionary_writeSyncWithAccessor___block_invoke;
  v10[3] = &unk_1E4647F78;
  v12 = &v18;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v13 = &v14;
  objc_msgSend(v5, "coordinateWritingItemAtURL:options:error:byAccessor:", v6, 4, 0, v10);

  if (v7 && !*((_BYTE *)v15 + 24))
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  v8 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

void __53__FCFileCoordinatedDictionary_writeSyncWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = FCReadWriteDictionaryWithAccessor(v4, v5, v4, 0, *(void **)(a1 + 40));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (FCFileCoordinatedDictionary)initWithFileURL:(id)a3 allowedClasses:(id)a4
{
  id v6;
  id v7;
  FCFileCoordinatedDictionary *v8;
  uint64_t v9;
  NSURL *fileURL;
  void *v11;
  uint64_t v12;
  NSSet *allowedClasses;
  uint64_t v14;
  NSURL *presentedItemURL;
  uint64_t v16;
  NSOperationQueue *presentedItemOperationQueue;
  uint64_t v18;
  FCAsyncSerialQueue *asyncAccessQueue;
  void *v21;
  objc_super v22;
  _QWORD v23[2];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "fileURL");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCFileCoordinatedDictionary initWithFileURL:allowedClasses:]";
    v26 = 2080;
    v27 = "FCFileCoordinatedDictionary.m";
    v28 = 1024;
    v29 = 34;
    v30 = 2114;
    v31 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v22.receiver = self;
  v22.super_class = (Class)FCFileCoordinatedDictionary;
  v8 = -[FCFileCoordinatedDictionary init](&v22, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    fileURL = v8->_fileURL;
    v8->_fileURL = (NSURL *)v9;

    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    allowedClasses = v8->_allowedClasses;
    v8->_allowedClasses = (NSSet *)v12;

    v14 = objc_msgSend(v6, "copy");
    presentedItemURL = v8->_presentedItemURL;
    v8->_presentedItemURL = (NSURL *)v14;

    v16 = objc_opt_new();
    presentedItemOperationQueue = v8->_presentedItemOperationQueue;
    v8->_presentedItemOperationQueue = (NSOperationQueue *)v16;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_presentedItemOperationQueue, "setMaxConcurrentOperationCount:", 1);
    v18 = objc_opt_new();
    asyncAccessQueue = v8->_asyncAccessQueue;
    v8->_asyncAccessQueue = (FCAsyncSerialQueue *)v18;

  }
  return v8;
}

- (void)writeWithAccessor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessor");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCFileCoordinatedDictionary writeWithAccessor:completion:]";
    v17 = 2080;
    v18 = "FCFileCoordinatedDictionary.m";
    v19 = 1024;
    v20 = 104;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedDictionary asyncAccessQueue](self, "asyncAccessQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__FCFileCoordinatedDictionary_writeWithAccessor_completion___block_invoke;
  v12[3] = &unk_1E4647FC8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enqueueBlock:", v12);

}

- (FCAsyncSerialQueue)asyncAccessQueue
{
  return self->_asyncAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncAccessQueue, 0);
  objc_storeStrong((id *)&self->_allowedClasses, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_storeStrong((id *)&self->_presentedItemURL, 0);
}

- (FCFileCoordinatedDictionary)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFileCoordinatedDictionary init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedDictionary.m";
    v11 = 1024;
    v12 = 29;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFileCoordinatedDictionary init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)readSyncWithAccessor:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = (void (**)(id, _QWORD))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__60;
  v18 = __Block_byref_object_dispose__60;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", self);
  -[FCFileCoordinatedDictionary presentedItemURL](self, "presentedItemURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__FCFileCoordinatedDictionary_readSyncWithAccessor___block_invoke;
  v9[3] = &unk_1E4647F50;
  v9[4] = self;
  v9[5] = &v14;
  v9[6] = &v10;
  objc_msgSend(v5, "coordinateReadingItemAtURL:options:error:byAccessor:", v6, 0, 0, v9);

  if (v4)
    v4[2](v4, v15[5]);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __52__FCFileCoordinatedDictionary_readSyncWithAccessor___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCReadDictionary(v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
}

- (void)readWithAccessor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessor");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCFileCoordinatedDictionary readWithAccessor:]";
    v12 = 2080;
    v13 = "FCFileCoordinatedDictionary.m";
    v14 = 1024;
    v15 = 94;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedDictionary asyncAccessQueue](self, "asyncAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__FCFileCoordinatedDictionary_readWithAccessor___block_invoke;
  v8[3] = &unk_1E4647FA0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "enqueueBlock:", v8);

}

void __48__FCFileCoordinatedDictionary_readWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void (**v4)(void);

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "readSyncWithAccessor:", v3);
  v4[2]();

}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

@end
