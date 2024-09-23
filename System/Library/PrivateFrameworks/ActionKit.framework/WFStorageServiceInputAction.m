@implementation WFStorageServiceInputAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  WFDefaultFileStorageService *v9;
  WFDefaultFileStorageService *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  +[WFStorageServiceRegistry sharedRegistry](WFStorageServiceRegistry, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storageServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__WFStorageServiceInputAction_runAsynchronouslyWithInput___block_invoke;
  v11[3] = &unk_24F8B6510;
  v7 = v4;
  v12 = v7;
  objc_msgSend(v6, "if_objectsPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (WFDefaultFileStorageService *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc_init(WFDefaultFileStorageService);
  }
  v10 = v9;
  -[WFStorageServiceInputAction runAsynchronouslyWithInput:storageService:](self, "runAsynchronouslyWithInput:storageService:", v7, v9);

}

- (id)inputContentClasses
{
  void *v2;
  void *v3;
  void *v4;

  +[WFStorageServiceRegistry sharedRegistry](WFStorageServiceRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storageServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_32198);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)WFStorageServiceInputAction;
  -[WFStorageServiceInputAction localizedKeywordsWithContext:](&v22, sel_localizedKeywordsWithContext_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  +[WFStorageServiceRegistry sharedRegistry](WFStorageServiceRegistry, "sharedRegistry", 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storageServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend((id)objc_opt_class(), "serviceName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v11);
  }

  return v7;
}

uint64_t __50__WFStorageServiceInputAction_inputContentClasses__block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "resultItemClass");
}

BOOL __58__WFStorageServiceInputAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = objc_msgSend((id)objc_opt_class(), "resultItemClass");
  objc_msgSend(*(id *)(a1 + 32), "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2 == objc_opt_class();

  return v5;
}

@end
