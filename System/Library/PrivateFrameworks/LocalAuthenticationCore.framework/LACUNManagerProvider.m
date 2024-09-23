@implementation LACUNManagerProvider

- (LACUNManagerProvider)init
{
  LACUNManagerProvider *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LACUNManagerProvider;
  v2 = -[LACUNManagerProvider init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[LACUNManagerProvider setSharedInstances:](v2, "setSharedInstances:", v3);

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_13);
  return (id)sharedInstance_sharedInstance_6;
}

void __38__LACUNManagerProvider_sharedInstance__block_invoke()
{
  LACUNManagerProvider *v0;
  void *v1;

  v0 = objc_alloc_init(LACUNManagerProvider);
  v1 = (void *)sharedInstance_sharedInstance_6;
  sharedInstance_sharedInstance_6 = (uint64_t)v0;

}

- (id)sharedInstanceWithBundleIdentifier:(id)a3 replyQueue:(id)a4
{
  return -[LACUNManagerProvider sharedInstanceWithBundleIdentifier:categories:replyQueue:](self, "sharedInstanceWithBundleIdentifier:categories:replyQueue:", a3, MEMORY[0x24BDBD1A8], a4);
}

- (id)sharedInstanceWithBundleIdentifier:(id)a3 categories:(id)a4 replyQueue:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  LACUNManagerQueueDecorator *v19;
  LACUNManagerQueueDecorator *v20;
  void *v21;
  void *v22;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v7 = a4;
  v25 = a5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    v12 = &stru_2510C57B8;
    do
    {
      v13 = 0;
      v14 = v12;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v15 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v13), "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@-%@"), v14, v16);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v12;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v10);
  }
  else
  {
    v12 = &stru_2510C57B8;
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v26, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUNManagerProvider sharedInstances](self, "sharedInstances");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v17);
  v19 = (LACUNManagerQueueDecorator *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v20 = [LACUNManagerQueueDecorator alloc];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke;
    v27[3] = &unk_2510C26C0;
    v28 = v26;
    v29 = v7;
    __81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke((uint64_t)v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[LACUNManagerQueueDecorator initWithManager:replyQueue:](v20, "initWithManager:replyQueue:", v21, v25);

    -[LACUNManagerProvider sharedInstances](self, "sharedInstances");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, v17);

  }
  return v19;
}

LACUNManagerSetUpDecorator *__81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke(uint64_t a1)
{
  LACUNManagerSetUpDecorator *v2;
  LACUNManagerSetUpDecorator *v3;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = [LACUNManagerSetUpDecorator alloc];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke_2;
  v5[3] = &unk_2510C2698;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v3 = -[LACUNManagerSetUpDecorator initWithManagerBuilder:](v2, "initWithManagerBuilder:", v5);

  return v3;
}

LACUNManager *__81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke_2(uint64_t a1)
{
  return -[LACUNManager initWithBundleIdentifier:categories:]([LACUNManager alloc], "initWithBundleIdentifier:categories:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (NSMutableDictionary)sharedInstances
{
  return self->_sharedInstances;
}

- (void)setSharedInstances:(id)a3
{
  objc_storeStrong((id *)&self->_sharedInstances, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedInstances, 0);
}

@end
