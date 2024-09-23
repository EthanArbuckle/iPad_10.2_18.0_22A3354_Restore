@implementation BCCloudKitController

- (BOOL)didChangeContainer
{
  return self->_didChangeContainer;
}

- (BCCloudKitDatabaseController)privateCloudDatabaseController
{
  return (BCCloudKitDatabaseController *)objc_getProperty(self, a2, 24, 1);
}

- (BCCloudKitController)initWithConfiguration:(id)a3
{
  id v4;
  BCCloudKitController *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BCCloudKitController *v9;
  NSMutableArray *v10;
  NSMutableArray *pendingGetAccountInfoCompletionBlocks;
  NSMutableArray *v12;
  NSMutableArray *pendingRequestUpdateAttachmentCompletionBlocks;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  BCCloudKitDatabaseController *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  BCCloudKitDatabaseController *privateCloudDatabaseController;
  BCCloudKitDatabaseController *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void **v61;
  const char *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  id location;
  _QWORD v85[4];
  void **v86;
  objc_super v87;

  v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)BCCloudKitController;
  v5 = -[BCCloudKitController init](&v87, sel_init);
  v9 = v5;
  if (v5)
  {
    objc_msgSend_setConfiguration_(v5, v6, (uint64_t)v4, v7, v8);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingGetAccountInfoCompletionBlocks = v9->_pendingGetAccountInfoCompletionBlocks;
    v9->_pendingGetAccountInfoCompletionBlocks = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingRequestUpdateAttachmentCompletionBlocks = v9->_pendingRequestUpdateAttachmentCompletionBlocks;
    v9->_pendingRequestUpdateAttachmentCompletionBlocks = v12;

    v9->_currentStatus = 0;
    objc_msgSend_queueIdentifier(v4, v14, v15, v16, v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create(v23, v24);

    objc_storeStrong((id *)&v9->_accessQueue, v25);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultCenter(MEMORY[0x24BDD1530], v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v35, v36, (uint64_t)v9, (uint64_t)sel_p_testAccountChanged_, (uint64_t)CFSTR("com.apple.BDSService.BCCloudAccountChanged"), 0);

    objc_msgSend_addObserver_selector_name_object_(v30, v37, (uint64_t)v9, (uint64_t)sel_p_accountChanged_, *MEMORY[0x24BDB8E60], 0);
    objc_msgSend_addObserver_selector_name_object_(v30, v38, (uint64_t)v9, (uint64_t)sel_p_identityChanged_, *MEMORY[0x24BDB8ED8], 0);
    v39 = [BCCloudKitDatabaseController alloc];
    v40 = (void *)objc_opt_class();
    objc_msgSend_p_privateDatabaseArchiveURLForConfiguration_(v40, v41, (uint64_t)v4, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_initWithConfiguration_archiveURL_(v39, v45, (uint64_t)v4, (uint64_t)v44, v46);
    privateCloudDatabaseController = v9->_privateCloudDatabaseController;
    v9->_privateCloudDatabaseController = (BCCloudKitDatabaseController *)v47;

    v49 = v9->_privateCloudDatabaseController;
    objc_msgSend_containerIdentifier(v4, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend_serviceMode(v9, v55, v56, v57, v58);
    v60 = MEMORY[0x24BDAC760];
    v85[0] = MEMORY[0x24BDAC760];
    v85[1] = 3221225472;
    v85[2] = sub_227D69D1C;
    v85[3] = &unk_24F08B540;
    v61 = v9;
    v86 = v61;
    objc_msgSend_willAttachToContainer_serviceMode_completion_(v49, v62, (uint64_t)v54, v59, (uint64_t)v85);

    objc_initWeak(&location, v61);
    v63 = objc_alloc(MEMORY[0x24BE0FC00]);
    v82[0] = v60;
    v82[1] = 3221225472;
    v82[2] = sub_227DB3C40;
    v82[3] = &unk_24F08A6A0;
    objc_copyWeak(&v83, &location);
    v65 = objc_msgSend_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_(v63, v64, (uint64_t)v82, 10, (uint64_t)CFSTR("_coalescedAttachment in BCCloudKitController"), &unk_24F08B560);
    v66 = v61[7];
    v61[7] = (void *)v65;

    objc_msgSend_setCoalescingDelay_(v61[7], v67, v68, v69, v70, 2.0);
    v71 = objc_alloc(MEMORY[0x24BE0FC00]);
    v80[0] = v60;
    v80[1] = 3221225472;
    v80[2] = sub_227DB3E78;
    v80[3] = &unk_24F08A6A0;
    objc_copyWeak(&v81, &location);
    v73 = objc_msgSend_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_(v71, v72, (uint64_t)v80, 45, (uint64_t)CFSTR("_coalescedChangeAttachment in BCCloudKitController"), &unk_24F08B580);
    v74 = v61[8];
    v61[8] = (void *)v73;

    objc_msgSend_setCoalescingDelay_(v61[8], v75, v76, v77, v78, 5.0);
    objc_destroyWeak(&v81);
    objc_destroyWeak(&v83);
    objc_destroyWeak(&location);

  }
  return v9;
}

+ (BCCloudKitController)sharedInstance
{
  if (qword_253F3C670 != -1)
    dispatch_once(&qword_253F3C670, &unk_24F08B460);
  return (BCCloudKitController *)(id)qword_253F3C688;
}

- (void)setTransactionManager:(id)a3
{
  objc_storeStrong((id *)&self->_transactionManager, a3);
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)serviceMode
{
  return self->_serviceMode;
}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (BCContainerConfiguration)configuration
{
  return self->_configuration;
}

- (void)applicationDidBecomeActive
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  BDSCloudKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_configuration(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v13;
    _os_log_impl(&dword_227D4F000, v3, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - applicationDidBecomeActive", buf, 0xCu);

  }
  objc_msgSend_accessQueue(self, v14, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D69CB0;
  block[3] = &unk_24F08A3E0;
  block[4] = self;
  dispatch_async(v18, block);

}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

+ (id)p_privateDatabaseArchiveURLForConfiguration:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v4 = a3;
  objc_msgSend_p_createDatabaseArchiveDirectoryForConfiguration_(a1, v5, (uint64_t)v4, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_dbArchiveFilename(v4, v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dbArchiveExtension(v4, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathExtension_(v13, v19, (uint64_t)v18, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_URLByAppendingPathComponent_(v12, v23, (uint64_t)v22, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (id)p_createDatabaseArchiveDirectoryForConfiguration:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  int DirectoryAtURL_withIntermediateDirectories_attributes_error;
  id v13;

  objc_msgSend_databaseFolderURLForConfiguration_(a1, a2, (uint64_t)a3, v3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v10, v11, (uint64_t)v9, 1, 0, 0);

    v13 = 0;
    if (DirectoryAtURL_withIntermediateDirectories_attributes_error)
      v13 = v9;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)databaseFolderURLForConfiguration:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *isDirectory;

  v3 = a3;
  objc_msgSend_applicationDocumentsDirectory(BDSApplication, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbArchiveFolderName(v3, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingPathComponent_(v8, v14, (uint64_t)v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x24BDBCF48]);
    isDirectory = (void *)objc_msgSend_initFileURLWithPath_isDirectory_(v18, v19, (uint64_t)v17, 1, v20);
  }
  else
  {
    isDirectory = 0;
  }

  return isDirectory;
}

+ (id)secureSharedInstance
{
  if (qword_25592A518 != -1)
    dispatch_once(&qword_25592A518, &unk_24F08B480);
  return (id)qword_25592A510;
}

+ (void)registerForSecureNotifications
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BCCloudKitDatabaseController *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  dispatch_queue_t v32;
  NSObject *v33;
  _QWORD v34[4];
  id v35;
  dispatch_queue_t v36;
  id v37;
  id v38;
  uint8_t buf[16];

  BDSCloudKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227D4F000, v3, OS_LOG_TYPE_DEFAULT, "BCCloudKitController - registerForSecureNotifications", buf, 2u);
  }

  objc_msgSend_configuration(BCCloudKitSecureConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [BCCloudKitDatabaseController alloc];
  objc_msgSend_p_privateDatabaseArchiveURLForConfiguration_(a1, v10, (uint64_t)v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_initWithConfiguration_archiveURL_(v9, v14, (uint64_t)v8, (uint64_t)v13, v15);

  if ((objc_msgSend_hasSubscription(v16, v17, v18, v19, v20) & 1) == 0)
  {
    objc_msgSend_queueIdentifier(v8, v21, v22, v23, v24);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (const char *)objc_msgSend_UTF8String(v25, v26, v27, v28, v29);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create(v30, v31);

    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = sub_227DB356C;
    v34[3] = &unk_24F08B518;
    v35 = v8;
    v36 = v32;
    v38 = a1;
    v37 = v16;
    v33 = v32;
    dispatch_async(v33, v34);

  }
}

+ (id)instanceForCKNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  int isEqualToString;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;

  objc_msgSend_containerIdentifier(a3, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(BCCloudKitController, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configuration(BCCloudKitSecureConfiguration, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configuration(v10, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v5, v26, (uint64_t)v25, v27, v28);

  if (isEqualToString)
  {
    v34 = v10;
  }
  else
  {
    objc_msgSend_containerIdentifier(v15, v30, v31, v32, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_isEqualToString_(v5, v36, (uint64_t)v35, v37, v38);

    if (!v39)
    {
      v44 = 0;
      goto LABEL_7;
    }
    objc_msgSend_sharedManager(BDSSecureManager, v40, v41, v42, v43);
    v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  v44 = v34;
LABEL_7:

  return v44;
}

- (void)setEnableCloudSync:(BOOL)a3 serviceMode:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[5];
  BOOL v27;
  BOOL v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v4 = a4;
  v5 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  BDSCloudKitLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_configuration(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v12, v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("NO");
    if (v5)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    *(_DWORD *)buf = 138543874;
    v30 = v17;
    v32 = v20;
    v31 = 2114;
    if (v4)
      v19 = CFSTR("YES");
    v33 = 2114;
    v34 = v19;
    _os_log_impl(&dword_227D4F000, v7, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) #enableCloudSync setEnableCloudSync %{public}@ serviceMode:%{public}@", buf, 0x20u);

  }
  objc_msgSend_accessQueue(self, v21, v22, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_227DB434C;
  v26[3] = &unk_24F08B5A8;
  v26[4] = self;
  v27 = v4;
  v28 = v5;
  dispatch_async(v25, v26);

}

- (void)requestUpdateAttachmentWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend_accessQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_227DB443C;
  v11[3] = &unk_24F08A928;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)aq_requestUpdateAttachment
{
  ((void (*)(BCCloudKitController *, char *, _QWORD))MEMORY[0x24BEDD108])(self, sel_aq_requestUpdateAttachmentWithCompletion_, 0);
}

- (void)aq_requestUpdateAttachmentWithCompletion:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  if (a3)
  {
    v6 = a3;
    objc_msgSend_pendingRequestUpdateAttachmentCompletionBlocks(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _Block_copy(v6);

    objc_msgSend_addObject_(v11, v13, (uint64_t)v12, v14, v15);
  }
  objc_msgSend_coalescedAttachment(self, a2, (uint64_t)a3, v3, v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalWithCompletion_(v19, v16, (uint64_t)&unk_24F08B5C8, v17, v18);

}

- (void)p_flushPendingRequestUpdateAttachmentCompletionBlocks
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  BDSCloudKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_configuration(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl(&dword_227D4F000, v3, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - p_flushPendingRequestUpdateAttachmentCompletionBlocks", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  objc_msgSend_privateCloudDatabaseController(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_227DB4658;
  v22[3] = &unk_24F08B618;
  objc_copyWeak(&v23, (id *)buf);
  v22[4] = self;
  objc_msgSend_getAttached_(v18, v19, (uint64_t)v22, v20, v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)p_flushPendingRequestUpdateAttachmentCompletionBlocksWithAttached:(BOOL)a3 reachable:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  _BOOL8 v81;
  uint64_t v82;

  v4 = a4;
  v5 = a3;
  v82 = *MEMORY[0x24BDAC8D0];
  BDSCloudKitLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_configuration(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v77 = v17;
    v78 = 2048;
    v79 = v5;
    v80 = 2048;
    v81 = v4;
    _os_log_impl(&dword_227D4F000, v7, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - p_flushPendingRequestUpdateAttachmentCompletionBlocksWithAttached:%lu reachable:%lu", buf, 0x20u);

  }
  objc_msgSend_accessQueue(self, v18, v19, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v22);

  objc_msgSend_pendingRequestUpdateAttachmentCompletionBlocks(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend_copy(v27, v28, v29, v30, v31);

  objc_msgSend_pendingRequestUpdateAttachmentCompletionBlocks(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v37, v38, v39, v40, v41);

  if (objc_msgSend_count(v32, v42, v43, v44, v45))
  {
    BDSCloudKitLog();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_configuration(self, v47, v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerIdentifier(v51, v52, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend_count(v32, v57, v58, v59, v60);
      *(_DWORD *)buf = 138543618;
      v77 = v56;
      v78 = 2048;
      v79 = v61;
      _os_log_impl(&dword_227D4F000, v46, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) - Calling %lu requestUpdateAttachment completion block(s)", buf, 0x16u);

    }
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v62 = v32;
    v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v71, (uint64_t)v75, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v72;
      do
      {
        v67 = 0;
        do
        {
          if (*(_QWORD *)v72 != v66)
            objc_enumerationMutation(v62);
          v68 = _Block_copy(*(const void **)(*((_QWORD *)&v71 + 1) + 8 * v67));
          v69 = v68;
          if (v68)
            (*((void (**)(void *, _BOOL8, _BOOL8))v68 + 2))(v68, v5, v4);

          ++v67;
        }
        while (v65 != v67);
        v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v70, (uint64_t)&v71, (uint64_t)v75, 16);
      }
      while (v65);
    }

  }
}

- (void)p_updateAttachment
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id location;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  BDSCloudKitSyncLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_configuration(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v13;
    _os_log_impl(&dword_227D4F000, v3, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) - p_updateAttachment", buf, 0xCu);

  }
  objc_msgSend_privateCloudDatabaseController(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_227DB4BB4;
  v22[3] = &unk_24F08B618;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  objc_msgSend_getAttached_(v18, v19, (uint64_t)v22, v20, v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  id v48;
  void (**v49)(void *, BOOL, id);
  id v50;
  id v51;

  v4 = a3;
  objc_msgSend_sharedInstance(BCCloudKitController, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configuration(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseFolderURLForConfiguration_(a1, v15, (uint64_t)v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend_removeItemAtURL_error_(v23, v24, (uint64_t)v18, (uint64_t)&v51, v25);
  v26 = v51;

  objc_msgSend_secureSharedInstance(BCCloudKitController, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configuration(v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseFolderURLForConfiguration_(a1, v37, (uint64_t)v36, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v26;
  objc_msgSend_removeItemAtURL_error_(v45, v46, (uint64_t)v40, (uint64_t)&v50, v47);
  v48 = v50;

  v49 = (void (**)(void *, BOOL, id))_Block_copy(v4);
  if (v49)
    v49[2](v49, v48 == 0, v48);

}

- (void)p_getNecessaryAccountInfoFromContainer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  char v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend_configuration(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_requiresDeviceToDeviceEncryption(v12, v13, v14, v15, v16);

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_227DB5444;
  v23[3] = &unk_24F08B6B8;
  v26 = v17;
  v24 = v6;
  v25 = v7;
  v18 = v7;
  v19 = v6;
  objc_msgSend_accountStatusWithCompletionHandler_(v19, v20, (uint64_t)v23, v21, v22);

}

- (void)p_getAccountInfo
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_p_getAccountInfoWithCompletion_(self, a2, 0, v2, v3);
}

- (void)p_getAccountInfoWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  _QWORD v80[4];
  id v81;
  id v82;
  uint8_t buf[4];
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_accessQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  BDSCloudKitLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_configuration(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v84 = v20;
    _os_log_impl(&dword_227D4F000, v10, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - p_getAccountInfo", buf, 0xCu);

  }
  if (v4)
  {
    objc_msgSend_pendingGetAccountInfoCompletionBlocks(self, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = _Block_copy(v4);
    objc_msgSend_addObject_(v25, v27, (uint64_t)v26, v28, v29);

  }
  if ((objc_msgSend_gettingAccountInfo(self, v21, v22, v23, v24) & 1) == 0)
  {
    objc_msgSend_setGettingAccountInfo_(self, v30, 1, v31, v32);
    BDSCloudKitSyncLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_configuration(self, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerIdentifier(v38, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v84 = v43;
      _os_log_impl(&dword_227D4F000, v33, OS_LOG_TYPE_INFO, "BCCloudKitController (%{public}@) - getAccountInfo self.gettingAccountInfo=YES", buf, 0xCu);

    }
    v44 = (void *)MEMORY[0x24BDB9030];
    objc_msgSend_configuration(self, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v49, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerWithIdentifier_(v44, v55, (uint64_t)v54, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_configuration(self, v59, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appBundleIdentifier(v63, v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSourceApplicationBundleIdentifier_(v58, v69, (uint64_t)v68, v70, v71);

    objc_msgSend_setContainer_(self, v72, (uint64_t)v58, v73, v74);
    if (v58)
    {
      objc_initWeak((id *)buf, self);
      v80[0] = MEMORY[0x24BDAC760];
      v80[1] = 3221225472;
      v80[2] = sub_227DB5884;
      v80[3] = &unk_24F08B730;
      objc_copyWeak(&v82, (id *)buf);
      v81 = v58;
      objc_msgSend_p_getNecessaryAccountInfoFromContainer_completion_(self, v78, (uint64_t)v81, (uint64_t)v80, v79);

      objc_destroyWeak(&v82);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      objc_msgSend_setGettingAccountInfo_(self, v75, 0, v76, v77);
    }

  }
}

- (void)setGettingAccountInfo:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  self->_gettingAccountInfo = a3;
  if (!a3)
  {
    objc_msgSend_accessQueue(self, a2, a3, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DB61A4;
    block[3] = &unk_24F08A3E0;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

- (void)aq_setGettingAccountInfo:(BOOL)a3 willRetryUpdateAttachment:(BOOL)a4
{
  uint64_t v4;
  _BOOL8 v5;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a4;
  objc_msgSend_accessQueue(self, a2, a3, a4, v4);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  self->_gettingAccountInfo = a3;
  if (!a3)
    MEMORY[0x24BEDD108](self, sel_aq_flushPendingGetAccountInfoCompletionBlocksWithWillRetryUpdateAttachment_, v5, v9, v10);
}

- (void)aq_flushPendingGetAccountInfoCompletionBlocksWithWillRetryUpdateAttachment:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
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
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  _BOOL4 v65;
  uint64_t v66;

  v5 = a3;
  v66 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_accessQueue(self, a2, a3, v3, v4);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend_pendingGetAccountInfoCompletionBlocks(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_copy(v12, v13, v14, v15, v16);

  objc_msgSend_pendingGetAccountInfoCompletionBlocks(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v22, v23, v24, v25, v26);

  if (objc_msgSend_count(v17, v27, v28, v29, v30))
  {
    BDSCloudKitLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_configuration(self, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerIdentifier(v36, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v61 = v41;
      v62 = 2048;
      v63 = objc_msgSend_count(v17, v42, v43, v44, v45);
      v64 = 1024;
      v65 = v5;
      _os_log_impl(&dword_227D4F000, v31, OS_LOG_TYPE_DEFAULT, "BCCloudKitController (%{public}@) - Calling %lu getAccountInfo completion block(s), willRetryUpdateAttachment: %d", buf, 0x1Cu);

    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v46 = v17;
    v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v55, (uint64_t)v59, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v56;
      do
      {
        v51 = 0;
        do
        {
          if (*(_QWORD *)v56 != v50)
            objc_enumerationMutation(v46);
          v52 = _Block_copy(*(const void **)(*((_QWORD *)&v55 + 1) + 8 * v51));
          v53 = v52;
          if (v52)
            (*((void (**)(void *, _BOOL8))v52 + 2))(v52, v5);

          ++v51;
        }
        while (v49 != v51);
        v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v54, (uint64_t)&v55, (uint64_t)v59, 16);
      }
      while (v49);
    }

  }
}

- (void)handleRemoteNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_notificationFromRemoteNotificationDictionary_(MEMORY[0x24BDB9170], a2, (uint64_t)a3, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleRemoteCKNotification_(self, v6, (uint64_t)v9, v7, v8);

}

- (void)handleRemoteCKNotification:(id)a3
{
  id v4;
  NSObject *v5;
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BDSCloudKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_container(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543362;
    v29 = v15;
    _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) handleRemoteNotification:", (uint8_t *)&v28, 0xCu);

  }
  objc_msgSend_subscriptionID(v4, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend_copy(v20, v21, v22, v23, v24);
  objc_msgSend__attachOrSignalFetchChangesTransaction_reason_(self, v26, (uint64_t)v25, (uint64_t)CFSTR("handleRemoteNotification"), v27);

}

- (void)_attachOrSignalFetchChangesTransaction:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend_privateCloudDatabaseController(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_227DB66EC;
  v26[3] = &unk_24F08B758;
  objc_copyWeak(&v29, &location);
  v14 = v6;
  v27 = v14;
  v15 = v7;
  v28 = v15;
  objc_msgSend_getAttached_(v12, v16, (uint64_t)v26, v17, v18);

  objc_msgSend_accessQueue(self, v19, v20, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = sub_227DB68D4;
  block[3] = &unk_24F089258;
  objc_copyWeak(&v25, &location);
  dispatch_async(v23, block);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (void)attachOrSignalFetchChangesTransaction:(id)a3 reason:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int isEqualToString;
  const char *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v6 = a4;
  objc_msgSend_privateCloudDatabaseController(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subscriptionID(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v23, v18, v19);

  if (isEqualToString)
    objc_msgSend__attachOrSignalFetchChangesTransaction_reason_(self, v21, (uint64_t)v23, (uint64_t)v6, v22);

}

- (void)_updateAccountCacheWithCompletionBlock:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  _QWORD *v17;
  id v18;
  id location;
  _QWORD v20[3];
  char v21;

  v4 = a3;
  BDSCloudKitSyncLog();
  v5 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG))
    sub_227E5D7C8(self, v5, v6, v7, v8);

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  objc_initWeak(&location, self);
  objc_msgSend_accessQueue(self, v9, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227DB6AE4;
  block[3] = &unk_24F08B820;
  objc_copyWeak(&v18, &location);
  v16 = v4;
  v17 = v20;
  block[4] = self;
  v14 = v4;
  dispatch_async(v13, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(v20, 8);
}

- (void)p_testAccountChanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t v40[16];

  objc_msgSend_shared(MEMORY[0x24BE0FC08], a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_verboseLoggingEnabled(v6, v7, v8, v9, v10);

  BDSCloudKitLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v13)
      sub_227E5DBAC(self, (char *)v12, v14, v15, v16);
  }
  else if (v13)
  {
    sub_227E5DC40(self, (char *)v12, v14, v15, v16);
  }

  objc_msgSend_shared(MEMORY[0x24BE0FC08], v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_verboseLoggingEnabled(v21, v22, v23, v24, v25);

  if (v26)
  {
    BDSCloudKitDevelopmentLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_227D4F000, v27, OS_LOG_TYPE_DEFAULT, "\"\\\"p_testAccountChanged CloudkitLogging Enabled!\\\"\", v40, 2u);
    }

  }
  BDSCloudKitLog();
  v28 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
    sub_227E5DB18(self, v28, v29, v30, v31);

  objc_msgSend_coalescedChangeAttachment(self, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalWithCompletion_(v36, v37, (uint64_t)&unk_24F08B840, v38, v39);

}

- (void)p_accountChanged:(id)a3
{
  char *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = (char *)a3;
  BDSCloudKitSyncLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_227E5DCD4(self, v4, (uint64_t)v5, v6, v7);

  objc_msgSend_coalescedChangeAttachment(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalWithCompletion_(v12, v13, (uint64_t)&unk_24F08B860, v14, v15);

}

- (void)p_accountReallyChangedWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t v41;
  const __CFString *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BDSCloudKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_configuration(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentUserIDName(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v15;
    v45 = 2112;
    v46 = v20;
    v47 = 2048;
    v48 = objc_msgSend_currentStatus(self, v21, v22, v23, v24);
    _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_DEFAULT, "p_accountChanged (%{public}@) account=%@ status=%ld", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v25 = (void *)MEMORY[0x24BDD1540];
  v41 = *MEMORY[0x24BDD0FC8];
  v42 = CFSTR("Account changed");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)&v42, (uint64_t)&v41, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v25, v28, (uint64_t)CFSTR("BDSCloudKitClientError"), 2001, (uint64_t)v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_privateCloudDatabaseController(self, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = sub_227DB7894;
  v38[3] = &unk_24F0891B8;
  objc_copyWeak(&v40, (id *)buf);
  v35 = v4;
  v39 = v35;
  objc_msgSend_detachWithError_completion_(v34, v36, (uint64_t)v29, (uint64_t)v38, v37);

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);

}

- (void)p_identityChanged:(id)a3
{
  id v4;
  NSObject *v5;
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
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BDSCloudKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_configuration(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v15;
    _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_DEFAULT, "p_identityChanged (%{public}@)", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v16, (uint64_t)CFSTR("BDSCloudKitClientError"), 2005, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateCloudDatabaseController(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_227DB7B80;
  v25[3] = &unk_24F08A5F0;
  objc_copyWeak(&v26, (id *)buf);
  v25[4] = self;
  objc_msgSend_detachWithError_completion_(v22, v23, (uint64_t)v17, (uint64_t)v25, v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

}

- (void)_reestablishSyncEngineSalt
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_shared(_TtC13BookDataStore13BDSSyncEngine, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reestablishSalt(v9, v5, v6, v7, v8);

}

- (void)_reestablishSyncEngineSaltIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_shared(_TtC13BookDataStore13BDSSyncEngine, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reestablishSaltIfNeeded(v9, v5, v6, v7, v8);

}

- (BCCloudKitTransactionManager)transactionManager
{
  return self->_transactionManager;
}

- (void)setPrivateCloudDatabaseController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setDidChangeContainer:(BOOL)a3
{
  self->_didChangeContainer = a3;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (BOOL)gettingAccountInfo
{
  return self->_gettingAccountInfo;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  self->_enableCloudSync = a3;
}

- (void)setServiceMode:(BOOL)a3
{
  self->_serviceMode = a3;
}

- (BUCoalescingCallBlock)coalescedAttachment
{
  return self->_coalescedAttachment;
}

- (void)setCoalescedAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedAttachment, a3);
}

- (BUCoalescingCallBlock)coalescedChangeAttachment
{
  return self->_coalescedChangeAttachment;
}

- (void)setCoalescedChangeAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedChangeAttachment, a3);
}

- (NSMutableArray)pendingGetAccountInfoCompletionBlocks
{
  return self->_pendingGetAccountInfoCompletionBlocks;
}

- (NSMutableArray)pendingRequestUpdateAttachmentCompletionBlocks
{
  return self->_pendingRequestUpdateAttachmentCompletionBlocks;
}

- (NSString)currentUserIDName
{
  return self->_currentUserIDName;
}

- (void)setCurrentUserIDName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(int64_t)a3
{
  self->_currentStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserIDName, 0);
  objc_storeStrong((id *)&self->_pendingRequestUpdateAttachmentCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingGetAccountInfoCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_coalescedChangeAttachment, 0);
  objc_storeStrong((id *)&self->_coalescedAttachment, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_privateCloudDatabaseController, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
}

@end
