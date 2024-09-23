@implementation WFInstapaperGetAction

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFInstapaperGetAction;
  -[WFInstapaperGetAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3 selectedFolder:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__WFInstapaperGetAction_runAsynchronouslyWithInput_selectedFolder___block_invoke;
  v7[3] = &unk_24F8BA480;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

- (id)connectionTypes
{
  return &unk_24F93C348;
}

- (BOOL)includeSpecialFolders
{
  return 1;
}

- (void)engine:(id)a3 connection:(id)a4 didReceiveBookmarks:(id)a5 ofUser:(id)a6 forFolder:(id)a7
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  -[WFInstapaperAction identifiers](self, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[WFInstapaperAction identifiers](self, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFInstapaperAction engine](self, "engine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifierForConnection:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v15);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v20);
        -[WFInstapaperGetAction output](self, "output", (_QWORD)v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "URL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "title");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:named:", v23, v24);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

}

void __67__WFInstapaperGetAction_runAsynchronouslyWithInput_selectedFolder___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFBookmarkCount"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "engine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookmarksInFolder:limit:existingBookmarks:userInfo:", *(_QWORD *)(a1 + 40), v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

}

@end
