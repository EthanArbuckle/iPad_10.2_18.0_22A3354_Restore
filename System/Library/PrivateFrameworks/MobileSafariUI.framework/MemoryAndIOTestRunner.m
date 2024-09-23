@implementation MemoryAndIOTestRunner

- (MemoryAndIOTestRunner)initWithTestName:(id)a3 browserController:(id)a4 type:(unint64_t)a5
{
  id v9;
  id v10;
  MemoryAndIOTestRunner *v11;
  MemoryAndIOTestRunner *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MemoryAndIOTestRunner *v16;
  uint64_t v17;
  void *v18;
  MemoryAndIOTestRunner *v19;
  _QWORD v21[4];
  MemoryAndIOTestRunner *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)MemoryAndIOTestRunner;
  v11 = -[MemoryAndIOTestRunner init](&v30, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_browserController, v10);
    objc_storeStrong((id *)&v12->_testName, a3);
    v12->_type = a5;
    if (a5)
    {
      if (a5 != 1)
      {
LABEL_7:
        v24 = 0;
        v25 = &v24;
        v26 = 0x3032000000;
        v27 = __Block_byref_object_copy__6;
        v28 = __Block_byref_object_dispose__6;
        v29 = 0;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __65__MemoryAndIOTestRunner_initWithTestName_browserController_type___block_invoke;
        v21[3] = &unk_1E9CF5410;
        v23 = &v24;
        v16 = v12;
        v22 = v16;
        objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", CFSTR("WebProcessDidCrashNotification"), 0, v15, v21);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v25[5];
        v25[5] = v17;

        v19 = v16;
        _Block_object_dispose(&v24, 8);

        goto LABEL_8;
      }
      v12->writesAtStart = totalWrites();
      v13 = 10;
    }
    else
    {
      v13 = 59;
    }
    v12->_totalTabsToLoad = v13;
    goto LABEL_7;
  }
LABEL_8:

  return v12;
}

uint64_t __65__MemoryAndIOTestRunner_initWithTestName_browserController_type___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40));

    v3 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    return objc_msgSend(*(id *)(v1 + 32), "_collectTestResults");
  }
  return result;
}

- (void)runTestWithCompletion:(id)a3
{
  void *v4;
  id completionHandler;

  v4 = _Block_copy(a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v4;

  -[MemoryAndIOTestRunner _openNewTabAndLoadTestURL](self, "_openNewTabAndLoadTestURL");
}

- (void)_openNewTabAndLoadTestURL
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "openNewTabWithOptions:completionHandler:", 0, 0);
  objc_msgSend(v4, "tabDocuments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MemoryAndIOTestRunner testPageURL](self, "testPageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__MemoryAndIOTestRunner__openNewTabAndLoadTestURL__block_invoke;
  v9[3] = &unk_1E9CF5438;
  v9[4] = self;
  objc_msgSend(v6, "loadTestURL:withCallback:", v7, v9);

  objc_msgSend(v6, "pageLoadStatistics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPageLoadingTimeoutInterval:", 5.0);

}

void __50__MemoryAndIOTestRunner__openNewTabAndLoadTestURL__block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_collectCurrentLiveTabs");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v4 + 1;
  v5 = *(_QWORD **)(a1 + 32);
  if (v4 <= v5[8] && (v5[6] || v5[5] <= v2))
  {
    v6 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__MemoryAndIOTestRunner__openNewTabAndLoadTestURL__block_invoke_2;
    block[3] = &unk_1E9CF1900;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_collectTestResults");
  }
}

uint64_t __50__MemoryAndIOTestRunner__openNewTabAndLoadTestURL__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openNewTabAndLoadTestURL");
}

- (NSURL)testPageURL
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)testPageURL_testURL;
  if (!testPageURL_testURL)
  {
    _SFSafariTestContentDirectoryPath();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Apple.webarchive"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)testPageURL_testURL;
    testPageURL_testURL = v5;

    v2 = (void *)testPageURL_testURL;
  }
  return (NSURL *)v2;
}

- (void)_collectMemoryUsageInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int v32;

  v3 = a3;
  v32 = 0;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)task_info_out = 0u;
  v10 = 0u;
  task_info_outCnt = 93;
  if (!task_info(*MEMORY[0x1E0C83DA0], 0x16u, task_info_out, &task_info_outCnt))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v10 + 1) >> 20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("residentPeak"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("residentPeakUnits"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)v10 >> 20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("residentMemory"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("residentMemoryUnits"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)v18 >> 20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("physicMemory"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("physicMemoryUnits"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v12 + 1) >> 20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("internalPeak"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("MB"), CFSTR("internalPeakUnits"));
  }

}

- (void)_collectIOUsageInfo:(id)a3
{
  void *v4;
  int v5;
  int writesAtStart;
  BOOL v7;
  int v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  v5 = totalWrites();
  writesAtStart = self->writesAtStart;
  v7 = __OFSUB__(v5, writesAtStart);
  v8 = v5 - writesAtStart;
  if (v8 < 0 != v7)
    v8 += 1023;
  objc_msgSend(v4, "numberWithInt:", (v8 >> 10));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("logicalWrites"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("KB"), CFSTR("logicalWritesUnits"));
}

- (unint64_t)_collectCurrentLiveTabs
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t liveTabs;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabDocuments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isHibernated") & 1) == 0)
          v8 += objc_msgSend(v11, "isBlank") ^ 1;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  liveTabs = self->_liveTabs;
  if (liveTabs <= v8)
    liveTabs = v8;
  self->_liveTabs = liveTabs;
  return v8;
}

- (void)_collectTestResults
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  unint64_t type;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_liveTabs);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, CFSTR("liveTabs"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("Tabs"), CFSTR("liveTabsUnits"));
  v4 = (void *)MEMORY[0x1E0CB37E8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabDocuments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("allTabs"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("Tabs"), CFSTR("allTabsUnits"));
  type = self->_type;
  if (type == 1)
  {
    -[MemoryAndIOTestRunner _collectIOUsageInfo:](self, "_collectIOUsageInfo:", v10);
  }
  else if (!type)
  {
    -[MemoryAndIOTestRunner _collectMemoryUsageInfo:](self, "_collectMemoryUsageInfo:", v10);
  }
  (*((void (**)(void))self->_completionHandler + 2))();

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_destroyWeak((id *)&self->_browserController);
}

@end
