@implementation BCCloudDataSource

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 nameOnDisk:(id)a4
{
  return (BCCloudDataSource *)MEMORY[0x24BEDD108](self, sel_initWithManagedObjectModel_nameOnDisk_delegate_, a3, a4, 0);
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 rootDirectoryURL:(id)a4 legacyRootDirectoryURL:(id)a5 nameOnDisk:(id)a6
{
  return (BCCloudDataSource *)objc_msgSend_initWithManagedObjectModel_rootDirectoryURL_legacyRootDirectoryURL_nameOnDisk_delegate_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, 0);
}

- (BOOL)_setupPersistentStoreWithRootDirectoryURL:(id)a3 legacyRootDirectoryURL:(id)a4 nameOnDisk:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  BOOL v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v88;
  id v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  objc_msgSend_URLByAppendingPathComponent_isDirectory_(a3, v10, (uint64_t)v9, 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_isDirectory_(v12, v13, (uint64_t)v9, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__directoryExistsForStoreAtURL_(self, v16, (uint64_t)v15, v17, v18) & 1) == 0)
  {
    objc_msgSend_URLByAppendingPathComponent_(v8, v19, (uint64_t)v9, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__createDirectoryForStoreAtURL_(self, v23, (uint64_t)v15, v24, v25);
    if (objc_msgSend__directoryExistsForStoreAtURL_(self, v26, (uint64_t)v22, v27, v28))
    {
      objc_msgSend__migrateAndDestroyStoreAtLegacyURL_toModernURL_(self, v29, (uint64_t)v22, (uint64_t)v15, v30);
    }
    else
    {
      BDSCloudKitLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v88 = 138412290;
        v89 = v22;
        _os_log_impl(&dword_227D4F000, v31, OS_LOG_TYPE_DEFAULT, "Unable to migrate legacy database since file does not exist at URL %@", (uint8_t *)&v88, 0xCu);
      }

    }
  }
  if (!BDSIsInternalInstall())
    goto LABEL_14;
  objc_msgSend_books(MEMORY[0x24BE0FBF0], v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userDefaults(v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringForKey_(v41, v42, (uint64_t)CFSTR("BDSDevelopmentForceAddStoreFailureOnce"), v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEqual_(v45, v46, (uint64_t)v9, v47, v48))
  {

LABEL_14:
    v53 = objc_msgSend__addStoreAtURL_(self, v32, (uint64_t)v15, v34, v35);
    v54 = 0;
    goto LABEL_15;
  }
  BDSCloudKitLog();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v88 = 138543874;
    v89 = v9;
    v90 = 2160;
    v91 = 1752392040;
    v92 = 2112;
    v93 = v15;
    _os_log_impl(&dword_227D4F000, v49, OS_LOG_TYPE_DEFAULT, "_setupPersistentStoreWithRootDirectoryURL -- Forcing store failure once for %{public}@, url: %{mask.hash}@", (uint8_t *)&v88, 0x20u);
  }

  objc_msgSend_removeObjectForKey_(v41, v50, (uint64_t)CFSTR("BDSDevelopmentForceAddStoreFailureOnce"), v51, v52);
  v53 = 0;
  v54 = 1;
LABEL_15:
  BDSCloudKitLog();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v88 = 138412546;
    v89 = v15;
    v90 = 1024;
    LODWORD(v91) = v53;
    _os_log_impl(&dword_227D4F000, v55, OS_LOG_TYPE_DEFAULT, "_setupPersistentStoreWithRootDirectoryURL: %@, storeAdded: %d", (uint8_t *)&v88, 0x12u);
  }

  if ((v53 & 1) != 0)
    goto LABEL_26;
  BDSCloudKitLog();
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v54)
  {
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      sub_227E5DF10(v57);
  }
  else if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
  {
    sub_227E5DF4C(v57, v58, v59, v60, v61, v62, v63, v64);
  }

  if (objc_msgSend__deleteDirectoryForStoreAtURL_(self, v65, (uint64_t)v15, v66, v67))
  {
    objc_msgSend__createDirectoryForStoreAtURL_(self, v68, (uint64_t)v15, v69, v70);
    objc_msgSend_delegate(self, v71, v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataSource_storeDidReset_(v75, v76, (uint64_t)self, (uint64_t)v9, v77);

  }
  if ((objc_msgSend__addStoreAtURL_(self, v68, (uint64_t)v15, v69, v70) & 1) != 0)
  {
LABEL_26:
    v78 = 1;
  }
  else
  {
    BDSCloudKitLog();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      sub_227E5DEE0(v79, v80, v81, v82, v83, v84, v85, v86);

    v78 = 0;
  }

  return v78;
}

- (BOOL)_directoryExistsForStoreAtURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_URLByDeletingLastPathComponent(a3, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_checkResourceIsReachableAndReturnError_(v5, v6, 0, v7, v8);

  return v9;
}

- (BOOL)_addStoreAtURL:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSPersistentStoreCoordinator *v27;
  int v28;
  id v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BDSCloudKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_lastPathComponent(v4, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v10;
    _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_INFO, "Adding cloud data source persistent store for %@", buf, 0xCu);

  }
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  v12 = *MEMORY[0x24BDBB580];
  objc_msgSend__persistentStoreOptions(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(persistentStoreCoordinator, v18, v12, 0, (uint64_t)v4, v17, &v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v35;

  if (objc_msgSend_isReadOnly(v19, v21, v22, v23, v24))
  {
    v27 = self->_persistentStoreCoordinator;
    v34 = 0;
    v28 = objc_msgSend_removePersistentStore_error_(v27, v25, (uint64_t)v19, (uint64_t)&v34, v26);
    v29 = v34;
    objc_msgSend__logIf_error_operation_(self, v30, v28 ^ 1u, (uint64_t)v29, (uint64_t)CFSTR("removing read-only cloud data source persistent store"));

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v31, (uint64_t)CFSTR("BDSErrorDomain"), 1002, 0);
    v32 = objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v20 = (id)v32;
  }
  if (v19)
    objc_msgSend__logIf_error_operation_(self, v25, 0, (uint64_t)v20, (uint64_t)CFSTR("adding cloud data source persistent store"));
  else
    objc_msgSend__logIf_error_operation_(self, v25, 1, (uint64_t)v20, (uint64_t)CFSTR("adding cloud data source persistent store"));

  return v19 != 0;
}

- (id)_persistentStoreOptions
{
  uint64_t v2;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBB488];
  v4[0] = *MEMORY[0x24BDBB420];
  v4[1] = v2;
  v5[0] = MEMORY[0x24BDBD1C8];
  v5[1] = MEMORY[0x24BDBD1C8];
  v4[2] = *MEMORY[0x24BDBB4C8];
  v5[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v5, (uint64_t)v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_logIf:(BOOL)a3 error:(id)a4 operation:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  if (v6)
  {
    BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5DE18((uint64_t)v8, v7, v9, v10, v11);

  }
}

+ (id)_sharedRootDirectoryURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend__documentsDirectoryURL(a1, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_isDirectory_(v5, v6, (uint64_t)CFSTR("BCCloudData-iBooks"), 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_sharedLegacyRootDirectoryURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend__documentsDirectoryURL(a1, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_isDirectory_(v5, v6, (uint64_t)CFSTR("BCCloudAsset-iBooks"), 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_documentsDirectoryURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend_applicationDocumentsDirectory(BDSApplication, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_(v5, v7, (uint64_t)v6, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setupManagedObjectContext
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSManagedObjectContext *v7;
  NSManagedObjectContext *managedObjectContext;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = objc_alloc(MEMORY[0x24BDBB6A0]);
  v7 = (NSManagedObjectContext *)objc_msgSend_initWithConcurrencyType_(v3, v4, 1, v5, v6);
  managedObjectContext = self->_managedObjectContext;
  self->_managedObjectContext = v7;

  objc_msgSend_setPersistentStoreCoordinator_(self->_managedObjectContext, v9, (uint64_t)self->_persistentStoreCoordinator, v10, v11);
  MEMORY[0x24BEDD108](self->_managedObjectContext, sel_setUndoManager_, 0, v12, v13);
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3
{
  id v4;
  BCCloudDataSource *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  NSPersistentStoreCoordinator *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BCCloudDataSource;
  v5 = -[BCCloudDataSource init](&v26, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBB738]);
    v10 = objc_msgSend_initWithManagedObjectModel_(v6, v7, (uint64_t)v4, v8, v9);
    persistentStoreCoordinator = v5->_persistentStoreCoordinator;
    v5->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v10;

    v12 = v5->_persistentStoreCoordinator;
    v13 = *MEMORY[0x24BDBB418];
    objc_msgSend__persistentStoreOptions(v5, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(v12, v19, v13, 0, 0, v18, 0);

    objc_msgSend__setupManagedObjectContext(v5, v21, v22, v23, v24);
  }

  return v5;
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 nameOnDisk:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  BCCloudDataSource *v22;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend__sharedRootDirectoryURL(BCCloudDataSource, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sharedLegacyRootDirectoryURL(BCCloudDataSource, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (BCCloudDataSource *)objc_msgSend_initWithManagedObjectModel_rootDirectoryURL_legacyRootDirectoryURL_nameOnDisk_delegate_(self, v21, (uint64_t)v10, (uint64_t)v15, (uint64_t)v20, v9, v8);

  return v22;
}

- (BCCloudDataSource)initWithManagedObjectModel:(id)a3 rootDirectoryURL:(id)a4 legacyRootDirectoryURL:(id)a5 nameOnDisk:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  objc_super v41;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  kdebug_trace();
  v41.receiver = self;
  v41.super_class = (Class)BCCloudDataSource;
  v17 = -[BCCloudDataSource init](&v41, sel_init);
  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x24BDBB738]);
    v22 = objc_msgSend_initWithManagedObjectModel_(v18, v19, (uint64_t)v12, v20, v21);
    v23 = (void *)*((_QWORD *)v17 + 2);
    *((_QWORD *)v17 + 2) = v22;

    objc_storeWeak((id *)v17 + 3, v16);
    if (objc_msgSend__setupPersistentStoreWithRootDirectoryURL_legacyRootDirectoryURL_nameOnDisk_(v17, v24, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15)&& (objc_msgSend_persistentStores(*((void **)v17 + 2), v25, v26, v27, v28), v29 = (void *)objc_claimAutoreleasedReturnValue(), v34 = objc_msgSend_count(v29, v30, v31, v32, v33), v29, v34))
    {
      objc_msgSend__setupManagedObjectContext(v17, v35, v36, v37, v38);
    }
    else
    {
      BDSCloudKitLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_227E5DDA0((uint64_t *)v17 + 2, v39);

    }
  }
  kdebug_trace();

  return (BCCloudDataSource *)v17;
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void (**v32)(void *, uint64_t, id);
  id v33;

  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend_defaultManager(v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sharedLegacyRootDirectoryURL(a1, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeItemAtURL_error_(v10, v16, (uint64_t)v15, 0, v17);

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sharedRootDirectoryURL(a1, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v30 = objc_msgSend_removeItemAtURL_error_(v22, v28, (uint64_t)v27, (uint64_t)&v33, v29);
  v31 = v33;

  v32 = (void (**)(void *, uint64_t, id))_Block_copy(v5);
  if (v32)
    v32[2](v32, v30, v31);

}

- (void)_createDirectoryForStoreAtURL:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;
  const char *v18;
  id v19;

  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend_defaultManager(v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByDeletingLastPathComponent(v5, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  LODWORD(v5) = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v10, v16, (uint64_t)v15, 1, 0, &v19);
  v17 = v19;

  objc_msgSend__logIf_error_operation_(self, v18, v5 ^ 1, (uint64_t)v17, (uint64_t)CFSTR("creating directory for store"));
}

- (BOOL)_deleteDirectoryForStoreAtURL:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  id v21;

  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend_defaultManager(v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByDeletingLastPathComponent(v5, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  LODWORD(v5) = objc_msgSend_removeItemAtURL_error_(v10, v16, (uint64_t)v15, (uint64_t)&v21, v17);
  v18 = v21;

  objc_msgSend__logIf_error_operation_(self, v19, v5 ^ 1, (uint64_t)v18, (uint64_t)CFSTR("deleting directory for store"));
  return (char)v5;
}

- (void)_migrateAndDestroyStoreAtLegacyURL:(id)a3 toModernURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  int v22;
  id v23;
  const char *v24;
  NSObject *v25;
  NSPersistentStoreCoordinator *v26;
  const char *v27;
  int v28;
  id v29;
  const char *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  BDSCloudKitLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v6;
    v35 = 2112;
    v36 = v7;
    _os_log_impl(&dword_227D4F000, v8, OS_LOG_TYPE_INFO, "Migrating legacy cloud data source from %@ to %@", buf, 0x16u);
  }

  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  objc_msgSend__persistentStoreOptions(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__persistentStoreOptions(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BDBB580];
  v32 = 0;
  v22 = objc_msgSend_replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error_(persistentStoreCoordinator, v21, (uint64_t)v7, (uint64_t)v14, (uint64_t)v6, v19, v20, &v32);
  v23 = v32;

  objc_msgSend__logIf_error_operation_(self, v24, v22 ^ 1u, (uint64_t)v23, (uint64_t)CFSTR("[MIGRATE] migrate legacy store"));
  BDSCloudKitLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v6;
    _os_log_impl(&dword_227D4F000, v25, OS_LOG_TYPE_INFO, "Destroying legacy cloud data source at %@", buf, 0xCu);
  }

  v26 = self->_persistentStoreCoordinator;
  v31 = 0;
  v28 = objc_msgSend_destroyPersistentStoreAtURL_withType_options_error_(v26, v27, (uint64_t)v6, v20, 0, &v31);
  v29 = v31;
  objc_msgSend__logIf_error_operation_(self, v30, v28 ^ 1u, (uint64_t)v29, (uint64_t)CFSTR("[MIGRATE] destroy legacy store"));

}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, a3);
}

- (BCCloudDataSourceDelegate)delegate
{
  return (BCCloudDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end
