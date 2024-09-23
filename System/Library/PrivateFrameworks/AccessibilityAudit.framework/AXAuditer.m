@implementation AXAuditer

+ (void)initialize
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_11);
}

id __23__AXAuditer_initialize__block_invoke()
{
  return +[AXAuditPluginManager sharedManager](AXAuditPluginManager, "sharedManager");
}

- (AXAuditer)init
{
  AXAuditer *v2;
  uint64_t v3;
  NSMutableArray *results;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXAuditer;
  v2 = -[AXAuditer init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    results = v2->__results;
    v2->__results = (NSMutableArray *)v3;

    -[AXAuditer _initializeAuditCategories](v2, "_initializeAuditCategories");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[AXAuditer init].cold.1();
    +[AXAuditAssetManager shared](AXAuditAssetManager, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "downloadAssetsIfNecessary");

    -[AXAuditer setAuditQueue:](v2, "setAuditQueue:", MEMORY[0x24BDAC9B8]);
  }
  return v2;
}

- (void)_initializeAuditCategories
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[AXAuditer _auditCategories](self, "_auditCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(&unk_25072A0C0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(&unk_25072A0C0);
          if (NSClassFromString(*(NSString **)(*((_QWORD *)&v10 + 1) + 8 * v8)))
          {
            v9 = (void *)objc_opt_new();
            objc_msgSend(v9, "setDelegate:", self);
            objc_msgSend(v4, "addObject:", v9);

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(&unk_25072A0C0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
    -[AXAuditer set_auditCategories:](self, "set_auditCategories:", v4);

  }
}

- (id)_allCategoriesDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[AXAuditer _auditCategories](self, "_auditCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nContains %i categories {\n"), objc_msgSend(v4, "count"));
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "appendFormat:", CFSTR("   Test %i: %@"), v9 + v11 + 1, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v9 = (v9 + v11);
    }
    while (v8);
  }

  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\n   "), 1, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v3, "appendString:", v5);

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)AXAuditer;
  -[AXAuditer description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[AXAuditer _allCategoriesDescription](self, "_allCategoriesDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  return (NSString *)v3;
}

- (id)_auditCategoryForClass:(Class)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[AXAuditer _auditCategories](self, "_auditCategories");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (objc_msgSend((id)objc_opt_class(), "isEqual:", a3, (_QWORD)v12))
        {
          v10 = v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)allSupportedAuditTypes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[AXAuditer _auditCategories](self, "_auditCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "allSupportedAuditTypes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
          objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (void)_clearCurrentRunningCategories
{
  void *v3;
  void *v4;
  id v5;

  -[AXAuditer currentRunningCategories](self, "currentRunningCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXAuditer currentRunningCategories](self, "currentRunningCategories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAuditer setCurrentRunningCategories:](self, "setCurrentRunningCategories:", v4);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXAuditer set_currentTypesToAuditFor:](self, "set_currentTypesToAuditFor:", v5);

}

- (void)startWithAuditTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  AXAuditer *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AXAuditer _clearCurrentRunningCategories](self, "_clearCurrentRunningCategories");
  +[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clear");

  if (!v4 || !objc_msgSend(v4, "count"))
  {
    -[AXAuditer allSupportedAuditTypes](self, "allSupportedAuditTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  v8 = (void *)objc_msgSend(v4, "copy");
  -[AXAuditer set_currentTypesToAuditFor:](self, "set_currentTypesToAuditFor:", v8);

  v9 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v22 = self;
  -[AXAuditer _auditCategories](self, "_auditCategories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v13 = v4;
        v14 = v4;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v27 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
              if (objc_msgSend(v11, "supportsAuditTestType:", v19))
              {
                objc_msgSend(v12, "addObject:", v19);
                if ((objc_msgSend(v9, "containsObject:", v11) & 1) == 0)
                  objc_msgSend(v9, "addObject:", v11);
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v16);
        }

        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setCurrentAuditTypesToTestFor:", v20);

        }
        v4 = v13;
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v25);
  }

  objc_msgSend(v9, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditer runCategories:](v22, "runCategories:", v21);

}

- (void)runCategories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD block[5];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v12, "supportAuditGroup:", 2) & 1) != 0
          || objc_msgSend(v12, "supportAuditGroup:", 4))
        {
          objc_msgSend(v6, "addObject:", v12);
          objc_msgSend(v5, "removeObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  -[AXAuditer currentRunningCategories](self, "currentRunningCategories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v5);

  -[AXAuditer currentRunningCategories](self, "currentRunningCategories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v6);

  -[AXAuditer auditQueue](self, "auditQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__AXAuditer_runCategories___block_invoke;
  block[3] = &unk_25071ABB0;
  block[4] = self;
  v17 = v5;
  v26 = v17;
  dispatch_async(v15, block);

  if (objc_msgSend(v6, "count"))
  {
    -[AXAuditer delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchScreenshot");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "objectForKey:", CFSTR("imageData"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
    {
      +[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXAuditer _currentTime](self, "_currentTime");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v16;
      v23[1] = 3221225472;
      v23[2] = __27__AXAuditer_runCategories___block_invoke_2;
      v23[3] = &unk_25071ABB0;
      v23[4] = self;
      v24 = v6;
      objc_msgSend(v21, "addScreenshotWithInfo:timestamp:completion:", v19, v22, v23);

    }
  }

}

uint64_t __27__AXAuditer_runCategories___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runCategories:", *(_QWORD *)(a1 + 40));
}

void __27__AXAuditer_runCategories___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "auditQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__AXAuditer_runCategories___block_invoke_3;
  v4[3] = &unk_25071ABB0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __27__AXAuditer_runCategories___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runCategories:", *(_QWORD *)(a1 + 40));
}

- (void)_runCategories:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    -[AXAuditer didCompleteCategory:](self, "didCompleteCategory:", 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(v10, "setTargetPid:", -[AXAuditer targetPid](self, "targetPid", (_QWORD)v12));
        objc_msgSend(v10, "setCategoryType:", -[AXAuditer categoryType](self, "categoryType"));
        objc_msgSend(v10, "result");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDelegate:", self);
        objc_msgSend(v10, "run");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)didCompleteCategory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[AXAuditer currentRunningCategories](self, "currentRunningCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "setCurrentAuditTypesToTestFor:", 0);
    objc_msgSend(v4, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[AXAuditer _results](self, "_results");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);

    }
    -[AXAuditer currentRunningCategories](self, "currentRunningCategories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v4);

    -[AXAuditer currentRunningCategories](self, "currentRunningCategories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      -[AXAuditer delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXAuditer _results](self, "_results");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "auditer:didCompleteWithResults:", self, v13);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[AXAuditer didCompleteCategory:].cold.1(v4);
  }

}

- (void)auditCategoryResult:(id)a3 didAppendLogWithMessage:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AXAuditer delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditer:didAppendLogWithMessage:", self, v5);

}

- (void)auditCategory:(id)a3 didEncounterIssue:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AXAuditer delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditer:didEncounterIssue:", self, v5);

}

- (id)detectionResultsFromImageData:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[AXAuditImageDetectionManager sharedManager](AXAuditImageDetectionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detectionResultsFromImageData:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_currentTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v4);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(v2, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AXAuditerDelegate)delegate
{
  return (AXAuditerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
}

- (unint64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(unint64_t)a3
{
  self->_categoryType = a3;
}

- (NSMutableArray)currentRunningCategories
{
  return self->_currentRunningCategories;
}

- (void)setCurrentRunningCategories:(id)a3
{
  objc_storeStrong((id *)&self->_currentRunningCategories, a3);
}

- (OS_dispatch_queue)auditQueue
{
  return self->_auditQueue;
}

- (void)setAuditQueue:(id)a3
{
  objc_storeStrong((id *)&self->_auditQueue, a3);
}

- (NSArray)_auditCategories
{
  return self->__auditCategories;
}

- (void)set_auditCategories:(id)a3
{
  objc_storeStrong((id *)&self->__auditCategories, a3);
}

- (NSMutableArray)_results
{
  return self->__results;
}

- (void)set_results:(id)a3
{
  objc_storeStrong((id *)&self->__results, a3);
}

- (NSArray)_currentTypesToAuditFor
{
  return self->__currentTypesToAuditFor;
}

- (void)set_currentTypesToAuditFor:(id)a3
{
  objc_storeStrong((id *)&self->__currentTypesToAuditFor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentTypesToAuditFor, 0);
  objc_storeStrong((id *)&self->__results, 0);
  objc_storeStrong((id *)&self->__auditCategories, 0);
  objc_storeStrong((id *)&self->_auditQueue, 0);
  objc_storeStrong((id *)&self->_currentRunningCategories, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "-[AXAuditer init]";
  _os_log_debug_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s: Preparing to download assets", (uint8_t *)&v0, 0xCu);
}

- (void)didCompleteCategory:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lastCaseSelectorFinishedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315650;
  v5 = "-[AXAuditer didCompleteCategory:]";
  v6 = 2112;
  v7 = v2;
  v8 = 2112;
  v9 = v3;
  _os_log_error_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: currentRunningCategories is empty but %@:%@ is incorrectly finishing up.", (uint8_t *)&v4, 0x20u);

}

@end
