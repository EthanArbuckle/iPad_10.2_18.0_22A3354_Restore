@implementation _CRKBundleManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35___CRKBundleManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sBundleManager;
}

- (_CRKBundleManager)init
{
  _CRKBundleManager *v2;
  NSMutableSet *v3;
  NSMutableSet *bundles;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CRKBundleManager;
  v2 = -[_CRKBundleManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    bundles = v2->_bundles;
    v2->_bundles = v3;

  }
  return v2;
}

+ (id)bundleDirectoryPath
{
  if (bundleDirectoryPath_onceToken != -1)
    dispatch_once(&bundleDirectoryPath_onceToken, &__block_literal_global_0);
  return (id)bundleDirectoryPath_sBundleDirectoryPath;
}

+ (Class)bundleClass
{
  return (Class)objc_opt_class();
}

- (void)loadBundles
{
  void *v3;
  void *v4;
  os_log_t *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  os_log_t v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id obj;
  id v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bundleDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (os_log_t *)MEMORY[0x24BE15490];
  v6 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v4;
    _os_log_impl(&dword_218FCB000, v6, OS_LOG_TYPE_INFO, "Looking for plugins in %@", buf, 0xCu);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = 0;
  v24 = v3;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, &v28);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = v28;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v7)
  {
    v8 = v7;
    v27 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        v11 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v10;
          _os_log_impl(&dword_218FCB000, v11, OS_LOG_TYPE_INFO, "Found plugin: %@", buf, 0xCu);
        }
        v12 = v4;
        objc_msgSend(v4, "stringByAppendingPathComponent:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend((id)objc_opt_class(), "bundleClass");
        v15 = objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class());
        v16 = *v5;
        v17 = os_log_type_enabled(*v5, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v17)
          {
            v18 = v16;
            NSStringFromClass((Class)v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v34 = v19;
            v35 = 2112;
            v36 = v10;
            _os_log_impl(&dword_218FCB000, v18, OS_LOG_TYPE_INFO, "Initializing a bundle of type %@ for plugin %@", buf, 0x16u);

          }
        }
        else
        {
          if (v17)
          {
            v20 = v16;
            NSStringFromClass((Class)v14);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v34 = v21;
            v35 = 2112;
            v36 = v10;
            _os_log_impl(&dword_218FCB000, v20, OS_LOG_TYPE_INFO, "Defaulting to bundle of type %@ for plugin %@", buf, 0x16u);

          }
          v14 = (void *)MEMORY[0x24BDD1488];
        }
        v4 = v12;
        v22 = (void *)objc_msgSend(objc_alloc((Class)v14), "initWithPath:", v13);
        if (!v22 || v26)
        {
          v23 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v34 = v13;
            v35 = 2112;
            v36 = v26;
            _os_log_error_impl(&dword_218FCB000, v23, OS_LOG_TYPE_ERROR, "Error loading bundle at path \"%@\":%@", buf, 0x16u);
          }
        }
        else
        {
          -[_CRKBundleManager registerBundle:](self, "registerBundle:", v22);
        }

        ++v9;
      }
      while (v8 != v9);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v8);
  }

}

- (void)registerBundle:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_218FCB000, v5, OS_LOG_TYPE_INFO, "Registering bundle: %@", (uint8_t *)&v6, 0xCu);
    }
    -[NSMutableSet addObject:](self->_bundles, "addObject:", v4);
  }

}

- (NSSet)bundles
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_bundles, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundles, 0);
}

@end
