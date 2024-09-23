@implementation CRBundleManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CRBundleManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sBundleManager;
}

void __33__CRBundleManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sBundleManager;
  sharedInstance_sBundleManager = (uint64_t)v1;

}

- (CRBundleManager)init
{
  CRBundleManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRBundleManager;
  v2 = -[CRBundleManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.cards.CRBundleManager.serial-queue", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

+ (id)bundleDirectoryPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  CPSystemRootDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = CFSTR("System");
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "bundleDirectoryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("/Library/%@/Plugins"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathWithComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)bundleDirectoryName
{
  return CFSTR("CardKit");
}

+ (Class)bundleClass
{
  return (Class)objc_opt_class();
}

- (void)getBundlesWithCompletion:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CRBundleManager_getBundlesWithCompletion___block_invoke;
  block[3] = &unk_24DDD9260;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __44__CRBundleManager_getBundlesWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_getBundlesOnCurrentQueueWithCompletion:", v3);
LABEL_5:
    WeakRetained = v4;
    goto LABEL_6;
  }
  if (v3)
  {
    v4 = 0;
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_getBundlesOnCurrentQueueWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NSMutableSet *v6;
  NSMutableSet *bundles;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  _BOOL4 v22;
  const __CFString *v23;
  void *v24;
  CRBundleManager *v25;
  void *v26;
  int v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD);
  uint64_t v44;
  id obj;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (!self->_bundles)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    bundles = self->_bundles;
    self->_bundles = v6;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "bundleDirectoryPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CRLogContextCards;
    if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v9;
      _os_log_impl(&dword_21AC64000, v10, OS_LOG_TYPE_INFO, "Looking for plugins in %@", buf, 0xCu);
    }
    if ((objc_msgSend(v8, "fileExistsAtPath:", v9) & 1) != 0)
    {
      v43 = v5;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v47 = 0;
      v41 = v8;
      objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v9, &v47);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v47;
      obj = v11;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v49;
        v15 = CFSTR("bundle");
        do
        {
          v16 = 0;
          v44 = v13;
          do
          {
            if (*(_QWORD *)v49 != v14)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v16);
            objc_msgSend(v9, "stringByAppendingPathComponent:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "pathExtension");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", v15);

            v21 = CRLogContextCards;
            v22 = os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO);
            if ((v20 & 1) != 0)
            {
              v23 = v15;
              v24 = v9;
              if (v22)
              {
                *(_DWORD *)buf = 138412290;
                v53 = v17;
                _os_log_impl(&dword_21AC64000, v21, OS_LOG_TYPE_INFO, "Found bundle: %@", buf, 0xCu);
              }
              v25 = self;
              v26 = (void *)objc_msgSend((id)objc_opt_class(), "bundleClass");
              v27 = objc_msgSend(v26, "isSubclassOfClass:", objc_opt_class());
              v28 = (void *)CRLogContextCards;
              v29 = os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO);
              if (v27)
              {
                if (v29)
                {
                  v30 = v28;
                  NSStringFromClass((Class)v26);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v53 = v31;
                  v54 = 2112;
                  v55 = v17;
                  _os_log_impl(&dword_21AC64000, v30, OS_LOG_TYPE_INFO, "Initializing a bundle of type %@ for plugin %@", buf, 0x16u);

                }
              }
              else
              {
                if (v29)
                {
                  v32 = v28;
                  NSStringFromClass((Class)v26);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v53 = v33;
                  v54 = 2112;
                  v55 = v17;
                  _os_log_impl(&dword_21AC64000, v32, OS_LOG_TYPE_INFO, "Defaulting to bundle of type %@ for plugin %@", buf, 0x16u);

                }
                v26 = (void *)MEMORY[0x24BDD1488];
              }
              self = v25;
              v34 = (void *)objc_msgSend(objc_alloc((Class)v26), "initWithPath:", v18);
              v46 = 0;
              objc_msgSend(v34, "loadAndReturnError:", &v46);
              v35 = v46;
              v36 = v35;
              v37 = CRLogContextCards;
              v9 = v24;
              if (!v34 || v35)
              {
                v15 = v23;
                v13 = v44;
                if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v53 = v18;
                  v54 = 2112;
                  v55 = v36;
                  _os_log_error_impl(&dword_21AC64000, v37, OS_LOG_TYPE_ERROR, "Error loading bundle at path \"%@\": %@", buf, 0x16u);
                }
              }
              else
              {
                v15 = v23;
                if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v53 = v34;
                  _os_log_impl(&dword_21AC64000, v37, OS_LOG_TYPE_INFO, "Registering bundle: %@", buf, 0xCu);
                }
                -[NSMutableSet addObject:](self->_bundles, "addObject:", v34);
                v13 = v44;
              }

            }
            else if (v22)
            {
              *(_DWORD *)buf = 138412290;
              v53 = v17;
              _os_log_impl(&dword_21AC64000, v21, OS_LOG_TYPE_INFO, "File is not a bundle, continuing: %@", buf, 0xCu);
            }

            ++v16;
          }
          while (v13 != v16);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        }
        while (v13);
      }

      v38 = v42;
      if (v42)
      {
        v39 = CRLogContextCards;
        v5 = v43;
        if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_ERROR))
          -[CRBundleManager _getBundlesOnCurrentQueueWithCompletion:].cold.1((uint64_t)v9, (uint64_t)v42, v39);
      }
      else
      {
        v5 = v43;
      }
      v8 = v41;
      if (!v5)
        goto LABEL_43;
    }
    else
    {
      v40 = CRLogContextCards;
      if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v9;
        _os_log_impl(&dword_21AC64000, v40, OS_LOG_TYPE_INFO, "Bundle directory doesn't exist at path \"%@\", buf, 0xCu);
      }
      v38 = 0;
      if (!v5)
        goto LABEL_43;
    }
    ((void (**)(_QWORD, NSMutableSet *, void *))v5)[2](v5, self->_bundles, v38);
LABEL_43:

    goto LABEL_44;
  }
  if (v4)
    (*((void (**)(id))v4 + 2))(v4);
LABEL_44:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
}

- (void)_getBundlesOnCurrentQueueWithCompletion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21AC64000, log, OS_LOG_TYPE_ERROR, "Error loading bundles at path \"%@\": %@", (uint8_t *)&v3, 0x16u);
}

@end
