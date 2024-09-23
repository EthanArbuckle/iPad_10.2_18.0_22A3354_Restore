@implementation ML3UpdateSiriIndexOperation

- (unint64_t)type
{
  return 8;
}

- (BOOL)_execute:(id *)a3
{
  void *v4;
  id v5;
  NSMutableArray *v6;
  NSMutableArray *donators;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  dispatch_group_t v17;
  NSObject *v18;
  id v19;
  os_log_t v20;
  dispatch_time_t v21;
  NSObject *v22;
  int v23;
  BOOL v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  NSObject *v29;
  id v30;
  os_log_t v31;
  uint64_t *v32;
  _BYTE *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t v41[4];
  ML3UpdateSiriIndexOperation *v42;
  __int16 v43;
  int v44;
  _BYTE buf[24];
  void *v46;
  uint64_t *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v4 = (void *)getKVDonatorClass_softClass;
  v40 = getKVDonatorClass_softClass;
  if (!getKVDonatorClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getKVDonatorClass_block_invoke;
    v46 = &unk_1E5B64C48;
    v47 = &v37;
    __getKVDonatorClass_block_invoke((uint64_t)buf);
    v4 = (void *)v38[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v37, 8);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    donators = self->_donators;
    self->_donators = v6;

    -[ML3DatabaseOperation library](self, "library");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "currentContentRevision");
    objc_msgSend(v8, "libraryUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForDatabaseProperty:", CFSTR("MLSiriIndexValidityRevision"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "longLongValue");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld-%lld"), v10, 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.amp.medialibrary", "Indexing");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[ML3DatabaseOperation library](self, "library");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "databasePath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2114;
      v46 = v16;
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - starting index validity=%{public}@ databasePath=%{public}@", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v46) = 1;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v17 = dispatch_group_create();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __40__ML3UpdateSiriIndexOperation__execute___block_invoke;
    v28[3] = &unk_1E5B64B30;
    v32 = &v37;
    v28[4] = self;
    v34 = v5;
    v18 = v17;
    v29 = v18;
    v35 = v9;
    v19 = v13;
    v30 = v19;
    v33 = buf;
    v36 = v12;
    v20 = v8;
    v31 = v20;
    -[ML3UpdateSiriIndexOperation _enumerateUserIDsWithBlock:](self, "_enumerateUserIDsWithBlock:", v28);
    v21 = dispatch_time(0, (uint64_t)((double)v38[3] * 6.0e10));
    dispatch_group_wait(v18, v21);
    v22 = os_log_create("com.apple.amp.medialibrary", "Indexing");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
      *(_DWORD *)v41 = 134218240;
      v42 = self;
      v43 = 1024;
      v44 = v23;
      _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - operation complete [success = %{BOOL}u]", v41, 0x12u);
    }

    v24 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v20 = os_log_create("com.apple.amp.medialibrary", "Indexing");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[ML3DatabaseOperation library](self, "library");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "databasePath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v26;
      _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - skipping index [missing KVDonator class] databasePath=%{public}@", buf, 0x16u);

    }
    v24 = 1;
  }

  return v24;
}

- (void)_enumerateUserIDsWithBlock:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (BOOL)_performFullIndexToRevision:(int64_t)a3 withDatasetStream:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  int64_t v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  ML3UpdateSiriIndexOperation *v23;
  _BYTE *v24;
  _BYTE buf[24];
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(v6, "errorCode");
  v8 = os_log_create("com.apple.amp.medialibrary", "Indexing");
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == 15)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a3;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - skipping full index [same revision] revision=%lld", buf, 0x16u);
    }
    v10 = 0;
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a3;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - performing full index toRevision=%lld", buf, 0x16u);
    }

    -[ML3DatabaseOperation library](self, "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "libraryUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init((Class)getKVMediaItemBuilderClass());
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v26 = 1;
    v14 = +[ML3Entity revisionTrackingCode](ML3Entity, "revisionTrackingCode");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__ML3UpdateSiriIndexOperation__performFullIndexToRevision_withDatasetStream___block_invoke;
    v18[3] = &unk_1E5B64B58;
    v15 = v13;
    v19 = v15;
    v8 = v11;
    v20 = v8;
    v16 = v12;
    v21 = v16;
    v23 = self;
    v24 = buf;
    v22 = v6;
    -[NSObject enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:](v8, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:", 0, v14, 0, 0, 0, v18);
    v10 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }

  return v10;
}

- (BOOL)_performIncrementalIndexToRevision:(int64_t)a3 withDatasetStream:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  int64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  ML3UpdateSiriIndexOperation *v24;
  _BYTE *v25;
  _BYTE buf[24];
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.medialibrary", "Indexing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v6, "priorVersion");
    *(_WORD *)&buf[22] = 2048;
    v27 = a3;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - performing incremental index fromRevision=%llu toRevision=%lld", buf, 0x20u);
  }

  -[ML3DatabaseOperation library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init((Class)getKVMediaItemBuilderClass());
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v27) = 1;
  v11 = objc_msgSend(v6, "priorVersion");
  v12 = +[ML3Entity revisionTrackingCode](ML3Entity, "revisionTrackingCode");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__ML3UpdateSiriIndexOperation__performIncrementalIndexToRevision_withDatasetStream___block_invoke;
  v19[3] = &unk_1E5B64B58;
  v13 = v10;
  v20 = v13;
  v14 = v8;
  v21 = v14;
  v15 = v9;
  v22 = v15;
  v16 = v6;
  v24 = self;
  v25 = buf;
  v23 = v16;
  objc_msgSend(v14, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:forMediaTypes:inUsersLibrary:usingBlock:", v11, v12, 0, 0, 0, v19);
  v17 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v17;
}

- (NSMutableArray)donators
{
  return self->_donators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donators, 0);
}

void __84__ML3UpdateSiriIndexOperation__performIncrementalIndexToRevision_withDatasetStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, _BYTE *a7)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1AF43CC0C]();
  if (a5)
  {
    +[ML3Entity URLForEntityWithPersistentID:libraryUID:](ML3Track, "URLForEntityWithPersistentID:libraryUID:", a2, *(_QWORD *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = *(void **)(a1 + 56);
      v22 = 0;
      objc_msgSend(v15, "removeItemWithItemId:error:", v14, &v22);
      v16 = v22;
      if (v16)
      {
        if (a7)
          *a7 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        v17 = os_log_create("com.apple.amp.medialibrary", "Indexing");
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        v18 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 134218242;
        v25 = v18;
        v26 = 2114;
        v27 = v16;
        v19 = "ML3UpdateSiriIndexOperation %p - not deleting item [incremental] because of error=%{public}@";
LABEL_14:
        _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0x16u);
LABEL_15:

        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else
  {
    _CreateKVItem(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a2, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v20 = *(void **)(a1 + 56);
      v23 = 0;
      objc_msgSend(v20, "addOrUpdateItem:error:", v14, &v23);
      v16 = v23;
      if (v16)
      {
        if (a7)
          *a7 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        v17 = os_log_create("com.apple.amp.medialibrary", "Indexing");
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        v21 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 134218242;
        v25 = v21;
        v26 = 2114;
        v27 = v16;
        v19 = "ML3UpdateSiriIndexOperation %p - not adding item [incremental] because of error=%{public}@";
        goto LABEL_14;
      }
LABEL_16:

    }
  }

  objc_autoreleasePoolPop(v12);
}

void __77__ML3UpdateSiriIndexOperation__performFullIndexToRevision_withDatasetStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, _BYTE *a7)
{
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1AF43CC0C]();
  if (!a5)
  {
    _CreateKVItem(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a2, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = *(void **)(a1 + 56);
      v18 = 0;
      objc_msgSend(v14, "registerItem:error:", v13, &v18);
      v15 = v18;
      if (v15)
      {
        if (a7)
          *a7 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        v16 = os_log_create("com.apple.amp.medialibrary", "Indexing");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 134218242;
          v20 = v17;
          v21 = 2114;
          v22 = v15;
          _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "ML3UpdateSiriIndexOperation %p - not donating items because of error=%{public}@", buf, 0x16u);
        }

      }
    }

  }
  objc_autoreleasePoolPop(v12);
}

void __40__ML3UpdateSiriIndexOperation__execute___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  id *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE buf[24];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v4 = os_log_create("com.apple.amp.medialibrary", "Indexing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - indexing userID=%{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 80);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v7 = (id *)getKVOriginAppIdMediaPlayerSymbolLoc_ptr;
  v27 = getKVOriginAppIdMediaPlayerSymbolLoc_ptr;
  if (!getKVOriginAppIdMediaPlayerSymbolLoc_ptr)
  {
    v8 = KoaLibrary();
    v7 = (id *)dlsym(v8, "KVOriginAppIdMediaPlayer");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v7;
    getKVOriginAppIdMediaPlayerSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(buf, 8);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getKVOriginAppIdMediaPlayer(void)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("ML3UpdateSiriIndexOperation.m"), 37, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v9 = *v7;
  if (v3)
  {
    v24 = 0;
    objc_msgSend(v6, "donatorWithItemType:originAppId:userId:error:", 5, v9, v3, &v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)&v24;
  }
  else
  {
    v25 = 0;
    objc_msgSend(v6, "donatorWithItemType:originAppId:error:", 5, v9, &v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)&v25;
  }
  v12 = *v11;

  if (v12)
  {
    v13 = os_log_create("com.apple.amp.medialibrary", "Indexing");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "ML3UpdateSiriIndexOperation %p - failed to index [failed to get donator] error=%{public}@", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "addObject:", v10);
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __40__ML3UpdateSiriIndexOperation__execute___block_invoke_4;
    v19[3] = &unk_1E5B64B08;
    v15 = *(_QWORD *)(a1 + 72);
    v19[4] = *(_QWORD *)(a1 + 32);
    v22 = v15;
    v23 = *(_OWORD *)(a1 + 88);
    v16 = *(_QWORD *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    v21 = *(id *)(a1 + 40);
    objc_msgSend(v10, "donateWithOptions:version:validity:usingStream:", 1, (_QWORD)v23, v16, v19);

  }
}

void __40__ML3UpdateSiriIndexOperation__execute___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE buf[24];
  void *v35;
  uint64_t *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Indexing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "ML3UpdateSiriIndexOperation %p - failed to index [call to donate failed] error=%{public}@", buf, 0x16u);
    }

LABEL_23:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    goto LABEL_24;
  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v9 = (void *)getKVIncrementalDatasetStreamClass_softClass;
  v33 = getKVIncrementalDatasetStreamClass_softClass;
  if (!getKVIncrementalDatasetStreamClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getKVIncrementalDatasetStreamClass_block_invoke;
    v35 = &unk_1E5B64C48;
    v36 = &v30;
    __getKVIncrementalDatasetStreamClass_block_invoke((uint64_t)buf);
    v9 = (void *)v31[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v30, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_performIncrementalIndexToRevision:withDatasetStream:", *(_QWORD *)(a1 + 64), v5) & 1) == 0)goto LABEL_20;
  }
  else
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v11 = (void *)getKVFullDatasetStreamClass_softClass;
    v33 = getKVFullDatasetStreamClass_softClass;
    if (!getKVFullDatasetStreamClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getKVFullDatasetStreamClass_block_invoke;
      v35 = &unk_1E5B64C48;
      v36 = &v30;
      __getKVFullDatasetStreamClass_block_invoke((uint64_t)buf);
      v11 = (void *)v31[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v30, 8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = os_log_create("com.apple.amp.medialibrary", "Indexing");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v19 = *(_QWORD *)(a1 + 32);
        v20 = (void *)objc_opt_class();
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v20;
        v21 = v20;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_FAULT, "ML3UpdateSiriIndexOperation %p - failed to index [invalid dataset stream] type=%{public}@", buf, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      goto LABEL_20;
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "_performFullIndexToRevision:withDatasetStream:", *(_QWORD *)(a1 + 64), v5))
    {
LABEL_20:
      v22 = os_log_create("com.apple.amp.medialibrary", "Indexing");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v23;
        _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - calling stream cancel", buf, 0xCu);
      }

      objc_msgSend(v5, "cancel");
      goto LABEL_23;
    }
  }
  v13 = os_log_create("com.apple.amp.medialibrary", "Indexing");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v14;
    _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - calling stream finish", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __40__ML3UpdateSiriIndexOperation__execute___block_invoke_5;
  v24[3] = &unk_1E5B64AE0;
  v15 = *(_QWORD *)(a1 + 72);
  v28 = *(_QWORD *)(a1 + 56);
  v29 = v15;
  v16 = *(id *)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 32);
  v25 = v16;
  v26 = v17;
  v27 = *(id *)(a1 + 48);
  objc_msgSend(v5, "finish:", v24);

LABEL_24:
}

void __40__ML3UpdateSiriIndexOperation__execute___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3 == 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64) + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forDatabaseProperty:", v5, CFSTR("MLSiriIndexValidityRevision"));

  }
  v6 = os_log_create("com.apple.amp.medialibrary", "Indexing");
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218242;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "ML3UpdateSiriIndexOperation %p - finished index error=%{public}@", (uint8_t *)&v11, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 134217984;
    v12 = v10;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - finished index", (uint8_t *)&v11, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

@end
