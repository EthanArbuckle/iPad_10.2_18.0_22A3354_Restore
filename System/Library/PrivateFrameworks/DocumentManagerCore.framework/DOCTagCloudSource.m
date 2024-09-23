@implementation DOCTagCloudSource

- (id)iCloudTagsDictionary
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  +[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__DOCTagCloudSource_iCloudTagsDictionary__block_invoke;
  v6[3] = &unk_24C0FE2A8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "adoptPersonaliCloudPersonaAndPerformBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__DOCTagCloudSource_iCloudTagsDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("FinderTagDict"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSUbiquitousKeyValueStore)store
{
  return self->_store;
}

void __41__DOCTagCloudSource_initWithTagRegistry___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1888], "additionalStoreWithIdentifier:", CFSTR("com.apple.finder"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStore:", v2);

}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (DOCTagCloudSource)initWithTagRegistry:(id)a3
{
  id v3;
  DOCTagCloudSource *v4;
  void *v5;
  uint64_t v6;
  DOCTagCloudSource *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workingQueue;
  DOCTagCloudSource *v12;
  void *v13;
  void *v14;
  DOCTagCloudSource *v15;
  DOCTagCloudSource *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  DOCTagCloudSource *v22;
  _QWORD v23[4];
  DOCTagCloudSource *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)DOCTagCloudSource;
  v3 = a3;
  v4 = -[DOCTagCloudSource init](&v25, sel_init);
  -[DOCTagCloudSource setTagRegistry:](v4, "setTagRegistry:", v3);

  +[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __41__DOCTagCloudSource_initWithTagRegistry___block_invoke;
  v23[3] = &unk_24C0FE168;
  v7 = v4;
  v24 = v7;
  objc_msgSend(v5, "adoptPersonaliCloudPersonaAndPerformBlock:", v23);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = dispatch_queue_create("com.apple.DocumentManager.TagICloudDataSource.workingQueue", v9);
  workingQueue = v7->_workingQueue;
  v7->_workingQueue = (OS_dispatch_queue *)v10;

  v18 = v6;
  v19 = 3221225472;
  v20 = __41__DOCTagCloudSource_initWithTagRegistry___block_invoke_2;
  v21 = &unk_24C0FE1B8;
  v12 = v7;
  v22 = v12;
  -[DOCTagCloudSource iCloudTokenWithCompletionBlock:](v12, "iCloudTokenWithCompletionBlock:", &v18);
  if (v12->_store)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v18, v19, v20, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel_kvsStoreDidChange_, *MEMORY[0x24BDD1378], v12->_store);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v18, v19, v20, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", v12, sel_ubiquityIdentityDidChange, *MEMORY[0x24BDD1380], 0);

  v15 = v22;
  v16 = v12;

  return v16;
}

- (void)setTagRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_tagRegistry, a3);
}

- (void)iCloudTokenWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *workingQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__DOCTagCloudSource_iCloudTokenWithCompletionBlock___block_invoke;
  block[3] = &unk_24C0FE258;
  v8 = v4;
  v6 = v4;
  dispatch_async(workingQueue, block);

}

- (void)syncTagsWithCloud:(BOOL)a3 isICloudAvailable:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  if (a4)
  {
    v4 = a3;
    -[DOCTagCloudSource iCloudTagsDictionary](self, "iCloudTagsDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[DOCTagCloudSource readTagsFromCloud:](self, "readTagsFromCloud:", v4);
    else
      -[DOCTagCloudSource writeTagsToCloud](self, "writeTagsToCloud");
  }
}

- (void)readTagsFromCloud:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  DOCTagRegistryProtocol **p_tagRegistry;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  DOCTag *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  BOOL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  -[DOCTagCloudSource iCloudTagsDictionary](self, "iCloudTagsDictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[DOCTagCloudSource iCloudTagVersion](self, "iCloudTagVersion");

    if (v7 == 2)
    {
      v8 = -[DOCTagCloudSource iCloudTagSerialNumber](self, "iCloudTagSerialNumber");
      p_tagRegistry = &self->_tagRegistry;
      WeakRetained = objc_loadWeakRetained((id *)&self->_tagRegistry);
      v11 = objc_msgSend(WeakRetained, "tagSerialNumber");

      if (v8 > v11 || v3)
      {
        -[DOCTagCloudSource iCloudTags](self, "iCloudTags");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v12, "count"));
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v23 = v12;
          v14 = v12;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v28;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v28 != v17)
                  objc_enumerationMutation(v14);
                v19 = -[DOCTag initWithICloudTagAttributes:]([DOCTag alloc], "initWithICloudTagAttributes:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18));
                objc_msgSend(v13, "addObject:", v19);

                ++v18;
              }
              while (v16 != v18);
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
            }
            while (v16);
          }

          v20 = objc_loadWeakRetained((id *)p_tagRegistry);
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = __39__DOCTagCloudSource_readTagsFromCloud___block_invoke;
          v24[3] = &unk_24C0FE208;
          v26 = v3;
          v25 = v13;
          v21 = v13;
          objc_msgSend(v20, "performBatchUpdate:", v24);

          v22 = objc_loadWeakRetained((id *)p_tagRegistry);
          objc_msgSend(v22, "setTagSerialNumber:", v8);

          v12 = v23;
        }

      }
    }
  }
}

- (int64_t)iCloudTagVersion
{
  void *v2;
  void *v3;
  int64_t v4;

  -[DOCTagCloudSource iCloudTagsDictionary](self, "iCloudTagsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FinderTagDictVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)iCloudTagSerialNumber
{
  void *v2;
  void *v3;
  int64_t v4;

  -[DOCTagCloudSource iCloudTagsDictionary](self, "iCloudTagsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FinderTagSerialNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

void __52__DOCTagCloudSource_iCloudTokenWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ubiquityIdentityToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__DOCTagCloudSource_iCloudTokenWithCompletionBlock___block_invoke_2;
  v6[3] = &unk_24C0FE230;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __41__DOCTagCloudSource_initWithTagRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setICloudToken:", v3);
  +[DOCPostLaunchBuffer shared](DOCPostLaunchBuffer, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__DOCTagCloudSource_initWithTagRegistry___block_invoke_3;
  v6[3] = &unk_24C0FE190;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "performAfterLaunchAlwaysAsync:block:", 1, v6);

}

- (void)setICloudToken:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudToken, a3);
}

uint64_t __52__DOCTagCloudSource_iCloudTokenWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __41__DOCTagCloudSource_initWithTagRegistry___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncTagsWithCloud:isICloudAvailable:", 0, *(_QWORD *)(a1 + 40) != 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_store)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDD1378], self->_store);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDD1380], 0);

  v5.receiver = self;
  v5.super_class = (Class)DOCTagCloudSource;
  -[DOCTagCloudSource dealloc](&v5, sel_dealloc);
}

- (void)ubiquityIdentityDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __46__DOCTagCloudSource_ubiquityIdentityDidChange__block_invoke;
  v2[3] = &unk_24C0FE1B8;
  v2[4] = self;
  -[DOCTagCloudSource iCloudTokenWithCompletionBlock:](self, "iCloudTokenWithCompletionBlock:", v2);
}

void __46__DOCTagCloudSource_ubiquityIdentityDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "iCloudToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "isEqual:", v3);

  v5 = v6;
  if (v6 && (v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setICloudToken:", v6);
    objc_msgSend(*(id *)(a1 + 32), "syncTagsWithCloud:", 1);
    v5 = v6;
  }

}

- (void)kvsStoreDidChange:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  DOCTagCloudSource *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;

  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDD1368]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  switch((int)v7)
  {
    case 0:
      v8 = self;
      v9 = 0;
      goto LABEL_5;
    case 1:
      +[DOCTag tagsLoadedFromUserDefaults](DOCTag, "tagsLoadedFromUserDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_tagRegistry);
      objc_msgSend(WeakRetained, "userTags");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqualToOrderedSet:", v12) ^ 1;

      v8 = self;
      v9 = v13;
LABEL_5:
      -[DOCTagCloudSource syncTagsWithCloud:](v8, "syncTagsWithCloud:", v9);
      break;
    case 2:
      v14 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v14 = docLogHandle;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[DOCTagCloudSource kvsStoreDidChange:].cold.1(v14);
      break;
    case 3:
      -[DOCTagCloudSource ubiquityIdentityDidChange](self, "ubiquityIdentityDidChange");
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCTagCloudSource.m"), 119, CFSTR("Unknown kvs store change reason %d"), v7);

      break;
  }
}

- (void)syncTagsWithCloud:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__DOCTagCloudSource_syncTagsWithCloud___block_invoke;
  v3[3] = &unk_24C0FE1E0;
  v3[4] = self;
  v4 = a3;
  -[DOCTagCloudSource isICloudAvailableWithCompletionBlock:](self, "isICloudAvailableWithCompletionBlock:", v3);
}

uint64_t __39__DOCTagCloudSource_syncTagsWithCloud___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncTagsWithCloud:isICloudAvailable:", *(unsigned __int8 *)(a1 + 40), a2);
}

void __39__DOCTagCloudSource_readTagsFromCloud___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "removeAllTagsOfType:", 1);
    v3 = v4;
  }
  objc_msgSend(v3, "addTags:options:", *(_QWORD *)(a1 + 32), 2);

}

- (void)writeTagsToCloud
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  DOCTag *v20;
  id v21;
  int64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  -[DOCTagCloudSource iCloudTagsDictionary](self, "iCloudTagsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    +[DOCTag tagsLoadedFromUserDefaults](DOCTag, "tagsLoadedFromUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_tagRegistry);
    objc_msgSend(WeakRetained, "userTags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToOrderedSet:", v6);

    if ((v7 & 1) != 0)
      return;
  }
  v8 = objc_loadWeakRetained((id *)&self->_tagRegistry);
  objc_msgSend(v8, "userTags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DOCTagCloudSource iCloudTags](self, "iCloudTags");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x24BDBD1A8];
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(v15);
        v20 = -[DOCTag initWithICloudTagAttributes:]([DOCTag alloc], "initWithICloudTagAttributes:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
        objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v17);
  }

  if (!+[DOCTag areTags:equalByNameAndColorTo:](DOCTag, "areTags:equalByNameAndColorTo:", v9, v14))
  {
    v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v22 = -[DOCTagCloudSource iCloudTagSerialNumber](self, "iCloudTagSerialNumber");
    v23 = objc_loadWeakRetained((id *)&self->_tagRegistry);
    v24 = objc_msgSend(v23, "tagSerialNumber");

    if (v22 <= v24)
      v25 = v24;
    else
      v25 = v22;
    v37 = v25 + 1;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v38 = v9;
    v27 = v9;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "iCloudTagAttributes");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v29);
    }

    objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("FinderTags"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_24C10A4D8, CFSTR("FinderTagDictVersion"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v33, CFSTR("FinderTagSerialNumber"));

    v34 = objc_loadWeakRetained((id *)&self->_tagRegistry);
    objc_msgSend(v34, "setTagSerialNumber:", v37);

    +[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __37__DOCTagCloudSource_writeTagsToCloud__block_invoke;
    v39[3] = &unk_24C0FE190;
    v39[4] = self;
    v40 = v21;
    v36 = v21;
    objc_msgSend(v35, "adoptPersonaliCloudPersonaAndPerformBlock:", v39);

    v9 = v38;
  }

}

void __37__DOCTagCloudSource_writeTagsToCloud__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDictionary:forKey:", *(_QWORD *)(a1 + 40), CFSTR("FinderTagDict"));

  objc_msgSend(*(id *)(a1 + 32), "store");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

}

- (void)isICloudAvailableWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__DOCTagCloudSource_isICloudAvailableWithCompletionBlock___block_invoke;
  v6[3] = &unk_24C0FE280;
  v7 = v4;
  v5 = v4;
  -[DOCTagCloudSource iCloudTokenWithCompletionBlock:](self, "iCloudTokenWithCompletionBlock:", v6);

}

uint64_t __58__DOCTagCloudSource_isICloudAvailableWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

- (id)iCloudTags
{
  void *v2;
  void *v3;

  -[DOCTagCloudSource iCloudTagsDictionary](self, "iCloudTagsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FinderTags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSObject)iCloudToken
{
  return self->_iCloudToken;
}

- (OS_dispatch_queue)workingQueue
{
  return self->_workingQueue;
}

- (DOCTagRegistryProtocol)tagRegistry
{
  return (DOCTagRegistryProtocol *)objc_loadWeakRetained((id *)&self->_tagRegistry);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tagRegistry);
  objc_storeStrong((id *)&self->_workingQueue, 0);
  objc_storeStrong((id *)&self->_iCloudToken, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)kvsStoreDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2090A2000, log, OS_LOG_TYPE_ERROR, "Received a quota violation change.", v1, 2u);
}

@end
