@implementation HTDeveloperAppsFinder

- (HTDeveloperAppsFinder)init
{
  HTDeveloperAppsFinder *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HTDeveloperAppsFinder;
  v2 = -[HTDeveloperAppsFinder init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HTDeveloperAppsFinder;
  -[HTDeveloperAppsFinder dealloc](&v4, sel_dealloc);
}

- (void)findApps:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  NSLog(CFSTR("Finding applications either signed with a dev certificate or installed via testflight"));
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HTDeveloperAppsFinder_findApps___block_invoke;
  block[3] = &unk_250E63488;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __34__HTDeveloperAppsFinder_findApps___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *i;
  void *v6;
  HTDeveloperApp *v7;
  void *v8;
  void *v9;
  HTDeveloperApp *v10;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __34__HTDeveloperAppsFinder_findApps___block_invoke_2;
  v14[3] = &unk_250E633E0;
  v16 = &v17;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v2, "setErrorHandler:", v14);
  objc_msgSend(v2, "setFilter:", &__block_literal_global_4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; i = v6)
  {
    objc_msgSend(v2, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      break;
    v7 = [HTDeveloperApp alloc];
    objc_msgSend(v6, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HTDeveloperApp initWithName:bundleID:](v7, "initWithName:bundleID:", v8, v9);
    objc_msgSend(v4, "addObject:", v10);

  }
  NSLog(CFSTR("Found %lu developer apps"), objc_msgSend(v4, "count"));
  if (*((_BYTE *)v18 + 24))
  {
    NSLog(CFSTR("Completion block was already called - not reporting the error"));
  }
  else
  {
    NSLog(CFSTR("Calling completion block"));
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __34__HTDeveloperAppsFinder_findApps___block_invoke_5;
    block[3] = &unk_250E632F0;
    v13 = *(id *)(a1 + 32);
    v12 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  _Block_object_dispose(&v17, 8);
}

void __34__HTDeveloperAppsFinder_findApps___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  id v8;

  v3 = a2;
  NSLog(CFSTR("There was an error when listing the apps: %@"), v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    NSLog(CFSTR("Completion block was already called - no reporting the error"));
  }
  else
  {
    v5 = MEMORY[0x24BDAC760];
    *(_BYTE *)(v4 + 24) = 1;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __34__HTDeveloperAppsFinder_findApps___block_invoke_3;
    block[3] = &unk_250E632F0;
    v8 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __34__HTDeveloperAppsFinder_findApps___block_invoke_3(uint64_t a1)
{
  NSLog(CFSTR("Reporting the error with LSApplicationRecord"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __34__HTDeveloperAppsFinder_findApps___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDeveloperApp");
}

void __34__HTDeveloperAppsFinder_findApps___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "sortedArrayUsingComparator:", &__block_literal_global_20);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

uint64_t __34__HTDeveloperAppsFinder_findApps___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)checkProxiesForDeveloperAppAndNotifyDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  id WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  v6 = v4;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "correspondingApplicationRecord", (_QWORD)v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isDeveloperApp");

      if ((v11 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        v6 = v4;
        goto LABEL_12;
      }
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
      goto LABEL_13;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "developerAppsDidChangeForFinder:", self);
  }
LABEL_12:

LABEL_13:
}

- (HTDeveloperAppsFinderDelegate)delegate
{
  return (HTDeveloperAppsFinderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
