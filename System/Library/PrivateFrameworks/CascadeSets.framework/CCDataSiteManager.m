@implementation CCDataSiteManager

+ (id)defaultManager
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE0C098], "setsDirectoryForDomain:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRootDirectoryURL:", v3);

  return v4;
}

- (CCDataSiteManager)initWithRootDirectoryURL:(id)a3
{
  id v5;
  CCDataSiteManager *v6;
  CCDataSiteManager *v7;
  objc_class *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  CCDataResourceWriteAccess *v14;
  CCDataResourceWriteAccess *writeAccess;
  CCDataSiteManager *v16;
  NSObject *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CCDataSiteManager;
  v6 = -[CCDataSiteManager init](&v19, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_3;
  objc_storeStrong((id *)&v6->_rootDirectoryURL, a3);
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "cStringUsingEncoding:", 4);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create(v10, v11);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v12;

  v14 = -[CCDataResourceWriteAccess initWithRootDirectoryURL:queue:]([CCDataResourceWriteAccess alloc], "initWithRootDirectoryURL:queue:", v7->_rootDirectoryURL, v7->_queue);
  writeAccess = v7->_writeAccess;
  v7->_writeAccess = v14;

  if (!-[CCDataSiteManager _loadDataSites](v7, "_loadDataSites"))
  {
    __biome_log_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[CCDataSiteManager initWithRootDirectoryURL:].cold.1();

    v16 = 0;
  }
  else
  {
LABEL_3:
    v16 = v7;
  }

  return v16;
}

- (BOOL)prepareDataResourceForSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *localDeviceId;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v13;

  v4 = a3;
  -[CCDataSiteManager writeAccess](self, "writeAccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWriterForSet:accessAssertion:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  localDeviceId = self->_localDeviceId;
  v13 = 0;
  v8 = objc_msgSend(v6, "initializeDatabaseWithLocalDeviceIdentifier:error:", localDeviceId, &v13);
  v9 = v13;
  if (v9)
    v8 = 0;
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CCDataSiteManager prepareDataResourceForSet:].cold.1();
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[CCDataSiteManager prepareDataResourceForSet:].cold.2();
  }

  return v8;
}

- (BOOL)clearAllState
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__CCDataSiteManager_clearAllState__block_invoke;
  v5[3] = &unk_250990FC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__CCDataSiteManager_clearAllState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_resetRootDirectory");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_loadDataSites
{
  NSURL *rootDirectoryURL;
  NSURL **p_rootDirectoryURL;
  void *v5;
  id v6;
  NSObject *v7;
  NSString *v8;
  NSString *localDeviceId;
  NSObject *v10;
  NSString *v11;
  BOOL v12;
  NSObject *v13;
  const __CFString *v14;
  id v16;
  uint8_t buf[4];
  NSObject *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_rootDirectoryURL = &self->_rootDirectoryURL;
  rootDirectoryURL = self->_rootDirectoryURL;
  v16 = 0;
  CCGetOrCreateDirectoryURL(rootDirectoryURL, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;

  if (!v5)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CCDataSiteManager _loadDataSites].cold.1(p_rootDirectoryURL, (uint64_t)v6, v7);
    goto LABEL_9;
  }
  -[CCDataSiteManager _loadOrCreateManagerInfo](self, "_loadOrCreateManagerInfo");
  -[CCDictionaryLog objectForKey:](self->_managerInfo, "objectForKey:", CFSTR("schemaVersion"));
  v7 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(&unk_2509A1CE8, "isEqual:", v7) & 1) != 0)
  {
    -[CCDictionaryLog objectForKey:](self->_managerInfo, "objectForKey:", CFSTR("localDeviceId"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    localDeviceId = self->_localDeviceId;
    self->_localDeviceId = v8;

    if (-[CCDataSiteManager _loadOrCreateDefaultDataSite](self, "_loadOrCreateDefaultDataSite"))
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_localDeviceId;
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        v19 = 2112;
        v20 = (const __CFString *)v11;
        _os_log_impl(&dword_237B25000, v10, OS_LOG_TYPE_DEFAULT, "Loaded data sites with schema version: %@ localDeviceId: %@", buf, 0x16u);
      }

      v12 = 1;
      goto LABEL_15;
    }
LABEL_9:
    v12 = 0;
    goto LABEL_15;
  }
  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("empty");
    if (v7)
      v14 = (const __CFString *)v7;
    *(_DWORD *)buf = 138412546;
    v18 = &unk_2509A1CE8;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_237B25000, v13, OS_LOG_TYPE_DEFAULT, "Current schema (expected: %@) not initialized yet (found: %@)", buf, 0x16u);
  }

  v12 = -[CCDataSiteManager _resetRootDirectory](self, "_resetRootDirectory");
LABEL_15:

  return v12;
}

- (void)_loadOrCreateManagerInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to load manager info: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)_loadOrCreateDefaultDataSite
{
  NSURL *rootDirectoryURL;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  rootDirectoryURL = self->_rootDirectoryURL;
  v11 = 0;
  +[CCDataSite defaultDataSiteWithRootDirectoryURL:create:error:](CCDataSite, "defaultDataSiteWithRootDirectoryURL:create:error:", rootDirectoryURL, 1, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  v7 = v6;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_237B25000, v9, OS_LOG_TYPE_DEFAULT, "Loaded default data site: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[CCDataSiteManager _loadOrCreateDefaultDataSite].cold.1();
  }

  return v7;
}

- (BOOL)_resetRootDirectory
{
  NSObject *v3;
  NSURL *rootDirectoryURL;
  NSURL *v5;
  char v6;
  id v7;
  NSURL *v8;
  void *v9;
  id v10;
  NSString *localDeviceId;
  void *v12;
  NSString *v13;
  NSString *v14;
  CCDictionaryLog *managerInfo;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  NSString *v21;
  BOOL v22;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  NSURL *v28;
  __int16 v29;
  NSString *v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    rootDirectoryURL = self->_rootDirectoryURL;
    *(_DWORD *)buf = 138412290;
    v28 = rootDirectoryURL;
    _os_log_impl(&dword_237B25000, v3, OS_LOG_TYPE_DEFAULT, "Clearing root directory: %@", buf, 0xCu);
  }

  v5 = self->_rootDirectoryURL;
  v26 = 0;
  v6 = CCRemoveItemIfExistsAtURL(v5, &v26);
  v7 = v26;
  if ((v6 & 1) == 0)
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CCDataSiteManager _resetRootDirectory].cold.3();
    goto LABEL_18;
  }
  v8 = self->_rootDirectoryURL;
  v25 = v7;
  CCGetOrCreateDirectoryURL(v8, &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;

  if (v9)
  {
    -[CCDataSiteManager _loadOrCreateManagerInfo](self, "_loadOrCreateManagerInfo");
    -[CCDataSiteManager _loadOrCreateDefaultDataSite](self, "_loadOrCreateDefaultDataSite");
    localDeviceId = self->_localDeviceId;
    if (!localDeviceId)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = self->_localDeviceId;
      self->_localDeviceId = v13;

      localDeviceId = self->_localDeviceId;
    }
    managerInfo = self->_managerInfo;
    v32[0] = &unk_2509A1CE8;
    v32[1] = localDeviceId;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = CFSTR("schemaVersion");
    v31[1] = CFSTR("localDeviceId");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v10;
    v18 = -[CCDictionaryLog writeUpdatedObjects:forKeys:error:](managerInfo, "writeUpdatedObjects:forKeys:error:", v16, v17, &v24);
    v7 = v24;

    __biome_log_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_localDeviceId;
        *(_DWORD *)buf = 138412546;
        v28 = (NSURL *)&unk_2509A1CE8;
        v29 = 2112;
        v30 = v21;
        _os_log_impl(&dword_237B25000, v20, OS_LOG_TYPE_DEFAULT, "Root directory initialized with schema version: %@ localDeviceId: %@", buf, 0x16u);
      }
      v22 = 1;
      goto LABEL_19;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CCDataSiteManager _resetRootDirectory].cold.2();
LABEL_18:
    v22 = 0;
    goto LABEL_19;
  }
  __biome_log_for_category();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[CCDataSiteManager _resetRootDirectory].cold.1();
  v22 = 0;
  v7 = v10;
LABEL_19:

  return v22;
}

- (CCDataResourceWriteAccess)writeAccess
{
  return self->_writeAccess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeAccess, 0);
  objc_storeStrong((id *)&self->_localDeviceId, 0);
  objc_storeStrong((id *)&self->_dataSite, 0);
  objc_storeStrong((id *)&self->_managerInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
}

- (void)initWithRootDirectoryURL:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_237B25000, v0, OS_LOG_TYPE_FAULT, "Failed to load data sites for root directory: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)prepareDataResourceForSet:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_237B25000, v0, OS_LOG_TYPE_DEBUG, "Prepared data resource for set: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)prepareDataResourceForSet:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_237B25000, v0, v1, "Could not prepare data resource for set: %@ error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_loadDataSites
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_5_0(&dword_237B25000, a2, a3, "Failed to resolve / create root directory: %@ error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)_loadOrCreateDefaultDataSite
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to load default data site due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_resetRootDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to remove root directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
