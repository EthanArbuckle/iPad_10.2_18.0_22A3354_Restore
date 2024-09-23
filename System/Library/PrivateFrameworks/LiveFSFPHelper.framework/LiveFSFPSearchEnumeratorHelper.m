@implementation LiveFSFPSearchEnumeratorHelper

- (id)initForQuery:(id)a3 withExtension:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  LiveFSFPSearchEnumeratorHelper *v20;
  NSObject *v21;
  objc_super v23;
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = *MEMORY[0x24BDC8228];
  v24 = 0;
  objc_msgSend(v8, "itemForIdentifier:error:", v9, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (v10)
  {
    v23.receiver = self;
    v23.super_class = (Class)LiveFSFPSearchEnumeratorHelper;
    v12 = -[LiveFSFPEnumeratorHelper initForExtension:item:](&v23, sel_initForExtension_item_, v8, v10);
    if (v12)
    {
      livefs_std_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[LiveFSFPSearchEnumeratorHelper initForQuery:withExtension:].cold.2();

      objc_storeStrong(v12 + 9, a3);
      v14 = dispatch_queue_create("search work queue", 0);
      v15 = v12[11];
      v12[11] = v14;

      v16 = objc_opt_new();
      v17 = v12[10];
      v12[10] = (id)v16;

      v18 = objc_opt_new();
      v19 = v12[12];
      v12[12] = (id)v18;

    }
    self = v12;
    v20 = self;
  }
  else
  {
    livefs_std_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[LiveFSFPSearchEnumeratorHelper initForQuery:withExtension:].cold.1();

    v20 = 0;
  }

  return v20;
}

+ (id)newForQuery:(id)a3 withExtension:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForQuery:withExtension:", v7, v6);

  return v8;
}

+ (id)criteriaForQuery:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE60420]);
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allowedContentTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v24 = "+[LiveFSFPSearchEnumeratorHelper criteriaForQuery:]";
    v25 = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_INFO, "%s: filename '%@' allowed '%@'", buf, 0x20u);

  }
  objc_msgSend(v3, "filename");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v22 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, *MEMORY[0x24BE60410]);

  }
  objc_msgSend(v3, "allowedContentTypes");
  v11 = (char *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "containsObject:", CFSTR("public.item")) & 1) == 0)
  {
    objc_msgSend(v3, "allowedPathExtensions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)objc_opt_new();
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __51__LiveFSFPSearchEnumeratorHelper_criteriaForQuery___block_invoke;
      v20 = &unk_24E46B068;
      v14 = v13;
      v21 = v14;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v17);
      livefs_std_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v11;
        v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_21F8A5000, v15, OS_LOG_TYPE_DEFAULT, "Content types %@ gave names %@", buf, 0x16u);
      }

      if (objc_msgSend(v14, "count", v17, v18, v19, v20))
        objc_msgSend(v4, "setObject:forKey:", v14, *MEMORY[0x24BE60418]);

    }
  }

  return v4;
}

void __51__LiveFSFPSearchEnumeratorHelper_criteriaForQuery___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(CFSTR("."), "stringByAppendingString:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)scheduleReaders
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSMutableArray copy](self->_pendingReaderBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_pendingReaderBlocks, "removeAllObjects");
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21F8A5000, v4, OS_LOG_TYPE_INFO, "Starting to schedule readers %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__LiveFSFPSearchEnumeratorHelper_scheduleReaders__block_invoke;
  v6[3] = &unk_24E46B090;
  v6[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_INFO, "Done scheduling", buf, 2u);
  }

}

void __49__LiveFSFPSearchEnumeratorHelper_scheduleReaders__block_invoke(uint64_t a1, void *a2)
{
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 88), a2);
}

- (id)copySearchResultBlock
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke;
  v6[3] = &unk_24E46B108;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v3 = (void *)MEMORY[0x2207CD064](v6);
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  _QWORD *WeakRetained;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD block[4];
  NSObject *v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  livefs_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[LiveFSFPSearchEnumeratorHelper copySearchResultBlock]_block_invoke";
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_INFO, "%s: got paths %@", buf, 0x16u);
    }

    v12 = WeakRetained[11];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_35;
    block[3] = &unk_24E46B0E0;
    v23 = v7;
    v13 = v8;
    v27 = a4;
    v14 = *(_QWORD *)(a1 + 32);
    v24 = v13;
    v25 = v14;
    v26 = WeakRetained;
    dispatch_async(v12, block);

    v11 = v23;
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_cold_1(v11, v15, v16, v17, v18, v19, v20, v21);
  }

}

void __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_35(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_2;
  v7[3] = &unk_24E46B0B8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v11 = *(_DWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 48);
  v8 = v3;
  v9 = v4;
  v10 = &v12;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);

  if (*((_BYTE *)v13 + 24))
  {
    livefs_std_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_INFO, "Added some, waking", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 56), "scheduleReaders");
  }
  _Block_object_dispose(&v12, 8);
}

void __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = objc_retainAutorelease(a2);
  v5 = (char *)objc_msgSend(v11, "fileSystemRepresentation");
  if (v5 && *v5 && *v5 != 46 && !strstr(v5, "/."))
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setPath:", v11);
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilename:", v8);

    v9 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes") + (*(_DWORD *)(a1 + 56) * a3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)*(uint64_t *)(v9 + 96) + (double)*(uint64_t *)(v9 + 104) * 0.000000001);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModTime:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "addObject:", v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

  }
}

- (id)copySearchCompletionBlock
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke;
  v6[3] = &unk_24E46B158;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v3 = (void *)MEMORY[0x2207CD064](v6);
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke(uint64_t a1, int a2)
{
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[6];
  int v16;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[11];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_42;
    block[3] = &unk_24E46B130;
    v16 = a2;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v5;
    dispatch_async(v6, block);
  }
  else
  {
    livefs_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

uint64_t __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_42(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;

  v2 = a1 + 48;
  v3 = *(_DWORD *)(a1 + 48);
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_42_cold_2(a1, v2, v5);
    v6 = 3;
  }
  else
  {
    v6 = 2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_42_cold_1(a1, v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "setState:", v6);
  return objc_msgSend(*(id *)(a1 + 40), "scheduleReaders");
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21F8A5000, v0, v1, "%s: Error ensuring file handle, got error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

void __39__LiveFSFPSearchEnumeratorHelper_start__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __39__LiveFSFPSearchEnumeratorHelper_start__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;

  if (a2)
  {
    livefs_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__LiveFSFPSearchEnumeratorHelper_start__block_invoke_2_cold_1(a1, a2, v4);

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)finallyEnumerateItemsForObserver:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  NSMutableArray *searchResults;
  void *v15;
  LiveFSFPSearchEnumeratorHelper *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  LiveFSFPSearchEnumeratorHelper *v20;
  int v21;
  uint8_t buf[4];
  LiveFSFPSearchEnumeratorHelper *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  NSUInteger v27;
  __int16 v28;
  NSUInteger v29;
  __int16 v30;
  NSMutableArray *v31;
  uint64_t v32;

  length = a4.length;
  location = a4.location;
  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v21 = location;
  if (-[LiveFSFPEnumeratorHelper state](self, "state") == 2)
  {
    v9 = -[NSMutableArray count](self->searchResults, "count");
    if (v9 <= location)
    {
      objc_msgSend(v7, "finishEnumeratingUpToPage:", 0);
      goto LABEL_16;
    }
    v10 = (location + 64);
    v11 = v9 <= v10;
    if (v9 <= v10)
      length = v9 - location;
  }
  else
  {
    v11 = 0;
  }
  livefs_std_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = -[LiveFSFPEnumeratorHelper state](self, "state");
    searchResults = self->searchResults;
    *(_DWORD *)buf = 134219008;
    v23 = self;
    v24 = 1024;
    v25 = v13;
    v26 = 2048;
    v27 = location;
    v28 = 2048;
    v29 = length;
    v30 = 2048;
    v31 = searchResults;
    _os_log_impl(&dword_21F8A5000, v12, OS_LOG_TYPE_INFO, "enumerator helper[%p]: state %d range: %lu -> %lu out of %p,", buf, 0x30u);
  }

  -[NSMutableArray subarrayWithRange:](self->searchResults, "subarrayWithRange:", location, length);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __75__LiveFSFPSearchEnumeratorHelper_finallyEnumerateItemsForObserver_inRange___block_invoke;
  v19[3] = &unk_24E46B1D0;
  v19[4] = self;
  v16 = v8;
  v20 = v16;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v19);
  livefs_std_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v16;
    _os_log_impl(&dword_21F8A5000, v17, OS_LOG_TYPE_INFO, "Built results %@", buf, 0xCu);
  }

  objc_msgSend(v7, "didEnumerateItems:", v16);
  if (v11)
  {
    objc_msgSend(v7, "finishEnumeratingUpToPage:", 0);
  }
  else
  {
    v21 = location + 64;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v21, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishEnumeratingUpToPage:", v18);

  }
LABEL_16:

}

void __75__LiveFSFPSearchEnumeratorHelper_finallyEnumerateItemsForObserver_inRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "enumeratedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemAtPath:parent:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  else
  {
    livefs_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __75__LiveFSFPSearchEnumeratorHelper_finallyEnumerateItemsForObserver_inRange___block_invoke_cold_1(v3, v8);

  }
}

- (void)waitForSearchResultsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  NSMutableArray *searchResults;
  void *v17;
  NSMutableArray *pendingReaderBlocks;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  LiveFSFPSearchEnumeratorHelper *v25;
  id v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _BYTE buf[24];
  uint64_t v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = -[LiveFSFPEnumeratorHelper state](self, "state");
    v10 = objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDC81E8]);
    v11 = objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDC81E0]);
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[LiveFSFPSearchEnumeratorHelper waitForSearchResultsForObserver:startingAtPage:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v9;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v10;
    LOWORD(v32) = 1024;
    *(_DWORD *)((char *)&v32 + 2) = v11;
    _os_log_impl(&dword_21F8A5000, v8, OS_LOG_TYPE_INFO, "%s: entered state %d page issbn %d, issbd %d", buf, 0x1Eu);
  }

  if (!-[LiveFSFPEnumeratorHelper state](self, "state"))
    -[LiveFSFPSearchEnumeratorHelper start](self, "start");
  if (-[LiveFSFPEnumeratorHelper state](self, "state") == 3)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 89);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishEnumeratingWithError:", v12);
    livefs_std_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPSearchEnumeratorHelper waitForSearchResultsForObserver:startingAtPage:].cold.1();

  }
  else
  {
    if ((objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDC81E8]) & 1) != 0
      || (objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDC81E0]) & 1) != 0)
    {
      LODWORD(v14) = 0;
    }
    else if (objc_msgSend(v7, "length") != 4
           || (v14 = *(unsigned int *)objc_msgSend(objc_retainAutorelease(v7), "bytes"), (v14 & 0x3F) != 0)
           || -[NSMutableArray count](self->searchResults, "count") <= v14)
    {
      +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "finishEnumeratingWithError:", v20);

      goto LABEL_18;
    }
    livefs_std_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      searchResults = self->searchResults;
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      v32 = 64;
      LOWORD(v33) = 2048;
      *(_QWORD *)((char *)&v33 + 2) = searchResults;
      _os_log_impl(&dword_21F8A5000, v15, OS_LOG_TYPE_INFO, "enumerator helper[%p]: range: %lu -> %lu out of %p,", buf, 0x2Au);
    }

    if (-[LiveFSFPEnumeratorHelper state](self, "state") == 2
      || -[NSMutableArray count](self->searchResults, "count") >= (unint64_t)(v14 + 64))
    {
      -[LiveFSFPSearchEnumeratorHelper finallyEnumerateItemsForObserver:inRange:](self, "finallyEnumerateItemsForObserver:inRange:", v6, v14, 64);
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3042000000;
      v32 = (uint64_t)__Block_byref_object_copy__49;
      *(_QWORD *)&v33 = __Block_byref_object_dispose__50;
      *((_QWORD *)&v33 + 1) = 0;
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __81__LiveFSFPSearchEnumeratorHelper_waitForSearchResultsForObserver_startingAtPage___block_invoke;
      v24 = &unk_24E46B1F8;
      v27 = buf;
      v25 = self;
      v30 = v14;
      v26 = v6;
      v28 = v14;
      v29 = 64;
      v17 = (void *)MEMORY[0x2207CD064](&v21);
      objc_storeWeak((id *)(*(_QWORD *)&buf[8] + 40), v17);
      pendingReaderBlocks = self->_pendingReaderBlocks;
      v19 = (void *)MEMORY[0x2207CD064](v17);
      -[NSMutableArray addObject:](pendingReaderBlocks, "addObject:", v19, v21, v22, v23, v24, v25);

      _Block_object_dispose(buf, 8);
      objc_destroyWeak((id *)&v33 + 1);

    }
  }
LABEL_18:

}

void __81__LiveFSFPSearchEnumeratorHelper_waitForSearchResultsForObserver_startingAtPage___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (WeakRetained && objc_msgSend(*(id *)(a1 + 32), "state") != 3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "state") == 2
      || (v3 = (*(_DWORD *)(a1 + 72) + 64),
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count") >= v3))
    {
      objc_msgSend(*(id *)(a1 + 32), "finallyEnumerateItemsForObserver:inRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      goto LABEL_9;
    }
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    v2 = (void *)MEMORY[0x2207CD064](WeakRetained);
    objc_msgSend(v4, "addObject:", v2);
  }
  else
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 89);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "finishEnumeratingWithError:", v2);
  }

LABEL_9:
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v6;
  id v7;
  NSObject *searchWorkQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  searchWorkQueue = self->_searchWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__LiveFSFPSearchEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke;
  block[3] = &unk_24E46B220;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(searchWorkQueue, block);

}

uint64_t __75__LiveFSFPSearchEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitForSearchResultsForObserver:startingAtPage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSSortDescriptor)sortD
{
  return (NSSortDescriptor *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSortD:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortD, 0);
  objc_storeStrong((id *)&self->_pendingReaderBlocks, 0);
  objc_storeStrong((id *)&self->_searchWorkQueue, 0);
  objc_storeStrong((id *)&self->searchResults, 0);
  objc_storeStrong((id *)&self->_ourSearchQuery, 0);
}

- (void)initForQuery:withExtension:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_21F8A5000, v0, OS_LOG_TYPE_ERROR, "Error %@ retrieving root item. Search aborted.", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)initForQuery:withExtension:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_21F8A5000, v0, v1, "enumerator helper[%p]: Creating search enumerator", v2);
  OUTLINED_FUNCTION_0();
}

void __55__LiveFSFPSearchEnumeratorHelper_copySearchResultBlock__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21F8A5000, a1, a3, "gettingStrongSelf failed", a5, a6, a7, a8, 0);
}

void __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_42_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "searchContainerItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_21F8A5000, a2, v4, "Search %@ completed", v5);

  OUTLINED_FUNCTION_6();
}

void __59__LiveFSFPSearchEnumeratorHelper_copySearchCompletionBlock__block_invoke_42_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "searchContainerItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v8 = 1024;
  v9 = v5;
  OUTLINED_FUNCTION_7(&dword_21F8A5000, a3, v6, "Search %@ ended with error %d", v7);

}

void __39__LiveFSFPSearchEnumeratorHelper_start__block_invoke_2_cold_1(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = 67109378;
  v4[1] = a2;
  v5 = 2112;
  v6 = v3;
  OUTLINED_FUNCTION_7(&dword_21F8A5000, a3, (uint64_t)a3, "Error %d starting search %@", (uint8_t *)v4);
  OUTLINED_FUNCTION_0();
}

void __75__LiveFSFPSearchEnumeratorHelper_finallyEnumerateItemsForObserver_inRange___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[LiveFSFPSearchEnumeratorHelper finallyEnumerateItemsForObserver:inRange:]_block_invoke";
  v7 = 2112;
  v8 = v3;
  OUTLINED_FUNCTION_2(&dword_21F8A5000, a2, v4, "%s: unable to find item at path %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_6();
}

- (void)waitForSearchResultsForObserver:startingAtPage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_21F8A5000, v0, v1, "enumerator helper[%p]: returning ECANCELED", v2);
  OUTLINED_FUNCTION_0();
}

@end
