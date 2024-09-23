@implementation FCFeedDatabase

id __60__FCFeedDatabase_enumerateRangesMissingFromLookups_visitor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(id *)(a2 + 16);
  else
    return 0;
}

void __35__FCFeedDatabase__synchronizedInit__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  FCFDBStorage *v26;
  FCFDBPruningPolicy *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  id value;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      if ((objc_msgSend((id)v3, "usage") & 4) != 0)
        v4 = 6;
      else
        v4 = 4;
      if (!NSClassFromString(CFSTR("XCTest")))
      {
        v5 = *(void **)(v3 + 16);
        if (v5)
        {
          objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("feeddatabase"), 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "path");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

          if (v9)
          {
            LOWORD(value) = 0;
            v10 = objc_retainAutorelease(v6);
            getxattr((const char *)objc_msgSend(v10, "fileSystemRepresentation"), "com.apple.newscore.storeVersion", &value, 2uLL, 0, 0);
            v11 = (unsigned __int16)value;
            v12 = *(unsigned __int16 *)(v3 + 8);
            if ((unsigned __int16)value != (_DWORD)v12)
            {
              v13 = FCFeedDatabaseLog;
              if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                v38 = v11;
                v39 = 2048;
                v40 = v12;
                _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "wiping feed database because persisted version %lu does not match current version %lu", buf, 0x16u);
              }
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "removeItemAtURL:error:", v10, 0);

            }
          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "path");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "fileExistsAtPath:", v16);

          if ((v17 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "path");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "createFileAtPath:contents:attributes:", v19, 0, 0);

            setxattr((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), "com.apple.newscore.storeVersion", (const void *)(v3 + 8), 2uLL, 0, 0);
          }
          value = 0;
          v20 = objc_msgSend(v6, "getResourceValue:forKey:error:", &value, *MEMORY[0x1E0C99998], 0);
          v21 = value;
          if (v20)
          {
            v22 = (void *)FCFeedDatabaseLog;
            if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
            {
              v23 = (void *)MEMORY[0x1E0CB34E8];
              v24 = v22;
              objc_msgSend(v23, "stringFromByteCount:countStyle:", objc_msgSend(v21, "unsignedLongLongValue"), 0);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v38 = (uint64_t)v25;
              _os_log_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_DEFAULT, "feed database takes up %{public}@ on disk", buf, 0xCu);

            }
          }
          v26 = [FCFDBStorage alloc];
          v27 = -[FCFDBPruningPolicy initWithMaxAgeToPersist:]([FCFDBPruningPolicy alloc], "initWithMaxAgeToPersist:", 1209600.0);
          v28 = -[FCFDBStorage initWithFileURL:options:pruningPolicy:](v26, "initWithFileURL:options:pruningPolicy:", v6, v4, v27);
          v29 = *(void **)(v3 + 48);
          *(_QWORD *)(v3 + 48) = v28;

        }
      }
      if (!*(_QWORD *)(v3 + 48))
      {
        v30 = FCFeedDatabaseLog;
        if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1B90000, v30, OS_LOG_TYPE_DEFAULT, "will use in-memory storage", buf, 2u);
        }
        v31 = -[FCFDBStorage initTransientWithOptions:]([FCFDBStorage alloc], "initTransientWithOptions:", v4);
        v32 = *(void **)(v3 + 48);
        *(_QWORD *)(v3 + 48) = v31;

      }
    }
    v33 = (void *)FCFeedDatabaseLog;
    if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v33;
      v35 = objc_msgSend(v2, "fc_millisecondTimeIntervalUntilNow");
      *(_DWORD *)buf = 134217984;
      v38 = v35;
      _os_log_impl(&dword_1A1B90000, v34, OS_LOG_TYPE_DEFAULT, "feed database took %llums to initialize", buf, 0xCu);

    }
  }
}

- (int64_t)usage
{
  return self->_usage;
}

void __60__FCFeedDatabase_enumerateRangesMissingFromLookups_visitor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id obj;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "fc_arrayByTransformingWithBlock:", &__block_literal_global_96);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(void **)(v3 + 48);
  else
    v4 = 0;
  v17 = (void *)v2;
  objc_msgSend(v4, "feedsForFeedIDs:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        if (v11)
          v12 = *(_QWORD *)(v11 + 16);
        else
          v12 = 0;
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v9;
        v19[1] = 3221225472;
        v19[2] = __60__FCFeedDatabase_enumerateRangesMissingFromLookups_visitor___block_invoke_3;
        v19[3] = &unk_1E4645230;
        v19[4] = v11;
        v15 = v14;
        v20 = v15;
        objc_msgSend(v13, "enumerateGapsWithBlock:", v19);
        if (objc_msgSend(v15, "count"))
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        ++v10;
      }
      while (v7 != v10);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v7 = v16;
    }
    while (v16);
  }

}

void __60__FCFeedDatabase_enumerateRangesMissingFromLookups_visitor___block_invoke_3(uint64_t a1, void *a2, BOOL *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(_QWORD *)(v6 + 24);
  else
    v7 = 0;
  v17 = v5;
  if (objc_msgSend(v5, "intersectsRange:", v7))
  {
    v8 = *(_QWORD **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    if (v8)
      v8 = (_QWORD *)v8[3];
    v10 = v8;
    objc_msgSend(v17, "feedRangeByIntersectingWithRange:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

  }
  objc_msgSend(v17, "bottom");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "order");
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    v15 = *(void **)(v14 + 24);
  else
    v15 = 0;
  objc_msgSend(v15, "bottom");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = v13 <= objc_msgSend(v16, "order");

}

- (FCFeedDatabase)initWithParentDirectoryURL:(id)a3 usage:(int64_t)a4 endpoint:(int64_t)a5
{
  id v8;
  FCFeedDatabase *v9;
  uint64_t v10;
  NSURL *parentDirectoryURL;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *initQueue;
  NSObject *v15;
  __int16 v16;
  NSObject *v17;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FCFeedDatabase;
  v9 = -[FCFeedDatabase init](&v20, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    parentDirectoryURL = v9->_parentDirectoryURL;
    v9->_parentDirectoryURL = (NSURL *)v10;

    if (a4 == 1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed database should not be created if it's not intended for use"));
      *(_DWORD *)buf = 136315906;
      v22 = "-[FCFeedDatabase initWithParentDirectoryURL:usage:endpoint:]";
      v23 = 2080;
      v24 = "FCFeedDatabase.m";
      v25 = 1024;
      v26 = 87;
      v27 = 2114;
      v28 = v19;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v9->_usage = a4;
    v9->_endpoint = a5;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.news.feeddb.init", v12);
    initQueue = v9->_initQueue;
    v9->_initQueue = (OS_dispatch_queue *)v13;

    if (a5 == 1)
    {
      v17 = FCFeedDatabaseLog;
      if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEFAULT, "feed database will use the OrderFeed endpoint", buf, 2u);
      }
      v16 = 1028;
    }
    else if (a5)
    {
      v16 = 24;
    }
    else
    {
      v15 = FCFeedDatabaseLog;
      if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "feed database will use the MultiFeed endpoint", buf, 2u);
      }
      v16 = 25;
    }
    v9->_version = v16;
  }

  return v9;
}

- (void)enumerateRangesMissingFromLookups:(void *)a3 visitor:
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__FCFeedDatabase_enumerateRangesMissingFromLookups_visitor___block_invoke;
    v7[3] = &unk_1E463CCB8;
    v8 = v5;
    v9 = a1;
    v10 = v6;
    -[FCFeedDatabase _performWithStorageAndWait:](a1, v7);

  }
}

- (void)_performWithStorageAndWait:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = a2;
    if (!NSClassFromString(CFSTR("XCTest"))
      && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("This operation must not be performed on the main thread."));
      v5 = 136315906;
      v6 = "-[FCFeedDatabase _performWithStorageAndWait:]";
      v7 = 2080;
      v8 = "FCFeedDatabase.m";
      v9 = 1024;
      v10 = 533;
      v11 = 2114;
      v12 = v4;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

    }
    -[FCFeedDatabase _synchronizedInit](a1);
    objc_msgSend(*(id *)(a1 + 48), "accessWithBlock:", v3);

  }
}

- (void)_synchronizedInit
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__FCFeedDatabase__synchronizedInit__block_invoke;
    block[3] = &unk_1E463AB18;
    block[4] = a1;
    dispatch_sync(v1, block);
  }
}

+ (id)temporaryFeedDatabaseWithEndpoint:(int64_t)a3
{
  return -[FCFeedDatabase initWithParentDirectoryURL:usage:endpoint:]([FCFeedDatabase alloc], "initWithParentDirectoryURL:usage:endpoint:", 0, 2, a3);
}

- (id)performDatabaseLookups:(id)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__FCFeedDatabase_performDatabaseLookups___block_invoke;
    v8[3] = &unk_1E463B228;
    v8[4] = a1;
    v9 = v3;
    v5 = v4;
    v10 = v5;
    -[FCFeedDatabase _performWithStorageAndWait:]((uint64_t)a1, v8);
    v6 = v10;
    a1 = v5;

  }
  return a1;
}

void __41__FCFeedDatabase_performDatabaseLookups___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  void *v73;
  id obj;
  id obja;
  void *v76;
  void *v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  id v88;
  id v89;
  uint64_t v90;
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint8_t v98[128];
  _BYTE buf[24];
  void *v100;
  id v101;
  _BYTE v102[128];
  uint64_t v103;

  v1 = a1;
  v103 = *MEMORY[0x1E0C80C00];
  -[FCFeedDatabase _feedsForLookups:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v4 = *(id *)(v1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v84;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v84 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v83 + 1) + 8 * v8);
        if (v9)
          v10 = v9[2];
        else
          v10 = 0;
        objc_msgSend(v2, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFeedDatabase _shortCircuitLookup:withFeed:](*(_QWORD *)(v1 + 32), v9, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if (v9)
            v13 = v9[2];
          else
            v13 = 0;
          objc_msgSend(*(id *)(v1 + 48), "setObject:forKey:", v12, v13);
        }
        else
        {
          objc_msgSend(v3, "addObject:", v9);
        }

        ++v8;
      }
      while (v6 != v8);
      v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
      v6 = v14;
    }
    while (v14);
  }

  v15 = *(_QWORD *)(v1 + 32);
  v16 = v3;
  v17 = v2;
  v78 = v1;
  if (!v15)
  {
    v77 = 0;
    goto LABEL_58;
  }
  v70 = v15;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v71 = v16;
  v19 = v16;
  obj = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
  if (!obj)
  {
    v76 = 0;
    v73 = 0;
    goto LABEL_50;
  }
  v76 = 0;
  v20 = *(_QWORD *)v94;
  v72 = *(_QWORD *)v94;
  v73 = 0;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v94 != v20)
        objc_enumerationMutation(v19);
      v22 = *(_QWORD **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v21);
      if (v22)
        v23 = v22[2];
      else
        v23 = 0;
      objc_msgSend(v17, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "feedID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          v27 = (void *)v22[3];
        else
          v27 = 0;
        v28 = v27;
        objc_msgSend(v18, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v26);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v26);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v30, v28);
        }

        if (v22)
        {
          v31 = v22[4];
          if ((unint64_t)(v31 + 1) >= 2)
          {
            v32 = v19;
            v33 = v18;
            v34 = v17;
            v35 = v73;
            if (!v73)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v22[4];
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31 + 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = v35;
            objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, v26);

            v17 = v34;
            v18 = v33;
            v19 = v32;
            v20 = v72;
          }
          if (!v76)
          {
            v37 = (void *)v22[5];
            goto LABEL_39;
          }
        }
        else
        {
          v37 = v76;
          if (!v76)
          {
LABEL_39:
            v38 = v37;

            v76 = v38;
          }
        }

        v1 = v78;
      }

      v21 = (char *)v21 + 1;
    }
    while (obj != v21);
    v39 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
    obj = (id)v39;
  }
  while (v39);
LABEL_50:

  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = MEMORY[0x1E0C809B0];
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __53__FCFeedDatabase__feedItemsForLookups_withFeedsByID___block_invoke;
    v87[3] = &unk_1E4645258;
    v43 = v19;
    v88 = v43;
    v44 = v41;
    v89 = v44;
    v90 = v70;
    v91 = v76;
    v92 = v73;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v87);
    v45 = (void *)FCFeedDatabaseLog;
    if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v46 = v45;
      v47 = objc_msgSend(v40, "fc_millisecondTimeIntervalUntilNow");
      v48 = objc_msgSend(v44, "count");
      v49 = objc_msgSend(v43, "count");
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v48;
      v1 = v78;
      *(_WORD *)&buf[22] = 2048;
      v100 = (void *)v49;
      _os_log_impl(&dword_1A1B90000, v46, OS_LOG_TYPE_DEFAULT, "feed database took %llums to lookup %lu feed items across %lu feeds", buf, 0x20u);

    }
    v16 = v71;
    if ((unint64_t)objc_msgSend(v18, "count") >= 2)
      objc_msgSend(v44, "sortUsingSelector:", sel_compareOrderDescending_);
    v50 = (void *)MEMORY[0x1E0C99D80];
    *(_QWORD *)buf = v42;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __53__FCFeedDatabase__feedItemsForLookups_withFeedsByID___block_invoke_51;
    v100 = &unk_1E463AA78;
    v101 = v44;
    v51 = v44;
    objc_msgSend(v50, "fc_dictionary:", buf);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
    v16 = v71;
  }
  v53 = v52;

  v77 = v53;
LABEL_58:
  v54 = v17;

  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  obja = v16;
  v55 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v80;
    do
    {
      v58 = 0;
      do
      {
        if (*(_QWORD *)v80 != v57)
          objc_enumerationMutation(obja);
        v59 = *(_QWORD **)(*((_QWORD *)&v79 + 1) + 8 * v58);
        v60 = *(_QWORD *)(v1 + 32);
        if (v59)
          v61 = (void *)v59[2];
        else
          v61 = 0;
        v62 = v61;
        objc_msgSend(v54, "objectForKeyedSubscript:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v59)
          v64 = (void *)v59[2];
        else
          v64 = 0;
        v65 = v64;
        objc_msgSend(v77, "objectForKeyedSubscript:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFeedDatabase _serviceLookup:withFeed:feedItems:](v60, v59, v63, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        v1 = v78;
        if (v59)
          v68 = v59[2];
        else
          v68 = 0;
        objc_msgSend(*(id *)(v78 + 48), "setObject:forKey:", v67, v68);

        ++v58;
      }
      while (v56 != v58);
      v69 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
      v56 = v69;
    }
    while (v69);
  }

}

- (id)_feedsForLookups:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v3 = *(id *)(a1 + 48);
    objc_msgSend(a2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_47_5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "feedsForFeedIDs:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (FCFeedDatabaseLookupResult)_shortCircuitLookup:(void *)a3 withFeed:
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  FCFeedDatabaseLookupResult *v9;
  const char *v10;
  FCFeedDatabaseLookupResult *v11;
  SEL v12;
  void *v13;
  void *v14;
  FCFeedDatabaseLookupResult *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  FCFeedInsertionToken *v20;
  void *v21;
  __objc2_class **v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __objc2_class **v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v46;
  void *v47;
  void *v48;
  unint64_t v49;
  BOOL v50;
  unint64_t v51;
  void *v52;

  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_37;
  }
  if (v5)
    v7 = (void *)v5[3];
  else
    v7 = 0;
  v8 = v7;
  if (objc_msgSend(v8, "isEmpty"))
  {
    v9 = objc_alloc_init(FCFeedDatabaseLookupResult);
    v11 = v9;
    if (v9)
    {
      objc_setProperty_nonatomic_copy(v9, v10, 0, 16);
      objc_setProperty_nonatomic_copy(v11, v12, v8, 24);
      v11->_exhaustedRange = 1;
    }
    goto LABEL_36;
  }
  if (!v5 || !*((_BYTE *)v5 + 8))
  {
    objc_msgSend(v6, "refreshRegion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && objc_msgSend(v13, "containsFeedRange:", v8))
    {
      v15 = objc_alloc_init(FCFeedDatabaseLookupResult);
      v11 = v15;
      if (v15)
        objc_setProperty_nonatomic_copy(v15, v16, 0, 16);
      objc_msgSend(v8, "top");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bottom");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v17, v18);
      v20 = (FCFeedInsertionToken *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_setProperty_nonatomic_copy(v11, v19, v20, 24);

        v11->_exhaustedRange = 1;
LABEL_35:

        goto LABEL_36;
      }
      goto LABEL_33;
    }
    objc_msgSend(v6, "fetchedRanges");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = off_1E4634000;
    if (objc_msgSend(v6, "refreshedFromOrder")
      && (objc_msgSend(v8, "top"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "top"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v23, "compareToCursor:", v24),
          v24,
          v23,
          v25 != 1))
    {
      if (v17)
      {
        objc_msgSend(v8, "top");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v18, "order");
        objc_msgSend(v17, "top");
        v20 = (FCFeedInsertionToken *)objc_claimAutoreleasedReturnValue();
        if (v46 <= -[FCFeedInsertionToken order](v20, "order"))
        {
          v11 = 0;
          goto LABEL_33;
        }
        objc_msgSend(v14, "bottom");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v47, "order");
        objc_msgSend(v17, "top");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "order");

        v50 = v51 > v49;
        v22 = off_1E4634000;
        if (!v50)
        {
          v11 = 0;
          goto LABEL_34;
        }
      }
      v52 = v17;
      v26 = v22;
      objc_msgSend(v14, "bottom");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = v17;
      v26 = off_1E4634000;
      +[FCFeedCursor cursorForCurrentDate](FCFeedCursor, "cursorForCurrentDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = v27;
    v29 = objc_msgSend(v27, "order");

    v11 = objc_alloc_init(FCFeedDatabaseLookupResult);
    objc_msgSend(v8, "top");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "top");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v32;
    if (v11)
    {
      objc_setProperty_nonatomic_copy(v11, v33, v32, 24);

      v11->_ckFromOrder = v29;
    }
    else
    {

    }
    objc_msgSend(v6, "fetchedRanges");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "bottom");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v18)
    {
      objc_msgSend(v18, "top");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "topmostCursor:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "order");
      if (v11)
        v11->_ckToOrder = v40 + 1;

    }
    else
    {
      v41 = objc_msgSend(v36, "order");
      if (v11)
        v11->_ckToOrder = v41 + 1;
    }

    v20 = objc_alloc_init(FCFeedInsertionToken);
    -[__objc2_class cursorForTopOfFeed](v26[119], "cursorForTopOfFeed");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "order");
    if (v20)
      v20->_fromOrder = v43;

    v17 = v52;
    if (v11)
    {
      v44 = v11->_ckToOrder - 1;
      if (!v20)
      {
LABEL_32:
        -[FCPurchaseLookupResult setIntroOffer:]((uint64_t)v11, v20);
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
    }
    else
    {
      v44 = -1;
      if (!v20)
        goto LABEL_32;
    }
    v20->_toOrder = v44;
    goto LABEL_32;
  }
  v11 = 0;
LABEL_36:

LABEL_37:
  return v11;
}

- (FCFeedDatabaseLookupResult)_serviceLookup:(void *)a3 withFeed:(void *)a4 feedItems:
{
  id v7;
  id v8;
  id v9;
  FCFeedDatabaseLookupResult *v10;
  id v11;
  unint64_t v12;
  _BOOL4 v13;
  void *v14;
  const char *v15;
  void *v16;
  NSArray *feedItems;
  NSArray *v18;
  void *v19;
  const char *v20;
  void *v21;
  NSArray *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSArray *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  void *v43;
  const char *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  unint64_t v50;
  void *v51;
  void *v52;
  SEL v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  unint64_t ckFromOrder;
  void *v62;
  uint64_t v63;
  void *v64;
  unint64_t v65;
  void *v66;
  unint64_t v67;
  BOOL v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  _QWORD *v76;
  char *v77;
  void *v78;
  void *v79;
  unint64_t v80;
  _QWORD *v81;
  id newValue;
  void *v83;
  void *v84;
  void *v85;
  uint8_t buf[4];
  const char *v87;
  __int16 v88;
  char *v89;
  __int16 v90;
  _QWORD v91[3];

  v91[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
  {
    v10 = 0;
    goto LABEL_21;
  }
  v10 = objc_alloc_init(FCFeedDatabaseLookupResult);
  if (v7)
  {
    v11 = *((id *)v7 + 3);
    v12 = *((_QWORD *)v7 + 4);
    v13 = *((_BYTE *)v7 + 8) != 0;
  }
  else
  {
    v12 = 0;
    v11 = 0;
    v13 = 0;
  }
  if (objc_msgSend(v11, "isEmpty") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("empty feed ranges aren't handled yet"));
    *(_DWORD *)buf = 136315906;
    v87 = "-[FCFeedDatabase _serviceLookup:withFeed:feedItems:]";
    v88 = 2080;
    v89 = "FCFeedDatabase.m";
    v90 = 1024;
    LODWORD(v91[0]) = 803;
    WORD2(v91[0]) = 2114;
    *(_QWORD *)((char *)v91 + 6) = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v13)
      goto LABEL_7;
  }
  else if (v13)
  {
LABEL_7:
    objc_msgSend(v9, "fc_subarrayWithMaxCount:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    if (v10)
    {
      objc_setProperty_nonatomic_copy(v10, v15, v14, 16);

      feedItems = v10->_feedItems;
    }
    else
    {

      feedItems = 0;
    }
    v18 = feedItems;
    FCFeedRangeCoveredByFeedItems(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    if (v10)
    {
      objc_setProperty_nonatomic_copy(v10, v20, v19, 24);

      v22 = v10->_feedItems;
    }
    else
    {

      v22 = 0;
    }
    v23 = v22;
    v24 = -[NSArray count](v23, "count");
    v25 = objc_msgSend(v9, "count");
    if (v10)
      v10->_exhaustedRange = v24 != v25;
    goto LABEL_20;
  }
  objc_msgSend(v8, "refreshRegion");
  v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v23 = v27;
  if (!v27)
    goto LABEL_80;
  if (-[NSArray containsFeedRange:](v27, "containsFeedRange:", v11))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("this case should have been short-circuited"));
      *(_DWORD *)buf = 136315906;
      v87 = "-[FCFeedDatabase _serviceLookup:withFeed:feedItems:]";
      v88 = 2080;
      v89 = "FCFeedDatabase.m";
      v90 = 1024;
      LODWORD(v91[0]) = 816;
      WORD2(v91[0]) = 2114;
      *(_QWORD *)((char *)v91 + 6) = v28;
      v29 = MEMORY[0x1E0C81028];
LABEL_40:
      _os_log_error_impl(&dword_1A1B90000, v29, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      goto LABEL_20;
    }
    goto LABEL_20;
  }
  objc_msgSend(v11, "top");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray top](v23, "top");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "compareToCursor:", v31);

  if (v32 == 1)
  {
LABEL_80:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("this case should have been short-circuited"));
      *(_DWORD *)buf = 136315906;
      v87 = "-[FCFeedDatabase _serviceLookup:withFeed:feedItems:]";
      v88 = 2080;
      v89 = "FCFeedDatabase.m";
      v90 = 1024;
      LODWORD(v91[0]) = 820;
      WORD2(v91[0]) = 2114;
      *(_QWORD *)((char *)v91 + 6) = v28;
      v29 = MEMORY[0x1E0C81028];
      goto LABEL_40;
    }
    goto LABEL_20;
  }
  objc_msgSend(v8, "fetchedRanges");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    objc_msgSend(v8, "contiguousFetchedRangeInRange:", v11);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "top");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchedRangePrecedingOrder:", objc_msgSend(v37, "order"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "bottom");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchedRangeFollowingOrder:", objc_msgSend(v38, "order"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "fc_subarrayWithMaxCount:", v12);
    newValue = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(newValue, "count");
    v40 = objc_msgSend(v9, "count");
    v85 = v36;
    if (v36)
      v36 = (void *)objc_msgSend(v36, "containsFeedRange:", v11);
    if (objc_msgSend(v9, "count") >= v12 || (_DWORD)v36)
    {
      v80 = v40;
      if (v10)
      {
        v50 = v39;
        v51 = newValue;
        objc_setProperty_nonatomic_copy(v10, v41, newValue, 16);
        FCFeedRangeCoveredByFeedItems(newValue);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_nonatomic_copy(v10, v53, v52, 24);

        if (v50 >= v80)
          v54 = (char)v36;
        else
          v54 = 0;
        v10->_exhaustedRange = v54;
      }
      else
      {
        v51 = newValue;
        FCFeedRangeCoveredByFeedItems(newValue);

      }
      v56 = v84;
      v55 = v85;
LABEL_69:

      goto LABEL_20;
    }
    objc_msgSend(v11, "top");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "top");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v42, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_setProperty_nonatomic_copy(v10, v44, v45, 24);

    objc_msgSend(v85, "bottom");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "order");
    v48 = v47;
    if (v47)
    {
      v49 = 0;
    }
    else
    {
      objc_msgSend(v83, "bottom");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v79, "order");
      if (v47)
      {
        v49 = 0;
      }
      else
      {
        objc_msgSend(v8, "fetchedRanges");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "lastObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "bottom");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v36, "order");
        v49 = 1;
      }
    }
    if (v10)
      v10->_ckFromOrder = v47;
    if (v49)
    {

    }
    if (!v48)

    objc_msgSend(v84, "top");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "order");
    if (v10)
      v10->_ckToOrder = v58 + 1;

    v59 = objc_opt_new();
    v60 = (_QWORD *)v59;
    if (v10)
    {
      ckFromOrder = v10->_ckFromOrder;
      if (!v59)
      {
LABEL_55:
        objc_msgSend(v84, "top");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "order");
        if (v60)
          v60[2] = v63;
        v81 = v60;

        objc_msgSend(v11, "bottom");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "order");
        objc_msgSend(v84, "top");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "order");

        v68 = v65 > v67;
        v55 = v85;
        if (v68)
        {
          objc_msgSend(v11, "bottom");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "order");
          if (v10)
            v10->_ckToOrder = v70 + 1;

          objc_msgSend(v11, "bottom");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "order");
          if (v81)
            v81[2] = v72;

        }
        v73 = (id)FCFeedDatabaseLog;
        v56 = v84;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "feedID");
          v74 = objc_claimAutoreleasedReturnValue();
          v75 = (void *)v74;
          v76 = v81;
          if (v81)
          {
            v77 = (char *)v81[1];
            v76 = (_QWORD *)v81[2];
          }
          else
          {
            v77 = 0;
          }
          *(_DWORD *)buf = 138412802;
          v87 = (const char *)v74;
          v88 = 2048;
          v89 = v77;
          v90 = 2048;
          v91[0] = v76;
          _os_log_impl(&dword_1A1B90000, v73, OS_LOG_TYPE_DEFAULT, "trying to extend feed %@ from order %llu to order %llu", buf, 0x20u);

        }
        -[FCPurchaseLookupResult setIntroOffer:]((uint64_t)v10, v81);

        v51 = newValue;
        goto LABEL_69;
      }
    }
    else
    {
      ckFromOrder = 0;
      if (!v59)
        goto LABEL_55;
    }
    *(_QWORD *)(v59 + 8) = ckFromOrder;
    goto LABEL_55;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("this case should have been short-circuited"));
    *(_DWORD *)buf = 136315906;
    v87 = "-[FCFeedDatabase _serviceLookup:withFeed:feedItems:]";
    v88 = 2080;
    v89 = "FCFeedDatabase.m";
    v90 = 1024;
    LODWORD(v91[0]) = 824;
    WORD2(v91[0]) = 2114;
    *(_QWORD *)((char *)v91 + 6) = v28;
    v29 = MEMORY[0x1E0C81028];
    goto LABEL_40;
  }
LABEL_20:

LABEL_21:
  return v10;
}

- (id)performDatabaseLookups:(uint64_t)a3 boundedByCount:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = v5;
  if (a1)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v8)
    {
      v10 = v8;
      v11 = MEMORY[0x1E0C81028];
      v12 = *(_QWORD *)v26;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v7);
          v14 = *(_QWORD **)(*((_QWORD *)&v25 + 1) + 8 * v13);
          if (v14)
          {
            if (v14[5] && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("count-bounded lookups don't yet support required features"));
              *(_DWORD *)buf = 136315906;
              v30 = "-[FCFeedDatabase performDatabaseLookups:boundedByCount:]";
              v31 = 2080;
              v32 = "FCFeedDatabase.m";
              v33 = 1024;
              v34 = 170;
              v35 = 2114;
              v36 = v15;
              _os_log_error_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

            }
            v14[4] = a3;
            objc_setProperty_nonatomic_copy(v14, v9, 0, 40);
          }
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v10);
    }

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke;
    v21[3] = &unk_1E46451C0;
    v21[4] = a1;
    v22 = v7;
    v16 = v19;
    v23 = v16;
    v24 = a3;
    -[FCFeedDatabase _performWithStorageAndWait:]((uint64_t)a1, v21);
    v17 = v23;
    a1 = v16;

  }
  return a1;
}

void __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  char *__ptr32 *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  FCFeedDatabaseLookupResult *v70;
  const char *v71;
  FCFeedDatabaseLookupResult *v72;
  SEL v73;
  unint64_t v74;
  char v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  _QWORD *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  char *v102;
  id v103;
  id v104;
  uint64_t v105;
  id v106;
  unint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  id obj;
  id obja;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[5];
  id v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[4];
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[4];
  id v134;
  id v135;
  id v136;
  char *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _BYTE v143[128];
  uint8_t v144[128];
  uint8_t buf[4];
  uint64_t v146;
  __int16 v147;
  uint64_t v148;
  __int16 v149;
  uint64_t v150;
  uint8_t v151[4];
  const char *v152;
  __int16 v153;
  char *v154;
  __int16 v155;
  int v156;
  __int16 v157;
  void *v158;
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  -[FCFeedDatabase _feedsForLookups:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v130;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v130 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD **)(*((_QWORD *)&v129 + 1) + 8 * v7);
        if (v8)
          v9 = v8[2];
        else
          v9 = 0;
        objc_msgSend(v2, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFeedDatabase _shortCircuitLookup:withFeed:](*(_QWORD *)(a1 + 32), v8, v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11 && *(_QWORD *)(v11 + 40))
        {
          if (v8)
            v13 = v8[2];
          else
            v13 = 0;
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v11, v13);
        }

        ++v7;
      }
      while (v5 != v7);
      v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
      v5 = v14;
    }
    while (v14);
  }

  v15 = objc_msgSend(*(id *)(a1 + 48), "count");
  if (v15 < objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v16 = *(id *)(a1 + 32);
    v102 = *(char **)(a1 + 56);
    v17 = *(id *)(a1 + 40);
    v113 = v2;
    v18 = &off_1A1E81000;
    v19 = 0x1E0C99000;
    v99 = v2;
    v104 = v16;
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = 0u;
      v139 = 0u;
      v140 = 0u;
      v141 = 0u;
      v106 = v17;
      obj = v17;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v151, 16);
      if (v21)
      {
        v22 = v21;
        v109 = 0;
        v23 = *(_QWORD *)v139;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v139 != v23)
              objc_enumerationMutation(obj);
            v25 = *(_QWORD **)(*((_QWORD *)&v138 + 1) + 8 * v24);
            if (v25)
              v26 = v25[2];
            else
              v26 = 0;
            objc_msgSend(v113, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27)
            {
              objc_msgSend(v27, "feedID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
                v30 = (void *)v25[3];
              else
                v30 = 0;
              v31 = v30;
              objc_msgSend(v20, "objectForKeyedSubscript:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32)
              {
                objc_msgSend(v20, "objectForKeyedSubscript:", v31);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "addObject:", v29);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v29);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v33, v31);
              }

              if (v25)
              {
                v34 = v25[4];
                if ((unint64_t)(v34 + 1) >= 2)
                {
                  v35 = (uint64_t)v109;
                  if (!v109)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v35 = objc_claimAutoreleasedReturnValue();
                    v34 = v25[4];
                  }
                  v36 = (void *)v35;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34 + 1);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v109 = v36;
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, v29);

                }
              }

            }
            ++v24;
          }
          while (v22 != v24);
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v151, 16);
          v22 = v38;
        }
        while (v38);
      }
      else
      {
        v109 = 0;
      }

      if (objc_msgSend(v20, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0x1E0C99000uLL;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v133[0] = MEMORY[0x1E0C809B0];
        v18 = &off_1A1E81000;
        v133[1] = 3221225472;
        v133[2] = __68__FCFeedDatabase__feedItemsForLookups_withFeedsByID_boundedByCount___block_invoke;
        v133[3] = &unk_1E4645280;
        v41 = v40;
        v134 = v41;
        v135 = v104;
        v136 = v109;
        v137 = v102 + 1;
        objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v133);
        v42 = (void *)FCFeedDatabaseLog;
        if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
        {
          v43 = v42;
          v44 = objc_msgSend(v39, "fc_millisecondTimeIntervalUntilNow");
          v45 = objc_msgSend(v41, "count");
          v46 = objc_msgSend(obj, "count");
          *(_DWORD *)buf = 134218496;
          v146 = v44;
          v147 = 2048;
          v148 = v45;
          v149 = 2048;
          v150 = v46;
          _os_log_impl(&dword_1A1B90000, v43, OS_LOG_TYPE_DEFAULT, "feed database took %llums to lookup %lu feed items across %lu feeds", buf, 0x20u);

        }
        if ((unint64_t)objc_msgSend(v20, "count") >= 2)
          objc_msgSend(v41, "sortUsingSelector:", sel_compareOrderDescending_);
        v47 = v136;
        v16 = v41;

      }
      else
      {
        v16 = 0;
        v19 = 0x1E0C99000uLL;
        v18 = &off_1A1E81000;
      }

      v17 = v106;
    }

    v107 = objc_msgSend(v16, "count");
    v98 = v16;
    objc_msgSend(v16, "fc_subarrayWithMaxCount:", *(_QWORD *)(a1 + 56));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v48, "count");
    v49 = (void *)MEMORY[0x1E0C99D80];
    v127[0] = MEMORY[0x1E0C809B0];
    v50 = *((_QWORD *)v18 + 491);
    v127[1] = v50;
    v127[2] = __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke_2;
    v127[3] = &unk_1E463AA78;
    v51 = v48;
    v128 = v51;
    objc_msgSend(v49, "fc_dictionary:", v127);
    obja = (id)objc_claimAutoreleasedReturnValue();
    v97 = v51;
    FCFeedRangeCoveredByFeedItems(v51);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v19 + 3560), "array");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v103 = *(id *)(a1 + 40);
    v52 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v123, v143, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v124;
      do
      {
        v55 = 0;
        do
        {
          if (*(_QWORD *)v124 != v54)
            objc_enumerationMutation(v103);
          v56 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * v55);
          if (v56)
            v57 = *(_QWORD *)(v56 + 16);
          else
            v57 = 0;
          objc_msgSend(v113, "objectForKeyedSubscript:", v57, v97);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56)
            v59 = *(void **)(v56 + 24);
          else
            v59 = 0;
          v60 = v59;
          objc_msgSend(v58, "contiguousFetchedRangeInRange:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
            v62 = *(void **)(v56 + 16);
          else
            v62 = 0;
          v63 = v62;
          objc_msgSend(obja, "objectForKeyedSubscript:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          FCFeedItemsCoveredByRange(v64, v61);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          v118[0] = MEMORY[0x1E0C809B0];
          v118[1] = v50;
          v118[2] = __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke_3;
          v118[3] = &unk_1E4645198;
          v118[4] = v56;
          v66 = v61;
          v119 = v66;
          v67 = *(_QWORD *)(a1 + 56);
          v121 = v105;
          v122 = v67;
          v68 = v110;
          v120 = v68;
          if (__56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke_3((uint64_t)v118))
          {
            objc_msgSend(v101, "addObject:", v56);
            v69 = v66;
          }
          else
          {
            v70 = objc_alloc_init(FCFeedDatabaseLookupResult);
            v72 = v70;
            if (v70)
            {
              objc_setProperty_nonatomic_copy(v70, v71, v65, 16);
              objc_setProperty_nonatomic_copy(v72, v73, v68, 24);
            }
            v74 = *(_QWORD *)(a1 + 56);
            if (v107 <= v74)
            {
              if (v56)
                v76 = *(void **)(v56 + 24);
              else
                v76 = 0;
              v100 = v76;
              v75 = objc_msgSend(v66, "containsFeedRange:");
            }
            else
            {
              v75 = 0;
            }
            if (v72)
              v72->_exhaustedRange = v75;
            if (v107 <= v74)

            if (v56)
              v77 = *(_QWORD *)(v56 + 16);
            else
              v77 = 0;
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v72, v77);

            v69 = v119;
            v68 = v120;
          }

          ++v55;
        }
        while (v53 != v55);
        v78 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v123, v143, 16);
        v53 = v78;
      }
      while (v78);
    }

    v79 = v101;
    if (objc_msgSend(v101, "count"))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v80 = v101;
      v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v114, v142, 16);
      if (v81)
      {
        v82 = v81;
        v83 = *(_QWORD *)v115;
        do
        {
          v84 = 0;
          do
          {
            if (*(_QWORD *)v115 != v83)
              objc_enumerationMutation(v80);
            v85 = *(_QWORD **)(*((_QWORD *)&v114 + 1) + 8 * v84);
            if (v85)
              v86 = v85[2];
            else
              v86 = 0;
            objc_msgSend(v113, "objectForKeyedSubscript:", v86, v97);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v87;
            if (v85)
              v89 = v85[3];
            else
              v89 = 0;
            objc_msgSend(v87, "contiguousFetchedRangeInRange:", v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            if (v85)
              v91 = v85[2];
            else
              v91 = 0;
            objc_msgSend(obja, "objectForKeyedSubscript:", v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            FCFeedItemsCoveredByRange(v92, v90);
            v93 = (void *)objc_claimAutoreleasedReturnValue();

            -[FCFeedDatabase _shortCircuitLookup:withFeed:](*(_QWORD *)(a1 + 32), v85, v88);
            v94 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            if (!v94
              && (-[FCFeedDatabase _serviceLookup:withFeed:feedItems:](*(_QWORD *)(a1 + 32), v85, v88, v93),
                  (v94 = (_QWORD *)objc_claimAutoreleasedReturnValue()) == 0)
              || !v94[5])
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed is missing data but lookup result has no cursor"));
                *(_DWORD *)v151 = 136315906;
                v152 = "-[FCFeedDatabase performDatabaseLookups:boundedByCount:]_block_invoke";
                v153 = 2080;
                v154 = "FCFeedDatabase.m";
                v155 = 1024;
                v156 = 271;
                v157 = 2114;
                v158 = v108;
                _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v151, 0x26u);

              }
            }
            if (v85)
              v95 = v85[2];
            else
              v95 = 0;
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v94, v95);

            ++v84;
          }
          while (v82 != v84);
          v96 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v114, v142, 16);
          v82 = v96;
        }
        while (v96);
      }

      v79 = v101;
    }

    v2 = v99;
  }

}

void __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "feedID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v9);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

BOOL __56__FCFeedDatabase_performDatabaseLookups_boundedByCount___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (*(_BYTE *)(v2 + 8))
      return 0;
    v3 = *(_QWORD *)(v2 + 24);
  }
  else
  {
    v3 = 0;
  }
  return (objc_msgSend(*(id *)(a1 + 40), "containsFeedRange:", v3) & 1) == 0
      && (*(_QWORD *)(a1 + 56) < *(_QWORD *)(a1 + 64)
       || (objc_msgSend(*(id *)(a1 + 40), "containsFeedRange:", *(_QWORD *)(a1 + 48)) & 1) == 0);
}

- (void)saveFeedItems:(void *)a3 forFeedID:(void *)a4 insertionToken:(void *)a5 requestDate:(char)a6 reachedToOrder:(uint64_t)a7 extent:(char)a8 reachedEnd:
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  char v30;
  char v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  if (!a1)
    goto LABEL_16;
  if (objc_msgSend(v15, "count") | a7
    || (a8 & 1) != 0
    || (a6 & 1) != 0
    || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    if (v16)
      goto LABEL_9;
  }
  else
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedItems.count != 0 || ckReachedToOrder || reachedEnd || extent != 0");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]";
    v34 = 2080;
    v35 = "FCFeedDatabase.m";
    v36 = 1024;
    v37 = 289;
    v38 = 2114;
    v39 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v16)
      goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedID != nil");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]";
    v34 = 2080;
    v35 = "FCFeedDatabase.m";
    v36 = 1024;
    v37 = 290;
    v38 = 2114;
    v39 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_9:
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "opaqueInsertionToken != nil");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]";
    v34 = 2080;
    v35 = "FCFeedDatabase.m";
    v36 = 1024;
    v37 = 291;
    v38 = 2114;
    v39 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v18)
    {
LABEL_12:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "requestDate != nil");
        *(_DWORD *)buf = 136315906;
        v33 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]";
        v34 = 2080;
        v35 = "FCFeedDatabase.m";
        v36 = 1024;
        v37 = 292;
        v38 = 2114;
        v39 = v22;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v18)
  {
    goto LABEL_12;
  }
  if (v16)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __102__FCFeedDatabase_saveFeedItems_forFeedID_insertionToken_requestDate_reachedToOrder_extent_reachedEnd___block_invoke;
    v23[3] = &unk_1E46451E8;
    v24 = v17;
    v25 = a1;
    v26 = v16;
    v27 = v15;
    v30 = a6;
    v28 = v18;
    v29 = a7;
    v31 = a8;
    -[FCFeedDatabase _performWithStorageAndWait:](a1, v23);

  }
LABEL_16:

}

void __102__FCFeedDatabase_saveFeedItems_forFeedID_insertionToken_requestDate_reachedToOrder_extent_reachedEnd___block_invoke(uint64_t a1)
{
  objc_class *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  BOOL v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  unint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't save feed items without an insertion token"));
    *(_DWORD *)buf = 136315906;
    v69 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]_block_invoke";
    v70 = 2080;
    v71 = "FCFeedDatabase.m";
    v72 = 1024;
    v73 = 301;
    v74 = 2114;
    v75 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v2 = (objc_class *)objc_opt_class();
  FCCheckedDynamicCast(v2, *(_QWORD *)(a1 + 32));
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = *(void **)(v4 + 48);
  else
    v5 = 0;
  objc_msgSend(v5, "feedForFeedID:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have a feed in order to save feed items"));
    *(_DWORD *)buf = 136315906;
    v69 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]_block_invoke";
    v70 = 2080;
    v71 = "FCFeedDatabase.m";
    v72 = 1024;
    v73 = 305;
    v74 = 2114;
    v75 = v24;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v7 = objc_msgSend(v6, "refreshedFromOrder");
  v8 = objc_msgSend(v6, "refreshedToOrder");
  objc_msgSend(*(id *)(a1 + 56), "sortedArrayUsingSelector:", sel_compareOrderDescending_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v10 = v3[1];
  else
    v10 = 0;
  +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v12 = v3[2];
  else
    v12 = 0;
  v13 = v8;
  +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  FCFeedItemsCoveredByRange(v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v16;
  v18 = objc_msgSend(v16, "count");
  if (v18 != objc_msgSend(*(id *)(a1 + 56), "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CK cursor shouldn't produce feed items that precede it"));
    *(_DWORD *)buf = 136315906;
    v69 = "-[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]_block_invoke";
    v70 = 2080;
    v71 = "FCFeedDatabase.m";
    v72 = 1024;
    v73 = 315;
    v74 = 2114;
    v75 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v19 = *(unsigned __int8 *)(a1 + 80) != 0;
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v20 = v13;
    if (objc_msgSend(v17, "count"))
      goto LABEL_24;
    v21 = (void *)FCFeedDatabaseLog;
    if (!os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_ERROR))
    {
      v19 = 1;
      goto LABEL_24;
    }
    if (v3)
      v25 = (const char *)v3[2];
    else
      v25 = 0;
    v26 = v21;
    objc_msgSend(v6, "feedID");
    v27 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v69 = v25;
    v70 = 2112;
    v71 = v27;
    _os_log_error_impl(&dword_1A1B90000, v26, OS_LOG_TYPE_ERROR, "pretending to reach order %llu for feed %@ because rdar://problem/27201634 caused us to make no progress", buf, 0x16u);

    v19 = 1;
  }
  v20 = v13;
LABEL_24:
  objc_msgSend(v6, "refreshRegion");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v19;
  if (v3)
    v28 = v3[1];
  else
    v28 = 0;
  +[FCFeedCursor cursorForTopOfFeed](FCFeedCursor, "cursorForTopOfFeed");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "order");

  if (v28 == v30)
  {
    v31 = objc_msgSend(v6, "refreshedFromOrder");
    v32 = objc_msgSend(*(id *)(a1 + 64), "fc_millisecondTimeIntervalSince1970");
    if (v32 > v7)
      v7 = v32;
    if (v3)
      v33 = v3[2];
    else
      v33 = 0;
    v34 = *(_QWORD *)(a1 + 72);
    v35 = v34 != 0;
    v36 = v34 - 1;
    if (!v35)
      v36 = 0;
    if (v31)
      v37 = v20;
    else
      v37 = -1;
    if (v33 < v37)
      v37 = v33;
    if (v33 >= v36)
      v20 = v37;
    else
      v20 = v36;
    if (!objc_msgSend(v17, "count"))
    {
      v50 = 0;
      v51 = v66;
      goto LABEL_66;
    }
    v67 = v28;
    v64 = v7;
  }
  else
  {
    v67 = v28;
    v64 = v7;
    objc_msgSend(v17, "count");
  }
  v65 = v17;
  FCFeedRangeCoveredByFeedItems(v17);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "top");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bottom");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67 == v30)
  {
    objc_msgSend(v6, "fetchedRangePrecedingOrder:", objc_msgSend(v39, "order"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      v60 = v20;
      v61 = v9;
      v62 = v6;
      objc_msgSend(v41, "bottom");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "order");
      v45 = objc_msgSend(v39, "order");

      if (v44 > v45)
      {
        objc_msgSend(v42, "bottom");
        v46 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)v46;
      }
      v9 = v61;
      v6 = v62;
      v20 = v60;
    }
  }
  else
  {
    if (v3)
      v47 = v3[1];
    else
      v47 = 0;
    +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v47);
    v42 = v39;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (*(_BYTE *)(a1 + 81))
  {
    +[FCFeedCursor cursorForBottomOfFeed](FCFeedCursor, "cursorForBottomOfFeed");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v63)
    {
      if (v3)
        v49 = v3[2];
      else
        v49 = 0;
    }
    else
    {
      v52 = *(_QWORD *)(a1 + 72);
      if (!v52)
        goto LABEL_62;
      v49 = v52 - 1;
    }
    +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v49);
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v48;

  v40 = v53;
LABEL_62:
  v51 = v66;
  if (v67 == v30 && objc_msgSend(v66, "containsOrder:", objc_msgSend(v40, "order")))
  {
    objc_msgSend(v66, "bottom");
    v54 = v20;
    v55 = objc_claimAutoreleasedReturnValue();

    v40 = (void *)v55;
    v20 = v54;
    v51 = v66;
  }
  +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v39, v40);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v64;
  v17 = v65;
LABEL_66:
  v56 = *(_QWORD *)(a1 + 40);
  if (v56)
    v57 = *(void **)(v56 + 48);
  else
    v57 = 0;
  objc_msgSend(v57, "insertFeedItems:", v17);
  v58 = *(_QWORD *)(a1 + 40);
  if (v58)
    v59 = *(void **)(v58 + 48);
  else
    v59 = 0;
  objc_msgSend(v59, "updateFeedID:refreshedFromOrder:refreshedToOrder:fetchedRange:", *(_QWORD *)(a1 + 48), v7, v20, v50);

}

- (void)saveFeedItems:(void *)a3 feedIDs:(void *)a4 extentByFeedID:(void *)a5 requestRangeByFeedID:
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__FCFeedDatabase_saveFeedItems_feedIDs_extentByFeedID_requestRangeByFeedID___block_invoke;
    v13[3] = &unk_1E463C840;
    v14 = v9;
    v15 = v10;
    v16 = a1;
    v17 = v11;
    v18 = v12;
    -[FCFeedDatabase _performWithStorageAndWait:](a1, v13);

  }
}

void __76__FCFeedDatabase_saveFeedItems_feedIDs_extentByFeedID_requestRangeByFeedID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  __int128 v69;
  id obj;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  unint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  char *v93;
  __int16 v94;
  int v95;
  __int16 v96;
  void *v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v72 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v87 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        objc_msgSend(v8, "feedID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "addObject:", v8);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "feedID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v12);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
    }
    while (v5);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v13 = v72;
  obj = *(id *)(v72 + 40);
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
  if (v73)
  {
    v71 = *(_QWORD *)v83;
    *(_QWORD *)&v14 = 136315906;
    v69 = v14;
    v80 = v2;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v83 != v71)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v15);
        v17 = *(_QWORD *)(v13 + 48);
        if (v17)
          v18 = *(void **)(v17 + 48);
        else
          v18 = 0;
        v77 = v15;
        objc_msgSend(v18, "feedForFeedID:", v16, v69);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have a feed in order to save feed items"));
          *(_DWORD *)buf = v69;
          v91 = "-[FCFeedDatabase saveFeedItems:feedIDs:extentByFeedID:requestRangeByFeedID:]_block_invoke";
          v92 = 2080;
          v93 = "FCFeedDatabase.m";
          v94 = 1024;
          v95 = 423;
          v96 = 2114;
          v97 = v64;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        v20 = objc_msgSend(v19, "refreshedFromOrder");
        v21 = objc_msgSend(v19, "refreshedToOrder");
        objc_msgSend(*(id *)(v13 + 56), "objectForKey:", v16);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v79, "unsignedLongLongValue");
        objc_msgSend(v19, "refreshRegion");
        v81 = objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v19, "refreshedFromOrder");
        objc_msgSend(*(id *)(v13 + 64), "objectForKey:", v16);
        v24 = v16;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dateRange");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "laterDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "fc_millisecondTimeIntervalSince1970");

        if (v28 <= v20)
          v29 = v20;
        else
          v29 = v28;
        v78 = v25;
        objc_msgSend(v25, "bottom");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "order");
        if (v22)
          v32 = v22 - 1;
        else
          v32 = 0;
        if (v23)
          v33 = v21;
        else
          v33 = -1;
        if (v31 < v33)
          v33 = v31;
        if (v31 >= v32)
          v34 = v33;
        else
          v34 = v32;

        objc_msgSend(v80, "objectForKeyedSubscript:", v24);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v35;
        if (objc_msgSend(v35, "count"))
        {
          objc_msgSend(v35, "sortedArrayUsingSelector:", sel_compareOrderDescending_);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "count");
          if (v37 != objc_msgSend(v35, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CK cursor shouldn't produce feed items that precede it"));
            *(_DWORD *)buf = v69;
            v91 = "-[FCFeedDatabase saveFeedItems:feedIDs:extentByFeedID:requestRangeByFeedID:]_block_invoke";
            v92 = 2080;
            v93 = "FCFeedDatabase.m";
            v94 = 1024;
            v95 = 449;
            v96 = 2114;
            v97 = v65;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          v75 = v29;
          FCFeedRangeCoveredByFeedItems(v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v22)
          {
            objc_msgSend(v38, "top");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v22 - 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v40, v41);
            v42 = objc_claimAutoreleasedReturnValue();

            v39 = (void *)v42;
          }
          v43 = (void *)v81;
          v74 = v36;
          objc_msgSend(v39, "top");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "fetchedRangePrecedingOrder:", objc_msgSend(v44, "order"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            objc_msgSend(v45, "bottom");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "order");
            objc_msgSend(v39, "top");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "order");

            if (v47 > v49)
            {
              objc_msgSend(v45, "bottom");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "order");
              objc_msgSend(v39, "bottom");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              +[FCFeedRange feedRangeWithMaxOrder:minOrder:](FCFeedRange, "feedRangeWithMaxOrder:minOrder:", v51, objc_msgSend(v52, "order"));
              v53 = objc_claimAutoreleasedReturnValue();

              v39 = (void *)v53;
            }
            v43 = (void *)v81;
          }
          v54 = v24;
          objc_msgSend(v39, "bottom");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v43, "containsCursor:", v55);

          if (v56)
          {
            objc_msgSend(v39, "top");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "bottom");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v57, v58);
            v59 = objc_claimAutoreleasedReturnValue();

            v39 = (void *)v59;
          }
          v13 = v72;
          v60 = v79;
          v61 = v77;
          v29 = v75;

        }
        else
        {
          v54 = v24;
          v39 = 0;
          v13 = v72;
          v60 = v79;
          v43 = (void *)v81;
          v61 = v77;
        }
        v62 = *(_QWORD *)(v13 + 48);
        if (v62)
          v63 = *(void **)(v62 + 48);
        else
          v63 = 0;
        objc_msgSend(v63, "updateFeedID:refreshedFromOrder:refreshedToOrder:fetchedRange:", v54, v29, v34, v39);

        v15 = v61 + 1;
        v2 = v80;
      }
      while (v73 != v15);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
      v73 = v66;
    }
    while (v66);
  }

  v67 = *(_QWORD *)(v13 + 48);
  if (v67)
    v68 = *(void **)(v67 + 48);
  else
    v68 = 0;
  objc_msgSend(v68, "insertFeedItems:", *(_QWORD *)(v13 + 32));

}

- (void)saveWithCompletionHandler:(id)a3
{
  FCFDBStorage *storage;
  void *v5;
  id v6;

  v6 = a3;
  if (self)
    storage = self->_storage;
  else
    storage = 0;
  -[FCFDBStorage flushChanges](storage, "flushChanges");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

id __35__FCFeedDatabase__feedsForLookups___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(id *)(a2 + 16);
  else
    return 0;
}

void __53__FCFeedDatabase__feedItemsForLookups_withFeedsByID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (!v7 || (v8 = v7[4], v7, v8 != -1))
    {
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v8 = v9[4] + 1;
      else
        v8 = 1;

    }
  }
  else
  {
    v8 = -1;
  }
  v11 = *(void **)(a1 + 40);
  v10 = *(_QWORD **)(a1 + 48);
  if (v10)
    v10 = (_QWORD *)v10[6];
  v12 = v10;
  objc_msgSend(v15, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "feedItemsForFeedIDs:feedRange:feature:maxCountByFeed:totalMaxCount:", v13, v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addObjectsFromArray:", v14);
}

void __53__FCFeedDatabase__feedItemsForLookups_withFeedsByID___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "feedID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v9);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

void __68__FCFeedDatabase__feedItemsForLookups_withFeedsByID_boundedByCount___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  id v11;

  v7 = (void *)a1[4];
  v6 = (_QWORD *)a1[5];
  if (v6)
    v6 = (_QWORD *)v6[6];
  v8 = v6;
  v9 = a2;
  objc_msgSend(a3, "allObjects");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "feedItemsForFeedIDs:feedRange:feature:maxCountByFeed:totalMaxCount:", v11, v9, 0, a1[6], a1[7]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObjectsFromArray:", v10);
}

- (unsigned)version
{
  return self->_version;
}

- (NSURL)parentDirectoryURL
{
  return self->_parentDirectoryURL;
}

- (int64_t)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_initQueue, 0);
  objc_storeStrong((id *)&self->_parentDirectoryURL, 0);
}

- (void)t_insertSegmentForFeedID:(id)a3 range:(id)a4 items:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__FCFeedDatabase_Testing__t_insertSegmentForFeedID_range_items___block_invoke;
  v14[3] = &unk_1E463C918;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[FCFeedDatabase _performWithStorageAndWait:]((uint64_t)self, v14);

}

void __64__FCFeedDatabase_Testing__t_insertSegmentForFeedID_range_items___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 48);
  else
    v3 = 0;
  objc_msgSend(v3, "feedForFeedID:", *(_QWORD *)(a1 + 40));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v13, "refreshedFromOrder");
  v5 = objc_msgSend(v13, "refreshedToOrder");
  if (v4)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "fc_millisecondTimeIntervalSince1970");

    objc_msgSend(*(id *)(a1 + 48), "top");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "order");

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(void **)(v9 + 48);
  else
    v10 = 0;
  objc_msgSend(v10, "insertFeedItems:", *(_QWORD *)(a1 + 56));
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(void **)(v11 + 48);
  else
    v12 = 0;
  objc_msgSend(v12, "updateFeedID:refreshedFromOrder:refreshedToOrder:fetchedRange:", *(_QWORD *)(a1 + 40), v4, v6, *(_QWORD *)(a1 + 48));

}

- (id)t_lookupFeedID:(id)a3 range:(id)a4 maxCount:(unint64_t)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  const char *v11;
  _QWORD *v12;
  SEL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (_QWORD *)objc_opt_new();
  v12 = v10;
  if (v10)
  {
    objc_setProperty_nonatomic_copy(v10, v11, v8, 16);
    objc_setProperty_nonatomic_copy(v12, v13, v9, 24);
    v12[4] = a5;
  }
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedDatabase performDatabaseLookups:](self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
