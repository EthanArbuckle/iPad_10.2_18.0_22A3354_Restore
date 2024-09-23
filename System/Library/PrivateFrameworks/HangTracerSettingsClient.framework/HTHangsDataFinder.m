@implementation HTHangsDataFinder

- (HTHangsDataFinder)initWithLogUpdateCallback:(id)a3 tailspinSavedCallback:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  dispatch_queue_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  id v23;
  int v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id obj;
  _QWORD v34[4];
  int v35;
  _QWORD handler[6];
  _QWORD block[6];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v31 = a4;
  v44.receiver = self;
  v44.super_class = (Class)HTHangsDataFinder;
  v6 = -[HTHangsDataFinder init](&v44, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("lastPathComponent BEGINSWITH[cd] 'UIKit-runloop' OR lastPathComponent BEGINSWITH[cd] 'Fence'"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v7;

    if (v32)
    {
      v9 = MEMORY[0x2426392F0](v32);
      v10 = (void *)*((_QWORD *)v6 + 3);
      *((_QWORD *)v6 + 3) = v9;

      v11 = dispatch_queue_create("com.apple.DeveloperSettings.HangDetectionFileWatcher", 0);
      v12 = (void *)*((_QWORD *)v6 + 6);
      *((_QWORD *)v6 + 6) = v11;

      v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v14 = (void *)*((_QWORD *)v6 + 5);
      *((_QWORD *)v6 + 5) = v13;

      v15 = objc_opt_new();
      v16 = (void *)*((_QWORD *)v6 + 7);
      *((_QWORD *)v6 + 7) = v15;

      v42[0] = 0;
      v42[1] = v42;
      v42[2] = 0x3042000000;
      v42[3] = __Block_byref_object_copy__0;
      v42[4] = __Block_byref_object_dispose__0;
      objc_initWeak(&v43, v6);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      getDataTypePaths();
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v39;
        v19 = MEMORY[0x24BDAC760];
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v39 != v18)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v22 = *((_QWORD *)v6 + 6);
            block[0] = v19;
            block[1] = 3221225472;
            block[2] = __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke;
            block[3] = &unk_250E63230;
            block[4] = v21;
            block[5] = v42;
            dispatch_async(v22, block);
            v23 = objc_retainAutorelease(v21);
            v24 = open((const char *)objc_msgSend(v23, "UTF8String"), 0x8000);
            v25 = v24;
            if (v24 != -1)
            {
              v26 = dispatch_source_create(MEMORY[0x24BDACA28], v24, 2uLL, *((dispatch_queue_t *)v6 + 6));
              handler[0] = v19;
              handler[1] = 3221225472;
              handler[2] = __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke_2;
              handler[3] = &unk_250E63230;
              handler[4] = v23;
              handler[5] = v42;
              dispatch_source_set_event_handler(v26, handler);
              v34[0] = v19;
              v34[1] = 3221225472;
              v34[2] = __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke_3;
              v34[3] = &__block_descriptor_36_e5_v8__0l;
              v35 = v25;
              dispatch_source_set_cancel_handler(v26, v34);
              dispatch_resume(v26);
              objc_msgSend(*((id *)v6 + 5), "addObject:", v26);

            }
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
        }
        while (v17);
      }

      _Block_object_dispose(v42, 8);
      objc_destroyWeak(&v43);
    }
    if (v31)
    {
      v27 = MEMORY[0x2426392F0](v31);
      v28 = (void *)*((_QWORD *)v6 + 4);
      *((_QWORD *)v6 + 4) = v27;

      objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObserver:selector:name:object:", v6, sel_hangReporterDidSaveTailspin_, *MEMORY[0x24BE3F330], 0);

    }
  }

  return (HTHangsDataFinder *)v6;
}

void __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v10 = 0;
    objc_msgSend(WeakRetained, "getFilteredLogURLsForPath:error:", v4, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v7 = objc_msgSend(v5, "count");

    if (v6)
    {
      NSLog(CFSTR("Error looking for hang logs at path %@ error: %@"), *(_QWORD *)(a1 + 32), v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "logCountByPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 32));

    }
  }

}

void __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (**v13)(void);
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v14 = 0;
    objc_msgSend(WeakRetained, "getFilteredLogURLsForPath:error:", v4, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    v7 = objc_msgSend(v5, "count");

    if (v6)
    {
      NSLog(CFSTR("Error looking for hang logs at path %@ error: %@"), *(_QWORD *)(a1 + 32), v6);
      v7 = 0;
    }
    objc_msgSend(v3, "logCountByPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedLongValue");

    if (v10 != v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "logCountByPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *(_QWORD *)(a1 + 32));

      objc_msgSend(v3, "logUpdateCallback");
      v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v13[2]();

    }
  }

}

uint64_t __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke_3(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HTHangsDataFinder;
  -[HTHangsDataFinder dealloc](&v4, sel_dealloc);
}

- (id)getFilteredLogURLsForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, &v18);
  v9 = v18;

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v16 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v6, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = *MEMORY[0x24BDBCCC8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v12, v13, 0, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HTHangsDataFinder hangLogPredicate](self, "hangLogPredicate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)dateFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 && (objc_msgSend(v3, "doubleValue"), v7 != 0.0))
  {
    v9 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)hangsDataEntryAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  HTHangsDataFinder *v18;
  id v19;
  id v20;

  v6 = a3;
  NSLog(CFSTR("Looking for data entries at path %@"), v6);
  -[HTHangsDataFinder getFilteredLogURLsForPath:error:](self, "getFilteredLogURLsForPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48__HTHangsDataFinder_hangsDataEntryAtPath_error___block_invoke;
  v16[3] = &unk_250E63278;
  v17 = v6;
  v18 = self;
  v19 = v9;
  v10 = v8;
  v20 = v10;
  v11 = v9;
  v12 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);
  v13 = v20;
  v14 = v10;

  return v14;
}

void __48__HTHangsDataFinder_hangsDataEntryAtPath_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HTHangExtendedAttributes *v11;
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v14 = 0;
  v4 = *MEMORY[0x24BDBCCC8];
  v13 = 0;
  v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v14, v4, &v13);
  v6 = v14;
  v7 = v13;
  if (v5 && (objc_msgSend(v6, "BOOLValue") & 1) == 0)
  {
    NSLog(CFSTR("URL %@ does not have extended attributes, skipping"), v3);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v3, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[HTHangExtendedAttributes initWithFilePath:]([HTHangExtendedAttributes alloc], "initWithFilePath:", v10);
    objc_msgSend(*(id *)(a1 + 40), "hangsDataEntryWithFullPath:extendedAttributes:cachedAppRecords:", v10, v11, *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);

  }
}

- (id)hangsDataEntryWithFullPath:(id)a3 extendedAttributes:(id)a4 cachedAppRecords:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  HTHangsDataEntry *v22;
  void *v24;
  HTHangsDataEntry *v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "bundleID");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11
    && (v12 = (void *)v11,
        objc_msgSend(v9, "hangID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    objc_msgSend(v9, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HTHangsDataFinder appRecordWithBundleId:cachedAppRecords:](self, "appRecordWithBundleId:cachedAppRecords:", v14, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = [HTHangsDataEntry alloc];
    objc_msgSend(v9, "hangID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HTHangsDataFinder dateFromString:](self, "dateFromString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;
    objc_msgSend(v9, "bundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HTHangsDataEntry initWithPath:hangID:creationDate:duration:processBundleID:processPath:processRecord:](v25, "initWithPath:hangID:creationDate:duration:processBundleID:processPath:processRecord:", v8, v24, v16, v20, v21, v26, v19);

  }
  else
  {
    NSLog(CFSTR("Entry at path %@ is missing bundle id or hang id: skipping."), v8);
    v22 = 0;
  }

  return v22;
}

- (id)appRecordWithBundleId:(id)a3 cachedAppRecords:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v12 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, &v12);
    v8 = (const __CFString *)v12;
    v9 = (__CFString *)v8;
    if (!v8 && v7)
      goto LABEL_7;
    v10 = CFSTR("No error, app was not found");
    if (v8)
      v10 = v8;
    NSLog(CFSTR("Unable to retrieve information about app with bundle id %@ (Error: %@)"), v5, v10);
    if (v7)
LABEL_7:
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v5);

  }
  return v7;
}

+ (id)groupEntriesByHangID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "hangID", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v11);

          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (void)findEventsFilteringDeveloperApps:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v4 = a3;
  v6 = a4;
  NSLog(CFSTR("Finding hang events (filtering on developer apps: %d)"), v4);
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke;
  block[3] = &unk_250E63318;
  v11 = v4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD *v16;
  char v17;
  _QWORD v18[5];
  id v19;

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__34;
  v18[4] = __Block_byref_object_dispose__35;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getDataTypePaths();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_36;
  v13[3] = &unk_250E632C8;
  v5 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v16 = v18;
  v17 = *(_BYTE *)(a1 + 48);
  v15 = v5;
  v6 = v2;
  v14 = v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v13);

  +[HTHangsDataFinder groupEntriesByHangID:](HTHangsDataFinder, "groupEntriesByHangID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_3;
  block[3] = &unk_250E632F0;
  v8 = *(id *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v18, 8);
}

void __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_36(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  id obj;

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v7, "hangsDataEntryAtPath:error:", a2, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_112);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    NSLog(CFSTR("There was an error finding entries for type: %lu"), a3);
    v12 = MEMORY[0x24BDAC760];
    *a4 = 1;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_2;
    block[3] = &unk_250E632A0;
    v13 = *(id *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v16 = v13;
    v17 = v14;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    NSLog(CFSTR("Adding %lu entries to list of results"), objc_msgSend(v9, "count"));
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v9);
  }

}

uint64_t __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)findProcessingEventsFilteringDeveloperApps:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  HTHangReporterService *hangReporterService;
  HTHangReporterService *v8;
  HTHangReporterService *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  _BOOL4 v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = v4;
    _os_log_impl(&dword_23DA3F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Getting pending hangs list (filtering on developer apps: %d)", buf, 8u);
  }
  hangReporterService = self->_hangReporterService;
  if (hangReporterService
    || (v8 = objc_alloc_init(HTHangReporterService),
        v9 = self->_hangReporterService,
        self->_hangReporterService = v8,
        v9,
        (hangReporterService = self->_hangReporterService) != 0))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke;
    v11[3] = &unk_250E63340;
    v11[4] = self;
    v12 = v6;
    v13 = v4;
    -[HTHangReporterService getProcessingHangsWithCompletion:](hangReporterService, "getProcessingHangsWithCompletion:", v11);
    v10 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4099, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);
  }

}

void __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HTHangsDataEntry *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  HTHangsDataEntry *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id obj;
  void *v33;
  uint64_t v34;
  _QWORD block[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v34 = a1;
    v30 = v6;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v31 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v14 = *(void **)(v34 + 32);
          objc_msgSend(v13, "bundleID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "appRecordWithBundleId:cachedAppRecords:", v15, v33);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = [HTHangsDataEntry alloc];
          objc_msgSend(v13, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "creationDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "duration");
          v21 = v20;
          objc_msgSend(v13, "bundleID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "processPath");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[HTHangsDataEntry initWithPath:hangID:creationDate:duration:processBundleID:processPath:processRecord:](v17, "initWithPath:hangID:creationDate:duration:processBundleID:processPath:processRecord:", 0, v18, v19, v22, v23, v16, v21);

          objc_msgSend(v8, "addObject:", v24);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v10);
    }

    if (*(_BYTE *)(v34 + 48))
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_112);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filterUsingPredicate:", v25);

    }
    v7 = v30;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v46 = v26;
      _os_log_impl(&dword_23DA3F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Found %lu pending hangs entries", buf, 0xCu);
    }
    +[HTHangsDataFinder groupEntriesByHangID:](HTHangsDataFinder, "groupEntriesByHangID:", v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke_45;
    block[3] = &unk_250E632F0;
    v28 = *(id *)(v34 + 40);
    v36 = v27;
    v37 = v28;
    v29 = v27;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v5 = v31;
  }
  else
  {
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke_2;
    v42[3] = &unk_250E632F0;
    v44 = *(id *)(a1 + 40);
    v43 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v42);

    v8 = v44;
  }

}

uint64_t __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)hangReporterDidSaveTailspin:(id)a3
{
  void (**tailspinSavedCallback)(void);

  tailspinSavedCallback = (void (**)(void))self->_tailspinSavedCallback;
  if (tailspinSavedCallback)
    tailspinSavedCallback[2]();
}

- (NSPredicate)hangLogPredicate
{
  return self->_hangLogPredicate;
}

- (void)setHangLogPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_hangLogPredicate, a3);
}

- (id)logUpdateCallback
{
  return self->_logUpdateCallback;
}

- (void)setLogUpdateCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)tailspinSavedCallback
{
  return self->_tailspinSavedCallback;
}

- (void)setTailspinSavedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableArray)folderWatchDispatchSrcs
{
  return self->_folderWatchDispatchSrcs;
}

- (void)setFolderWatchDispatchSrcs:(id)a3
{
  objc_storeStrong((id *)&self->_folderWatchDispatchSrcs, a3);
}

- (OS_dispatch_queue)folderWatchTaskQueue
{
  return self->_folderWatchTaskQueue;
}

- (void)setFolderWatchTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_folderWatchTaskQueue, a3);
}

- (NSMutableDictionary)logCountByPath
{
  return self->_logCountByPath;
}

- (void)setLogCountByPath:(id)a3
{
  objc_storeStrong((id *)&self->_logCountByPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCountByPath, 0);
  objc_storeStrong((id *)&self->_folderWatchTaskQueue, 0);
  objc_storeStrong((id *)&self->_folderWatchDispatchSrcs, 0);
  objc_storeStrong(&self->_tailspinSavedCallback, 0);
  objc_storeStrong(&self->_logUpdateCallback, 0);
  objc_storeStrong((id *)&self->_hangLogPredicate, 0);
  objc_storeStrong((id *)&self->_hangReporterService, 0);
}

@end
