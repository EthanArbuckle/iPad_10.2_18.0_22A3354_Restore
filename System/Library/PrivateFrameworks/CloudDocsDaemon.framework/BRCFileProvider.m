@implementation BRCFileProvider

+ (id)prettyNameForFilePresenterID:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0CB3600], "_processIdentifierForID:", v3);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0CB3940];
    BRCExecutableNameForProcessIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@[%d]"), v7, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v3;
  }

  return v8;
}

- (BRCFileProvider)initWithURL:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  BRCFileProvider *v9;
  BRCFileProvider *v10;
  NSOperationQueue *v11;
  NSOperationQueue *queue;
  void *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *presentersIDsByKey;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *privQueue;
  uint64_t v25;
  brc_task_tracker *tracker;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)BRCFileProvider;
  v9 = -[BRCFileProvider init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v10->_queue;
    v10->_queue = v11;

    objc_msgSend(CFSTR("com.apple.bird.fileprovider."), "stringByAppendingString:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v10->_queue, "setName:", v13);
    v14 = objc_retainAutorelease(v13);
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v16, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v15, v17);

    -[NSOperationQueue setUnderlyingQueue:](v10->_queue, "setUnderlyingQueue:", v18);
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    presentersIDsByKey = v10->_presentersIDsByKey;
    v10->_presentersIDsByKey = v19;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v21, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("file-provider", v22);

    privQueue = v10->_privQueue;
    v10->_privQueue = (OS_dispatch_queue *)v23;

    brc_task_tracker_create("file-provider");
    v25 = objc_claimAutoreleasedReturnValue();
    tracker = v10->_tracker;
    v10->_tracker = (brc_task_tracker *)v25;

  }
  return v10;
}

- (void)resume
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] resuming %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)suspend
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] suspending %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)setSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__54;
  v14 = __Block_byref_object_dispose__54;
  v15 = 0;
  -[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__BRCFileProvider_setSession___block_invoke;
  block[3] = &unk_1E87615A8;
  block[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  dispatch_sync(v5, block);

  brc_task_tracker_wait(v11[5]);
  _Block_object_dispose(&v10, 8);

}

void __30__BRCFileProvider_setSession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
  brc_task_tracker_create("file-provider");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  brc_task_tracker_cancel(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (void)dumpToContext:(id)a3
{
  id v4;
  NSObject *privQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  privQueue = self->_privQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__BRCFileProvider_dumpToContext___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(privQueue, block);

}

void __33__BRCFileProvider_dumpToContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_fileReactorID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeLineWithFormat:", CFSTR("file presenters for %@"), v3);

    objc_msgSend(*(id *)(a1 + 40), "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__BRCFileProvider_dumpToContext___block_invoke_2;
    v6[3] = &unk_1E8760160;
    v7 = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);
    objc_msgSend(*(id *)(a1 + 40), "writeLineWithFormat:", &stru_1E8769030);

  }
}

void __33__BRCFileProvider_dumpToContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(a1 + 32);
        +[BRCFileProvider prettyNameForFilePresenterID:](BRCFileProvider, "prettyNameForFilePresenterID:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "writeLineWithFormat:", CFSTR("  + %@ -> %@"), v12, v5);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (NSURL)_providedItemsURL
{
  return self->_url;
}

- (NSOperationQueue)_providedItemsOperationQueue
{
  return self->_queue;
}

- (id)_keyForURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_realpath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_keyForURL:(id)a3 andID:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  -[BRCFileProvider _keyForURL:](self, "_keyForURL:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@::%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_pathForKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;

  v3 = a3;
  if (objc_msgSend(v3, "br_isAbsolutePath"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("::"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if ((unint64_t)objc_msgSend(v6, "count") > 1)
    {
      objc_msgSend(v6, "removeObjectAtIndex:", 0);
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR("::"));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BRCFileProvider _pathForKey:].cold.1();

      objc_msgSend(v6, "lastObject");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (id)v9;

  }
  return v4;
}

- (void)_provideItemAtURL:(id)a3 completionHandler:(id)a4
{
  void *v4;
  NSObject *v5;

  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    -[BRCFileProvider _provideItemAtURL:completionHandler:].cold.1();

}

- (void)_providedItemAtURL:(id)a3 didGainPresenterWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *privQueue;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21[3];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[BRCFileProvider prettyNameForFilePresenterID:](BRCFileProvider, "prettyNameForFilePresenterID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v21, 0, sizeof(v21));
  __brc_create_section(0, (uint64_t)"-[BRCFileProvider _providedItemAtURL:didGainPresenterWithID:]", 164, v21);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v15 = v21[0];
    objc_msgSend(v6, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx new presenter of '%@': %@ (%@)%@", buf, 0x34u);

  }
  privQueue = self->_privQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke;
  block[3] = &unk_1E875DD30;
  block[4] = self;
  v18 = v6;
  v19 = v8;
  v20 = v7;
  v12 = v7;
  v13 = v8;
  v14 = v6;
  dispatch_sync(privQueue, block);

  __brc_leave_section(v21);
}

void __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  objc_msgSend(*(id *)(a1 + 32), "_keyForURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  if (objc_msgSend(v3, "count"))
  {
    v5 = v3;
  }
  else
  {
    if (v3)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke_cold_2();

    }
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v5, v2);
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_registerPresenterForItemAtURL:key:name:session:", *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48), v4);
    }
    else
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke_cold_1();

    }
  }
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 56));

}

- (void)_providedItemAtURL:(id)a3 didLosePresenterWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *privQueue;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19[3];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(v19, 0, sizeof(v19));
  __brc_create_section(0, (uint64_t)"-[BRCFileProvider _providedItemAtURL:didLosePresenterWithID:]", 190, v19);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = v19[0];
    objc_msgSend(v6, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCFileProvider prettyNameForFilePresenterID:](BRCFileProvider, "prettyNameForFilePresenterID:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v21 = v13;
    v22 = 2112;
    v23 = v14;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx removed presenter of '%@': %@ (%@)%@", buf, 0x34u);

  }
  privQueue = self->_privQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke;
  v16[3] = &unk_1E875D448;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_sync(privQueue, v16);

  __brc_leave_section(v19);
}

void __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  objc_msgSend(*(id *)(a1 + 32), "_keyForURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke_cold_1();

    }
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (objc_msgSend(v3, "count") != 1)
    {
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke_cold_2();

    }
    objc_msgSend(*(id *)(a1 + 32), "_unregisterPresenterForKey:", v2);
    if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke_cold_1();

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v2);
  }

}

- (void)_providedItemAtURL:(id)a3 withPresenterWithID:(id)a4 didMoveToURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v11;
    _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] '%@' moved to '%@', by %@%@", (uint8_t *)&v15, 0x2Au);

  }
  -[BRCFileProvider _providedItemAtURL:didLosePresenterWithID:](self, "_providedItemAtURL:didLosePresenterWithID:", v8, v9);
  -[BRCFileProvider _providedItemAtURL:didGainPresenterWithID:](self, "_providedItemAtURL:didGainPresenterWithID:", v10, v9);

}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_privQueue, 0);
  objc_storeStrong((id *)&self->_presentersIDsByKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_pathForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Invalid components count. It should either be an absolute path or prefixed with file provider id%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_provideItemAtURL:completionHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] this method is deprecated%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] not doing anything since we're logged out%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: presentersIDs == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [presentersIDs containsObject:filePresenterID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: presentersIDs.count == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
